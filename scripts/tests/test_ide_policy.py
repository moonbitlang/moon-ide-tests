from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from ide_regression.policy import classify, coverage, evaluate, validate_policy


def case(kind="success", **extra):
    return dict(id="one", execution_id="one", command="hover", mode="symbol+loc",
                format="text", target="module-default", platform="unix",
                scenario="source-location", input_valid=True, identity_review=False,
                legacy_error_requires_review=False, expectation={"kind": kind}, **extra)


class PolicyTests(unittest.TestCase):
    def test_matching_legacy_error_is_still_an_unexpected_error(self):
        c = case()
        c["legacy_error_requires_review"] = True
        result = classify(c, {"exit_code": 1, "stdout": "Error: no package", "baseline_match": True})
        self.assertEqual(result["status"], "unexpected_error")

    def test_only_explicit_error_contract_approves_negative_cases(self):
        c = case("error")
        c["expectation"].update(exit_codes=[1], output_contains=["not found"], reason="missing-symbol contract")
        self.assertEqual(classify(c, {"exit_code": 1, "stdout": "symbol not found", "baseline_match": True})["status"], "expected_error")
        self.assertEqual(classify(c, {"exit_code": 1, "stdout": "connection failed", "baseline_match": True})["status"], "unexpected_error")

    def test_invalid_location_does_not_count_as_an_engine_regression(self):
        c = case()
        c["input_valid"] = False
        self.assertEqual(classify(c, {"exit_code": 1, "stdout": "Error", "baseline_match": False})["status"], "input_invalid")

    def test_missing_capture_is_infrastructure_failure(self):
        self.assertEqual(classify(case(), None)["status"], "infrastructure_error")

    def test_changed_success_requires_review(self):
        self.assertEqual(classify(case(), {"exit_code": 0, "stdout": "new", "baseline_match": False})["status"], "changed")

    def test_unsupported_and_failures_never_fill_required_coverage(self):
        cells = [{"command": "hover", "platform": "unix"}]
        for state in ("unsupported", "input_invalid", "unexpected_error", "infrastructure_error", "changed"):
            report = coverage([case()], [{"id": "one", "status": state}], {"required_cells": cells})
            self.assertEqual(len(report["missing_required"]), 1)
        self.assertEqual(coverage([case()], [{"id": "one", "status": "pass"}], {"required_cells": cells})["missing_required"], [])

    def test_candidate_success_cannot_mask_an_A_failure(self):
        report = evaluate({"A": [{"status": "unexpected_error"}], "B": [], "C": [{"status": "pass"}]}, {}, {"missing_required": []}, [])
        self.assertEqual(report["verdict"], "failed")

    def test_B_invalid_inputs_are_diagnostic_but_infrastructure_is_not(self):
        for state, expected in [("input_invalid", "clean"), ("infrastructure_error", "failed")]:
            report = evaluate({"A": [], "B": [{"status": state}], "C": []}, {}, {"missing_required": []}, [])
            self.assertEqual(report["verdict"], expected)

    def test_stability_and_coverage_failures_are_independent_gates(self):
        self.assertEqual(evaluate({}, {}, {"missing_required": []}, ["stdout drift"])["verdict"], "failed")
        self.assertEqual(evaluate({}, {}, {"missing_required": [{"command": "hover"}]}, [])["verdict"], "failed")

    def test_retirements_and_output_changes_require_review(self):
        for change in ("retired", "changed", "ambiguous"):
            self.assertEqual(evaluate({}, {change: ["one"]}, {"missing_required": []}, [])["verdict"], "needs_review")

    def test_invalid_or_unexplained_policy_fails_closed(self):
        for override in [
            {"kind": "error"},
            {"kind": "error", "reason": "test", "exit_codes": [0], "output_contains": ["Error"]},
            {"kind": "unsupported"},
            {"kind": "succes"},
        ]:
            with self.subTest(override=override), self.assertRaises(ValueError):
                validate_policy({"schema_version": 1, "cases": {"one": {"expectation": override}}})


if __name__ == "__main__":
    unittest.main()
