# moon-ide-tests

Regression tests for `moon ide` behavior across MoonBit core cases and selected
community projects.

The repository stores Moon Cram baselines for IDE commands such as `outline`,
`hover`, `peek-def`, `find-references`, `rename`, and `doc`. These baselines are
used in CI to catch changes in MoonBit IDE output and to provide a repeatable
fixture set for local development.

## Repository Layout

- `tests/unix/`: checked-in Mooncram baselines for Unix fixture selection.
- `tests/windows/`: checked-in Mooncram baselines for Windows fixture selection.
- `scripts/run-moon-ide.mbtx`: shared shell-free IDE executor and output normalizer.
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
moonx moonbit-community/mooncram@0.1.0 test "${baseline_paths[@]}"
```

To run one baseline while iterating:

```sh
moonx moonbit-community/mooncram@0.1.0 test tests/unix/core-project/doc.mooncram.md
```

On Windows, use PowerShell 7.4 or later to generate and select the baselines:

```powershell
.\scripts\update-windows-tests.ps1
$baselinePaths = @(Get-Content .daily-test/windows-baseline-paths.txt)
if ($baselinePaths.Count -gt 0) {
  moonx moonbit-community/mooncram@0.1.0 test @baselinePaths
}
```

Cases on both platforms run through `moonx ../../../scripts/run-moon-ide.mbtx`.
Only the IDE subcommand and its arguments are passed, for example:

```text
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'name' --loc 'src/main.mbt:10:3'
```

Mooncram runs each command in its Markdown file's directory. The script maps
`tests/<unix|windows>/<slug>` to `fixtures/repos/<slug>`; `core-project` maps to
`core_test/test_project` and `core-standalone` maps to `core_test`. Other directory
layouts are rejected. The script path stays relative to the Markdown file;
`scripts/run-moon-ide.mbtx` would be resolved inside the test directory.

The script directly starts `moon ide` in the inferred fixture directory, combines
stdout and stderr, replaces repository/toolchain paths with `<WORKDIR>`/`<MOON_HOME>`,
and returns the IDE exit code. Test cases do not invoke Bash or PowerShell.
The executor pins `moonbitlang/async@0.22.5` and `moonbitlang/x@0.5.6`, so
registry updates do not silently change its build dependencies.
Paths in cases are relative to their Markdown file, without `$TESTDIR` or shell
variable expansion. The separate directories retain platform-specific fixture
selection and snapshots.

The `find-references` and `rename` suites are generated as one
`.mooncram.md` file per test case (for example
`find-references-src-ast.mbt-2-24-pretty_print.mooncram.md`), because a
monolithic suite file exceeded the former runner's Markdown parser limits
(around 190 KB on Windows). The split layout is retained for reviewability.

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
moonx moonbit-community/mooncram@0.1.0 update "${baseline_paths[@]}"
moonx moonbit-community/mooncram@0.1.0 test "${baseline_paths[@]}"
```

On Windows, `scripts/update-windows-tests.ps1 -RefreshSnapshots` checks fixtures,
regenerates compatible baselines, and refreshes only those snapshots. If no
Windows fixture passes the check, snapshot refresh and test execution are skipped.
Snapshots are not rewritten by compatibility postprocessors.

Newly generated Mooncram files use four-backtick outer fences so expected IDE
output can safely contain Markdown examples with triple-backtick fences.
Regeneration retains the safe fence length chosen by `mooncram update` for each
existing case, including longer fences around embedded Markdown.
Mooncram 0.1.0 uses JSON strings for `(escaped)` expected lines and normalizes
CRLF automatically. Trailing empty expected lines use `"" (escaped)` so they
remain asserted. Combine escaped output and a missing final newline as
`"ready> " (escaped) (no-eol)`, keeping `(no-eol)` outside the JSON string.
`update` writes expectations directly without a confirmation
prompt; inspect its diff before committing. Keep the selected baseline paths in
the commands above: omitting paths recursively discovers Markdown in the current
directory, including fixture documentation.

## Updating Fixture Repositories

To refresh fixture submodules to the branches configured in
`fixtures/repos.yaml`:

