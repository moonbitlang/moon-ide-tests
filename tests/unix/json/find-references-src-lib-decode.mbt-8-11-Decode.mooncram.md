# json find-references Decode src/lib/decode.mbt:8:11

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
$ run_moon_ide moon ide find-references 'Decode' --loc 'src/lib/decode.mbt:8:11'
Found 16 references for symbol 'Decode':
<WORKDIR>/src/lib/decode.mbt:21:6-21:12:
   | }
   | 
   | ///|
21 | impl Decode for Unit with fn array_start(_self, _old_acc) -> JsonArray {
   |      ^^^^^^
   |   []
   | }

<WORKDIR>/src/lib/decode.mbt:26:6-26:12:
   | }
   | 
   | ///|
26 | impl Decode for Unit with fn array_push(_self, elem, acc) {
   |      ^^^^^^
   |   [elem, ..acc]
   | }

<WORKDIR>/src/lib/decode.mbt:31:6-31:12:
   | }
   | 
   | ///|
31 | impl Decode for Unit with fn array_finish(_self, acc, old_acc) {
   |      ^^^^^^
   |   (acc.rev(), old_acc)
   | }

<WORKDIR>/src/lib/decode.mbt:36:6-36:12:
   | }
   | 
   | ///|
36 | impl Decode for Unit with fn object_start(_self, _old_acc) -> JsonObject {
   |      ^^^^^^
   |   Map([])
   | }

<WORKDIR>/src/lib/decode.mbt:41:6-41:12:
   | }
   | 
   | ///|
41 | impl Decode for Unit with fn object_push(_self, key, value, acc) {
   |      ^^^^^^
   |   if !acc.contains(key) {
   |     acc[key] = value

<WORKDIR>/src/lib/decode.mbt:49:6-49:12:
   | }
   | 
   | ///|
49 | impl Decode for Unit with fn object_finish(_self, acc, old_acc) {
   |      ^^^^^^
   |   (acc, old_acc)
   | }

<WORKDIR>/src/lib/decode.mbt:54:6-54:12:
   | }
   | 
   | ///|
54 | impl Decode for Unit with fn double(_self, view) -> Double raise {
   |      ^^^^^^
   |   @string.parse_double(String::from_iter(view.iter()))
   | }

<WORKDIR>/src/lib/decode.mbt:59:6-59:12:
   | }
   | 
   | ///|
59 | impl Decode for Unit with fn integer(_self, view) -> Int32 raise {
   |      ^^^^^^
   |   @string.parse_int(String::from_iter(view.iter()))
   | }

<WORKDIR>/src/lib/decode.mbt:64:6-64:12:
   | }
   | 
   | ///|
64 | impl Decode for Unit with fn string(_self, s) {
   |      ^^^^^^
   |   s
   | }

<WORKDIR>/src/lib/json.mbt:9:13-9:19:
  |   arr_acc : Array[Json]
  |   obj_acc : Map[String, Json]
  |   stack : Array[Frame]
9 |   decode : &Decode
  |             ^^^^^^
  | }
  |  (escaped)

<WORKDIR>/src/lib/json.mbt:20:42-20:48:
   | } derive(Debug) (escaped)
   |  (escaped)
   | ///| (escaped)
20 | pub fn decode(input : String, decode? : &Decode) -> Json raise { (escaped)
   |                                          ^^^^^^ (escaped)
   |   let decode : &Decode = match decode { (escaped)
   |     Some(decode) => decode (escaped)

<WORKDIR>/src/lib/json.mbt:21:17-21:23:
   |  (escaped)
   | ///| (escaped)
   | pub fn decode(input : String, decode? : &Decode) -> Json raise { (escaped)
21 |   let decode : &Decode = match decode { (escaped)
   |                 ^^^^^^ (escaped)
   |     Some(decode) => decode (escaped)
   |     None => () (escaped)

<WORKDIR>/src/lib/json.mbt:46:48-46:54:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
46 | pub fn decode_start(input : String, decode? : &Decode) -> Value raise {
   |                                                ^^^^^^ (escaped)
   |   let decode : &Decode = match decode { (escaped)
   |     Some(decode) => decode (escaped)

<WORKDIR>/src/lib/json.mbt:47:17-47:23:
   |  (escaped)
   | ///| (escaped)
   | pub fn decode_start(input : String, decode? : &Decode) -> Value raise { (escaped)
47 |   let decode : &Decode = match decode {
   |                 ^^^^^^ (escaped)
   |     Some(decode) => decode (escaped)
   |     None => () (escaped)

<WORKDIR>/src/lib/value.mbt:13:13-13:19:
   |   arr_acc : JsonArray (escaped)
   |   obj_acc : JsonObject (escaped)
   |   stack : Array[Frame] (escaped)
13 |   decode : &Decode (escaped)
   |             ^^^^^^ (escaped)
   |   checkpoint : Checkpoint (escaped)
   | } (escaped)

<WORKDIR>/src/top.mbt:3:9-3:15:
  | ///|
  | pub using @lib {
3 |   trait Decode,
  |         ^^^^^^
  |   decode,
  |   decode_start,

```
