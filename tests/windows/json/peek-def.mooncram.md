# json peek-def

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
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'incr_fail' --loc 'src\tests\incr.mbt:2:4'
Definition found at file <WORKDIR>/src\tests\incr.mbt
  | ///|
2 | fn incr_fail(message : String) -> Unit raise {
  |    ^^^^^^^^^
  |   raise InspectError::InspectError(message)
  | }
  | 
  | ///|
  | fn continue_chunks(chunks : ArrayView[String], value : Value) -> Value raise {
  |   match (chunks, value) {
  |     ([], value) => value
  |     ([chunk, .. rest], Continue(state)) =>
  |       continue_chunks(rest, decode_continue(chunk, state))
  |     ([_, ..], Finish(_)) =>
  |       raise InspectError::InspectError("parser finished before all chunks")
  |   }
  | }
  | 
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'message' --loc 'src\tests\incr.mbt:2:14'
Definition found at file <WORKDIR>/src\tests\incr.mbt
  | ///|
2 | fn incr_fail(message : String) -> Unit raise {
  |              ^^^^^^^
  |   raise InspectError::InspectError(message)
  | }
  | 
  | ///|
  | fn continue_chunks(chunks : ArrayView[String], value : Value) -> Value raise {
  |   match (chunks, value) {
  |     ([], value) => value
  |     ([chunk, .. rest], Continue(state)) =>
  |       continue_chunks(rest, decode_continue(chunk, state))
  |     ([_, ..], Finish(_)) =>
  |       raise InspectError::InspectError("parser finished before all chunks")
  |   }
  | }
  | 
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'json_testsuite_fail' --loc 'src\tests\json_testsuite_helpers_test.mbt:2:4'
Definition found at file <WORKDIR>/src\tests\json_testsuite_helpers_test.mbt
  | ///|
2 | fn json_testsuite_fail(message : String) -> Unit raise {
  |    ^^^^^^^^^^^^^^^^^^^
  |   raise InspectError::InspectError(message)
  | }
  | 
  | ///|
  | fn expect_accept(name : String, input : String) -> Unit raise {
  |   try @json.decode(input) catch {
  |     _ => json_testsuite_fail("expected JSONTestSuite accept: " + name)
  |   } noraise {
  |     _ => () (escaped)
  |   }
  | }
  | 
  | ///|
  | fn expect_reject(name : String, input : String) -> Unit raise {
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'message' --loc 'src\tests\json_testsuite_helpers_test.mbt:2:24'
Definition found at file <WORKDIR>/src\tests\json_testsuite_helpers_test.mbt
  | ///|
2 | fn json_testsuite_fail(message : String) -> Unit raise {
  |                        ^^^^^^^
  |   raise InspectError::InspectError(message)
  | }
  | 
  | ///|
  | fn expect_accept(name : String, input : String) -> Unit raise {
  |   try @json.decode(input) catch {
  |     _ => json_testsuite_fail("expected JSONTestSuite accept: " + name)
  |   } noraise {
  |     _ => () (escaped)
  |   }
  | }
  | 
  | ///|
  | fn expect_reject(name : String, input : String) -> Unit raise {
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'input' --loc 'src\tests\json_testsuite_n_test.mbt:8:7'
Definition found at file <WORKDIR>/src\tests\json_testsuite_n_test.mbt
  | // Upstream license: MIT License, Copyright (c) 2016 Nicolas Seriot.
  | // File: json_testsuite_n_test.mbt
  | 
  | ///|
  | test "json_testsuite n_array_1_true_without_comma" {
8 |   let input = "[1 true]"
  |       ^^^^^
  |   expect_reject("n_array_1_true_without_comma.json", input)
  | }
  | 
  | ///|
  | test "json_testsuite n_array_colon_instead_of_comma" {
  |   let input = "[\"\": 1]"
  |   expect_reject("n_array_colon_instead_of_comma.json", input)
  | }
  | 
  | ///|
  | test "json_testsuite n_array_comma_after_close" {
  |   let input = "[\"\"],"
  |   expect_reject("n_array_comma_after_close.json", input)
  | }
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'expect_reject' --loc 'src\tests\json_testsuite_n_test.mbt:9:3'
Definition found at file <WORKDIR>/src\tests\json_testsuite_helpers_test.mbt
   |     _ => () (escaped)
   |   }
   | }
   | 
   | ///|
