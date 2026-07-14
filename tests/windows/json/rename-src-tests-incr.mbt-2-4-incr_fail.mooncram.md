# json rename incr_fail src\tests\incr.mbt:2:4

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide rename 'incr_fail' 'incr_fail_renamed' --loc 'src\tests\incr.mbt:2:4'
*** Begin Patch
*** Update File: <WORKDIR>/src\tests\incr.mbt
@@
 ///|
-fn incr_fail(message : String) -> Unit raise {
+fn incr_fail_renamed(message : String) -> Unit raise {
   raise InspectError::InspectError(message)
 }
 
@@
   match decode_chunks(chunks) {
     Finish({ value, rest: [], .. }) => @debug.assert_eq(value, expected)
     Finish({ rest, .. }) =>
-      incr_fail(
+      incr_fail_renamed(
         "expected chunked JSON without trailing bytes: " +
         name +
         ", got " +
         String::from_array([..rest]),
       )
-    Continue(_) => incr_fail("expected chunked JSON to finish: " + name)
+    Continue(_) => incr_fail_renamed("expected chunked JSON to finish: " + name)
   }
 }
 
@@
   try decode_chunks(chunks) catch {
     @lib.ParseError(_) => () (escaped)
     _ =>
-      incr_fail(
+      incr_fail_renamed(
         "expected chunked parser rejection, got non-parser error: " + name,
       )
   } noraise {
     Continue(_) =>
-      incr_fail("expected chunked parser rejection, got continuation: " + name)
+      incr_fail_renamed("expected chunked parser rejection, got continuation: " + name)
     Finish(_) =>
-      incr_fail("expected chunked parser rejection, parser accepted: " + name)
+      incr_fail_renamed("expected chunked parser rejection, parser accepted: " + name)
   }
 }
 
@@
       assert_eq(String::from_array([..rest]), " trailing")
     }
     Continue(_) =>
-      incr_fail("expected chunked parser to finish with trailing rest")
+      incr_fail_renamed("expected chunked parser to finish with trailing rest")
   }
 }
 
*** End Patch

```
