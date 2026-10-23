# json rename message src\tests\json_testsuite_helpers_test.mbt:2:24

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide rename 'message' 'message_renamed' --loc 'src\tests\json_testsuite_helpers_test.mbt:2:24'
*** Begin Patch
*** Update File: <WORKDIR>/src\tests\json_testsuite_helpers_test.mbt
@@
 ///|
-fn json_testsuite_fail(message : String) -> Unit raise {
+fn json_testsuite_fail(message_renamed : String) -> Unit raise {
-  raise InspectError::InspectError(message)
+  raise InspectError::InspectError(message_renamed)
 }
 
 ///|
*** End Patch

```
