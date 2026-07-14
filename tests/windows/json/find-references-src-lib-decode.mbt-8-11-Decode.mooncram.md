# json find-references Decode src\lib\decode.mbt:8:11

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide find-references 'Decode' --loc 'src\lib\decode.mbt:8:11'
Found 17 references for symbol 'Decode':
<WORKDIR>/src\lib\decode.mbt:8:11-8:17:
  | pub type JsonObject = Map[String, Json]
  | 
  | ///|
8 | pub trait Decode {
  |           ^^^^^^
  |   array_start(Self, JsonArray) -> JsonArray
  |   array_push(Self, Json, JsonArray) -> JsonArray

<WORKDIR>/src\lib\decode.mbt:21:6-21:12:
   | }
   | 
   | ///|
21 | impl Decode for Unit with array_start(_self, _old_acc) -> JsonArray {
   |      ^^^^^^
   |   []
   | }

<WORKDIR>/src\lib\decode.mbt:26:6-26:12:
   | }
   | 
   | ///|
26 | impl Decode for Unit with array_push(_self, elem, acc) {
   |      ^^^^^^
   |   [elem, ..acc]
   | }

<WORKDIR>/src\lib\decode.mbt:31:6-31:12:
   | }
   | 
   | ///|
31 | impl Decode for Unit with array_finish(_self, acc, old_acc) {
   |      ^^^^^^
   |   (acc.rev(), old_acc)
   | }

<WORKDIR>/src\lib\decode.mbt:36:6-36:12:
   | }
   | 
   | ///|
36 | impl Decode for Unit with object_start(_self, _old_acc) -> JsonObject {
   |      ^^^^^^
   |   Map([])
   | }

<WORKDIR>/src\lib\decode.mbt:41:6-41:12:
   | }
   | 
   | ///|
41 | impl Decode for Unit with object_push(_self, key, value, acc) {
   |      ^^^^^^
   |   if !acc.contains(key) {
   |     acc[key] = value

<WORKDIR>/src\lib\decode.mbt:49:6-49:12:
   | }
   | 
   | ///|
49 | impl Decode for Unit with object_finish(_self, acc, old_acc) {
   |      ^^^^^^
   |   (acc, old_acc) (escaped)
   | }

<WORKDIR>/src\lib\decode.mbt:54:6-54:12:
   | }
   | 
   | ///|
54 | impl Decode for Unit with double(_self, view) -> Double raise {
   |      ^^^^^^
   |   @string.parse_double(String::from_iter(view.iter()))
   | }

<WORKDIR>/src\lib\decode.mbt:59:6-59:12:
   | }
   | 
   | ///|
59 | impl Decode for Unit with integer(_self, view) -> Int raise {
   |      ^^^^^^
   |   @string.parse_int(String::from_iter(view.iter()))
   | }

<WORKDIR>/src\lib\decode.mbt:64:6-64:12:
   | }
   | 
   | ///|
64 | impl Decode for Unit with string(_self, s) {
   |      ^^^^^^
   |   s
   | }

<WORKDIR>/src\lib\json.mbt:9:13-9:19:
  |   arr_acc : Array[Json]
  |   obj_acc : Map[String, Json]
  |   stack : Array[Frame]
9 |   decode : &Decode
  |             ^^^^^^
  | }
  | 

<WORKDIR>/src\lib\json.mbt:20:42-20:48:
   | } derive(Debug)
   | 
   | ///|
20 | pub fn decode(input : String, decode? : &Decode) -> Json raise {
   |                                          ^^^^^^
   |   let decode : &Decode = match decode {
   |     Some(decode) => decode

<WORKDIR>/src\lib\json.mbt:21:17-21:23:
   | 
   | ///|
   | pub fn decode(input : String, decode? : &Decode) -> Json raise {
21 |   let decode : &Decode = match decode {
   |                 ^^^^^^
   |     Some(decode) => decode
   |     None => () (escaped)

<WORKDIR>/src\lib\json.mbt:48:48-48:54:
   | }
   | 
   | ///|
48 | pub fn decode_start(input : String, decode? : &Decode) -> Value raise {
   |                                                ^^^^^^
   |   let decode : &Decode = match decode {
   |     Some(decode) => decode

<WORKDIR>/src\lib\json.mbt:49:17-49:23:
   | 
   | ///|
   | pub fn decode_start(input : String, decode? : &Decode) -> Value raise {
49 |   let decode : &Decode = match decode {
   |                 ^^^^^^
   |     Some(decode) => decode
   |     None => () (escaped)

<WORKDIR>/src\lib\value.mbt:13:13-13:19:
   |   arr_acc : JsonArray
   |   obj_acc : JsonObject
   |   stack : Array[Frame]
13 |   decode : &Decode
   |             ^^^^^^
   |   checkpoint : Checkpoint
   | }

<WORKDIR>/src\top.mbt:3:9-3:15:
  | ///|
  | pub using @lib {
3 |   trait Decode,
  |         ^^^^^^
  |   decode,
  |   decode_start,

```
