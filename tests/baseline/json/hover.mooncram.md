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
$ run_moon_ide moon ide hover Context --loc 'src/lib/json.mbt:2:13'
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
$ run_moon_ide moon ide hover original --loc 'src/lib/json.mbt:3:3'
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
$ run_moon_ide moon ide hover ParseError --loc 'src/lib/error.mbt:2:14'
///|
pub suberror ParseError {
             ^^^^^^^^^^
             ```moonbit
             suberror ParseError {
               ParseError(Reason)
             } derive(@debug.Debug)
             ```
  ParseError(Reason)
} derive(Debug)
```

```mooncram
$ run_moon_ide moon ide hover ParseError --loc 'src/lib/error.mbt:3:3'
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
$ run_moon_ide moon ide hover Value --loc 'src/lib/value.mbt:2:10'
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
$ run_moon_ide moon ide hover Continue --loc 'src/lib/value.mbt:3:3'
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
$ run_moon_ide moon ide hover JsonArray --loc 'src/lib/decode.mbt:2:10'
No hover information found for symbol 'JsonArray' at src/lib/decode.mbt:2:10
[1]
```

```mooncram
$ run_moon_ide moon ide hover JsonObject --loc 'src/lib/decode.mbt:5:10'
No hover information found for symbol 'JsonObject' at src/lib/decode.mbt:5:10
[1]
```

```mooncram
$ run_moon_ide moon ide hover json --loc 'src/tests/top.mbt:2:7'
No hover information found for symbol 'json' at src/tests/top.mbt:2:7
[1]
```

```mooncram
$ run_moon_ide moon ide hover decode_start --loc 'src/tests/top.mbt:2:14'
///|
using @json {decode_start, decode_continue, type Value}
             ^^^^^^^^^^^^
             ```moonbit
             fn @jinser/json.decode_start(input : String, decode? : &@lib.Decode) -> @lib.Value raise
             ```
```
