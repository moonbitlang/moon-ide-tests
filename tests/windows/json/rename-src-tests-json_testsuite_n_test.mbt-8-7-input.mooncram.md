# json rename input src\tests\json_testsuite_n_test.mbt:8:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide rename 'input' 'input_renamed' --loc 'src\tests\json_testsuite_n_test.mbt:8:7'
*** Begin Patch
*** Update File: <WORKDIR>/src\tests\json_testsuite_n_test.mbt
@@
 
 ///|
 test "json_testsuite n_array_1_true_without_comma" {
-  let input = "[1 true]"
+  let input_renamed = "[1 true]"
-  expect_reject("n_array_1_true_without_comma.json", input)
+  expect_reject("n_array_1_true_without_comma.json", input_renamed)
 }
 
 ///|
*** End Patch

```
