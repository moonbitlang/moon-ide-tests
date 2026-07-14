# json find-references array_start src\lib\decode.mbt:9:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide find-references 'array_start' --loc 'src\lib\decode.mbt:9:3'
Found 4 references for symbol 'array_start':
<WORKDIR>/src\lib\decode.mbt:9:3-9:14:
  | 
  | ///|
  | pub trait Decode {
9 |   array_start(Self, JsonArray) -> JsonArray
  |   ^^^^^^^^^^^
  |   array_push(Self, Json, JsonArray) -> JsonArray
  |   array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray) (escaped)

<WORKDIR>/src\lib\decode.mbt:21:27-21:38:
   | }
   | 
   | ///|
21 | impl Decode for Unit with array_start(_self, _old_acc) -> JsonArray {
   |                           ^^^^^^^^^^^
   |   []
   | }

<WORKDIR>/src\lib\json.mbt:457:20-457:31:
    |       array_start({ ..ctx, rest, }, len + 1)
    |     [']', .. rest] => {
    |       let (value, new_acc) = ctx.decode.array_finish(
457 |         ctx.decode.array_start(arr_acc),
    |                    ^^^^^^^^^^^
    |         arr_acc,
    |       )

<WORKDIR>/src\lib\json.mbt:467:28-467:39:
    |     }
    |     [] => unexpected(ctx, len, 0, Checkpoint::Value)
    |     rest => {
467 |       let new_acc = decode.array_start(arr_acc)
    |                            ^^^^^^^^^^^
    |       ctx.stack.push(Frame::Array(arr_acc))
    |       value({ ..ctx, rest, skip: skip + len, arr_acc: new_acc })

```
