# json rename Continue src/lib/value.mbt:3:3

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/json" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide rename 'Continue' 'ContinueRenamed' --loc 'src/lib/value.mbt:3:3'
*** Begin Patch
*** Update File: <WORKDIR>/src/lib/json.mbt
@@
   match value(ctx) {
     Finish({ value, rest: [], .. }) => value (escaped)
     Finish({ rest, .. }) => raise invalid_byte([..rest], 0) (escaped)
-    Continue({ stack: [], checkpoint: Checkpoint::NumberI(n), .. }) => Json(n)
+    ContinueRenamed({ stack: [], checkpoint: Checkpoint::NumberI(n), .. }) => Json(n)
-    Continue({ stack: [], checkpoint: Checkpoint::NumberD(n), .. }) => Json(n)
+    ContinueRenamed({ stack: [], checkpoint: Checkpoint::NumberD(n), .. }) => Json(n)
-    Continue({ checkpoint: Checkpoint::FloatError(token, skip), .. }) => (escaped)
+    ContinueRenamed({ checkpoint: Checkpoint::FloatError(token, skip), .. }) => (escaped)
       raise ParseError(UnexpectedSequence(token.to_owned(), skip))
-    Continue({ checkpoint: cp, .. }) => raise ParseError(UnexpectedEnd(cp)) (escaped)
+    ContinueRenamed({ checkpoint: cp, .. }) => raise ParseError(UnexpectedEnd(cp)) (escaped)
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
*** Update File: <WORKDIR>/src/lib/value.mbt
@@
 ///|
 pub enum Value {
-  Continue(ContinueValue)
+  ContinueRenamed(ContinueValue)
   Finish(FinishValue)
 }
 
*** Update File: <WORKDIR>/src/tests/incr.mbt
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
