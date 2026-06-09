# json peek-def

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'Context' --loc 'src\lib\json.mbt:2:13'
Definition found at file <WORKDIR>/src\lib\json.mbt
  | ///|
2 | priv struct Context {
  |             ^^^^^^^
  |   original : Array[Char]
  |   rest : ArrayView[Char]
  |   skip : Int
  |   arr_acc : Array[Json]
  |   obj_acc : Map[String, Json]
  |   stack : Array[Frame]
  |   decode : &Decode
  | }
  | 
  | ///|
  | enum Frame {
  |   Array(Array[Json])
  |   Map(Map[String, Json])
  |   Key(String)
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'original' --loc 'src\lib\json.mbt:3:3'
Definition found at file <WORKDIR>/src\lib\json.mbt
  | ///|
  | priv struct Context {
3 |   original : Array[Char]
  |   ^^^^^^^^
  |   rest : ArrayView[Char]
  |   skip : Int
  |   arr_acc : Array[Json]
  |   obj_acc : Map[String, Json]
  |   stack : Array[Frame]
  |   decode : &Decode
  | }
  | 
  | ///|
  | enum Frame {
  |   Array(Array[Json])
  |   Map(Map[String, Json])
  |   Key(String)
  | } derive(Debug)
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'ParseError' --loc 'src\lib\error.mbt:2:14'
Definition found at file <WORKDIR>/src\lib\error.mbt
  | ///|
2 | pub suberror ParseError {
  |              ^^^^^^^^^^
  |   ParseError(Reason)
  | } derive(Debug)
  | 
  | ///|
  | pub enum Reason {
  |   InvalidByte(Int, Char)
  |   UnexpectedEnd(Checkpoint)
  |   UnexpectedSequence(Array[Char], Int)
  | } derive(Debug)
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'ParseError' --loc 'src\lib\error.mbt:3:3'
Definition found at file <WORKDIR>/src\lib\error.mbt
  | ///|
  | pub suberror ParseError {
3 |   ParseError(Reason)
  |   ^^^^^^^^^^
  | } derive(Debug)
  | 
  | ///|
  | pub enum Reason {
  |   InvalidByte(Int, Char)
  |   UnexpectedEnd(Checkpoint)
  |   UnexpectedSequence(Array[Char], Int)
  | } derive(Debug)
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'Value' --loc 'src\lib\value.mbt:2:10'
Definition found at file <WORKDIR>/src\lib\value.mbt
  | ///|
2 | pub enum Value {
  |          ^^^^^
  |   Continue(ContinueValue)
  |   Finish(FinishValue)
  | }
  | 
  | ///|
  | pub struct ContinueValue {
  |   rest : ArrayView[Char]
  |   arr_acc : JsonArray
  |   obj_acc : JsonObject
  |   stack : Array[Frame]
  |   decode : &Decode
  |   checkpoint : Checkpoint
  | }
  | 
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'Continue' --loc 'src\lib\value.mbt:3:3'
Definition found at file <WORKDIR>/src\lib\value.mbt
  | ///|
  | pub enum Value {
3 |   Continue(ContinueValue)
  |   ^^^^^^^^
  |   Finish(FinishValue)
  | }
  | 
  | ///|
  | pub struct ContinueValue {
  |   rest : ArrayView[Char]
  |   arr_acc : JsonArray
  |   obj_acc : JsonObject
  |   stack : Array[Frame]
  |   decode : &Decode
  |   checkpoint : Checkpoint
  | }
  | 
  | ///|
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'Decode' --loc 'src\lib\decode.mbt:8:11'
Definition found at file <WORKDIR>/src\lib\decode.mbt
  | 
  | ///|
  | pub type JsonObject = Map[String, Json]
  | 
  | ///|
8 | pub trait Decode {
  | ^
  |   array_start(Self, JsonArray) -> JsonArray
  |   array_push(Self, Json, JsonArray) -> JsonArray
  |   array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray) (escaped)
  |   object_start(Self, JsonObject) -> JsonObject
  |   object_push(Self, String, Json, JsonObject) -> JsonObject
  |   object_finish(Self, JsonObject, JsonObject) -> (JsonObject, JsonObject) (escaped)
  |   double(Self, ArrayView[Char]) -> Double raise
  |   integer(Self, ArrayView[Char]) -> Int raise
  |   string(Self, String) -> String
  | }
  | 
  | ///|
  | impl Decode for Unit with array_start(_self, _old_acc) -> JsonArray {
  |   []
  | }
  | 
  | ///|
  | impl Decode for Unit with array_push(_self, elem, acc) {
  |   [elem, ..acc]
  | }
  | 
  | ///|
  | impl Decode for Unit with array_finish(_self, acc, old_acc) {
  |   (acc.rev(), old_acc)
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'array_start' --loc 'src\lib\decode.mbt:9:3'
Definition found at file <WORKDIR>/src\lib\decode.mbt
  | ///|
  | pub type JsonObject = Map[String, Json]
  | 
  | ///|
  | pub trait Decode {
9 |   array_start(Self, JsonArray) -> JsonArray
  |   ^^^^^^^^^^^
  |   array_push(Self, Json, JsonArray) -> JsonArray
  |   array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray) (escaped)
  |   object_start(Self, JsonObject) -> JsonObject
  |   object_push(Self, String, Json, JsonObject) -> JsonObject
  |   object_finish(Self, JsonObject, JsonObject) -> (JsonObject, JsonObject) (escaped)
  |   double(Self, ArrayView[Char]) -> Double raise
  |   integer(Self, ArrayView[Char]) -> Int raise
  |   string(Self, String) -> String
  | }
  | 
  | ///|
  | impl Decode for Unit with array_start(_self, _old_acc) -> JsonArray {
  |   []
  | }
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'decode_start' --loc 'src\tests\top.mbt:2:14'
Definition found at file <WORKDIR>/src\top.mbt
  | ///|
  | pub using @lib {
  |   trait Decode,
  |   decode,
5 |   decode_start,
  |   ^^^^^^^^^^^^
  |   decode_continue,
  |   type Value,
  |   type ContinueValue,
  |   type FinishValue,
  |   type ParseError,
  |   type Reason,
  | }
