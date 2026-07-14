# sqlparser rename input src/tests/good_test.mbt:4:9

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/sqlparser" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide rename 'input' 'input_renamed' --loc 'src/tests/good_test.mbt:4:9'
*** Begin Patch
*** Update File: <WORKDIR>/src/tests/good_test.mbt
@@
 // These tests are copied from https://github.com/hyrise/sql-parser/blob/main/test/queries/queries-good.sql
 
 ///|
-fn pass(input : String) -> Unit {
+fn pass(input_renamed : String) -> Unit {
-  (@sqlparser.parse_sql(input) catch {
+  (@sqlparser.parse_sql(input_renamed) catch {
     e => { (escaped)
       println(e)
       panic()
*** End Patch

```
