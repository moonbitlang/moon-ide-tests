# json find-references decode_continue src/tests/top.mbt:2:28

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/json' moon ide find-references 'decode_continue' --loc 'src/tests/top.mbt:2:28'
Found 1 references for symbol 'decode_continue':
<WORKDIR>/src/tests/incr.mbt:11:29-11:44:
   |   match (chunks, value) {
   |     ([], value) => value
   |     ([chunk, .. rest], Continue(state)) =>
11 |       continue_chunks(rest, decode_continue(chunk, state))
   |                             ^^^^^^^^^^^^^^^
   |     ([_, ..], Finish(_)) =>
   |       raise InspectError::InspectError("parser finished before all chunks")
"" (escaped)
````
