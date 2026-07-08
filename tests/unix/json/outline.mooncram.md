# json outline

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
$ run_moon_ide moon ide outline 'src/lib/json.mbt'
  2 |priv struct Context {
    |...
 13 |enum Frame {
    |...
 20 |pub fn decode(input : String, decode? : &Decode) -> Json raise {
    |...
 48 |pub fn decode_start(input : String, decode? : &Decode) -> Value raise {
    |...
 66 |pub fn decode_continue(cont : String, state : ContinueValue) -> Value raise {
    |...
 87 |fn value(ctx : Context) -> Value raise {
    |...
108 |fn number_zero(ctx : Context, len : Int) -> Value raise {
    |...
130 |fn number(ctx : Context, len : Int) -> Value raise {
    |...
153 |fn number_frac(ctx : Context, len : Int) -> Value raise {
    |...
161 |fn number_frac_cont(ctx : Context, len : Int) -> Value raise {
    |...
174 |fn float_decode(
175 |  ctx : Context,
176 |  len : Int,
177 |  token : ArrayView[Char],
178 |) -> Value raise {
    |...
197 |fn number_exp(ctx : Context, len : Int) -> Value raise {
    |...
206 |fn number_exp_sign(ctx : Context, len : Int) -> Value raise {
    |...
214 |fn number_exp_cont(ctx : Context, len : Int) -> Value raise {
    |...
226 |fn number_minus(ctx : Context) -> Value raise {
    |...
235 |fn integer_decode(ctx : Context, token : ArrayView[Char]) -> Int raise {
    |...
248 |fn true_(ctx : Context) -> Value raise {
    |...
257 |fn false_(ctx : Context) -> Value raise {
    |...
266 |fn null(ctx : Context) -> Value raise {
    |...
279 |fn string(ctx : Context, len : Int) -> Value raise {
    |...
285 |fn string_scan(
286 |  ctx : Context,
287 |  len : Int,
288 |  builder : StringBuilder,
289 |) -> Value raise {
    |...
310 |fn string_escape(
311 |  ctx : Context,
312 |  len : Int,
313 |  builder : StringBuilder,
314 |) -> Value raise {
    |...
361 |fn string_unicode(
362 |  ctx : Context,
363 |  len : Int,
364 |  code_unit : Int,
365 |  rest : ArrayView[Char],
366 |  builder : StringBuilder,
367 |) -> Value raise {
    |...
407 |fn unicode_escape_value(
408 |  ctx : Context,
409 |  len : Int,
410 |  a : Char,
411 |  b : Char,
412 |  c : Char,
413 |  d : Char,
414 |) -> Int raise {
    |...
423 |fn hex_value(ctx : Context, index : Int, c : Char) -> Int raise {
    |...
433 |fn write_codepoint(
434 |  ctx : Context,
435 |  index : Int,
436 |  codepoint : Int,
437 |  builder : StringBuilder,
438 |) -> Unit raise {
    |...
450 |fn array_start(ctx : Context, len : Int) -> Value raise {
    |...
475 |fn array_push(ctx : Context, value0 : Json) -> Value raise {
    |...
502 |fn object_start(ctx : Context, len : Int) -> Value raise {
    |...
534 |fn object_value(ctx : Context, key : String) -> Value raise {
    |...
548 |fn object_push(ctx : Context, value0 : Json, key : String) -> Value raise {
    |...
571 |fn object_key(ctx : Context) -> Value raise {
    |...
584 |fn continue_(ctx : Context, value : Json) -> Value raise {
    |...
600 |fn terminate(ctx : Context, value : Json) -> Value raise {
    |...
614 |fn unexpected(
615 |  ctx : Context,
616 |  pos : Int,
617 |  len : Int,
618 |  func_data : Checkpoint,
619 |) -> Value raise {
    |...
639 |fn invalid_byte(arr : Array[Char], skip : Int) -> ParseError {
    |...

```

```mooncram
$ run_moon_ide moon ide outline 'src/lib/error.mbt'
2 |pub suberror ParseError {
  |...
7 |pub enum Reason {
  |...

```

```mooncram
$ run_moon_ide moon ide outline 'src/lib/value.mbt'
 2 |pub enum Value {
   |...
 8 |pub struct ContinueValue {
   |...
18 |pub struct FinishValue {
   |...
26 |enum Checkpoint {
   |...

```

```mooncram
$ run_moon_ide moon ide outline 'src/lib/decode.mbt'
 2 |pub type JsonArray = Array[Json]
   |...
 5 |pub type JsonObject = Map[String, Json]
   |...
 8 |pub trait Decode {
   |...
21 |impl Decode for Unit with array_start(_self, _old_acc) -> JsonArray {
   |...
26 |impl Decode for Unit with array_push(_self, elem, acc) {
   |...
31 |impl Decode for Unit with array_finish(_self, acc, old_acc) {
   |...
36 |impl Decode for Unit with object_start(_self, _old_acc) -> JsonObject {
   |...
41 |impl Decode for Unit with object_push(_self, key, value, acc) {
   |...
49 |impl Decode for Unit with object_finish(_self, acc, old_acc) {
   |...
54 |impl Decode for Unit with double(_self, view) -> Double raise {
   |...
59 |impl Decode for Unit with integer(_self, view) -> Int raise {
   |...
64 |impl Decode for Unit with string(_self, s) {
   |...

```

```mooncram
$ run_moon_ide moon ide outline 'src/tests/top.mbt'
2 |using @json {decode_start, decode_continue, type Value}
  |...

```
