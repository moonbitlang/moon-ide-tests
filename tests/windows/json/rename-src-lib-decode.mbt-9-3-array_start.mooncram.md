# json rename array_start src\lib\decode.mbt:9:3

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
