# json outline

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
$ run_moon_ide moon ide outline 'src/lib/json.mbt'
 L002 | priv struct Context {
        ...
 L013 | enum Frame {
        ...
 L020 | pub fn decode(input : String, decode? : &Decode) -> Json raise {
        ...
 L048 | pub fn decode_start(input : String, decode? : &Decode) -> Value raise {
        ...
 L066 | pub fn decode_continue(cont : String, state : ContinueValue) -> Value raise {
        ...
 L087 | fn value(ctx : Context) -> Value raise {
        ...
 L108 | fn number_zero(ctx : Context, len : Int) -> Value raise {
        ...
 L130 | fn number(ctx : Context, len : Int) -> Value raise {
        ...
 L153 | fn number_frac(ctx : Context, len : Int) -> Value raise {
        ...
 L161 | fn number_frac_cont(ctx : Context, len : Int) -> Value raise {
        ...
 L174 | fn float_decode(
 L175 |   ctx : Context,
 L176 |   len : Int,
 L177 |   token : ArrayView[Char],
 L178 | ) -> Value raise {
        ...
 L197 | fn number_exp(ctx : Context, len : Int) -> Value raise {
        ...
 L206 | fn number_exp_sign(ctx : Context, len : Int) -> Value raise {
        ...
 L214 | fn number_exp_cont(ctx : Context, len : Int) -> Value raise {
        ...
 L226 | fn number_minus(ctx : Context) -> Value raise {
        ...
 L235 | fn integer_decode(ctx : Context, token : ArrayView[Char]) -> Int raise {
        ...
 L248 | fn true_(ctx : Context) -> Value raise {
        ...
 L257 | fn false_(ctx : Context) -> Value raise {
        ...
 L266 | fn null(ctx : Context) -> Value raise {
        ...
 L279 | fn string(ctx : Context, len : Int) -> Value raise {
        ...
 L285 | fn string_scan(
 L286 |   ctx : Context,
 L287 |   len : Int,
 L288 |   builder : StringBuilder,
 L289 | ) -> Value raise {
        ...
 L310 | fn string_escape(
 L311 |   ctx : Context,
 L312 |   len : Int,
 L313 |   builder : StringBuilder,
 L314 | ) -> Value raise {
        ...
 L361 | fn string_unicode(
 L362 |   ctx : Context,
 L363 |   len : Int,
 L364 |   code_unit : Int,
 L365 |   rest : ArrayView[Char],
 L366 |   builder : StringBuilder,
 L367 | ) -> Value raise {
        ...
 L407 | fn unicode_escape_value(
 L408 |   ctx : Context,
 L409 |   len : Int,
 L410 |   a : Char,
 L411 |   b : Char,
 L412 |   c : Char,
 L413 |   d : Char,
 L414 | ) -> Int raise {
        ...
 L423 | fn hex_value(ctx : Context, index : Int, c : Char) -> Int raise {
        ...
 L433 | fn write_codepoint(
 L434 |   ctx : Context,
 L435 |   index : Int,
 L436 |   codepoint : Int,
 L437 |   builder : StringBuilder,
 L438 | ) -> Unit raise {
        ...
 L450 | fn array_start(ctx : Context, len : Int) -> Value raise {
        ...
 L475 | fn array_push(ctx : Context, value0 : Json) -> Value raise {
        ...
 L502 | fn object_start(ctx : Context, len : Int) -> Value raise {
        ...
 L534 | fn object_value(ctx : Context, key : String) -> Value raise {
        ...
 L548 | fn object_push(ctx : Context, value0 : Json, key : String) -> Value raise {
        ...
 L571 | fn object_key(ctx : Context) -> Value raise {
        ...
 L584 | fn continue_(ctx : Context, value : Json) -> Value raise {
        ...
 L600 | fn terminate(ctx : Context, value : Json) -> Value raise {
        ...
 L614 | fn unexpected(
 L615 |   ctx : Context,
 L616 |   pos : Int,
 L617 |   len : Int,
 L618 |   func_data : Checkpoint,
 L619 | ) -> Value raise {
        ...
 L639 | fn invalid_byte(arr : Array[Char], skip : Int) -> ParseError {
        ...

```

```mooncram
$ run_moon_ide moon ide outline 'src/lib/error.mbt'
 L2 | pub suberror ParseError {
      ...
 L7 | pub enum Reason {
      ...

```

```mooncram
$ run_moon_ide moon ide outline 'src/lib/value.mbt'
 L02 | pub enum Value {
       ...
 L08 | pub struct ContinueValue {
       ...
 L18 | pub struct FinishValue {
       ...
 L26 | enum Checkpoint {
       ...

```

```mooncram
$ run_moon_ide moon ide outline 'src/lib/decode.mbt'
 L02 | pub type JsonArray = Array[Json]
       ...
 L05 | pub type JsonObject = Map[String, Json]
       ...
 L08 | pub trait Decode {
       ...
 L21 | impl Decode for Unit with array_start(_self, _old_acc) -> JsonArray {
       ...
 L26 | impl Decode for Unit with array_push(_self, elem, acc) {
       ...
 L31 | impl Decode for Unit with array_finish(_self, acc, old_acc) {
       ...
 L36 | impl Decode for Unit with object_start(_self, _old_acc) -> JsonObject {
       ...
 L41 | impl Decode for Unit with object_push(_self, key, value, acc) {
       ...
 L49 | impl Decode for Unit with object_finish(_self, acc, old_acc) {
       ...
 L54 | impl Decode for Unit with double(_self, view) -> Double raise {
       ...
 L59 | impl Decode for Unit with integer(_self, view) -> Int raise {
       ...
 L64 | impl Decode for Unit with string(_self, s) {
       ...

```

```mooncram
$ run_moon_ide moon ide outline 'src/tests/top.mbt'
 L2 | using @json {decode_start, decode_continue, type Value}
      ...

```
