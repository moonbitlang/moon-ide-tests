# IDE regression P0

P0 establishes a reviewable baseline and measurable effective coverage. It does
not claim complete IDE coverage: the existing deterministic AST sampling limits
still apply. New command families, JSON/target variants, semantic assertions and
coverage-guided sampling belong to later work.

## Run A/B/C

Requires Python 3.10+, Git, MoonBit (including Moon Cram), Bash on Unix or Windows
PowerShell 5.1 on Windows. Initialize submodules and update the registry first.
Use a new output directory for every run.

```sh
python scripts/ide-regression.py generator-test
python scripts/ide-regression.py begin --platform unix --output .daily-test/p0-unix
scripts/update-submodules.sh
python scripts/ide-regression.py finish --platform unix --output .daily-test/p0-unix
python scripts/ide-regression.py check --output .daily-test/p0-unix
```

On Windows use `--platform windows` and `.daily-test/p0-windows`. Daily restores
the exact original fixture commits recorded by Unix for Windows A, then restores
the daily branch's updated submodule pins for B/C. Both platforms must use the
same Moon/Moonc/Moonrun versions and registry content; a mismatch fails closed.

| Stage | Fixture | Commands and expected output | Purpose |
| --- | --- | --- | --- |
| A | Accepted F0 | Accepted commands and snapshots | Toolchain/IDE drift |
| B | Updated F1 | Same old commands and snapshots | Diagnose fixture evolution, including invalid positions |
| C | Updated F1 | Generate twice independently; capture candidate output; test again | Review proposed coverage/output changes and stability |

Each execution uses a temporary copy. Project `_build` and `target` caches are
absent for the first candidate execution; resolved package caches can be copied.
The warm execution reuses that candidate workspace. Toolchain global caches and
bundled core are shared. This checks project cold/warm behavior, not arbitrary
machine/environment determinism. Moon Cram remains the expectation matcher.

`begin` and `finish` preserve diagnostics and return successfully after a complete
capture even if cases fail. **Always run `check`**: exit 0 means clean, 1 means
failure/incomplete evidence, 2 means human review required. B's changed outputs
and invalid positions are diagnostic; infrastructure errors still fail. A, C,
coverage and stability gates are independent. An approved negative needs both
its explicit error contract and a matching Cram expectation.

`finish` writes candidate files only under the output directory. To put them on
an update branch for review, explicitly run:

```sh
python scripts/ide-regression.py stage --platform unix --output .daily-test/p0-unix
```

Staging verifies the candidate fingerprint and unchanged source inputs. It does
not approve correctness. Daily stages into its update branch and opens a draft
PR; failures remain visible even when there is a diff. Merge after human review
is the acceptance event. Keep prior baseline history in Git rather than growing
an indefinitely duplicated fixture archive.

## Artifacts and replay

- `accepted-manifest.json`: exact A inputs and command inventory.
- `candidate-manifest.json`: C inputs, generated cases and resolved dependencies.
- `report.json` / `report.md`: independent stage outcomes, coverage and deltas.
- `A`, `B`, `C-cold`, `C-warm`: Cram logs and per-command output/status captures.
- `candidate/tests/<platform>` and `candidate/baselines/<platform>.json`: proposed
  snapshots and compact versioned provenance. The first legacy baseline has an
  unknown creator toolchain; P0 never invents historical approval.

Input identities cover normalized fixture trees and Git pins, declared package
inputs, registry content, generator/config/policy, harness, shell/Cram/toolchain
versions, effective locale/timezone and accepted snapshot files. Text CRLF/LF
differences are normalized. Resolved package content is recorded separately so
cache creation is not confused with a source change. Replay rejects a different
resolved dependency graph after execution too.

```sh
python scripts/ide-regression.py inventory --platform unix --output artifacts/inventory.json
python scripts/ide-regression.py replay --manifest baselines/unix.json --output artifacts/replay
```

Replay requires a checkout with matching inputs; it validates them before running
and never fetches arbitrary historical sources automatically. To investigate an
intentional toolchain upgrade, add `--allow-toolchain-change`; all other input
checks still apply. Raw captured stdout and exit codes must match across cold
and warm runs, even when Cram patterns would accept both outputs.

## Coverage and identity

`testgen/coverage-policy.json` declares required supported cells and explicitly
deferred command/platform cells. Reports split command, input mode, output
format, target, platform, scenario and positive/negative expectation. A required
cell needs a passing effective case. Unsupported, invalid, unexpected-error,
missing-capture and unrun cases never fill it.

Cases have a semantic identity (repo, command arguments and normalized source
line anchor) and a separate execution identity. Moving a unique source line
preserves its identity; repeated or missing anchors require review. Deltas list
retained, relocated, added, retired, changed and ambiguous cases. This is a
conservative textual anchor, not a full AST symbol identity. An ambiguous match
cannot silently count as a verified relocation.

Per-case policy overrides are keyed by the reported ID. A deliberate negative
must declare `kind: error`, a reason, nonzero `exit_codes` and nonempty
`output_contains`. Only an intentional negative can allow an invalid position.
`kind: unsupported` also needs a reason and does not execute or count as coverage.
Legacy `[1]` snapshots remain unexpected failures until a human classifies them;
P0 deliberately does not bless the existing error inventory.

The current generator's pinned dependencies include old manifests. The wrapper
migrates only dependencies under ignored `testgen/.mooncakes` when Moon reports
that exact compatibility error; versions and project sources stay pinned.

## Validation

```sh
python -m unittest discover -s scripts/tests -v
python scripts/ide-regression.py generator-test
python testgen/integration_test.py
```

The harness tests include real Cram matching/capture with a controlled executable,
negative contracts, missing captures, invalid positions, manifest drift,
independent generation, execution instability and candidate tampering. PR CI
runs them on both platforms alongside generator and baseline checks.