Definition found at file <WORKDIR>/src\lib\json.mbt
   |     Continue({ checkpoint: cp, .. }) => raise ParseError(UnexpectedEnd(cp))
   |   }
   | }
   | 
   | ///|
48 | pub fn decode_start(input : String, decode? : &Decode) -> Value raise {
   |        ^^^^^^^^^^^^
   |   let decode : &Decode = match decode {
   |     Some(decode) => decode
   |     None => () (escaped)
   |   }
   |   let ctx = Context::{
   |     rest: input.to_array()[:],
   |     original: input.to_array(),
   |     skip: 0,
   |     arr_acc: [],
   |     obj_acc: Map([]),
   |     stack: [],
   |     decode,
   |   }
   |   value(ctx)
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'decode_continue' --loc 'src\tests\top.mbt:2:28'
Definition found at file <WORKDIR>/src\top.mbt
  | ///|
  | pub using @lib {
  |   trait Decode,
  |   decode,
  |   decode_start,
6 |   decode_continue,
  |   ^^^^^^^^^^^^^^^
  |   type Value,
  |   type ContinueValue,
  |   type FinishValue,
  |   type ParseError,
  |   type Reason,
  | }
Definition found at file <WORKDIR>/src\lib\json.mbt
   |   }
   |   value(ctx)
   | }
   | 
   | ///|
66 | pub fn decode_continue(cont : String, state : ContinueValue) -> Value raise {
   |        ^^^^^^^^^^^^^^^
   |   let input = [..state.rest, ..cont.to_array()]
   |   let ctx = Context::{
   |     rest: input[:],
   |     original: input,
   |     skip: 0,
   |     arr_acc: state.arr_acc,
   |     obj_acc: state.obj_acc,
   |     stack: state.stack,
   |     decode: state.decode,
   |   }
   |   match state.checkpoint {
   |     Value | NumberI(_) | NumberD(_) | FloatError(_, _) => value(ctx)
   |     ArrayPush(v) => array_push(ctx, v)
   |     ObjectKey => object_key(ctx)
```
