# core find-references Test test/types.mbt:16:8

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/core" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide find-references 'Test' --loc 'test/types.mbt:16:8'
Found 18 references for symbol 'Test':
<WORKDIR>/diff/diff_html_test.mbt:161:45-161:49:
    | }
    | 
    | ///|
161 | test "real-world HTML diff page" (t : @test.Test) {
    |                                             ^^^^
    |   // Example 0: verbatim git history — diff/extends.mbt across the API
    |   // redesign (commit 25334bf6 -> current main), fetched with `git show`.

<WORKDIR>/diff/diff_test.mbt:607:70-607:74:
    | }
    | 
    | ///|
607 | test "third-party HTML renderer over the public Hunk API" (t : @test.Test) {
    |                                                                      ^^^^
    |   // File-based snapshot: the result is a real page at
    |   // diff/__snapshot__/hunk.html - open it in a browser.

<WORKDIR>/diff/diff_word_test.mbt:221:61-221:65:
    | }
    | 
    | ///|
221 | test "intraline word diff as a styled HTML page" (t : @test.Test) {
    |                                                             ^^^^
    |   // File-based snapshot: open diff/__snapshot__/word_diff.html in a browser.
    |   let old = [

<WORKDIR>/test/README.mbt.md:93:17-93:21:
   | ```mbt check
   | ///|
   | test "test output" {
93 |   let t = @test.Test("Example Test")
   |                 ^^^^
   | 
   |   // Write output to test buffer

<WORKDIR>/test/README.mbt.md:115:17-115:21:
    | ```mbt check
    | ///|
    | test "snapshot testing" {
115 |   let t = @test.Test("Snapshot Test")
    |                 ^^^^
    | 
    |   // Generate some output

<WORKDIR>/test/extends.mbt:22:12-22:16:
   | ///|
   | #deprecated("Use `Debug::to_repr` instead", skip_current_package=true)
   | #doc(hidden)
22 | pub extend Test with @debug.Debug::{to_repr}
   |            ^^^^

<WORKDIR>/test/test.mbt:231:8-231:12:
    | /// Write data to snapshot buffer, use `snapshot` to output.
    | /// 
    | /// See also `@test.Test::writeln`
231 | pub fn Test::write(self : Test, obj : &Show) -> Unit {
    |        ^^^^
    |   self.buffer <+ "\{obj}"
    | }

<WORKDIR>/test/test.mbt:231:27-231:31:
    | /// Write data to snapshot buffer, use `snapshot` to output.
    | /// 
    | /// See also `@test.Test::writeln`
231 | pub fn Test::write(self : Test, obj : &Show) -> Unit {
    |                           ^^^^
    |   self.buffer <+ "\{obj}"
    | }

<WORKDIR>/test/test.mbt:239:8-239:12:
    | /// Write data to snapshot buffer and newline, use `snapshot` to output.
    | /// 
    | /// See also `@test.Test::write`
239 | pub fn Test::writeln(self : Test, obj : &Show) -> Unit {
    |        ^^^^
    |   self.write(obj)
    |   self.buffer.write_char('\n')

<WORKDIR>/test/test.mbt:239:29-239:33:
    | /// Write data to snapshot buffer and newline, use `snapshot` to output.
    | /// 
    | /// See also `@test.Test::write`
239 | pub fn Test::writeln(self : Test, obj : &Show) -> Unit {
    |                             ^^^^
    |   self.write(obj)
    |   self.buffer.write_char('\n')

<WORKDIR>/test/test.mbt:249:21-249:25:
    | /// 
    | /// ```mbt check
    | /// test {
249 | ///   let t = @test.Test("test.txt")
    |                     ^^^^
    | ///   t.writeln("hello")
    | ///   t.snapshot(filename="test.txt") // actual test block end

<WORKDIR>/test/test.mbt:257:8-257:12:
    | ///
    | /// Currently it can only be used once and should be used as the last step.
    | #callsite(autofill(args_loc, loc))
257 | pub fn Test::snapshot(
    |        ^^^^
    |   self : Test,
    |   filename~ : String,

<WORKDIR>/test/test.mbt:258:10-258:14:
    | /// Currently it can only be used once and should be used as the last step.
    | #callsite(autofill(args_loc, loc))
    | pub fn Test::snapshot(
258 |   self : Test,
    |          ^^^^
    |   filename~ : String,
    |   loc~ : SourceLoc,

<WORKDIR>/test/test.mbt:277:8-277:12:
    | 
    | ///|
    | /// Return the name of the test.
277 | pub fn Test::name(self : Self) -> String {
    |        ^^^^
    |   self.name
    | }

<WORKDIR>/test/test_test.mbt:47:17-47:21:
   | 
   | ///|
   | test "Test name" {
47 |   let t = @test.Test("sample")
   |                 ^^^^
   |   inspect(t.name(), content="sample")
   | }

<WORKDIR>/test/types.mbt:26:8-26:12:
   | #alias(new, deprecated="Use `Test()` instead")
   | #as_free_fn
   | #as_free_fn(new, deprecated="Use `Test()` instead")
26 | pub fn Test::Test(name : String) -> Test {
   |        ^^^^
   |   { name, buffer: StringBuilder(), }
   | }

<WORKDIR>/test/types.mbt:26:14-26:18:
   | #alias(new, deprecated="Use `Test()` instead")
   | #as_free_fn
   | #as_free_fn(new, deprecated="Use `Test()` instead")
26 | pub fn Test::Test(name : String) -> Test {
   |              ^^^^
   |   { name, buffer: StringBuilder(), }
   | }

<WORKDIR>/test/types.mbt:26:37-26:41:
   | #alias(new, deprecated="Use `Test()` instead")
   | #as_free_fn
   | #as_free_fn(new, deprecated="Use `Test()` instead")
26 | pub fn Test::Test(name : String) -> Test {
   |                                     ^^^^
   |   { name, buffer: StringBuilder(), }
   | }

```
