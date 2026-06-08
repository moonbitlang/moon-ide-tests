# toml-parser hover

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/toml-parser" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide hover 'str_val' --loc 'cmd/main/main.mbt:7:7'
  // Demo 1: Basic value types
  println("\n--- Basic Value Types ---")
  let str_val = @toml.TomlString("Hello, TOML!")
      ^^^^^^^
      ```moonbit
      @toml.TomlValue
      ```
  let int_val = @toml.TomlInteger(42L)
  let bool_val = @toml.TomlBoolean(true)
```

```mooncram
$ run_moon_ide moon ide hover 'TomlString' --loc 'cmd/main/main.mbt:7:23'
  // Demo 1: Basic value types
  println("\n--- Basic Value Types ---")
  let str_val = @toml.TomlString("Hello, TOML!")
                      ^^^^^^^^^^
                      ```moonbit
                      (String) -> @toml.TomlValue
                      ```
  let int_val = @toml.TomlInteger(42L)
  let bool_val = @toml.TomlBoolean(true)
```

```mooncram
$ run_moon_ide moon ide hover 'TestResult' --loc 'e2e/runner.mbt:7:12'
/// `failures` carries one entry per failing case (typically including the
/// fixture path and a short reason) so that the test harness can print a
/// summary at the end without re-walking the corpus.
pub struct TestResult {
           ^^^^^^^^^^
           ```moonbit
           struct TestResult {
             passed: Int
             failed: Int
             failures: Array[String]
           }
           ```
           ---
           
            Aggregate of a test-suite run: counts and per-failure messages.
           
            `failures` carries one entry per failing case (typically including the
            fixture path and a short reason) so that the test harness can print a
            summary at the end without re-walking the corpus.
  passed : Int
  failed : Int
```

```mooncram
$ run_moon_ide moon ide hover 'passed' --loc 'e2e/runner.mbt:8:3'
/// fixture path and a short reason) so that the test harness can print a
/// summary at the end without re-walking the corpus.
pub struct TestResult {
  passed : Int
  ^^^^^^
  ```moonbit
  Int
  ```
  failed : Int
  failures : Array[String]
```

```mooncram
$ run_moon_ide moon ide hover 'to_test_json' --loc 'e2e/convert.mbt:5:8'
/// Convert a TomlValue to the toml-test JSON format.
/// Leaf values become {"type": "...", "value": "..."}
/// Tables become plain JSON objects, arrays become JSON arrays.
pub fn to_test_json(value : @toml.TomlValue) -> Json {
       ^^^^^^^^^^^^
       ```moonbit
       fn to_test_json(value : @toml.TomlValue) -> Json
       ```
       ---
       
        Convert a TomlValue to the toml-test JSON format.
        Leaf values become {"type": "...", "value": "..."}
        Tables become plain JSON objects, arrays become JSON arrays.
  match value {
    TomlString(s) => typed_value("string", s) (escaped)
```

```mooncram
$ run_moon_ide moon ide hover 'value' --loc 'e2e/convert.mbt:5:21'
/// Convert a TomlValue to the toml-test JSON format.
/// Leaf values become {"type": "...", "value": "..."}
/// Tables become plain JSON objects, arrays become JSON arrays.
pub fn to_test_json(value : @toml.TomlValue) -> Json {
                    ^^^^^
                    ```moonbit
                    @toml.TomlValue
                    ```
  match value {
    TomlString(s) => typed_value("string", s) (escaped)
```

```mooncram
$ run_moon_ide moon ide hover 'files' --loc 'e2e/e2e_test.mbt:3:7'
///|
async test "valid toml-test suite" {
  let files : Array[String] = []
      ^^^^^
      ```moonbit
      Array[String]
      ```
  @e2e.collect_toml_files("e2e/testdata/valid", files)
  files.sort()
```

```mooncram
$ run_moon_ide moon ide hover 'collect_toml_files' --loc 'e2e/e2e_test.mbt:4:8'
///|
async test "valid toml-test suite" {
  let files : Array[String] = []
  @e2e.collect_toml_files("e2e/testdata/valid", files)
  ^^^^^^^^^^^^^^^^^^^^^^^
  ```moonbit
  fn @bobzhang/toml-e2e.collect_toml_files(dir : String, files : Array[String]) -> Unit raise @fs.IOError
  ```
  ---
  
   Recursively collect all .toml files in a directory.
  files.sort()
  let mut passed = 0
```

```mooncram
$ run_moon_ide moon ide hover 'result' --loc 'e2e/known_failures_test.mbt:10:7'
///|
test "fixed: [a-a-a] table header parses correctly" {
  let result = try? @toml.parse("[a-a-a]\n_ = false\n")
      ^^^^^^
      ```moonbit
      Result[@toml.TomlValue, Error]
      ```
  debug_inspect(
    result,
```

```mooncram
$ run_moon_ide moon ide hover 'parse' --loc 'e2e/known_failures_test.mbt:10:27'
///|
test "fixed: [a-a-a] table header parses correctly" {
  let result = try? @toml.parse("[a-a-a]\n_ = false\n")
                    ^^^^^^^^^^^
                    ```moonbit
                    fn @bobzhang/toml.parse(input : String) -> @toml.TomlValue raise
                    ```
                    ---
                    
                     Parse a TOML document and return its root table as a `TomlValue`.
                    
                     On success the result is always a `TomlTable` whose contents reflect the
                     document's top-level keys, `[section]` headers, and `[[array]]` of
                     tables. Standard TOML 1.0 plus 1.1 features (optional seconds, `\xHH`
                     escapes, inline-table newlines) are accepted.
                    
                     On any lexical or syntactic error, `parse` raises with a message
                     containing the source location. Wrap the call in `try?` to receive a
                     `Result[TomlValue, Error]` instead.
  debug_inspect(
    result,
```
