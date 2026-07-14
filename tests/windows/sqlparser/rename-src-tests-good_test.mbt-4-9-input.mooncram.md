# sqlparser rename input src\tests\good_test.mbt:4:9

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide rename 'input' 'input_renamed' --loc 'src\tests\good_test.mbt:4:9'
*** Begin Patch
*** Update File: <WORKDIR>/src\tests\good_test.mbt
@@
 // These tests are copied from https://github.com/hyrise/sql-parser/blob/main/test/queries/queries-good.sql
 
 ///|
-fn pass(input : String) -> Unit {
+fn pass(input_renamed : String) -> Unit {
-  (@sqlparser.parse_sql(input) catch {
+  (@sqlparser.parse_sql(input_renamed) catch {
     e => {
       println(e)
       panic()
*** End Patch

```
