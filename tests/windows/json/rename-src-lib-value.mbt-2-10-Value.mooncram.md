# json rename Value src\lib\value.mbt:2:10

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide rename 'Value' 'ValueRenamed' --loc 'src\lib\value.mbt:2:10'
*** Begin Patch
*** Update File: <WORKDIR>/src\lib\json.mbt
@@
 }
 
 ///|
-pub fn decode_start(input : String, decode? : &Decode) -> Value raise {
+pub fn decode_start(input : String, decode? : &Decode) -> ValueRenamed raise {
   let decode : &Decode = match decode {
     Some(decode) => decode
     None => () (escaped)
@@
 }
 
 ///|
-pub fn decode_continue(cont : String, state : ContinueValue) -> Value raise {
+pub fn decode_continue(cont : String, state : ContinueValue) -> ValueRenamed raise {
   let input = [..state.rest, ..cont.to_array()]
   let ctx = Context::{
     rest: input[:],
@@
 }
 
 ///|
-fn value(ctx : Context) -> Value raise {
+fn value(ctx : Context) -> ValueRenamed raise {
   match ctx.rest {
     // skip whitespace
     ['\ ' | '\n' | '\r' | '\t', .. rest] =>
@@
 // number {{{
 
 ///|
-fn number_zero(ctx : Context, len : Int) -> Value raise {
+fn number_zero(ctx : Context, len : Int) -> ValueRenamed raise {
   let { original, skip, .. } = ctx
   match ctx.rest {
     [] => {
@@
 }
 
 ///|
-fn number(ctx : Context, len : Int) -> Value raise {
+fn number(ctx : Context, len : Int) -> ValueRenamed raise {
   let { original, skip, .. } = ctx
   match ctx.rest {
     ['0'..='9', .. rest] => number({ ..ctx, rest, }, len + 1)
@@
 }
 
 ///|
-fn number_frac(ctx : Context, len : Int) -> Value raise {
+fn number_frac(ctx : Context, len : Int) -> ValueRenamed raise {
   match ctx.rest {
     ['0'..='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1)
     _ => unexpected(ctx, len, 0, Checkpoint::Value)
@@
 }
 
 ///|
-fn number_frac_cont(ctx : Context, len : Int) -> Value raise {
+fn number_frac_cont(ctx : Context, len : Int) -> ValueRenamed raise {
   let { original, skip, .. } = ctx
   match ctx.rest {
     ['0'..='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1)
@@
   ctx : Context,
   len : Int,
   token : ArrayView[Char],
-) -> Value raise {
+) -> ValueRenamed raise {
   let { skip, .. } = ctx
   match ctx.rest {
     [] =>
@@
 }
 
 ///|
-fn number_exp(ctx : Context, len : Int) -> Value raise {
+fn number_exp(ctx : Context, len : Int) -> ValueRenamed raise {
   match ctx.rest {
     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1)
     ['+' | '-', .. rest] => number_exp_sign({ ..ctx, rest, }, len + 1)
@@
 }
 
 ///|
-fn number_exp_sign(ctx : Context, len : Int) -> Value raise {
+fn number_exp_sign(ctx : Context, len : Int) -> ValueRenamed raise {
   match ctx.rest {
     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1)
     _ => unexpected(ctx, len, 0, Checkpoint::Value)
@@
 }
 
 ///|
-fn number_exp_cont(ctx : Context, len : Int) -> Value raise {
+fn number_exp_cont(ctx : Context, len : Int) -> ValueRenamed raise {
   let { original, skip, .. } = ctx
   match ctx.rest {
     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1)
@@
 }
 
 ///|
-fn number_minus(ctx : Context) -> Value raise {
+fn number_minus(ctx : Context) -> ValueRenamed raise {
   match ctx.rest {
     ['0', .. rest] => number_zero({ ..ctx, rest, }, 2)
     ['1'..='9', .. rest] => number({ ..ctx, rest, }, 2)
@@
 // constants {{{
 
 ///|
-fn true_(ctx : Context) -> Value raise {
+fn true_(ctx : Context) -> ValueRenamed raise {
   match ctx.rest {
     ['r', 'u', 'e', .. rest] =>
       continue_({ ..ctx, rest, skip: ctx.skip + 4 }, Json::boolean(true))
@@
 }
 
 ///|
-fn false_(ctx : Context) -> Value raise {
+fn false_(ctx : Context) -> ValueRenamed raise {
   match ctx.rest {
     ['a', 'l', 's', 'e', .. rest] =>
       continue_({ ..ctx, rest, skip: ctx.skip + 5 }, Json::boolean(false))
@@
 }
 
 ///|
-fn null(ctx : Context) -> Value raise {
+fn null(ctx : Context) -> ValueRenamed raise {
   match ctx.rest {
     ['u', 'l', 'l', .. rest] =>
       continue_({ ..ctx, rest, skip: ctx.skip + 4 }, Json::null())
@@
 // string {{{
 
 ///|
-fn string(ctx : Context, len : Int) -> Value raise {
+fn string(ctx : Context, len : Int) -> ValueRenamed raise {
   let builder = StringBuilder::new(size_hint=len)
   string_scan(ctx, len, builder)
 }
@@
   ctx : Context,
   len : Int,
   builder : StringBuilder,
-) -> Value raise {
+) -> ValueRenamed raise {
   let { skip, .. } = ctx
   match ctx.rest {
     ['"', .. rest] => {
@@
   ctx : Context,
   len : Int,
   builder : StringBuilder,
-) -> Value raise {
+) -> ValueRenamed raise {
   match ctx.rest {
     ['"', .. rest] => {
       builder.write_char('"')
@@
   code_unit : Int,
   rest : ArrayView[Char],
   builder : StringBuilder,
-) -> Value raise {
+) -> ValueRenamed raise {
   if code_unit.is_leading_surrogate() {
     match rest {
       ['\\', 'u', a, b, c, d, .. rest] => {
@@
 // array {{{
 
 ///|
-fn array_start(ctx : Context, len : Int) -> Value raise {
+fn array_start(ctx : Context, len : Int) -> ValueRenamed raise {
   let { decode, skip, arr_acc, .. } = ctx
   match ctx.rest {
     ['\ ' | '\n' | '\r' | '\t', .. rest] =>
@@
 }
 
 ///|
-fn array_push(ctx : Context, value0 : Json) -> Value raise {
+fn array_push(ctx : Context, value0 : Json) -> ValueRenamed raise {
   let { skip, .. } = ctx
   match ctx.rest {
     ['\ ' | '\n' | '\r' | '\t', .. rest] =>
@@
 // object {{{
 
 ///|
-fn object_start(ctx : Context, len : Int) -> Value raise {
+fn object_start(ctx : Context, len : Int) -> ValueRenamed raise {
   let { obj_acc, skip, .. } = ctx
   match ctx.rest {
     ['\ ' | '\n' | '\r' | '\t', .. rest] =>
@@
 }
 
 ///|
-fn object_value(ctx : Context, key : String) -> Value raise {
+fn object_value(ctx : Context, key : String) -> ValueRenamed raise {
   let { skip, .. } = ctx
   match ctx.rest {
     ['\ ' | '\n' | '\r' | '\t', .. rest] =>
@@
 }
 
 ///|
-fn object_push(ctx : Context, value0 : Json, key : String) -> Value raise {
+fn object_push(ctx : Context, value0 : Json, key : String) -> ValueRenamed raise {
   let { skip, .. } = ctx
   match ctx.rest {
     ['\ ' | '\n' | '\r' | '\t', .. rest] =>
@@
 }
 
 ///|
-fn object_key(ctx : Context) -> Value raise {
+fn object_key(ctx : Context) -> ValueRenamed raise {
   let { skip, .. } = ctx
   match ctx.rest {
     ['\ ' | '\n' | '\r' | '\t', .. rest] =>
@@
 // }}}
 
 ///|
-fn continue_(ctx : Context, value : Json) -> Value raise {
+fn continue_(ctx : Context, value : Json) -> ValueRenamed raise {
   match ctx.stack.last() {
     None => terminate(ctx, value)
     Some(Frame::Array(_)) => array_push(ctx, value)
@@
 }
 
 ///|
-fn terminate(ctx : Context, value : Json) -> Value raise {
+fn terminate(ctx : Context, value : Json) -> ValueRenamed raise {
   let { rest, original, skip, arr_acc, obj_acc, .. } = ctx
   match rest {
     // skip whitespace
     ['\ ' | '\n' | '\r' | '\t', .. rest] => terminate({ ..ctx, rest, }, value)
-    [] => Value::Finish({ value, arr_acc, obj_acc, rest: [][:] })
+    [] => ValueRenamed::Finish({ value, arr_acc, obj_acc, rest: [][:] })
     _ => {
       let rest = original[skip:]
-      Value::Finish({ value, arr_acc, obj_acc, rest })
+      ValueRenamed::Finish({ value, arr_acc, obj_acc, rest })
     }
   }
 }
@@
   pos : Int,
   len : Int,
   func_data : Checkpoint,
-) -> Value raise {
+) -> ValueRenamed raise {
   let { original, arr_acc, obj_acc, skip, stack, decode, .. } = ctx
   let required_size = skip + pos + len
   let original_size = original.length()
   if original_size <= required_size {
     let rest = original[skip:]
-    Value::Continue(ContinueValue::{
+    ValueRenamed::Continue(ContinueValue::{
       rest,
       arr_acc,
       obj_acc,
*** Update File: <WORKDIR>/src\lib\value.mbt
@@
 ///|
-pub enum Value {
+pub enum ValueRenamed {
   Continue(ContinueValue)
   Finish(FinishValue)
 }
*** End Patch

```
