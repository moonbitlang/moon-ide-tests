import copy
import importlib.util
import json
import tempfile
import unittest
from pathlib import Path

spec = importlib.util.spec_from_file_location("publish", Path(__file__).with_name("publish.py"))
publish = importlib.util.module_from_spec(spec)
spec.loader.exec_module(publish)


def metadata(attempt=1):
    return {
        "id": 123, "run_attempt": attempt, "head_branch": "main", "head_sha": "a" * 40,
        "event": "schedule", "created_at": "2026-11-06T02:00:00Z",
        "repository": {"full_name": "moonbitlang/moon-ide-tests"},
    }


def report():
    argv = ["ide", "hover", "f", "--loc", "src/a.mbt:1:4", "--target", "native", "--no-check"]
    return {
        "schema_version": 2, "action": "test", "run_id": "source-run-id", "core_prepared": True,
        "started_at": "2026-11-06T02:01:00Z", "platform": "Linux test", "architecture": "x86_64",
        "moon_version": "moon test\nmoonc test", "fixtures": [{
            "slug": "openseek", "commit": "b" * 40, "status": "ok", "phase": "commands",
            "expected_samples": 1, "prepare_commands": [["check", "--target", "native"]],
            "command_results": [{"case_file": "hover.mooncram.md", "argv": ["moonx", "../scripts/bench-moon-ide.mbtx", *argv[1:]], "exit_code": 0}],
            "samples": [{"argv": argv, "elapsed_us": 1200, "status": "ok", "exit_code": 0, "error_output": None}],
        }],
    }


class HistoryTests(unittest.TestCase):
    def normalize(self, data=None):
        return publish.normalize(data or report(), "unix", publish.ci_info(metadata()), "success")

    def test_filename_changes_do_not_change_identity_or_suite(self):
        first, catalog = self.normalize()
        data = report()
        data["fixtures"][0]["command_results"][0]["case_file"] = "renamed-file.mooncram.md"
        second, other = self.normalize(data)
        self.assertEqual(catalog, other)
        self.assertEqual(first["fixtures"][0]["suite_hash"], second["fixtures"][0]["suite_hash"])

    def test_preparation_change_changes_comparability(self):
        first, catalog = self.normalize()
        data = report()
        data["fixtures"][0]["prepare_commands"] = [["check", "--target", "js"]]
        second, other = self.normalize(data)
        self.assertEqual(catalog, other)
        self.assertNotEqual(first["fixtures"][0]["suite_hash"], second["fixtures"][0]["suite_hash"])

    def test_timeouts_are_preserved_without_becoming_successful_timings(self):
        data = report()
        data["fixtures"][0]["status"] = "failed"
        data["fixtures"][0]["samples"][0].update(status="timeout", exit_code=None, elapsed_us=60000000)
        run, _ = self.normalize(data)
        self.assertEqual(run["status"], "failed")
        self.assertEqual(run["samples"][0]["status"], "timeout")
        self.assertEqual(run["counts"], {"ok": 0, "failed": 1, "missing": 0, "total": 1})

    def test_missing_sample_remains_a_gap(self):
        data = report()
        data["fixtures"][0]["samples"] = []
        run, _ = self.normalize(data)
        self.assertEqual(run["samples"][0]["elapsed_us"], None)
        self.assertEqual(run["samples"][0]["status"], "missing")
        self.assertEqual(run["status"], "failed")

    def test_bad_or_duplicate_samples_are_rejected(self):
        for value in (float("nan"), float("inf"), -1, True):
            data = report()
            data["fixtures"][0]["samples"][0]["elapsed_us"] = value
            with self.assertRaises(ValueError):
                self.normalize(data)
        data = report()
        data["fixtures"][0]["samples"] *= 2
        with self.assertRaises(ValueError):
            self.normalize(data)

    def test_legacy_measurement_profile_is_separate(self):
        data = report()
        del data["core_prepared"]
        run, _ = self.normalize(data)
        self.assertEqual(run["measurement_profile"], "legacy-cli-v0")

    def test_history_is_idempotent_and_attempts_are_distinct(self):
        run, catalog = self.normalize()
        with tempfile.TemporaryDirectory() as directory:
            first = publish.append_history(directory, [run], catalog)
            again = publish.append_history(directory, [run], catalog)
            self.assertEqual(first, again)
            second, _ = publish.normalize(report(), "unix", publish.ci_info(metadata(2)), "success")
            index = publish.append_history(directory, [second], catalog)
            self.assertEqual(len(index["runs"]), 2)
            changed = copy.deepcopy(run)
            changed["samples"][0]["elapsed_us"] = 999
            with self.assertRaises(ValueError):
                publish.append_history(directory, [changed], catalog)

    def test_missing_artifacts_and_failed_preparation_are_recorded(self):
        with tempfile.TemporaryDirectory() as directory:
            runs, _ = publish.collect(directory, metadata(), {"unix": "failure", "windows": "success"})
            self.assertEqual([r["status"] for r in runs], ["failure", "missing"])
            folder = Path(directory) / "ide-perf-unix-123-1" / "source-run"
            folder.mkdir(parents=True)
            (folder / "result.json").write_text(json.dumps({"action": "test", "error": "core check failed"}))
            runs, _ = publish.collect(directory, metadata(), {"unix": "failure", "windows": "success"})
            self.assertEqual(runs[0]["status"], "failed")
            self.assertEqual(runs[0]["error"], "core check failed")

    def test_site_copies_only_public_data(self):
        run, catalog = self.normalize()
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            history = root / "history"
            publish.append_history(history, [run], catalog)
            (history / ".git").write_text("private worktree configuration")
            web = root / "web"
            web.mkdir()
            for name in ("index.html", "styles.css", "app.js", "model.js"):
                (web / name).write_text("test")
            publish.build_site(web, history, root / "site")
            self.assertTrue((root / "site/data/index.json").exists())
            self.assertFalse((root / "site/data/.git").exists())

    def test_partial_download_preserves_the_available_platform(self):
        with tempfile.TemporaryDirectory() as directory:
            folder = Path(directory) / "ide-perf-unix-123-1" / "source-run"
            folder.mkdir(parents=True)
            (folder / "result.json").write_text(json.dumps(report()))
            runs, catalog = publish.collect(directory, metadata(), {"unix": "success", "windows": "success"}, "Download failed")
            self.assertEqual(runs[0]["status"], "ok")
            self.assertEqual(runs[1]["error"], "Download failed")
            self.assertEqual(len(catalog), 1)

    def test_invalid_report_is_recorded_without_invalid_numeric_data(self):
        with tempfile.TemporaryDirectory() as directory:
            folder = Path(directory) / "ide-perf-unix-123-1" / "source-run"
            folder.mkdir(parents=True)
            data = report()
            data["fixtures"][0]["samples"][0]["elapsed_us"] = float("nan")
            (folder / "result.json").write_text(json.dumps(data))
            runs, catalog = publish.collect(directory, metadata(), {"unix": "success", "windows": "failure"})
            self.assertEqual(runs[0]["status"], "invalid_report")
            self.assertEqual(catalog, {})
            publish.append_history(Path(directory) / "history", runs, catalog)


if __name__ == "__main__":
    unittest.main()
