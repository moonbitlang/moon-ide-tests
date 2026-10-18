"""Real generator + IDE + Cram smoke test, with no registry dependencies."""
import os
from pathlib import Path
import shutil
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from ide_regression.generator import generate_cases
from ide_regression.manifest import capture_manifest, read_json
from ide_regression.replay import replay
from ide_regression.workflow import RegressionRun

ROOT = Path(__file__).resolve().parents[2]


@unittest.skipUnless(shutil.which('moon') and shutil.which('moon-cram'), 'MoonBit is not installed')
class EndToEndTests(unittest.TestCase):
    def test_real_candidate_roundtrip_and_frozen_replay(self):
        with tempfile.TemporaryDirectory(prefix='p0-e2e-') as temp:
            root = Path(temp) / 'checkout'
            root.mkdir()
            shutil.copytree(ROOT / 'scripts', root / 'scripts', ignore=shutil.ignore_patterns('__pycache__'))
            shutil.copytree(ROOT / 'testgen', root / 'testgen', ignore=shutil.ignore_patterns('_build', 'target'))
            repo = root / 'fixtures/repos/demo'
            repo.mkdir(parents=True)
            (repo / 'moon.mod').write_text('name = "p0/demo"\n')
            (repo / 'moon.pkg').write_text('')
            (repo / 'a.mbt').write_text('fn foo() -> Int { 1 }\n')
            (root / 'fixtures/repos.yaml').write_text('repos:\n  - slug: demo\n    path: fixtures/repos/demo\n    max_files: 1\n    max_per_file: 1\n')
            platform = 'windows' if os.name == 'nt' else 'unix'
            (root / 'tests' / platform).mkdir(parents=True)
            generate_cases(root, platform, Path(temp) / 'initial-generation.log')
            policy = {'schema_version': 1, 'cases': {}, 'required_cells': [{'command': 'hover', 'platform': platform}]}
            output = Path(temp) / 'run'
            run = RegressionRun(root, platform, output, policy, generate=generate_cases)
            # Empty generated expectations are intentional A drift on first run.
            run.begin()
            report = run.finish()
            self.assertEqual(report['stability_errors'], [], report)
            self.assertEqual(report['gate']['verdict'], 'needs_review', report)
            self.assertTrue(all(r['status'] == 'pass' for r in report['stages']['C']), report)
            run.stage()
            saved = read_json(root / 'baselines' / (platform + '.json'))
            replayed = replay(root, saved, Path(temp) / 'replay')
            self.assertEqual(replayed['gate']['verdict'], 'clean', replayed)
            with self.assertRaisesRegex(ValueError, 'fixtures'):
                (repo / 'a.mbt').write_text('fn foo() -> Int { 2 }\n')
                replay(root, saved, Path(temp) / 'reject')
