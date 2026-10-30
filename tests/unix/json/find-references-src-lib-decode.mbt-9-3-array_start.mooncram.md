# json find-references array_start src/lib/decode.mbt:9:3

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/json' moon ide find-references 'array_start' --loc 'src/lib/decode.mbt:9:3'
Found 3 references for symbol 'array_start':
<WORKDIR>/src/lib/decode.mbt:21:27-21:38:
   | }
   | 
   | ///|
21 | impl Decode for Unit with array_start(_self, _old_acc) -> JsonArray {
   |                           ^^^^^^^^^^^
   |   []
   | }

<WORKDIR>/src/lib/json.mbt:457:20-457:31:
"    |       array_start({ ..ctx, rest, }, len + 1)" (escaped)
"    |     [']', .. rest] => {" (escaped)
"    |       let (value, new_acc) = ctx.decode.array_finish(" (escaped)
"457 |         ctx.decode.array_start(arr_acc)," (escaped)
"    |                    ^^^^^^^^^^^" (escaped)
"    |         arr_acc," (escaped)
"    |       )" (escaped)

<WORKDIR>/src/lib/json.mbt:467:28-467:39:
"    |     }" (escaped)
"    |     [] => unexpected(ctx, len, 0, Checkpoint::Value)" (escaped)
"    |     rest => {" (escaped)
"467 |       let new_acc = decode.array_start(arr_acc)" (escaped)
"    |                            ^^^^^^^^^^^" (escaped)
"    |       ctx.stack.push(Frame::Array(arr_acc))" (escaped)
"    |       value({ ..ctx, rest, skip: skip + len, arr_acc: new_acc })" (escaped)
"" (escaped)
````
