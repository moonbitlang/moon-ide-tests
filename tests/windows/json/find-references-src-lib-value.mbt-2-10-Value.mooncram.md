# json find-references Value src\lib\value.mbt:2:10

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide find-references 'Value' --loc 'src\lib\value.mbt:2:10'
Found 32 references for symbol 'Value':
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

```
