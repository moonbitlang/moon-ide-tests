from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from ide_regression.generator import run_generator


class GeneratorTests(unittest.TestCase):
    def test_migrates_only_pinned_dependency_cache_and_retries(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            dep = root / 'testgen/.mooncakes/owner/lib'
            dep.mkdir(parents=True)
            error = f"`moon.mod.json` at '{dep}' is no longer supported. Run `moon fmt` to migrate to `moon.mod`."
            with patch('ide_regression.generator.subprocess.run', side_effect=[
                    subprocess.CompletedProcess([], 1, '', error),
                    subprocess.CompletedProcess([], 0, '', ''),
                    subprocess.CompletedProcess([], 0, 'success', '')]) as run:
                result = run_generator(root, ['test', '--target', 'wasm'])
            self.assertEqual(result.stdout, 'success')
            self.assertEqual(run.call_args_list[1].args[0], ['moon', '-C', str(dep), 'fmt'])

    def test_does_not_modify_external_paths_or_retry_arbitrary_errors(self):
        with tempfile.TemporaryDirectory() as temp:
            for error in ["compiler failed", "`moon.mod.json` at '/external' is no longer supported"]:
                with patch('ide_regression.generator.subprocess.run', return_value=
                           subprocess.CompletedProcess([], 1, '', error)) as run:
                    with self.assertRaises(subprocess.CalledProcessError):
                        run_generator(Path(temp), ['test'])
                self.assertEqual(run.call_count, 1)
