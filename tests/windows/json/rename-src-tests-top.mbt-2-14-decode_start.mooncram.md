# json rename decode_start src\tests\top.mbt:2:14

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide rename 'decode_start' 'decode_start_renamed' --loc 'src\tests\top.mbt:2:14'
*** Begin Patch
*** Update File: <WORKDIR>/src\tests\incr.mbt
@@
 fn decode_chunks(chunks : ArrayView[String]) -> Value raise {
   match chunks {
     [first_chunk, .. chunks] =>
-      continue_chunks(chunks, decode_start(first_chunk))
+      continue_chunks(chunks, decode_start_renamed(first_chunk))
     [] => raise InspectError::InspectError("expected at least one chunk")
   }
 }
@@
   guard compelet_json.to_array().chunks(6).map(String::from_array)
     is [first_chunk, .. chunks]
   // start parsing from `first_chunk`
-  guard continue_chunks(chunks, decode_start(first_chunk))
+  guard continue_chunks(chunks, decode_start_renamed(first_chunk))
     is Finish({ value, .. })
   let expected = Json::object({
     "foo": Json::object({ "bar": Json::number(1200.0) }),
*** Update File: <WORKDIR>/src\tests\top.mbt
@@
 ///|
-using @json {decode_start, decode_continue, type Value}
+using @json {decode_start_renamed, decode_continue, type Value}
*** End Patch

```
