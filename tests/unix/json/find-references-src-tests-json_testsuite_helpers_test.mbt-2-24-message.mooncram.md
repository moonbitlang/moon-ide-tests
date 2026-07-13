# json find-references message src/tests/json_testsuite_helpers_test.mbt:2:24

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
$ run_moon_ide moon ide find-references 'message' --loc 'src/tests/json_testsuite_helpers_test.mbt:2:24'
Found 2 references for symbol 'message':
<WORKDIR>/src/tests/json_testsuite_helpers_test.mbt:2:24-2:31:
  | ///|
2 | fn json_testsuite_fail(message : String) -> Unit raise {
  |                        ^^^^^^^
  |   raise InspectError::InspectError(message)
  | }

<WORKDIR>/src/tests/json_testsuite_helpers_test.mbt:3:36-3:43:
  | ///|
  | fn json_testsuite_fail(message : String) -> Unit raise {
3 |   raise InspectError::InspectError(message)
  |                                    ^^^^^^^
  | }
  | 

```
