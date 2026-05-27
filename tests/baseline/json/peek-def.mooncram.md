# json peek-def

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
$ run_moon_ide moon ide peek-def 'rest' --loc 'src/lib/json.mbt:4:3'
Definition found at file <WORKDIR>/src/lib/json.mbt
  | ///| (escaped)
  | priv struct Context { (escaped)
  |   original : Array[Char] (escaped)
4 |   rest : ArrayView[Char] (escaped)
  |   ^^^^ (escaped)
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
  |  (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'ParseError' --loc 'src/lib/error.mbt:3:3'
Definition found at file <WORKDIR>/src/lib/error.mbt
  | ///| (escaped)
  | pub suberror ParseError { (escaped)
3 |   ParseError(Reason) (escaped)
  |   ^^^^^^^^^^ (escaped)
  | } derive(Debug) (escaped)
  |  (escaped)
  | ///| (escaped)
  | pub enum Reason { (escaped)
  |   InvalidByte(Int, Char) (escaped)
  |   UnexpectedEnd(Checkpoint) (escaped)
  |   UnexpectedSequence(Array[Char], Int) (escaped)
  | } derive(Debug) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'Reason' --loc 'src/lib/error.mbt:3:14'
Definition found at file <WORKDIR>/src/lib/error.mbt
  | pub suberror ParseError { (escaped)
  |   ParseError(Reason) (escaped)
  | } derive(Debug) (escaped)
  |  (escaped)
  | ///| (escaped)
7 | pub enum Reason { (escaped)
  |          ^^^^^^ (escaped)
  |   InvalidByte(Int, Char) (escaped)
  |   UnexpectedEnd(Checkpoint) (escaped)
  |   UnexpectedSequence(Array[Char], Int) (escaped)
  | } derive(Debug) (escaped)
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
$ run_moon_ide moon ide peek-def 'ContinueValue' --loc 'src/lib/value.mbt:3:12'
Definition found at file <WORKDIR>/src/lib/value.mbt
  |   Continue(ContinueValue) (escaped)
  |   Finish(FinishValue) (escaped)
  | } (escaped)
  |  (escaped)
  | ///| (escaped)
8 | pub struct ContinueValue { (escaped)
  |            ^^^^^^^^^^^^^ (escaped)
  |   rest : ArrayView[Char] (escaped)
  |   arr_acc : JsonArray (escaped)
  |   obj_acc : JsonObject (escaped)
  |   stack : Array[Frame] (escaped)
  |   decode : &Decode (escaped)
  |   checkpoint : Checkpoint (escaped)
  | } (escaped)
  |  (escaped)
  | ///| (escaped)
  | pub struct FinishValue { (escaped)
  |   value : Json (escaped)
  |   arr_acc : JsonArray (escaped)
  |   obj_acc : JsonObject (escaped)
  |   rest : ArrayView[Char] (escaped)
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
$ run_moon_ide moon ide peek-def 'Frame' --loc 'src/lib/json.mbt:13:6'
Definition found at file <WORKDIR>/src/lib/json.mbt
   |   stack : Array[Frame] (escaped)
   |   decode : &Decode (escaped)
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
13 | enum Frame { (escaped)
   |      ^^^^^ (escaped)
   |   Array(Array[Json]) (escaped)
   |   Map(Map[String, Json]) (escaped)
   |   Key(String) (escaped)
   | } derive(Debug) (escaped)
   |  (escaped)
   | ///| (escaped)
   | pub fn decode(input : String, decode? : &Decode) -> Json raise { (escaped)
   |   let decode : &Decode = match decode { (escaped)
   |     Some(decode) => decode (escaped)
   |     None => () (escaped)
   |   } (escaped)
   |   let ctx = Context::{ (escaped)
   |     rest: input.to_array()[:], (escaped)
   |     original: input.to_array(), (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'decode' --loc 'src/lib/json.mbt:20:8'
Definition found at file <WORKDIR>/src/lib/json.mbt
   |   Map(Map[String, Json]) (escaped)
   |   Key(String) (escaped)
   | } derive(Debug) (escaped)
   |  (escaped)
   | ///| (escaped)
20 | pub fn decode(input : String, decode? : &Decode) -> Json raise { (escaped)
   |        ^^^^^^ (escaped)
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
   |   match value(ctx) { (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'decode_start' --loc 'src/lib/json.mbt:48:8'
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
$ run_moon_ide moon ide peek-def 'decode_continue' --loc 'src/lib/json.mbt:66:8'
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
$ run_moon_ide moon ide peek-def 'value' --loc 'src/lib/json.mbt:87:4'
Definition found at file <WORKDIR>/src/lib/json.mbt
   |     ObjectPush((value, key)) => object_push(ctx, value, key) (escaped)
   |   } (escaped)
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
87 | fn value(ctx : Context) -> Value raise { (escaped)
   |    ^^^^^ (escaped)
   |   match ctx.rest { (escaped)
   |     // skip whitespace (escaped)
   |     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
   |       value({ ..ctx, rest, skip: ctx.skip + 1 }) (escaped)
   |     ['0', .. rest] => number_zero({ ..ctx, rest, }, 1) (escaped)
   |     ['1'..='9', .. rest] => number({ ..ctx, rest, }, 1) (escaped)
   |     ['-', .. rest] => number_minus({ ..ctx, rest, }) (escaped)
   |     ['t', .. rest] => true_({ ..ctx, rest, }) (escaped)
   |     ['f', .. rest] => false_({ ..ctx, rest, }) (escaped)
   |     ['n', .. rest] => null({ ..ctx, rest, }) (escaped)
   |     ['"', .. rest] => string({ ..ctx, rest, skip: ctx.skip + 1 }, 0) (escaped)
   |     ['[', .. rest] => array_start({ ..ctx, rest, }, 1) (escaped)
   |     ['{', .. rest] => object_start({ ..ctx, rest, }, 1) (escaped)
   |     _ => unexpected(ctx, 0, 0, Checkpoint::Value) (escaped)
```
