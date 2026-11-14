# json hover

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'Decode' --loc 'src\lib\decode.mbt:8:11'
pub type JsonObject = Map[String, Json]

///|
pub trait Decode {
          ^^^^^^
          ```moonbit
          trait Decode {
            fn array_start(Self, Array[@json.Json]) -> Array[@json.Json]
            fn array_push(Self, @json.Json, Array[@json.Json]) -> Array[@json.Json]
            fn array_finish(Self, Array[@json.Json], Array[@json.Json]) -> (Array[@json.Json], Array[@json.Json])
            fn object_start(Self, Map[String, @json.Json]) -> Map[String, @json.Json]
            fn object_push(Self, String, @json.Json, Map[String, @json.Json]) -> Map[String, @json.Json]
            fn object_finish(Self, Map[String, @json.Json], Map[String, @json.Json]) -> (Map[String, @json.Json], Map[String, @json.Json])
            fn double(Self, ArrayView[Char]) -> Double raise
            fn integer(Self, ArrayView[Char]) -> Int raise
            fn string(Self, String) -> String
          }
          ```
  fn array_start(Self, JsonArray) -> JsonArray
  fn array_push(Self, Json, JsonArray) -> JsonArray
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'array_start' --loc 'src\lib\decode.mbt:9:6'
///|
pub trait Decode {
  fn array_start(Self, JsonArray) -> JsonArray
     ^^^^^^^^^^^
     ```moonbit
     (Self, Array[@json.Json]) -> Array[@json.Json]
     ```
  fn array_push(Self, Json, JsonArray) -> JsonArray
  fn array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray)
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'Context' --loc 'src\lib\json.mbt:2:13'
///|
priv struct Context {
            ^^^^^^^
            ```moonbit
            struct Context {
              original: Array[Char]
              rest: ArrayView[Char]
              skip: Int
              arr_acc: Array[@json.Json]
              obj_acc: Map[String, @json.Json]
              stack: Array[Frame]
              decode: &Decode
            }
            ```
  original : Array[Char]
  rest : ArrayView[Char]
```

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'original' --loc 'src\lib\json.mbt:3:3'
///|
priv struct Context {
  original : Array[Char]
  ^^^^^^^^
  ```moonbit
  Array[Char]
  ```
  rest : ArrayView[Char]
  skip : Int32
````

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'Value' --loc 'src\lib\value.mbt:2:10'
///|
pub enum Value {
         ^^^^^
         ```moonbit
         enum Value {
           Continue(ContinueValue)
           Finish(FinishValue)
         }
         ```
  Continue(ContinueValue)
  Finish(FinishValue)
```

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'Continue' --loc 'src\lib\value.mbt:3:3'
///|
pub enum Value {
  Continue(ContinueValue)
  ^^^^^^^^
  ```moonbit
  (ContinueValue) -> Value
  ```
  Finish(FinishValue)
}
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'incr_fail' --loc 'src\tests\incr.mbt:2:4'
///|
fn incr_fail(message : String) -> Unit raise {
   ^^^^^^^^^
   ```moonbit
   fn incr_fail(message : String) -> Unit raise
   ```
  raise InspectError::InspectError(message)
}
````

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'message' --loc 'src\tests\incr.mbt:2:14'
///|
fn incr_fail(message : String) -> Unit raise {
             ^^^^^^^
             ```moonbit
             String
             ```
  raise InspectError::InspectError(message)
}
```

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'json_testsuite_fail' --loc 'src\tests\json_testsuite_helpers_test.mbt:2:4'
///|
fn json_testsuite_fail(message : String) -> Unit raise {
   ^^^^^^^^^^^^^^^^^^^
   ```moonbit
   fn json_testsuite_fail(message : String) -> Unit raise
   ```
  raise InspectError::InspectError(message)
}
````

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'message' --loc 'src\tests\json_testsuite_helpers_test.mbt:2:24'
///|
fn json_testsuite_fail(message : String) -> Unit raise {
                       ^^^^^^^
                       ```moonbit
                       String
                       ```
  raise InspectError::InspectError(message)
}
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'input' --loc 'src\tests\json_testsuite_n_test.mbt:8:7'
///|
test "json_testsuite n_array_1_true_without_comma" {
  let input = "[1 true]"
      ^^^^^
      ```moonbit
      String
      ```
  expect_reject("n_array_1_true_without_comma.json", input)
}
```

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'expect_reject' --loc 'src\tests\json_testsuite_n_test.mbt:9:3'
///|
test "json_testsuite n_array_1_true_without_comma" {
  let input = "[1 true]"
  expect_reject("n_array_1_true_without_comma.json", input)
  ^^^^^^^^^^^^^
  ```moonbit
  fn expect_reject(name : String, input : String) -> Unit raise
  ```
}
"" (escaped)
````

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'input' --loc 'src\tests\json_testsuite_y_test.mbt:8:7'
///|
test "json_testsuite y_array_arraysWithSpaces" {
  let input = "[[]   ]"
      ^^^^^
      ```moonbit
      String
      ```
  expect_accept("y_array_arraysWithSpaces.json", input)
}
```

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'expect_accept' --loc 'src\tests\json_testsuite_y_test.mbt:9:3'
///|
test "json_testsuite y_array_arraysWithSpaces" {
  let input = "[[]   ]"
  expect_accept("y_array_arraysWithSpaces.json", input)
  ^^^^^^^^^^^^^
  ```moonbit
  fn expect_accept(name : String, input : String) -> Unit raise
  ```
}
"" (escaped)
````

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'actual' --loc 'src\tests\json_value_semantics_test.mbt:3:7'
///|
test "json value semantics basics" {
  let actual = @json.decode("[false,1,\"x\",null,{\"a\":true}]")
      ^^^^^^
      ```moonbit
      @moonbitlang/core/json.Json
      ```
  let expected = Json::array([
    Json::boolean(false),
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'decode' --loc 'src\tests\json_value_semantics_test.mbt:3:22'
///|
test "json value semantics basics" {
  let actual = @json.decode("[false,1,\"x\",null,{\"a\":true}]")
               ^^^^^^^^^^^^
               ```moonbit
               fn @jinser/json.decode(input : String, decode? : &@lib.Decode) -> @moonbitlang/core/json.Json raise
               ```
  let expected = Json::array([
    Json::boolean(false),
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'decode_start' --loc 'src\tests\top.mbt:2:14'
///|
using @json {decode_start, decode_continue, type Value}
             ^^^^^^^^^^^^
             ```moonbit
             fn @jinser/json.decode_start(input : String, decode? : &@lib.Decode) -> @lib.Value raise
             ```
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'decode_continue' --loc 'src\tests\top.mbt:2:28'
///|
using @json {decode_start, decode_continue, type Value}
                           ^^^^^^^^^^^^^^^
                           ```moonbit
                           fn @jinser/json.decode_continue(cont : String, state : @lib.ContinueValue) -> @lib.Value raise
                           ```
```

Known IDE limitation: hover on the trait imported by using reports no information; its declaration hover and imported-name peek-def work.

<!-- known-ide-limitation: using-trait-hover -->
```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'Decode' --loc 'src\top.mbt:3:9'
No hover information found for symbol 'Decode' at src\top.mbt:3:9
[1]
```

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'decode' --loc 'src\top.mbt:4:3'
///|
pub using @lib {
  trait Decode,
  decode,
  ^^^^^^
  ```moonbit
  fn @jinser/json/lib.decode(input : String, decode? : &@lib.Decode) -> @json.Json raise
  ```
  decode_start,
  decode_continue,
````
