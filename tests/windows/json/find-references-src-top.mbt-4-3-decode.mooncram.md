# json find-references decode src\top.mbt:4:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide find-references 'decode' --loc 'src\top.mbt:4:3'
Found 9 references for symbol 'decode':
<WORKDIR>/src\tests\json_testsuite_helpers_test.mbt:8:13-8:19:
  | 
  | ///|
  | fn expect_accept(name : String, input : String) -> Unit raise {
8 |   try @json.decode(input) catch {
  |             ^^^^^^
  |     _ => json_testsuite_fail("expected JSONTestSuite accept: " + name)
  |   } noraise {

<WORKDIR>/src\tests\json_testsuite_helpers_test.mbt:17:13-17:19:
   | 
   | ///|
   | fn expect_reject(name : String, input : String) -> Unit raise {
17 |   try @json.decode(input) catch {
   |             ^^^^^^
   |     @lib.ParseError(_) => () (escaped)
   |     _ =>

<WORKDIR>/src\tests\json_testsuite_helpers_test.mbt:33:13-33:19:
   | 
   | ///|
   | fn expect_accept_or_reject(name : String, input : String) -> Unit raise {
33 |   try @json.decode(input) catch {
   |             ^^^^^^
   |     @lib.ParseError(_) => () (escaped)
   |     _ =>

<WORKDIR>/src\tests\json_value_semantics_test.mbt:3:22-3:28:
  | ///|
  | test "json value semantics basics" {
3 |   let actual = @json.decode("[false,1,\"x\",null,{\"a\":true}]")
  |                      ^^^^^^
  |   let expected = Json::array([
  |     Json::boolean(false),

<WORKDIR>/src\tests\json_value_semantics_test.mbt:16:22-16:28:
   | 
   | ///|
   | test "json value semantics duplicate object key keeps first value" {
16 |   let actual = @json.decode("{\"a\":\"b\",\"a\":\"c\"}")
   |                      ^^^^^^
   |   let expected = Json::object({ "a": Json::string("b") })
   |   @debug.assert_eq(actual, expected)

<WORKDIR>/src\tests\json_value_semantics_test.mbt:23:22-23:28:
   | 
   | ///|
   | test "json value semantics escaped unicode is decoded" {
23 |   let actual = @json.decode("\"\\u0000\"")
   |                      ^^^^^^
   |   @debug.assert_eq(actual, Json::string("\u{0}"))
   | }

<WORKDIR>/src\tests\json_value_semantics_test.mbt:29:22-29:28:
   | 
   | ///|
   | test "json value semantics allowed escapes are decoded" {
29 |   let actual = @json.decode("[\"\\\"\\\\\\/\\b\\f\\n\\r\\t\"]")
   |                      ^^^^^^
   |   let expected = String::from_array(
   |     ['"', '\\', '/', '\u{08}', '\u{0c}', '\n', '\r', '\t'][:],

<WORKDIR>/src\tests\json_value_semantics_test.mbt:38:22-38:28:
   | 
   | ///|
   | test "json value semantics surrogate pair is decoded" {
38 |   let actual = @json.decode("\"\\uD834\\uDD1E\"")
   |                      ^^^^^^
   |   @debug.assert_eq(actual, Json::string("\u{1d11e}"))
   | }

<WORKDIR>/src\top.mbt:4:3-4:9:
  | ///|
  | pub using @lib {
  |   trait Decode,
4 |   decode,
  |   ^^^^^^
  |   decode_start,
  |   decode_continue,

```
