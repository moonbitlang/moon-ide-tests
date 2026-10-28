# moon-ide-tests

Regression tests for `moon ide` behavior across MoonBit core cases and selected
community projects.

The repository stores Moon Cram baselines for IDE commands such as `outline`,
`hover`, `peek-def`, `find-references`, `rename`, `doc`, and `analyze`. These
baselines are used in CI to catch changes in MoonBit IDE output and to provide a
repeatable fixture set for local development.

## Repository Layout

- `tests/unix/`: checked-in Moon Cram markdown baselines for Unix-like shells.
- `tests/windows/`: checked-in Moon Cram markdown baselines for PowerShell.
- `core_test/test_project/`: handcrafted project fixture for core-library IDE
  cases.
- `core_test/analyze_reexport/`: isolated public re-export usage fixture for
  [issue #40](https://github.com/moonbitlang/moon-ide-tests/issues/40), exercised
  by `tests/unix/core-project/analyze-reexport.mooncram.md`.
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

Install the MoonBit toolchain, then initialize the fixtures:

```sh
git submodule update --init --recursive
moon update
```

Fixtures are used as checked out. Generation runs `moon check` in each fixture
first; incompatible fixtures are skipped without changing their manifests,
sources, or existing baselines. Check logs and the selected baseline paths are
written under `.daily-test/`, separately for Unix and Windows.

Run the generator tests and compatible baselines:

```sh
moon -C testgen test --target wasm
scripts/update-tests.sh
mapfile -t baseline_paths < .daily-test/unix-baseline-paths.txt
moon cram test --cram-compat "${baseline_paths[@]}"
```

To run one baseline while iterating:

```sh
moon cram test --cram-compat tests/unix/core-project/doc.mooncram.md
```

On Windows, use PowerShell 7.4 or later and run the generated baselines through
the repository's Moon Cram PowerShell adapter:

```powershell
.\scripts\update-windows-tests.ps1
$baselinePaths = @(Get-Content .daily-test/windows-baseline-paths.txt)
if ($baselinePaths.Count -gt 0) {
  moon cram test --cram-compat --no-keep-output-crlf --shell scripts\moon-cram-powershell.cmd @baselinePaths
}
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
scripts/update-tests.sh
mapfile -t baseline_paths < .daily-test/unix-baseline-paths.txt
moon cram update --replace --assume-yes --cram-compat "${baseline_paths[@]}"
moon cram test --cram-compat "${baseline_paths[@]}"
```

On Windows, `scripts/update-windows-tests.ps1 -RefreshSnapshots` checks fixtures,
regenerates compatible baselines, and refreshes only those snapshots. If no
Windows fixture passes the check, snapshot refresh and test execution are skipped.
Snapshots are not rewritten by compatibility postprocessors.

Generated Moon Cram files use four-backtick outer fences so expected IDE output
can safely contain Markdown examples with triple-backtick fences.

## Updating Fixture Repositories

To refresh fixture submodules to the branches configured in
`fixtures/repos.yaml`:

```sh
scripts/update-submodules.sh
scripts/update-tests.sh
mapfile -t baseline_paths < .daily-test/unix-baseline-paths.txt
moon cram update --replace --assume-yes --cram-compat "${baseline_paths[@]}"
moon cram test --cram-compat "${baseline_paths[@]}"
```

The Daily Test workflow runs this flow on a schedule against `main`. To refresh
a PR branch, choose that branch when manually running Daily Test. Its update PR
targets the selected branch. Agent review receives baseline changes since the
exact launch commit, fixture submodule revisions and diff, and execution logs.
Existing changes on the selected branch and testgen dependency updates are
excluded from the review bundle.

Submodule revisions are updated even when a fixture is skipped. Each platform
runs its own preflight against each revision before changing that fixture's tests.
Skipped fixtures retain their checked-in tests and are excluded from generation,
snapshot refresh, and cram execution. The handcrafted Unix suites (`core-project`
and `core-standalone`) continue to run.

Daily runs cram tests for selected suites and reviews changes to the snapshots.
The narrowly marked [known IDE limitations](testgen/README.mbt.md#notes) retain
their reproduction queries and exact failure output.

## CI

The PR workflow (`.github/workflows/pr.yml`) uses the same per-platform checks
and selection as Daily Test. On Unix:

```sh
moon -C testgen test --target wasm
scripts/update-tests.sh
mapfile -t baseline_paths < .daily-test/unix-baseline-paths.txt
git add --all -- tests/unix
git diff --cached --exit-code HEAD -- tests/unix
moon cram test --cram-compat "${baseline_paths[@]}"
```

Windows performs equivalent checks using `update-windows-tests.ps1` and
`.daily-test/windows-baseline-paths.txt`. A successful fixture check does not
suppress subsequent generator, snapshot, or IDE test failures.
