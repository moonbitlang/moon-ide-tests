# json find-references

````mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
````

````mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/json" && pwd)"
````

````mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
````

````mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
````

````mooncram
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

````

````mooncram
$ run_moon_ide moon ide find-references 'original' --loc 'src/lib/json.mbt:3:3'
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

````

````mooncram
$ run_moon_ide moon ide find-references 'ParseError' --loc 'src/lib/error.mbt:2:14'
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

````

````mooncram
$ run_moon_ide moon ide find-references 'ParseError' --loc 'src/lib/error.mbt:3:3'
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

````

````mooncram
$ run_moon_ide moon ide find-references 'Value' --loc 'src/lib/value.mbt:2:10'
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

````

````mooncram
$ run_moon_ide moon ide find-references 'Continue' --loc 'src/lib/value.mbt:3:3'
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

````

````mooncram
$ run_moon_ide moon ide find-references 'Decode' --loc 'src/lib/decode.mbt:8:11'
Found 17 references for symbol 'Decode':
<WORKDIR>/src/lib/decode.mbt:8:11-8:17:
  | pub type JsonObject = Map[String, Json] (escaped)
  |  (escaped)
  | ///| (escaped)
8 | pub trait Decode { (escaped)
  |           ^^^^^^ (escaped)
  |   array_start(Self, JsonArray) -> JsonArray (escaped)
  |   array_push(Self, Json, JsonArray) -> JsonArray (escaped)

<WORKDIR>/src/lib/decode.mbt:21:6-21:12:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
21 | impl Decode for Unit with array_start(_self, _old_acc) -> JsonArray { (escaped)
   |      ^^^^^^ (escaped)
   |   [] (escaped)
   | } (escaped)

<WORKDIR>/src/lib/decode.mbt:26:6-26:12:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
26 | impl Decode for Unit with array_push(_self, elem, acc) { (escaped)
   |      ^^^^^^ (escaped)
   |   [elem, ..acc] (escaped)
   | } (escaped)

<WORKDIR>/src/lib/decode.mbt:31:6-31:12:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
31 | impl Decode for Unit with array_finish(_self, acc, old_acc) { (escaped)
   |      ^^^^^^ (escaped)
   |   (acc.rev(), old_acc) (escaped)
   | } (escaped)

<WORKDIR>/src/lib/decode.mbt:36:6-36:12:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
36 | impl Decode for Unit with object_start(_self, _old_acc) -> JsonObject { (escaped)
   |      ^^^^^^ (escaped)
   |   Map([]) (escaped)
   | } (escaped)

<WORKDIR>/src/lib/decode.mbt:41:6-41:12:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
41 | impl Decode for Unit with object_push(_self, key, value, acc) { (escaped)
   |      ^^^^^^ (escaped)
   |   if !acc.contains(key) { (escaped)
   |     acc[key] = value (escaped)

<WORKDIR>/src/lib/decode.mbt:49:6-49:12:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
49 | impl Decode for Unit with object_finish(_self, acc, old_acc) { (escaped)
   |      ^^^^^^ (escaped)
   |   (acc, old_acc) (escaped)
   | } (escaped)

<WORKDIR>/src/lib/decode.mbt:54:6-54:12:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
54 | impl Decode for Unit with double(_self, view) -> Double raise { (escaped)
   |      ^^^^^^ (escaped)
   |   @string.parse_double(String::from_iter(view.iter())) (escaped)
   | } (escaped)

<WORKDIR>/src/lib/decode.mbt:59:6-59:12:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
59 | impl Decode for Unit with integer(_self, view) -> Int raise { (escaped)
   |      ^^^^^^ (escaped)
   |   @string.parse_int(String::from_iter(view.iter())) (escaped)
   | } (escaped)

<WORKDIR>/src/lib/decode.mbt:64:6-64:12:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
64 | impl Decode for Unit with string(_self, s) { (escaped)
   |      ^^^^^^ (escaped)
   |   s (escaped)
   | } (escaped)

<WORKDIR>/src/lib/json.mbt:9:13-9:19:
  |   arr_acc : Array[Json] (escaped)
  |   obj_acc : Map[String, Json] (escaped)
  |   stack : Array[Frame] (escaped)
9 |   decode : &Decode (escaped)
  |             ^^^^^^ (escaped)
  | } (escaped)
  |  (escaped)

<WORKDIR>/src/lib/json.mbt:20:42-20:48:
   | } derive(Debug) (escaped)
   |  (escaped)
   | ///| (escaped)
20 | pub fn decode(input : String, decode? : &Decode) -> Json raise { (escaped)
   |                                          ^^^^^^ (escaped)
   |   let decode : &Decode = match decode { (escaped)
   |     Some(decode) => decode (escaped)

<WORKDIR>/src/lib/json.mbt:21:17-21:23:
   |  (escaped)
   | ///| (escaped)
   | pub fn decode(input : String, decode? : &Decode) -> Json raise { (escaped)
21 |   let decode : &Decode = match decode { (escaped)
   |                 ^^^^^^ (escaped)
   |     Some(decode) => decode (escaped)
   |     None => () (escaped)

<WORKDIR>/src/lib/json.mbt:48:48-48:54:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
48 | pub fn decode_start(input : String, decode? : &Decode) -> Value raise { (escaped)
   |                                                ^^^^^^ (escaped)
   |   let decode : &Decode = match decode { (escaped)
   |     Some(decode) => decode (escaped)

<WORKDIR>/src/lib/json.mbt:49:17-49:23:
   |  (escaped)
   | ///| (escaped)
   | pub fn decode_start(input : String, decode? : &Decode) -> Value raise { (escaped)
49 |   let decode : &Decode = match decode { (escaped)
   |                 ^^^^^^ (escaped)
   |     Some(decode) => decode (escaped)
   |     None => () (escaped)

<WORKDIR>/src/lib/value.mbt:13:13-13:19:
   |   arr_acc : JsonArray (escaped)
   |   obj_acc : JsonObject (escaped)
   |   stack : Array[Frame] (escaped)
13 |   decode : &Decode (escaped)
   |             ^^^^^^ (escaped)
   |   checkpoint : Checkpoint (escaped)
   | } (escaped)

<WORKDIR>/src/top.mbt:3:9-3:15:
  | ///| (escaped)
  | pub using @lib { (escaped)
3 |   trait Decode, (escaped)
  |         ^^^^^^ (escaped)
  |   decode, (escaped)
  |   decode_start, (escaped)

````

````mooncram
$ run_moon_ide moon ide find-references 'array_start' --loc 'src/lib/decode.mbt:9:3'
Found 4 references for symbol 'array_start':
<WORKDIR>/src/lib/decode.mbt:9:3-9:14:
  |  (escaped)
  | ///| (escaped)
  | pub trait Decode { (escaped)
9 |   array_start(Self, JsonArray) -> JsonArray (escaped)
  |   ^^^^^^^^^^^ (escaped)
  |   array_push(Self, Json, JsonArray) -> JsonArray (escaped)
  |   array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray) (escaped)

<WORKDIR>/src/lib/decode.mbt:21:27-21:38:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
21 | impl Decode for Unit with array_start(_self, _old_acc) -> JsonArray { (escaped)
   |                           ^^^^^^^^^^^ (escaped)
   |   [] (escaped)
   | } (escaped)

<WORKDIR>/src/lib/json.mbt:457:20-457:31:
    |       array_start({ ..ctx, rest, }, len + 1) (escaped)
    |     [']', .. rest] => { (escaped)
    |       let (value, new_acc) = ctx.decode.array_finish( (escaped)
457 |         ctx.decode.array_start(arr_acc), (escaped)
    |                    ^^^^^^^^^^^ (escaped)
    |         arr_acc, (escaped)
    |       ) (escaped)

<WORKDIR>/src/lib/json.mbt:467:28-467:39:
    |     } (escaped)
    |     [] => unexpected(ctx, len, 0, Checkpoint::Value) (escaped)
    |     rest => { (escaped)
467 |       let new_acc = decode.array_start(arr_acc) (escaped)
    |                            ^^^^^^^^^^^ (escaped)
    |       ctx.stack.push(Frame::Array(arr_acc)) (escaped)
    |       value({ ..ctx, rest, skip: skip + len, arr_acc: new_acc }) (escaped)

````

````mooncram
$ run_moon_ide moon ide find-references 'decode_start' --loc 'src/tests/top.mbt:2:14'
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

````

````mooncram
$ run_moon_ide moon ide find-references 'decode_continue' --loc 'src/tests/top.mbt:2:28'
Found 2 references for symbol 'decode_continue':
<WORKDIR>/src/tests/incr.mbt:11:29-11:44:
   |   match (chunks, value) { (escaped)
   |     ([], value) => value (escaped)
   |     ([chunk, .. rest], Continue(state)) => (escaped)
11 |       continue_chunks(rest, decode_continue(chunk, state)) (escaped)
   |                             ^^^^^^^^^^^^^^^ (escaped)
   |     ([_, ..], Finish(_)) => (escaped)
   |       raise InspectError::InspectError("parser finished before all chunks") (escaped)

<WORKDIR>/src/tests/top.mbt:2:28-2:43:
  | ///| (escaped)
2 | using @json {decode_start, decode_continue, type Value} (escaped)
  |                            ^^^^^^^^^^^^^^^ (escaped)

````
