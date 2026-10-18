import copy
import json
from pathlib import Path
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from ide_regression.manifest import collect_cases, compare_cases, verify_inputs, fixture_commit, capture_manifest
from ide_regression.manifest import tree_fingerprint
import subprocess
from unittest.mock import patch


def snapshot(command, output="value", status=0, platform="unix"):
    header = ''
    if platform == "unix":
        header = '$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/demo" && pwd)"\n'
    exit_line = f"\n[{status}]" if status else ""
    return f'# demo\n\n```mooncram\n{header}$ {command}\n{output}{exit_line}\n```\n'


class ManifestTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.repo = self.root / "fixtures/repos/demo"
        self.repo.mkdir(parents=True)
        self.source = self.repo / "a.mbt"
        self.source.write_text("fn foo(x : Int) -> Int { x }\n", encoding="utf-8")
        self.tests = self.root / "tests/unix/demo"
        self.tests.mkdir(parents=True)
        self.path = self.tests / "hover.mooncram.md"
        self.path.write_text(snapshot("run_moon_ide moon ide hover 'foo' --loc 'a.mbt:1:4'"))

    def cases(self):
        return collect_cases(self.root, "unix")

    def test_collects_command_expectation_and_valid_location(self):
        case, = self.cases()
        self.assertEqual(case["command"], "hover")
        self.assertEqual(case["repo_path"], "fixtures/repos/demo")
        self.assertEqual(case["expected_exit"], 0)
        self.assertEqual(case["expectation"]["kind"], "success")
        self.assertTrue(case["input_valid"])
        self.assertEqual(case["argv"][-2:], ["--loc", "a.mbt:1:4"])

    def test_line_move_keeps_semantic_id_and_reports_relocation(self):
        old = self.cases()
        self.source.write_text("\n\nfn foo(x : Int) -> Int { x }\n")
        self.path.write_text(snapshot("run_moon_ide moon ide hover 'foo' --loc 'a.mbt:3:4'"))
        new = self.cases()
        self.assertEqual(old[0]["id"], new[0]["id"])
        delta = compare_cases(old, new)
        self.assertEqual(len(delta["relocated"]), 1)
        self.assertFalse(delta["added"] or delta["retired"])

    def test_ambiguous_anchors_never_get_silently_matched(self):
        self.source.write_text("fn foo() { () }\nfn foo() { () }\n")
        self.path.write_text(
            snapshot("run_moon_ide moon ide hover 'foo' --loc 'a.mbt:1:4'")
            + snapshot("run_moon_ide moon ide hover 'foo' --loc 'a.mbt:2:4'")
        )
        cases = self.cases()
        self.assertEqual(len({c["execution_id"] for c in cases}), 2)
        self.assertTrue(all(c["identity_review"] for c in cases))
        self.assertEqual(len(compare_cases(cases, cases)["ambiguous"]), 2)

    def test_legacy_nonzero_snapshot_does_not_approve_an_error(self):
        self.path.write_text(snapshot("run_moon_ide moon ide hover 'foo' --loc 'a.mbt:1:4'", "Error", 1))
        case, = self.cases()
        self.assertEqual(case["expected_exit"], 1)
        self.assertEqual(case["expectation"]["kind"], "success")
        self.assertTrue(case["legacy_error_requires_review"])

    def test_snapshot_length_does_not_change_execution_identity(self):
        old = self.cases()
        self.path.write_text("# Extra heading\n\n" + self.path.read_text())
        self.assertEqual(old[0]["execution_id"], self.cases()[0]["execution_id"])

    def test_windows_quotes_and_embedded_markdown_do_not_truncate(self):
        windows = self.root / "tests/windows/demo"
        windows.mkdir(parents=True)
        text = snapshot("run_moon_ide '..\\..\\..\\fixtures\\repos\\demo' moon ide hover 'foo' --loc 'a.mbt:1:4'", "  ```mbt\n  sample\n  ```", platform="windows")
        (windows / "hover.mooncram.md").write_text(text)
        case, = collect_cases(self.root, "windows")
        self.assertEqual(case["expected_output"], ["  ```mbt", "  sample", "  ```"])
        self.assertEqual(case["repo_path"], "fixtures/repos/demo")

    def test_missing_file_is_invalid_input_not_a_new_positive_case(self):
        self.source.unlink()
        case, = self.cases()
        self.assertFalse(case["input_valid"])
        self.assertIn("missing", case["input_reason"])

    def test_source_columns_use_utf16_offsets(self):
        self.source.write_text('let x = "😀"; foo()\n', encoding='utf-8')
        self.path.write_text(snapshot("run_moon_ide moon ide hover 'foo' --loc 'a.mbt:1:15'"))
        self.assertTrue(self.cases()[0]['input_valid'])

    def test_builtin_fixture_does_not_inherit_outer_checkout_revision(self):
        with patch('ide_regression.manifest._git', side_effect=[str(self.root)]):
            self.assertIsNone(fixture_commit(self.repo))
        with patch('ide_regression.manifest._git', side_effect=[str(self.repo), 'abc']):
            self.assertEqual(fixture_commit(self.repo), 'abc')

    def test_generator_dependency_code_is_part_of_frozen_inputs(self):
        (self.root / 'fixtures/repos.yaml').write_text('repos:\n  - slug: demo\n    path: fixtures/repos/demo\n')
        (self.root / 'scripts').mkdir()
        dep = self.root / 'testgen/.mooncakes/owner/parser/parser.mbt'
        dep.parent.mkdir(parents=True)
        dep.write_text('// before\n')
        with patch('ide_regression.manifest._git', return_value=None), \
             patch('ide_regression.manifest.runtime_versions', return_value={}), \
             patch('ide_regression.manifest.subprocess.run', return_value=subprocess.CompletedProcess([], 0, 'moon fixed', '')), \
             patch.dict('os.environ', {'MOON_HOME': str(self.root / 'moon-home')}):
            before = capture_manifest(self.root, 'unix', {})
            dep.write_text('// after\n')
            after = capture_manifest(self.root, 'unix', {})
        self.assertIn('generator_dependencies', verify_inputs(before, after))

    def test_ignored_entry_is_not_source_when_git_checks_out_link_as_file(self):
        before = tree_fingerprint(self.repo)
        (self.repo / 'node_modules').write_text('../missing-dependencies')
        self.assertEqual(tree_fingerprint(self.repo), before)

    def test_replay_checks_every_frozen_identity_and_allows_only_explicit_tool_upgrade(self):
        accepted = {"schema_version": 1, "inputs": {"fixtures": {"demo": "abc"}, "generator": "g", "config": "c", "dependencies": "d", "registry": "r", "toolchain": "t", "platform": "unix"}}
        self.assertEqual(verify_inputs(accepted, copy.deepcopy(accepted)), [])
        for key in accepted["inputs"]:
            changed = copy.deepcopy(accepted)
            changed["inputs"][key] = "changed"
            self.assertIn(key, verify_inputs(accepted, changed))
        changed = copy.deepcopy(accepted)
        changed["inputs"]["toolchain"] = "new"
        self.assertEqual(verify_inputs(accepted, changed, allow_toolchain_change=True), [])


if __name__ == "__main__":
    unittest.main()
