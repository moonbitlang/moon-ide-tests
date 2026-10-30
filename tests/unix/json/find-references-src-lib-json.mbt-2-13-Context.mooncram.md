# json find-references Context src/lib/json.mbt:2:13

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
$ run_moon_ide moon ide find-references 'Context' --loc 'src/lib/json.mbt:2:13'
Found 33 references for symbol 'Context':
<WORKDIR>/src/lib/json.mbt:25:13-25:20:
   |     Some(decode) => decode
   |     None => () (escaped)
   |   }
25 |   let ctx = Context::{
   |             ^^^^^^^
   |     rest: input.to_array()[:],
   |     original: input.to_array(),

<WORKDIR>/src/lib/json.mbt:51:13-51:20:
   |     Some(decode) => decode (escaped)
   |     None => () (escaped)
   |   } (escaped)
51 |   let ctx = Context::{
   |             ^^^^^^^ (escaped)
   |     rest: input.to_array()[:], (escaped)
   |     original: input.to_array(), (escaped)

<WORKDIR>/src/lib/json.mbt:66:13-66:20:
   | ///| (escaped)
   | pub fn decode_continue(cont : String, state : ContinueValue) -> Value raise { (escaped)
   |   let input = [..state.rest, ..cont.to_array()] (escaped)
66 |   let ctx = Context::{
   |             ^^^^^^^ (escaped)
   |     rest: input[:], (escaped)
   |     original: input, (escaped)

<WORKDIR>/src/lib/json.mbt:85:16-85:23:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
85 | fn value(ctx : Context) -> Value raise {
   |                ^^^^^^^ (escaped)
   |   match ctx.rest { (escaped)
   |     // skip whitespace (escaped)

<WORKDIR>/src/lib/json.mbt:106:22-106:29:
    | // number {{{ (escaped)
    |  (escaped)
    | ///| (escaped)
106 | fn number_zero(ctx : Context, len : Int32) -> Value raise {
    |                      ^^^^^^^ (escaped)
    |   let { original, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:128:17-128:24:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
128 | fn number(ctx : Context, len : Int32) -> Value raise {
    |                 ^^^^^^^ (escaped)
    |   let { original, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:151:22-151:29:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
151 | fn number_frac(ctx : Context, len : Int32) -> Value raise {
    |                      ^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['0'..<='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1)

<WORKDIR>/src/lib/json.mbt:159:27-159:34:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
159 | fn number_frac_cont(ctx : Context, len : Int32) -> Value raise {
    |                           ^^^^^^^ (escaped)
    |   let { original, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:173:9-173:16:
    |  (escaped)
    | ///| (escaped)
    | fn float_decode( (escaped)
173 |   ctx : Context,
    |         ^^^^^^^ (escaped)
    |   len : Int32,
    |   token : ArrayView[Char], (escaped)

<WORKDIR>/src/lib/json.mbt:195:21-195:28:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
195 | fn number_exp(ctx : Context, len : Int32) -> Value raise {
    |                     ^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['0'..<='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1)

<WORKDIR>/src/lib/json.mbt:204:26-204:33:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
204 | fn number_exp_sign(ctx : Context, len : Int32) -> Value raise {
    |                          ^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['0'..<='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1)

<WORKDIR>/src/lib/json.mbt:212:26-212:33:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
212 | fn number_exp_cont(ctx : Context, len : Int32) -> Value raise {
    |                          ^^^^^^^ (escaped)
    |   let { original, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:224:23-224:30:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
224 | fn number_minus(ctx : Context) -> Value raise {
    |                       ^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['0', .. rest] => number_zero({ ..ctx, rest, }, 2) (escaped)

<WORKDIR>/src/lib/json.mbt:233:25-233:32:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
233 | fn integer_decode(ctx : Context, token : ArrayView[Char]) -> Int32 raise {
    |                         ^^^^^^^ (escaped)
    |   try ctx.decode.integer(token) catch { (escaped)
    |     _ => raise ParseError(UnexpectedSequence(token.to_owned(), ctx.skip)) (escaped)

<WORKDIR>/src/lib/json.mbt:246:16-246:23:
    | // constants {{{ (escaped)
    |  (escaped)
    | ///| (escaped)
246 | fn true_(ctx : Context) -> Value raise {
    |                ^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['r', 'u', 'e', .. rest] => (escaped)

<WORKDIR>/src/lib/json.mbt:255:17-255:24:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
255 | fn false_(ctx : Context) -> Value raise {
    |                 ^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['a', 'l', 's', 'e', .. rest] => (escaped)

<WORKDIR>/src/lib/json.mbt:264:15-264:22:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
264 | fn null(ctx : Context) -> Value raise {
    |               ^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['u', 'l', 'l', .. rest] => (escaped)

<WORKDIR>/src/lib/json.mbt:277:17-277:24:
    | // string {{{ (escaped)
    |  (escaped)
    | ///| (escaped)
277 | fn string(ctx : Context, len : Int32) -> Value raise {
    |                 ^^^^^^^ (escaped)
    |   let builder = StringBuilder(size_hint=len)
    |   string_scan(ctx, len, builder) (escaped)

<WORKDIR>/src/lib/json.mbt:284:9-284:16:
    |  (escaped)
    | ///| (escaped)
    | fn string_scan( (escaped)
284 |   ctx : Context,
    |         ^^^^^^^ (escaped)
    |   len : Int32,
    |   builder : StringBuilder, (escaped)

<WORKDIR>/src/lib/json.mbt:309:9-309:16:
    |  (escaped)
    | ///| (escaped)
    | fn string_escape( (escaped)
309 |   ctx : Context,
    |         ^^^^^^^ (escaped)
    |   len : Int32,
    |   builder : StringBuilder, (escaped)

<WORKDIR>/src/lib/json.mbt:360:9-360:16:
    |  (escaped)
    | ///| (escaped)
    | fn string_unicode( (escaped)
360 |   ctx : Context,
    |         ^^^^^^^ (escaped)
    |   len : Int32,
    |   code_unit : Int32,

<WORKDIR>/src/lib/json.mbt:406:9-406:16:
    |  (escaped)
    | ///| (escaped)
    | fn unicode_escape_value( (escaped)
406 |   ctx : Context,
    |         ^^^^^^^ (escaped)
    |   len : Int32,
    |   a : Char, (escaped)

<WORKDIR>/src/lib/json.mbt:421:20-421:27:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
421 | fn hex_value(ctx : Context, index : Int32, c : Char) -> Int32 raise {
    |                    ^^^^^^^ (escaped)
    |   match c { (escaped)
    |     '0'..<='9' => c.to_int() - '0'.to_int()

<WORKDIR>/src/lib/json.mbt:432:9-432:16:
    |  (escaped)
    | ///| (escaped)
    | fn write_codepoint( (escaped)
432 |   ctx : Context,
    |         ^^^^^^^ (escaped)
    |   index : Int32,
    |   codepoint : Int32,

<WORKDIR>/src/lib/json.mbt:448:22-448:29:
    | // array {{{ (escaped)
    |  (escaped)
    | ///| (escaped)
448 | fn array_start(ctx : Context, len : Int32) -> Value raise {
    |                      ^^^^^^^ (escaped)
    |   let { decode, skip, arr_acc, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:473:21-473:28:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
473 | fn array_push(ctx : Context, value0 : Json) -> Value raise {
    |                     ^^^^^^^ (escaped)
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:500:23-500:30:
    | // object {{{ (escaped)
    |  (escaped)
    | ///| (escaped)
500 | fn object_start(ctx : Context, len : Int32) -> Value raise {
    |                       ^^^^^^^ (escaped)
    |   let { obj_acc, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:532:23-532:30:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
532 | fn object_value(ctx : Context, key : String) -> Value raise {
    |                       ^^^^^^^ (escaped)
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:546:22-546:29:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
546 | fn object_push(ctx : Context, value0 : Json, key : String) -> Value raise {
    |                      ^^^^^^^ (escaped)
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:569:21-569:28:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
569 | fn object_key(ctx : Context) -> Value raise {
    |                     ^^^^^^^ (escaped)
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:582:20-582:27:
    | // }}} (escaped)
    |  (escaped)
    | ///| (escaped)
582 | fn continue_(ctx : Context, value : Json) -> Value raise {
    |                    ^^^^^^^ (escaped)
    |   match ctx.stack.last() { (escaped)
    |     None => terminate(ctx, value) (escaped)

<WORKDIR>/src/lib/json.mbt:598:20-598:27:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
598 | fn terminate(ctx : Context, value : Json) -> Value raise {
    |                    ^^^^^^^ (escaped)
    |   let { rest, original, skip, arr_acc, obj_acc, .. } = ctx (escaped)
    |   match rest { (escaped)

<WORKDIR>/src/lib/json.mbt:613:9-613:16:
    |  (escaped)
    | ///| (escaped)
    | fn unexpected( (escaped)
613 |   ctx : Context,
    |         ^^^^^^^ (escaped)
    |   pos : Int32,
    |   len : Int32,

```
