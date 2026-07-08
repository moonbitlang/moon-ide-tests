# toml-parser hover

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide hover 'version' --loc 'cmd\toml\main.mbt:2:5'
///|
let version : String = "0.2.3"
    ^^^^^^^
    ```moonbit
    String
    ```
    ---
    

///|
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide hover 'toml_command' --loc 'cmd\toml\main.mbt:5:4'
let version : String = "0.2.3"

///|
fn toml_command() -> @argparse.Command {
   ^^^^^^^^^^^^
   ```moonbit
   fn toml_command() -> @argparse.Command
   ```
  Command(
    "toml",
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide hover 'TestResult' --loc 'e2e\runner.mbt:7:12'
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
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide hover 'passed' --loc 'e2e\runner.mbt:8:3'
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
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide hover 'to_test_json' --loc 'e2e\convert.mbt:5:8'
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
    TomlString(s) => typed_value("string", s)
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide hover 'value' --loc 'e2e\convert.mbt:5:21'
/// Convert a TomlValue to the toml-test JSON format.
/// Leaf values become {"type": "...", "value": "..."}
/// Tables become plain JSON objects, arrays become JSON arrays.
pub fn to_test_json(value : @toml.TomlValue) -> Json {
                    ^^^^^
                    ```moonbit
                    @toml.TomlValue
                    ```
  match value {
    TomlString(s) => typed_value("string", s)
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide hover 'files' --loc 'e2e\e2e_test.mbt:3:7'
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
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide hover 'collect_toml_files' --loc 'e2e\e2e_test.mbt:4:8'
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
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide hover 'result' --loc 'e2e\known_failures_test.mbt:10:7'
///|
test "fixed: [a-a-a] table header parses correctly" {
  let result = try @toml.parse("[a-a-a]\n_ = false\n") catch {
      ^^^^^^
      ```moonbit
      Result[@toml.TomlValue, Error]
      ```
    err => Err(err)
  } noraise {
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide hover 'parse' --loc 'e2e\known_failures_test.mbt:10:26'
///|
test "fixed: [a-a-a] table header parses correctly" {
  let result = try @toml.parse("[a-a-a]\n_ = false\n") catch {
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
    err => Err(err)
  } noraise {
```
