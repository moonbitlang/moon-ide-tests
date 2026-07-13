# toml-parser find-references input test_utils_test.mbt:2:25

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/toml-parser" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide find-references 'input' --loc 'test_utils_test.mbt:2:25'
Found 2 references for symbol 'input':
<WORKDIR>/test_utils_test.mbt:2:25-2:30:
  | ///|
2 | fn parse_expect_to_fail(input : String) -> String {
  |                         ^^^^^
  |   try @toml.parse(input) catch {
  |     e => {

<WORKDIR>/test_utils_test.mbt:3:19-3:24:
  | ///|
  | fn parse_expect_to_fail(input : String) -> String {
3 |   try @toml.parse(input) catch {
  |                   ^^^^^
  |     e => {
  |       let s = e.to_string()

```
