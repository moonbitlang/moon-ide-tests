"""Exercise the actual Windows workflow staging commands in a temporary Git repo."""
import os
from pathlib import Path
import subprocess
import tempfile
import textwrap
import unittest


@unittest.skipUnless(os.name == 'nt', 'Windows workflow uses PowerShell')
class DailyCommitTests(unittest.TestCase):
    def test_windows_index_includes_added_and_retired_candidates(self):
        with tempfile.TemporaryDirectory(ignore_cleanup_errors=True) as temp:
            root = Path(temp)
            def git(*args):
                return subprocess.run(['git', '-C', str(root), *args], check=True, capture_output=True, text=True).stdout
            git('init', '--quiet')
            git('config', 'user.name', 'test')
            git('config', 'user.email', 'test@example.invalid')
            tests = root / 'tests/windows/demo'
            tests.mkdir(parents=True)
            old = tests / 'old.mooncram.md'
            old.write_text('old\n')
            (tests / 'kept.mooncram.md').write_text('kept\n')
            (root / 'baselines').mkdir()
            (root / 'baselines/windows.json').write_text('{}\n')
            git('add', '.')
            git('commit', '--quiet', '-m', 'initial')
            old.unlink()
            (tests / 'new.mooncram.md').write_text('new\n')
            (root / 'baselines/windows.json').write_text('{"candidate":true}\n')
            workflow = (Path(__file__).resolve().parents[2] / '.github/workflows/daily.yml').read_text()
            step = workflow.split('      - name: Commit Windows daily changes\n', 1)[1].split('      - name:', 1)[0]
            stage = textwrap.dedent(step.split('        run: |\n', 1)[1]).split('git diff --cached --quiet', 1)[0]
            script = root / 'stage.ps1'
            script.write_text(stage)
            result = subprocess.run(['powershell.exe', '-NoProfile', '-File', str(script)], cwd=root,
                                    capture_output=True, text=True)
            self.assertEqual(result.returncode, 0, result.stderr)
            git('commit', '--quiet', '-m', 'candidate')
            committed = git('ls-tree', '-r', '--name-only', 'HEAD', '--', 'tests/windows').splitlines()
            self.assertEqual(committed, ['tests/windows/demo/kept.mooncram.md', 'tests/windows/demo/new.mooncram.md'])
