# P0 implementation plan

The accepted chat plan is the specification. P0 provides frozen baseline replay,
explicit case outcomes, isolated A/B/C execution, coverage/delta reports, and
independent generation/execution stability checks. Existing sampling and IDE
command semantics remain unchanged. New feature scenarios are P1/P2.

## Tasks

1. Manifest: parse checked-in Cram commands, stable semantic identities with
   ambiguous matches requiring review, full input provenance and replay checks.
2. Outcomes and coverage: explicit policy for positive/negative/unsupported
   cases; legacy errors require review; required/deferred coverage cells and
   added/retained/relocated/retired reports.
3. Execution: instrument Cram without replacing its matcher; capture output and
   exit status per command, preserve A and B findings through candidate C.
4. Stability: independently regenerate twice, capture candidate snapshots in
   isolation, compare cold/warm execution, fail closed on missing artifacts.
5. Integration: daily A before fixture updates, B after updates with old commands,
   C in isolated candidate trees, replay CLI, CI tests and user documentation.
6. Validation and one fresh whole-branch review; fix important findings with
   regression tests and create a draft PR.

## Acceptance

- No candidate update mutates the accepted snapshots before explicit promotion.
- No baseline nonzero output becomes an approved negative test implicitly.
- No failed/changed A execution is hidden by a passing C execution.
- Required supported cells need effective cases; skipped/invalid/unknown cases
  never contribute to effective coverage.
- Matching input manifests regenerate identical files/commands; cold/warm
  candidate execution must have identical normalized output and exit status.
- Replays reject incompatible fixture/config/toolchain/generator inputs.

## Progress and decisions

- Setup: new worktree codex/testgen-p0, based on pending bugfix PR #27.
- Ruling: stack the draft on codex/testgen-bugfixes to avoid duplicating bugfixes;
  retarget after #27 merges. Cost if wrong: one rebase/PR-base update.
- Ruling: referenced superpowers helper skills/scripts are absent locally;
  keep this manual task ledger and use unittest RED/GREEN plus one fresh final
  review. Cost if wrong: bookkeeping differs, no runtime behavior change.
- Pre-flight: manifest IDs feed outcome policy, delta comparison and capture
  files; semantic identity and unique execution identity must be distinct.
- Pre-flight: Cram remains the expectation matcher; instrumentation captures
  command outcomes without interpreting its annotation syntax.

- Task 1: manifest tests RED (missing module) -> GREEN 7/7; stable identities,
  ambiguous anchors, legacy errors, Windows parsing and replay identity checks.

- Task 2: policy tests RED -> GREEN; 18/18 total tests. Explicit negatives,
  legacy failures, missing captures, independent stage/coverage/stability gates.

- Task 3: capture/runner tests RED -> GREEN 24/24, including real Cram matching,
  candidate update, cold/warm output checks and restoration of source snapshots.
- Ruling: keep accepted provenance in compact baselines/<platform>.json; full
  per-run manifests/captures are artifacts. Legacy snapshots have unknown creator
  toolchain until the first reviewed candidate. Cost: initial review flags remain
  visible rather than inventing an approval history.

- Task 4: workflow tests RED -> GREEN; 32/32 total tests. Independent generation,
  cold/warm execution, A failure retention and explicit candidate staging tested.
- Integration prerequisite: current Moon rejects cached legacy dependency
  manifests; migrate only pinned generator cache manifests and retry. Generator
  unit tests pass 21/21 with the current toolchain; no dependency versions changed.
- Task 5: replay CLI, both CI platforms, daily A-before-update/B/C isolation,
  mandatory final gate and candidate draft PR integration implemented.
- Real smoke: generator + current IDE + Cram + A/B/C + stage + frozen replay
  passed; source drift rejected. Full Windows inventory: 578 cases, 8 invalid
  positions, 108 unreviewed legacy nonzero snapshots. Full corpus A interrupted
  after slow old dependency resolution; partial captures remain diagnostic only.
- Task 5 validation complete: Python harness 38/38 (including real end-to-end
  replay), Moon generator 21/21, generator integration 9/9. Both workflow YAML
  files parse; Bash audit helper and PowerShell audit helper pass syntax checks.

- Final review: one fresh whole-branch reviewer, five Important findings, no
  Critical findings. All Important findings reproduced before the fix pass:
  Windows actual workflow staging (missing additions/deletion stat error),
  incomplete/malformed matcher evidence, A/replay source mutation, omitted
  generator dependency content, and Unix setup fixture formatting (CI RED).
- Final fixed: workflow stages additions/deletions before normalization;
  test_windows_index_includes_added_and_retired_candidates RED -> GREEN.
- Final fixed: per-document matcher evidence count/shape validation;
  test_captures_cannot_replace_missing_or_malformed_matcher_evidence RED -> GREEN.
- Final fixed: preserve A/replay input mutation as independent failure;
  test_A_source_mutation_is_preserved_even_if_C_passes and
  test_replay_source_mutation_cannot_report_clean RED -> GREEN.
- Final fixed: freeze generator dependency code, preparing cold caches before A;
  test_generator_dependency_code_is_part_of_frozen_inputs RED -> GREEN.
- Final fixed: Unix test fixture now has one setup command per Cram fence;
  existing real runner test was RED on Unix CI; rerun pending.
- Final minor (deferred): replay filters required cells by platform but displays
  deferred cells for both platforms. This affects report presentation only.
- Final Ruling: full legacy-corpus results remain unverified; Unix execution is
  checked by PR CI rather than emulated locally. Partial corpus captures are
  never reported as passing. Cost if wrong: separate full-corpus validation.
- Final Ruling: new scenarios/sampling/semantic assertions stay outside P0,
  matching the accepted scope. Cost if wrong: those coverage gaps remain for P1.
- Final Ruling: retain Cram annotation semantics and require complete matcher
  evidence rather than replacing its matcher. Cost if wrong: an upstream matcher
  defect still needs an upstream regression test/fix.
