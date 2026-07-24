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
Found 16 references for symbol 'Test':
<WORKDIR>/test/README.mbt.md:99:17-99:21:
   | ```mbt check
   | ///|
   | test "test output" {
99 |   let t = @test.Test("Example Test")
   |                 ^^^^
   | 
   |   // Write output to test buffer

<WORKDIR>/test/README.mbt.md:121:17-121:21:
    | ```mbt check
    | ///|
    | test "snapshot testing" {
121 |   let t = @test.Test("Snapshot Test")
    |                 ^^^^
    | 
    |   // Generate some output

<WORKDIR>/test/extends.mbt:22:12-22:16:
   | ///|
   | #deprecated("Use `Debug::to_repr` instead", skip_current_package=true)
   | #doc(hidden)
22 | pub extend Test with @debug.Debug::{to_repr}
   |            ^^^^

<WORKDIR>/test/test.mbt:192:8-192:12:
    | /// Write data to snapshot buffer, use `snapshot` to output.
    | /// 
    | /// See also `@test.Test::writeln`
192 | pub fn Test::write(self : Test, obj : &Show) -> Unit {
    |        ^^^^
    |   self.buffer.write_string(obj.to_string())
    | }

<WORKDIR>/test/test.mbt:192:27-192:31:
    | /// Write data to snapshot buffer, use `snapshot` to output.
    | /// 
    | /// See also `@test.Test::writeln`
192 | pub fn Test::write(self : Test, obj : &Show) -> Unit {
    |                           ^^^^
    |   self.buffer.write_string(obj.to_string())
    | }

<WORKDIR>/test/test.mbt:200:8-200:12:
    | /// Write data to snapshot buffer and newline, use `snapshot` to output.
    | /// 
    | /// See also `@test.Test::write`
200 | pub fn Test::writeln(self : Test, obj : &Show) -> Unit {
    |        ^^^^
    |   self.write(obj)
    |   self.buffer.write_char('\n')

<WORKDIR>/test/test.mbt:200:29-200:33:
    | /// Write data to snapshot buffer and newline, use `snapshot` to output.
    | /// 
    | /// See also `@test.Test::write`
200 | pub fn Test::writeln(self : Test, obj : &Show) -> Unit {
    |                             ^^^^
    |   self.write(obj)
    |   self.buffer.write_char('\n')

<WORKDIR>/test/test.mbt:210:21-210:25:
    | /// 
    | /// ```mbt check
    | /// test {
210 | ///   let t = @test.Test("test.txt")
    |                     ^^^^
    | ///   t.writeln("hello")
    | ///   t.snapshot(filename="test.txt") // actual test block end

<WORKDIR>/test/test.mbt:218:8-218:12:
    | ///
    | /// Currently it can only be used once and should be used as the last step.
    | #callsite(autofill(args_loc, loc))
218 | pub fn Test::snapshot(
    |        ^^^^
    |   self : Test,
    |   filename~ : String,

<WORKDIR>/test/test.mbt:219:10-219:14:
    | /// Currently it can only be used once and should be used as the last step.
    | #callsite(autofill(args_loc, loc))
    | pub fn Test::snapshot(
219 |   self : Test,
    |          ^^^^
    |   filename~ : String,
    |   loc~ : SourceLoc,

<WORKDIR>/test/test.mbt:238:8-238:12:
    | 
    | ///|
    | /// Return the name of the test.
238 | pub fn Test::name(self : Self) -> String {
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

<WORKDIR>/test/types.mbt:16:8-16:12:
   | // limitations under the License.
   | 
   | ///|
16 | struct Test {
   |        ^^^^
   |   name : String
   |   buffer : StringBuilder

<WORKDIR>/test/types.mbt:26:8-26:12:
   | #alias(new, deprecated="Use `Test()` instead")
   | #as_free_fn
   | #as_free_fn(new, deprecated="Use `Test()` instead")
26 | pub fn Test::Test(name : String) -> Test {
   |        ^^^^
   |   { name, buffer: StringBuilder() }
   | }

<WORKDIR>/test/types.mbt:26:14-26:18:
   | #alias(new, deprecated="Use `Test()` instead")
   | #as_free_fn
   | #as_free_fn(new, deprecated="Use `Test()` instead")
26 | pub fn Test::Test(name : String) -> Test {
   |              ^^^^
   |   { name, buffer: StringBuilder() }
   | }

<WORKDIR>/test/types.mbt:26:37-26:41:
   | #alias(new, deprecated="Use `Test()` instead")
   | #as_free_fn
   | #as_free_fn(new, deprecated="Use `Test()` instead")
26 | pub fn Test::Test(name : String) -> Test {
   |                                     ^^^^
   |   { name, buffer: StringBuilder() }
   | }

```
