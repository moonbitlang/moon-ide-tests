"""Exercise the production MoonBit result parser, without calling a model."""

import json
import os
from pathlib import Path
import subprocess
import tempfile
import unittest


ROOT = Path(__file__).resolve().parents[2]
SCRIPT = ROOT / ".github/scripts/parse-openseek-result.mbtx"


class OpenSeekResultTests(unittest.TestCase):
    def parse(self, answer, status="completed"):
        with tempfile.TemporaryDirectory(prefix="openseek-result-test-") as directory:
            workspace = Path(directory)
            (workspace / ".daily-test").mkdir()
            (workspace / ".daily-test/openseek-review.json").write_text(
                json.dumps({"status": status, "output": {"answer": answer}}), encoding="utf-8"
            )
            output = workspace / "github-output"
            env = os.environ.copy()
            env.update(GITHUB_WORKSPACE=str(workspace), GITHUB_OUTPUT=str(output))
            result = subprocess.run(
                ["moon", "run", "--target", "wasm", str(SCRIPT)],
                cwd=ROOT, env=env, capture_output=True, timeout=180,
            )
            written = output.read_text(encoding="utf-8") if output.exists() else ""
            return result, written

    def test_supported_response_formats(self):
        clean = '{"has_problem": false, "comment_body": ""}'
        problem = json.dumps({"has_problem": True, "comment_body": 'Check `{x}` and "quoted" output.\nSecond line.'})
        for answer, expected in [
            (clean, False),
            (f"```json\n{clean}\n```", False),
            (f"Result:\n```json\r\n{clean}\r\n```\n", False),
            # The failed real run returned a prose review followed by this JSON.
            (f"I've reviewed both cram logs and the test diff.\nNothing indicates a failed test.\n\n{clean}\n", False),
            (f"Found a problem.\n{problem}\n", True),
            (f"Example: {clean}\nActual result:\n{problem}\n", True),
            (f"Example:\n```json\n{clean}\n```\nActual result:\n{problem}\n", True),
        ]:
            with self.subTest(answer=answer):
                result, output = self.parse(answer)
                self.assertEqual(result.returncode, 0, result.stderr.decode("utf-8", errors="replace"))
                self.assertIn(f"has_problem={str(expected).lower()}\n", output)
                if expected:
                    self.assertIn('Check `{x}` and "quoted" output.\nSecond line.', output)

    def test_invalid_results_fail_without_writing_outputs(self):
        for answer, status in [
            ("The tests look fine.", "completed"),
            ('Review:\n{"has_problem": false,', "completed"),
            ('Review:\n{"has_problem": "false", "comment_body": ""}', "completed"),
            ('Review:\n{"has_problem": false, "comment_body": "", "extra": 1}', "completed"),
            ('{"has_problem": true, "comment_body": "problem"}\n{"statistics": 3}', "completed"),
            ('{"broken": {"has_problem": false, "comment_body": ""}', "completed"),
            ('Review:\n{"broken": {"has_problem": false, "comment_body": ""}', "completed"),
            ('Review:\n[{"has_problem": false, "comment_body": ""}', "completed"),
            ('Example:\n```json\n{"has_problem": false, "comment_body": ""}\n```\nActual result:\n{"has_problem":', "completed"),
            ('Example:\n```json\n{"has_problem": false, "comment_body": ""}\n```\nActual result:\n```json\n{"has_problem": nope}\n```', "completed"),
            ('{"has_problem": false, "comment_body": ""}', "cancelled"),
        ]:
            with self.subTest(answer=answer, status=status):
                result, output = self.parse(answer, status)
                self.assertNotEqual(result.returncode, 0)
                self.assertEqual(output, "")


if __name__ == "__main__":
    unittest.main()
