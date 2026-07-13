# json rename decode src\top.mbt:4:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide rename 'decode' 'decode_renamed' --loc 'src\top.mbt:4:3'
*** Begin Patch
*** Update File: <WORKDIR>/src\tests\json_testsuite_helpers_test.mbt
@@
 
 ///|
 fn expect_accept(name : String, input : String) -> Unit raise {
-  try @json.decode(input) catch {
+  try @json.decode_renamed(input) catch {
     _ => json_testsuite_fail("expected JSONTestSuite accept: " + name)
   } noraise {
     _ => () (escaped)
@@
 
 ///|
 fn expect_reject(name : String, input : String) -> Unit raise {
-  try @json.decode(input) catch {
+  try @json.decode_renamed(input) catch {
     @lib.ParseError(_) => () (escaped)
     _ =>
       json_testsuite_fail(
@@
 
 ///|
 fn expect_accept_or_reject(name : String, input : String) -> Unit raise {
-  try @json.decode(input) catch {
+  try @json.decode_renamed(input) catch {
     @lib.ParseError(_) => () (escaped)
     _ =>
       json_testsuite_fail(
*** Update File: <WORKDIR>/src\tests\json_value_semantics_test.mbt
@@
 ///|
 test "json value semantics basics" {
-  let actual = @json.decode("[false,1,\"x\",null,{\"a\":true}]")
+  let actual = @json.decode_renamed("[false,1,\"x\",null,{\"a\":true}]")
   let expected = Json::array([
     Json::boolean(false),
     Json::number(1.0),
@@
 
 ///|
 test "json value semantics duplicate object key keeps first value" {
-  let actual = @json.decode("{\"a\":\"b\",\"a\":\"c\"}")
+  let actual = @json.decode_renamed("{\"a\":\"b\",\"a\":\"c\"}")
   let expected = Json::object({ "a": Json::string("b") })
   @debug.assert_eq(actual, expected)
 }
@@
 
 ///|
 test "json value semantics escaped unicode is decoded" {
-  let actual = @json.decode("\"\\u0000\"")
+  let actual = @json.decode_renamed("\"\\u0000\"")
   @debug.assert_eq(actual, Json::string("\u{0}"))
 }
 
 ///|
 test "json value semantics allowed escapes are decoded" {
-  let actual = @json.decode("[\"\\\"\\\\\\/\\b\\f\\n\\r\\t\"]")
+  let actual = @json.decode_renamed("[\"\\\"\\\\\\/\\b\\f\\n\\r\\t\"]")
   let expected = String::from_array(
     ['"', '\\', '/', '\u{08}', '\u{0c}', '\n', '\r', '\t'][:],
   )
@@
 
 ///|
 test "json value semantics surrogate pair is decoded" {
-  let actual = @json.decode("\"\\uD834\\uDD1E\"")
+  let actual = @json.decode_renamed("\"\\uD834\\uDD1E\"")
   @debug.assert_eq(actual, Json::string("\u{1d11e}"))
 }
 
*** Update File: <WORKDIR>/src\top.mbt
@@
 ///|
 pub using @lib {
   trait Decode,
-  decode,
+  decode_renamed,
   decode_start,
   decode_continue,
   type Value,
*** End Patch

```
