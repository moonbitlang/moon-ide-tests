# json find-references

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
$ run_moon_ide moon ide find-references Context --loc 'src/lib/json.mbt:2:13'
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

```mooncram
$ run_moon_ide moon ide find-references original --loc 'src/lib/json.mbt:3:3'
Found 18 references for symbol 'original':
<WORKDIR>/src/lib/json.mbt:3:3-3:11:
  | ///| (escaped)
  | priv struct Context { (escaped)
3 |   original : Array[Char] (escaped)
  |   ^^^^^^^^ (escaped)
  |   rest : ArrayView[Char] (escaped)
  |   skip : Int (escaped)

<WORKDIR>/src/lib/json.mbt:27:5-27:13:
   |   } (escaped)
   |   let ctx = Context::{ (escaped)
   |     rest: input.to_array()[:], (escaped)
27 |     original: input.to_array(), (escaped)
   |     ^^^^^^^^ (escaped)
   |     skip: 0, (escaped)
   |     arr_acc: [], (escaped)

<WORKDIR>/src/lib/json.mbt:55:5-55:13:
   |   } (escaped)
   |   let ctx = Context::{ (escaped)
   |     rest: input.to_array()[:], (escaped)
55 |     original: input.to_array(), (escaped)
   |     ^^^^^^^^ (escaped)
   |     skip: 0, (escaped)
   |     arr_acc: [], (escaped)

<WORKDIR>/src/lib/json.mbt:70:5-70:13:
   |   let input = [..state.rest, ..cont.to_array()] (escaped)
   |   let ctx = Context::{ (escaped)
   |     rest: input[:], (escaped)
70 |     original: input, (escaped)
   |     ^^^^^^^^ (escaped)
   |     skip: 0, (escaped)
   |     arr_acc: state.arr_acc, (escaped)

<WORKDIR>/src/lib/json.mbt:109:9-109:17:
    |  (escaped)
    | ///| (escaped)
    | fn number_zero(ctx : Context, len : Int) -> Value raise { (escaped)
109 |   let { original, skip, .. } = ctx (escaped)
    |         ^^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     [] => { (escaped)

<WORKDIR>/src/lib/json.mbt:131:9-131:17:
    |  (escaped)
    | ///| (escaped)
    | fn number(ctx : Context, len : Int) -> Value raise { (escaped)
131 |   let { original, skip, .. } = ctx (escaped)
    |         ^^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['0'..='9', .. rest] => number({ ..ctx, rest, }, len + 1) (escaped)

<WORKDIR>/src/lib/json.mbt:162:9-162:17:
    |  (escaped)
    | ///| (escaped)
    | fn number_frac_cont(ctx : Context, len : Int) -> Value raise { (escaped)
162 |   let { original, skip, .. } = ctx (escaped)
    |         ^^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['0'..='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1) (escaped)

<WORKDIR>/src/lib/json.mbt:215:9-215:17:
    |  (escaped)
    | ///| (escaped)
    | fn number_exp_cont(ctx : Context, len : Int) -> Value raise { (escaped)
215 |   let { original, skip, .. } = ctx (escaped)
    |         ^^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1) (escaped)

<WORKDIR>/src/lib/json.mbt:300:32-300:40:
    |     ['\\\\', .. rest] => string_escape({ ..ctx, rest, }, len, builder) (escaped)
    |     [c, .. rest] => (escaped)
    |       if c.to_int() < 0x20 { (escaped)
300 |         raise invalid_byte(ctx.original, skip + len) (escaped)
    |                                ^^^^^^^^ (escaped)
    |       } else { (escaped)
    |         builder.write_char(c) (escaped)

<WORKDIR>/src/lib/json.mbt:354:39-354:47:
    |     } (escaped)
    |     ['u', ..] => (escaped)
    |       unexpected({ ..ctx, skip: ctx.skip - 1 }, len + 6, 0, Checkpoint::Value) (escaped)
354 |     [_, ..] => raise invalid_byte(ctx.original, ctx.skip + len + 1) (escaped)
    |                                       ^^^^^^^^ (escaped)
    |     [] => (escaped)
    |       unexpected({ ..ctx, skip: ctx.skip - 1 }, len + 2, 0, Checkpoint::Value) (escaped)

<WORKDIR>/src/lib/json.mbt:379:34-379:42:
    |           write_codepoint(ctx, ctx.skip + len, codepoint, builder) (escaped)
    |           string_scan({ ..ctx, rest, }, len + 12, builder) (escaped)
    |         } else { (escaped)
379 |           raise invalid_byte(ctx.original, ctx.skip + len + 8) (escaped)
    |                                  ^^^^^^^^ (escaped)
    |         } (escaped)
    |       } (escaped)

<WORKDIR>/src/lib/json.mbt:396:35-396:43:
    |           0, (escaped)
    |           Checkpoint::Value, (escaped)
    |         ) (escaped)
396 |       _ => raise invalid_byte(ctx.original, ctx.skip + len + 6) (escaped)
    |                                   ^^^^^^^^ (escaped)
    |     } (escaped)
    |   } else if code_unit.is_trailing_surrogate() { (escaped)

<WORKDIR>/src/lib/json.mbt:399:28-399:36:
    |       _ => raise invalid_byte(ctx.original, ctx.skip + len + 6) (escaped)
    |     } (escaped)
    |   } else if code_unit.is_trailing_surrogate() { (escaped)
399 |     raise invalid_byte(ctx.original, ctx.skip + len + 2) (escaped)
    |                            ^^^^^^^^ (escaped)
    |   } else { (escaped)
    |     write_codepoint(ctx, ctx.skip + len + 2, code_unit, builder) (escaped)

<WORKDIR>/src/lib/json.mbt:428:33-428:41:
    |     '0'..='9' => c.to_int() - '0'.to_int() (escaped)
    |     'a'..='f' => c.to_int() - 'a'.to_int() + 10 (escaped)
    |     'A'..='F' => c.to_int() - 'A'.to_int() + 10 (escaped)
428 |     _ => raise invalid_byte(ctx.original, index) (escaped)
    |                                 ^^^^^^^^ (escaped)
    |   } (escaped)
    | } (escaped)

<WORKDIR>/src/lib/json.mbt:441:36-441:44:
    | ) -> Unit raise { (escaped)
    |   match codepoint.to_char() { (escaped)
    |     Some(c) => builder.write_char(c) (escaped)
441 |     None => raise invalid_byte(ctx.original, index) (escaped)
    |                                    ^^^^^^^^ (escaped)
    |   } (escaped)
    | } (escaped)

<WORKDIR>/src/lib/json.mbt:601:15-601:23:
    |  (escaped)
    | ///| (escaped)
    | fn terminate(ctx : Context, value : Json) -> Value raise { (escaped)
601 |   let { rest, original, skip, arr_acc, obj_acc, .. } = ctx (escaped)
    |               ^^^^^^^^ (escaped)
    |   match rest { (escaped)
    |     // skip whitespace (escaped)

<WORKDIR>/src/lib/json.mbt:620:9-620:17:
    |   len : Int, (escaped)
    |   func_data : Checkpoint, (escaped)
    | ) -> Value raise { (escaped)
620 |   let { original, arr_acc, obj_acc, skip, stack, decode, .. } = ctx (escaped)
    |         ^^^^^^^^ (escaped)
    |   let required_size = skip + pos + len (escaped)
    |   let original_size = original.length() (escaped)

<WORKDIR>/src/lib/json.mbt:634:28-634:36:
    |       checkpoint: func_data, (escaped)
    |     }) (escaped)
    |   } else { (escaped)
634 |     raise invalid_byte(ctx.original, ctx.skip + pos) (escaped)
    |                            ^^^^^^^^ (escaped)
    |   } (escaped)
    | } (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references ParseError --loc 'src/lib/error.mbt:2:14'
Found 3 references for symbol 'ParseError':
<WORKDIR>/src/lib/error.mbt:2:14-2:24:
  | ///| (escaped)
2 | pub suberror ParseError { (escaped)
  |              ^^^^^^^^^^ (escaped)
  |   ParseError(Reason) (escaped)
  | } derive(Debug) (escaped)

<WORKDIR>/src/lib/json.mbt:639:51-639:61:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
639 | fn invalid_byte(arr : Array[Char], skip : Int) -> ParseError { (escaped)
    |                                                   ^^^^^^^^^^ (escaped)
    |   let byte = arr[skip] (escaped)
    |   ParseError(InvalidByte(skip, byte)) (escaped)

<WORKDIR>/src/top.mbt:10:8-10:18:
   |   type Value, (escaped)
   |   type ContinueValue, (escaped)
   |   type FinishValue, (escaped)
10 |   type ParseError, (escaped)
   |        ^^^^^^^^^^ (escaped)
   |   type Reason, (escaped)
   | } (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references ParseError --loc 'src/lib/error.mbt:3:3'
Found 8 references for symbol 'ParseError':
<WORKDIR>/src/lib/error.mbt:3:3-3:13:
  | ///| (escaped)
  | pub suberror ParseError { (escaped)
3 |   ParseError(Reason) (escaped)
  |   ^^^^^^^^^^ (escaped)
  | } derive(Debug) (escaped)
  |  (escaped)

<WORKDIR>/src/lib/json.mbt:42:13-42:23:
   |     Continue({ stack: [], checkpoint: Checkpoint::NumberD(n), .. }) => (escaped)
   |       n.to_json() (escaped)
   |     Continue({ checkpoint: Checkpoint::FloatError(token, skip), .. }) => (escaped)
42 |       raise ParseError(UnexpectedSequence(token.to_owned(), skip)) (escaped)
   |             ^^^^^^^^^^ (escaped)
   |     Continue({ checkpoint: cp, .. }) => raise ParseError(UnexpectedEnd(cp)) (escaped)
   |   } (escaped)

<WORKDIR>/src/lib/json.mbt:43:47-43:57:
   |       n.to_json() (escaped)
   |     Continue({ checkpoint: Checkpoint::FloatError(token, skip), .. }) => (escaped)
   |       raise ParseError(UnexpectedSequence(token.to_owned(), skip)) (escaped)
43 |     Continue({ checkpoint: cp, .. }) => raise ParseError(UnexpectedEnd(cp)) (escaped)
   |                                               ^^^^^^^^^^ (escaped)
   |   } (escaped)
   | } (escaped)

<WORKDIR>/src/lib/json.mbt:237:16-237:26:
    | ///| (escaped)
    | fn integer_decode(ctx : Context, token : ArrayView[Char]) -> Int raise { (escaped)
    |   try ctx.decode.integer(token) catch { (escaped)
237 |     _ => raise ParseError(UnexpectedSequence(token.to_owned(), ctx.skip)) (escaped)
    |                ^^^^^^^^^^ (escaped)
    |   } noraise { (escaped)
    |     value => value (escaped)

<WORKDIR>/src/lib/json.mbt:641:3-641:13:
    | ///| (escaped)
    | fn invalid_byte(arr : Array[Char], skip : Int) -> ParseError { (escaped)
    |   let byte = arr[skip] (escaped)
641 |   ParseError(InvalidByte(skip, byte)) (escaped)
    |   ^^^^^^^^^^ (escaped)
    | } (escaped)

<WORKDIR>/src/tests/incr.mbt:51:10-51:20:
   |   chunks : ArrayView[String], (escaped)
   | ) -> Unit raise { (escaped)
   |   try decode_chunks(chunks) catch { (escaped)
51 |     @lib.ParseError(_) => () (escaped)
   |          ^^^^^^^^^^ (escaped)
   |     _ => (escaped)
   |       incr_fail( (escaped)

<WORKDIR>/src/tests/json_testsuite_helpers_test.mbt:18:10-18:20:
   | ///| (escaped)
   | fn expect_reject(name : String, input : String) -> Unit raise { (escaped)
   |   try @json.decode(input) catch { (escaped)
18 |     @lib.ParseError(_) => () (escaped)
   |          ^^^^^^^^^^ (escaped)
   |     _ => (escaped)
   |       json_testsuite_fail( (escaped)

<WORKDIR>/src/tests/json_testsuite_helpers_test.mbt:34:10-34:20:
   | ///| (escaped)
   | fn expect_accept_or_reject(name : String, input : String) -> Unit raise { (escaped)
   |   try @json.decode(input) catch { (escaped)
34 |     @lib.ParseError(_) => () (escaped)
   |          ^^^^^^^^^^ (escaped)
   |     _ => (escaped)
   |       json_testsuite_fail( (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references Value --loc 'src/lib/value.mbt:2:10'
Found 33 references for symbol 'Value':
<WORKDIR>/src/lib/json.mbt:48:59-48:64:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
48 | pub fn decode_start(input : String, decode? : &Decode) -> Value raise { (escaped)
   |                                                           ^^^^^ (escaped)
   |   let decode : &Decode = match decode { (escaped)
   |     Some(decode) => decode (escaped)

<WORKDIR>/src/lib/json.mbt:66:65-66:70:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
66 | pub fn decode_continue(cont : String, state : ContinueValue) -> Value raise { (escaped)
   |                                                                 ^^^^^ (escaped)
   |   let input = [..state.rest, ..cont.to_array()] (escaped)
   |   let ctx = Context::{ (escaped)

<WORKDIR>/src/lib/json.mbt:87:28-87:33:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
87 | fn value(ctx : Context) -> Value raise { (escaped)
   |                            ^^^^^ (escaped)
   |   match ctx.rest { (escaped)
   |     // skip whitespace (escaped)

<WORKDIR>/src/lib/json.mbt:108:45-108:50:
    | // number {{{ (escaped)
    |  (escaped)
    | ///| (escaped)
108 | fn number_zero(ctx : Context, len : Int) -> Value raise { (escaped)
    |                                             ^^^^^ (escaped)
    |   let { original, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:130:40-130:45:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
130 | fn number(ctx : Context, len : Int) -> Value raise { (escaped)
    |                                        ^^^^^ (escaped)
    |   let { original, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:153:45-153:50:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
153 | fn number_frac(ctx : Context, len : Int) -> Value raise { (escaped)
    |                                             ^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['0'..='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1) (escaped)

<WORKDIR>/src/lib/json.mbt:161:50-161:55:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
161 | fn number_frac_cont(ctx : Context, len : Int) -> Value raise { (escaped)
    |                                                  ^^^^^ (escaped)
    |   let { original, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:178:6-178:11:
    |   ctx : Context, (escaped)
    |   len : Int, (escaped)
    |   token : ArrayView[Char], (escaped)
178 | ) -> Value raise { (escaped)
    |      ^^^^^ (escaped)
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:197:44-197:49:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
197 | fn number_exp(ctx : Context, len : Int) -> Value raise { (escaped)
    |                                            ^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1) (escaped)

<WORKDIR>/src/lib/json.mbt:206:49-206:54:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
206 | fn number_exp_sign(ctx : Context, len : Int) -> Value raise { (escaped)
    |                                                 ^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1) (escaped)

<WORKDIR>/src/lib/json.mbt:214:49-214:54:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
214 | fn number_exp_cont(ctx : Context, len : Int) -> Value raise { (escaped)
    |                                                 ^^^^^ (escaped)
    |   let { original, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:226:35-226:40:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
226 | fn number_minus(ctx : Context) -> Value raise { (escaped)
    |                                   ^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['0', .. rest] => number_zero({ ..ctx, rest, }, 2) (escaped)

<WORKDIR>/src/lib/json.mbt:248:28-248:33:
    | // constants {{{ (escaped)
    |  (escaped)
    | ///| (escaped)
248 | fn true_(ctx : Context) -> Value raise { (escaped)
    |                            ^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['r', 'u', 'e', .. rest] => (escaped)

<WORKDIR>/src/lib/json.mbt:257:29-257:34:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
257 | fn false_(ctx : Context) -> Value raise { (escaped)
    |                             ^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['a', 'l', 's', 'e', .. rest] => (escaped)

<WORKDIR>/src/lib/json.mbt:266:27-266:32:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
266 | fn null(ctx : Context) -> Value raise { (escaped)
    |                           ^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['u', 'l', 'l', .. rest] => (escaped)

<WORKDIR>/src/lib/json.mbt:279:40-279:45:
    | // string {{{ (escaped)
    |  (escaped)
    | ///| (escaped)
279 | fn string(ctx : Context, len : Int) -> Value raise { (escaped)
    |                                        ^^^^^ (escaped)
    |   let builder = StringBuilder::new(size_hint=len) (escaped)
    |   string_scan(ctx, len, builder) (escaped)

<WORKDIR>/src/lib/json.mbt:289:6-289:11:
    |   ctx : Context, (escaped)
    |   len : Int, (escaped)
    |   builder : StringBuilder, (escaped)
289 | ) -> Value raise { (escaped)
    |      ^^^^^ (escaped)
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:314:6-314:11:
    |   ctx : Context, (escaped)
    |   len : Int, (escaped)
    |   builder : StringBuilder, (escaped)
314 | ) -> Value raise { (escaped)
    |      ^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['"', .. rest] => { (escaped)

<WORKDIR>/src/lib/json.mbt:367:6-367:11:
    |   code_unit : Int, (escaped)
    |   rest : ArrayView[Char], (escaped)
    |   builder : StringBuilder, (escaped)
367 | ) -> Value raise { (escaped)
    |      ^^^^^ (escaped)
    |   if code_unit.is_leading_surrogate() { (escaped)
    |     match rest { (escaped)

<WORKDIR>/src/lib/json.mbt:450:45-450:50:
    | // array {{{ (escaped)
    |  (escaped)
    | ///| (escaped)
450 | fn array_start(ctx : Context, len : Int) -> Value raise { (escaped)
    |                                             ^^^^^ (escaped)
    |   let { decode, skip, arr_acc, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:475:48-475:53:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
475 | fn array_push(ctx : Context, value0 : Json) -> Value raise { (escaped)
    |                                                ^^^^^ (escaped)
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:502:46-502:51:
    | // object {{{ (escaped)
    |  (escaped)
    | ///| (escaped)
502 | fn object_start(ctx : Context, len : Int) -> Value raise { (escaped)
    |                                              ^^^^^ (escaped)
    |   let { obj_acc, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:534:49-534:54:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
534 | fn object_value(ctx : Context, key : String) -> Value raise { (escaped)
    |                                                 ^^^^^ (escaped)
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:548:63-548:68:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
548 | fn object_push(ctx : Context, value0 : Json, key : String) -> Value raise { (escaped)
    |                                                               ^^^^^ (escaped)
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:571:33-571:38:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
571 | fn object_key(ctx : Context) -> Value raise { (escaped)
    |                                 ^^^^^ (escaped)
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:584:46-584:51:
    | // }}} (escaped)
    |  (escaped)
    | ///| (escaped)
584 | fn continue_(ctx : Context, value : Json) -> Value raise { (escaped)
    |                                              ^^^^^ (escaped)
    |   match ctx.stack.last() { (escaped)
    |     None => terminate(ctx, value) (escaped)

<WORKDIR>/src/lib/json.mbt:600:46-600:51:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
600 | fn terminate(ctx : Context, value : Json) -> Value raise { (escaped)
    |                                              ^^^^^ (escaped)
    |   let { rest, original, skip, arr_acc, obj_acc, .. } = ctx (escaped)
    |   match rest { (escaped)

<WORKDIR>/src/lib/json.mbt:605:11-605:16:
    |   match rest { (escaped)
    |     // skip whitespace (escaped)
    |     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => terminate({ ..ctx, rest, }, value) (escaped)
605 |     [] => Value::Finish({ value, arr_acc, obj_acc, rest: [][:] }) (escaped)
    |           ^^^^^ (escaped)
    |     _ => { (escaped)
    |       let rest = original[skip:] (escaped)

<WORKDIR>/src/lib/json.mbt:608:7-608:12:
    |     [] => Value::Finish({ value, arr_acc, obj_acc, rest: [][:] }) (escaped)
    |     _ => { (escaped)
    |       let rest = original[skip:] (escaped)
608 |       Value::Finish({ value, arr_acc, obj_acc, rest }) (escaped)
    |       ^^^^^ (escaped)
    |     } (escaped)
    |   } (escaped)

<WORKDIR>/src/lib/json.mbt:619:6-619:11:
    |   pos : Int, (escaped)
    |   len : Int, (escaped)
    |   func_data : Checkpoint, (escaped)
619 | ) -> Value raise { (escaped)
    |      ^^^^^ (escaped)
    |   let { original, arr_acc, obj_acc, skip, stack, decode, .. } = ctx (escaped)
    |   let required_size = skip + pos + len (escaped)

<WORKDIR>/src/lib/json.mbt:625:5-625:10:
    |   let original_size = original.length() (escaped)
    |   if original_size <= required_size { (escaped)
    |     let rest = original[skip:] (escaped)
625 |     Value::Continue(ContinueValue::{ (escaped)
    |     ^^^^^ (escaped)
    |       rest, (escaped)
    |       arr_acc, (escaped)

<WORKDIR>/src/lib/value.mbt:2:10-2:15:
  | ///| (escaped)
2 | pub enum Value { (escaped)
  |          ^^^^^ (escaped)
  |   Continue(ContinueValue) (escaped)
  |   Finish(FinishValue) (escaped)

<WORKDIR>/src/top.mbt:7:8-7:13:
  |   decode, (escaped)
  |   decode_start, (escaped)
  |   decode_continue, (escaped)
7 |   type Value, (escaped)
  |        ^^^^^ (escaped)
  |   type ContinueValue, (escaped)
  |   type FinishValue, (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references Continue --loc 'src/lib/value.mbt:3:3'
Found 10 references for symbol 'Continue':
<WORKDIR>/src/lib/json.mbt:37:5-37:13:
   |   match value(ctx) { (escaped)
   |     Finish({ value, rest: [], .. }) => value (escaped)
   |     Finish({ rest, .. }) => raise invalid_byte([..rest], 0) (escaped)
37 |     Continue({ stack: [], checkpoint: Checkpoint::NumberI(n), .. }) => (escaped)
   |     ^^^^^^^^ (escaped)
   |       n.to_json() (escaped)
   |     Continue({ stack: [], checkpoint: Checkpoint::NumberD(n), .. }) => (escaped)

<WORKDIR>/src/lib/json.mbt:39:5-39:13:
   |     Finish({ rest, .. }) => raise invalid_byte([..rest], 0) (escaped)
   |     Continue({ stack: [], checkpoint: Checkpoint::NumberI(n), .. }) => (escaped)
   |       n.to_json() (escaped)
39 |     Continue({ stack: [], checkpoint: Checkpoint::NumberD(n), .. }) => (escaped)
   |     ^^^^^^^^ (escaped)
   |       n.to_json() (escaped)
   |     Continue({ checkpoint: Checkpoint::FloatError(token, skip), .. }) => (escaped)

<WORKDIR>/src/lib/json.mbt:41:5-41:13:
   |       n.to_json() (escaped)
   |     Continue({ stack: [], checkpoint: Checkpoint::NumberD(n), .. }) => (escaped)
   |       n.to_json() (escaped)
41 |     Continue({ checkpoint: Checkpoint::FloatError(token, skip), .. }) => (escaped)
   |     ^^^^^^^^ (escaped)
   |       raise ParseError(UnexpectedSequence(token.to_owned(), skip)) (escaped)
   |     Continue({ checkpoint: cp, .. }) => raise ParseError(UnexpectedEnd(cp)) (escaped)

<WORKDIR>/src/lib/json.mbt:43:5-43:13:
   |       n.to_json() (escaped)
   |     Continue({ checkpoint: Checkpoint::FloatError(token, skip), .. }) => (escaped)
   |       raise ParseError(UnexpectedSequence(token.to_owned(), skip)) (escaped)
43 |     Continue({ checkpoint: cp, .. }) => raise ParseError(UnexpectedEnd(cp)) (escaped)
   |     ^^^^^^^^ (escaped)
   |   } (escaped)
   | } (escaped)

<WORKDIR>/src/lib/json.mbt:625:12-625:20:
    |   let original_size = original.length() (escaped)
    |   if original_size <= required_size { (escaped)
    |     let rest = original[skip:] (escaped)
625 |     Value::Continue(ContinueValue::{ (escaped)
    |            ^^^^^^^^ (escaped)
    |       rest, (escaped)
    |       arr_acc, (escaped)

<WORKDIR>/src/lib/value.mbt:3:3-3:11:
  | ///| (escaped)
  | pub enum Value { (escaped)
3 |   Continue(ContinueValue) (escaped)
  |   ^^^^^^^^ (escaped)
  |   Finish(FinishValue) (escaped)
  | } (escaped)

<WORKDIR>/src/tests/incr.mbt:10:24-10:32:
   | fn continue_chunks(chunks : ArrayView[String], value : Value) -> Value raise { (escaped)
   |   match (chunks, value) { (escaped)
   |     ([], value) => value (escaped)
10 |     ([chunk, .. rest], Continue(state)) => (escaped)
   |                        ^^^^^^^^ (escaped)
   |       continue_chunks(rest, decode_continue(chunk, state)) (escaped)
   |     ([_, ..], Finish(_)) => (escaped)

<WORKDIR>/src/tests/incr.mbt:41:5-41:13:
   |         ", got " + (escaped)
   |         String::from_array([..rest]), (escaped)
   |       ) (escaped)
41 |     Continue(_) => incr_fail("expected chunked JSON to finish: " + name) (escaped)
   |     ^^^^^^^^ (escaped)
   |   } (escaped)
   | } (escaped)

<WORKDIR>/src/tests/incr.mbt:57:5-57:13:
   |         "expected chunked parser rejection, got non-parser error: " + name, (escaped)
   |       ) (escaped)
   |   } noraise { (escaped)
57 |     Continue(_) => (escaped)
   |     ^^^^^^^^ (escaped)
   |       incr_fail("expected chunked parser rejection, got continuation: " + name) (escaped)
   |     Finish(_) => (escaped)

<WORKDIR>/src/tests/incr.mbt:139:5-139:13:
    |       @debug.assert_eq(value, Json::object({ "a": Json::number(1.0) })) (escaped)
    |       assert_eq(String::from_array([..rest]), " trailing") (escaped)
    |     } (escaped)
139 |     Continue(_) => (escaped)
    |     ^^^^^^^^ (escaped)
    |       incr_fail("expected chunked parser to finish with trailing rest") (escaped)
    |   } (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references JsonArray --loc 'src/lib/decode.mbt:2:10'
Found 12 references for symbol 'JsonArray':
<WORKDIR>/src/lib/decode.mbt:2:10-2:19:
  | ///| (escaped)
2 | pub type JsonArray = Array[Json] (escaped)
  |          ^^^^^^^^^ (escaped)
  |  (escaped)
  | ///| (escaped)

<WORKDIR>/src/lib/decode.mbt:9:21-9:30:
  |  (escaped)
  | ///| (escaped)
  | pub trait Decode { (escaped)
9 |   array_start(Self, JsonArray) -> JsonArray (escaped)
  |                     ^^^^^^^^^ (escaped)
  |   array_push(Self, Json, JsonArray) -> JsonArray (escaped)
  |   array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray) (escaped)

<WORKDIR>/src/lib/decode.mbt:9:35-9:44:
  |  (escaped)
  | ///| (escaped)
  | pub trait Decode { (escaped)
9 |   array_start(Self, JsonArray) -> JsonArray (escaped)
  |                                   ^^^^^^^^^ (escaped)
  |   array_push(Self, Json, JsonArray) -> JsonArray (escaped)
  |   array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray) (escaped)

<WORKDIR>/src/lib/decode.mbt:10:26-10:35:
   | ///| (escaped)
   | pub trait Decode { (escaped)
   |   array_start(Self, JsonArray) -> JsonArray (escaped)
10 |   array_push(Self, Json, JsonArray) -> JsonArray (escaped)
   |                          ^^^^^^^^^ (escaped)
   |   array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray) (escaped)
   |   object_start(Self, JsonObject) -> JsonObject (escaped)

<WORKDIR>/src/lib/decode.mbt:10:40-10:49:
   | ///| (escaped)
   | pub trait Decode { (escaped)
   |   array_start(Self, JsonArray) -> JsonArray (escaped)
10 |   array_push(Self, Json, JsonArray) -> JsonArray (escaped)
   |                                        ^^^^^^^^^ (escaped)
   |   array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray) (escaped)
   |   object_start(Self, JsonObject) -> JsonObject (escaped)

<WORKDIR>/src/lib/decode.mbt:11:22-11:31:
   | pub trait Decode { (escaped)
   |   array_start(Self, JsonArray) -> JsonArray (escaped)
   |   array_push(Self, Json, JsonArray) -> JsonArray (escaped)
11 |   array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray) (escaped)
   |                      ^^^^^^^^^ (escaped)
   |   object_start(Self, JsonObject) -> JsonObject (escaped)
   |   object_push(Self, String, Json, JsonObject) -> JsonObject (escaped)

<WORKDIR>/src/lib/decode.mbt:11:33-11:42:
   | pub trait Decode { (escaped)
   |   array_start(Self, JsonArray) -> JsonArray (escaped)
   |   array_push(Self, Json, JsonArray) -> JsonArray (escaped)
11 |   array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray) (escaped)
   |                                 ^^^^^^^^^ (escaped)
   |   object_start(Self, JsonObject) -> JsonObject (escaped)
   |   object_push(Self, String, Json, JsonObject) -> JsonObject (escaped)

<WORKDIR>/src/lib/decode.mbt:11:48-11:57:
   | pub trait Decode { (escaped)
   |   array_start(Self, JsonArray) -> JsonArray (escaped)
   |   array_push(Self, Json, JsonArray) -> JsonArray (escaped)
11 |   array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray) (escaped)
   |                                                ^^^^^^^^^ (escaped)
   |   object_start(Self, JsonObject) -> JsonObject (escaped)
   |   object_push(Self, String, Json, JsonObject) -> JsonObject (escaped)

<WORKDIR>/src/lib/decode.mbt:11:59-11:68:
   | pub trait Decode { (escaped)
   |   array_start(Self, JsonArray) -> JsonArray (escaped)
   |   array_push(Self, Json, JsonArray) -> JsonArray (escaped)
11 |   array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray) (escaped)
   |                                                           ^^^^^^^^^ (escaped)
   |   object_start(Self, JsonObject) -> JsonObject (escaped)
   |   object_push(Self, String, Json, JsonObject) -> JsonObject (escaped)

<WORKDIR>/src/lib/decode.mbt:21:59-21:68:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
21 | impl Decode for Unit with array_start(_self, _old_acc) -> JsonArray { (escaped)
   |                                                           ^^^^^^^^^ (escaped)
   |   [] (escaped)
   | } (escaped)

<WORKDIR>/src/lib/value.mbt:10:13-10:22:
   | ///| (escaped)
   | pub struct ContinueValue { (escaped)
   |   rest : ArrayView[Char] (escaped)
10 |   arr_acc : JsonArray (escaped)
   |             ^^^^^^^^^ (escaped)
   |   obj_acc : JsonObject (escaped)
   |   stack : Array[Frame] (escaped)

<WORKDIR>/src/lib/value.mbt:20:13-20:22:
   | ///| (escaped)
   | pub struct FinishValue { (escaped)
   |   value : Json (escaped)
20 |   arr_acc : JsonArray (escaped)
   |             ^^^^^^^^^ (escaped)
   |   obj_acc : JsonObject (escaped)
   |   rest : ArrayView[Char] (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references JsonObject --loc 'src/lib/decode.mbt:5:10'
Found 12 references for symbol 'JsonObject':
<WORKDIR>/src/lib/decode.mbt:5:10-5:20:
  | pub type JsonArray = Array[Json] (escaped)
  |  (escaped)
  | ///| (escaped)
5 | pub type JsonObject = Map[String, Json] (escaped)
  |          ^^^^^^^^^^ (escaped)
  |  (escaped)
  | ///| (escaped)

<WORKDIR>/src/lib/decode.mbt:12:22-12:32:
   |   array_start(Self, JsonArray) -> JsonArray (escaped)
   |   array_push(Self, Json, JsonArray) -> JsonArray (escaped)
   |   array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray) (escaped)
12 |   object_start(Self, JsonObject) -> JsonObject (escaped)
   |                      ^^^^^^^^^^ (escaped)
   |   object_push(Self, String, Json, JsonObject) -> JsonObject (escaped)
   |   object_finish(Self, JsonObject, JsonObject) -> (JsonObject, JsonObject) (escaped)

<WORKDIR>/src/lib/decode.mbt:12:37-12:47:
   |   array_start(Self, JsonArray) -> JsonArray (escaped)
   |   array_push(Self, Json, JsonArray) -> JsonArray (escaped)
   |   array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray) (escaped)
12 |   object_start(Self, JsonObject) -> JsonObject (escaped)
   |                                     ^^^^^^^^^^ (escaped)
   |   object_push(Self, String, Json, JsonObject) -> JsonObject (escaped)
   |   object_finish(Self, JsonObject, JsonObject) -> (JsonObject, JsonObject) (escaped)

<WORKDIR>/src/lib/decode.mbt:13:35-13:45:
   |   array_push(Self, Json, JsonArray) -> JsonArray (escaped)
   |   array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray) (escaped)
   |   object_start(Self, JsonObject) -> JsonObject (escaped)
13 |   object_push(Self, String, Json, JsonObject) -> JsonObject (escaped)
   |                                   ^^^^^^^^^^ (escaped)
   |   object_finish(Self, JsonObject, JsonObject) -> (JsonObject, JsonObject) (escaped)
   |   double(Self, ArrayView[Char]) -> Double raise (escaped)

<WORKDIR>/src/lib/decode.mbt:13:50-13:60:
   |   array_push(Self, Json, JsonArray) -> JsonArray (escaped)
   |   array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray) (escaped)
   |   object_start(Self, JsonObject) -> JsonObject (escaped)
13 |   object_push(Self, String, Json, JsonObject) -> JsonObject (escaped)
   |                                                  ^^^^^^^^^^ (escaped)
   |   object_finish(Self, JsonObject, JsonObject) -> (JsonObject, JsonObject) (escaped)
   |   double(Self, ArrayView[Char]) -> Double raise (escaped)

<WORKDIR>/src/lib/decode.mbt:14:23-14:33:
   |   array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray) (escaped)
   |   object_start(Self, JsonObject) -> JsonObject (escaped)
   |   object_push(Self, String, Json, JsonObject) -> JsonObject (escaped)
14 |   object_finish(Self, JsonObject, JsonObject) -> (JsonObject, JsonObject) (escaped)
   |                       ^^^^^^^^^^ (escaped)
   |   double(Self, ArrayView[Char]) -> Double raise (escaped)
   |   integer(Self, ArrayView[Char]) -> Int raise (escaped)

<WORKDIR>/src/lib/decode.mbt:14:35-14:45:
   |   array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray) (escaped)
   |   object_start(Self, JsonObject) -> JsonObject (escaped)
   |   object_push(Self, String, Json, JsonObject) -> JsonObject (escaped)
14 |   object_finish(Self, JsonObject, JsonObject) -> (JsonObject, JsonObject) (escaped)
   |                                   ^^^^^^^^^^ (escaped)
   |   double(Self, ArrayView[Char]) -> Double raise (escaped)
   |   integer(Self, ArrayView[Char]) -> Int raise (escaped)

<WORKDIR>/src/lib/decode.mbt:14:51-14:61:
   |   array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray) (escaped)
   |   object_start(Self, JsonObject) -> JsonObject (escaped)
   |   object_push(Self, String, Json, JsonObject) -> JsonObject (escaped)
14 |   object_finish(Self, JsonObject, JsonObject) -> (JsonObject, JsonObject) (escaped)
   |                                                   ^^^^^^^^^^ (escaped)
   |   double(Self, ArrayView[Char]) -> Double raise (escaped)
   |   integer(Self, ArrayView[Char]) -> Int raise (escaped)

<WORKDIR>/src/lib/decode.mbt:14:63-14:73:
   |   array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray) (escaped)
   |   object_start(Self, JsonObject) -> JsonObject (escaped)
   |   object_push(Self, String, Json, JsonObject) -> JsonObject (escaped)
14 |   object_finish(Self, JsonObject, JsonObject) -> (JsonObject, JsonObject) (escaped)
   |                                                               ^^^^^^^^^^ (escaped)
   |   double(Self, ArrayView[Char]) -> Double raise (escaped)
   |   integer(Self, ArrayView[Char]) -> Int raise (escaped)

<WORKDIR>/src/lib/decode.mbt:36:60-36:70:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
36 | impl Decode for Unit with object_start(_self, _old_acc) -> JsonObject { (escaped)
   |                                                            ^^^^^^^^^^ (escaped)
   |   Map([]) (escaped)
   | } (escaped)

<WORKDIR>/src/lib/value.mbt:11:13-11:23:
   | pub struct ContinueValue { (escaped)
   |   rest : ArrayView[Char] (escaped)
   |   arr_acc : JsonArray (escaped)
11 |   obj_acc : JsonObject (escaped)
   |             ^^^^^^^^^^ (escaped)
   |   stack : Array[Frame] (escaped)
   |   decode : &Decode (escaped)

<WORKDIR>/src/lib/value.mbt:21:13-21:23:
   | pub struct FinishValue { (escaped)
   |   value : Json (escaped)
   |   arr_acc : JsonArray (escaped)
21 |   obj_acc : JsonObject (escaped)
   |             ^^^^^^^^^^ (escaped)
   |   rest : ArrayView[Char] (escaped)
   | } derive(Debug) (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references json --loc 'src/tests/top.mbt:2:7'
Error: could not find references for symbol 'json' at src/tests/top.mbt:2:7
[1]
```

