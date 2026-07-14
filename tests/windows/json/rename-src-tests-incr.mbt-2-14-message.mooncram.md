# json rename message src\tests\incr.mbt:2:14

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide rename 'message' 'message_renamed' --loc 'src\tests\incr.mbt:2:14'
*** Begin Patch
*** Update File: <WORKDIR>/src\tests\incr.mbt
@@
 ///|
-fn incr_fail(message : String) -> Unit raise {
+fn incr_fail(message_renamed : String) -> Unit raise {
-  raise InspectError::InspectError(message)
+  raise InspectError::InspectError(message_renamed)
 }
 
 ///|
*** End Patch

```
