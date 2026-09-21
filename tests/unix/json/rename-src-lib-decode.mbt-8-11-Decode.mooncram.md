# json rename Decode src/lib/decode.mbt:8:11

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
 
*** End Patch

```
