#!/usr/bin/env python3
"""Turn performance artifacts into append-only JSON history and a static site."""

import argparse
import hashlib
import json
import math
import re
import shutil
from datetime import datetime
from pathlib import Path


PLATFORMS = ("unix", "windows")
OPERATIONS = {"outline", "hover", "peek-def", "find-references", "rename"}
SAMPLE_STATUSES = {"ok", "nonzero_exit", "timeout", "process_error"}
SCHEMA = 1


def canonical(value):
    return json.dumps(value, sort_keys=True, ensure_ascii=False, separators=(",", ":"), allow_nan=False)


def digest(value):
    return hashlib.sha256(canonical(value).encode()).hexdigest()[:24]


def read_json(path):
    return json.loads(Path(path).read_text(encoding="utf-8-sig"))


def write_json(path, value):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    text = json.dumps(value, ensure_ascii=False, indent=2, allow_nan=False) + "\n"
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(text, encoding="utf-8", newline="\n")
    temporary.replace(path)


def case_info(slug, argv):
    if not re.fullmatch(r"[\w-]+", slug, re.ASCII):
        raise ValueError("invalid fixture slug")
    if not isinstance(argv, list) or not all(isinstance(a, str) for a in argv):
        raise ValueError("command arguments must be strings")
    if len(argv) < 3 or argv[0] != "ide" or argv[1] not in OPERATIONS:
        raise ValueError("unsupported IDE command")
    location = argv[argv.index("--loc") + 1] if "--loc" in argv else argv[2]
    target = argv[argv.index("--target") + 1] if "--target" in argv else "default"
    return {
        "id": digest({"fixture": slug, "argv": argv}),
        "fixture": slug,
        "operation": argv[1],
        "symbol": argv[2],
        "location": location,
        "target": target,
        "argv": argv,
    }


def ci_info(metadata):
    repository = metadata["repository"]["full_name"]
    if not re.fullmatch(r"[\w.-]+/[\w.-]+", repository, re.ASCII):
        raise ValueError("invalid repository")
    run_id, attempt = int(metadata["id"]), int(metadata.get("run_attempt", 1))
    if run_id <= 0 or attempt <= 0:
        raise ValueError("invalid workflow run identity")
    return {
        "repository": repository,
        "run_id": run_id,
        "attempt": attempt,
        "branch": metadata["head_branch"],
        "sha": metadata["head_sha"],
        "event": metadata["event"],
        "url": f"https://github.com/{repository}/actions/runs/{run_id}",
        "started_at": metadata.get("run_started_at", metadata["created_at"]),
    }


def normalize(report, platform, ci, job_result):
    if platform not in PLATFORMS:
        raise ValueError("unsupported platform")
    if not isinstance(report, dict) or report.get("action") != "test":
        raise ValueError("only test reports belong in performance history")
    started_at = report.get("started_at", ci["started_at"])
    if datetime.fromisoformat(started_at.replace("Z", "+00:00")).tzinfo is None:
        raise ValueError("report timestamp must include a timezone")
    run = {
        "schema_version": SCHEMA,
        "id": f"{ci['run_id']}-{ci['attempt']}-{platform}",
        "platform": platform,
        "ci": ci,
        "report_run_id": report.get("run_id"),
        "started_at": started_at,
        "job_result": job_result,
        "status": "failed",
        "error": report.get("error"),
        "measurement_profile": report.get("measurement_profile") or (
            "prepared-cli-v1" if report.get("core_prepared") is True else "legacy-cli-v0"
        ),
        "environment": {
            "os": report.get("platform"),
            "architecture": report.get("architecture"),
            "runner": report.get("runner", {}),
            "moon_version": report.get("moon_version", "Unknown toolchain"),
        },
        "fixtures": [],
        "samples": [],
    }
    catalog = {}
    expected = 0
    for fixture in report.get("fixtures", []):
        slug = fixture["slug"]
        commands = []
        cases = {}
        for command in fixture.get("command_results", []):
            argv = command["argv"]
            if len(argv) < 3 or argv[0] != "moonx":
                raise ValueError("unexpected command runner")
            info = case_info(slug, ["ide", *argv[2:]])
            if info["id"] in cases:
                raise ValueError("duplicate command; repeated sampling needs a separate schema")
            cases[info["id"]] = info
            commands.append(info["argv"])
        samples = {}
        for sample in fixture.get("samples", []):
            info = case_info(slug, sample["argv"])
            status, elapsed = sample["status"], sample.get("elapsed_us")
            if status not in SAMPLE_STATUSES:
                raise ValueError("unknown sample status")
            if isinstance(elapsed, bool) or not isinstance(elapsed, (int, float)) or not math.isfinite(elapsed) or elapsed < 0:
                raise ValueError("invalid elapsed_us")
            if status == "ok" and sample.get("exit_code") != 0:
                raise ValueError("successful sample must have exit code zero")
            if info["id"] in samples:
                raise ValueError("duplicate sample")
            if report.get("schema_version") == 3 and info["id"] not in cases:
                raise ValueError("unexpected sample outside workload manifest")
            cases.setdefault(info["id"], info)
            samples[info["id"]] = {
                "case_id": info["id"],
                "elapsed_us": elapsed,
                "status": status,
                "exit_code": sample.get("exit_code"),
                "error": str(sample.get("error_output") or "")[:4000] or None,
            }
        count = max(int(fixture.get("expected_samples", len(cases))), len(cases))
        expected += count
        # Execution order and preparation commands affect cache state, so both
        # participate in comparability. File names and random sample IDs do not.
        suite_hash = digest({
            "commands": commands,
            "prepare": fixture.get("prepare_commands", []),
        }) if commands and len(commands) == count else None
        run["fixtures"].append({
            "slug": slug,
            "commit": fixture.get("commit"),
            "suite_hash": suite_hash,
            "status": fixture.get("status", "failed"),
            "phase": fixture.get("phase"),
            "error": fixture.get("error"),
            "expected_samples": count,
        })
        for case_id, info in cases.items():
            catalog[case_id] = info
            run["samples"].append(samples.get(case_id, {
                "case_id": case_id, "elapsed_us": None, "status": "missing",
                "exit_code": None, "error": "No measurement was collected for this command.",
            }))
    ok = sum(s["status"] == "ok" for s in run["samples"])
    failed = sum(s["status"] not in {"ok", "missing"} for s in run["samples"])
    run["counts"] = {"ok": ok, "failed": failed, "missing": max(expected - ok - failed, 0), "total": expected}
    if job_result == "success" and run["fixtures"] and not run["error"] and all(
        f["status"] == "ok" for f in run["fixtures"]
    ) and ok == expected and expected > 0:
        run["status"] = "ok"
    return run, catalog


