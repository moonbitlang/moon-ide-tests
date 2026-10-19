import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from importlib import import_module

health = import_module("check-baseline-health")


def block(command, output, marker=""):
    return f"{marker}\n```mooncram\n$ run_moon_ide {command}\n{output}\n```\n"


class BaselineHealthTests(unittest.TestCase):
    def test_success_is_healthy(self):
        self.assertEqual(health.validate_text(block("moon ide hover 'x' --loc 'a.mbt:1:1'", "Int"), "tests/unix/core/hover.mooncram.md"), [])

    def test_unknown_nonzero_status_is_rejected(self):
        errors = health.validate_text(block("moon ide hover 'x' --loc 'a.mbt:1:1'", "No hover information found\n[1]"), "tests/unix/core/hover.mooncram.md")
        self.assertEqual(len(errors), 1)

    def test_windows_negative_exit_codes_are_rejected(self):
        for status in ("[-1]", "[-1073741819]", "[4294967295]"):
            with self.subTest(status=status):
                self.assertTrue(health.validate_text(block("moon ide hover 'x' --loc 'a.mbt:1:1'", "native failure\n" + status), "tests/windows/core/hover.mooncram.md"))
        self.assertEqual(health.validate_text(block("moon ide hover 'x' --loc 'a.mbt:1:1'", "Int\n[0]"), "tests/windows/core/hover.mooncram.md"), [])

    def test_project_loading_errors_are_rejected_even_without_status(self):
        self.assertTrue(health.validate_text(block("moon ide hover 'x' --loc 'a.mbt:1:1'", "Error: could not get package of loc a.mbt:1:1"), "tests/unix/core/hover.mooncram.md"))

    def test_exact_documented_hover_limitation_is_allowed_on_both_platforms(self):
        for platform, prefix, location in [("unix", "", "test/extends.mbt:22:37"), ("windows", "'..\\..\\..\\fixtures\\repos\\core' ", "test\\extends.mbt:22:37")]:
            text = block(f"{prefix}moon ide hover 'to_repr' --loc '{location}'", f"No hover information found for symbol 'to_repr' at {location}\n[1]", "<!-- known-ide-limitation: extension-declaration-hover -->")
            self.assertEqual(health.validate_text(text, f"tests/{platform}/core/hover.mooncram.md"), [])

    def test_marker_does_not_allow_other_commands_or_failures(self):
        marker = "<!-- known-ide-limitation: extension-declaration-hover -->"
        command = "moon ide hover 'to_repr' --loc 'test/extends.mbt:22:37'"
        expected = "No hover information found for symbol 'to_repr' at test/extends.mbt:22:37\n[1]"
        for changed_command, changed_output, path in [
            (command.replace("hover", "peek-def"), expected, "tests/unix/core/hover.mooncram.md"),
            (command.replace("to_repr", "other"), expected, "tests/unix/core/hover.mooncram.md"),
            (command, expected.replace("[1]", "[2]"), "tests/unix/core/hover.mooncram.md"),
            (command, "Error: could not get package\n[1]", "tests/unix/core/hover.mooncram.md"),
            (command, expected, "tests/unix/json/hover.mooncram.md"),
        ]:
            with self.subTest(command=changed_command, output=changed_output, path=path):
                self.assertTrue(health.validate_text(block(changed_command, changed_output, marker), path))

    def test_marker_applies_to_one_block_only(self):
        command = "moon ide hover 'to_repr' --loc 'test/extends.mbt:22:37'"
        output = "No hover information found for symbol 'to_repr' at test/extends.mbt:22:37\n[1]"
        marked = block(command, output, "<!-- known-ide-limitation: extension-declaration-hover -->")
        self.assertEqual(len(health.validate_text(marked + block(command, output), "tests/unix/core/hover.mooncram.md")), 1)

    def test_using_and_intrinsic_limitations_have_separate_exact_identities(self):
        for limitation, repo, symbol, location in [
            ("intrinsic-parameter-hover", "core", "self", "builtin/int64.mbt:26:21"),
            ("using-trait-hover", "rabbita", "Scheduler", "rabbita/internal/vdom/vdom.mbt:2:19"),
            ("using-trait-hover", "json", "Decode", "src/top.mbt:3:9"),
        ]:
            text = block(f"moon ide hover '{symbol}' --loc '{location}'", f"No hover information found for symbol '{symbol}' at {location}\n[1]", f"<!-- known-ide-limitation: {limitation} -->")
            self.assertEqual(health.validate_text(text, f"tests/unix/{repo}/hover.mooncram.md"), [])

    def test_extern_hover_requires_the_recorded_backend_and_exact_output(self):
        for marker in ("extern-function-hover", "extern-parameter-hover"):
            for repo, source, symbol, column, target in health.LIMITATIONS[marker]:
                location = f"{source}:18:{column}"
                command = f"moon ide hover '{symbol}' --loc '{location}'"
                output = f"No hover information found for symbol '{symbol}' at {location}\n[1]"
                annotation = f"<!-- known-ide-limitation: {marker} -->"
                if target:
                    self.assertTrue(health.validate_text(block(command, output, annotation), f"tests/unix/{repo}/hover.mooncram.md"))
                    command += f" --target {target}"
                self.assertEqual(health.validate_text(block(command, output, annotation), f"tests/unix/{repo}/hover.mooncram.md"), [])


if __name__ == "__main__":
    unittest.main()
