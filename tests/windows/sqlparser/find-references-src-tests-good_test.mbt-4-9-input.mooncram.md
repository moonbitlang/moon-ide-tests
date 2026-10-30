# sqlparser find-references input src\tests\good_test.mbt:4:9

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/sqlparser' moon ide find-references 'input' --loc 'src\tests\good_test.mbt:4:9'
Found 1 references for symbol 'input':
<WORKDIR>/src\tests\good_test.mbt:5:25-5:30:
  | 
  | ///|
  | fn pass(input : String) -> Unit {
5 |   (@sqlparser.parse_sql(input) catch {
  |                         ^^^^^
  |     e => {
  |       println(e)
"" (escaped)
````
