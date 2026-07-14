# sqlparser rename read_and_parse src/tests/tpch_test.mbt:2:4

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
$ run_moon_ide moon ide rename 'read_and_parse' 'read_and_parse_renamed' --loc 'src/tests/tpch_test.mbt:2:4'
*** Begin Patch
*** Update File: <WORKDIR>/src/tests/tpch_test.mbt
@@
 ///|
-fn read_and_parse(path : String) -> @sqlparser.Statements {
+fn read_and_parse_renamed(path : String) -> @sqlparser.Statements {
   let input = @fs.read_file_to_string(path) catch {
     e => { (escaped)
       println("Read file error: \{e.to_string()}")
@@
 
 ///|
 test "TPCH 1" {
-  let stmt = read_and_parse("src/tests/tpch/1.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/1.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 2" {
-  let stmt = read_and_parse("src/tests/tpch/2.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/2.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 3" {
-  let stmt = read_and_parse("src/tests/tpch/3.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/3.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 4" {
-  let stmt = read_and_parse("src/tests/tpch/4.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/4.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 5" {
-  let stmt = read_and_parse("src/tests/tpch/5.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/5.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 6" {
-  let stmt = read_and_parse("src/tests/tpch/6.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/6.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 7" {
-  let stmt = read_and_parse("src/tests/tpch/7.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/7.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 8" {
-  let stmt = read_and_parse("src/tests/tpch/8.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/8.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 9" {
-  let stmt = read_and_parse("src/tests/tpch/9.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/9.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 10" {
-  let stmt = read_and_parse("src/tests/tpch/10.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/10.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 11" {
-  let stmt = read_and_parse("src/tests/tpch/11.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/11.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 12" {
-  let stmt = read_and_parse("src/tests/tpch/12.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/12.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 13" {
-  let stmt = read_and_parse("src/tests/tpch/13.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/13.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 14" {
-  let stmt = read_and_parse("src/tests/tpch/14.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/14.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 15" {
-  let stmt = read_and_parse("src/tests/tpch/15.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/15.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 16" {
-  let stmt = read_and_parse("src/tests/tpch/16.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/16.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 17" {
-  let stmt = read_and_parse("src/tests/tpch/17.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/17.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 18" {
-  let stmt = read_and_parse("src/tests/tpch/18.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/18.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 19" {
-  let stmt = read_and_parse("src/tests/tpch/19.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/19.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 20" {
-  let stmt = read_and_parse("src/tests/tpch/20.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/20.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 21" {
-  let stmt = read_and_parse("src/tests/tpch/21.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/21.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 22" {
-  let stmt = read_and_parse("src/tests/tpch/22.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/22.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
*** End Patch

```
