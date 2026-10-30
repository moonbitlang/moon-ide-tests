# json find-references Value src/lib/value.mbt:2:10

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
$ run_moon_ide moon ide find-references 'Value' --loc 'src/lib/value.mbt:2:10'
Found 32 references for symbol 'Value':
<WORKDIR>/src/lib/json.mbt:46:59-46:64:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
46 | pub fn decode_start(input : String, decode? : &Decode) -> Value raise {
   |                                                           ^^^^^ (escaped)
   |   let decode : &Decode = match decode { (escaped)
   |     Some(decode) => decode (escaped)

<WORKDIR>/src/lib/json.mbt:64:65-64:70:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
64 | pub fn decode_continue(cont : String, state : ContinueValue) -> Value raise {
   |                                                                 ^^^^^ (escaped)
   |   let input = [..state.rest, ..cont.to_array()] (escaped)
   |   let ctx = Context::{ (escaped)

<WORKDIR>/src/lib/json.mbt:85:28-85:33:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
85 | fn value(ctx : Context) -> Value raise {
   |                            ^^^^^ (escaped)
   |   match ctx.rest { (escaped)
   |     // skip whitespace (escaped)

<WORKDIR>/src/lib/json.mbt:106:47-106:52:
    | // number {{{ (escaped)
    |  (escaped)
    | ///| (escaped)
106 | fn number_zero(ctx : Context, len : Int32) -> Value raise {
    |                                               ^^^^^
    |   let { original, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:128:42-128:47:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
128 | fn number(ctx : Context, len : Int32) -> Value raise {
    |                                          ^^^^^
    |   let { original, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:151:47-151:52:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
151 | fn number_frac(ctx : Context, len : Int32) -> Value raise {
    |                                               ^^^^^
    |   match ctx.rest { (escaped)
    |     ['0'..<='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1)

<WORKDIR>/src/lib/json.mbt:159:52-159:57:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
159 | fn number_frac_cont(ctx : Context, len : Int32) -> Value raise {
    |                                                    ^^^^^
    |   let { original, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:176:6-176:11:
    |   ctx : Context, (escaped)
    |   len : Int32,
    |   token : ArrayView[Char], (escaped)
176 | ) -> Value raise {
    |      ^^^^^ (escaped)
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:195:46-195:51:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
195 | fn number_exp(ctx : Context, len : Int32) -> Value raise {
    |                                              ^^^^^
    |   match ctx.rest { (escaped)
    |     ['0'..<='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1)

<WORKDIR>/src/lib/json.mbt:204:51-204:56:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
204 | fn number_exp_sign(ctx : Context, len : Int32) -> Value raise {
    |                                                   ^^^^^
    |   match ctx.rest {
    |     ['0'..<='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1)

<WORKDIR>/src/lib/json.mbt:212:51-212:56:
    | }
    | 
    | ///|
212 | fn number_exp_cont(ctx : Context, len : Int32) -> Value raise {
    |                                                   ^^^^^
    |   let { original, skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src/lib/json.mbt:224:35-224:40:
    | }
    | 
    | ///|
224 | fn number_minus(ctx : Context) -> Value raise {
    |                                   ^^^^^
    |   match ctx.rest {
    |     ['0', .. rest] => number_zero({ ..ctx, rest, }, 2)

<WORKDIR>/src/lib/json.mbt:246:28-246:33:
    | // constants {{{
    | 
    | ///|
246 | fn true_(ctx : Context) -> Value raise {
    |                            ^^^^^
    |   match ctx.rest {
    |     ['r', 'u', 'e', .. rest] =>

<WORKDIR>/src/lib/json.mbt:255:29-255:34:
    | }
    | 
    | ///|
255 | fn false_(ctx : Context) -> Value raise {
    |                             ^^^^^
    |   match ctx.rest {
    |     ['a', 'l', 's', 'e', .. rest] =>

<WORKDIR>/src/lib/json.mbt:264:27-264:32:
    | }
    | 
    | ///|
264 | fn null(ctx : Context) -> Value raise {
    |                           ^^^^^
    |   match ctx.rest {
    |     ['u', 'l', 'l', .. rest] =>

<WORKDIR>/src/lib/json.mbt:277:42-277:47:
    | // string {{{
    | 
    | ///|
277 | fn string(ctx : Context, len : Int32) -> Value raise {
    |                                          ^^^^^
    |   let builder = StringBuilder(size_hint=len)
    |   string_scan(ctx, len, builder)

<WORKDIR>/src/lib/json.mbt:287:6-287:11:
    |   ctx : Context,
    |   len : Int32,
    |   builder : StringBuilder,
287 | ) -> Value raise {
    |      ^^^^^
    |   let { skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src/lib/json.mbt:312:6-312:11:
    |   ctx : Context,
    |   len : Int32,
    |   builder : StringBuilder,
312 | ) -> Value raise {
    |      ^^^^^
    |   match ctx.rest {
    |     ['"', .. rest] => {

<WORKDIR>/src/lib/json.mbt:365:6-365:11:
    |   code_unit : Int32,
    |   rest : ArrayView[Char],
    |   builder : StringBuilder,
365 | ) -> Value raise {
    |      ^^^^^
    |   if code_unit.is_leading_surrogate() {
    |     match rest {

<WORKDIR>/src/lib/json.mbt:448:47-448:52:
    | // array {{{
    | 
    | ///|
448 | fn array_start(ctx : Context, len : Int32) -> Value raise {
    |                                               ^^^^^
    |   let { decode, skip, arr_acc, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src/lib/json.mbt:473:48-473:53:
    | }
    | 
    | ///|
473 | fn array_push(ctx : Context, value0 : Json) -> Value raise {
    |                                                ^^^^^
    |   let { skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src/lib/json.mbt:500:48-500:53:
    | // object {{{
    | 
    | ///|
500 | fn object_start(ctx : Context, len : Int32) -> Value raise {
    |                                                ^^^^^
    |   let { obj_acc, skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src/lib/json.mbt:532:49-532:54:
    | }
    | 
    | ///|
532 | fn object_value(ctx : Context, key : String) -> Value raise {
    |                                                 ^^^^^ (escaped)
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:546:63-546:68:
    | }
    | 
    | ///|
546 | fn object_push(ctx : Context, value0 : Json, key : String) -> Value raise {
    |                                                               ^^^^^
    |   let { skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src/lib/json.mbt:569:33-569:38:
    | }
    | 
    | ///|
569 | fn object_key(ctx : Context) -> Value raise {
    |                                 ^^^^^
    |   let { skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src/lib/json.mbt:582:46-582:51:
    | // }}}
    | 
    | ///|
582 | fn continue_(ctx : Context, value : Json) -> Value raise {
    |                                              ^^^^^
    |   match ctx.stack.last() {
    |     None => terminate(ctx, value)

<WORKDIR>/src/lib/json.mbt:598:46-598:51:
    | }
    | 
    | ///|
598 | fn terminate(ctx : Context, value : Json) -> Value raise {
    |                                              ^^^^^
    |   let { rest, original, skip, arr_acc, obj_acc, .. } = ctx
    |   match rest {

<WORKDIR>/src/lib/json.mbt:603:11-603:16:
    |   match rest {
    |     // skip whitespace
    |     [' ' | '\n' | '\r' | '\t', .. rest] => terminate({ ..ctx, rest, }, value)
603 |     [] => Value::Finish({ value, arr_acc, obj_acc, rest: [][:], })
    |           ^^^^^
    |     _ => {
    |       let rest = original[skip:]

<WORKDIR>/src/lib/json.mbt:606:7-606:12:
    |     [] => Value::Finish({ value, arr_acc, obj_acc, rest: [][:], })
    |     _ => {
    |       let rest = original[skip:]
606 |       Value::Finish({ value, arr_acc, obj_acc, rest, })
    |       ^^^^^
    |     }
    |   }

<WORKDIR>/src/lib/json.mbt:617:6-617:11:
    |   pos : Int32,
    |   len : Int32,
    |   func_data : Checkpoint,
617 | ) -> Value raise {
    |      ^^^^^ (escaped)
    |   let { original, arr_acc, obj_acc, skip, stack, decode, .. } = ctx (escaped)
    |   let required_size = skip + pos + len (escaped)

<WORKDIR>/src/lib/json.mbt:623:5-623:10:
    |   let original_size = original.length() (escaped)
    |   if original_size <= required_size { (escaped)
    |     let rest = original[skip:] (escaped)
623 |     Value::Continue(ContinueValue::{
    |     ^^^^^ (escaped)
    |       rest, (escaped)
    |       arr_acc, (escaped)

<WORKDIR>/src/top.mbt:7:8-7:13:
  |   decode,
  |   decode_start,
  |   decode_continue,
7 |   type Value,
  |        ^^^^^
  |   type ContinueValue,
  |   type FinishValue,

```
