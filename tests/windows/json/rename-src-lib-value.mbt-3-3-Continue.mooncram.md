# json rename Continue src\lib\value.mbt:3:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide rename 'Continue' 'ContinueRenamed' --loc 'src\lib\value.mbt:3:3'
*** Begin Patch
*** Update File: <WORKDIR>/src\lib\json.mbt
@@
   match value(ctx) {
     Finish({ value, rest: [], .. }) => value
     Finish({ rest, .. }) => raise invalid_byte([..rest], 0)
-    Continue({ stack: [], checkpoint: Checkpoint::NumberI(n), .. }) =>
+    ContinueRenamed({ stack: [], checkpoint: Checkpoint::NumberI(n), .. }) =>
       n.to_json()
-    Continue({ stack: [], checkpoint: Checkpoint::NumberD(n), .. }) =>
+    ContinueRenamed({ stack: [], checkpoint: Checkpoint::NumberD(n), .. }) =>
       n.to_json()
-    Continue({ checkpoint: Checkpoint::FloatError(token, skip), .. }) =>
+    ContinueRenamed({ checkpoint: Checkpoint::FloatError(token, skip), .. }) =>
       raise ParseError(UnexpectedSequence(token.to_owned(), skip))
-    Continue({ checkpoint: cp, .. }) => raise ParseError(UnexpectedEnd(cp))
+    ContinueRenamed({ checkpoint: cp, .. }) => raise ParseError(UnexpectedEnd(cp))
   }
 }
 
@@
   let original_size = original.length()
   if original_size <= required_size {
     let rest = original[skip:]
-    Value::Continue(ContinueValue::{
+    Value::ContinueRenamed(ContinueValue::{
       rest,
       arr_acc,
       obj_acc,
*** Update File: <WORKDIR>/src\lib\value.mbt
@@
 ///|
 pub enum Value {
-  Continue(ContinueValue)
+  ContinueRenamed(ContinueValue)
   Finish(FinishValue)
 }
 
*** Update File: <WORKDIR>/src\tests\incr.mbt
@@
 fn continue_chunks(chunks : ArrayView[String], value : Value) -> Value raise {
   match (chunks, value) {
     ([], value) => value
-    ([chunk, .. rest], Continue(state)) =>
+    ([chunk, .. rest], ContinueRenamed(state)) =>
       continue_chunks(rest, decode_continue(chunk, state))
     ([_, ..], Finish(_)) =>
       raise InspectError::InspectError("parser finished before all chunks")
@@
         ", got " +
         String::from_array([..rest]),
       )
-    Continue(_) => incr_fail("expected chunked JSON to finish: " + name)
+    ContinueRenamed(_) => incr_fail("expected chunked JSON to finish: " + name)
   }
 }
 
@@
         "expected chunked parser rejection, got non-parser error: " + name,
       )
   } noraise {
-    Continue(_) =>
+    ContinueRenamed(_) =>
       incr_fail("expected chunked parser rejection, got continuation: " + name)
     Finish(_) =>
       incr_fail("expected chunked parser rejection, parser accepted: " + name)
@@
       @debug.assert_eq(value, Json::object({ "a": Json::number(1.0) }))
       assert_eq(String::from_array([..rest]), " trailing")
     }
-    Continue(_) =>
+    ContinueRenamed(_) =>
       incr_fail("expected chunked parser to finish with trailing rest")
   }
 }
*** End Patch

```
