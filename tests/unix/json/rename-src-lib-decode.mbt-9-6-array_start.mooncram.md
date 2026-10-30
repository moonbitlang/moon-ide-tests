# json rename array_start src/lib/decode.mbt:9:6

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
$ run_moon_ide moon ide rename 'array_start' 'array_start_renamed' --loc 'src/lib/decode.mbt:9:6'
*** Begin Patch
*** Update File: <WORKDIR>/src/lib/decode.mbt
@@
 
 ///|
 pub trait Decode {
-  fn array_start(Self, JsonArray) -> JsonArray
+  fn array_start_renamed(Self, JsonArray) -> JsonArray
   fn array_push(Self, Json, JsonArray) -> JsonArray
   fn array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray)
   fn object_start(Self, JsonObject) -> JsonObject
@@
 }
 
 ///|
-impl Decode for Unit with fn array_start(_self, _old_acc) -> JsonArray {
+impl Decode for Unit with fn array_start_renamed(_self, _old_acc) -> JsonArray {
   []
 }
 
*** Update File: <WORKDIR>/src/lib/json.mbt
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
       value({ ..ctx, rest, skip: skip + len, arr_acc: new_acc, })
     }
*** End Patch

```
