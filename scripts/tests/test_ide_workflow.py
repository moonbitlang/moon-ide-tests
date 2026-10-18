import copy
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from ide_regression.manifest import collect_cases, digest, tree_fingerprint
from ide_regression.policy import classify
from ide_regression.workflow import RegressionRun, copy_workspace
from ide_regression.replay import replay


class FakeRunner:
    def __init__(self, fail_A=False, unstable=False):
        self.calls = 0
        self.fail_A = fail_A
        self.unstable = unstable

    def run(self, workspace, cases, output, *, update=False):
        self.calls += 1
        output = Path(output)
        output.mkdir(parents=True)
        value = "drift" if self.unstable and self.calls == 4 else "current"
        results = []
        for case in cases:
            observed = {"exit_code": 1 if self.fail_A and self.calls == 1 else 0,
                        "stdout": value, "stdout_hash": digest(value),
                        "baseline_match": update or case["expected_output"] == [value]}
            result = classify(case, observed)
            result.pop("stdout", None)
            results.append(result)
            if update:
                p = Path(workspace) / case["cram_file"]
                p.write_text(p.read_text().replace("old-value", value))
        return {"results": results, "engine_error": None}


class WorkflowTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name) / "checkout"
        self.repo = self.root / "fixtures/repos/demo"
        self.repo.mkdir(parents=True)
        self.source = self.repo / "a.mbt"
        self.source.write_text("fn foo() { () }\n")
        (self.root / "fixtures/repos.yaml").write_text("repos:\n  - slug: demo\n    path: fixtures/repos/demo\n")
        (self.root / "testgen").mkdir()
        (self.root / "testgen/main.mbt").write_text("// generator\n")
        self.file = self.root / "tests/unix/demo/hover.mooncram.md"
        self.file.parent.mkdir(parents=True)
        self.file.write_text('```mooncram\n$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/demo" && pwd)"\n$ run_moon_ide moon ide hover \'foo\' --loc \'a.mbt:1:4\'\nold-value\n```\n')
        self.output = Path(self.temp.name) / "artifacts"
        self.policy = {"schema_version": 1, "cases": {}, "required_cells": [{"command": "hover", "platform": "unix"}]}
        self.generated = []

    def capture(self, root, platform, policy, **kwargs):
        root = Path(root)
        return {"schema_version": 1, "cases": collect_cases(root, platform, policy), "policy": policy,
                "inputs": {"fixtures": {"demo": tree_fingerprint(root / "fixtures/repos/demo")},
                           "baselines": tree_fingerprint(root / "tests/unix"),
                           "generator": tree_fingerprint(root / "testgen"),
                           "config": digest(policy), "toolchain": "fixed", "registry": "fixed", "platform": platform,
                           "dependencies": "declared"}, "resolved_dependencies": {"demo": "resolved"}}

    def generate(self, workspace, platform, log):
        self.generated.append(str(workspace))
        p = Path(workspace) / "tests/unix/demo/hover.mooncram.md"
        line = next(i for i, value in enumerate((Path(workspace) / "fixtures/repos/demo/a.mbt").read_text().splitlines(), 1) if "fn foo" in value)
        p.write_text(p.read_text().replace("a.mbt:1:4", f"a.mbt:{line}:4"))
        Path(log).write_text("generation complete\n")

    def pipeline(self, **kwargs):
        return RegressionRun(self.root, "unix", self.output, self.policy,
                             runner=kwargs.get("runner", FakeRunner()),
                             generate=kwargs.get("generate", self.generate), capture=self.capture)

    def test_ABC_preserves_accepted_baselines_until_explicit_stage(self):
        pipeline = self.pipeline()
        original = self.file.read_bytes()
        pipeline.begin()
        self.source.write_text("\n\nfn foo() { () }\n")
        report = pipeline.finish()
        self.assertEqual(self.file.read_bytes(), original)
        self.assertEqual(report["stages"]["B"][0]["status"], "input_invalid")
        self.assertEqual(len(report["delta"]["relocated"]), 1)
        self.assertEqual(len(self.generated), 2)
        self.assertNotEqual(self.generated[0], self.generated[1])
        self.assertEqual(report["stability_errors"], [])
        self.assertEqual(report["gate"]["verdict"], "needs_review")
        pipeline.stage()
        self.assertIn("a.mbt:3:4", self.file.read_text())
        self.assertIn("current", self.file.read_text())
        self.assertTrue((self.root / "baselines/unix.json").exists())

    def test_successful_C_does_not_clear_A_failure(self):
        pipeline = self.pipeline(runner=FakeRunner(fail_A=True))
        pipeline.begin()
        report = pipeline.finish()
        self.assertEqual(report["stages"]["C"][0]["status"], "pass")
        self.assertEqual(report["gate"]["verdict"], "failed")

    def test_A_source_mutation_is_preserved_even_if_C_passes(self):
        class MutatingRunner(FakeRunner):
            def run(inner, workspace, cases, output, **kwargs):
                result = super().run(workspace, cases, output, **kwargs)
                if inner.calls == 1:
                    (Path(workspace) / 'fixtures/repos/demo/a.mbt').write_text('fn changed() { () }\n')
                return result
        pipeline = self.pipeline(runner=MutatingRunner())
        pipeline.begin()
        report = pipeline.finish()
        self.assertEqual(report['gate']['verdict'], 'failed')
        self.assertTrue(any(r['status'] == 'infrastructure_error' for r in report['stages']['A']))

    def test_workspace_preserves_fixture_symlinks(self):
        link = self.repo / 'README.md'
        try:
            link.symlink_to('a.mbt')
        except OSError as error:
            self.skipTest(f'Symlink creation unavailable: {error}')
        workspace = copy_workspace(self.root, Path(self.temp.name) / 'copy', 'unix')
        copied = workspace / 'fixtures/repos/demo/README.md'
        self.assertTrue(copied.is_symlink())
        self.assertEqual(tree_fingerprint(self.repo), tree_fingerprint(copied.parent))

    def test_replay_source_mutation_cannot_report_clean(self):
        saved = self.capture(self.root, 'unix', self.policy)
        def mutate(workspace, cases, output):
            (Path(workspace) / 'fixtures/repos/demo/a.mbt').write_text('fn changed() { () }\n')
            return {'results': [classify(c, {'exit_code': 0, 'stdout': 'old-value',
                                            'stdout_hash': digest('old-value'), 'baseline_match': True}) for c in cases]}
        with patch('ide_regression.replay.capture_manifest', side_effect=self.capture), \
             patch('ide_regression.replay.CramRunner') as runner:
            runner.return_value.run.side_effect = mutate
            report = replay(self.root, saved, self.output)
        self.assertEqual(report['gate']['verdict'], 'failed')
        self.assertTrue(any('fixtures' in s for s in report['stability_errors']))

    def test_generation_drift_and_execution_drift_fail_independently(self):
        def drifting_generator(workspace, platform, log):
            self.generate(workspace, platform, log)
            if len(self.generated) == 2:
                (Path(workspace) / "tests/unix/demo/extra.mooncram.md").write_text("extra\n")
        pipeline = self.pipeline(generate=drifting_generator, runner=FakeRunner(unstable=True))
        pipeline.begin()
        report = pipeline.finish()
        self.assertTrue(any("generation" in x for x in report["stability_errors"]))
        self.assertTrue(any("output" in x for x in report["stability_errors"]))
        self.assertEqual(report["gate"]["verdict"], "failed")

    def test_changed_toolchain_or_registry_between_A_and_B_is_rejected(self):
        pipeline = self.pipeline()
        pipeline.begin()
        original = pipeline.capture
        def changed(*args, **kwargs):
            result = original(*args, **kwargs)
            result["inputs"]["registry"] = "changed"
            return result
        pipeline.capture = changed
        with self.assertRaisesRegex(ValueError, "registry"):
            pipeline.finish()

    def test_staging_rejects_tampered_candidates_and_changed_source_baselines(self):
        pipeline = self.pipeline()
        pipeline.begin()
        pipeline.finish()
        candidate = self.output / "candidate/tests/unix/demo/hover.mooncram.md"
        original = candidate.read_bytes()
        candidate.write_text("tampered\n")
        with self.assertRaisesRegex(ValueError, "candidate"):
            pipeline.stage()
        candidate.write_bytes(original)
        self.file.write_text("edited accepted baseline\n")
        with self.assertRaisesRegex(ValueError, "baseline"):
            pipeline.stage()


if __name__ == "__main__":
    unittest.main()
