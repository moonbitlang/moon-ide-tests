# json find-references Context src\lib\json.mbt:2:13

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
