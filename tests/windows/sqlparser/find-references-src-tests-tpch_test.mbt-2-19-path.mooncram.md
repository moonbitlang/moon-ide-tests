# sqlparser find-references path src\tests\tpch_test.mbt:2:19

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide find-references 'path' --loc 'src\tests\tpch_test.mbt:2:19'
Found 2 references for symbol 'path':
<WORKDIR>/src\tests\tpch_test.mbt:2:19-2:23:
  | ///|
2 | fn read_and_parse(path : String) -> @sqlparser.Statements {
  |                   ^^^^
  |   let input = @fs.read_file_to_string(path) catch {
  |     e => {

<WORKDIR>/src\tests\tpch_test.mbt:3:39-3:43:
  | ///|
  | fn read_and_parse(path : String) -> @sqlparser.Statements {
3 |   let input = @fs.read_file_to_string(path) catch {
  |                                       ^^^^
  |     e => {
  |       println("Read file error: \{e.to_string()}")

```