```mooncram
$ run_moon_ide moon ide find-references decode_start --loc 'src/tests/top.mbt:2:14'
Found 3 references for symbol 'decode_start':
<WORKDIR>/src/tests/incr.mbt:21:31-21:43:
   | fn decode_chunks(chunks : ArrayView[String]) -> Value raise { (escaped)
   |   match chunks { (escaped)
   |     [first_chunk, .. chunks] => (escaped)
21 |       continue_chunks(chunks, decode_start(first_chunk)) (escaped)
   |                               ^^^^^^^^^^^^ (escaped)
   |     [] => raise InspectError::InspectError("expected at least one chunk") (escaped)
   |   } (escaped)

<WORKDIR>/src/tests/incr.mbt:71:33-71:45:
   |   guard compelet_json.to_array().chunks(6).map(String::from_array) (escaped)
   |     is [first_chunk, .. chunks] (escaped)
   |   // start parsing from `first_chunk` (escaped)
71 |   guard continue_chunks(chunks, decode_start(first_chunk)) (escaped)
   |                                 ^^^^^^^^^^^^ (escaped)
   |     is Finish({ value, .. }) (escaped)
   |   let expected = Json::object({ (escaped)

<WORKDIR>/src/tests/top.mbt:2:14-2:26:
  | ///| (escaped)
2 | using @json {decode_start, decode_continue, type Value} (escaped)
  |              ^^^^^^^^^^^^ (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'Context'
2 symbols found matching 'Context'
find-references only works with a single symbol, try to be more specific. (no-eol)
[1]
```

