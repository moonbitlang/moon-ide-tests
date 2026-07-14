# core rename Test test\types.mbt:16:8

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'Test' 'TestRenamed' --loc 'test\types.mbt:16:8'
*** Begin Patch
*** Update File: <WORKDIR>/test\README.mbt.md
@@
 ```mbt check
 ///|
 test "test output" {
-  let t = @test.Test("Example Test")
+  let t = @test.TestRenamed("Example Test")
 
   // Write output to test buffer
   t.write("Testing basic functionality: ")
@@
 ```mbt check
 ///|
 test "snapshot testing" {
-  let t = @test.Test("Snapshot Test")
+  let t = @test.TestRenamed("Snapshot Test")
 
   // Generate some output
   t.writeln("Current timestamp: 2024-01-01")
*** Update File: <WORKDIR>/test\test.mbt
@@
 /// Write data to snapshot buffer, use `snapshot` to output.
 /// 
 /// See also `@test.Test::writeln`
-pub fn Test::write(self : Test, obj : &Show) -> Unit {
+pub fn TestRenamed::write(self : TestRenamed, obj : &Show) -> Unit {
   self.buffer.write_string(obj.to_string())
 }
 
@@
 /// Write data to snapshot buffer and newline, use `snapshot` to output.
 /// 
 /// See also `@test.Test::write`
-pub fn Test::writeln(self : Test, obj : &Show) -> Unit {
+pub fn TestRenamed::writeln(self : TestRenamed, obj : &Show) -> Unit {
   self.write(obj)
   self.buffer.write_char('\n')
 }
@@
 /// 
 /// ```mbt check
 /// test {
-///   let t = @test.Test("test.txt")
+///   let t = @test.TestRenamed("test.txt")
 ///   t.writeln("hello")
 ///   t.snapshot(filename="test.txt") // actual test block end
 /// }
@@
 ///
 /// Currently it can only be used once and should be used as the last step.
 #callsite(autofill(args_loc, loc))
-pub fn Test::snapshot(
+pub fn TestRenamed::snapshot(
-  self : Test,
+  self : TestRenamed,
   filename~ : String,
   loc~ : SourceLoc,
   args_loc~ : ArgsLoc,
@@
 
 ///|
 /// Return the name of the test.
-pub fn Test::name(self : Self) -> String {
+pub fn TestRenamed::name(self : Self) -> String {
   self.name
 }
*** Update File: <WORKDIR>/test\test_test.mbt
@@
 
 ///|
 test "Test name" {
-  let t = @test.Test("sample")
+  let t = @test.TestRenamed("sample")
   inspect(t.name(), content="sample")
 }
 
*** Update File: <WORKDIR>/test\types.mbt
@@
 // limitations under the License.
 
 ///|
-struct Test {
+struct TestRenamed {
   name : String
   buffer : StringBuilder
 } derive(@debug.Debug)
@@
 #alias(new, deprecated="Use `Test()` instead")
 #as_free_fn
 #as_free_fn(new, deprecated="Use `Test()` instead")
-pub fn Test::Test(name : String) -> Test {
+pub fn TestRenamed::TestRenamed(name : String) -> TestRenamed {
   { name, buffer: StringBuilder() }
 }
*** End Patch

```
