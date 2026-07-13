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
Found 34 references for symbol 'Context':
<WORKDIR>/src/lib/json.mbt:2:13-2:20:
  | ///| (escaped)
2 | priv struct Context { (escaped)
  |             ^^^^^^^ (escaped)
  |   original : Array[Char] (escaped)
  |   rest : ArrayView[Char] (escaped)

<WORKDIR>/src/lib/json.mbt:25:13-25:20:
   |     Some(decode) => decode (escaped)
   |     None => () (escaped)
   |   } (escaped)
25 |   let ctx = Context::{ (escaped)
   |             ^^^^^^^ (escaped)
   |     rest: input.to_array()[:], (escaped)
   |     original: input.to_array(), (escaped)

<WORKDIR>/src/lib/json.mbt:53:13-53:20:
   |     Some(decode) => decode (escaped)
   |     None => () (escaped)
   |   } (escaped)
53 |   let ctx = Context::{ (escaped)
   |             ^^^^^^^ (escaped)
   |     rest: input.to_array()[:], (escaped)
   |     original: input.to_array(), (escaped)

<WORKDIR>/src/lib/json.mbt:68:13-68:20:
   | ///| (escaped)
   | pub fn decode_continue(cont : String, state : ContinueValue) -> Value raise { (escaped)
   |   let input = [..state.rest, ..cont.to_array()] (escaped)
68 |   let ctx = Context::{ (escaped)
   |             ^^^^^^^ (escaped)
   |     rest: input[:], (escaped)
   |     original: input, (escaped)

<WORKDIR>/src/lib/json.mbt:87:16-87:23:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
87 | fn value(ctx : Context) -> Value raise { (escaped)
   |                ^^^^^^^ (escaped)
   |   match ctx.rest { (escaped)
   |     // skip whitespace (escaped)

<WORKDIR>/src/lib/json.mbt:108:22-108:29:
    | // number {{{ (escaped)
    |  (escaped)
    | ///| (escaped)
108 | fn number_zero(ctx : Context, len : Int) -> Value raise { (escaped)
    |                      ^^^^^^^ (escaped)
    |   let { original, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:130:17-130:24:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
130 | fn number(ctx : Context, len : Int) -> Value raise { (escaped)
    |                 ^^^^^^^ (escaped)
    |   let { original, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:153:22-153:29:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
153 | fn number_frac(ctx : Context, len : Int) -> Value raise { (escaped)
    |                      ^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['0'..='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1) (escaped)

<WORKDIR>/src/lib/json.mbt:161:27-161:34:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
161 | fn number_frac_cont(ctx : Context, len : Int) -> Value raise { (escaped)
    |                           ^^^^^^^ (escaped)
    |   let { original, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:175:9-175:16:
    |  (escaped)
    | ///| (escaped)
    | fn float_decode( (escaped)
175 |   ctx : Context, (escaped)
    |         ^^^^^^^ (escaped)
    |   len : Int, (escaped)
    |   token : ArrayView[Char], (escaped)

<WORKDIR>/src/lib/json.mbt:197:21-197:28:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
197 | fn number_exp(ctx : Context, len : Int) -> Value raise { (escaped)
    |                     ^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1) (escaped)

<WORKDIR>/src/lib/json.mbt:206:26-206:33:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
206 | fn number_exp_sign(ctx : Context, len : Int) -> Value raise { (escaped)
    |                          ^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1) (escaped)

<WORKDIR>/src/lib/json.mbt:214:26-214:33:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
214 | fn number_exp_cont(ctx : Context, len : Int) -> Value raise { (escaped)
    |                          ^^^^^^^ (escaped)
    |   let { original, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:226:23-226:30:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
226 | fn number_minus(ctx : Context) -> Value raise { (escaped)
    |                       ^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['0', .. rest] => number_zero({ ..ctx, rest, }, 2) (escaped)

<WORKDIR>/src/lib/json.mbt:235:25-235:32:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
235 | fn integer_decode(ctx : Context, token : ArrayView[Char]) -> Int raise { (escaped)
    |                         ^^^^^^^ (escaped)
    |   try ctx.decode.integer(token) catch { (escaped)
    |     _ => raise ParseError(UnexpectedSequence(token.to_owned(), ctx.skip)) (escaped)

<WORKDIR>/src/lib/json.mbt:248:16-248:23:
    | // constants {{{ (escaped)
    |  (escaped)
    | ///| (escaped)
248 | fn true_(ctx : Context) -> Value raise { (escaped)
    |                ^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['r', 'u', 'e', .. rest] => (escaped)

<WORKDIR>/src/lib/json.mbt:257:17-257:24:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
257 | fn false_(ctx : Context) -> Value raise { (escaped)
    |                 ^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['a', 'l', 's', 'e', .. rest] => (escaped)

<WORKDIR>/src/lib/json.mbt:266:15-266:22:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
266 | fn null(ctx : Context) -> Value raise { (escaped)
    |               ^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['u', 'l', 'l', .. rest] => (escaped)

<WORKDIR>/src/lib/json.mbt:279:17-279:24:
    | // string {{{ (escaped)
    |  (escaped)
    | ///| (escaped)
279 | fn string(ctx : Context, len : Int) -> Value raise { (escaped)
    |                 ^^^^^^^ (escaped)
    |   let builder = StringBuilder::new(size_hint=len) (escaped)
    |   string_scan(ctx, len, builder) (escaped)

<WORKDIR>/src/lib/json.mbt:286:9-286:16:
    |  (escaped)
    | ///| (escaped)
    | fn string_scan( (escaped)
286 |   ctx : Context, (escaped)
    |         ^^^^^^^ (escaped)
    |   len : Int, (escaped)
    |   builder : StringBuilder, (escaped)

<WORKDIR>/src/lib/json.mbt:311:9-311:16:
    |  (escaped)
    | ///| (escaped)
    | fn string_escape( (escaped)
311 |   ctx : Context, (escaped)
    |         ^^^^^^^ (escaped)
    |   len : Int, (escaped)
    |   builder : StringBuilder, (escaped)

<WORKDIR>/src/lib/json.mbt:362:9-362:16:
    |  (escaped)
    | ///| (escaped)
    | fn string_unicode( (escaped)
362 |   ctx : Context, (escaped)
    |         ^^^^^^^ (escaped)
    |   len : Int, (escaped)
    |   code_unit : Int, (escaped)

<WORKDIR>/src/lib/json.mbt:408:9-408:16:
    |  (escaped)
    | ///| (escaped)
    | fn unicode_escape_value( (escaped)
408 |   ctx : Context, (escaped)
    |         ^^^^^^^ (escaped)
    |   len : Int, (escaped)
    |   a : Char, (escaped)

<WORKDIR>/src/lib/json.mbt:423:20-423:27:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
423 | fn hex_value(ctx : Context, index : Int, c : Char) -> Int raise { (escaped)
    |                    ^^^^^^^ (escaped)
    |   match c { (escaped)
    |     '0'..='9' => c.to_int() - '0'.to_int() (escaped)

<WORKDIR>/src/lib/json.mbt:434:9-434:16:
    |  (escaped)
    | ///| (escaped)
    | fn write_codepoint( (escaped)
434 |   ctx : Context, (escaped)
    |         ^^^^^^^ (escaped)
    |   index : Int, (escaped)
    |   codepoint : Int, (escaped)

<WORKDIR>/src/lib/json.mbt:450:22-450:29:
    | // array {{{ (escaped)
    |  (escaped)
    | ///| (escaped)
450 | fn array_start(ctx : Context, len : Int) -> Value raise { (escaped)
    |                      ^^^^^^^ (escaped)
    |   let { decode, skip, arr_acc, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:475:21-475:28:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
475 | fn array_push(ctx : Context, value0 : Json) -> Value raise { (escaped)
    |                     ^^^^^^^ (escaped)
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:502:23-502:30:
    | // object {{{ (escaped)
    |  (escaped)
    | ///| (escaped)
502 | fn object_start(ctx : Context, len : Int) -> Value raise { (escaped)
    |                       ^^^^^^^ (escaped)
    |   let { obj_acc, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:534:23-534:30:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
534 | fn object_value(ctx : Context, key : String) -> Value raise { (escaped)
    |                       ^^^^^^^ (escaped)
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:548:22-548:29:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
548 | fn object_push(ctx : Context, value0 : Json, key : String) -> Value raise { (escaped)
    |                      ^^^^^^^ (escaped)
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:571:21-571:28:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
571 | fn object_key(ctx : Context) -> Value raise { (escaped)
    |                     ^^^^^^^ (escaped)
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:584:20-584:27:
    | // }}} (escaped)
    |  (escaped)
    | ///| (escaped)
584 | fn continue_(ctx : Context, value : Json) -> Value raise { (escaped)
    |                    ^^^^^^^ (escaped)
    |   match ctx.stack.last() { (escaped)
    |     None => terminate(ctx, value) (escaped)

<WORKDIR>/src/lib/json.mbt:600:20-600:27:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
600 | fn terminate(ctx : Context, value : Json) -> Value raise { (escaped)
    |                    ^^^^^^^ (escaped)
    |   let { rest, original, skip, arr_acc, obj_acc, .. } = ctx (escaped)
    |   match rest { (escaped)

<WORKDIR>/src/lib/json.mbt:615:9-615:16:
    |  (escaped)
    | ///| (escaped)
    | fn unexpected( (escaped)
615 |   ctx : Context, (escaped)
    |         ^^^^^^^ (escaped)
    |   pos : Int, (escaped)
    |   len : Int, (escaped)

```
