# json rename Context src\lib\json.mbt:2:13

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide rename 'Context' 'ContextRenamed' --loc 'src\lib\json.mbt:2:13'
*** Begin Patch
*** Update File: <WORKDIR>/src\lib\json.mbt
@@
 ///|
-priv struct Context {
+priv struct ContextRenamed {
   original : Array[Char]
   rest : ArrayView[Char]
   skip : Int
@@
     Some(decode) => decode
     None => () (escaped)
   }
-  let ctx = Context::{
+  let ctx = ContextRenamed::{
     rest: input.to_array()[:],
     original: input.to_array(),
     skip: 0,
@@
     Some(decode) => decode
     None => () (escaped)
   }
-  let ctx = Context::{
+  let ctx = ContextRenamed::{
     rest: input.to_array()[:],
     original: input.to_array(),
     skip: 0,
@@
 ///|
 pub fn decode_continue(cont : String, state : ContinueValue) -> Value raise {
   let input = [..state.rest, ..cont.to_array()]
-  let ctx = Context::{
+  let ctx = ContextRenamed::{
     rest: input[:],
     original: input,
     skip: 0,
@@
 }
 
 ///|
-fn value(ctx : Context) -> Value raise {
+fn value(ctx : ContextRenamed) -> Value raise {
   match ctx.rest {
     // skip whitespace
     ['\ ' | '\n' | '\r' | '\t', .. rest] =>
@@
 // number {{{
 
 ///|
-fn number_zero(ctx : Context, len : Int) -> Value raise {
+fn number_zero(ctx : ContextRenamed, len : Int) -> Value raise {
   let { original, skip, .. } = ctx
   match ctx.rest {
     [] => {
@@
 }
 
 ///|
-fn number(ctx : Context, len : Int) -> Value raise {
+fn number(ctx : ContextRenamed, len : Int) -> Value raise {
   let { original, skip, .. } = ctx
   match ctx.rest {
     ['0'..='9', .. rest] => number({ ..ctx, rest, }, len + 1)
@@
 }
 
 ///|
-fn number_frac(ctx : Context, len : Int) -> Value raise {
+fn number_frac(ctx : ContextRenamed, len : Int) -> Value raise {
   match ctx.rest {
     ['0'..='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1)
     _ => unexpected(ctx, len, 0, Checkpoint::Value)
@@
 }
 
 ///|
-fn number_frac_cont(ctx : Context, len : Int) -> Value raise {
+fn number_frac_cont(ctx : ContextRenamed, len : Int) -> Value raise {
   let { original, skip, .. } = ctx
   match ctx.rest {
     ['0'..='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1)
@@
 
 ///|
 fn float_decode(
-  ctx : Context,
+  ctx : ContextRenamed,
   len : Int,
   token : ArrayView[Char],
 ) -> Value raise {
@@
 }
 
 ///|
-fn number_exp(ctx : Context, len : Int) -> Value raise {
+fn number_exp(ctx : ContextRenamed, len : Int) -> Value raise {
   match ctx.rest {
     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1)
     ['+' | '-', .. rest] => number_exp_sign({ ..ctx, rest, }, len + 1)
@@
 }
 
 ///|
-fn number_exp_sign(ctx : Context, len : Int) -> Value raise {
+fn number_exp_sign(ctx : ContextRenamed, len : Int) -> Value raise {
   match ctx.rest {
     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1)
     _ => unexpected(ctx, len, 0, Checkpoint::Value)
@@
 }
 
 ///|
-fn number_exp_cont(ctx : Context, len : Int) -> Value raise {
+fn number_exp_cont(ctx : ContextRenamed, len : Int) -> Value raise {
   let { original, skip, .. } = ctx
   match ctx.rest {
     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1)
@@
 }
 
 ///|
-fn number_minus(ctx : Context) -> Value raise {
+fn number_minus(ctx : ContextRenamed) -> Value raise {
   match ctx.rest {
     ['0', .. rest] => number_zero({ ..ctx, rest, }, 2)
     ['1'..='9', .. rest] => number({ ..ctx, rest, }, 2)
@@
 }
 
 ///|
-fn integer_decode(ctx : Context, token : ArrayView[Char]) -> Int raise {
+fn integer_decode(ctx : ContextRenamed, token : ArrayView[Char]) -> Int raise {
   try ctx.decode.integer(token) catch {
     _ => raise ParseError(UnexpectedSequence(token.to_owned(), ctx.skip))
   } noraise {
@@
 // constants {{{
 
 ///|
-fn true_(ctx : Context) -> Value raise {
+fn true_(ctx : ContextRenamed) -> Value raise {
   match ctx.rest {
     ['r', 'u', 'e', .. rest] =>
       continue_({ ..ctx, rest, skip: ctx.skip + 4 }, Json::boolean(true))
@@
 }
 
 ///|
-fn false_(ctx : Context) -> Value raise {
+fn false_(ctx : ContextRenamed) -> Value raise {
   match ctx.rest {
     ['a', 'l', 's', 'e', .. rest] =>
       continue_({ ..ctx, rest, skip: ctx.skip + 5 }, Json::boolean(false))
@@
 }
 
 ///|
-fn null(ctx : Context) -> Value raise {
+fn null(ctx : ContextRenamed) -> Value raise {
   match ctx.rest {
     ['u', 'l', 'l', .. rest] =>
       continue_({ ..ctx, rest, skip: ctx.skip + 4 }, Json::null())
@@
 // string {{{
 
 ///|
-fn string(ctx : Context, len : Int) -> Value raise {
+fn string(ctx : ContextRenamed, len : Int) -> Value raise {
   let builder = StringBuilder::new(size_hint=len)
   string_scan(ctx, len, builder)
 }
@@
 
 ///|
 fn string_scan(
-  ctx : Context,
+  ctx : ContextRenamed,
   len : Int,
   builder : StringBuilder,
 ) -> Value raise {
@@
 
 ///|
 fn string_escape(
-  ctx : Context,
+  ctx : ContextRenamed,
   len : Int,
   builder : StringBuilder,
 ) -> Value raise {
@@
 
 ///|
 fn string_unicode(
-  ctx : Context,
+  ctx : ContextRenamed,
   len : Int,
   code_unit : Int,
   rest : ArrayView[Char],
@@
 
 ///|
 fn unicode_escape_value(
-  ctx : Context,
+  ctx : ContextRenamed,
   len : Int,
   a : Char,
   b : Char,
@@
 }
 
 ///|
-fn hex_value(ctx : Context, index : Int, c : Char) -> Int raise {
+fn hex_value(ctx : ContextRenamed, index : Int, c : Char) -> Int raise {
   match c {
     '0'..='9' => c.to_int() - '0'.to_int()
     'a'..='f' => c.to_int() - 'a'.to_int() + 10
@@
 
 ///|
 fn write_codepoint(
-  ctx : Context,
+  ctx : ContextRenamed,
   index : Int,
   codepoint : Int,
   builder : StringBuilder,
@@
 // array {{{
 
 ///|
-fn array_start(ctx : Context, len : Int) -> Value raise {
+fn array_start(ctx : ContextRenamed, len : Int) -> Value raise {
   let { decode, skip, arr_acc, .. } = ctx
   match ctx.rest {
     ['\ ' | '\n' | '\r' | '\t', .. rest] =>
@@
 }
 
 ///|
-fn array_push(ctx : Context, value0 : Json) -> Value raise {
+fn array_push(ctx : ContextRenamed, value0 : Json) -> Value raise {
   let { skip, .. } = ctx
   match ctx.rest {
     ['\ ' | '\n' | '\r' | '\t', .. rest] =>
@@
 // object {{{
 
 ///|
-fn object_start(ctx : Context, len : Int) -> Value raise {
+fn object_start(ctx : ContextRenamed, len : Int) -> Value raise {
   let { obj_acc, skip, .. } = ctx
   match ctx.rest {
     ['\ ' | '\n' | '\r' | '\t', .. rest] =>
@@
 }
 
 ///|
-fn object_value(ctx : Context, key : String) -> Value raise {
+fn object_value(ctx : ContextRenamed, key : String) -> Value raise {
   let { skip, .. } = ctx
   match ctx.rest {
     ['\ ' | '\n' | '\r' | '\t', .. rest] =>
@@
 }
 
 ///|
-fn object_push(ctx : Context, value0 : Json, key : String) -> Value raise {
+fn object_push(ctx : ContextRenamed, value0 : Json, key : String) -> Value raise {
   let { skip, .. } = ctx
   match ctx.rest {
     ['\ ' | '\n' | '\r' | '\t', .. rest] =>
@@
 }
 
 ///|
-fn object_key(ctx : Context) -> Value raise {
+fn object_key(ctx : ContextRenamed) -> Value raise {
   let { skip, .. } = ctx
   match ctx.rest {
     ['\ ' | '\n' | '\r' | '\t', .. rest] =>
@@
 // }}}
 
 ///|
-fn continue_(ctx : Context, value : Json) -> Value raise {
+fn continue_(ctx : ContextRenamed, value : Json) -> Value raise {
   match ctx.stack.last() {
     None => terminate(ctx, value)
     Some(Frame::Array(_)) => array_push(ctx, value)
@@
 }
 
 ///|
-fn terminate(ctx : Context, value : Json) -> Value raise {
+fn terminate(ctx : ContextRenamed, value : Json) -> Value raise {
   let { rest, original, skip, arr_acc, obj_acc, .. } = ctx
   match rest {
     // skip whitespace
@@
 
 ///|
 fn unexpected(
-  ctx : Context,
+  ctx : ContextRenamed,
   pos : Int,
   len : Int,
   func_data : Checkpoint,
*** End Patch

```
