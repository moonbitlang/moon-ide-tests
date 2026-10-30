"""Exercise the shell-free executor through the actual Mooncram release."""

import json
import os
import re
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import unittest


ROOT = Path(__file__).resolve().parents[2]
MOONX = shutil.which("moonx")
RUNNER = ROOT / "scripts/run-moon-ide.mbtx"
TEST_ENV = {**os.environ, "PYTHONUTF8": "1", "PYTHONIOENCODING": "utf-8"}


class ExecutorTests(unittest.TestCase):
    def run_document(self, document):
        result = subprocess.run(
            [MOONX, "moonbit-community/mooncram@0.1.0", "test", str(document),
             "--color", "never"], cwd=ROOT, capture_output=True,
            encoding="utf-8", timeout=180, env=TEST_ENV,
        )
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)

    def test_standalone_peek_snapshot_marks_missing_final_newline(self):
        # Replay the committed expectation against controlled output: escaping
        # the no-eol marker as ordinary text silently changes this assertion.
        baseline = (ROOT / "tests/unix/core-standalone/peek-def.mooncram.md").read_text(
            encoding="utf-8"
        )
        block = next(
            block
            for _, block in re.findall(
                r"^(`{3,})mooncram\n(.*?)^\1[ \t]*$", baseline, re.MULTILINE | re.DOTALL
            )
            if "moon ide peek-def 'Int32::abs'" in block.splitlines()[0]
        )
        terminal_expectation = block.splitlines()[-1]
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            command = " ".join(json.dumps(str(arg)) for arg in [
                "moonx", RUNNER, root, sys.executable, "-c",
                "import sys;sys.stdout.write('    | }')",
            ])
            document = root / "committed-no-eol.md"
            document.write_text(
                "```mooncram\n$ " + command + "\n" + terminal_expectation + "\n```\n",
                encoding="utf-8",
            )
            self.run_document(document)

    def test_preserves_terminal_blank_lines_and_no_eol(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            blocks = []
            for actual, expected in [
                ("line\n\n", 'line\n"" (escaped)'),
                ("line", "line (no-eol)"),
                ("quoted\tline", '"quoted\\tline" (escaped) (no-eol)'),
                ("\n\n", '"" (escaped)\n"" (escaped)'),
            ]:
                # Python's source literal supplies newlines without asking
                # Mooncram's command parser to expand an escape sequence.
                command = " ".join(json.dumps(str(arg)) for arg in [
                    "moonx", RUNNER, root, sys.executable, "-c",
                    "import sys;sys.stdout.write(" + repr(actual) + ")",
                ])
                blocks.append("```mooncram\n$ " + command + "\n" +
                              (expected + "\n" if expected else "") + "```\n")
            document = root / "terminal-newlines.md"
            document.write_text("\n".join(blocks), encoding="utf-8")
            self.run_document(document)
            # Daily refresh must round-trip terminal empty lines and no-eol,
            # even when passing cases are normalized by the new updater.
            result = subprocess.run(
                [MOONX, "moonbit-community/mooncram@0.1.0", "update", str(document)],
                cwd=ROOT, capture_output=True, encoding="utf-8", timeout=180, env=TEST_ENV,
            )
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
            self.run_document(document)

    def test_preserves_arguments_cwd_streams_and_exit_status(self):
        # A child program is used to exercise real subprocess I/O without
        # depending on the installed compiler's changing IDE diagnostics.
        with tempfile.TemporaryDirectory(prefix="mooncram 中文 '") as temp:
            root = Path(temp)
            fixture = root / "fixture with spaces"
            fixture.mkdir()
            child = root / "child.py"
            child.write_text(
                "import os, sys\n"
                "print(os.getcwd(), flush=True)\n"
                "print(os.environ['MOON_HOME'], flush=True)\n"
                "if os.name == 'nt':\n"
                "    print(os.getcwd().lower(), flush=True)\n"
                "    print(os.environ['MOON_HOME'].lower().replace(chr(92), '/'), flush=True)\n"
                "print(sys.argv[1], flush=True)\n"
                "print('diagnostic', file=sys.stderr, flush=True)\n"
                "sys.exit(7)\n",
                encoding="utf-8",
            )
            command = " ".join(json.dumps(str(arg), ensure_ascii=False) for arg in [
                "moonx", RUNNER, fixture, sys.executable, child,
                "中文 'quote' \\ path $HOME ; literal",
            ])
            document = root / "executor.md"
            document.write_text(
                "```mooncram\n$ " + command + "\n"
                "<WORKDIR>\n<MOON_HOME>\n"
                + ("<WORKDIR>\n<MOON_HOME>\n" if sys.platform == "win32" else "") +
                "中文 'quote' \\ path $HOME ; literal\n"
                "diagnostic\n[7]\n```\n",
                encoding="utf-8",
            )
            self.run_document(document)


if __name__ == "__main__":
    unittest.main()
