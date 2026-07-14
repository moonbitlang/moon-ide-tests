# json find-references input src/tests/json_testsuite_n_test.mbt:8:7

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/json" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide find-references 'input' --loc 'src/tests/json_testsuite_n_test.mbt:8:7'
Found 2 references for symbol 'input':
<WORKDIR>/src/tests/json_testsuite_n_test.mbt:8:7-8:12:
  | 
  | ///|
  | test "json_testsuite n_array_1_true_without_comma" {
8 |   let input = "[1 true]"
  |       ^^^^^
  |   expect_reject("n_array_1_true_without_comma.json", input)
  | }

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:9:54-9:59:
  | ///|
  | test "json_testsuite n_array_1_true_without_comma" {
  |   let input = "[1 true]"
9 |   expect_reject("n_array_1_true_without_comma.json", input)
  |                                                      ^^^^^
  | }
  | 

```
