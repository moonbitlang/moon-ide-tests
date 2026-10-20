# moon-ide-tests

Regression tests for `moon ide` behavior across MoonBit core cases and selected
community projects.

The repository stores Moon Cram baselines for IDE commands such as `outline`,
`hover`, `peek-def`, `find-references`, `rename`, and `doc`. These baselines are
used in CI to catch changes in MoonBit IDE output and to provide a repeatable
fixture set for local development.

## Repository Layout

- `tests/unix/`: checked-in Moon Cram markdown baselines for Unix-like shells.
- `tests/windows/`: checked-in Moon Cram markdown baselines for PowerShell.
- `core_test/test_project/`: handcrafted project fixture for core-library IDE
  cases.
- `fixtures/repos.yaml`: fixture repository list and scan limits.
- `fixtures/repos/`: Git submodules for community project fixtures.
- `testgen/`: MoonBit CLI that generates fixture baselines from source files.
- `scripts/update-tests.sh`: regenerates fixture baselines from
  `fixtures/repos.yaml`.
- `scripts/update-submodules.sh`: initializes and fast-forwards fixture
  submodules to their configured branches.

See `testgen/README.mbt.md` for the generator CLI options and implementation
notes.

## Setup

Install the MoonBit toolchain and Python 3, then initialize and prepare the fixtures:

```sh
git submodule update --init --recursive
moon update
python scripts/prepare-fixtures.py
```

Preparation migrates legacy fixture manifests using configuration-only copies;
it never sends fixture sources to the formatter. It also converts JSON's obsolete
escaped-space character literals to ordinary spaces, preserving line lengths and
all following symbol columns. These are local compatibility changes; fixture
gitlinks and upstream repositories are unchanged. Both generation scripts run
preparation automatically. Run it again after updating or restoring submodules.

Run the generator tests and all checked-in baselines:

```sh
moon -C testgen test --target wasm
moon cram test --cram-compat tests/unix
python scripts/check-baseline-health.py tests/unix
```

To run one baseline while iterating:

```sh
moon cram test --cram-compat tests/unix/core-project/doc.mooncram.md
```

On Windows, run the generated PowerShell baselines through the repository's
Moon Cram PowerShell adapter:

```powershell
moon cram test --cram-compat --no-keep-output-crlf --shell scripts\moon-cram-powershell.cmd tests\windows
```

The `find-references` and `rename` suites are generated as one
`.mooncram.md` file per test case (for example
`find-references-src-ast.mbt-2-24-pretty_print.mooncram.md`), because a
monolithic suite file can grow past what Moon Cram's markdown parser
handles — around 190 KB used to overflow its stack on Windows.

## Updating Baselines

Regenerate generated fixture files after changing `testgen`, fixture selection,
or fixture source locations:

```sh
scripts/update-tests.sh
git diff -- tests/unix tests/windows
```

Refresh expected Moon Cram output when the `moon ide` behavior changes:

```sh
scripts/escape-cram-empty-parens.sh tests/unix
moon cram update --replace --assume-yes --cram-compat tests/unix
scripts/escape-cram-empty-parens.sh tests/unix
moon cram test --cram-compat tests/unix
```

`escape-cram-empty-parens.sh` works around a `moon cram` round-trip bug:
`moon cram update` writes expected-output lines ending in ` ()` verbatim, but
the snapshot parser rejects them (the trailing parens parse as an annotation
with an empty rule name). The script appends the `(escaped)` annotation, which
parses and still matches the raw output. Since `moon cram update` parses the
existing snapshots before refreshing them, run the normalizer both before and
after the update. `update-windows-tests.ps1` applies the same normalization to
the Windows suite.

Generated Moon Cram files use four-backtick outer fences so expected IDE output
can safely contain Markdown examples with triple-backtick fences.

## Updating Fixture Repositories

To refresh fixture submodules to the branches configured in
`fixtures/repos.yaml`:

```sh
scripts/update-submodules.sh
scripts/update-tests.sh
scripts/escape-cram-empty-parens.sh tests/unix
moon cram update --replace --assume-yes --cram-compat tests/unix
scripts/escape-cram-empty-parens.sh tests/unix
moon cram test --cram-compat tests/unix
```

The Daily Test workflow runs this flow on a schedule. To refresh a PR branch,
choose that branch when manually running Daily Test. Its update PR targets the
selected branch; Agent review sees only tests changed since the exact launch
commit and execution logs. Existing changes on the selected branch are excluded.

Daily checks both cram results and baseline health before succeeding: refreshing
snapshots cannot turn an unexpected command failure into an accepted baseline.
The narrowly marked [known IDE limitations](testgen/README.mbt.md#notes) retain
their reproduction queries and exact failure output.

## CI

The PR workflow:

```sh
moon -C testgen test --target wasm
scripts/update-tests.sh
git add --all -- tests/unix tests/windows
git diff --cached --exit-code HEAD -- tests/unix tests/windows
python scripts/check-baseline-health.py tests/unix tests/windows
moon cram test --cram-compat tests/unix
moon cram test --cram-compat --no-keep-output-crlf --shell scripts/moon-cram-powershell.cmd tests/windows
```

This verifies that generated baselines are up to date and that all checked-in
Moon Cram tests pass.
