import json
import os
from pathlib import Path
import shutil
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from ide_regression.manifest import collect_cases
from ide_regression.runner import CramRunner, deinstrument, instrument, stability_diff


class RunnerTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.platform = "windows" if os.name == "nt" else "unix"
        repo = self.root / "fixtures/repos/demo"
        repo.mkdir(parents=True)
        (repo / "a.mbt").write_text("fn foo() { () }\n")
        self.file = self.root / "tests" / self.platform / "demo/hover.mooncram.md"
        self.file.parent.mkdir(parents=True)
        if self.platform == "windows":
            prefix = ""
            command = "run_moon_ide '..\\..\\..\\fixtures\\repos\\demo' moon ide hover 'foo' --loc 'a.mbt:1:4'"
        else:
            prefix = '```mooncram\n$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/demo" && pwd)"\n```\n\n```mooncram\n$ run_moon_ide() { (cd "$TEST_REPO_ROOT" && "$@"); }\n```\n\n'
            command = "run_moon_ide moon ide hover 'foo' --loc 'a.mbt:1:4'"
        self.command = command
        self.file.write_text(prefix + f"```mooncram\n$ {command}\ncaptured-value\n```\n")
        self.cases = collect_cases(self.root, self.platform)

    def test_instrumentation_round_trips_the_original_commands(self):
        original = self.file.read_text()
        modified = instrument(original, self.cases)
        self.assertIn("$ p0_capture ", modified)
        self.assertEqual(deinstrument(modified, self.cases), original)

    def test_unsupported_cases_are_not_executed_and_restore_their_expectations(self):
        original = self.file.read_text()
        self.cases[0]["expectation"] = {"kind": "unsupported", "reason": "not supported here"}
        modified = instrument(original, self.cases)
        self.assertNotIn(self.command, modified)
        self.assertIn("p0_unsupported", modified)
        self.assertEqual(deinstrument(modified, self.cases), original)

    def test_stability_checks_status_output_missing_and_extra_cases(self):
        first = [{"id": "one", "exit_code": 0, "stdout_hash": "a"}]
        self.assertEqual(stability_diff(first, first), [])
        for second in [[], first + [{"id": "two"}], [{"id": "one", "exit_code": 1, "stdout_hash": "a"}], [{"id": "one", "exit_code": 0, "stdout_hash": "b"}]]:
            self.assertTrue(stability_diff(first, second))

    def test_missing_capture_cannot_be_hidden_by_a_successful_cram_exit(self):
        with patch("ide_regression.runner.execute") as process:
            process.return_value.returncode = 0
            process.return_value.stdout = "[]"
            process.return_value.stderr = ""
            report = CramRunner(self.platform).run(self.root, self.cases, self.root / "artifacts")
        self.assertEqual(report["results"][0]["status"], "infrastructure_error")
        self.assertNotIn("p0_capture", self.file.read_text())

    def test_captures_cannot_replace_missing_or_malformed_matcher_evidence(self):
        for index, records in enumerate([[], [1], [{'location': 'foreign.md', 'result': {'kind': 'success'}}],
                                         [{'location': str(self.file), 'result': {}}],
                                         [{'location': str(self.file), 'result': {'kind': 'success'}}] * 3]):
            def fake_execute(command, **kwargs):
                captures = Path(kwargs['env']['P0_CAPTURE_DIR'])
                identity = self.cases[0]['execution_id']
                (captures / (identity + '.out')).write_text('wrong-output\n')
                (captures / (identity + '.status')).write_text('0')
                return __import__('subprocess').CompletedProcess(command, 0, json.dumps(records), '')
            with self.subTest(records=records), patch('ide_regression.runner.execute', side_effect=fake_execute):
                report = CramRunner(self.platform).run(self.root, self.cases, self.root / f'incomplete-{index}')
                self.assertIsNotNone(report['engine_error'])
                self.assertNotEqual(report['results'][0]['status'], 'pass')

    @unittest.skipUnless(shutil.which("moon-cram"), "Moon Cram is not installed")
    def test_real_cram_preserves_matching_and_captures_success_and_errors(self):
        binaries = self.root / "bin"
        binaries.mkdir()
        executable = binaries / ("moon.cmd" if os.name == "nt" else "moon")
        executable.write_text("@echo off\necho captured-value\nexit /b 0\n" if os.name == "nt" else "#!/usr/bin/env bash\nprintf 'captured-value\\n'\n")
        executable.chmod(0o755)
        environment = {"PATH": str(binaries) + os.pathsep + os.environ["PATH"]}
        original = self.file.read_bytes()
        result = CramRunner(self.platform).run(self.root, self.cases, self.root / "pass", env=environment)
        self.assertEqual(result["results"][0]["status"], "pass", result)
        self.assertEqual(result["results"][0]["exit_code"], 0)
        self.assertEqual(self.file.read_bytes(), original)
        self.file.write_text(self.file.read_text().replace("captured-value\n```", "old-value\n```"))
        updated = CramRunner(self.platform).run(self.root, collect_cases(self.root, self.platform), self.root / "cold", update=True, env=environment)
        self.assertEqual(updated["results"][0]["status"], "pass", updated)
        self.assertIn("captured-value", self.file.read_text())
        self.assertNotIn("p0_capture", self.file.read_text())
        warm = CramRunner(self.platform).run(self.root, collect_cases(self.root, self.platform), self.root / "warm", env=environment)
        self.assertEqual(stability_diff(updated["results"], warm["results"]), [])
        executable.write_text("@echo off\necho captured-value\nexit /b 1\n" if os.name == "nt" else "#!/usr/bin/env bash\nprintf 'captured-value\\n'\nexit 1\n")
        executable.chmod(0o755)
        self.file.write_text(self.file.read_text().replace("captured-value\n```", "captured-value\n[1]\n```"))
        cases = collect_cases(self.root, self.platform)
        result = CramRunner(self.platform).run(self.root, cases, self.root / "error", env=environment)
        self.assertEqual(result["results"][0]["status"], "unexpected_error", result)
        self.assertTrue(result["results"][0]["baseline_match"])


if __name__ == "__main__":
    unittest.main()