```mooncram
$ run_moon_ide moon ide find-references 'Frame'
`enum Frame` in package jinser/json/lib at <WORKDIR>/src/lib/json.mbt:12-17
12 | ///| (escaped)
   | enum Frame { (escaped)
   |   Array(Array[Json]) (escaped)
   |   Map(Map[String, Json]) (escaped)
   |   Key(String) (escaped)
   | } derive(Debug) (escaped)

Found 11 references for symbol 'Frame':
<WORKDIR>/src/lib/json.mbt:8:17-8:22:
  |   skip : Int (escaped)
  |   arr_acc : Array[Json] (escaped)
  |   obj_acc : Map[String, Json] (escaped)
8 |   stack : Array[Frame] (escaped)
  |                 ^^^^^ (escaped)
  |   decode : &Decode (escaped)
  | } (escaped)

<WORKDIR>/src/lib/json.mbt:13:6-13:11:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
13 | enum Frame { (escaped)
   |      ^^^^^ (escaped)
   |   Array(Array[Json]) (escaped)
   |   Map(Map[String, Json]) (escaped)

<WORKDIR>/src/lib/json.mbt:468:22-468:27:
    |     [] => unexpected(ctx, len, 0, Checkpoint::Value) (escaped)
    |     rest => { (escaped)
    |       let new_acc = decode.array_start(arr_acc) (escaped)
468 |       ctx.stack.push(Frame::Array(arr_acc)) (escaped)
    |                      ^^^^^ (escaped)
    |       value({ ..ctx, rest, skip: skip + len, arr_acc: new_acc }) (escaped)
    |     } (escaped)

<WORKDIR>/src/lib/json.mbt:482:37-482:42:
    |       array_push({ ..ctx, rest, skip: skip + 1 }, value0) (escaped)
    |     [']', .. rest] => { (escaped)
    |       let acc = ctx.decode.array_push(value0, ctx.arr_acc) (escaped)
482 |       guard ctx.stack.pop() is Some(Frame::Array(old_acc)) (escaped)
    |                                     ^^^^^ (escaped)
    |       let (array_value, new_acc) = ctx.decode.array_finish(acc, old_acc) (escaped)
    |       continue_( (escaped)

<WORKDIR>/src/lib/json.mbt:518:22-518:27:
    |       ) (escaped)
    |     } (escaped)
    |     ['"', .. rest] => { (escaped)
518 |       ctx.stack.push(Frame::Map(obj_acc)) (escaped)
    |                      ^^^^^ (escaped)
    |       string( (escaped)
    |         { (escaped)

<WORKDIR>/src/lib/json.mbt:540:22-540:27:
    |     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
    |       object_value({ ..ctx, rest, skip: skip + 1 }, key) (escaped)
    |     [':', .. rest] => { (escaped)
540 |       ctx.stack.push(Frame::Key(key)) (escaped)
    |                      ^^^^^ (escaped)
    |       value({ ..ctx, rest, skip: skip + 1 }) (escaped)
    |     } (escaped)

<WORKDIR>/src/lib/json.mbt:555:37-555:42:
    |       object_push({ ..ctx, rest, skip: skip + 1 }, value0, key) (escaped)
    |     ['}', .. rest] => { (escaped)
    |       let acc = ctx.decode.object_push(key, value0, ctx.obj_acc) (escaped)
555 |       guard ctx.stack.pop() is Some(Frame::Map(old_acc)) (escaped)
    |                                     ^^^^^ (escaped)
    |       let (object_value, new_acc) = ctx.decode.object_finish(acc, old_acc) (escaped)
    |       continue_( (escaped)

<WORKDIR>/src/lib/json.mbt:587:10-587:15:
    | fn continue_(ctx : Context, value : Json) -> Value raise { (escaped)
    |   match ctx.stack.last() { (escaped)
    |     None => terminate(ctx, value) (escaped)
587 |     Some(Frame::Array(_)) => array_push(ctx, value) (escaped)
    |          ^^^^^ (escaped)
    |     Some(Frame::Map(_)) => { (escaped)
    |       guard value is Json::String(key) (escaped)

<WORKDIR>/src/lib/json.mbt:588:10-588:15:
    |   match ctx.stack.last() { (escaped)
    |     None => terminate(ctx, value) (escaped)
    |     Some(Frame::Array(_)) => array_push(ctx, value) (escaped)
588 |     Some(Frame::Map(_)) => { (escaped)
    |          ^^^^^ (escaped)
    |       guard value is Json::String(key) (escaped)
    |       object_value(ctx, key) (escaped)

<WORKDIR>/src/lib/json.mbt:592:10-592:15:
    |       guard value is Json::String(key) (escaped)
    |       object_value(ctx, key) (escaped)
    |     } (escaped)
592 |     Some(Frame::Key(key)) => { (escaped)
    |          ^^^^^ (escaped)
    |       ctx.stack.pop() |> ignore (escaped)
    |       object_push({ ..ctx }, value, key) (escaped)

<WORKDIR>/src/lib/value.mbt:12:17-12:22:
   |   rest : ArrayView[Char] (escaped)
   |   arr_acc : JsonArray (escaped)
   |   obj_acc : JsonObject (escaped)
12 |   stack : Array[Frame] (escaped)
   |                 ^^^^^ (escaped)
   |   decode : &Decode (escaped)
   |   checkpoint : Checkpoint (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'decode'
6 symbols found matching 'decode'
find-references only works with a single symbol, try to be more specific. (no-eol)
[1]
```