16 | fn expect_reject(name : String, input : String) -> Unit raise {
   |    ^^^^^^^^^^^^^
   |   try @json.decode(input) catch {
   |     @lib.ParseError(_) => () (escaped)
   |     _ =>
   |       json_testsuite_fail(
   |         "expected JSONTestSuite parser rejection, got non-parser error: " + name,
   |       )
   |   } noraise {
   |     _ =>
   |       json_testsuite_fail(
   |         "expected JSONTestSuite rejection, parser accepted: " + name,
   |       )
   |   }
   | }
   | 
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'input' --loc 'src\tests\json_testsuite_y_test.mbt:8:7'
Definition found at file <WORKDIR>/src\tests\json_testsuite_y_test.mbt
  | // Upstream license: MIT License, Copyright (c) 2016 Nicolas Seriot.
  | // File: json_testsuite_y_test.mbt
  | 
  | ///|
  | test "json_testsuite y_array_arraysWithSpaces" {
8 |   let input = "[[]   ]"
  |       ^^^^^
  |   expect_accept("y_array_arraysWithSpaces.json", input)
  | }
  | 
  | ///|
  | test "json_testsuite y_array_empty-string" {
  |   let input = "[\"\"]"
  |   expect_accept("y_array_empty-string.json", input)
  | }
  | 
  | ///|
  | test "json_testsuite y_array_empty" {
  |   let input = "[]"
  |   expect_accept("y_array_empty.json", input)
  | }
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'expect_accept' --loc 'src\tests\json_testsuite_y_test.mbt:9:3'
Definition found at file <WORKDIR>/src\tests\json_testsuite_helpers_test.mbt
  | fn json_testsuite_fail(message : String) -> Unit raise {
  |   raise InspectError::InspectError(message)
  | }
  | 
  | ///|
7 | fn expect_accept(name : String, input : String) -> Unit raise {
  |    ^^^^^^^^^^^^^
  |   try @json.decode(input) catch {
  |     _ => json_testsuite_fail("expected JSONTestSuite accept: " + name)
  |   } noraise {
  |     _ => () (escaped)
  |   }
  | }
  | 
  | ///|
  | fn expect_reject(name : String, input : String) -> Unit raise {
  |   try @json.decode(input) catch {
  |     @lib.ParseError(_) => () (escaped)
  |     _ =>
  |       json_testsuite_fail(
  |         "expected JSONTestSuite parser rejection, got non-parser error: " + name,
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'actual' --loc 'src\tests\json_value_semantics_test.mbt:3:7'
Definition found at file <WORKDIR>/src\tests\json_value_semantics_test.mbt
  | ///|
  | test "json value semantics basics" {
3 |   let actual = @json.decode("[false,1,\"x\",null,{\"a\":true}]")
  |       ^^^^^^
  |   let expected = Json::array([
  |     Json::boolean(false),
  |     Json::number(1.0),
  |     Json::string("x"),
  |     Json::null(),
  |     Json::object({ "a": Json::boolean(true) }),
  |   ])
  |   @debug.assert_eq(actual, expected)
  | }
  | 
  | ///|
  | test "json value semantics duplicate object key keeps first value" {
  |   let actual = @json.decode("{\"a\":\"b\",\"a\":\"c\"}")
  |   let expected = Json::object({ "a": Json::string("b") })
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'decode' --loc 'src\tests\json_value_semantics_test.mbt:3:22'
Definition found at file <WORKDIR>/src\top.mbt
  | ///|
  | pub using @lib {
  |   trait Decode,
4 |   decode,
  |   ^^^^^^
  |   decode_start,
  |   decode_continue,
  |   type Value,
  |   type ContinueValue,
  |   type FinishValue,
  |   type ParseError,
  |   type Reason,
  | }
Definition found at file <WORKDIR>/src\lib\json.mbt
   |   Map(Map[String, Json])
   |   Key(String)
   | } derive(Debug)
   | 
   | ///|
20 | pub fn decode(input : String, decode? : &Decode) -> Json raise {
   |        ^^^^^^
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
   |   match value(ctx) {
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

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'Decode' --loc 'src\top.mbt:3:9'
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
  |   array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray)
  |   object_start(Self, JsonObject) -> JsonObject
  |   object_push(Self, String, Json, JsonObject) -> JsonObject
  |   object_finish(Self, JsonObject, JsonObject) -> (JsonObject, JsonObject)
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
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'decode' --loc 'src\top.mbt:4:3'
Definition found at file <WORKDIR>/src\lib\json.mbt
   |   Map(Map[String, Json])
   |   Key(String)
   | } derive(Debug)
   | 
   | ///|
20 | pub fn decode(input : String, decode? : &Decode) -> Json raise {
   |        ^^^^^^
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
   |   match value(ctx) {
```
