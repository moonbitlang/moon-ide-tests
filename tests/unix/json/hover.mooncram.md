# json hover

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
$ run_moon_ide moon ide hover 'Decode' --loc 'src/lib/decode.mbt:8:11'
pub type JsonObject = Map[String, Json]

///|
pub trait Decode {
          ^^^^^^
          ```moonbit
          trait Decode {
            fn array_start(Self, Array[Json]) -> Array[Json]
            fn array_push(Self, Json, Array[Json]) -> Array[Json]
            fn array_finish(Self, Array[Json], Array[Json]) -> (Array[Json], Array[Json])
            fn object_start(Self, Map[String, Json]) -> Map[String, Json]
            fn object_push(Self, String, Json, Map[String, Json]) -> Map[String, Json]
            fn object_finish(Self, Map[String, Json], Map[String, Json]) -> (Map[String, Json], Map[String, Json])
            fn double(Self, ArrayView[Char]) -> Double raise
            fn integer(Self, ArrayView[Char]) -> Int raise
            fn string(Self, String) -> String
          }
          ```
  array_start(Self, JsonArray) -> JsonArray
  array_push(Self, Json, JsonArray) -> JsonArray
```

```mooncram
$ run_moon_ide moon ide hover 'array_start' --loc 'src/lib/decode.mbt:9:3'
///|
pub trait Decode {
  array_start(Self, JsonArray) -> JsonArray
  ^^^^^^^^^^^
  ```moonbit
  (Self, Array[Json]) -> Array[Json]
  ```
  array_push(Self, Json, JsonArray) -> JsonArray
  array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray)
```

```mooncram
$ run_moon_ide moon ide hover 'Context' --loc 'src/lib/json.mbt:2:13'
///|
priv struct Context {
            ^^^^^^^
            ```moonbit
            struct Context {
              original: Array[Char]
              rest: ArrayView[Char]
              skip: Int
              arr_acc: Array[Json]
              obj_acc: Map[String, Json]
              stack: Array[Frame]
              decode: &Decode
            }
            ```
  original : Array[Char]
  rest : ArrayView[Char]
```

```mooncram
$ run_moon_ide moon ide hover 'original' --loc 'src/lib/json.mbt:3:3'
///|
priv struct Context {
  original : Array[Char]
  ^^^^^^^^
  ```moonbit
  Array[Char]
  ```
  rest : ArrayView[Char]
  skip : Int
```

```mooncram
$ run_moon_ide moon ide hover 'Value' --loc 'src/lib/value.mbt:2:10'
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

```mooncram
$ run_moon_ide moon ide hover 'Continue' --loc 'src/lib/value.mbt:3:3'
///|
pub enum Value {
  Continue(ContinueValue)
  ^^^^^^^^
  ```moonbit
  (ContinueValue) -> Value
  ```
  Finish(FinishValue)
}
```

```mooncram
$ run_moon_ide moon ide hover 'incr_fail' --loc 'src/tests/incr.mbt:2:4'
///|
fn incr_fail(message : String) -> Unit raise {
   ^^^^^^^^^
   ```moonbit
   fn incr_fail(message : String) -> Unit raise
   ```
  raise InspectError::InspectError(message)
}
```

```mooncram
$ run_moon_ide moon ide hover 'message' --loc 'src/tests/incr.mbt:2:14'
///|
fn incr_fail(message : String) -> Unit raise {
             ^^^^^^^
             ```moonbit
             String
             ```
  raise InspectError::InspectError(message)
}
```

```mooncram
$ run_moon_ide moon ide hover 'json_testsuite_fail' --loc 'src/tests/json_testsuite_helpers_test.mbt:2:4'
///|
fn json_testsuite_fail(message : String) -> Unit raise {
   ^^^^^^^^^^^^^^^^^^^
   ```moonbit
   fn json_testsuite_fail(message : String) -> Unit raise
   ```
  raise InspectError::InspectError(message)
}
```

```mooncram
$ run_moon_ide moon ide hover 'message' --loc 'src/tests/json_testsuite_helpers_test.mbt:2:24'
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
$ run_moon_ide moon ide hover 'input' --loc 'src/tests/json_testsuite_n_test.mbt:8:7'
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

```mooncram
$ run_moon_ide moon ide hover 'expect_reject' --loc 'src/tests/json_testsuite_n_test.mbt:9:3'
///|
test "json_testsuite n_array_1_true_without_comma" {
  let input = "[1 true]"
  expect_reject("n_array_1_true_without_comma.json", input)
  ^^^^^^^^^^^^^
  ```moonbit
  fn expect_reject(name : String, input : String) -> Unit raise
  ```
}

```

```mooncram
$ run_moon_ide moon ide hover 'input' --loc 'src/tests/json_testsuite_y_test.mbt:8:7'
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

```mooncram
$ run_moon_ide moon ide hover 'expect_accept' --loc 'src/tests/json_testsuite_y_test.mbt:9:3'
///|
test "json_testsuite y_array_arraysWithSpaces" {
  let input = "[[]   ]"
  expect_accept("y_array_arraysWithSpaces.json", input)
  ^^^^^^^^^^^^^
  ```moonbit
  fn expect_accept(name : String, input : String) -> Unit raise
  ```
}

```

```mooncram
$ run_moon_ide moon ide hover 'actual' --loc 'src/tests/json_value_semantics_test.mbt:3:7'
///|
test "json value semantics basics" {
  let actual = @json.decode("[false,1,\"x\",null,{\"a\":true}]")
      ^^^^^^
      ```moonbit
      Json
      ```
  let expected = Json::array([
    Json::boolean(false),
```

```mooncram
$ run_moon_ide moon ide hover 'decode' --loc 'src/tests/json_value_semantics_test.mbt:3:22'
///|
test "json value semantics basics" {
  let actual = @json.decode("[false,1,\"x\",null,{\"a\":true}]")
               ^^^^^^^^^^^^
               ```moonbit
               fn @jinser/json.decode(input : String, decode? : &@lib.Decode) -> Json raise
               ```
  let expected = Json::array([
    Json::boolean(false),
```

```mooncram
$ run_moon_ide moon ide hover 'decode_start' --loc 'src/tests/top.mbt:2:14'
///|
using @json {decode_start, decode_continue, type Value}
             ^^^^^^^^^^^^
             ```moonbit
             fn @jinser/json.decode_start(input : String, decode? : &@lib.Decode) -> @lib.Value raise
             ```
```

```mooncram
$ run_moon_ide moon ide hover 'decode_continue' --loc 'src/tests/top.mbt:2:28'
///|
using @json {decode_start, decode_continue, type Value}
                           ^^^^^^^^^^^^^^^
                           ```moonbit
                           fn @jinser/json.decode_continue(cont : String, state : @lib.ContinueValue) -> @lib.Value raise
                           ```
```

```mooncram
$ run_moon_ide moon ide hover 'Decode' --loc 'src/top.mbt:3:9'
No hover information found for symbol 'Decode' at src/top.mbt:3:9
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'decode' --loc 'src/top.mbt:4:3'
///|
pub using @lib {
  trait Decode,
  decode,
  ^^^^^^
  ```moonbit
  fn @jinser/json/lib.decode(input : String, decode? : &@lib.Decode) -> Json raise
  ```
  decode_start,
  decode_continue,
```
