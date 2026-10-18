"""Capture IDE results while delegating expectation matching to Moon Cram."""

from collections import defaultdict
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess

from .manifest import command_blocks, write_json
from .policy import classify
from .process import execute

SCRIPTS = Path(__file__).resolve().parents[1]


def instrument(text, cases):
    lines = text.splitlines(keepends=True)
    by_line = {c["command_line"]: c for c in cases}
    for number, expression, expected in reversed(list(command_blocks(text))):
        case = by_line.get(number)
        if case is None:
            continue
        if expression != case["shell_expression"] or not re.fullmatch(r"[a-f0-9]{24}", case["execution_id"]):
            raise ValueError("Command manifest does not match snapshot")
        identity = case["execution_id"]
        if case["expectation"]["kind"] == "unsupported":
            lines[number - 1:number + len(expected)] = [f"$ p0_unsupported {identity}\n"]
        else:
            lines[number - 1] = f"$ p0_capture {identity} {expression}\n"
    return "".join(lines)


def deinstrument(text, cases):
    lines = text.splitlines(keepends=True)
    identities = {c["execution_id"]: c for c in cases}
    for number, expression, expected in reversed(list(command_blocks(text))):
        if expression.startswith("p0_capture "):
            _, identity, original = expression.split(" ", 2)
            if identity not in identities or original != identities[identity]["shell_expression"]:
                raise ValueError("Unexpected instrumented command")
            lines[number - 1] = "$ " + original + "\n"
        elif expression.startswith("p0_unsupported "):
            identity = expression.split()[1]
            case = identities[identity]
            body = ["$ " + case["shell_expression"], *case["expected_output"]]
            if case["expected_exit"]:
                body.append(f"[{case['expected_exit']}]")
            lines[number - 1:number + len(expected)] = [line + "\n" for line in body]
    return "".join(lines)


def escape_empty_parens(text):
    return re.sub(r"(?m)^(?!\$ )(.*) \(\)$", r"\1 () (escaped)", text)


def stability_diff(first, second):
    a, b = {r["id"]: r for r in first}, {r["id"]: r for r in second}
    errors = []
    for identity in sorted(a.keys() | b.keys()):
        left, right = a.get(identity), b.get(identity)
        if left is None or right is None:
            errors.append(f"case set drift: {identity}")
        elif (left.get("exit_code"), left.get("stdout_hash")) != (right.get("exit_code"), right.get("stdout_hash")):
            errors.append(f"output or exit status drift: {identity}")
    return errors


class CramRunner:
    def __init__(self, platform, *, executable=None, timeout=900):
        self.platform = platform
        self.executable = executable or shutil.which("moon-cram") or "moon-cram"
        self.timeout = timeout

    def run(self, workspace, cases, output_dir, *, update=False, env=None):
        workspace, output_dir = Path(workspace), Path(output_dir).resolve()
        output_dir.mkdir(parents=True, exist_ok=False)
        captures = output_dir / "captures"
        captures.mkdir()
        grouped = defaultdict(list)
        for case in cases:
            grouped[case["cram_file"]].append(case)
        originals = {}
        failed_ids, engine_error = set(), None
        command = [self.executable, "update" if update else "test", "--cram-compat", "--no-keep-output-crlf", "--no-color", "--timeout-seconds", str(self.timeout)]
        shell = SCRIPTS / ("moon-cram-audit-powershell.cmd" if self.platform == "windows" else "moon-cram-audit.sh")
        command += ["--shell", str(shell)]
        if update:
            command += ["--replace", "--assume-yes"]
        else:
            command += ["--renderer", "json"]
        command.append(str(workspace / "tests" / self.platform))
        try:
            for relative, members in grouped.items():
                file = workspace / relative
                originals[relative] = file.read_bytes()
                text = escape_empty_parens(file.read_text(encoding="utf-8"))
                file.write_bytes(instrument(text, members).encode("utf-8"))
            result = execute(command, cwd=workspace, env={**os.environ, **(env or {}),
                             'LANG': 'C', 'LC_ALL': 'C', 'TZ': 'GMT',
                             "P0_CAPTURE_DIR": str(captures)}, timeout=self.timeout + 30)
            (output_dir / "cram.stdout").write_text(result.stdout, encoding="utf-8")
            (output_dir / "cram.stderr").write_text(result.stderr, encoding="utf-8")
            if update:
                if result.returncode:
                    engine_error = f"Cram update failed with exit {result.returncode}"
            else:
                try:
                    records = json.loads(result.stdout)
                    if not isinstance(records, list):
                        raise ValueError("expected an array")
                    for record in records:
                        if record.get("result", {}).get("kind") == "success":
                            continue
                        expression = record.get("testcase", {}).get("shell_expression", "")
                        match = re.match(r"p0_capture ([a-f0-9]{24}) ", expression)
                        if match:
                            failed_ids.add(match[1])
                        else:
                            engine_error = "Cram reported an unassociated document/setup failure"
                    if result.returncode not in {0, 50}:
                        engine_error = f"Cram test failed with exit {result.returncode}"
                    if result.returncode and not failed_ids and not engine_error:
                        engine_error = "Cram failed without any identifiable testcase result"
                except (ValueError, KeyError, TypeError) as error:
                    engine_error = f"Invalid Cram JSON result: {error}"
        except (OSError, subprocess.TimeoutExpired, ValueError) as error:
            engine_error = str(error)
            if isinstance(error, subprocess.TimeoutExpired):
                (output_dir / 'cram.stdout').write_text(error.stdout or '', encoding='utf-8')
                (output_dir / 'cram.stderr').write_text(error.stderr or '', encoding='utf-8')
        finally:
            for relative, original in originals.items():
                file = workspace / relative
                if update and engine_error is None:
                    text = deinstrument(file.read_text(encoding="utf-8"), grouped[relative])
                    file.write_bytes(escape_empty_parens(text).encode("utf-8"))
                else:
                    file.write_bytes(original)
        results = []
        for case in cases:
            identity = case["execution_id"]
            status_file, output_file = captures / (identity + ".status"), captures / (identity + ".out")
            observed = None
            if status_file.exists() and output_file.exists():
                try:
                    raw = output_file.read_bytes()
                    observed = {"exit_code": int(status_file.read_text()),
                                "stdout": raw.decode("utf-8").replace("\r\n", "\n"),
                                "baseline_match": not engine_error and identity not in failed_ids,
                                "stdout_path": str(output_file.relative_to(output_dir)),
                                "stdout_hash": hashlib.sha256(raw.replace(b"\r\n", b"\n")).hexdigest()}
                except (OSError, ValueError) as error:
                    observed = {"error": f"Invalid capture for {identity}: {error}"}
            classified = classify(case, observed)
            classified.pop("stdout", None)
            results.append(classified)
        if engine_error:
            results.append({"id": "cram-engine", "status": "infrastructure_error", "reason": engine_error})
        report = {"results": results, "command": command, "update": update, "engine_error": engine_error}
        write_json(output_dir / "results.json", report)
        return report
