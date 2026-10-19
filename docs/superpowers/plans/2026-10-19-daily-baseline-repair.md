# Daily baseline repair implementation plan

> **For agentic workers:** Use subagent-driven-development for the independent tasks below. Steps use checkbox syntax for tracking.

**Goal:** Repair repository-side causes of invalid IDE baselines, retain the IDE hover limitation, and refresh PR #30 from PR #29.

**Architecture:** Prepare legacy fixture manifests without changing source locations. Apply a narrow JSON syntax overlay that preserves line lengths and following symbol columns. Apply explicit fixture selection policies before sampling, attach the appropriate backend to queries, and reject unmarked failed-command snapshots. Keep review inputs pinned to the launch commit and limited to tests and execution evidence.

**Tech Stack:** MoonBit, Python standard library, Bash, Windows PowerShell 5.1, GitHub Actions.

**Spec:** User request in this chat: fix all repository-side failures; preserve the IDE reproduction as a known limitation; push to #29 and run daily to update #30; review only this run's tests.

## Global constraints

- Work on `codex/update-testgen-dependencies` in the existing dependency worktree.
- Do not commit fixture revisions or push changes to third-party repositories. The documented local JSON syntax overlay must preserve source locations.
- Do not merge either PR.
- Preserve default backends for unaffected files.
- Scope automated review to `BASE_SHA...HEAD -- tests/unix tests/windows`.

## Review focus

- Manifest migration must preserve source bytes and be idempotent.
- Backend policies must not send JS-only files to native.
- Template exclusions must precede sampling and remain explicit.
- Failed-command checks must allow only the specific documented IDE limitation.
- Windows logs must decode as UTF-8 and preserve native exit codes.

### Task 1: Prepare legacy manifests and preserve native logs

**Files:** `scripts/prepare-fixtures.py`, script regression tests, `scripts/update-tests.sh`, `scripts/update-windows-tests.ps1`, own legacy project manifests.

**Interfaces:** A checked `python scripts/prepare-fixtures.py` invocation prepares fixture configurations before generation and execution. Manifest formatting leaves `.mbt`/`.mbt.md` bytes unchanged. The explicit JSON overlay replaces obsolete escaped-space literals with equally wide valid syntax. Refresh logs are raw UTF-8.

- [x] Add failing regression tests for legacy migration, unchanged sources, repeated preparation, non-ASCII logs and exit status.
- [x] Implement preparation and integrate into both generation scripts; migrate the owned core project configuration.
- [x] Verify the regression suite and real indexmap/json/core-project queries.

### Task 2: Correct generator selection and backend policy

**Files:** `testgen/collect.mbt`, `testgen/render.mbt`, generator configuration/model and tests, explicit fixture policy.

**Interfaces:** Exclude Int32/UInt32, exclude uninstantiated Warren templates before deterministic sampling, and emit native queries for the non-JS SSR test while preserving other defaults. Retain the core extension hover case with an exact known-limitation annotation in generated tests.

- [x] Write failing tests for builtin filtering, excluded paths, backend-specific commands and the narrowly identified hover annotation.
- [x] Implement the smallest explicit policy mechanism; explain its fixture-specific choices.
- [x] Run `moon -C testgen test --target wasm` and verify real SSR default/native control queries.

### Task 3: Guard refreshed snapshots and scoped review

**Files:** `scripts/check-baseline-health.py`, script regression tests, `.github/workflows/daily.yml`, `.github/workflows/pr.yml`, daily review prompt.

**Interfaces:** Deterministic snapshot validation reports unmarked nonzero statuses and project-loading errors. Only the exact documented extension-declaration hover limitation is allowed. Both platform results reach review, and unhealthy runs fail after producing a reviewable PR.

- [x] Add failing tests for unknown failures, malformed/missing markers and the exact permitted hover failure.
- [x] Integrate checks and UTF-8 review log normalization; stage Unix new/deleted files before deciding to commit.
- [x] Verify workflow syntax and synthetic Git tests, including parent changes outside the review bundle.

### Task 4: Review, publish and rerun

- [x] Review the complete implementation with a fresh reviewer and address material findings.
- [x] Run generator/script tests, workflow checks and representative real IDE queries.
- [ ] Commit and push only source fixes to #29; dispatch daily from that branch.
- [ ] Wait for completion, verify #30 base/head and the exact scoped review artifact, and report results and remaining IDE limitations.
