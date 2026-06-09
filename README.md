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

Install the MoonBit toolchain, then initialize the fixture submodules:

```sh
git submodule update --init --recursive
moon update
```

Run the generator tests and all checked-in baselines:

```sh
moon -C testgen test --target wasm
moon cram test --cram-compat tests/unix
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

The Windows suite omits `sqlparser` `find-references` and `rename` snapshots
because those two generated files overflow Moon Cram's Windows markdown parser.
The Unix suite keeps the full `sqlparser` coverage.

## Updating Baselines

Regenerate generated fixture files after changing `testgen`, fixture selection,
or fixture source locations:

```sh
scripts/update-tests.sh
git diff -- tests/unix tests/windows
```

Refresh expected Moon Cram output when the `moon ide` behavior changes:

```sh
moon cram update --replace --assume-yes --cram-compat tests/unix
moon cram test --cram-compat tests/unix
```

Generated Moon Cram files use four-backtick outer fences so expected IDE output
can safely contain Markdown examples with triple-backtick fences.

## Updating Fixture Repositories

To refresh fixture submodules to the branches configured in
`fixtures/repos.yaml`:

```sh
scripts/update-submodules.sh
scripts/update-tests.sh
moon cram update --replace --assume-yes --cram-compat tests/unix
moon cram test --cram-compat tests/unix
```

Canary CI runs this flow on a schedule and uploads the resulting fixture and
baseline diff as an artifact.

## CI

The PR workflow:

```sh
moon -C testgen test --target wasm
scripts/update-tests.sh
git diff --exit-code -- tests/unix tests/windows
moon cram test --cram-compat tests/unix
moon cram test --cram-compat --no-keep-output-crlf --shell scripts/moon-cram-powershell.cmd tests/windows
```

This verifies that generated baselines are up to date and that all checked-in
Moon Cram tests pass.
