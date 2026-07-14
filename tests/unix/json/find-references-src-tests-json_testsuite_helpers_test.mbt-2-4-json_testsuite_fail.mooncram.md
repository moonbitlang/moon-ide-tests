# json find-references json_testsuite_fail src/tests/json_testsuite_helpers_test.mbt:2:4

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
$ run_moon_ide moon ide find-references 'json_testsuite_fail' --loc 'src/tests/json_testsuite_helpers_test.mbt:2:4'
Found 5 references for symbol 'json_testsuite_fail':
<WORKDIR>/src/tests/json_testsuite_helpers_test.mbt:2:4-2:23:
  | ///|
2 | fn json_testsuite_fail(message : String) -> Unit raise {
  |    ^^^^^^^^^^^^^^^^^^^
  |   raise InspectError::InspectError(message)
  | }

<WORKDIR>/src/tests/json_testsuite_helpers_test.mbt:9:10-9:29:
  | ///|
  | fn expect_accept(name : String, input : String) -> Unit raise {
  |   try @json.decode(input) catch {
9 |     _ => json_testsuite_fail("expected JSONTestSuite accept: " + name)
  |          ^^^^^^^^^^^^^^^^^^^
  |   } noraise {
  |     _ => () (escaped)

<WORKDIR>/src/tests/json_testsuite_helpers_test.mbt:20:7-20:26:
   |   try @json.decode(input) catch {
   |     @lib.ParseError(_) => () (escaped)
   |     _ =>
20 |       json_testsuite_fail(
   |       ^^^^^^^^^^^^^^^^^^^
   |         "expected JSONTestSuite parser rejection, got non-parser error: " + name,
   |       )

<WORKDIR>/src/tests/json_testsuite_helpers_test.mbt:25:7-25:26:
   |       )
   |   } noraise {
   |     _ =>
25 |       json_testsuite_fail(
   |       ^^^^^^^^^^^^^^^^^^^
   |         "expected JSONTestSuite rejection, parser accepted: " + name,
   |       )

<WORKDIR>/src/tests/json_testsuite_helpers_test.mbt:36:7-36:26:
   |   try @json.decode(input) catch {
   |     @lib.ParseError(_) => () (escaped)
   |     _ =>
36 |       json_testsuite_fail(
   |       ^^^^^^^^^^^^^^^^^^^
   |         "expected JSONTestSuite accept or parser rejection, got non-parser error: " +
   |         name,

```
