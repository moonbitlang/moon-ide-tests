# core find-references Test test\types.mbt:17:8

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' find-references 'Test' --loc 'test\types.mbt:17:8'
Found 18 references for symbol 'Test':
<WORKDIR>/diff\diff_html_test.mbt:161:45-161:49:
    | }
    | 
    | ///|
161 | test "real-world HTML diff page" (t : @test.Test) {
    |                                             ^^^^
    |   // Example 0: verbatim git history — diff/extends.mbt across the API
    |   // redesign (commit 25334bf6 -> current main), fetched with `git show`.

<WORKDIR>/diff\diff_test.mbt:609:70-609:74:
    | }
    | 
    | ///|
609 | test "third-party HTML renderer over the public Hunk API" (t : @test.Test) {
    |                                                                      ^^^^
    |   // File-based snapshot: the result is a real page at
    |   // diff/__snapshot__/hunk.html - open it in a browser.

<WORKDIR>/diff\diff_word_test.mbt:221:61-221:65:
    | }
    | 
    | ///|
221 | test "intraline word diff as a styled HTML page" (t : @test.Test) {
    |                                                             ^^^^
    |   // File-based snapshot: open diff/__snapshot__/word_diff.html in a browser.
    |   let old = [

<WORKDIR>/test\README.mbt.md:94:17-94:21:
   | ```mbt check
   | ///|
   | test "test output" {
94 |   let t = @test.Test("Example Test")
   |                 ^^^^
   | 
   |   // Write output to test buffer

<WORKDIR>/test\README.mbt.md:116:17-116:21:
    | ```mbt check
    | ///|
    | test "snapshot testing" {
116 |   let t = @test.Test("Snapshot Test")
    |                 ^^^^
    | 
    |   // Generate some output

<WORKDIR>/test\extends.mbt:22:12-22:16:
   | ///|
   | #deprecated("Use `Debug::to_repr` instead", skip_current_package=true)
   | #doc(hidden)
22 | pub extend Test with @debug.Debug::{to_repr}
   |            ^^^^

<WORKDIR>/test\test.mbt:224:8-224:12:
    | /// Write data to snapshot buffer, use `snapshot` to output.
    | /// 
    | /// See also `@test.Test::writeln`
224 | pub fn Test::write(self : Test, obj : &Show) -> Unit {
    |        ^^^^
    |   self.buffer <+ "\{obj}"
    | }

<WORKDIR>/test\test.mbt:224:27-224:31:
    | /// Write data to snapshot buffer, use `snapshot` to output.
    | /// 
    | /// See also `@test.Test::writeln`
224 | pub fn Test::write(self : Test, obj : &Show) -> Unit {
    |                           ^^^^
    |   self.buffer <+ "\{obj}"
    | }

<WORKDIR>/test\test.mbt:232:8-232:12:
    | /// Write data to snapshot buffer and newline, use `snapshot` to output.
    | /// 
    | /// See also `@test.Test::write`
232 | pub fn Test::writeln(self : Test, obj : &Show) -> Unit {
    |        ^^^^
    |   self.write(obj)
    |   self.buffer.write_char('\n')

<WORKDIR>/test\test.mbt:232:29-232:33:
    | /// Write data to snapshot buffer and newline, use `snapshot` to output.
    | /// 
    | /// See also `@test.Test::write`
232 | pub fn Test::writeln(self : Test, obj : &Show) -> Unit {
    |                             ^^^^
    |   self.write(obj)
    |   self.buffer.write_char('\n')

<WORKDIR>/test\test.mbt:242:21-242:25:
    | /// 
    | /// ```mbt check
    | /// test {
242 | ///   let t = @test.Test("test.txt")
    |                     ^^^^
    | ///   t.writeln("hello")
    | ///   t.snapshot(filename="test.txt") // actual test block end

<WORKDIR>/test\test.mbt:250:8-250:12:
    | ///
    | /// Currently it can only be used once and should be used as the last step.
    | #callsite(autofill(args_loc, loc))
250 | pub fn Test::snapshot(
    |        ^^^^
    |   self : Test,
    |   filename~ : String,

<WORKDIR>/test\test.mbt:251:10-251:14:
    | /// Currently it can only be used once and should be used as the last step.
    | #callsite(autofill(args_loc, loc))
    | pub fn Test::snapshot(
251 |   self : Test,
    |          ^^^^
    |   filename~ : String,
    |   loc~ : SourceLoc,

<WORKDIR>/test\test.mbt:270:8-270:12:
    | 
    | ///|
    | /// Return the name of the test.
270 | pub fn Test::name(self : Self) -> String {
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

<WORKDIR>/test\types.mbt:27:8-27:12:
   | #alias(new, deprecated="Use `Test()` instead")
   | #as_free_fn
   | #as_free_fn(new, deprecated="Use `Test()` instead")
27 | pub fn Test::Test(name : String) -> Test {
   |        ^^^^
   |   { name, buffer: StringBuilder(), }
   | }

<WORKDIR>/test\types.mbt:27:14-27:18:
   | #alias(new, deprecated="Use `Test()` instead")
   | #as_free_fn
   | #as_free_fn(new, deprecated="Use `Test()` instead")
27 | pub fn Test::Test(name : String) -> Test {
   |              ^^^^
   |   { name, buffer: StringBuilder(), }
   | }

<WORKDIR>/test\types.mbt:27:37-27:41:
   | #alias(new, deprecated="Use `Test()` instead")
   | #as_free_fn
   | #as_free_fn(new, deprecated="Use `Test()` instead")
27 | pub fn Test::Test(name : String) -> Test {
   |                                     ^^^^
   |   { name, buffer: StringBuilder(), }
   | }
"" (escaped)
```
