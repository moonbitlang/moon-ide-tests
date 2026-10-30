# json find-references decode_start src\tests\top.mbt:2:14

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/json' moon ide find-references 'decode_start' --loc 'src\tests\top.mbt:2:14'
Found 2 references for symbol 'decode_start':
<WORKDIR>/src\tests\incr.mbt:21:31-21:43:
   | fn decode_chunks(chunks : ArrayView[String]) -> Value raise {
   |   match chunks {
   |     [first_chunk, .. chunks] =>
21 |       continue_chunks(chunks, decode_start(first_chunk))
   |                               ^^^^^^^^^^^^
   |     [] => raise InspectError::InspectError("expected at least one chunk")
   |   }

<WORKDIR>/src\tests\incr.mbt:71:33-71:45:
   |   guard compelet_json.to_array().chunks(6).map(String::from_array)
   |     is [first_chunk, .. chunks]
   |   // start parsing from `first_chunk`
71 |   guard continue_chunks(chunks, decode_start(first_chunk))
   |                                 ^^^^^^^^^^^^
   |     is Finish({ value, .. })
   |   let expected = Json::object({
"" (escaped)
````
