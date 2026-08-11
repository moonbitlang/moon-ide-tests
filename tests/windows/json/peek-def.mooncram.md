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
Error: could not get package of loc src\tests\incr.mbt:2:4
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'message' --loc 'src\tests\incr.mbt:2:14'
Error: could not get package of loc src\tests\incr.mbt:2:14
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'json_testsuite_fail' --loc 'src\tests\json_testsuite_helpers_test.mbt:2:4'
Error: could not get package of loc src\tests\json_testsuite_helpers_test.mbt:2:4
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'message' --loc 'src\tests\json_testsuite_helpers_test.mbt:2:24'
Error: could not get package of loc src\tests\json_testsuite_helpers_test.mbt:2:24
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'input' --loc 'src\tests\json_testsuite_n_test.mbt:8:7'
Error: could not get package of loc src\tests\json_testsuite_n_test.mbt:8:7
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'expect_reject' --loc 'src\tests\json_testsuite_n_test.mbt:9:3'
Error: could not get package of loc src\tests\json_testsuite_n_test.mbt:9:3
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'input' --loc 'src\tests\json_testsuite_y_test.mbt:8:7'
Error: could not get package of loc src\tests\json_testsuite_y_test.mbt:8:7
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'expect_accept' --loc 'src\tests\json_testsuite_y_test.mbt:9:3'
Error: could not get package of loc src\tests\json_testsuite_y_test.mbt:9:3
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'actual' --loc 'src\tests\json_value_semantics_test.mbt:3:7'
Error: could not get package of loc src\tests\json_value_semantics_test.mbt:3:7
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'decode' --loc 'src\tests\json_value_semantics_test.mbt:3:22'
Error: could not get package of loc src\tests\json_value_semantics_test.mbt:3:22
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'decode_start' --loc 'src\tests\top.mbt:2:14'
Error: could not get package of loc src\tests\top.mbt:2:14
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'decode_continue' --loc 'src\tests\top.mbt:2:28'
Error: could not get package of loc src\tests\top.mbt:2:28
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'Decode' --loc 'src\top.mbt:3:9'
Error: could not get package of loc src\top.mbt:3:9
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide peek-def 'decode' --loc 'src\top.mbt:4:3'
Error: could not get package of loc src\top.mbt:4:3
[1]
```
