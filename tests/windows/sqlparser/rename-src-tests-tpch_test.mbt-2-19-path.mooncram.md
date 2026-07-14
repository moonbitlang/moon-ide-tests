# sqlparser rename path src\tests\tpch_test.mbt:2:19

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide rename 'path' 'path_renamed' --loc 'src\tests\tpch_test.mbt:2:19'
*** Begin Patch
*** Update File: <WORKDIR>/src\tests\tpch_test.mbt
@@
 ///|
-fn read_and_parse(path : String) -> @sqlparser.Statements {
+fn read_and_parse(path_renamed : String) -> @sqlparser.Statements {
-  let input = @fs.read_file_to_string(path) catch {
+  let input = @fs.read_file_to_string(path_renamed) catch {
     e => {
       println("Read file error: \{e.to_string()}")
       panic()
*** End Patch

```
