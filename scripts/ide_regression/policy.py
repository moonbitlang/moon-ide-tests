"""Explicit outcome contracts and coverage gates; snapshots never approve errors."""

from collections import Counter, defaultdict
import re

DIMENSIONS = ("command", "mode", "format", "target", "platform", "scenario")
EFFECTIVE = {"pass", "expected_error"}
FAILURES = {"unexpected_error", "input_invalid", "infrastructure_error", "unstable"}


def validate_policy(policy):
    if policy.get("schema_version") != 1:
        raise ValueError("Unsupported policy schema_version")
    if set(policy) - {"schema_version", "cases", "required_cells", "deferred_cells"}:
        raise ValueError("Unknown policy field")
    for identity, override in policy.get("cases", {}).items():
        if not identity or set(override) - {"expectation", "scenario"}:
            raise ValueError(f"Invalid case override: {identity}")
        expectation = override.get("expectation", {"kind": "success"})
        kind = expectation.get("kind")
        if kind not in {"success", "error", "unsupported"}:
            raise ValueError(f"Invalid expectation kind for {identity}")
        if set(expectation) - {"kind", "reason", "exit_codes", "output_contains", "allow_invalid_input"}:
            raise ValueError(f"Unknown expectation field for {identity}")
        if kind != "success" and not expectation.get("reason", "").strip():
            raise ValueError(f"Non-positive case needs a review reason: {identity}")
        if kind == "error":
            codes, needles = expectation.get("exit_codes", []), expectation.get("output_contains", [])
            if not codes or any(type(code) is not int or code <= 0 for code in codes):
                raise ValueError(f"Negative case needs explicit nonzero exit codes: {identity}")
            if not needles or any(not isinstance(s, str) or not s for s in needles):
                raise ValueError(f"Negative case needs nonempty output assertions: {identity}")
        elif expectation.get("allow_invalid_input"):
            raise ValueError("Only deliberate negative cases may allow invalid source positions")
    for field in ("required_cells", "deferred_cells"):
        for cell in policy.get(field, []):
            if not cell.get("command") or set(cell) - set(DIMENSIONS) - {"expectation", "reason"}:
                raise ValueError(f"Invalid coverage cell: {cell}")
            if field == "deferred_cells" and not cell.get("reason"):
                raise ValueError("Deferred coverage needs a reason")
    return policy


def classify(case, observed):
    expectation = case["expectation"]
    result = {"id": case["id"], "execution_id": case["execution_id"]}
    if expectation["kind"] == "unsupported":
        result.update(status="unsupported", reason=expectation["reason"])
    elif not case["input_valid"] and not expectation.get("allow_invalid_input"):
        result.update(status="input_invalid", reason=case.get("input_reason", "invalid source position"))
    elif observed is None or observed.get("error"):
        result.update(status="infrastructure_error", reason=(observed or {}).get("error", "missing command capture"))
    else:
        result.update(observed)
        crash = re.search(r"^(?:thread ['\"].*panicked|Fatal error: exception|(?:Error: )?internal compiler error|.*thread.*has overflowed its stack)", observed["stdout"], re.M)
        if crash:
            status = "unexpected_error"
        elif expectation["kind"] == "error":
            approved = observed["exit_code"] in expectation["exit_codes"] and all(s in observed["stdout"] for s in expectation["output_contains"])
            status = "expected_error" if approved and observed["baseline_match"] else "changed" if approved else "unexpected_error"
        elif observed["exit_code"] != 0:
            status = "unexpected_error"
        else:
            status = "pass" if observed["baseline_match"] else "changed"
        result["status"] = status
    return result


def _dimensions(case):
    return {**{key: case[key] for key in DIMENSIONS}, "expectation": case["expectation"]["kind"]}


def coverage(cases, results, policy):
    outcomes = {r["id"]: r for r in results}
    cells = {}
    for case in cases:
        dimensions = _dimensions(case)
        key = tuple(dimensions.values())
        cell = cells.setdefault(key, {**dimensions, "declared": 0, "effective": 0, "outcomes": Counter()})
        cell["declared"] += 1
        state = outcomes.get(case["id"], {}).get("status", "not_run")
        cell["outcomes"][state] += 1
        if state in EFFECTIVE:
            cell["effective"] += 1
    missing = []
    for required in policy.get("required_cells", []):
        if not any(cell["effective"] and all(cell.get(k) == v for k, v in required.items() if k != "reason") for cell in cells.values()):
            missing.append(required)
    return {"cells": list(cells.values()), "missing_required": missing,
            "deferred": policy.get("deferred_cells", []),
            "totals": {"declared": len(cases), "effective": sum(c["effective"] for c in cells.values()),
                       "outcomes": dict(Counter(r["status"] for r in results))}}


def evaluate(stages, delta, coverage_report, stability_errors):
    failures, review = [], []
    for stage, results in stages.items():
        for result in results:
            state = result["status"]
            if state in FAILURES and (stage != "B" or state == "infrastructure_error"):
                failures.append({"stage": stage, "id": result.get("id"), "status": state})
            elif state == "changed" and stage != "B":
                review.append({"stage": stage, "id": result.get("id"), "status": state})
    failures.extend({"stage": "stability", "reason": reason} for reason in stability_errors)
    failures.extend({"stage": "coverage", "missing": cell} for cell in coverage_report["missing_required"])
    for kind in ("added", "retired", "changed", "ambiguous"):
        review.extend({"stage": "delta", "kind": kind, "id": identity} for identity in delta.get(kind, []))
    return {"verdict": "failed" if failures else "needs_review" if review else "clean",
            "failures": failures, "review_required": review}


def markdown_report(report):
    rows = ["# IDE regression review", "", f"Verdict: **{report['gate']['verdict']}**", "",
            "| Stage | Cases | Outcomes |", "| --- | ---: | --- |"]
    for stage, results in report["stages"].items():
        counts = Counter(r["status"] for r in results)
        rows.append(f"| {stage} | {len(results)} | {dict(counts)} |")
    rows.extend(["", "## Coverage and case changes", "",
                 f"Effective candidate cases: {report['coverage']['totals']['effective']} / {report['coverage']['totals']['declared']}",
                 f"Missing required cells: {len(report['coverage']['missing_required'])}",
                 f"Case changes: { {key: len(value) for key, value in report['delta'].items()} }",
                 f"Stability findings: {len(report['stability_errors'])}", "",
                 "See report.json for per-case outcomes, exact failures, required/deferred cells, and input identities.", "",
                 "A/C findings are preserved independently. Passing C does not approve changes or clear earlier failures.",
                 "Nonzero legacy snapshots are not automatically approved negative tests.", ""])
    return "\n".join(rows)