```sh
scripts/update-submodules.sh
scripts/update-tests.sh
mapfile -t baseline_paths < .daily-test/unix-baseline-paths.txt
moonx moonbit-community/mooncram@0.1.0 update "${baseline_paths[@]}"
moonx moonbit-community/mooncram@0.1.0 test "${baseline_paths[@]}"
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

## OpenSeek IDE performance

From the repository root, run the same MoonBit script on Unix and Windows:

```sh
moonx scripts/run-ide-perf.mbtx
```

The pinned OpenSeek snapshot uses experimental core async APIs and requires
the nightly toolchain. CI installs nightly on both platforms; both installers
explicitly select `MOONBIT_INSTALL_VERSION=nightly`.

Repository preparation is handled by `scripts/perf-repos.mbtx`, separately
from `testgen`. Run it directly with `moonx scripts/perf-repos.mbtx` to clone
missing repositories and check out each configured commit. Existing checkouts
must be clean before switching revisions. New checkouts are moved into place
after checkout succeeds. Paths in `perf/repos.yaml` are relative to `perf/`, so
OpenSeek lives in `perf/repos/openseek`. Fixed suites are under
`perf/tests/windows/openseek` and `perf/tests/unix/openseek`. The runner
automatically selects the current platform.

Performance commands pass only the IDE subcommand and its arguments:

```text
$ moonx '../../../../scripts/bench-moon-ide.mbtx' outline 'agent_tool/job_output/job_output.mbt' --target native --no-check
```

The script infers `perf/repos/<repo>` from its working directory,
`perf/tests/<platform>/<repo>` or `perf/data/<platform>/candidates-<repo>`.

Each platform's fixed suite contains 85 commands covering outline, hover,
definition lookup, references and rename, with one `.mooncram.md` file per
command type. `prepare.json` records the workspace checks required by those
queries. Full workspace checks publish the IDE metadata, and OpenSeek's
nested editor workspace is prepared separately.
The preparation log and commands are saved with the measurements.
Before preparing fixtures, the runner also checks the installed standard library
with all backends. `moon ide --no-check` still performs that check internally;
preparing its cache keeps the first query from paying the cold-check cost.
The command and success flag are recorded in `result.json`, with output in
`core-prepare.log`. A failed standard-library check stops the run before sampling.
The `.mooncram.md` files contain fixed commands with output ignored and a
zero-exit expectation. The runner invokes `moonbit-community/mooncram@latest`;
the benchmark writes each timed invocation's output and status to its sample.
`workload.json` records the ordered queries and document contents, so the runner
can detect edits that were not accompanied by a manifest update and identify
missing samples without parsing Mooncram syntax itself.

To regenerate the checked-in suites from the commits and sampling limits in
`perf/repos.yaml`, point generation at each platform's directory:

```sh
moonx scripts/generate-perf-tests.mbtx --platform unix --output-dir perf/tests/unix
moonx scripts/generate-perf-tests.mbtx --platform windows --output-dir perf/tests/windows
git diff -- perf/tests
```

The generator prepares every fixture first: `perf-repos` clones missing
repositories and checks out the pinned commits, then `testgen` renders each
fixture. `--output-dir` is the platform directory, and each fixture is written
into its slug subdirectory, such as `perf/tests/unix/openseek`. Start with a
clean `perf/tests` tree so the diff shows exactly what regeneration changed.

Generate candidates separately when choosing new cases:

```sh
moonx scripts/generate-perf-tests.mbtx
```

`--platform unix|windows` selects the generation platform and defaults to the
host platform. Without `--output-dir`, candidates go to
`perf/data/<platform>/candidates-openseek`. Select commands for the fixed
workload and copy them into `perf/tests/<platform>/openseek`. These directories
have the same depth, so their relative command paths also match. Use
`--case-file` to select files, and pass `--candidates` to run against the
generated directory. Regenerate or update `workload.json` together with its
Mooncram documents; mismatches are rejected before execution.

Each invocation writes `result.json`, per-command samples, and execution logs
under `perf/data/<platform>/<run-id>`. Repositories and collected data are
Git-ignored; configuration and fixed tests are version-controlled.
Report schema version 3 records ordered `command_results`, per-document
`mooncram_results`, and the Mooncram version. Its measurement profile includes
the Mooncram version and is separate from earlier direct-execution reports.

`run-id` has the format `yyyyMMddTHHmmssfffZ-xxxxxxxx`, for example
`20261106T023045123Z-a1b2c3d4`. The timestamp is UTC with millisecond precision,
and the suffix is eight random lowercase hexadecimal characters. Each
invocation gets a fresh ID, also stored in `result.json`.

`elapsed_us` covers the subprocess invocation and output collection after
workspace preparation. The fixed commands use explicit backends and
`--no-check`, so workspace checks run outside the timed interval.
Each command gets one sample and a 60-second IDE timeout; Mooncram's per-case
timeout is 120 seconds to include startup. Mooncram ignores output but checks
exit codes; nonzero exits, timeouts and missing samples fail the run. Normalized
output is retained in each sample, and Mooncram diagnostics are in the run log.
Mooncram continues through the selected cases to collect remaining measurements.
Use successful `test` reports for comparisons. Ordinary IDE snapshot tests remain
responsible for checking output correctness.

`daily-perf.yml` runs independent `Unix-Perf` and `Windows-Perf` jobs. Both
upload their reports and logs even after a test failure.

After both jobs finish, a collection job archives normalized JSON on the
`perf-history` branch and builds the static dashboard in `perf/web/`. GitHub
Pages publication runs automatically for the default branch; manual runs on
other branches can opt in with the `publish` input. The page provides platform
and branch filters and a single chart with command tabs. Each line is a fixed
query, and each point is its mean successful duration for one exact MoonBit
toolchain version under matching measurement conditions. Sample counts, errors,
missing observations and raw workflow records remain accessible in details.
See [dashboard setup and local preview](perf/web/README.md).

## CI

The PR workflow (`.github/workflows/pr.yml`) uses the same per-platform checks
and selection as Daily Test. On Unix:

```sh
moon -C testgen test --target wasm
scripts/update-tests.sh
mapfile -t baseline_paths < .daily-test/unix-baseline-paths.txt
git add --all -- tests/unix
git diff --cached --exit-code HEAD -- tests/unix
moonx moonbit-community/mooncram@0.1.0 test "${baseline_paths[@]}"
```

Windows performs equivalent checks using `update-windows-tests.ps1` and
`.daily-test/windows-baseline-paths.txt`. A successful fixture check does not
suppress subsequent generator, snapshot, or IDE test failures.
