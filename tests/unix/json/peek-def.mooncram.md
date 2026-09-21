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
Error: could not get package of loc src/tests/incr.mbt:2:4
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'message' --loc 'src/tests/incr.mbt:2:14'
Error: could not get package of loc src/tests/incr.mbt:2:14
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'json_testsuite_fail' --loc 'src/tests/json_testsuite_helpers_test.mbt:2:4'
Error: could not get package of loc src/tests/json_testsuite_helpers_test.mbt:2:4
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'message' --loc 'src/tests/json_testsuite_helpers_test.mbt:2:24'
Error: could not get package of loc src/tests/json_testsuite_helpers_test.mbt:2:24
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'input' --loc 'src/tests/json_testsuite_n_test.mbt:8:7'
Error: could not get package of loc src/tests/json_testsuite_n_test.mbt:8:7
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'expect_reject' --loc 'src/tests/json_testsuite_n_test.mbt:9:3'
Error: could not get package of loc src/tests/json_testsuite_n_test.mbt:9:3
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'input' --loc 'src/tests/json_testsuite_y_test.mbt:8:7'
Error: could not get package of loc src/tests/json_testsuite_y_test.mbt:8:7
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'expect_accept' --loc 'src/tests/json_testsuite_y_test.mbt:9:3'
Error: could not get package of loc src/tests/json_testsuite_y_test.mbt:9:3
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'actual' --loc 'src/tests/json_value_semantics_test.mbt:3:7'
Error: could not get package of loc src/tests/json_value_semantics_test.mbt:3:7
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'decode' --loc 'src/tests/json_value_semantics_test.mbt:3:22'
Error: could not get package of loc src/tests/json_value_semantics_test.mbt:3:22
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'decode_start' --loc 'src/tests/top.mbt:2:14'
Error: could not get package of loc src/tests/top.mbt:2:14
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'decode_continue' --loc 'src/tests/top.mbt:2:28'
Error: could not get package of loc src/tests/top.mbt:2:28
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'Decode' --loc 'src/top.mbt:3:9'
Error: could not get package of loc src/top.mbt:3:9
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'decode' --loc 'src/top.mbt:4:3'
Error: could not get package of loc src/top.mbt:4:3
[1]
```