```mooncram
$ run_moon_ide moon ide find-references 'decode_start'
3 symbols found matching 'decode_start'
find-references only works with a single symbol, try to be more specific. (no-eol)
[1]
```

```mooncram
$ run_moon_ide moon ide find-references 'decode_continue'
3 symbols found matching 'decode_continue'
find-references only works with a single symbol, try to be more specific. (no-eol)
[1]
```

```mooncram
$ run_moon_ide moon ide find-references 'value'
`fn value` in package jinser/json/lib at <WORKDIR>/src/lib/json.mbt:86-103
86 | ///| (escaped)
   | fn value(ctx : Context) -> Value raise { (escaped)
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
   |   } (escaped)
   | } (escaped)

Found 8 references for symbol 'value':
<WORKDIR>/src/lib/json.mbt:34:9-34:14:
   |     stack: [], (escaped)
   |     decode, (escaped)
   |   } (escaped)
34 |   match value(ctx) { (escaped)
   |         ^^^^^ (escaped)
   |     Finish({ value, rest: [], .. }) => value (escaped)
   |     Finish({ rest, .. }) => raise invalid_byte([..rest], 0) (escaped)

<WORKDIR>/src/lib/json.mbt:62:3-62:8:
   |     stack: [], (escaped)
   |     decode, (escaped)
   |   } (escaped)
62 |   value(ctx) (escaped)
   |   ^^^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/src/lib/json.mbt:78:59-78:64:
   |     decode: state.decode, (escaped)
   |   } (escaped)
   |   match state.checkpoint { (escaped)
78 |     Value | NumberI(_) | NumberD(_) | FloatError(_, _) => value(ctx) (escaped)
   |                                                           ^^^^^ (escaped)
   |     ArrayPush(v) => array_push(ctx, v) (escaped)
   |     ObjectKey => object_key(ctx) (escaped)

<WORKDIR>/src/lib/json.mbt:87:4-87:9:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
87 | fn value(ctx : Context) -> Value raise { (escaped)
   |    ^^^^^ (escaped)
   |   match ctx.rest { (escaped)
   |     // skip whitespace (escaped)

<WORKDIR>/src/lib/json.mbt:91:7-91:12:
   |   match ctx.rest { (escaped)
   |     // skip whitespace (escaped)
   |     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
91 |       value({ ..ctx, rest, skip: ctx.skip + 1 }) (escaped)
   |       ^^^^^ (escaped)
   |     ['0', .. rest] => number_zero({ ..ctx, rest, }, 1) (escaped)
   |     ['1'..='9', .. rest] => number({ ..ctx, rest, }, 1) (escaped)

<WORKDIR>/src/lib/json.mbt:469:7-469:12:
    |     rest => { (escaped)
    |       let new_acc = decode.array_start(arr_acc) (escaped)
    |       ctx.stack.push(Frame::Array(arr_acc)) (escaped)
469 |       value({ ..ctx, rest, skip: skip + len, arr_acc: new_acc }) (escaped)
    |       ^^^^^ (escaped)
    |     } (escaped)
    |   } (escaped)

<WORKDIR>/src/lib/json.mbt:491:7-491:12:
    |     } (escaped)
    |     [',', .. rest] => { (escaped)
    |       let arr_acc = ctx.decode.array_push(value0, ctx.arr_acc) (escaped)
491 |       value({ ..ctx, rest, skip: skip + 1, arr_acc }) (escaped)
    |       ^^^^^ (escaped)
    |     } (escaped)
    |     _ => unexpected(ctx, 0, 0, Checkpoint::ArrayPush(value0)) (escaped)

<WORKDIR>/src/lib/json.mbt:541:7-541:12:
    |       object_value({ ..ctx, rest, skip: skip + 1 }, key) (escaped)
    |     [':', .. rest] => { (escaped)
    |       ctx.stack.push(Frame::Key(key)) (escaped)
541 |       value({ ..ctx, rest, skip: skip + 1 }) (escaped)
    |       ^^^^^ (escaped)
    |     } (escaped)
    |     _ => unexpected(ctx, 0, 0, Checkpoint::ObjectValue(key)) (escaped)

```
