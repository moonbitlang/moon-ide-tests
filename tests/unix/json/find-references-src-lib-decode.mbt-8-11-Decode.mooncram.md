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
Found 17 references for symbol 'Decode':
<WORKDIR>/src/lib/decode.mbt:8:11-8:17:
  | pub type JsonObject = Map[String, Json] (escaped)
  |  (escaped)
  | ///| (escaped)
8 | pub trait Decode { (escaped)
  |           ^^^^^^ (escaped)
  |   array_start(Self, JsonArray) -> JsonArray (escaped)
  |   array_push(Self, Json, JsonArray) -> JsonArray (escaped)

<WORKDIR>/src/lib/decode.mbt:21:6-21:12:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
21 | impl Decode for Unit with array_start(_self, _old_acc) -> JsonArray { (escaped)
   |      ^^^^^^ (escaped)
   |   [] (escaped)
   | } (escaped)

<WORKDIR>/src/lib/decode.mbt:26:6-26:12:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
26 | impl Decode for Unit with array_push(_self, elem, acc) { (escaped)
   |      ^^^^^^ (escaped)
   |   [elem, ..acc] (escaped)
   | } (escaped)

<WORKDIR>/src/lib/decode.mbt:31:6-31:12:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
31 | impl Decode for Unit with array_finish(_self, acc, old_acc) { (escaped)
   |      ^^^^^^ (escaped)
   |   (acc.rev(), old_acc) (escaped)
   | } (escaped)

<WORKDIR>/src/lib/decode.mbt:36:6-36:12:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
36 | impl Decode for Unit with object_start(_self, _old_acc) -> JsonObject { (escaped)
   |      ^^^^^^ (escaped)
   |   Map([]) (escaped)
   | } (escaped)

<WORKDIR>/src/lib/decode.mbt:41:6-41:12:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
41 | impl Decode for Unit with object_push(_self, key, value, acc) { (escaped)
   |      ^^^^^^ (escaped)
   |   if !acc.contains(key) { (escaped)
   |     acc[key] = value (escaped)

<WORKDIR>/src/lib/decode.mbt:49:6-49:12:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
49 | impl Decode for Unit with object_finish(_self, acc, old_acc) { (escaped)
   |      ^^^^^^ (escaped)
   |   (acc, old_acc) (escaped)
   | } (escaped)

<WORKDIR>/src/lib/decode.mbt:54:6-54:12:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
54 | impl Decode for Unit with double(_self, view) -> Double raise { (escaped)
   |      ^^^^^^ (escaped)
   |   @string.parse_double(String::from_iter(view.iter())) (escaped)
   | } (escaped)

<WORKDIR>/src/lib/decode.mbt:59:6-59:12:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
59 | impl Decode for Unit with integer(_self, view) -> Int raise { (escaped)
   |      ^^^^^^ (escaped)
   |   @string.parse_int(String::from_iter(view.iter())) (escaped)
   | } (escaped)

<WORKDIR>/src/lib/decode.mbt:64:6-64:12:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
64 | impl Decode for Unit with string(_self, s) { (escaped)
   |      ^^^^^^ (escaped)
   |   s (escaped)
   | } (escaped)

<WORKDIR>/src/lib/json.mbt:9:13-9:19:
  |   arr_acc : Array[Json] (escaped)
  |   obj_acc : Map[String, Json] (escaped)
  |   stack : Array[Frame] (escaped)
9 |   decode : &Decode (escaped)
  |             ^^^^^^ (escaped)
  | } (escaped)
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

<WORKDIR>/src/lib/json.mbt:48:48-48:54:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
48 | pub fn decode_start(input : String, decode? : &Decode) -> Value raise { (escaped)
   |                                                ^^^^^^ (escaped)
   |   let decode : &Decode = match decode { (escaped)
   |     Some(decode) => decode (escaped)

<WORKDIR>/src/lib/json.mbt:49:17-49:23:
   |  (escaped)
   | ///| (escaped)
   | pub fn decode_start(input : String, decode? : &Decode) -> Value raise { (escaped)
49 |   let decode : &Decode = match decode { (escaped)
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
  | ///| (escaped)
  | pub using @lib { (escaped)
3 |   trait Decode, (escaped)
  |         ^^^^^^ (escaped)
  |   decode, (escaped)
  |   decode_start, (escaped)

```
