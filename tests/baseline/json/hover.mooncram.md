# json hover

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$PWD"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
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
$ run_moon_ide moon ide hover 'rest' --loc 'src/lib/json.mbt:4:3'
///|
priv struct Context {
  original : Array[Char]
  rest : ArrayView[Char]
  ^^^^
  ```moonbit
  ArrayView[Char]
  ```
  skip : Int
  arr_acc : Array[Json]
```

```mooncram
$ run_moon_ide moon ide hover 'ParseError' --loc 'src/lib/error.mbt:3:3'
///|
pub suberror ParseError {
  ParseError(Reason)
  ^^^^^^^^^^
  ```moonbit
  (Reason) -> ParseError
  ```
} derive(Debug)

```

```mooncram
$ run_moon_ide moon ide hover 'Reason' --loc 'src/lib/error.mbt:3:14'
///|
pub suberror ParseError {
  ParseError(Reason)
             ^^^^^^
             ```moonbit
             enum Reason {
               InvalidByte(Int, Char)
               UnexpectedEnd(Checkpoint)
               UnexpectedSequence(Array[Char], Int)
             } derive(@debug.Debug)
             ```
} derive(Debug)

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
$ run_moon_ide moon ide hover 'ContinueValue' --loc 'src/lib/value.mbt:3:12'
///|
pub enum Value {
  Continue(ContinueValue)
           ^^^^^^^^^^^^^
           ```moonbit
           struct ContinueValue {
             rest: ArrayView[Char]
             arr_acc: Array[Json]
             obj_acc: Map[String, Json]
             stack: Array[Frame]
             decode: &Decode
             checkpoint: Checkpoint
           }
           ```
  Finish(FinishValue)
}
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
