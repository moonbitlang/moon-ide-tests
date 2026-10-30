# toml-parser rename input test_utils_test.mbt:2:25

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/toml-parser' moon ide rename 'input' 'input_renamed' --loc 'test_utils_test.mbt:2:25'
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
"" (escaped)
````
