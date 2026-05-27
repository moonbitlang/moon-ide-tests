# json rename

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
$ run_moon_ide moon ide rename 'original' 'original_renamed' --loc 'src/lib/json.mbt:3:3'
*** Begin Patch
*** Update File: <WORKDIR>/src/lib/json.mbt
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
     [] => { (escaped)
       let token = original[skip:skip + len]
@@
 
 ///|
 fn number(ctx : Context, len : Int) -> Value raise {
-  let { original, skip, .. } = ctx
+  let { original_renamed: original, skip, .. } = ctx
   match ctx.rest {
     ['0'..='9', .. rest] => number({ ..ctx, rest, }, len + 1) (escaped)
     ['.', .. rest] => number_frac({ ..ctx, rest, }, len + 1) (escaped)
@@
 
 ///|
 fn number_frac_cont(ctx : Context, len : Int) -> Value raise {
-  let { original, skip, .. } = ctx
+  let { original_renamed: original, skip, .. } = ctx
   match ctx.rest {
     ['0'..='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1) (escaped)
     ['e' | 'E', .. rest] => number_exp({ ..ctx, rest, }, len + 1) (escaped)
@@
 
 ///|
 fn number_exp_cont(ctx : Context, len : Int) -> Value raise {
-  let { original, skip, .. } = ctx
+  let { original_renamed: original, skip, .. } = ctx
   match ctx.rest {
     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1) (escaped)
     _ => { (escaped)
@@
     ['\\\\', .. rest] => string_escape({ ..ctx, rest, }, len, builder) (escaped)
     [c, .. rest] => (escaped)
       if c.to_int() < 0x20 {
-        raise invalid_byte(ctx.original, skip + len)
+        raise invalid_byte(ctx.original_renamed, skip + len)
       } else {
         builder.write_char(c)
         string_scan({ ..ctx, rest, }, len + 1, builder)
@@
     }
     ['u', ..] => (escaped)
       unexpected({ ..ctx, skip: ctx.skip - 1 }, len + 6, 0, Checkpoint::Value)
-    [_, ..] => raise invalid_byte(ctx.original, ctx.skip + len + 1) (escaped)
+    [_, ..] => raise invalid_byte(ctx.original_renamed, ctx.skip + len + 1) (escaped)
     [] => (escaped)
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
       ['\\\\', 'u', ..] => (escaped)
@@
           0,
           Checkpoint::Value,
         )
-      _ => raise invalid_byte(ctx.original, ctx.skip + len + 6) (escaped)
+      _ => raise invalid_byte(ctx.original_renamed, ctx.skip + len + 6) (escaped)
     }
   } else if code_unit.is_trailing_surrogate() {
-    raise invalid_byte(ctx.original, ctx.skip + len + 2)
+    raise invalid_byte(ctx.original_renamed, ctx.skip + len + 2)
   } else {
     write_codepoint(ctx, ctx.skip + len + 2, code_unit, builder)
     string_scan({ ..ctx, rest, }, len + 6, builder)
@@
     '0'..='9' => c.to_int() - '0'.to_int() (escaped)
     'a'..='f' => c.to_int() - 'a'.to_int() + 10 (escaped)
     'A'..='F' => c.to_int() - 'A'.to_int() + 10 (escaped)
-    _ => raise invalid_byte(ctx.original, index) (escaped)
+    _ => raise invalid_byte(ctx.original_renamed, index) (escaped)
   }
 }
 
@@
 ) -> Unit raise {
   match codepoint.to_char() {
     Some(c) => builder.write_char(c) (escaped)
-    None => raise invalid_byte(ctx.original, index) (escaped)
+    None => raise invalid_byte(ctx.original_renamed, index) (escaped)
   }
 }
 
@@
 
 ///|
 fn terminate(ctx : Context, value : Json) -> Value raise {
-  let { rest, original, skip, arr_acc, obj_acc, .. } = ctx
+  let { rest, original_renamed: original, skip, arr_acc, obj_acc, .. } = ctx
   match rest {
     // skip whitespace
     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => terminate({ ..ctx, rest, }, value) (escaped)
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
$ run_moon_ide moon ide rename 'rest' 'rest_renamed' --loc 'src/lib/json.mbt:4:3'
*** Begin Patch
*** Update File: <WORKDIR>/src/lib/json.mbt
@@
 ///|
 priv struct Context {
   original : Array[Char]
-  rest : ArrayView[Char]
+  rest_renamed : ArrayView[Char]
   skip : Int
   arr_acc : Array[Json]
   obj_acc : Map[String, Json]
@@
     None => () (escaped)
   }
   let ctx = Context::{
-    rest: input.to_array()[:],
+    rest_renamed: input.to_array()[:],
     original: input.to_array(),
     skip: 0,
     arr_acc: [],
@@
     None => () (escaped)
   }
   let ctx = Context::{
-    rest: input.to_array()[:],
+    rest_renamed: input.to_array()[:],
     original: input.to_array(),
     skip: 0,
     arr_acc: [],
@@
 pub fn decode_continue(cont : String, state : ContinueValue) -> Value raise {
   let input = [..state.rest, ..cont.to_array()]
   let ctx = Context::{
-    rest: input[:],
+    rest_renamed: input[:],
     original: input,
     skip: 0,
     arr_acc: state.arr_acc,
@@
 
 ///|
 fn value(ctx : Context) -> Value raise {
-  match ctx.rest {
+  match ctx.rest_renamed {
     // skip whitespace
     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
-      value({ ..ctx, rest, skip: ctx.skip + 1 })
+      value({ ..ctx, rest_renamed: rest, skip: ctx.skip + 1 })
-    ['0', .. rest] => number_zero({ ..ctx, rest, }, 1) (escaped)
+    ['0', .. rest] => number_zero({ ..ctx, rest_renamed: rest, }, 1) (escaped)
-    ['1'..='9', .. rest] => number({ ..ctx, rest, }, 1) (escaped)
+    ['1'..='9', .. rest] => number({ ..ctx, rest_renamed: rest, }, 1) (escaped)
-    ['-', .. rest] => number_minus({ ..ctx, rest, }) (escaped)
+    ['-', .. rest] => number_minus({ ..ctx, rest_renamed: rest, }) (escaped)
-    ['t', .. rest] => true_({ ..ctx, rest, }) (escaped)
+    ['t', .. rest] => true_({ ..ctx, rest_renamed: rest, }) (escaped)
-    ['f', .. rest] => false_({ ..ctx, rest, }) (escaped)
+    ['f', .. rest] => false_({ ..ctx, rest_renamed: rest, }) (escaped)
-    ['n', .. rest] => null({ ..ctx, rest, }) (escaped)
+    ['n', .. rest] => null({ ..ctx, rest_renamed: rest, }) (escaped)
-    ['"', .. rest] => string({ ..ctx, rest, skip: ctx.skip + 1 }, 0) (escaped)
+    ['"', .. rest] => string({ ..ctx, rest_renamed: rest, skip: ctx.skip + 1 }, 0) (escaped)
-    ['[', .. rest] => array_start({ ..ctx, rest, }, 1) (escaped)
+    ['[', .. rest] => array_start({ ..ctx, rest_renamed: rest, }, 1) (escaped)
-    ['{', .. rest] => object_start({ ..ctx, rest, }, 1) (escaped)
+    ['{', .. rest] => object_start({ ..ctx, rest_renamed: rest, }, 1) (escaped)
     _ => unexpected(ctx, 0, 0, Checkpoint::Value) (escaped)
   }
 }
@@
 ///|
 fn number_zero(ctx : Context, len : Int) -> Value raise {
   let { original, skip, .. } = ctx
-  match ctx.rest {
+  match ctx.rest_renamed {
     [] => { (escaped)
       let token = original[skip:skip + len]
       let value = integer_decode(ctx, token)
       unexpected(ctx, len, 0, Checkpoint::NumberI(value))
     }
-    ['.', .. rest] => number_frac({ ..ctx, rest, }, len + 1) (escaped)
+    ['.', .. rest] => number_frac({ ..ctx, rest_renamed: rest, }, len + 1) (escaped)
-    ['e' | 'E', .. rest] => number_exp({ ..ctx, rest, }, len + 1) (escaped)
+    ['e' | 'E', .. rest] => number_exp({ ..ctx, rest_renamed: rest, }, len + 1) (escaped)
     rest => { (escaped)
       let token = original[skip:skip + len]
       let value = integer_decode(ctx, token)
       continue_(
-        { ..ctx, rest, skip: ctx.skip + len },
+        { ..ctx, rest_renamed: rest, skip: ctx.skip + len },
         Json::number(value.to_double()),
       )
     }
@@
 ///|
 fn number(ctx : Context, len : Int) -> Value raise {
   let { original, skip, .. } = ctx
-  match ctx.rest {
+  match ctx.rest_renamed {
-    ['0'..='9', .. rest] => number({ ..ctx, rest, }, len + 1) (escaped)
+    ['0'..='9', .. rest] => number({ ..ctx, rest_renamed: rest, }, len + 1) (escaped)
-    ['.', .. rest] => number_frac({ ..ctx, rest, }, len + 1) (escaped)
+    ['.', .. rest] => number_frac({ ..ctx, rest_renamed: rest, }, len + 1) (escaped)
-    ['e' | 'E', .. rest] => number_exp({ ..ctx, rest, }, len + 1) (escaped)
+    ['e' | 'E', .. rest] => number_exp({ ..ctx, rest_renamed: rest, }, len + 1) (escaped)
     [] => { (escaped)
       let part = original[skip:skip + len]
       let value = integer_decode(ctx, part)
@@
       let part = original[skip:skip + len]
       let value = integer_decode(ctx, part)
       continue_(
-        { ..ctx, rest, skip: skip + len },
+        { ..ctx, rest_renamed: rest, skip: skip + len },
         Json::number(value.to_double()),
       )
     }
@@
 
 ///|
 fn number_frac(ctx : Context, len : Int) -> Value raise {
-  match ctx.rest {
+  match ctx.rest_renamed {
-    ['0'..='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1) (escaped)
+    ['0'..='9', .. rest] => number_frac_cont({ ..ctx, rest_renamed: rest, }, len + 1) (escaped)
     _ => unexpected(ctx, len, 0, Checkpoint::Value) (escaped)
   }
 }
@@
 ///|
 fn number_frac_cont(ctx : Context, len : Int) -> Value raise {
   let { original, skip, .. } = ctx
-  match ctx.rest {
+  match ctx.rest_renamed {
-    ['0'..='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1) (escaped)
+    ['0'..='9', .. rest] => number_frac_cont({ ..ctx, rest_renamed: rest, }, len + 1) (escaped)
-    ['e' | 'E', .. rest] => number_exp({ ..ctx, rest, }, len + 1) (escaped)
+    ['e' | 'E', .. rest] => number_exp({ ..ctx, rest_renamed: rest, }, len + 1) (escaped)
     _ => { (escaped)
       let token = original[skip:skip + len]
       float_decode(ctx, len, token)
@@
   token : ArrayView[Char],
 ) -> Value raise {
   let { skip, .. } = ctx
-  match ctx.rest {
+  match ctx.rest_renamed {
     [] => (escaped)
       try ctx.decode.double(token) catch {
         _ => unexpected(ctx, len, 0, Checkpoint::FloatError(token, skip)) (escaped)
@@
       try ctx.decode.double(token) catch {
         _ => unexpected(ctx, len, 0, Checkpoint::FloatError(token, ctx.skip)) (escaped)
       } noraise {
-        value => continue_({ ..ctx, rest, skip: skip + len }, value.to_json()) (escaped)
+        value => continue_({ ..ctx, rest_renamed: rest, skip: skip + len }, value.to_json()) (escaped)
       }
   }
 }
@@
 
 ///|
 fn number_exp(ctx : Context, len : Int) -> Value raise {
-  match ctx.rest {
+  match ctx.rest_renamed {
-    ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1) (escaped)
+    ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest_renamed: rest, }, len + 1) (escaped)
-    ['+' | '-', .. rest] => number_exp_sign({ ..ctx, rest, }, len + 1) (escaped)
+    ['+' | '-', .. rest] => number_exp_sign({ ..ctx, rest_renamed: rest, }, len + 1) (escaped)
     _ => unexpected(ctx, len, 0, Checkpoint::Value) (escaped)
   }
 }
@@
 
 ///|
 fn number_exp_sign(ctx : Context, len : Int) -> Value raise {
-  match ctx.rest {
+  match ctx.rest_renamed {
-    ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1) (escaped)
+    ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest_renamed: rest, }, len + 1) (escaped)
     _ => unexpected(ctx, len, 0, Checkpoint::Value) (escaped)
   }
 }
@@
 ///|
 fn number_exp_cont(ctx : Context, len : Int) -> Value raise {
   let { original, skip, .. } = ctx
-  match ctx.rest {
+  match ctx.rest_renamed {
-    ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1) (escaped)
+    ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest_renamed: rest, }, len + 1) (escaped)
     _ => { (escaped)
       let token = original[skip:skip + len]
       float_decode(ctx, len, token)
@@
 
 ///|
 fn number_minus(ctx : Context) -> Value raise {
-  match ctx.rest {
+  match ctx.rest_renamed {
-    ['0', .. rest] => number_zero({ ..ctx, rest, }, 2) (escaped)
+    ['0', .. rest] => number_zero({ ..ctx, rest_renamed: rest, }, 2) (escaped)
-    ['1'..='9', .. rest] => number({ ..ctx, rest, }, 2) (escaped)
+    ['1'..='9', .. rest] => number({ ..ctx, rest_renamed: rest, }, 2) (escaped)
     _ => unexpected(ctx, 1, 0, Checkpoint::Value) (escaped)
   }
 }
@@
 
 ///|
 fn true_(ctx : Context) -> Value raise {
-  match ctx.rest {
+  match ctx.rest_renamed {
     ['r', 'u', 'e', .. rest] => (escaped)
-      continue_({ ..ctx, rest, skip: ctx.skip + 4 }, Json::boolean(true))
+      continue_({ ..ctx, rest_renamed: rest, skip: ctx.skip + 4 }, Json::boolean(true))
     _ => unexpected(ctx, 1, 3, Checkpoint::Value) (escaped)
   }
 }
@@
 
 ///|
 fn false_(ctx : Context) -> Value raise {
-  match ctx.rest {
+  match ctx.rest_renamed {
     ['a', 'l', 's', 'e', .. rest] => (escaped)
-      continue_({ ..ctx, rest, skip: ctx.skip + 5 }, Json::boolean(false))
+      continue_({ ..ctx, rest_renamed: rest, skip: ctx.skip + 5 }, Json::boolean(false))
     _ => unexpected(ctx, 1, 4, Checkpoint::Value) (escaped)
   }
 }
@@
 
 ///|
 fn null(ctx : Context) -> Value raise {
-  match ctx.rest {
+  match ctx.rest_renamed {
     ['u', 'l', 'l', .. rest] => (escaped)
-      continue_({ ..ctx, rest, skip: ctx.skip + 4 }, Json::null())
+      continue_({ ..ctx, rest_renamed: rest, skip: ctx.skip + 4 }, Json::null())
     _ => unexpected(ctx, 1, 3, Checkpoint::Value) (escaped)
   }
 }
@@
   builder : StringBuilder,
 ) -> Value raise {
   let { skip, .. } = ctx
-  match ctx.rest {
+  match ctx.rest_renamed {
     ['"', .. rest] => { (escaped)
       let skip = skip + len + 1
       let s = ctx.decode.string(builder.to_string())
-      continue_({ ..ctx, rest, skip }, Json::string(s))
+      continue_({ ..ctx, rest_renamed: rest, skip }, Json::string(s))
     }
-    ['\\\\', .. rest] => string_escape({ ..ctx, rest, }, len, builder) (escaped)
+    ['\\\\', .. rest] => string_escape({ ..ctx, rest_renamed: rest, }, len, builder) (escaped)
     [c, .. rest] => (escaped)
       if c.to_int() < 0x20 {
         raise invalid_byte(ctx.original, skip + len)
       } else {
         builder.write_char(c)
-        string_scan({ ..ctx, rest, }, len + 1, builder)
+        string_scan({ ..ctx, rest_renamed: rest, }, len + 1, builder)
       }
     _ => unexpected({ ..ctx, skip: skip - 1 }, len + 1, 0, Checkpoint::Value) (escaped)
   }
@@
   len : Int,
   builder : StringBuilder,
 ) -> Value raise {
-  match ctx.rest {
+  match ctx.rest_renamed {
     ['"', .. rest] => { (escaped)
       builder.write_char('"')
-      string_scan({ ..ctx, rest, }, len + 2, builder)
+      string_scan({ ..ctx, rest_renamed: rest, }, len + 2, builder)
     }
     ['\\\\', .. rest] => { (escaped)
       builder.write_char('\\')
-      string_scan({ ..ctx, rest, }, len + 2, builder)
+      string_scan({ ..ctx, rest_renamed: rest, }, len + 2, builder)
     }
     ['/', .. rest] => { (escaped)
       builder.write_char('/')
-      string_scan({ ..ctx, rest, }, len + 2, builder)
+      string_scan({ ..ctx, rest_renamed: rest, }, len + 2, builder)
     }
     ['b', .. rest] => { (escaped)
       builder.write_char('\u{08}')
-      string_scan({ ..ctx, rest, }, len + 2, builder)
+      string_scan({ ..ctx, rest_renamed: rest, }, len + 2, builder)
     }
     ['f', .. rest] => { (escaped)
       builder.write_char('\u{0c}')
-      string_scan({ ..ctx, rest, }, len + 2, builder)
+      string_scan({ ..ctx, rest_renamed: rest, }, len + 2, builder)
     }
     ['n', .. rest] => { (escaped)
       builder.write_char('\n')
-      string_scan({ ..ctx, rest, }, len + 2, builder)
+      string_scan({ ..ctx, rest_renamed: rest, }, len + 2, builder)
     }
     ['r', .. rest] => { (escaped)
       builder.write_char('\r')
-      string_scan({ ..ctx, rest, }, len + 2, builder)
+      string_scan({ ..ctx, rest_renamed: rest, }, len + 2, builder)
     }
     ['t', .. rest] => { (escaped)
       builder.write_char('\t')
-      string_scan({ ..ctx, rest, }, len + 2, builder)
+      string_scan({ ..ctx, rest_renamed: rest, }, len + 2, builder)
     }
     ['u', a, b, c, d, .. rest] => { (escaped)
       let code_unit = unicode_escape_value(ctx, len, a, b, c, d)
@@
             (code_unit - 0xD800) * 0x400 +
             (low - 0xDC00)
           write_codepoint(ctx, ctx.skip + len, codepoint, builder)
-          string_scan({ ..ctx, rest, }, len + 12, builder)
+          string_scan({ ..ctx, rest_renamed: rest, }, len + 12, builder)
         } else {
           raise invalid_byte(ctx.original, ctx.skip + len + 8)
         }
@@
     raise invalid_byte(ctx.original, ctx.skip + len + 2)
   } else {
     write_codepoint(ctx, ctx.skip + len + 2, code_unit, builder)
-    string_scan({ ..ctx, rest, }, len + 6, builder)
+    string_scan({ ..ctx, rest_renamed: rest, }, len + 6, builder)
   }
 }
 
@@
 ///|
 fn array_start(ctx : Context, len : Int) -> Value raise {
   let { decode, skip, arr_acc, .. } = ctx
-  match ctx.rest {
+  match ctx.rest_renamed {
     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
-      array_start({ ..ctx, rest, }, len + 1)
+      array_start({ ..ctx, rest_renamed: rest, }, len + 1)
     [']', .. rest] => { (escaped)
       let (value, new_acc) = ctx.decode.array_finish(
         ctx.decode.array_start(arr_acc),
@@
         arr_acc,
       )
       continue_(
-        { ..ctx, rest, skip: skip + len + 1, arr_acc: new_acc },
+        { ..ctx, rest_renamed: rest, skip: skip + len + 1, arr_acc: new_acc },
         Json::array(value),
       )
     }
@@
     rest => { (escaped)
       let new_acc = decode.array_start(arr_acc)
       ctx.stack.push(Frame::Array(arr_acc))
-      value({ ..ctx, rest, skip: skip + len, arr_acc: new_acc })
+      value({ ..ctx, rest_renamed: rest, skip: skip + len, arr_acc: new_acc })
     }
   }
 }
@@
 ///|
 fn array_push(ctx : Context, value0 : Json) -> Value raise {
   let { skip, .. } = ctx
-  match ctx.rest {
+  match ctx.rest_renamed {
     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
-      array_push({ ..ctx, rest, skip: skip + 1 }, value0)
+      array_push({ ..ctx, rest_renamed: rest, skip: skip + 1 }, value0)
     [']', .. rest] => { (escaped)
       let acc = ctx.decode.array_push(value0, ctx.arr_acc)
       guard ctx.stack.pop() is Some(Frame::Array(old_acc))
       let (array_value, new_acc) = ctx.decode.array_finish(acc, old_acc)
       continue_(
-        { ..ctx, rest, skip: skip + 1, arr_acc: new_acc },
+        { ..ctx, rest_renamed: rest, skip: skip + 1, arr_acc: new_acc },
         Json::array(array_value),
       )
     }
     [',', .. rest] => { (escaped)
       let arr_acc = ctx.decode.array_push(value0, ctx.arr_acc)
-      value({ ..ctx, rest, skip: skip + 1, arr_acc })
+      value({ ..ctx, rest_renamed: rest, skip: skip + 1, arr_acc })
     }
     _ => unexpected(ctx, 0, 0, Checkpoint::ArrayPush(value0)) (escaped)
   }
@@
 ///|
 fn object_start(ctx : Context, len : Int) -> Value raise {
   let { obj_acc, skip, .. } = ctx
-  match ctx.rest {
+  match ctx.rest_renamed {
     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
-      object_start({ ..ctx, rest, }, len + 1)
+      object_start({ ..ctx, rest_renamed: rest, }, len + 1)
     ['}', .. rest] => { (escaped)
       let (value, new_acc) = ctx.decode.object_finish(
         ctx.decode.object_start(obj_acc),
@@
         obj_acc,
       )
       continue_(
-        { ..ctx, rest, skip: skip + len + 1, obj_acc: new_acc },
+        { ..ctx, rest_renamed: rest, skip: skip + len + 1, obj_acc: new_acc },
         Json::object(value),
       )
     }
@@
       string(
         {
           ..ctx,
-          rest,
+          rest_renamed: rest,
           skip: skip + len + 1,
           obj_acc: ctx.decode.object_start(obj_acc),
         },
@@
 ///|
 fn object_value(ctx : Context, key : String) -> Value raise {
   let { skip, .. } = ctx
-  match ctx.rest {
+  match ctx.rest_renamed {
     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
-      object_value({ ..ctx, rest, skip: skip + 1 }, key)
+      object_value({ ..ctx, rest_renamed: rest, skip: skip + 1 }, key)
     [':', .. rest] => { (escaped)
       ctx.stack.push(Frame::Key(key))
-      value({ ..ctx, rest, skip: skip + 1 })
+      value({ ..ctx, rest_renamed: rest, skip: skip + 1 })
     }
     _ => unexpected(ctx, 0, 0, Checkpoint::ObjectValue(key)) (escaped)
   }
@@
 ///|
 fn object_push(ctx : Context, value0 : Json, key : String) -> Value raise {
   let { skip, .. } = ctx
-  match ctx.rest {
+  match ctx.rest_renamed {
     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
-      object_push({ ..ctx, rest, skip: skip + 1 }, value0, key)
+      object_push({ ..ctx, rest_renamed: rest, skip: skip + 1 }, value0, key)
     ['}', .. rest] => { (escaped)
       let acc = ctx.decode.object_push(key, value0, ctx.obj_acc)
       guard ctx.stack.pop() is Some(Frame::Map(old_acc))
       let (object_value, new_acc) = ctx.decode.object_finish(acc, old_acc)
       continue_(
-        { ..ctx, rest, skip: skip + 1, obj_acc: new_acc },
+        { ..ctx, rest_renamed: rest, skip: skip + 1, obj_acc: new_acc },
         Json::object(object_value),
       )
     }
     [',', .. rest] => { (escaped)
       let obj_acc = ctx.decode.object_push(key, value0, ctx.obj_acc)
-      object_key({ ..ctx, rest, skip: skip + 1, obj_acc })
+      object_key({ ..ctx, rest_renamed: rest, skip: skip + 1, obj_acc })
     }
     _ => unexpected(ctx, 0, 0, Checkpoint::ObjectPush((value0, key))) (escaped)
   }
@@
 ///|
 fn object_key(ctx : Context) -> Value raise {
   let { skip, .. } = ctx
-  match ctx.rest {
+  match ctx.rest_renamed {
     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
-      object_key({ ..ctx, rest, skip: skip + 1 })
+      object_key({ ..ctx, rest_renamed: rest, skip: skip + 1 })
-    ['"', .. rest] => string({ ..ctx, rest, skip: skip + 1 }, 0) (escaped)
+    ['"', .. rest] => string({ ..ctx, rest_renamed: rest, skip: skip + 1 }, 0) (escaped)
     _ => unexpected(ctx, 0, 0, Checkpoint::ObjectKey) (escaped)
   }
 }
@@
 
 ///|
 fn terminate(ctx : Context, value : Json) -> Value raise {
-  let { rest, original, skip, arr_acc, obj_acc, .. } = ctx
+  let { rest_renamed: rest, original, skip, arr_acc, obj_acc, .. } = ctx
   match rest {
     // skip whitespace
-    ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => terminate({ ..ctx, rest, }, value) (escaped)
+    ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => terminate({ ..ctx, rest_renamed: rest, }, value) (escaped)
     [] => Value::Finish({ value, arr_acc, obj_acc, rest: [][:] }) (escaped)
     _ => { (escaped)
       let rest = original[skip:]
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'ParseError' 'ParseErrorRenamed' --loc 'src/lib/error.mbt:3:3'
*** Begin Patch
*** Update File: <WORKDIR>/src/lib/error.mbt
@@
 ///|
 pub suberror ParseError {
-  ParseError(Reason)
+  ParseErrorRenamed(Reason)
 } derive(Debug)
 
 ///|
*** Update File: <WORKDIR>/src/lib/json.mbt
@@
     Continue({ stack: [], checkpoint: Checkpoint::NumberD(n), .. }) => (escaped)
       n.to_json()
     Continue({ checkpoint: Checkpoint::FloatError(token, skip), .. }) => (escaped)
-      raise ParseError(UnexpectedSequence(token.to_owned(), skip))
+      raise ParseErrorRenamed(UnexpectedSequence(token.to_owned(), skip))
-    Continue({ checkpoint: cp, .. }) => raise ParseError(UnexpectedEnd(cp)) (escaped)
+    Continue({ checkpoint: cp, .. }) => raise ParseErrorRenamed(UnexpectedEnd(cp)) (escaped)
   }
 }
 
@@
 ///|
 fn integer_decode(ctx : Context, token : ArrayView[Char]) -> Int raise {
   try ctx.decode.integer(token) catch {
-    _ => raise ParseError(UnexpectedSequence(token.to_owned(), ctx.skip)) (escaped)
+    _ => raise ParseErrorRenamed(UnexpectedSequence(token.to_owned(), ctx.skip)) (escaped)
   } noraise {
     value => value (escaped)
   }
@@
 ///|
 fn invalid_byte(arr : Array[Char], skip : Int) -> ParseError {
   let byte = arr[skip]
-  ParseError(InvalidByte(skip, byte))
+  ParseErrorRenamed(InvalidByte(skip, byte))
 }
*** Update File: <WORKDIR>/src/tests/incr.mbt
@@
   chunks : ArrayView[String],
 ) -> Unit raise {
   try decode_chunks(chunks) catch {
-    @lib.ParseError(_) => () (escaped)
+    @lib.ParseErrorRenamed(_) => () (escaped)
     _ => (escaped)
       incr_fail(
         "expected chunked parser rejection, got non-parser error: " + name,
*** Update File: <WORKDIR>/src/tests/json_testsuite_helpers_test.mbt
@@
 ///|
 fn expect_reject(name : String, input : String) -> Unit raise {
   try @json.decode(input) catch {
-    @lib.ParseError(_) => () (escaped)
+    @lib.ParseErrorRenamed(_) => () (escaped)
     _ => (escaped)
       json_testsuite_fail(
         "expected JSONTestSuite parser rejection, got non-parser error: " + name,
@@
 ///|
 fn expect_accept_or_reject(name : String, input : String) -> Unit raise {
   try @json.decode(input) catch {
-    @lib.ParseError(_) => () (escaped)
+    @lib.ParseErrorRenamed(_) => () (escaped)
     _ => (escaped)
       json_testsuite_fail(
         "expected JSONTestSuite accept or parser rejection, got non-parser error: " +
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'Reason' 'ReasonRenamed' --loc 'src/lib/error.mbt:3:14'
*** Begin Patch
*** Update File: <WORKDIR>/src/lib/error.mbt
@@
 ///|
 pub suberror ParseError {
-  ParseError(Reason)
+  ParseError(ReasonRenamed)
 } derive(Debug)
 
 ///|
-pub enum Reason {
+pub enum ReasonRenamed {
   InvalidByte(Int, Char)
   UnexpectedEnd(Checkpoint)
   UnexpectedSequence(Array[Char], Int)
*** Update File: <WORKDIR>/src/top.mbt
@@
   type ContinueValue,
   type FinishValue,
   type ParseError,
-  type Reason,
+  type ReasonRenamed,
 }
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'Continue' 'ContinueRenamed' --loc 'src/lib/value.mbt:3:3'
*** Begin Patch
*** Update File: <WORKDIR>/src/lib/json.mbt
@@
   match value(ctx) {
     Finish({ value, rest: [], .. }) => value (escaped)
     Finish({ rest, .. }) => raise invalid_byte([..rest], 0) (escaped)
-    Continue({ stack: [], checkpoint: Checkpoint::NumberI(n), .. }) => (escaped)
+    ContinueRenamed({ stack: [], checkpoint: Checkpoint::NumberI(n), .. }) => (escaped)
       n.to_json()
-    Continue({ stack: [], checkpoint: Checkpoint::NumberD(n), .. }) => (escaped)
+    ContinueRenamed({ stack: [], checkpoint: Checkpoint::NumberD(n), .. }) => (escaped)
       n.to_json()
-    Continue({ checkpoint: Checkpoint::FloatError(token, skip), .. }) => (escaped)
+    ContinueRenamed({ checkpoint: Checkpoint::FloatError(token, skip), .. }) => (escaped)
       raise ParseError(UnexpectedSequence(token.to_owned(), skip))
-    Continue({ checkpoint: cp, .. }) => raise ParseError(UnexpectedEnd(cp)) (escaped)
+    ContinueRenamed({ checkpoint: cp, .. }) => raise ParseError(UnexpectedEnd(cp)) (escaped)
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
*** Update File: <WORKDIR>/src/lib/value.mbt
@@
 ///|
 pub enum Value {
-  Continue(ContinueValue)
+  ContinueRenamed(ContinueValue)
   Finish(FinishValue)
 }
 
*** Update File: <WORKDIR>/src/tests/incr.mbt
@@
 fn continue_chunks(chunks : ArrayView[String], value : Value) -> Value raise {
   match (chunks, value) {
     ([], value) => value (escaped)
-    ([chunk, .. rest], Continue(state)) => (escaped)
+    ([chunk, .. rest], ContinueRenamed(state)) => (escaped)
       continue_chunks(rest, decode_continue(chunk, state))
     ([_, ..], Finish(_)) => (escaped)
       raise InspectError::InspectError("parser finished before all chunks")
@@
         ", got " +
         String::from_array([..rest]),
       )
-    Continue(_) => incr_fail("expected chunked JSON to finish: " + name) (escaped)
+    ContinueRenamed(_) => incr_fail("expected chunked JSON to finish: " + name) (escaped)
   }
 }
 
@@
         "expected chunked parser rejection, got non-parser error: " + name,
       )
   } noraise {
-    Continue(_) => (escaped)
+    ContinueRenamed(_) => (escaped)
       incr_fail("expected chunked parser rejection, got continuation: " + name)
     Finish(_) => (escaped)
       incr_fail("expected chunked parser rejection, parser accepted: " + name)
@@
       @debug.assert_eq(value, Json::object({ "a": Json::number(1.0) }))
       assert_eq(String::from_array([..rest]), " trailing")
     }
-    Continue(_) => (escaped)
+    ContinueRenamed(_) => (escaped)
       incr_fail("expected chunked parser to finish with trailing rest")
   }
 }
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'ContinueValue' 'ContinueValueRenamed' --loc 'src/lib/value.mbt:3:12'
*** Begin Patch
*** Update File: <WORKDIR>/src/lib/json.mbt
@@
 }
 
 ///|
-pub fn decode_continue(cont : String, state : ContinueValue) -> Value raise {
+pub fn decode_continue(cont : String, state : ContinueValueRenamed) -> Value raise {
   let input = [..state.rest, ..cont.to_array()]
   let ctx = Context::{
     rest: input[:],
@@
   let original_size = original.length()
   if original_size <= required_size {
     let rest = original[skip:]
-    Value::Continue(ContinueValue::{
+    Value::Continue(ContinueValueRenamed::{
       rest,
       arr_acc,
       obj_acc,
*** Update File: <WORKDIR>/src/lib/value.mbt
@@
 ///|
 pub enum Value {
-  Continue(ContinueValue)
+  Continue(ContinueValueRenamed)
   Finish(FinishValue)
 }
 
 ///|
-pub struct ContinueValue {
+pub struct ContinueValueRenamed {
   rest : ArrayView[Char]
   arr_acc : JsonArray
   obj_acc : JsonObject
*** Update File: <WORKDIR>/src/top.mbt
@@
   decode_start,
   decode_continue,
   type Value,
-  type ContinueValue,
+  type ContinueValueRenamed,
   type FinishValue,
   type ParseError,
   type Reason,
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'Decode' 'DecodeRenamed' --loc 'src/lib/decode.mbt:8:11'
*** Begin Patch
*** Update File: <WORKDIR>/src/lib/decode.mbt
@@
 pub type JsonObject = Map[String, Json]
 
 ///|
-pub trait Decode {
+pub trait DecodeRenamed {
   array_start(Self, JsonArray) -> JsonArray
   array_push(Self, Json, JsonArray) -> JsonArray
   array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray)
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
   (acc, old_acc)
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
*** Update File: <WORKDIR>/src/lib/json.mbt
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
     Some(decode) => decode (escaped)
     None => () (escaped)
   }
@@
 }
 
 ///|
-pub fn decode_start(input : String, decode? : &Decode) -> Value raise {
+pub fn decode_start(input : String, decode? : &DecodeRenamed) -> Value raise {
-  let decode : &Decode = match decode {
+  let decode : &DecodeRenamed = match decode {
     Some(decode) => decode (escaped)
     None => () (escaped)
   }
*** Update File: <WORKDIR>/src/lib/value.mbt
@@
   arr_acc : JsonArray
   obj_acc : JsonObject
   stack : Array[Frame]
-  decode : &Decode
+  decode : &DecodeRenamed
   checkpoint : Checkpoint
 }
 
*** Update File: <WORKDIR>/src/top.mbt
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
$ run_moon_ide moon ide rename 'array_start' 'array_start_renamed' --loc 'src/lib/decode.mbt:9:3'
*** Begin Patch
*** Update File: <WORKDIR>/src/lib/decode.mbt
@@
 
 ///|
 pub trait Decode {
-  array_start(Self, JsonArray) -> JsonArray
+  array_start_renamed(Self, JsonArray) -> JsonArray
   array_push(Self, Json, JsonArray) -> JsonArray
   array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray)
   object_start(Self, JsonObject) -> JsonObject
@@
 }
 
 ///|
-impl Decode for Unit with array_start(_self, _old_acc) -> JsonArray {
+impl Decode for Unit with array_start_renamed(_self, _old_acc) -> JsonArray {
   []
 }
 
*** Update File: <WORKDIR>/src/lib/json.mbt
@@
       array_start({ ..ctx, rest, }, len + 1)
     [']', .. rest] => { (escaped)
       let (value, new_acc) = ctx.decode.array_finish(
-        ctx.decode.array_start(arr_acc),
+        ctx.decode.array_start_renamed(arr_acc),
         arr_acc,
       )
       continue_(
@@
     }
     [] => unexpected(ctx, len, 0, Checkpoint::Value) (escaped)
     rest => { (escaped)
-      let new_acc = decode.array_start(arr_acc)
+      let new_acc = decode.array_start_renamed(arr_acc)
       ctx.stack.push(Frame::Array(arr_acc))
       value({ ..ctx, rest, skip: skip + len, arr_acc: new_acc })
     }
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'decode_start' 'decode_start_renamed' --loc 'src/tests/top.mbt:2:14'
*** Begin Patch
*** Update File: <WORKDIR>/src/tests/incr.mbt
@@
 fn decode_chunks(chunks : ArrayView[String]) -> Value raise {
   match chunks {
     [first_chunk, .. chunks] => (escaped)
-      continue_chunks(chunks, decode_start(first_chunk))
+      continue_chunks(chunks, decode_start_renamed(first_chunk))
     [] => raise InspectError::InspectError("expected at least one chunk") (escaped)
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
*** Update File: <WORKDIR>/src/tests/top.mbt
@@
 ///|
-using @json {decode_start, decode_continue, type Value}
+using @json {decode_start_renamed, decode_continue, type Value}
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'decode_continue' 'decode_continue_renamed' --loc 'src/tests/top.mbt:2:28'
*** Begin Patch
*** Update File: <WORKDIR>/src/tests/incr.mbt
@@
   match (chunks, value) {
     ([], value) => value (escaped)
     ([chunk, .. rest], Continue(state)) => (escaped)
-      continue_chunks(rest, decode_continue(chunk, state))
+      continue_chunks(rest, decode_continue_renamed(chunk, state))
     ([_, ..], Finish(_)) => (escaped)
       raise InspectError::InspectError("parser finished before all chunks")
   }
*** Update File: <WORKDIR>/src/tests/top.mbt
@@
 ///|
-using @json {decode_start, decode_continue, type Value}
+using @json {decode_start, decode_continue_renamed, type Value}
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'Context' 'ContextRenamed' --loc 'src/lib/json.mbt:2:13'
*** Begin Patch
*** Update File: <WORKDIR>/src/lib/json.mbt
@@
 ///|
-priv struct Context {
+priv struct ContextRenamed {
   original : Array[Char]
   rest : ArrayView[Char]
   skip : Int
@@
     Some(decode) => decode (escaped)
     None => () (escaped)
   }
-  let ctx = Context::{
+  let ctx = ContextRenamed::{
     rest: input.to_array()[:],
     original: input.to_array(),
     skip: 0,
@@
     Some(decode) => decode (escaped)
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
     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
@@
 // number {{{
 
 ///|
-fn number_zero(ctx : Context, len : Int) -> Value raise {
+fn number_zero(ctx : ContextRenamed, len : Int) -> Value raise {
   let { original, skip, .. } = ctx
   match ctx.rest {
     [] => { (escaped)
@@
 }
 
 ///|
-fn number(ctx : Context, len : Int) -> Value raise {
+fn number(ctx : ContextRenamed, len : Int) -> Value raise {
   let { original, skip, .. } = ctx
   match ctx.rest {
     ['0'..='9', .. rest] => number({ ..ctx, rest, }, len + 1) (escaped)
@@
 }
 
 ///|
-fn number_frac(ctx : Context, len : Int) -> Value raise {
+fn number_frac(ctx : ContextRenamed, len : Int) -> Value raise {
   match ctx.rest {
     ['0'..='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1) (escaped)
     _ => unexpected(ctx, len, 0, Checkpoint::Value) (escaped)
@@
 }
 
 ///|
-fn number_frac_cont(ctx : Context, len : Int) -> Value raise {
+fn number_frac_cont(ctx : ContextRenamed, len : Int) -> Value raise {
   let { original, skip, .. } = ctx
   match ctx.rest {
     ['0'..='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1) (escaped)
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
     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1) (escaped)
     ['+' | '-', .. rest] => number_exp_sign({ ..ctx, rest, }, len + 1) (escaped)
@@
 }
 
 ///|
-fn number_exp_sign(ctx : Context, len : Int) -> Value raise {
+fn number_exp_sign(ctx : ContextRenamed, len : Int) -> Value raise {
   match ctx.rest {
     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1) (escaped)
     _ => unexpected(ctx, len, 0, Checkpoint::Value) (escaped)
@@
 }
 
 ///|
-fn number_exp_cont(ctx : Context, len : Int) -> Value raise {
+fn number_exp_cont(ctx : ContextRenamed, len : Int) -> Value raise {
   let { original, skip, .. } = ctx
   match ctx.rest {
     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1) (escaped)
@@
 }
 
 ///|
-fn number_minus(ctx : Context) -> Value raise {
+fn number_minus(ctx : ContextRenamed) -> Value raise {
   match ctx.rest {
     ['0', .. rest] => number_zero({ ..ctx, rest, }, 2) (escaped)
     ['1'..='9', .. rest] => number({ ..ctx, rest, }, 2) (escaped)
@@
 }
 
 ///|
-fn integer_decode(ctx : Context, token : ArrayView[Char]) -> Int raise {
+fn integer_decode(ctx : ContextRenamed, token : ArrayView[Char]) -> Int raise {
   try ctx.decode.integer(token) catch {
     _ => raise ParseError(UnexpectedSequence(token.to_owned(), ctx.skip)) (escaped)
   } noraise {
@@
 // constants {{{
 
 ///|
-fn true_(ctx : Context) -> Value raise {
+fn true_(ctx : ContextRenamed) -> Value raise {
   match ctx.rest {
     ['r', 'u', 'e', .. rest] => (escaped)
       continue_({ ..ctx, rest, skip: ctx.skip + 4 }, Json::boolean(true))
@@
 }
 
 ///|
-fn false_(ctx : Context) -> Value raise {
+fn false_(ctx : ContextRenamed) -> Value raise {
   match ctx.rest {
     ['a', 'l', 's', 'e', .. rest] => (escaped)
       continue_({ ..ctx, rest, skip: ctx.skip + 5 }, Json::boolean(false))
@@
 }
 
 ///|
-fn null(ctx : Context) -> Value raise {
+fn null(ctx : ContextRenamed) -> Value raise {
   match ctx.rest {
     ['u', 'l', 'l', .. rest] => (escaped)
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
     '0'..='9' => c.to_int() - '0'.to_int() (escaped)
     'a'..='f' => c.to_int() - 'a'.to_int() + 10 (escaped)
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
     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
@@
 }
 
 ///|
-fn array_push(ctx : Context, value0 : Json) -> Value raise {
+fn array_push(ctx : ContextRenamed, value0 : Json) -> Value raise {
   let { skip, .. } = ctx
   match ctx.rest {
     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
@@
 // object {{{
 
 ///|
-fn object_start(ctx : Context, len : Int) -> Value raise {
+fn object_start(ctx : ContextRenamed, len : Int) -> Value raise {
   let { obj_acc, skip, .. } = ctx
   match ctx.rest {
     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
@@
 }
 
 ///|
-fn object_value(ctx : Context, key : String) -> Value raise {
+fn object_value(ctx : ContextRenamed, key : String) -> Value raise {
   let { skip, .. } = ctx
   match ctx.rest {
     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
@@
 }
 
 ///|
-fn object_push(ctx : Context, value0 : Json, key : String) -> Value raise {
+fn object_push(ctx : ContextRenamed, value0 : Json, key : String) -> Value raise {
   let { skip, .. } = ctx
   match ctx.rest {
     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
@@
 }
 
 ///|
-fn object_key(ctx : Context) -> Value raise {
+fn object_key(ctx : ContextRenamed) -> Value raise {
   let { skip, .. } = ctx
   match ctx.rest {
     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
@@
 // }}}
 
 ///|
-fn continue_(ctx : Context, value : Json) -> Value raise {
+fn continue_(ctx : ContextRenamed, value : Json) -> Value raise {
   match ctx.stack.last() {
     None => terminate(ctx, value) (escaped)
     Some(Frame::Array(_)) => array_push(ctx, value) (escaped)
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
$ run_moon_ide moon ide rename 'Frame' 'FrameRenamed' --loc 'src/lib/json.mbt:13:6'
*** Begin Patch
*** Update File: <WORKDIR>/src/lib/json.mbt
@@
   skip : Int
   arr_acc : Array[Json]
   obj_acc : Map[String, Json]
-  stack : Array[Frame]
+  stack : Array[FrameRenamed]
   decode : &Decode
 }
 
 ///|
-enum Frame {
+enum FrameRenamed {
   Array(Array[Json])
   Map(Map[String, Json])
   Key(String)
@@
     [] => unexpected(ctx, len, 0, Checkpoint::Value) (escaped)
     rest => { (escaped)
       let new_acc = decode.array_start(arr_acc)
-      ctx.stack.push(Frame::Array(arr_acc))
+      ctx.stack.push(FrameRenamed::Array(arr_acc))
       value({ ..ctx, rest, skip: skip + len, arr_acc: new_acc })
     }
   }
@@
       array_push({ ..ctx, rest, skip: skip + 1 }, value0)
     [']', .. rest] => { (escaped)
       let acc = ctx.decode.array_push(value0, ctx.arr_acc)
-      guard ctx.stack.pop() is Some(Frame::Array(old_acc))
+      guard ctx.stack.pop() is Some(FrameRenamed::Array(old_acc))
       let (array_value, new_acc) = ctx.decode.array_finish(acc, old_acc)
       continue_(
         { ..ctx, rest, skip: skip + 1, arr_acc: new_acc },
@@
       )
     }
     ['"', .. rest] => { (escaped)
-      ctx.stack.push(Frame::Map(obj_acc))
+      ctx.stack.push(FrameRenamed::Map(obj_acc))
       string(
         {
           ..ctx,
@@
     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
       object_value({ ..ctx, rest, skip: skip + 1 }, key)
     [':', .. rest] => { (escaped)
-      ctx.stack.push(Frame::Key(key))
+      ctx.stack.push(FrameRenamed::Key(key))
       value({ ..ctx, rest, skip: skip + 1 })
     }
     _ => unexpected(ctx, 0, 0, Checkpoint::ObjectValue(key)) (escaped)
@@
       object_push({ ..ctx, rest, skip: skip + 1 }, value0, key)
     ['}', .. rest] => { (escaped)
       let acc = ctx.decode.object_push(key, value0, ctx.obj_acc)
-      guard ctx.stack.pop() is Some(Frame::Map(old_acc))
+      guard ctx.stack.pop() is Some(FrameRenamed::Map(old_acc))
       let (object_value, new_acc) = ctx.decode.object_finish(acc, old_acc)
       continue_(
         { ..ctx, rest, skip: skip + 1, obj_acc: new_acc },
@@
 fn continue_(ctx : Context, value : Json) -> Value raise {
   match ctx.stack.last() {
     None => terminate(ctx, value) (escaped)
-    Some(Frame::Array(_)) => array_push(ctx, value) (escaped)
+    Some(FrameRenamed::Array(_)) => array_push(ctx, value) (escaped)
-    Some(Frame::Map(_)) => { (escaped)
+    Some(FrameRenamed::Map(_)) => { (escaped)
       guard value is Json::String(key)
       object_value(ctx, key)
     }
-    Some(Frame::Key(key)) => { (escaped)
+    Some(FrameRenamed::Key(key)) => { (escaped)
       ctx.stack.pop() |> ignore
       object_push({ ..ctx }, value, key)
     }
*** Update File: <WORKDIR>/src/lib/value.mbt
@@
   rest : ArrayView[Char]
   arr_acc : JsonArray
   obj_acc : JsonObject
-  stack : Array[Frame]
+  stack : Array[FrameRenamed]
   decode : &Decode
   checkpoint : Checkpoint
 }
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'decode' 'decode_renamed' --loc 'src/lib/json.mbt:20:8'
*** Begin Patch
*** Update File: <WORKDIR>/src/lib/json.mbt
@@
 } derive(Debug)
 
 ///|
-pub fn decode(input : String, decode? : &Decode) -> Json raise {
+pub fn decode_renamed(input : String, decode? : &Decode) -> Json raise {
   let decode : &Decode = match decode {
     Some(decode) => decode (escaped)
     None => () (escaped)
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'decode_start' 'decode_start_renamed' --loc 'src/lib/json.mbt:48:8'
*** Begin Patch
*** Update File: <WORKDIR>/src/lib/json.mbt
@@
 }
 
 ///|
-pub fn decode_start(input : String, decode? : &Decode) -> Value raise {
+pub fn decode_start_renamed(input : String, decode? : &Decode) -> Value raise {
   let decode : &Decode = match decode {
     Some(decode) => decode (escaped)
     None => () (escaped)
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'decode_continue' 'decode_continue_renamed' --loc 'src/lib/json.mbt:66:8'
*** Begin Patch
*** Update File: <WORKDIR>/src/lib/json.mbt
@@
 }
 
 ///|
-pub fn decode_continue(cont : String, state : ContinueValue) -> Value raise {
+pub fn decode_continue_renamed(cont : String, state : ContinueValue) -> Value raise {
   let input = [..state.rest, ..cont.to_array()]
   let ctx = Context::{
     rest: input[:],
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'value' 'value_renamed' --loc 'src/lib/json.mbt:87:4'
*** Begin Patch
*** Update File: <WORKDIR>/src/lib/json.mbt
@@
     stack: [],
     decode,
   }
-  match value(ctx) {
+  match value_renamed(ctx) {
     Finish({ value, rest: [], .. }) => value (escaped)
     Finish({ rest, .. }) => raise invalid_byte([..rest], 0) (escaped)
     Continue({ stack: [], checkpoint: Checkpoint::NumberI(n), .. }) => (escaped)
@@
     stack: [],
     decode,
   }
-  value(ctx)
+  value_renamed(ctx)
 }
 
 ///|
@@
     decode: state.decode,
   }
   match state.checkpoint {
-    Value | NumberI(_) | NumberD(_) | FloatError(_, _) => value(ctx) (escaped)
+    Value | NumberI(_) | NumberD(_) | FloatError(_, _) => value_renamed(ctx) (escaped)
     ArrayPush(v) => array_push(ctx, v) (escaped)
     ObjectKey => object_key(ctx) (escaped)
     ObjectValue(key) => object_value(ctx, key) (escaped)
@@
 }
 
 ///|
-fn value(ctx : Context) -> Value raise {
+fn value_renamed(ctx : Context) -> Value raise {
   match ctx.rest {
     // skip whitespace
     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
-      value({ ..ctx, rest, skip: ctx.skip + 1 })
+      value_renamed({ ..ctx, rest, skip: ctx.skip + 1 })
     ['0', .. rest] => number_zero({ ..ctx, rest, }, 1) (escaped)
     ['1'..='9', .. rest] => number({ ..ctx, rest, }, 1) (escaped)
     ['-', .. rest] => number_minus({ ..ctx, rest, }) (escaped)
@@
     rest => { (escaped)
       let new_acc = decode.array_start(arr_acc)
       ctx.stack.push(Frame::Array(arr_acc))
-      value({ ..ctx, rest, skip: skip + len, arr_acc: new_acc })
+      value_renamed({ ..ctx, rest, skip: skip + len, arr_acc: new_acc })
     }
   }
 }
@@
     }
     [',', .. rest] => { (escaped)
       let arr_acc = ctx.decode.array_push(value0, ctx.arr_acc)
-      value({ ..ctx, rest, skip: skip + 1, arr_acc })
+      value_renamed({ ..ctx, rest, skip: skip + 1, arr_acc })
     }
     _ => unexpected(ctx, 0, 0, Checkpoint::ArrayPush(value0)) (escaped)
   }
@@
       object_value({ ..ctx, rest, skip: skip + 1 }, key)
     [':', .. rest] => { (escaped)
       ctx.stack.push(Frame::Key(key))
-      value({ ..ctx, rest, skip: skip + 1 })
+      value_renamed({ ..ctx, rest, skip: skip + 1 })
     }
     _ => unexpected(ctx, 0, 0, Checkpoint::ObjectValue(key)) (escaped)
   }
*** End Patch

```
