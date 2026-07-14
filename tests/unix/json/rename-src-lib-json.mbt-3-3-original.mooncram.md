# json rename original src/lib/json.mbt:3:3

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/json" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
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
