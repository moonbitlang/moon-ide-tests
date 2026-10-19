# json rename decode_continue src\tests\top.mbt:2:28

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide rename 'decode_continue' 'decode_continue_renamed' --loc 'src\tests\top.mbt:2:28'
*** Begin Patch
*** Update File: <WORKDIR>/src\tests\incr.mbt
@@
   match (chunks, value) {
     ([], value) => value
     ([chunk, .. rest], Continue(state)) =>
-      continue_chunks(rest, decode_continue(chunk, state))
+      continue_chunks(rest, decode_continue_renamed(chunk, state))
     ([_, ..], Finish(_)) =>
       raise InspectError::InspectError("parser finished before all chunks")
   }
*** Update File: <WORKDIR>/src\tests\top.mbt
@@
 ///|
-using @json {decode_start, decode_continue, type Value}
+using @json {decode_start, decode_continue_renamed, type Value}
*** End Patch

```
