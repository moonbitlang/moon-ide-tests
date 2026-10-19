"""Native logging must survive Windows PowerShell 5.1 without text conversion."""

import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import unittest


SCRIPT = Path(__file__).resolve().parents[1] / "run-logged.py"
PROBE = (
    "import os,sys; "
    "os.write(1, 'stdout 测试\\n'.encode('utf-8')); "
    "os.write(2, 'stderr café\\n'.encode('utf-8')); "
    "sys.exit(23)"
)
EXPECTED = "stdout 测试\nstderr café\n".encode("utf-8")


class RunLoggedTests(unittest.TestCase):
    def test_preserves_native_utf8_streams_and_exit_code(self):
        with tempfile.TemporaryDirectory(prefix="native-log-test-") as directory:
            log = Path(directory) / "output log.txt"
            result = subprocess.run(
                [sys.executable, str(SCRIPT), str(log), "--", sys.executable, "-c", PROBE],
                capture_output=True,
            )
            self.assertEqual(result.returncode, 23, result.stderr.decode(errors="replace"))
            self.assertEqual(log.read_bytes(), EXPECTED)
            self.assertEqual(result.stdout, b"")
            self.assertEqual(result.stderr, b"")

    @unittest.skipUnless(os.name == "nt" and shutil.which("powershell"), "Windows PowerShell 5.1 is required")
    def test_windows_powershell_51_retains_utf8_and_native_failure_status(self):
        with tempfile.TemporaryDirectory(prefix="powershell-native-log-test-") as directory:
            log = Path(directory) / "output log.txt"
            probe = Path(directory) / "probe.py"
            probe.write_text(PROBE, encoding="utf-8")
            env = os.environ.copy()
            env.update(LOG_SCRIPT=str(SCRIPT), LOG_PATH=str(log), LOG_PYTHON=sys.executable, LOG_PROBE=str(probe))
            result = subprocess.run(
                [
                    "powershell", "-NoProfile", "-NonInteractive", "-Command",
                    'if ($PSVersionTable.PSVersion.Major -ne 5) { exit 99 }; '
                    '& $env:LOG_PYTHON $env:LOG_SCRIPT $env:LOG_PATH -- $env:LOG_PYTHON $env:LOG_PROBE; '
                    'exit $LASTEXITCODE',
                ],
                env=env,
                capture_output=True,
            )
            self.assertEqual(result.returncode, 23, result.stderr.decode(errors="replace"))
            self.assertEqual(log.read_bytes(), EXPECTED)
            self.assertEqual(result.stdout, b"")
            self.assertEqual(result.stderr, b"")


@unittest.skipUnless(os.name == "nt" and shutil.which("powershell") and shutil.which("git"), "Windows PowerShell 5.1 and Git are required")
class WindowsRefreshTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.temp = tempfile.TemporaryDirectory(prefix="windows refresh test-")
        cls.directory = Path(cls.temp.name)
        cls.binary = cls.directory / "bin"
        cls.binary.mkdir()
        source = cls.directory / "NativeProbe.cs"
        source.write_text(
            r'''
using System;
using System.IO;
using System.Text;
public class NativeProbe {
  public static int Main(string[] args) {
    File.WriteAllLines(Environment.GetEnvironmentVariable("REFRESH_ARGS"), args, new UTF8Encoding(false));
    byte[] output = Encoding.UTF8.GetBytes("stdout \u6d4b\u8bd5\n");
    Console.OpenStandardOutput().Write(output, 0, output.Length);
    byte[] error = Encoding.UTF8.GetBytes("stderr caf\u00e9\n");
    Console.OpenStandardError().Write(error, 0, error.Length);
    return Int32.Parse(Environment.GetEnvironmentVariable("REFRESH_STATUS"));
  }
}
''',
            encoding="utf-8",
        )
        env = os.environ.copy()
        env.update(PROBE_SOURCE=str(source), PROBE_EXE=str(cls.binary / "moon.exe"))
        result = subprocess.run(
            ["powershell", "-NoProfile", "-NonInteractive", "-Command",
             'Add-Type -Path $env:PROBE_SOURCE -OutputAssembly $env:PROBE_EXE -OutputType ConsoleApplication'],
            env=env, capture_output=True,
        )
        if result.returncode:
            raise AssertionError(result.stderr.decode(errors="replace"))

    @classmethod
    def tearDownClass(cls):
        cls.temp.cleanup()

    def run_refresh(self, status, parent=None):
        root = (self.directory if parent is None else parent) / f"repository {status}"
        scripts = root / "scripts"
        scripts.mkdir(parents=True)
        for name in ("update-windows-tests.ps1", "prepare-fixtures.py", "run-logged.py"):
            shutil.copy2(SCRIPT.parent / name, scripts / name)
        (root / "fixtures").mkdir()
        (root / "fixtures/repos.yaml").write_text("repos:\n", encoding="utf-8")
        (root / "tests/windows").mkdir(parents=True)
        subprocess.run(["git", "init", "--quiet", str(root)], check=True, capture_output=True)
        env = os.environ.copy()
        env["PATH"] = str(self.binary) + os.pathsep + env["PATH"]
        args = root / "args.txt"
        env.update(REFRESH_ARGS=str(args), REFRESH_STATUS=str(status))
        result = subprocess.run(
            ["powershell", "-NoProfile", "-NonInteractive", "-File",
             str(scripts / "update-windows-tests.ps1"), "-RefreshSnapshots"],
            cwd=root, env=env, capture_output=True,
        )
        self.assertEqual((root / ".daily-test/windows-cram-update.log").read_bytes(), EXPECTED)
        arguments = args.read_text(encoding="utf-8").splitlines()
        self.assertEqual(len(arguments), 9)
        self.assertEqual(arguments[:7], [
            "cram", "update", "--replace", "--assume-yes", "--cram-compat",
            "--no-keep-output-crlf", "--shell",
        ])
        # Git expands Windows 8.3 aliases (e.g. RUNNER~1) in the repository root.
        # Compare canonical paths while retaining exact command/flag assertions.
        self.assertEqual(Path(arguments[7]).resolve(), (scripts / "moon-cram-powershell.cmd").resolve())
        self.assertEqual(Path(arguments[8]).resolve(), (root / "tests/windows").resolve())
        return result

    def test_successful_refresh_keeps_raw_utf8_log(self):
        result = self.run_refresh(0)
        self.assertEqual(result.returncode, 0, result.stderr.decode(errors="replace"))

    def test_failed_refresh_reports_the_native_exit_status(self):
        result = self.run_refresh(23)
        self.assertNotEqual(result.returncode, 0)
        self.assertIn(b"moon cram update exited with status 23", result.stderr)

    def test_refresh_accepts_windows_short_path_alias(self):
        import ctypes
        from ctypes import wintypes

        parent = (self.directory / "long parent directory").resolve()
        parent.mkdir()
        short_path = ctypes.WinDLL("kernel32", use_last_error=True).GetShortPathNameW
        short_path.argtypes = (wintypes.LPCWSTR, wintypes.LPWSTR, wintypes.DWORD)
        short_path.restype = wintypes.DWORD
        buffer = ctypes.create_unicode_buffer(32768)
        length = short_path(str(parent), buffer, len(buffer))
        if not length or length >= len(buffer) or buffer.value.casefold() == str(parent).casefold():
            self.skipTest("the temporary directory has no Windows short-path alias")
        alias = Path(buffer.value)
        self.assertEqual(alias.resolve(), parent)
        result = self.run_refresh(0, parent=alias)
        self.assertEqual(result.returncode, 0, result.stderr.decode(errors="replace"))


if __name__ == "__main__":
    unittest.main()
