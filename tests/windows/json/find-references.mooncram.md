# json find-references

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide find-references 'Context' --loc 'src\lib\json.mbt:2:13'
Found 34 references for symbol 'Context':
<WORKDIR>/src\lib\json.mbt:2:13-2:20:
  | ///|
2 | priv struct Context {
  |             ^^^^^^^
  |   original : Array[Char]
  |   rest : ArrayView[Char]

<WORKDIR>/src\lib\json.mbt:25:13-25:20:
   |     Some(decode) => decode
   |     None => () (escaped)
   |   }
25 |   let ctx = Context::{
   |             ^^^^^^^
   |     rest: input.to_array()[:],
   |     original: input.to_array(),

<WORKDIR>/src\lib\json.mbt:53:13-53:20:
   |     Some(decode) => decode
   |     None => () (escaped)
   |   }
53 |   let ctx = Context::{
   |             ^^^^^^^
   |     rest: input.to_array()[:],
   |     original: input.to_array(),

<WORKDIR>/src\lib\json.mbt:68:13-68:20:
   | ///|
   | pub fn decode_continue(cont : String, state : ContinueValue) -> Value raise {
   |   let input = [..state.rest, ..cont.to_array()]
68 |   let ctx = Context::{
   |             ^^^^^^^
   |     rest: input[:],
   |     original: input,

<WORKDIR>/src\lib\json.mbt:87:16-87:23:
   | }
   | 
   | ///|
87 | fn value(ctx : Context) -> Value raise {
   |                ^^^^^^^
   |   match ctx.rest {
   |     // skip whitespace

<WORKDIR>/src\lib\json.mbt:108:22-108:29:
    | // number {{{
    | 
    | ///|
108 | fn number_zero(ctx : Context, len : Int) -> Value raise {
    |                      ^^^^^^^
    |   let { original, skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:130:17-130:24:
    | }
    | 
    | ///|
130 | fn number(ctx : Context, len : Int) -> Value raise {
    |                 ^^^^^^^
    |   let { original, skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:153:22-153:29:
    | }
    | 
    | ///|
153 | fn number_frac(ctx : Context, len : Int) -> Value raise {
    |                      ^^^^^^^
    |   match ctx.rest {
    |     ['0'..='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1)

<WORKDIR>/src\lib\json.mbt:161:27-161:34:
    | }
    | 
    | ///|
161 | fn number_frac_cont(ctx : Context, len : Int) -> Value raise {
    |                           ^^^^^^^
    |   let { original, skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:175:9-175:16:
    | 
    | ///|
    | fn float_decode(
175 |   ctx : Context,
    |         ^^^^^^^
    |   len : Int,
    |   token : ArrayView[Char],

<WORKDIR>/src\lib\json.mbt:197:21-197:28:
    | }
    | 
    | ///|
197 | fn number_exp(ctx : Context, len : Int) -> Value raise {
    |                     ^^^^^^^
    |   match ctx.rest {
    |     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1)

<WORKDIR>/src\lib\json.mbt:206:26-206:33:
    | }
    | 
    | ///|
206 | fn number_exp_sign(ctx : Context, len : Int) -> Value raise {
    |                          ^^^^^^^
    |   match ctx.rest {
    |     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1)

<WORKDIR>/src\lib\json.mbt:214:26-214:33:
    | }
    | 
    | ///|
214 | fn number_exp_cont(ctx : Context, len : Int) -> Value raise {
    |                          ^^^^^^^
    |   let { original, skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:226:23-226:30:
    | }
    | 
    | ///|
226 | fn number_minus(ctx : Context) -> Value raise {
    |                       ^^^^^^^
    |   match ctx.rest {
    |     ['0', .. rest] => number_zero({ ..ctx, rest, }, 2)

<WORKDIR>/src\lib\json.mbt:235:25-235:32:
    | }
    | 
    | ///|
235 | fn integer_decode(ctx : Context, token : ArrayView[Char]) -> Int raise {
    |                         ^^^^^^^
    |   try ctx.decode.integer(token) catch {
    |     _ => raise ParseError(UnexpectedSequence(token.to_owned(), ctx.skip))

<WORKDIR>/src\lib\json.mbt:248:16-248:23:
    | // constants {{{
    | 
    | ///|
248 | fn true_(ctx : Context) -> Value raise {
    |                ^^^^^^^
    |   match ctx.rest {
    |     ['r', 'u', 'e', .. rest] =>

<WORKDIR>/src\lib\json.mbt:257:17-257:24:
    | }
    | 
    | ///|
257 | fn false_(ctx : Context) -> Value raise {
    |                 ^^^^^^^
    |   match ctx.rest {
    |     ['a', 'l', 's', 'e', .. rest] =>

<WORKDIR>/src\lib\json.mbt:266:15-266:22:
    | }
    | 
    | ///|
266 | fn null(ctx : Context) -> Value raise {
    |               ^^^^^^^
    |   match ctx.rest {
    |     ['u', 'l', 'l', .. rest] =>

<WORKDIR>/src\lib\json.mbt:279:17-279:24:
    | // string {{{
    | 
    | ///|
279 | fn string(ctx : Context, len : Int) -> Value raise {
    |                 ^^^^^^^
    |   let builder = StringBuilder::new(size_hint=len)
    |   string_scan(ctx, len, builder)

<WORKDIR>/src\lib\json.mbt:286:9-286:16:
    | 
    | ///|
    | fn string_scan(
286 |   ctx : Context,
    |         ^^^^^^^
    |   len : Int,
    |   builder : StringBuilder,

<WORKDIR>/src\lib\json.mbt:311:9-311:16:
    | 
    | ///|
    | fn string_escape(
311 |   ctx : Context,
    |         ^^^^^^^
    |   len : Int,
    |   builder : StringBuilder,

<WORKDIR>/src\lib\json.mbt:362:9-362:16:
    | 
    | ///|
    | fn string_unicode(
362 |   ctx : Context,
    |         ^^^^^^^
    |   len : Int,
    |   code_unit : Int,

<WORKDIR>/src\lib\json.mbt:408:9-408:16:
    | 
    | ///|
    | fn unicode_escape_value(
408 |   ctx : Context,
    |         ^^^^^^^
    |   len : Int,
    |   a : Char,

<WORKDIR>/src\lib\json.mbt:423:20-423:27:
    | }
    | 
    | ///|
423 | fn hex_value(ctx : Context, index : Int, c : Char) -> Int raise {
    |                    ^^^^^^^
    |   match c {
    |     '0'..='9' => c.to_int() - '0'.to_int()

<WORKDIR>/src\lib\json.mbt:434:9-434:16:
    | 
    | ///|
    | fn write_codepoint(
434 |   ctx : Context,
    |         ^^^^^^^
    |   index : Int,
    |   codepoint : Int,

<WORKDIR>/src\lib\json.mbt:450:22-450:29:
    | // array {{{
    | 
    | ///|
450 | fn array_start(ctx : Context, len : Int) -> Value raise {
    |                      ^^^^^^^
    |   let { decode, skip, arr_acc, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:475:21-475:28:
    | }
    | 
    | ///|
475 | fn array_push(ctx : Context, value0 : Json) -> Value raise {
    |                     ^^^^^^^
    |   let { skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:502:23-502:30:
    | // object {{{
    | 
    | ///|
502 | fn object_start(ctx : Context, len : Int) -> Value raise {
    |                       ^^^^^^^
    |   let { obj_acc, skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:534:23-534:30:
    | }
    | 
    | ///|
534 | fn object_value(ctx : Context, key : String) -> Value raise {
    |                       ^^^^^^^
    |   let { skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:548:22-548:29:
    | }
    | 
    | ///|
548 | fn object_push(ctx : Context, value0 : Json, key : String) -> Value raise {
    |                      ^^^^^^^
    |   let { skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:571:21-571:28:
    | }
    | 
    | ///|
571 | fn object_key(ctx : Context) -> Value raise {
    |                     ^^^^^^^
    |   let { skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:584:20-584:27:
    | // }}}
    | 
    | ///|
584 | fn continue_(ctx : Context, value : Json) -> Value raise {
    |                    ^^^^^^^
    |   match ctx.stack.last() {
    |     None => terminate(ctx, value)

<WORKDIR>/src\lib\json.mbt:600:20-600:27:
    | }
    | 
    | ///|
600 | fn terminate(ctx : Context, value : Json) -> Value raise {
    |                    ^^^^^^^
    |   let { rest, original, skip, arr_acc, obj_acc, .. } = ctx
    |   match rest {

<WORKDIR>/src\lib\json.mbt:615:9-615:16:
    | 
    | ///|
    | fn unexpected(
615 |   ctx : Context,
    |         ^^^^^^^
    |   pos : Int,
    |   len : Int,

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide find-references 'original' --loc 'src\lib\json.mbt:3:3'
Found 18 references for symbol 'original':
<WORKDIR>/src\lib\json.mbt:3:3-3:11:
  | ///|
  | priv struct Context {
3 |   original : Array[Char]
  |   ^^^^^^^^
  |   rest : ArrayView[Char]
  |   skip : Int

<WORKDIR>/src\lib\json.mbt:27:5-27:13:
   |   }
   |   let ctx = Context::{
   |     rest: input.to_array()[:],
27 |     original: input.to_array(),
   |     ^^^^^^^^
   |     skip: 0,
   |     arr_acc: [],

<WORKDIR>/src\lib\json.mbt:55:5-55:13:
   |   }
   |   let ctx = Context::{
   |     rest: input.to_array()[:],
55 |     original: input.to_array(),
   |     ^^^^^^^^
   |     skip: 0,
   |     arr_acc: [],

<WORKDIR>/src\lib\json.mbt:70:5-70:13:
   |   let input = [..state.rest, ..cont.to_array()]
   |   let ctx = Context::{
   |     rest: input[:],
70 |     original: input,
   |     ^^^^^^^^
   |     skip: 0,
   |     arr_acc: state.arr_acc,

<WORKDIR>/src\lib\json.mbt:109:9-109:17:
    | 
    | ///|
    | fn number_zero(ctx : Context, len : Int) -> Value raise {
109 |   let { original, skip, .. } = ctx
    |         ^^^^^^^^
    |   match ctx.rest {
    |     [] => {

<WORKDIR>/src\lib\json.mbt:131:9-131:17:
    | 
    | ///|
    | fn number(ctx : Context, len : Int) -> Value raise {
131 |   let { original, skip, .. } = ctx
    |         ^^^^^^^^
    |   match ctx.rest {
    |     ['0'..='9', .. rest] => number({ ..ctx, rest, }, len + 1)

<WORKDIR>/src\lib\json.mbt:162:9-162:17:
    | 
    | ///|
    | fn number_frac_cont(ctx : Context, len : Int) -> Value raise {
162 |   let { original, skip, .. } = ctx
    |         ^^^^^^^^
    |   match ctx.rest {
    |     ['0'..='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1)

<WORKDIR>/src\lib\json.mbt:215:9-215:17:
    | 
    | ///|
    | fn number_exp_cont(ctx : Context, len : Int) -> Value raise {
215 |   let { original, skip, .. } = ctx
    |         ^^^^^^^^
    |   match ctx.rest {
    |     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1)

<WORKDIR>/src\lib\json.mbt:300:32-300:40:
    |     ['\\', .. rest] => string_escape({ ..ctx, rest, }, len, builder)
    |     [c, .. rest] =>
    |       if c.to_int() < 0x20 {
300 |         raise invalid_byte(ctx.original, skip + len)
    |                                ^^^^^^^^
    |       } else {
    |         builder.write_char(c)

<WORKDIR>/src\lib\json.mbt:354:39-354:47:
    |     }
    |     ['u', ..] =>
    |       unexpected({ ..ctx, skip: ctx.skip - 1 }, len + 6, 0, Checkpoint::Value)
354 |     [_, ..] => raise invalid_byte(ctx.original, ctx.skip + len + 1)
    |                                       ^^^^^^^^
    |     [] =>
    |       unexpected({ ..ctx, skip: ctx.skip - 1 }, len + 2, 0, Checkpoint::Value)

<WORKDIR>/src\lib\json.mbt:379:34-379:42:
    |           write_codepoint(ctx, ctx.skip + len, codepoint, builder)
    |           string_scan({ ..ctx, rest, }, len + 12, builder)
    |         } else {
379 |           raise invalid_byte(ctx.original, ctx.skip + len + 8)
    |                                  ^^^^^^^^
    |         }
    |       }

<WORKDIR>/src\lib\json.mbt:396:35-396:43:
    |           0,
    |           Checkpoint::Value,
    |         )
396 |       _ => raise invalid_byte(ctx.original, ctx.skip + len + 6)
    |                                   ^^^^^^^^
    |     }
    |   } else if code_unit.is_trailing_surrogate() {

<WORKDIR>/src\lib\json.mbt:399:28-399:36:
    |       _ => raise invalid_byte(ctx.original, ctx.skip + len + 6)
    |     }
    |   } else if code_unit.is_trailing_surrogate() {
399 |     raise invalid_byte(ctx.original, ctx.skip + len + 2)
    |                            ^^^^^^^^
    |   } else {
    |     write_codepoint(ctx, ctx.skip + len + 2, code_unit, builder)

<WORKDIR>/src\lib\json.mbt:428:33-428:41:
    |     '0'..='9' => c.to_int() - '0'.to_int()
    |     'a'..='f' => c.to_int() - 'a'.to_int() + 10
    |     'A'..='F' => c.to_int() - 'A'.to_int() + 10
428 |     _ => raise invalid_byte(ctx.original, index)
    |                                 ^^^^^^^^
    |   }
    | }

<WORKDIR>/src\lib\json.mbt:441:36-441:44:
    | ) -> Unit raise {
    |   match codepoint.to_char() {
    |     Some(c) => builder.write_char(c)
441 |     None => raise invalid_byte(ctx.original, index)
    |                                    ^^^^^^^^
    |   }
    | }

<WORKDIR>/src\lib\json.mbt:601:15-601:23:
    | 
    | ///|
    | fn terminate(ctx : Context, value : Json) -> Value raise {
601 |   let { rest, original, skip, arr_acc, obj_acc, .. } = ctx
    |               ^^^^^^^^
    |   match rest {
    |     // skip whitespace

<WORKDIR>/src\lib\json.mbt:620:9-620:17:
    |   len : Int,
    |   func_data : Checkpoint,
    | ) -> Value raise {
620 |   let { original, arr_acc, obj_acc, skip, stack, decode, .. } = ctx
    |         ^^^^^^^^
    |   let required_size = skip + pos + len
    |   let original_size = original.length()

<WORKDIR>/src\lib\json.mbt:634:28-634:36:
    |       checkpoint: func_data,
    |     })
    |   } else {
634 |     raise invalid_byte(ctx.original, ctx.skip + pos)
    |                            ^^^^^^^^
    |   }
    | }

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide find-references 'ParseError' --loc 'src\lib\error.mbt:2:14'
Found 3 references for symbol 'ParseError':
<WORKDIR>/src\lib\error.mbt:2:14-2:24:
  | ///|
2 | pub suberror ParseError {
  |              ^^^^^^^^^^
  |   ParseError(Reason)
  | } derive(Debug)

<WORKDIR>/src\lib\json.mbt:639:51-639:61:
    | }
    | 
    | ///|
639 | fn invalid_byte(arr : Array[Char], skip : Int) -> ParseError {
    |                                                   ^^^^^^^^^^
    |   let byte = arr[skip]
    |   ParseError(InvalidByte(skip, byte))

<WORKDIR>/src\top.mbt:10:8-10:18:
   |   type Value,
   |   type ContinueValue,
   |   type FinishValue,
10 |   type ParseError,
   |        ^^^^^^^^^^
   |   type Reason,
   | }

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide find-references 'ParseError' --loc 'src\lib\error.mbt:3:3'
Found 8 references for symbol 'ParseError':
<WORKDIR>/src\lib\error.mbt:3:3-3:13:
  | ///|
  | pub suberror ParseError {
3 |   ParseError(Reason)
  |   ^^^^^^^^^^
  | } derive(Debug)
  | 

<WORKDIR>/src\lib\json.mbt:42:13-42:23:
   |     Continue({ stack: [], checkpoint: Checkpoint::NumberD(n), .. }) =>
   |       n.to_json()
   |     Continue({ checkpoint: Checkpoint::FloatError(token, skip), .. }) =>
42 |       raise ParseError(UnexpectedSequence(token.to_owned(), skip))
   |             ^^^^^^^^^^
   |     Continue({ checkpoint: cp, .. }) => raise ParseError(UnexpectedEnd(cp))
   |   }

<WORKDIR>/src\lib\json.mbt:43:47-43:57:
   |       n.to_json()
   |     Continue({ checkpoint: Checkpoint::FloatError(token, skip), .. }) =>
   |       raise ParseError(UnexpectedSequence(token.to_owned(), skip))
43 |     Continue({ checkpoint: cp, .. }) => raise ParseError(UnexpectedEnd(cp))
   |                                               ^^^^^^^^^^
   |   }
   | }

<WORKDIR>/src\lib\json.mbt:237:16-237:26:
    | ///|
    | fn integer_decode(ctx : Context, token : ArrayView[Char]) -> Int raise {
    |   try ctx.decode.integer(token) catch {
237 |     _ => raise ParseError(UnexpectedSequence(token.to_owned(), ctx.skip))
    |                ^^^^^^^^^^
    |   } noraise {
    |     value => value

<WORKDIR>/src\lib\json.mbt:641:3-641:13:
    | ///|
    | fn invalid_byte(arr : Array[Char], skip : Int) -> ParseError {
    |   let byte = arr[skip]
641 |   ParseError(InvalidByte(skip, byte))
    |   ^^^^^^^^^^
    | }

<WORKDIR>/src\tests\incr.mbt:51:10-51:20:
   |   chunks : ArrayView[String],
   | ) -> Unit raise {
   |   try decode_chunks(chunks) catch {
51 |     @lib.ParseError(_) => () (escaped)
   |          ^^^^^^^^^^
   |     _ =>
   |       incr_fail(

<WORKDIR>/src\tests\json_testsuite_helpers_test.mbt:18:10-18:20:
   | ///|
   | fn expect_reject(name : String, input : String) -> Unit raise {
   |   try @json.decode(input) catch {
18 |     @lib.ParseError(_) => () (escaped)
   |          ^^^^^^^^^^
   |     _ =>
   |       json_testsuite_fail(

<WORKDIR>/src\tests\json_testsuite_helpers_test.mbt:34:10-34:20:
   | ///|
   | fn expect_accept_or_reject(name : String, input : String) -> Unit raise {
   |   try @json.decode(input) catch {
34 |     @lib.ParseError(_) => () (escaped)
   |          ^^^^^^^^^^
   |     _ =>
   |       json_testsuite_fail(

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide find-references 'Value' --loc 'src\lib\value.mbt:2:10'
Found 33 references for symbol 'Value':
<WORKDIR>/src\lib\json.mbt:48:59-48:64:
   | }
   | 
   | ///|
48 | pub fn decode_start(input : String, decode? : &Decode) -> Value raise {
   |                                                           ^^^^^
   |   let decode : &Decode = match decode {
   |     Some(decode) => decode

<WORKDIR>/src\lib\json.mbt:66:65-66:70:
   | }
   | 
   | ///|
66 | pub fn decode_continue(cont : String, state : ContinueValue) -> Value raise {
   |                                                                 ^^^^^
   |   let input = [..state.rest, ..cont.to_array()]
   |   let ctx = Context::{

<WORKDIR>/src\lib\json.mbt:87:28-87:33:
   | }
   | 
   | ///|
87 | fn value(ctx : Context) -> Value raise {
   |                            ^^^^^
   |   match ctx.rest {
   |     // skip whitespace

<WORKDIR>/src\lib\json.mbt:108:45-108:50:
    | // number {{{
    | 
    | ///|
108 | fn number_zero(ctx : Context, len : Int) -> Value raise {
    |                                             ^^^^^
    |   let { original, skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:130:40-130:45:
    | }
    | 
    | ///|
130 | fn number(ctx : Context, len : Int) -> Value raise {
    |                                        ^^^^^
    |   let { original, skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:153:45-153:50:
    | }
    | 
    | ///|
153 | fn number_frac(ctx : Context, len : Int) -> Value raise {
    |                                             ^^^^^
    |   match ctx.rest {
    |     ['0'..='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1)

<WORKDIR>/src\lib\json.mbt:161:50-161:55:
    | }
    | 
    | ///|
161 | fn number_frac_cont(ctx : Context, len : Int) -> Value raise {
    |                                                  ^^^^^
    |   let { original, skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:178:6-178:11:
    |   ctx : Context,
    |   len : Int,
    |   token : ArrayView[Char],
178 | ) -> Value raise {
    |      ^^^^^
    |   let { skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:197:44-197:49:
    | }
    | 
    | ///|
197 | fn number_exp(ctx : Context, len : Int) -> Value raise {
    |                                            ^^^^^
    |   match ctx.rest {
    |     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1)

<WORKDIR>/src\lib\json.mbt:206:49-206:54:
    | }
    | 
    | ///|
206 | fn number_exp_sign(ctx : Context, len : Int) -> Value raise {
    |                                                 ^^^^^
    |   match ctx.rest {
    |     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1)

<WORKDIR>/src\lib\json.mbt:214:49-214:54:
    | }
    | 
    | ///|
214 | fn number_exp_cont(ctx : Context, len : Int) -> Value raise {
    |                                                 ^^^^^
    |   let { original, skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:226:35-226:40:
    | }
    | 
    | ///|
226 | fn number_minus(ctx : Context) -> Value raise {
    |                                   ^^^^^
    |   match ctx.rest {
    |     ['0', .. rest] => number_zero({ ..ctx, rest, }, 2)

<WORKDIR>/src\lib\json.mbt:248:28-248:33:
    | // constants {{{
    | 
    | ///|
248 | fn true_(ctx : Context) -> Value raise {
    |                            ^^^^^
    |   match ctx.rest {
    |     ['r', 'u', 'e', .. rest] =>

<WORKDIR>/src\lib\json.mbt:257:29-257:34:
    | }
    | 
    | ///|
257 | fn false_(ctx : Context) -> Value raise {
    |                             ^^^^^
    |   match ctx.rest {
    |     ['a', 'l', 's', 'e', .. rest] =>

<WORKDIR>/src\lib\json.mbt:266:27-266:32:
    | }
    | 
    | ///|
266 | fn null(ctx : Context) -> Value raise {
    |                           ^^^^^
    |   match ctx.rest {
    |     ['u', 'l', 'l', .. rest] =>

<WORKDIR>/src\lib\json.mbt:279:40-279:45:
    | // string {{{
    | 
    | ///|
279 | fn string(ctx : Context, len : Int) -> Value raise {
    |                                        ^^^^^
    |   let builder = StringBuilder::new(size_hint=len)
    |   string_scan(ctx, len, builder)

<WORKDIR>/src\lib\json.mbt:289:6-289:11:
    |   ctx : Context,
    |   len : Int,
    |   builder : StringBuilder,
289 | ) -> Value raise {
    |      ^^^^^
    |   let { skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:314:6-314:11:
    |   ctx : Context,
    |   len : Int,
    |   builder : StringBuilder,
314 | ) -> Value raise {
    |      ^^^^^
    |   match ctx.rest {
    |     ['"', .. rest] => {

<WORKDIR>/src\lib\json.mbt:367:6-367:11:
    |   code_unit : Int,
    |   rest : ArrayView[Char],
    |   builder : StringBuilder,
367 | ) -> Value raise {
    |      ^^^^^
    |   if code_unit.is_leading_surrogate() {
    |     match rest {

<WORKDIR>/src\lib\json.mbt:450:45-450:50:
    | // array {{{
    | 
    | ///|
450 | fn array_start(ctx : Context, len : Int) -> Value raise {
    |                                             ^^^^^
    |   let { decode, skip, arr_acc, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:475:48-475:53:
    | }
    | 
    | ///|
475 | fn array_push(ctx : Context, value0 : Json) -> Value raise {
    |                                                ^^^^^
    |   let { skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:502:46-502:51:
    | // object {{{
    | 
    | ///|
502 | fn object_start(ctx : Context, len : Int) -> Value raise {
    |                                              ^^^^^
    |   let { obj_acc, skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:534:49-534:54:
    | }
    | 
    | ///|
534 | fn object_value(ctx : Context, key : String) -> Value raise {
    |                                                 ^^^^^
    |   let { skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:548:63-548:68:
    | }
    | 
    | ///|
548 | fn object_push(ctx : Context, value0 : Json, key : String) -> Value raise {
    |                                                               ^^^^^
    |   let { skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:571:33-571:38:
    | }
    | 
    | ///|
571 | fn object_key(ctx : Context) -> Value raise {
    |                                 ^^^^^
    |   let { skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:584:46-584:51:
    | // }}}
    | 
    | ///|
584 | fn continue_(ctx : Context, value : Json) -> Value raise {
    |                                              ^^^^^
    |   match ctx.stack.last() {
    |     None => terminate(ctx, value)

<WORKDIR>/src\lib\json.mbt:600:46-600:51:
    | }
    | 
    | ///|
600 | fn terminate(ctx : Context, value : Json) -> Value raise {
    |                                              ^^^^^
    |   let { rest, original, skip, arr_acc, obj_acc, .. } = ctx
    |   match rest {

<WORKDIR>/src\lib\json.mbt:605:11-605:16:
    |   match rest {
    |     // skip whitespace
    |     ['\ ' | '\n' | '\r' | '\t', .. rest] => terminate({ ..ctx, rest, }, value)
605 |     [] => Value::Finish({ value, arr_acc, obj_acc, rest: [][:] })
    |           ^^^^^
    |     _ => {
    |       let rest = original[skip:]

<WORKDIR>/src\lib\json.mbt:608:7-608:12:
    |     [] => Value::Finish({ value, arr_acc, obj_acc, rest: [][:] })
    |     _ => {
    |       let rest = original[skip:]
608 |       Value::Finish({ value, arr_acc, obj_acc, rest })
    |       ^^^^^
    |     }
    |   }

<WORKDIR>/src\lib\json.mbt:619:6-619:11:
    |   pos : Int,
    |   len : Int,
    |   func_data : Checkpoint,
619 | ) -> Value raise {
    |      ^^^^^
    |   let { original, arr_acc, obj_acc, skip, stack, decode, .. } = ctx
    |   let required_size = skip + pos + len

<WORKDIR>/src\lib\json.mbt:625:5-625:10:
    |   let original_size = original.length()
    |   if original_size <= required_size {
    |     let rest = original[skip:]
625 |     Value::Continue(ContinueValue::{
    |     ^^^^^
    |       rest,
    |       arr_acc,

<WORKDIR>/src\lib\value.mbt:2:10-2:15:
  | ///|
2 | pub enum Value {
  |          ^^^^^
  |   Continue(ContinueValue)
  |   Finish(FinishValue)

<WORKDIR>/src\top.mbt:7:8-7:13:
  |   decode,
  |   decode_start,
  |   decode_continue,
7 |   type Value,
  |        ^^^^^
  |   type ContinueValue,
  |   type FinishValue,

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide find-references 'Continue' --loc 'src\lib\value.mbt:3:3'
Found 10 references for symbol 'Continue':
<WORKDIR>/src\lib\json.mbt:37:5-37:13:
   |   match value(ctx) {
   |     Finish({ value, rest: [], .. }) => value
   |     Finish({ rest, .. }) => raise invalid_byte([..rest], 0)
37 |     Continue({ stack: [], checkpoint: Checkpoint::NumberI(n), .. }) =>
   |     ^^^^^^^^
   |       n.to_json()
   |     Continue({ stack: [], checkpoint: Checkpoint::NumberD(n), .. }) =>

<WORKDIR>/src\lib\json.mbt:39:5-39:13:
   |     Finish({ rest, .. }) => raise invalid_byte([..rest], 0)
   |     Continue({ stack: [], checkpoint: Checkpoint::NumberI(n), .. }) =>
   |       n.to_json()
39 |     Continue({ stack: [], checkpoint: Checkpoint::NumberD(n), .. }) =>
   |     ^^^^^^^^
   |       n.to_json()
   |     Continue({ checkpoint: Checkpoint::FloatError(token, skip), .. }) =>

<WORKDIR>/src\lib\json.mbt:41:5-41:13:
   |       n.to_json()
   |     Continue({ stack: [], checkpoint: Checkpoint::NumberD(n), .. }) =>
   |       n.to_json()
41 |     Continue({ checkpoint: Checkpoint::FloatError(token, skip), .. }) =>
   |     ^^^^^^^^
   |       raise ParseError(UnexpectedSequence(token.to_owned(), skip))
   |     Continue({ checkpoint: cp, .. }) => raise ParseError(UnexpectedEnd(cp))

<WORKDIR>/src\lib\json.mbt:43:5-43:13:
   |       n.to_json()
   |     Continue({ checkpoint: Checkpoint::FloatError(token, skip), .. }) =>
   |       raise ParseError(UnexpectedSequence(token.to_owned(), skip))
43 |     Continue({ checkpoint: cp, .. }) => raise ParseError(UnexpectedEnd(cp))
   |     ^^^^^^^^
   |   }
   | }

<WORKDIR>/src\lib\json.mbt:625:12-625:20:
    |   let original_size = original.length()
    |   if original_size <= required_size {
    |     let rest = original[skip:]
625 |     Value::Continue(ContinueValue::{
    |            ^^^^^^^^
    |       rest,
    |       arr_acc,

<WORKDIR>/src\lib\value.mbt:3:3-3:11:
  | ///|
  | pub enum Value {
3 |   Continue(ContinueValue)
  |   ^^^^^^^^
  |   Finish(FinishValue)
  | }

<WORKDIR>/src\tests\incr.mbt:10:24-10:32:
   | fn continue_chunks(chunks : ArrayView[String], value : Value) -> Value raise {
   |   match (chunks, value) {
   |     ([], value) => value
10 |     ([chunk, .. rest], Continue(state)) =>
   |                        ^^^^^^^^
   |       continue_chunks(rest, decode_continue(chunk, state))
   |     ([_, ..], Finish(_)) =>

<WORKDIR>/src\tests\incr.mbt:41:5-41:13:
   |         ", got " +
   |         String::from_array([..rest]),
   |       )
41 |     Continue(_) => incr_fail("expected chunked JSON to finish: " + name)
   |     ^^^^^^^^
   |   }
   | }

<WORKDIR>/src\tests\incr.mbt:57:5-57:13:
   |         "expected chunked parser rejection, got non-parser error: " + name,
   |       )
   |   } noraise {
57 |     Continue(_) =>
   |     ^^^^^^^^
   |       incr_fail("expected chunked parser rejection, got continuation: " + name)
   |     Finish(_) =>

<WORKDIR>/src\tests\incr.mbt:139:5-139:13:
    |       @debug.assert_eq(value, Json::object({ "a": Json::number(1.0) }))
    |       assert_eq(String::from_array([..rest]), " trailing")
    |     }
139 |     Continue(_) =>
    |     ^^^^^^^^
    |       incr_fail("expected chunked parser to finish with trailing rest")
    |   }

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide find-references 'Decode' --loc 'src\lib\decode.mbt:8:11'
Found 17 references for symbol 'Decode':
<WORKDIR>/src\lib\decode.mbt:8:11-8:17:
  | pub type JsonObject = Map[String, Json]
  | 
  | ///|
8 | pub trait Decode {
  |           ^^^^^^
  |   array_start(Self, JsonArray) -> JsonArray
  |   array_push(Self, Json, JsonArray) -> JsonArray

<WORKDIR>/src\lib\decode.mbt:21:6-21:12:
   | }
   | 
   | ///|
21 | impl Decode for Unit with array_start(_self, _old_acc) -> JsonArray {
   |      ^^^^^^
   |   []
   | }

<WORKDIR>/src\lib\decode.mbt:26:6-26:12:
   | }
   | 
   | ///|
26 | impl Decode for Unit with array_push(_self, elem, acc) {
   |      ^^^^^^
   |   [elem, ..acc]
   | }

<WORKDIR>/src\lib\decode.mbt:31:6-31:12:
   | }
   | 
   | ///|
31 | impl Decode for Unit with array_finish(_self, acc, old_acc) {
   |      ^^^^^^
   |   (acc.rev(), old_acc)
   | }

<WORKDIR>/src\lib\decode.mbt:36:6-36:12:
   | }
   | 
   | ///|
36 | impl Decode for Unit with object_start(_self, _old_acc) -> JsonObject {
   |      ^^^^^^
   |   Map([])
   | }

<WORKDIR>/src\lib\decode.mbt:41:6-41:12:
   | }
   | 
   | ///|
41 | impl Decode for Unit with object_push(_self, key, value, acc) {
   |      ^^^^^^
   |   if !acc.contains(key) {
   |     acc[key] = value

<WORKDIR>/src\lib\decode.mbt:49:6-49:12:
   | }
   | 
   | ///|
49 | impl Decode for Unit with object_finish(_self, acc, old_acc) {
   |      ^^^^^^
   |   (acc, old_acc) (escaped)
   | }

<WORKDIR>/src\lib\decode.mbt:54:6-54:12:
   | }
   | 
   | ///|
54 | impl Decode for Unit with double(_self, view) -> Double raise {
   |      ^^^^^^
   |   @string.parse_double(String::from_iter(view.iter()))
   | }

<WORKDIR>/src\lib\decode.mbt:59:6-59:12:
   | }
   | 
   | ///|
59 | impl Decode for Unit with integer(_self, view) -> Int raise {
   |      ^^^^^^
   |   @string.parse_int(String::from_iter(view.iter()))
   | }

<WORKDIR>/src\lib\decode.mbt:64:6-64:12:
   | }
   | 
   | ///|
64 | impl Decode for Unit with string(_self, s) {
   |      ^^^^^^
   |   s
   | }

<WORKDIR>/src\lib\json.mbt:9:13-9:19:
  |   arr_acc : Array[Json]
  |   obj_acc : Map[String, Json]
  |   stack : Array[Frame]
9 |   decode : &Decode
  |             ^^^^^^
  | }
  | 

<WORKDIR>/src\lib\json.mbt:20:42-20:48:
   | } derive(Debug)
   | 
   | ///|
20 | pub fn decode(input : String, decode? : &Decode) -> Json raise {
   |                                          ^^^^^^
   |   let decode : &Decode = match decode {
   |     Some(decode) => decode

<WORKDIR>/src\lib\json.mbt:21:17-21:23:
   | 
   | ///|
   | pub fn decode(input : String, decode? : &Decode) -> Json raise {
21 |   let decode : &Decode = match decode {
   |                 ^^^^^^
   |     Some(decode) => decode
   |     None => () (escaped)

<WORKDIR>/src\lib\json.mbt:48:48-48:54:
   | }
   | 
   | ///|
48 | pub fn decode_start(input : String, decode? : &Decode) -> Value raise {
   |                                                ^^^^^^
   |   let decode : &Decode = match decode {
   |     Some(decode) => decode

<WORKDIR>/src\lib\json.mbt:49:17-49:23:
   | 
   | ///|
   | pub fn decode_start(input : String, decode? : &Decode) -> Value raise {
49 |   let decode : &Decode = match decode {
   |                 ^^^^^^
   |     Some(decode) => decode
   |     None => () (escaped)

<WORKDIR>/src\lib\value.mbt:13:13-13:19:
   |   arr_acc : JsonArray
   |   obj_acc : JsonObject
   |   stack : Array[Frame]
13 |   decode : &Decode
   |             ^^^^^^
   |   checkpoint : Checkpoint
   | }

<WORKDIR>/src\top.mbt:3:9-3:15:
  | ///|
  | pub using @lib {
3 |   trait Decode,
  |         ^^^^^^
  |   decode,
  |   decode_start,

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide find-references 'array_start' --loc 'src\lib\decode.mbt:9:3'
Found 4 references for symbol 'array_start':
<WORKDIR>/src\lib\decode.mbt:9:3-9:14:
  | 
  | ///|
  | pub trait Decode {
9 |   array_start(Self, JsonArray) -> JsonArray
  |   ^^^^^^^^^^^
  |   array_push(Self, Json, JsonArray) -> JsonArray
  |   array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray) (escaped)

<WORKDIR>/src\lib\decode.mbt:21:27-21:38:
   | }
   | 
   | ///|
21 | impl Decode for Unit with array_start(_self, _old_acc) -> JsonArray {
   |                           ^^^^^^^^^^^
   |   []
   | }

<WORKDIR>/src\lib\json.mbt:457:20-457:31:
    |       array_start({ ..ctx, rest, }, len + 1)
    |     [']', .. rest] => {
    |       let (value, new_acc) = ctx.decode.array_finish(
457 |         ctx.decode.array_start(arr_acc),
    |                    ^^^^^^^^^^^
    |         arr_acc,
    |       )

<WORKDIR>/src\lib\json.mbt:467:28-467:39:
    |     }
    |     [] => unexpected(ctx, len, 0, Checkpoint::Value)
    |     rest => {
467 |       let new_acc = decode.array_start(arr_acc)
    |                            ^^^^^^^^^^^
    |       ctx.stack.push(Frame::Array(arr_acc))
    |       value({ ..ctx, rest, skip: skip + len, arr_acc: new_acc })

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide find-references 'decode_start' --loc 'src\tests\top.mbt:2:14'
Found 3 references for symbol 'decode_start':
<WORKDIR>/src\tests\incr.mbt:21:31-21:43:
   | fn decode_chunks(chunks : ArrayView[String]) -> Value raise {
   |   match chunks {
   |     [first_chunk, .. chunks] =>
21 |       continue_chunks(chunks, decode_start(first_chunk))
   |                               ^^^^^^^^^^^^
   |     [] => raise InspectError::InspectError("expected at least one chunk")
   |   }

<WORKDIR>/src\tests\incr.mbt:71:33-71:45:
   |   guard compelet_json.to_array().chunks(6).map(String::from_array)
   |     is [first_chunk, .. chunks]
   |   // start parsing from `first_chunk`
71 |   guard continue_chunks(chunks, decode_start(first_chunk))
   |                                 ^^^^^^^^^^^^
   |     is Finish({ value, .. })
   |   let expected = Json::object({

<WORKDIR>/src\tests\top.mbt:2:14-2:26:
  | ///|
2 | using @json {decode_start, decode_continue, type Value}
  |              ^^^^^^^^^^^^

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide find-references 'decode_continue' --loc 'src\tests\top.mbt:2:28'
Found 2 references for symbol 'decode_continue':
<WORKDIR>/src\tests\incr.mbt:11:29-11:44:
   |   match (chunks, value) {
   |     ([], value) => value
   |     ([chunk, .. rest], Continue(state)) =>
11 |       continue_chunks(rest, decode_continue(chunk, state))
   |                             ^^^^^^^^^^^^^^^
   |     ([_, ..], Finish(_)) =>
   |       raise InspectError::InspectError("parser finished before all chunks")

<WORKDIR>/src\tests\top.mbt:2:28-2:43:
  | ///|
2 | using @json {decode_start, decode_continue, type Value}
  |                            ^^^^^^^^^^^^^^^

```
