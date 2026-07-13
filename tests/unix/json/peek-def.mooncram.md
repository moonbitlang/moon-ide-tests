# json peek-def

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
$ run_moon_ide moon ide peek-def 'Decode' --loc 'src/lib/decode.mbt:8:11'
Definition found at file <WORKDIR>/src/lib/decode.mbt
  |  (escaped)
  | ///| (escaped)
  | pub type JsonObject = Map[String, Json] (escaped)
  |  (escaped)
  | ///| (escaped)
8 | pub trait Decode { (escaped)
  | ^ (escaped)
  |   array_start(Self, JsonArray) -> JsonArray (escaped)
  |   array_push(Self, Json, JsonArray) -> JsonArray (escaped)
  |   array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray) (escaped)
  |   object_start(Self, JsonObject) -> JsonObject (escaped)
  |   object_push(Self, String, Json, JsonObject) -> JsonObject (escaped)
  |   object_finish(Self, JsonObject, JsonObject) -> (JsonObject, JsonObject) (escaped)
  |   double(Self, ArrayView[Char]) -> Double raise (escaped)
  |   integer(Self, ArrayView[Char]) -> Int raise (escaped)
  |   string(Self, String) -> String (escaped)
  | } (escaped)
  |  (escaped)
  | ///| (escaped)
  | impl Decode for Unit with array_start(_self, _old_acc) -> JsonArray { (escaped)
  |   [] (escaped)
  | } (escaped)
  |  (escaped)
  | ///| (escaped)
  | impl Decode for Unit with array_push(_self, elem, acc) { (escaped)
  |   [elem, ..acc] (escaped)
  | } (escaped)
  |  (escaped)
  | ///| (escaped)
  | impl Decode for Unit with array_finish(_self, acc, old_acc) { (escaped)
  |   (acc.rev(), old_acc) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'array_start' --loc 'src/lib/decode.mbt:9:3'
Definition found at file <WORKDIR>/src/lib/decode.mbt
  | ///| (escaped)
  | pub type JsonObject = Map[String, Json] (escaped)
  |  (escaped)
  | ///| (escaped)
  | pub trait Decode { (escaped)
9 |   array_start(Self, JsonArray) -> JsonArray (escaped)
  |   ^^^^^^^^^^^ (escaped)
  |   array_push(Self, Json, JsonArray) -> JsonArray (escaped)
  |   array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray) (escaped)
  |   object_start(Self, JsonObject) -> JsonObject (escaped)
  |   object_push(Self, String, Json, JsonObject) -> JsonObject (escaped)
  |   object_finish(Self, JsonObject, JsonObject) -> (JsonObject, JsonObject) (escaped)
  |   double(Self, ArrayView[Char]) -> Double raise (escaped)
  |   integer(Self, ArrayView[Char]) -> Int raise (escaped)
  |   string(Self, String) -> String (escaped)
  | } (escaped)
  |  (escaped)
  | ///| (escaped)
  | impl Decode for Unit with array_start(_self, _old_acc) -> JsonArray { (escaped)
  |   [] (escaped)
  | } (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'Context' --loc 'src/lib/json.mbt:2:13'
Definition found at file <WORKDIR>/src/lib/json.mbt
  | ///| (escaped)
2 | priv struct Context { (escaped)
  |             ^^^^^^^ (escaped)
  |   original : Array[Char] (escaped)
  |   rest : ArrayView[Char] (escaped)
  |   skip : Int (escaped)
  |   arr_acc : Array[Json] (escaped)
  |   obj_acc : Map[String, Json] (escaped)
  |   stack : Array[Frame] (escaped)
  |   decode : &Decode (escaped)
  | } (escaped)
  |  (escaped)
  | ///| (escaped)
  | enum Frame { (escaped)
  |   Array(Array[Json]) (escaped)
  |   Map(Map[String, Json]) (escaped)
  |   Key(String) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'original' --loc 'src/lib/json.mbt:3:3'
Definition found at file <WORKDIR>/src/lib/json.mbt
  | ///| (escaped)
  | priv struct Context { (escaped)
3 |   original : Array[Char] (escaped)
  |   ^^^^^^^^ (escaped)
  |   rest : ArrayView[Char] (escaped)
  |   skip : Int (escaped)
  |   arr_acc : Array[Json] (escaped)
  |   obj_acc : Map[String, Json] (escaped)
  |   stack : Array[Frame] (escaped)
  |   decode : &Decode (escaped)
  | } (escaped)
  |  (escaped)
  | ///| (escaped)
  | enum Frame { (escaped)
  |   Array(Array[Json]) (escaped)
  |   Map(Map[String, Json]) (escaped)
  |   Key(String) (escaped)
  | } derive(Debug) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'Value' --loc 'src/lib/value.mbt:2:10'
Definition found at file <WORKDIR>/src/lib/value.mbt
  | ///| (escaped)
2 | pub enum Value { (escaped)
  |          ^^^^^ (escaped)
  |   Continue(ContinueValue) (escaped)
  |   Finish(FinishValue) (escaped)
  | } (escaped)
  |  (escaped)
  | ///| (escaped)
  | pub struct ContinueValue { (escaped)
  |   rest : ArrayView[Char] (escaped)
  |   arr_acc : JsonArray (escaped)
  |   obj_acc : JsonObject (escaped)
  |   stack : Array[Frame] (escaped)
  |   decode : &Decode (escaped)
  |   checkpoint : Checkpoint (escaped)
  | } (escaped)
  |  (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'Continue' --loc 'src/lib/value.mbt:3:3'
Definition found at file <WORKDIR>/src/lib/value.mbt
  | ///| (escaped)
  | pub enum Value { (escaped)
3 |   Continue(ContinueValue) (escaped)
  |   ^^^^^^^^ (escaped)
  |   Finish(FinishValue) (escaped)
  | } (escaped)
  |  (escaped)
  | ///| (escaped)
  | pub struct ContinueValue { (escaped)
  |   rest : ArrayView[Char] (escaped)
  |   arr_acc : JsonArray (escaped)
  |   obj_acc : JsonObject (escaped)
  |   stack : Array[Frame] (escaped)
  |   decode : &Decode (escaped)
  |   checkpoint : Checkpoint (escaped)
  | } (escaped)
  |  (escaped)
  | ///| (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'incr_fail' --loc 'src/tests/incr.mbt:2:4'
Definition found at file <WORKDIR>/src/tests/incr.mbt
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
$ run_moon_ide moon ide peek-def 'message' --loc 'src/tests/incr.mbt:2:14'
Definition found at file <WORKDIR>/src/tests/incr.mbt
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
$ run_moon_ide moon ide peek-def 'json_testsuite_fail' --loc 'src/tests/json_testsuite_helpers_test.mbt:2:4'
Definition found at file <WORKDIR>/src/tests/json_testsuite_helpers_test.mbt
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
$ run_moon_ide moon ide peek-def 'message' --loc 'src/tests/json_testsuite_helpers_test.mbt:2:24'
Definition found at file <WORKDIR>/src/tests/json_testsuite_helpers_test.mbt
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
$ run_moon_ide moon ide peek-def 'input' --loc 'src/tests/json_testsuite_n_test.mbt:8:7'
Definition found at file <WORKDIR>/src/tests/json_testsuite_n_test.mbt
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
$ run_moon_ide moon ide peek-def 'expect_reject' --loc 'src/tests/json_testsuite_n_test.mbt:9:3'
Definition found at file <WORKDIR>/src/tests/json_testsuite_helpers_test.mbt
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
$ run_moon_ide moon ide peek-def 'input' --loc 'src/tests/json_testsuite_y_test.mbt:8:7'
Definition found at file <WORKDIR>/src/tests/json_testsuite_y_test.mbt
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
$ run_moon_ide moon ide peek-def 'expect_accept' --loc 'src/tests/json_testsuite_y_test.mbt:9:3'
Definition found at file <WORKDIR>/src/tests/json_testsuite_helpers_test.mbt
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
$ run_moon_ide moon ide peek-def 'actual' --loc 'src/tests/json_value_semantics_test.mbt:3:7'
Definition found at file <WORKDIR>/src/tests/json_value_semantics_test.mbt
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
$ run_moon_ide moon ide peek-def 'decode' --loc 'src/tests/json_value_semantics_test.mbt:3:22'
Definition found at file <WORKDIR>/src/top.mbt
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
Definition found at file <WORKDIR>/src/lib/json.mbt
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
$ run_moon_ide moon ide peek-def 'decode_start' --loc 'src/tests/top.mbt:2:14'
Definition found at file <WORKDIR>/src/top.mbt
  | ///| (escaped)
  | pub using @lib { (escaped)
  |   trait Decode, (escaped)
  |   decode, (escaped)
5 |   decode_start, (escaped)
  |   ^^^^^^^^^^^^ (escaped)
  |   decode_continue, (escaped)
  |   type Value, (escaped)
  |   type ContinueValue, (escaped)
  |   type FinishValue, (escaped)
  |   type ParseError, (escaped)
  |   type Reason, (escaped)
  | } (escaped)
Definition found at file <WORKDIR>/src/lib/json.mbt
   |     Continue({ checkpoint: cp, .. }) => raise ParseError(UnexpectedEnd(cp)) (escaped)
   |   } (escaped)
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
48 | pub fn decode_start(input : String, decode? : &Decode) -> Value raise { (escaped)
   |        ^^^^^^^^^^^^ (escaped)
   |   let decode : &Decode = match decode { (escaped)
   |     Some(decode) => decode (escaped)
   |     None => () (escaped)
   |   } (escaped)
   |   let ctx = Context::{ (escaped)
   |     rest: input.to_array()[:], (escaped)
   |     original: input.to_array(), (escaped)
   |     skip: 0, (escaped)
   |     arr_acc: [], (escaped)
   |     obj_acc: Map([]), (escaped)
   |     stack: [], (escaped)
   |     decode, (escaped)
   |   } (escaped)
   |   value(ctx) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'decode_continue' --loc 'src/tests/top.mbt:2:28'
Definition found at file <WORKDIR>/src/top.mbt
  | ///| (escaped)
  | pub using @lib { (escaped)
  |   trait Decode, (escaped)
  |   decode, (escaped)
  |   decode_start, (escaped)
6 |   decode_continue, (escaped)
  |   ^^^^^^^^^^^^^^^ (escaped)
  |   type Value, (escaped)
  |   type ContinueValue, (escaped)
  |   type FinishValue, (escaped)
  |   type ParseError, (escaped)
  |   type Reason, (escaped)
  | } (escaped)
Definition found at file <WORKDIR>/src/lib/json.mbt
   |   } (escaped)
   |   value(ctx) (escaped)
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
66 | pub fn decode_continue(cont : String, state : ContinueValue) -> Value raise { (escaped)
   |        ^^^^^^^^^^^^^^^ (escaped)
   |   let input = [..state.rest, ..cont.to_array()] (escaped)
   |   let ctx = Context::{ (escaped)
   |     rest: input[:], (escaped)
   |     original: input, (escaped)
   |     skip: 0, (escaped)
   |     arr_acc: state.arr_acc, (escaped)
   |     obj_acc: state.obj_acc, (escaped)
   |     stack: state.stack, (escaped)
   |     decode: state.decode, (escaped)
   |   } (escaped)
   |   match state.checkpoint { (escaped)
   |     Value | NumberI(_) | NumberD(_) | FloatError(_, _) => value(ctx) (escaped)
   |     ArrayPush(v) => array_push(ctx, v) (escaped)
   |     ObjectKey => object_key(ctx) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'Decode' --loc 'src/top.mbt:3:9'
Definition found at file <WORKDIR>/src/lib/decode.mbt
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
$ run_moon_ide moon ide peek-def 'decode' --loc 'src/top.mbt:4:3'
Definition found at file <WORKDIR>/src/lib/json.mbt
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
