# json rename original src\lib\json.mbt:3:3

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