def missing_run(platform, ci, job_result, error):
    run, _ = normalize({"action": "test", "error": error}, platform, ci, job_result)
    run["status"] = "missing" if job_result == "success" else job_result
    if run["status"] == "success":
        run["status"] = "missing"
    return run


def collect(artifacts, metadata, job_results, collection_error=None):
    ci = ci_info(metadata)
    runs, catalog = [], {}
    for platform in PLATFORMS:
        folder = Path(artifacts) / f"ide-perf-{platform}-{ci['run_id']}-{ci['attempt']}"
        reports = sorted(folder.rglob("result.json")) if folder.is_dir() else []
        try:
            if len(reports) != 1:
                raise ValueError(collection_error or f"Expected one report artifact; found {len(reports)}. See workflow logs.")
            run, cases = normalize(read_json(reports[0]), platform, ci, job_results[platform])
            catalog.update(cases)
        except (ValueError, KeyError, TypeError, IndexError, OSError) as error:
            run = missing_run(platform, ci, job_results[platform], str(error))
            if reports:
                run["status"] = "invalid_report"
        runs.append(run)
    return runs, catalog


def append_history(history, runs, catalog, default_branch="main"):
    history = Path(history)
    index_path = history / "index.json"
    repository = runs[0]["ci"]["repository"]
    index = read_json(index_path) if index_path.exists() else {
        "schema_version": SCHEMA, "repository": repository, "default_branch": default_branch,
        "updated_at": None, "cases": {}, "runs": [],
    }
    if index["schema_version"] != SCHEMA or index["repository"] != repository:
        raise ValueError("history schema or repository does not match")
    for case_id, info in catalog.items():
        if case_id in index["cases"] and index["cases"][case_id] != info:
            raise ValueError("case ID collision")
        index["cases"][case_id] = info
    entries = {r["id"]: r for r in index["runs"]}
    for run in runs:
        ci = run["ci"]
        relative = f"runs/{ci['run_id']}/{ci['attempt']}/{run['platform']}.json"
        path = history / relative
        if path.exists() and canonical(read_json(path)) != canonical(run):
            raise ValueError(f"refusing to overwrite immutable run {run['id']}")
        write_json(path, run)
        entries[run["id"]] = {
            "id": run["id"], "path": relative, "platform": run["platform"],
            "branch": ci["branch"], "started_at": run["started_at"],
            "status": run["status"], "counts": run["counts"],
            "ci": ci, "moon_version": run["environment"]["moon_version"],
        }
    index["runs"] = sorted(entries.values(), key=lambda r: (r["started_at"], r["id"]), reverse=True)
    index["updated_at"] = index["runs"][0]["started_at"]
    index["default_branch"] = default_branch
    write_json(index_path, index)
    return index


def build_site(web, history, output):
    web, history, output = Path(web), Path(history), Path(output)
    output.mkdir(parents=True, exist_ok=True)
    for name in ("index.html", "styles.css", "app.js", "model.js"):
        shutil.copyfile(web / name, output / name)
    data = output / "data"
    data.mkdir(exist_ok=True)
    shutil.copyfile(history / "index.json", data / "index.json")
    shutil.copytree(history / "runs", data / "runs", dirs_exist_ok=True)
    (output / ".nojekyll").touch()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--artifacts", type=Path, required=True)
    parser.add_argument("--ci", type=Path, required=True)
    parser.add_argument("--history", type=Path, required=True)
    parser.add_argument("--site", type=Path)
    parser.add_argument("--default-branch", default="main")
    parser.add_argument("--unix-result", default="success")
    parser.add_argument("--windows-result", default="success")
    parser.add_argument("--collection-error")
    args = parser.parse_args()
    runs, catalog = collect(args.artifacts, read_json(args.ci), {
        "unix": args.unix_result, "windows": args.windows_result,
    }, args.collection_error)
    index = append_history(args.history, runs, catalog, args.default_branch)
    if args.site:
        build_site(Path(__file__).parent / "web", args.history, args.site)
    print(f"History: {len(index['runs'])} platform runs, {len(index['cases'])} queries")


if __name__ == "__main__":
    main()
