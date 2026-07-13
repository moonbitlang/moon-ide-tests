# sqlparser find-references read_and_parse src\tests\tpch_test.mbt:2:4

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide find-references 'read_and_parse' --loc 'src\tests\tpch_test.mbt:2:4'
Found 23 references for symbol 'read_and_parse':
<WORKDIR>/src\tests\tpch_test.mbt:2:4-2:18:
  | ///|
2 | fn read_and_parse(path : String) -> @sqlparser.Statements {
  |    ^^^^^^^^^^^^^^
  |   let input = @fs.read_file_to_string(path) catch {
  |     e => {

<WORKDIR>/src\tests\tpch_test.mbt:23:14-23:28:
   | 
   | ///|
   | test "TPCH 1" {
23 |   let stmt = read_and_parse("src/tests/tpch/1.sql") |> @sqlparser.pretty_print
   |              ^^^^^^^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:54:14-54:28:
   | 
   | ///|
   | test "TPCH 2" {
54 |   let stmt = read_and_parse("src/tests/tpch/2.sql") |> @sqlparser.pretty_print
   |              ^^^^^^^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:107:14-107:28:
    | 
    | ///|
    | test "TPCH 3" {
107 |   let stmt = read_and_parse("src/tests/tpch/3.sql") |> @sqlparser.pretty_print
    |              ^^^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:139:14-139:28:
    | 
    | ///|
    | test "TPCH 4" {
139 |   let stmt = read_and_parse("src/tests/tpch/4.sql") |> @sqlparser.pretty_print
    |              ^^^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:170:14-170:28:
    | 
    | ///|
    | test "TPCH 5" {
170 |   let stmt = read_and_parse("src/tests/tpch/5.sql") |> @sqlparser.pretty_print
    |              ^^^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:204:14-204:28:
    | 
    | ///|
    | test "TPCH 6" {
204 |   let stmt = read_and_parse("src/tests/tpch/6.sql") |> @sqlparser.pretty_print
    |              ^^^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:223:14-223:28:
    | 
    | ///|
    | test "TPCH 7" {
223 |   let stmt = read_and_parse("src/tests/tpch/7.sql") |> @sqlparser.pretty_print
    |              ^^^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:276:14-276:28:
    | 
    | ///|
    | test "TPCH 8" {
276 |   let stmt = read_and_parse("src/tests/tpch/8.sql") |> @sqlparser.pretty_print
    |              ^^^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:323:14-323:28:
    | 
    | ///|
    | test "TPCH 9" {
323 |   let stmt = read_and_parse("src/tests/tpch/9.sql") |> @sqlparser.pretty_print
    |              ^^^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:365:14-365:28:
    | 
    | ///|
    | test "TPCH 10" {
365 |   let stmt = read_and_parse("src/tests/tpch/10.sql") |> @sqlparser.pretty_print
    |              ^^^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:406:14-406:28:
    | 
    | ///|
    | test "TPCH 11" {
406 |   let stmt = read_and_parse("src/tests/tpch/11.sql") |> @sqlparser.pretty_print
    |              ^^^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:444:14-444:28:
    | 
    | ///|
    | test "TPCH 12" {
444 |   let stmt = read_and_parse("src/tests/tpch/12.sql") |> @sqlparser.pretty_print
    |              ^^^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:480:14-480:28:
    | 
    | ///|
    | test "TPCH 13" {
480 |   let stmt = read_and_parse("src/tests/tpch/13.sql") |> @sqlparser.pretty_print
    |              ^^^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:510:14-510:28:
    | 
    | ///|
    | test "TPCH 14" {
510 |   let stmt = read_and_parse("src/tests/tpch/14.sql") |> @sqlparser.pretty_print
    |              ^^^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:532:14-532:28:
    | 
    | ///|
    | test "TPCH 15" {
532 |   let stmt = read_and_parse("src/tests/tpch/15.sql") |> @sqlparser.pretty_print
    |              ^^^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:575:14-575:28:
    | 
    | ///|
    | test "TPCH 16" {
575 |   let stmt = read_and_parse("src/tests/tpch/16.sql") |> @sqlparser.pretty_print
    |              ^^^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:615:14-615:28:
    | 
    | ///|
    | test "TPCH 17" {
615 |   let stmt = read_and_parse("src/tests/tpch/17.sql") |> @sqlparser.pretty_print
    |              ^^^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:642:14-642:28:
    | 
    | ///|
    | test "TPCH 18" {
642 |   let stmt = read_and_parse("src/tests/tpch/18.sql") |> @sqlparser.pretty_print
    |              ^^^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:685:14-685:28:
    | 
    | ///|
    | test "TPCH 19" {
685 |   let stmt = read_and_parse("src/tests/tpch/19.sql") |> @sqlparser.pretty_print
    |              ^^^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:731:14-731:28:
    | 
    | ///|
    | test "TPCH 20" {
731 |   let stmt = read_and_parse("src/tests/tpch/20.sql") |> @sqlparser.pretty_print
    |              ^^^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:778:14-778:28:
    | 
    | ///|
    | test "TPCH 21" {
778 |   let stmt = read_and_parse("src/tests/tpch/21.sql") |> @sqlparser.pretty_print
    |              ^^^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:827:14-827:28:
    | 
    | ///|
    | test "TPCH 22" {
827 |   let stmt = read_and_parse("src/tests/tpch/22.sql") |> @sqlparser.pretty_print
    |              ^^^^^^^^^^^^^^
    |   inspect(
    |     stmt,

```
