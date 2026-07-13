# json find-references decode_continue src\tests\top.mbt:2:28

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide find-references 'decode_continue' --loc 'src\tests\top.mbt:2:28'
Found 2 references for symbol 'decode_continue':
<WORKDIR>/src\tests\incr.mbt:11:29-11:44:
   |   match (chunks, value) {
   |     ([], value) => value
   |     ([chunk, .. rest], Continue(state)) =>
11 |       continue_chunks(rest, decode_continue(chunk, state))
   |                             ^^^^^^^^^^^^^^^
   |     ([_, ..], Finish(_)) =>
   |       raise InspectError::InspectError("parser finished before all chunks")

<WORKDIR>/src\tests\top.mbt:2:28-2:43:
  | ///|
2 | using @json {decode_start, decode_continue, type Value}
  |                            ^^^^^^^^^^^^^^^

```
