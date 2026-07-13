# sqlparser rename path src/tests/tpch_test.mbt:2:19

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
$ run_moon_ide moon ide rename 'path' 'path_renamed' --loc 'src/tests/tpch_test.mbt:2:19'
*** Begin Patch
*** Update File: <WORKDIR>/src/tests/tpch_test.mbt
@@
 ///|
-fn read_and_parse(path : String) -> @sqlparser.Statements {
+fn read_and_parse(path_renamed : String) -> @sqlparser.Statements {
-  let input = @fs.read_file_to_string(path) catch {
+  let input = @fs.read_file_to_string(path_renamed) catch {
     e => { (escaped)
       println("Read file error: \{e.to_string()}")
       panic()
*** End Patch

```
