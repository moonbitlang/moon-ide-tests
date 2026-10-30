# json find-references Context src\lib\json.mbt:2:13

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide find-references 'Context' --loc 'src\lib\json.mbt:2:13'
Found 33 references for symbol 'Context':
<WORKDIR>/src\lib\json.mbt:25:13-25:20:
   |     Some(decode) => decode
   |     None => () (escaped)
   |   }
25 |   let ctx = Context::{
   |             ^^^^^^^
   |     rest: input.to_array()[:],
   |     original: input.to_array(),

<WORKDIR>/src\lib\json.mbt:51:13-51:20:
   |     Some(decode) => decode
   |     None => () (escaped)
   |   }
51 |   let ctx = Context::{
   |             ^^^^^^^
   |     rest: input.to_array()[:],
   |     original: input.to_array(),

<WORKDIR>/src\lib\json.mbt:66:13-66:20:
   | ///|
   | pub fn decode_continue(cont : String, state : ContinueValue) -> Value raise {
   |   let input = [..state.rest, ..cont.to_array()]
66 |   let ctx = Context::{
   |             ^^^^^^^
   |     rest: input[:],
   |     original: input,

<WORKDIR>/src\lib\json.mbt:85:16-85:23:
   | }
   | 
   | ///|
85 | fn value(ctx : Context) -> Value raise {
   |                ^^^^^^^
   |   match ctx.rest {
   |     // skip whitespace

<WORKDIR>/src\lib\json.mbt:106:22-106:29:
    | // number {{{
    | 
    | ///|
106 | fn number_zero(ctx : Context, len : Int32) -> Value raise {
    |                      ^^^^^^^
    |   let { original, skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:128:17-128:24:
    | }
    | 
    | ///|
128 | fn number(ctx : Context, len : Int32) -> Value raise {
    |                 ^^^^^^^
    |   let { original, skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:151:22-151:29:
    | }
    | 
    | ///|
151 | fn number_frac(ctx : Context, len : Int32) -> Value raise {
    |                      ^^^^^^^
    |   match ctx.rest {
    |     ['0'..<='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1)

<WORKDIR>/src\lib\json.mbt:159:27-159:34:
    | }
    | 
    | ///|
159 | fn number_frac_cont(ctx : Context, len : Int32) -> Value raise {
    |                           ^^^^^^^
    |   let { original, skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:173:9-173:16:
    | 
    | ///|
    | fn float_decode(
173 |   ctx : Context,
    |         ^^^^^^^
    |   len : Int32,
    |   token : ArrayView[Char],

<WORKDIR>/src\lib\json.mbt:195:21-195:28:
    | }
    | 
    | ///|
195 | fn number_exp(ctx : Context, len : Int32) -> Value raise {
    |                     ^^^^^^^
    |   match ctx.rest {
    |     ['0'..<='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1)

<WORKDIR>/src\lib\json.mbt:204:26-204:33:
    | }
    | 
    | ///|
204 | fn number_exp_sign(ctx : Context, len : Int32) -> Value raise {
    |                          ^^^^^^^
    |   match ctx.rest {
    |     ['0'..<='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1)

<WORKDIR>/src\lib\json.mbt:212:26-212:33:
    | }
    | 
    | ///|
212 | fn number_exp_cont(ctx : Context, len : Int32) -> Value raise {
    |                          ^^^^^^^
    |   let { original, skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:224:23-224:30:
    | }
    | 
    | ///|
224 | fn number_minus(ctx : Context) -> Value raise {
    |                       ^^^^^^^
    |   match ctx.rest {
    |     ['0', .. rest] => number_zero({ ..ctx, rest, }, 2)

<WORKDIR>/src\lib\json.mbt:233:25-233:32:
    | }
    | 
    | ///|
233 | fn integer_decode(ctx : Context, token : ArrayView[Char]) -> Int32 raise {
    |                         ^^^^^^^
    |   try ctx.decode.integer(token) catch {
    |     _ => raise ParseError(UnexpectedSequence(token.to_owned(), ctx.skip))

<WORKDIR>/src\lib\json.mbt:246:16-246:23:
    | // constants {{{
    | 
    | ///|
246 | fn true_(ctx : Context) -> Value raise {
    |                ^^^^^^^
    |   match ctx.rest {
    |     ['r', 'u', 'e', .. rest] =>

<WORKDIR>/src\lib\json.mbt:255:17-255:24:
    | }
    | 
    | ///|
255 | fn false_(ctx : Context) -> Value raise {
    |                 ^^^^^^^
    |   match ctx.rest {
    |     ['a', 'l', 's', 'e', .. rest] =>

<WORKDIR>/src\lib\json.mbt:264:15-264:22:
    | }
    | 
    | ///|
264 | fn null(ctx : Context) -> Value raise {
    |               ^^^^^^^
    |   match ctx.rest {
    |     ['u', 'l', 'l', .. rest] =>

<WORKDIR>/src\lib\json.mbt:277:17-277:24:
    | // string {{{
    | 
    | ///|
277 | fn string(ctx : Context, len : Int32) -> Value raise {
    |                 ^^^^^^^
    |   let builder = StringBuilder(size_hint=len)
    |   string_scan(ctx, len, builder)

<WORKDIR>/src\lib\json.mbt:284:9-284:16:
    | 
    | ///|
    | fn string_scan(
284 |   ctx : Context,
    |         ^^^^^^^
    |   len : Int32,
    |   builder : StringBuilder,

<WORKDIR>/src\lib\json.mbt:309:9-309:16:
    | 
    | ///|
    | fn string_escape(
309 |   ctx : Context,
    |         ^^^^^^^
    |   len : Int32,
    |   builder : StringBuilder,

<WORKDIR>/src\lib\json.mbt:360:9-360:16:
    | 
    | ///|
    | fn string_unicode(
360 |   ctx : Context,
    |         ^^^^^^^
    |   len : Int32,
    |   code_unit : Int32,

<WORKDIR>/src\lib\json.mbt:406:9-406:16:
    | 
    | ///|
    | fn unicode_escape_value(
406 |   ctx : Context,
    |         ^^^^^^^
    |   len : Int32,
    |   a : Char,

<WORKDIR>/src\lib\json.mbt:421:20-421:27:
    | }
    | 
    | ///|
421 | fn hex_value(ctx : Context, index : Int32, c : Char) -> Int32 raise {
    |                    ^^^^^^^
    |   match c {
    |     '0'..<='9' => c.to_int() - '0'.to_int()

<WORKDIR>/src\lib\json.mbt:432:9-432:16:
    | 
    | ///|
    | fn write_codepoint(
432 |   ctx : Context,
    |         ^^^^^^^
    |   index : Int32,
    |   codepoint : Int32,

<WORKDIR>/src\lib\json.mbt:448:22-448:29:
    | // array {{{
    | 
    | ///|
448 | fn array_start(ctx : Context, len : Int32) -> Value raise {
    |                      ^^^^^^^
    |   let { decode, skip, arr_acc, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:473:21-473:28:
    | }
    | 
    | ///|
473 | fn array_push(ctx : Context, value0 : Json) -> Value raise {
    |                     ^^^^^^^
    |   let { skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:500:23-500:30:
    | // object {{{
    | 
    | ///|
500 | fn object_start(ctx : Context, len : Int32) -> Value raise {
    |                       ^^^^^^^
    |   let { obj_acc, skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:532:23-532:30:
    | }
    | 
    | ///|
532 | fn object_value(ctx : Context, key : String) -> Value raise {
    |                       ^^^^^^^
    |   let { skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:546:22-546:29:
    | }
    | 
    | ///|
546 | fn object_push(ctx : Context, value0 : Json, key : String) -> Value raise {
    |                      ^^^^^^^
    |   let { skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:569:21-569:28:
    | }
    | 
    | ///|
569 | fn object_key(ctx : Context) -> Value raise {
    |                     ^^^^^^^
    |   let { skip, .. } = ctx
    |   match ctx.rest {

<WORKDIR>/src\lib\json.mbt:582:20-582:27:
    | // }}}
    | 
    | ///|
582 | fn continue_(ctx : Context, value : Json) -> Value raise {
    |                    ^^^^^^^
    |   match ctx.stack.last() {
    |     None => terminate(ctx, value)

<WORKDIR>/src\lib\json.mbt:598:20-598:27:
    | }
    | 
    | ///|
598 | fn terminate(ctx : Context, value : Json) -> Value raise {
    |                    ^^^^^^^
    |   let { rest, original, skip, arr_acc, obj_acc, .. } = ctx
    |   match rest {

<WORKDIR>/src\lib\json.mbt:613:9-613:16:
    | 
    | ///|
    | fn unexpected(
613 |   ctx : Context,
    |         ^^^^^^^
    |   pos : Int32,
    |   len : Int32,

```
