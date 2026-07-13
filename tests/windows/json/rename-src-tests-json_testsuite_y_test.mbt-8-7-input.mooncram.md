# json rename input src\tests\json_testsuite_y_test.mbt:8:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide rename 'input' 'input_renamed' --loc 'src\tests\json_testsuite_y_test.mbt:8:7'
*** Begin Patch
*** Update File: <WORKDIR>/src\tests\json_testsuite_y_test.mbt
@@
 
 ///|
 test "json_testsuite y_array_arraysWithSpaces" {
-  let input = "[[]   ]"
+  let input_renamed = "[[]   ]"
-  expect_accept("y_array_arraysWithSpaces.json", input)
+  expect_accept("y_array_arraysWithSpaces.json", input_renamed)
 }
 
 ///|
*** End Patch

```
