#!/usr/bin/env python3
"""Exercise generator filesystem behavior and the generated-baseline CI check."""

import contextlib
import json
import os
from pathlib import Path
import shlex
import shutil
import stat
import subprocess
import sys
import tempfile
import unittest


ROOT = Path(__file__).resolve().parents[1]


def run(*args, cwd=ROOT):
    return subprocess.run(
        args, cwd=cwd, capture_output=True, text=True, encoding="utf-8", errors="replace"
    )


@contextlib.contextmanager
def deny_file_reads(path):
    if os.name == "nt":
        import ctypes
        from ctypes import wintypes

        kernel = ctypes.WinDLL("kernel32", use_last_error=True)
        kernel.CreateFileW.argtypes = [
            wintypes.LPCWSTR, wintypes.DWORD, wintypes.DWORD, wintypes.LPVOID,
            wintypes.DWORD, wintypes.DWORD, wintypes.HANDLE,
        ]
        kernel.CreateFileW.restype = wintypes.HANDLE
        kernel.CloseHandle.argtypes = [wintypes.HANDLE]
        handle = kernel.CreateFileW(str(path), 0x80000000, 0, None, 3, 0, None)
        if handle == wintypes.HANDLE(-1).value:
            raise ctypes.WinError(ctypes.get_last_error())
        try:
            yield
        finally:
            kernel.CloseHandle(handle)
    else:
        if os.geteuid() == 0:
            raise unittest.SkipTest("File permissions cannot deny reads to root")
        mode = stat.S_IMODE(path.stat().st_mode)
        path.chmod(0)
        try:
            yield
        finally:
            path.chmod(mode)


class GeneratorTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix="testgen-integration-")
        self.addCleanup(self.temp.cleanup)
        self.base = Path(self.temp.name)
        self.repo = self.base / "repo"
        self.repo.mkdir()
        self.source = self.repo / "a.mbt"
        self.source.write_text("fn foo(x : Int) -> Int { x }\n", encoding="utf-8")

    def generate(self, output, platform="unix", *extra):
        return run(
            "moon", "-C", str(ROOT / "testgen"), "run", "--target", "wasm",
            "cmd/main", "--", "--repo", str(self.repo), "--output-dir", str(output),
            "--repo-slug", "example", "--test-repo", "fixtures/repos/o'ne'two",
            "--platform", platform, *extra,
        )

    def generate_ok(self, output, platform="unix"):
        result = self.generate(output, platform)
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)

    def test_empty_suites_remove_only_generator_owned_files(self):
        for platform in ("unix", "windows"):
            with self.subTest(platform=platform):
                self.source.write_text("fn foo(x : Int) -> Int { x }\n", encoding="utf-8")
                output = self.base / platform
                self.generate_ok(output, platform)
                handwritten = output / "doc.mooncram.md"
                handwritten.write_text("handwritten suite\n", encoding="utf-8")

                self.source.write_text("// no symbols\n", encoding="utf-8")
                self.generate_ok(output, platform)
                self.assertEqual(
                    sorted(p.name for p in output.iterdir()),
                    ["doc.mooncram.md", "outline.mooncram.md"],
                )
                self.source.unlink()
                self.generate_ok(output, platform)
                self.assertEqual(list(output.iterdir()), [handwritten])
                self.assertEqual(handwritten.read_text(), "handwritten suite\n")

    def test_unreadable_source_fails_before_changing_output(self):
        output = self.base / "output"
        output.mkdir()
        sentinel = output / "hover.mooncram.md"
        sentinel.write_text("previous baseline\n", encoding="utf-8")
        with deny_file_reads(self.source):
            for limit in ("0", "102400"):
                with self.subTest(max_file_size=limit):
                    result = self.generate(output, "unix", "--max-file-size", limit)
                    self.assertNotEqual(result.returncode, 0, result.stdout + result.stderr)
                    self.assertIn("failed to read", result.stdout)
                    self.assertIn("a.mbt", result.stdout)
                    self.assertEqual(sentinel.read_text(), "previous baseline\n")

    def test_preserves_snapshots_and_migrates_legacy_split_files(self):
        output = self.base / "output"
        self.generate_ok(output)
        case = next(output.glob("find-references-*.mooncram.md"))
        snapshot = case.read_text(encoding="utf-8")
        command = next(x for x in snapshot.splitlines() if x.startswith("$ run_moon_ide "))
        snapshot = snapshot.replace(command + "\n", command + "\nold output\n[1]\n")
        case.unlink()
        legacy = output / "find-references.mooncram.md"
        legacy.write_text(snapshot, encoding="utf-8")
        self.generate_ok(output)
        self.assertFalse(legacy.exists())
        self.assertEqual(case.read_text(encoding="utf-8"), snapshot)
        before = {p.name: p.read_bytes() for p in output.iterdir()}
        self.generate_ok(output)
        self.assertEqual(before, {p.name: p.read_bytes() for p in output.iterdir()})

    def quoted_outline(self, platform):
        name = "a'b'c $value;.mbt"
        self.source.rename(self.repo / name)
        output = self.base / "output"
        self.generate_ok(output, platform)
        command = next(
            line[2:] for line in (output / "outline.mooncram.md").read_text().splitlines()
            if line.startswith("$ run_moon_ide ")
        )
        return name, command

    def test_unix_quoting_round_trips_multiple_apostrophes(self):
        name, command = self.quoted_outline("unix")
        self.assertEqual(shlex.split(command), ["run_moon_ide", "moon", "ide", "outline", name])

    @unittest.skipUnless(shutil.which("powershell.exe"), "PowerShell is not installed")
    def test_windows_quoting_round_trips_multiple_apostrophes(self):
        name, command = self.quoted_outline("windows")
        script = "function run_moon_ide { $args | ConvertTo-Json -Compress }\n" + command
        result = run("powershell.exe", "-NoProfile", "-Command", script)
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertEqual(
            json.loads(result.stdout),
            ["..\\..\\..\\fixtures\\repos\\o'ne'two", "moon", "ide", "outline", name],
        )


class BaselineCheckTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix="baseline-check-integration-")
        self.addCleanup(self.temp.cleanup)
        self.repo = Path(self.temp.name)
        self.tests = self.repo / "tests"
        self.tests.mkdir()
        self.baseline = self.tests / "existing.mooncram.md"
        self.baseline.write_text("baseline\n", encoding="utf-8")
        for args in (
            ("init", "--quiet"),
            ("add", "tests"),
            ("-c", "user.name=Test", "-c", "user.email=test@example.com", "commit", "--quiet", "-m", "initial"),
        ):
            result = run("git", *args, cwd=self.repo)
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)

    def check(self, cwd=None):
        return run(sys.executable, str(ROOT / "scripts/check-generated-tests.py"), "tests", cwd=cwd or self.repo)

    def test_clean_baselines_ignore_unrelated_files(self):
        (self.repo / "unrelated.txt").write_text("untracked\n")
        self.assertEqual(self.check().returncode, 0)

    def test_line_ending_normalization_does_not_report_drift(self):
        result = run("git", "config", "core.autocrlf", "true", cwd=self.repo)
        self.assertEqual(result.returncode, 0, result.stderr)
        self.baseline.unlink()
        result = run("git", "checkout", "--", "tests", cwd=self.repo)
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(self.baseline.read_bytes(), b"baseline\r\n")
        self.baseline.write_bytes(b"baseline\n")
        self.assertEqual(self.check().returncode, 0)

    def test_detects_new_modified_deleted_and_staged_baselines(self):
        added = self.tests / "new.mooncram.md"
        added.write_text("new baseline\n")
        self.assertNotEqual(self.check().returncode, 0)
        added.unlink()
        self.baseline.write_text("changed\n")
        self.assertNotEqual(self.check().returncode, 0)
        staged = run("git", "add", "tests", cwd=self.repo)
        self.assertEqual(staged.returncode, 0, staged.stderr)
        self.assertNotEqual(self.check().returncode, 0)
        self.baseline.write_text("baseline\n", encoding="utf-8")
        restored = run("git", "add", "tests", cwd=self.repo)
        self.assertEqual(restored.returncode, 0, restored.stderr)
        self.assertEqual(self.check().returncode, 0)
        self.baseline.unlink()
        self.assertNotEqual(self.check().returncode, 0)

    def test_git_errors_fail_the_check(self):
        # The temporary directory's parent is outside any Git checkout.
        self.assertNotEqual(self.check(cwd=self.repo.parent).returncode, 0)


if __name__ == "__main__":
    unittest.main(verbosity=2)
