# core find-references Test test\types.mbt:16:8

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide find-references 'Test' --loc 'test\types.mbt:16:8'
Found 15 references for symbol 'Test':
<WORKDIR>/test\README.mbt.md:93:17-93:21:
   | ```mbt check
   | ///|
   | test "test output" {
93 |   let t = @test.Test("Example Test")
   |                 ^^^^
   | 
   |   // Write output to test buffer

<WORKDIR>/test\README.mbt.md:115:17-115:21:
    | ```mbt check
    | ///|
    | test "snapshot testing" {
115 |   let t = @test.Test("Snapshot Test")
    |                 ^^^^
    | 
    |   // Generate some output

<WORKDIR>/test\test.mbt:191:8-191:12:
    | /// Write data to snapshot buffer, use `snapshot` to output.
    | /// 
    | /// See also `@test.Test::writeln`
191 | pub fn Test::write(self : Test, obj : &Show) -> Unit {
    |        ^^^^
    |   self.buffer.write_string(obj.to_string())
    | }

<WORKDIR>/test\test.mbt:191:27-191:31:
    | /// Write data to snapshot buffer, use `snapshot` to output.
    | /// 
    | /// See also `@test.Test::writeln`
191 | pub fn Test::write(self : Test, obj : &Show) -> Unit {
    |                           ^^^^
    |   self.buffer.write_string(obj.to_string())
    | }

<WORKDIR>/test\test.mbt:199:8-199:12:
    | /// Write data to snapshot buffer and newline, use `snapshot` to output.
    | /// 
    | /// See also `@test.Test::write`
199 | pub fn Test::writeln(self : Test, obj : &Show) -> Unit {
    |        ^^^^
    |   self.write(obj)
    |   self.buffer.write_char('\n')

<WORKDIR>/test\test.mbt:199:29-199:33:
    | /// Write data to snapshot buffer and newline, use `snapshot` to output.
    | /// 
    | /// See also `@test.Test::write`
199 | pub fn Test::writeln(self : Test, obj : &Show) -> Unit {
    |                             ^^^^
    |   self.write(obj)
    |   self.buffer.write_char('\n')

<WORKDIR>/test\test.mbt:209:21-209:25:
    | /// 
    | /// ```mbt check
    | /// test {
209 | ///   let t = @test.Test("test.txt")
    |                     ^^^^
    | ///   t.writeln("hello")
    | ///   t.snapshot(filename="test.txt") // actual test block end

<WORKDIR>/test\test.mbt:217:8-217:12:
    | ///
    | /// Currently it can only be used once and should be used as the last step.
    | #callsite(autofill(args_loc, loc))
217 | pub fn Test::snapshot(
    |        ^^^^
    |   self : Test,
    |   filename~ : String,

<WORKDIR>/test\test.mbt:218:10-218:14:
    | /// Currently it can only be used once and should be used as the last step.
    | #callsite(autofill(args_loc, loc))
    | pub fn Test::snapshot(
218 |   self : Test,
    |          ^^^^
    |   filename~ : String,
    |   loc~ : SourceLoc,

<WORKDIR>/test\test.mbt:235:8-235:12:
    | 
    | ///|
    | /// Return the name of the test.
235 | pub fn Test::name(self : Self) -> String {
    |        ^^^^
    |   self.name
    | }

<WORKDIR>/test\test_test.mbt:47:17-47:21:
   | 
   | ///|
   | test "Test name" {
47 |   let t = @test.Test("sample")
   |                 ^^^^
   |   inspect(t.name(), content="sample")
   | }

<WORKDIR>/test\types.mbt:16:8-16:12:
   | // limitations under the License.
   | 
   | ///|
16 | struct Test {
   |        ^^^^
   |   name : String
   |   buffer : StringBuilder

<WORKDIR>/test\types.mbt:26:8-26:12:
   | #alias(new, deprecated="Use `Test()` instead")
   | #as_free_fn
   | #as_free_fn(new, deprecated="Use `Test()` instead")
26 | pub fn Test::Test(name : String) -> Test {
   |        ^^^^
   |   { name, buffer: StringBuilder() }
   | }

<WORKDIR>/test\types.mbt:26:14-26:18:
   | #alias(new, deprecated="Use `Test()` instead")
   | #as_free_fn
   | #as_free_fn(new, deprecated="Use `Test()` instead")
26 | pub fn Test::Test(name : String) -> Test {
   |              ^^^^
   |   { name, buffer: StringBuilder() }
   | }

<WORKDIR>/test\types.mbt:26:37-26:41:
   | #alias(new, deprecated="Use `Test()` instead")
   | #as_free_fn
   | #as_free_fn(new, deprecated="Use `Test()` instead")
26 | pub fn Test::Test(name : String) -> Test {
   |                                     ^^^^
   |   { name, buffer: StringBuilder() }
   | }

```
