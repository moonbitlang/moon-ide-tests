# json rename json_testsuite_fail src\tests\json_testsuite_helpers_test.mbt:2:4

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide rename 'json_testsuite_fail' 'json_testsuite_fail_renamed' --loc 'src\tests\json_testsuite_helpers_test.mbt:2:4'
*** Begin Patch
*** Update File: <WORKDIR>/src\tests\json_testsuite_helpers_test.mbt
@@
 ///|
-fn json_testsuite_fail(message : String) -> Unit raise {
+fn json_testsuite_fail_renamed(message : String) -> Unit raise {
   raise InspectError::InspectError(message)
 }
 
@@
 ///|
 fn expect_accept(name : String, input : String) -> Unit raise {
   try @json.decode(input) catch {
-    _ => json_testsuite_fail("expected JSONTestSuite accept: " + name)
+    _ => json_testsuite_fail_renamed("expected JSONTestSuite accept: " + name)
   } noraise {
     _ => () (escaped)
   }
@@
   try @json.decode(input) catch {
     @lib.ParseError(_) => () (escaped)
     _ =>
-      json_testsuite_fail(
+      json_testsuite_fail_renamed(
         "expected JSONTestSuite parser rejection, got non-parser error: " + name,
       )
   } noraise {
     _ =>
-      json_testsuite_fail(
+      json_testsuite_fail_renamed(
         "expected JSONTestSuite rejection, parser accepted: " + name,
       )
   }
@@
   try @json.decode(input) catch {
     @lib.ParseError(_) => () (escaped)
     _ =>
-      json_testsuite_fail(
+      json_testsuite_fail_renamed(
         "expected JSONTestSuite accept or parser rejection, got non-parser error: " +
         name,
       )
*** End Patch

```
