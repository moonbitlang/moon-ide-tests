# json rename

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

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide rename 'original' 'original_renamed' --loc 'src\lib\json.mbt:3:3'
*** Begin Patch
*** Update File: <WORKDIR>/src\lib\json.mbt
@@
 ///|
 priv struct Context {
-  original : Array[Char]
+  original_renamed : Array[Char]
   rest : ArrayView[Char]
   skip : Int
   arr_acc : Array[Json]
@@
   }
   let ctx = Context::{
     rest: input.to_array()[:],
-    original: input.to_array(),
+    original_renamed: input.to_array(),
     skip: 0,
     arr_acc: [],
     obj_acc: Map([]),
@@
   }
   let ctx = Context::{
     rest: input.to_array()[:],
-    original: input.to_array(),
+    original_renamed: input.to_array(),
     skip: 0,
     arr_acc: [],
     obj_acc: Map([]),
@@
   let input = [..state.rest, ..cont.to_array()]
   let ctx = Context::{
     rest: input[:],
-    original: input,
+    original_renamed: input,
     skip: 0,
     arr_acc: state.arr_acc,
     obj_acc: state.obj_acc,
@@
 
 ///|
 fn number_zero(ctx : Context, len : Int) -> Value raise {
-  let { original, skip, .. } = ctx
+  let { original_renamed: original, skip, .. } = ctx
   match ctx.rest {
     [] => {
       let token = original[skip:skip + len]
@@
 
 ///|
 fn number(ctx : Context, len : Int) -> Value raise {
-  let { original, skip, .. } = ctx
+  let { original_renamed: original, skip, .. } = ctx
   match ctx.rest {
     ['0'..='9', .. rest] => number({ ..ctx, rest, }, len + 1)
     ['.', .. rest] => number_frac({ ..ctx, rest, }, len + 1)
@@
 
 ///|
 fn number_frac_cont(ctx : Context, len : Int) -> Value raise {
-  let { original, skip, .. } = ctx
+  let { original_renamed: original, skip, .. } = ctx
   match ctx.rest {
     ['0'..='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1)
     ['e' | 'E', .. rest] => number_exp({ ..ctx, rest, }, len + 1)
@@
 
 ///|
 fn number_exp_cont(ctx : Context, len : Int) -> Value raise {
-  let { original, skip, .. } = ctx
+  let { original_renamed: original, skip, .. } = ctx
   match ctx.rest {
     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1)
     _ => {
@@
     ['\\', .. rest] => string_escape({ ..ctx, rest, }, len, builder)
     [c, .. rest] =>
       if c.to_int() < 0x20 {
-        raise invalid_byte(ctx.original, skip + len)
+        raise invalid_byte(ctx.original_renamed, skip + len)
       } else {
         builder.write_char(c)
         string_scan({ ..ctx, rest, }, len + 1, builder)
@@
     }
     ['u', ..] =>
       unexpected({ ..ctx, skip: ctx.skip - 1 }, len + 6, 0, Checkpoint::Value)
-    [_, ..] => raise invalid_byte(ctx.original, ctx.skip + len + 1)
+    [_, ..] => raise invalid_byte(ctx.original_renamed, ctx.skip + len + 1)
     [] =>
       unexpected({ ..ctx, skip: ctx.skip - 1 }, len + 2, 0, Checkpoint::Value)
   }
@@
           write_codepoint(ctx, ctx.skip + len, codepoint, builder)
           string_scan({ ..ctx, rest, }, len + 12, builder)
         } else {
-          raise invalid_byte(ctx.original, ctx.skip + len + 8)
+          raise invalid_byte(ctx.original_renamed, ctx.skip + len + 8)
         }
       }
       ['\\', 'u', ..] =>
@@
           0,
           Checkpoint::Value,
         )
-      _ => raise invalid_byte(ctx.original, ctx.skip + len + 6)
+      _ => raise invalid_byte(ctx.original_renamed, ctx.skip + len + 6)
     }
   } else if code_unit.is_trailing_surrogate() {
-    raise invalid_byte(ctx.original, ctx.skip + len + 2)
+    raise invalid_byte(ctx.original_renamed, ctx.skip + len + 2)
   } else {
     write_codepoint(ctx, ctx.skip + len + 2, code_unit, builder)
     string_scan({ ..ctx, rest, }, len + 6, builder)
@@
     '0'..='9' => c.to_int() - '0'.to_int()
     'a'..='f' => c.to_int() - 'a'.to_int() + 10
     'A'..='F' => c.to_int() - 'A'.to_int() + 10
-    _ => raise invalid_byte(ctx.original, index)
+    _ => raise invalid_byte(ctx.original_renamed, index)
   }
 }
 
@@
 ) -> Unit raise {
   match codepoint.to_char() {
     Some(c) => builder.write_char(c)
-    None => raise invalid_byte(ctx.original, index)
+    None => raise invalid_byte(ctx.original_renamed, index)
   }
 }
 
@@
 
 ///|
 fn terminate(ctx : Context, value : Json) -> Value raise {
-  let { rest, original, skip, arr_acc, obj_acc, .. } = ctx
+  let { rest, original_renamed: original, skip, arr_acc, obj_acc, .. } = ctx
   match rest {
     // skip whitespace
     ['\ ' | '\n' | '\r' | '\t', .. rest] => terminate({ ..ctx, rest, }, value)
@@
   len : Int,
   func_data : Checkpoint,
 ) -> Value raise {
-  let { original, arr_acc, obj_acc, skip, stack, decode, .. } = ctx
+  let { original_renamed: original, arr_acc, obj_acc, skip, stack, decode, .. } = ctx
   let required_size = skip + pos + len
   let original_size = original.length()
   if original_size <= required_size {
@@
       checkpoint: func_data,
     })
   } else {
-    raise invalid_byte(ctx.original, ctx.skip + pos)
+    raise invalid_byte(ctx.original_renamed, ctx.skip + pos)
   }
 }
 
*** End Patch

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide rename 'ParseError' 'ParseErrorRenamed' --loc 'src\lib\error.mbt:2:14'
*** Begin Patch
*** Update File: <WORKDIR>/src\lib\error.mbt
@@
 ///|
-pub suberror ParseError {
+pub suberror ParseErrorRenamed {
   ParseError(Reason)
 } derive(Debug)
 
*** Update File: <WORKDIR>/src\lib\json.mbt
@@
 }
 
 ///|
-fn invalid_byte(arr : Array[Char], skip : Int) -> ParseError {
+fn invalid_byte(arr : Array[Char], skip : Int) -> ParseErrorRenamed {
   let byte = arr[skip]
   ParseError(InvalidByte(skip, byte))
 }
*** Update File: <WORKDIR>/src\top.mbt
@@
   type Value,
   type ContinueValue,
   type FinishValue,
-  type ParseError,
+  type ParseErrorRenamed,
   type Reason,
 }
*** End Patch

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide rename 'ParseError' 'ParseErrorRenamed' --loc 'src\lib\error.mbt:3:3'
*** Begin Patch
*** Update File: <WORKDIR>/src\lib\error.mbt
@@
 ///|
 pub suberror ParseError {
-  ParseError(Reason)
+  ParseErrorRenamed(Reason)
 } derive(Debug)
 
 ///|
*** Update File: <WORKDIR>/src\lib\json.mbt
@@
     Continue({ stack: [], checkpoint: Checkpoint::NumberD(n), .. }) =>
       n.to_json()
     Continue({ checkpoint: Checkpoint::FloatError(token, skip), .. }) =>
-      raise ParseError(UnexpectedSequence(token.to_owned(), skip))
+      raise ParseErrorRenamed(UnexpectedSequence(token.to_owned(), skip))
-    Continue({ checkpoint: cp, .. }) => raise ParseError(UnexpectedEnd(cp))
+    Continue({ checkpoint: cp, .. }) => raise ParseErrorRenamed(UnexpectedEnd(cp))
   }
 }
 
@@
 ///|
 fn integer_decode(ctx : Context, token : ArrayView[Char]) -> Int raise {
   try ctx.decode.integer(token) catch {
-    _ => raise ParseError(UnexpectedSequence(token.to_owned(), ctx.skip))
+    _ => raise ParseErrorRenamed(UnexpectedSequence(token.to_owned(), ctx.skip))
   } noraise {
     value => value
   }
@@
 ///|
 fn invalid_byte(arr : Array[Char], skip : Int) -> ParseError {
   let byte = arr[skip]
-  ParseError(InvalidByte(skip, byte))
+  ParseErrorRenamed(InvalidByte(skip, byte))
 }
*** Update File: <WORKDIR>/src\tests\incr.mbt
@@
   chunks : ArrayView[String],
 ) -> Unit raise {
   try decode_chunks(chunks) catch {
-    @lib.ParseError(_) => () (escaped)
+    @lib.ParseErrorRenamed(_) => () (escaped)
     _ =>
       incr_fail(
         "expected chunked parser rejection, got non-parser error: " + name,
*** Update File: <WORKDIR>/src\tests\json_testsuite_helpers_test.mbt
@@
 ///|
 fn expect_reject(name : String, input : String) -> Unit raise {
   try @json.decode(input) catch {
-    @lib.ParseError(_) => () (escaped)
+    @lib.ParseErrorRenamed(_) => () (escaped)
     _ =>
       json_testsuite_fail(
         "expected JSONTestSuite parser rejection, got non-parser error: " + name,
@@
 ///|
 fn expect_accept_or_reject(name : String, input : String) -> Unit raise {
   try @json.decode(input) catch {
-    @lib.ParseError(_) => () (escaped)
+    @lib.ParseErrorRenamed(_) => () (escaped)
     _ =>
       json_testsuite_fail(
         "expected JSONTestSuite accept or parser rejection, got non-parser error: " +
*** End Patch

```

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
*** Update File: <WORKDIR>/src\top.mbt
@@
   decode,
   decode_start,
   decode_continue,
-  type Value,
+  type ValueRenamed,
   type ContinueValue,
   type FinishValue,
   type ParseError,
*** End Patch

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide rename 'Continue' 'ContinueRenamed' --loc 'src\lib\value.mbt:3:3'
*** Begin Patch
*** Update File: <WORKDIR>/src\lib\json.mbt
@@
   match value(ctx) {
     Finish({ value, rest: [], .. }) => value
     Finish({ rest, .. }) => raise invalid_byte([..rest], 0)
-    Continue({ stack: [], checkpoint: Checkpoint::NumberI(n), .. }) =>
+    ContinueRenamed({ stack: [], checkpoint: Checkpoint::NumberI(n), .. }) =>
       n.to_json()
-    Continue({ stack: [], checkpoint: Checkpoint::NumberD(n), .. }) =>
+    ContinueRenamed({ stack: [], checkpoint: Checkpoint::NumberD(n), .. }) =>
       n.to_json()
-    Continue({ checkpoint: Checkpoint::FloatError(token, skip), .. }) =>
+    ContinueRenamed({ checkpoint: Checkpoint::FloatError(token, skip), .. }) =>
       raise ParseError(UnexpectedSequence(token.to_owned(), skip))
-    Continue({ checkpoint: cp, .. }) => raise ParseError(UnexpectedEnd(cp))
+    ContinueRenamed({ checkpoint: cp, .. }) => raise ParseError(UnexpectedEnd(cp))
   }
 }
 
@@
   let original_size = original.length()
   if original_size <= required_size {
     let rest = original[skip:]
-    Value::Continue(ContinueValue::{
+    Value::ContinueRenamed(ContinueValue::{
       rest,
       arr_acc,
       obj_acc,
*** Update File: <WORKDIR>/src\lib\value.mbt
@@
 ///|
 pub enum Value {
-  Continue(ContinueValue)
+  ContinueRenamed(ContinueValue)
   Finish(FinishValue)
 }
 
*** Update File: <WORKDIR>/src\tests\incr.mbt
@@
 fn continue_chunks(chunks : ArrayView[String], value : Value) -> Value raise {
   match (chunks, value) {
     ([], value) => value
-    ([chunk, .. rest], Continue(state)) =>
+    ([chunk, .. rest], ContinueRenamed(state)) =>
       continue_chunks(rest, decode_continue(chunk, state))
     ([_, ..], Finish(_)) =>
       raise InspectError::InspectError("parser finished before all chunks")
@@
         ", got " +
         String::from_array([..rest]),
       )
-    Continue(_) => incr_fail("expected chunked JSON to finish: " + name)
+    ContinueRenamed(_) => incr_fail("expected chunked JSON to finish: " + name)
   }
 }
 
@@
         "expected chunked parser rejection, got non-parser error: " + name,
       )
   } noraise {
-    Continue(_) =>
+    ContinueRenamed(_) =>
       incr_fail("expected chunked parser rejection, got continuation: " + name)
     Finish(_) =>
       incr_fail("expected chunked parser rejection, parser accepted: " + name)
@@
       @debug.assert_eq(value, Json::object({ "a": Json::number(1.0) }))
       assert_eq(String::from_array([..rest]), " trailing")
     }
-    Continue(_) =>
+    ContinueRenamed(_) =>
       incr_fail("expected chunked parser to finish with trailing rest")
   }
 }
*** End Patch

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide rename 'Decode' 'DecodeRenamed' --loc 'src\lib\decode.mbt:8:11'
*** Begin Patch
*** Update File: <WORKDIR>/src\lib\decode.mbt
@@
 pub type JsonObject = Map[String, Json]
 
 ///|
-pub trait Decode {
+pub trait DecodeRenamed {
   array_start(Self, JsonArray) -> JsonArray
   array_push(Self, Json, JsonArray) -> JsonArray
   array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray) (escaped)
@@
 }
 
 ///|
-impl Decode for Unit with array_start(_self, _old_acc) -> JsonArray {
+impl DecodeRenamed for Unit with array_start(_self, _old_acc) -> JsonArray {
   []
 }
 
 ///|
-impl Decode for Unit with array_push(_self, elem, acc) {
+impl DecodeRenamed for Unit with array_push(_self, elem, acc) {
   [elem, ..acc]
 }
 
 ///|
-impl Decode for Unit with array_finish(_self, acc, old_acc) {
+impl DecodeRenamed for Unit with array_finish(_self, acc, old_acc) {
   (acc.rev(), old_acc)
 }
 
 ///|
-impl Decode for Unit with object_start(_self, _old_acc) -> JsonObject {
+impl DecodeRenamed for Unit with object_start(_self, _old_acc) -> JsonObject {
   Map([])
 }
 
 ///|
-impl Decode for Unit with object_push(_self, key, value, acc) {
+impl DecodeRenamed for Unit with object_push(_self, key, value, acc) {
   if !acc.contains(key) {
     acc[key] = value
   }
@@
 }
 
 ///|
-impl Decode for Unit with object_finish(_self, acc, old_acc) {
+impl DecodeRenamed for Unit with object_finish(_self, acc, old_acc) {
   (acc, old_acc) (escaped)
 }
 
 ///|
-impl Decode for Unit with double(_self, view) -> Double raise {
+impl DecodeRenamed for Unit with double(_self, view) -> Double raise {
   @string.parse_double(String::from_iter(view.iter()))
 }
 
 ///|
-impl Decode for Unit with integer(_self, view) -> Int raise {
+impl DecodeRenamed for Unit with integer(_self, view) -> Int raise {
   @string.parse_int(String::from_iter(view.iter()))
 }
 
 ///|
-impl Decode for Unit with string(_self, s) {
+impl DecodeRenamed for Unit with string(_self, s) {
   s
 }
*** Update File: <WORKDIR>/src\lib\json.mbt
@@
   arr_acc : Array[Json]
   obj_acc : Map[String, Json]
   stack : Array[Frame]
-  decode : &Decode
+  decode : &DecodeRenamed
 }
 
 ///|
@@
 } derive(Debug)
 
 ///|
-pub fn decode(input : String, decode? : &Decode) -> Json raise {
+pub fn decode(input : String, decode? : &DecodeRenamed) -> Json raise {
-  let decode : &Decode = match decode {
+  let decode : &DecodeRenamed = match decode {
     Some(decode) => decode
     None => () (escaped)
   }
@@
 }
 
 ///|
-pub fn decode_start(input : String, decode? : &Decode) -> Value raise {
+pub fn decode_start(input : String, decode? : &DecodeRenamed) -> Value raise {
-  let decode : &Decode = match decode {
+  let decode : &DecodeRenamed = match decode {
     Some(decode) => decode
     None => () (escaped)
   }
*** Update File: <WORKDIR>/src\lib\value.mbt
@@
   arr_acc : JsonArray
   obj_acc : JsonObject
   stack : Array[Frame]
-  decode : &Decode
+  decode : &DecodeRenamed
   checkpoint : Checkpoint
 }
 
*** Update File: <WORKDIR>/src\top.mbt
@@
 ///|
 pub using @lib {
-  trait Decode,
+  trait DecodeRenamed,
   decode,
   decode_start,
   decode_continue,
*** End Patch

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide rename 'array_start' 'array_start_renamed' --loc 'src\lib\decode.mbt:9:3'
*** Begin Patch
*** Update File: <WORKDIR>/src\lib\decode.mbt
@@
 
 ///|
 pub trait Decode {
-  array_start(Self, JsonArray) -> JsonArray
+  array_start_renamed(Self, JsonArray) -> JsonArray
   array_push(Self, Json, JsonArray) -> JsonArray
   array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray) (escaped)
   object_start(Self, JsonObject) -> JsonObject
@@
 }
 
 ///|
-impl Decode for Unit with array_start(_self, _old_acc) -> JsonArray {
+impl Decode for Unit with array_start_renamed(_self, _old_acc) -> JsonArray {
   []
 }
 
*** Update File: <WORKDIR>/src\lib\json.mbt
@@
       array_start({ ..ctx, rest, }, len + 1)
     [']', .. rest] => {
       let (value, new_acc) = ctx.decode.array_finish(
-        ctx.decode.array_start(arr_acc),
+        ctx.decode.array_start_renamed(arr_acc),
         arr_acc,
       )
       continue_(
@@
     }
     [] => unexpected(ctx, len, 0, Checkpoint::Value)
     rest => {
-      let new_acc = decode.array_start(arr_acc)
+      let new_acc = decode.array_start_renamed(arr_acc)
       ctx.stack.push(Frame::Array(arr_acc))
       value({ ..ctx, rest, skip: skip + len, arr_acc: new_acc })
     }
*** End Patch

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide rename 'decode_start' 'decode_start_renamed' --loc 'src\tests\top.mbt:2:14'
*** Begin Patch
*** Update File: <WORKDIR>/src\tests\incr.mbt
@@
 fn decode_chunks(chunks : ArrayView[String]) -> Value raise {
   match chunks {
     [first_chunk, .. chunks] =>
-      continue_chunks(chunks, decode_start(first_chunk))
+      continue_chunks(chunks, decode_start_renamed(first_chunk))
     [] => raise InspectError::InspectError("expected at least one chunk")
   }
 }
@@
   guard compelet_json.to_array().chunks(6).map(String::from_array)
     is [first_chunk, .. chunks]
   // start parsing from `first_chunk`
-  guard continue_chunks(chunks, decode_start(first_chunk))
+  guard continue_chunks(chunks, decode_start_renamed(first_chunk))
     is Finish({ value, .. })
   let expected = Json::object({
     "foo": Json::object({ "bar": Json::number(1200.0) }),
*** Update File: <WORKDIR>/src\tests\top.mbt
@@
 ///|
-using @json {decode_start, decode_continue, type Value}
+using @json {decode_start_renamed, decode_continue, type Value}
*** End Patch

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide rename 'decode_continue' 'decode_continue_renamed' --loc 'src\tests\top.mbt:2:28'
*** Begin Patch
*** Update File: <WORKDIR>/src\tests\incr.mbt
@@
   match (chunks, value) {
     ([], value) => value
     ([chunk, .. rest], Continue(state)) =>
-      continue_chunks(rest, decode_continue(chunk, state))
+      continue_chunks(rest, decode_continue_renamed(chunk, state))
     ([_, ..], Finish(_)) =>
       raise InspectError::InspectError("parser finished before all chunks")
   }
*** Update File: <WORKDIR>/src\tests\top.mbt
@@
 ///|
-using @json {decode_start, decode_continue, type Value}
+using @json {decode_start, decode_continue_renamed, type Value}
*** End Patch

```
