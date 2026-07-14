# toml-parser rename input test_utils_test.mbt:2:25

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
$ run_moon_ide moon ide rename 'input' 'input_renamed' --loc 'test_utils_test.mbt:2:25'
*** Begin Patch
*** Update File: <WORKDIR>/test_utils_test.mbt
@@
 ///|
-fn parse_expect_to_fail(input : String) -> String {
+fn parse_expect_to_fail(input_renamed : String) -> String {
-  try @toml.parse(input) catch {
+  try @toml.parse(input_renamed) catch {
     e => {
       let s = e.to_string()
       // e.to_string() gives: Failure("...FAILED: actual_message")
*** End Patch

```
