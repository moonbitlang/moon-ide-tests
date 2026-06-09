# toml-parser find-references

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
$ run_moon_ide moon ide find-references 'version' --loc 'cmd/toml/main.mbt:2:5'
Found 2 references for symbol 'version':
<WORKDIR>/cmd/toml/main.mbt:2:5-2:12:
  | ///|
2 | let version : String = "0.2.3"
  |     ^^^^^^^
  | 
  | ///|

<WORKDIR>/cmd/toml/main.mbt:9:5-9:12:
  |   Command(
  |     "toml",
  |     about="Parse, validate, and format TOML files.",
9 |     version~,
  |     ^^^^^^^
  |     arg_required_else_help=true,
  |     positionals=[

```

```mooncram
$ run_moon_ide moon ide find-references 'toml_command' --loc 'cmd/toml/main.mbt:5:4'
Found 2 references for symbol 'toml_command':
<WORKDIR>/cmd/toml/main.mbt:5:4-5:16:
  | let version : String = "0.2.3"
  | 
  | ///|
5 | fn toml_command() -> @argparse.Command {
  |    ^^^^^^^^^^^^
  |   Command(
  |     "toml",

<WORKDIR>/cmd/toml/main.mbt:43:33-43:45:
   | 
   | ///|
   | fn run(args : ArrayView[String]) -> Int {
43 |   let matches = @argparse.parse(toml_command(), argv=args, env={}) catch {
   |                                 ^^^^^^^^^^^^
   |     err => {
   |       println(err)

```

```mooncram
$ run_moon_ide moon ide find-references 'TestResult' --loc 'e2e/runner.mbt:7:12'
Found 3 references for symbol 'TestResult':
<WORKDIR>/e2e/runner.mbt:7:12-7:22:
  | /// `failures` carries one entry per failing case (typically including the (escaped)
  | /// fixture path and a short reason) so that the test harness can print a (escaped)
  | /// summary at the end without re-walking the corpus. (escaped)
7 | pub struct TestResult { (escaped)
  |            ^^^^^^^^^^ (escaped)
  |   passed : Int (escaped)
  |   failed : Int (escaped)

<WORKDIR>/e2e/runner.mbt:15:8-15:18:
   |  (escaped)
   | ///| (escaped)
   | /// Create an empty `TestResult` with zero counts and no failures recorded. (escaped)
15 | pub fn TestResult::new() -> TestResult { (escaped)
   |        ^^^^^^^^^^ (escaped)
   |   { passed: 0, failed: 0, failures: [] } (escaped)
   | } (escaped)

<WORKDIR>/e2e/runner.mbt:15:29-15:39:
   |  (escaped)
   | ///| (escaped)
   | /// Create an empty `TestResult` with zero counts and no failures recorded. (escaped)
15 | pub fn TestResult::new() -> TestResult { (escaped)
   |                             ^^^^^^^^^^ (escaped)
   |   { passed: 0, failed: 0, failures: [] } (escaped)
   | } (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'passed' --loc 'e2e/runner.mbt:8:3'
Found 2 references for symbol 'passed':
<WORKDIR>/e2e/runner.mbt:8:3-8:9:
  | /// fixture path and a short reason) so that the test harness can print a (escaped)
  | /// summary at the end without re-walking the corpus. (escaped)
  | pub struct TestResult { (escaped)
8 |   passed : Int (escaped)
  |   ^^^^^^ (escaped)
  |   failed : Int (escaped)
  |   failures : Array[String] (escaped)

<WORKDIR>/e2e/runner.mbt:16:5-16:11:
   | ///| (escaped)
   | /// Create an empty `TestResult` with zero counts and no failures recorded. (escaped)
   | pub fn TestResult::new() -> TestResult { (escaped)
16 |   { passed: 0, failed: 0, failures: [] } (escaped)
   |     ^^^^^^ (escaped)
   | } (escaped)
   |  (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'to_test_json' --loc 'e2e/convert.mbt:5:8'
Found 5 references for symbol 'to_test_json':
<WORKDIR>/e2e/convert.mbt:5:8-5:20:
  | /// Convert a TomlValue to the toml-test JSON format. (escaped)
  | /// Leaf values become {"type": "...", "value": "..."} (escaped)
  | /// Tables become plain JSON objects, arrays become JSON arrays. (escaped)
5 | pub fn to_test_json(value : @toml.TomlValue) -> Json { (escaped)
  |        ^^^^^^^^^^^^ (escaped)
  |   match value { (escaped)
  |     TomlString(s) => typed_value("string", s) (escaped)

<WORKDIR>/e2e/convert.mbt:20:53-20:65:
   |         _ => typed_value("date-local", s) (escaped)
   |       } (escaped)
   |     } (escaped)
20 |     TomlArray(arr) => Json::array([ for v in arr => to_test_json(v) ]) (escaped)
   |                                                     ^^^^^^^^^^^^ (escaped)
   |     TomlTable(table) => (escaped)
   |       Json::object( (escaped)

<WORKDIR>/e2e/convert.mbt:23:52-23:64:
   |     TomlArray(arr) => Json::array([ for v in arr => to_test_json(v) ]) (escaped)
   |     TomlTable(table) => (escaped)
   |       Json::object( (escaped)
23 |         Map::from_array([ for k, v in table => (k, to_test_json(v)) ]), (escaped)
   |                                                    ^^^^^^^^^^^^ (escaped)
   |       ) (escaped)
   |   } (escaped)

<WORKDIR>/e2e/e2e_test.mbt:34:27-34:39:
   |         failed += 1 (escaped)
   |       } (escaped)
   |       Ok(value) => { (escaped)
34 |         let actual = @e2e.to_test_json(value)
   |                           ^^^^^^^^^^^^ (escaped)
   |         if !@e2e.json_equal(actual, expected) { (escaped)
   |           failures.push( (escaped)

<WORKDIR>/e2e/runner.mbt:57:20-57:32:
   |   match parsed { (escaped)
   |     Err(e) => Some("[PARSE-ERROR] \\{toml_path}: \\{e}") (escaped)
   |     Ok(value) => { (escaped)
57 |       let actual = to_test_json(value)
   |                    ^^^^^^^^^^^^ (escaped)
   |       if !json_equal(actual, expected) { (escaped)
   |         Some( (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'value' --loc 'e2e/convert.mbt:5:21'
Found 3 references for symbol 'value':
<WORKDIR>/e2e/convert.mbt:5:21-5:26:
  | /// Convert a TomlValue to the toml-test JSON format. (escaped)
  | /// Leaf values become {"type": "...", "value": "..."} (escaped)
  | /// Tables become plain JSON objects, arrays become JSON arrays. (escaped)
5 | pub fn to_test_json(value : @toml.TomlValue) -> Json { (escaped)
  |                     ^^^^^ (escaped)
  |   match value { (escaped)
  |     TomlString(s) => typed_value("string", s) (escaped)

<WORKDIR>/e2e/convert.mbt:6:9-6:14:
  | /// Leaf values become {"type": "...", "value": "..."} (escaped)
  | /// Tables become plain JSON objects, arrays become JSON arrays. (escaped)
  | pub fn to_test_json(value : @toml.TomlValue) -> Json { (escaped)
6 |   match value { (escaped)
  |         ^^^^^ (escaped)
  |     TomlString(s) => typed_value("string", s) (escaped)
  |     TomlInteger(i) => typed_value("integer", i.to_string()) (escaped)

<WORKDIR>/e2e/convert.mbt:12:23-12:28:
   |     TomlFloat(f) => typed_value("float", format_test_float(f)) (escaped)
   |     TomlBoolean(b) => typed_value("bool", if b { "true" } else { "false" }) (escaped)
   |     TomlDateTime(_) => { (escaped)
12 |       let (kind, s) = value.datetime_info().unwrap() (escaped)
   |                       ^^^^^ (escaped)
   |       match kind { (escaped)
   |         "OffsetDateTime" => typed_value("datetime", normalize_datetime(s)) (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'files' --loc 'e2e/e2e_test.mbt:3:7'
Found 4 references for symbol 'files':
<WORKDIR>/e2e/e2e_test.mbt:3:7-3:12:
  | ///| (escaped)
  | async test "valid toml-test suite" { (escaped)
3 |   let files : Array[String] = [] (escaped)
  |       ^^^^^ (escaped)
  |   @e2e.collect_toml_files("e2e/testdata/valid", files) (escaped)
  |   files.sort() (escaped)

<WORKDIR>/e2e/e2e_test.mbt:4:49-4:54:
  | ///| (escaped)
  | async test "valid toml-test suite" { (escaped)
  |   let files : Array[String] = [] (escaped)
4 |   @e2e.collect_toml_files("e2e/testdata/valid", files) (escaped)
  |                                                 ^^^^^ (escaped)
  |   files.sort() (escaped)
  |   let mut passed = 0 (escaped)

<WORKDIR>/e2e/e2e_test.mbt:5:3-5:8:
  | async test "valid toml-test suite" { (escaped)
  |   let files : Array[String] = [] (escaped)
  |   @e2e.collect_toml_files("e2e/testdata/valid", files) (escaped)
5 |   files.sort() (escaped)
  |   ^^^^^ (escaped)
  |   let mut passed = 0 (escaped)
  |   let mut failed = 0 (escaped)

<WORKDIR>/e2e/e2e_test.mbt:9:20-9:25:
  |   let mut passed = 0 (escaped)
  |   let mut failed = 0 (escaped)
  |   let failures : Array[String] = [] (escaped)
9 |   for toml_path in files { (escaped)
  |                    ^^^^^ (escaped)
  |     let json_path = "\\{toml_path[:toml_path.length() - 5]}.json" (escaped)
  |     if !@fs.path_exists(json_path) { (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'collect_toml_files' --loc 'e2e/e2e_test.mbt:4:8'
Found 4 references for symbol 'collect_toml_files':
<WORKDIR>/e2e/e2e_test.mbt:4:8-4:26:
  | ///| (escaped)
  | async test "valid toml-test suite" { (escaped)
  |   let files : Array[String] = [] (escaped)
4 |   @e2e.collect_toml_files("e2e/testdata/valid", files) (escaped)
  |        ^^^^^^^^^^^^^^^^^^ (escaped)
  |   files.sort() (escaped)
  |   let mut passed = 0 (escaped)

<WORKDIR>/e2e/e2e_test.mbt:64:8-64:26:
   | ///| (escaped)
   | async test "invalid toml-test suite" { (escaped)
   |   let files : Array[String] = [] (escaped)
64 |   @e2e.collect_toml_files("e2e/testdata/invalid", files)
   |        ^^^^^^^^^^^^^^^^^^ (escaped)
   |   files.sort() (escaped)
   |   let mut passed = 0 (escaped)

<WORKDIR>/e2e/runner.mbt:21:8-21:26:
   |  (escaped)
   | ///| (escaped)
   | /// Recursively collect all .toml files in a directory. (escaped)
21 | pub fn collect_toml_files( (escaped)
   |        ^^^^^^^^^^^^^^^^^^ (escaped)
   |   dir : String, (escaped)
   |   files : Array[String], (escaped)

<WORKDIR>/e2e/runner.mbt:29:7-29:25:
   |   for entry in entries { (escaped)
   |     let path = "\\{dir}/\\{entry}" (escaped)
   |     if @fs.is_dir(path) { (escaped)
29 |       collect_toml_files(path, files) (escaped)
   |       ^^^^^^^^^^^^^^^^^^ (escaped)
   |     } else if entry.has_suffix(".toml") { (escaped)
   |       files.push(path) (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'result' --loc 'e2e/known_failures_test.mbt:10:7'
Found 2 references for symbol 'result':
<WORKDIR>/e2e/known_failures_test.mbt:10:7-10:13:
   |  (escaped)
   | ///| (escaped)
   | test "fixed: [a-a-a] table header parses correctly" { (escaped)
10 |   let result = try @toml.parse("[a-a-a]\n_ = false\n") catch {
   |       ^^^^^^ (escaped)
   |     err => Err(err)
   |   } noraise {

<WORKDIR>/e2e/known_failures_test.mbt:16:5-16:11:
   |     value => Ok(value)
   |   }
   |   debug_inspect( (escaped)
16 |     result,
   |     ^^^^^^
   |     content=(
   |       #|Ok(TomlTable({ "a-a-a": TomlTable({ "_": TomlBoolean(false) }) }))

```

```mooncram
$ run_moon_ide moon ide find-references 'parse' --loc 'e2e/known_failures_test.mbt:10:26'
Found 167 references for symbol 'parse':
<WORKDIR>/README.mbt.md:102:22-102:27:
    | ///|
    | test {
    |   // Quick start example - parsing and accessing values
102 |   let config = @toml.parse(
    |                      ^^^^^
    |     (
    |       #|title = "My App"

<WORKDIR>/README.mbt.md:223:22-223:27:
    | test {
    |   // Error handling with try-catch
    |   let invalid_toml = "invalid = [unclosed"
223 |   let config = @toml.parse(invalid_toml) catch {
    |                      ^^^^^
    |     _ => TomlTable(Map([])) // Return default value on error
    |   }

<WORKDIR>/README.mbt.md:230:26-230:31:
    |   assert_eq(table.length(), 0) // Empty table from error handler
    | 
    |   // Error handling with try? - converts to Result type
230 |   let result = try @toml.parse("key = \"value\"") catch {
    |                          ^^^^^
    |     err => Err(err)
    |   } noraise {

<WORKDIR>/README.mbt.md:240:30-240:35:
    |   }
    | 
    |   // Parsing error example
240 |   let bad_result = try @toml.parse("bad syntax here") catch {
    |                              ^^^^^
    |     err => Err(err)
    |   } noraise {

<WORKDIR>/README.mbt.md:274:11-274:16:
    |     #|max_connections = 100
    |     #|
    |   debug_inspect(
274 |     @toml.parse(toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/README.mbt.md:301:11-301:16:
    |     #|booleans = [true, false, true]
    |     #|
    |   debug_inspect(
301 |     @toml.parse(toml_arrays),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/README.mbt.md:345:11-345:16:
    |     #|sku = 284758393
    |     #|
    |   debug_inspect(
345 |     @toml.parse(toml_tables),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/README.mbt.md:377:11-377:16:
    |     #|meeting_time = 14:30:00
    |     #|
    |   debug_inspect(
377 |     @toml.parse(toml_datetime),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/README.mbt.md:405:11-405:16:
    |     #|cache = {enabled = true, ttl = 300}
    |     #|
    |   debug_inspect(
405 |     @toml.parse(toml_inline),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/README.mbt.md:443:22-443:27:
    |     #|  2023-08-20T02:00:00
    |     #|]
    |     #|
443 |   let result = @toml.parse(config)
    |                      ^^^^^
    |   assert_true(result.validate())
    |   // Verify the structure contains expected keys

<WORKDIR>/README.mbt.md:495:11-495:16:
    |     #|weight = 0.5
    |     #|
    |   debug_inspect(
495 |     @toml.parse(toml_advanced),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/README.mbt.md:588:27-588:32:
    | ///|
    | test {
    |   // Working with nested tables
588 |   let parsed_toml = @toml.parse(
    |                           ^^^^^
    |     (
    |       #|[database]

<WORKDIR>/README.mbt.md:628:21-628:26:
    | ///|
    | test {
    |   // Valid: all integers
628 |   let valid = @toml.parse("numbers = [1, 2, 3]")
    |                     ^^^^^
    |   assert_true(valid.validate())
    | 

<WORKDIR>/README.mbt.md:632:21-632:26:
    |   assert_true(valid.validate())
    | 
    |   // Mixed types are allowed during parsing but fail validation
632 |   let mixed = @toml.parse("mixed = [1, \"two\", 3.0]")
    |                     ^^^^^
    |   assert_false(mixed.validate()) // Validation catches the type mismatch
    | }

<WORKDIR>/README.mbt.md:643:27-643:32:
    | ///|
    | test {
    |   // Working with all 4 datetime types
643 |   let parsed_toml = @toml.parse(
    |                           ^^^^^
    |     (
    |       #|offset_dt = 2023-01-15T10:30:00Z

<WORKDIR>/additional_official_tests_test.mbt:17:11-17:16:
   |     #|"ʎǝʞ" = "value"
   |     #|
   |   debug_inspect(
17 |     @toml.parse(key_variations_toml),
   |           ^^^^^
   |     content=(
   |       #|TomlTable(

<WORKDIR>/additional_official_tests_test.mbt:40:11-40:16:
   |     #|0 = "zero"
   |     #|
   |   debug_inspect(
40 |     @toml.parse(numeric_keys_toml),
   |           ^^^^^
   |     content=(
   |       #|TomlTable({ "1234": TomlString("value"), "0": TomlString("zero") })

<WORKDIR>/additional_official_tests_test.mbt:63:11-63:16:
   |     #|quote = "This has a quote: \""
   |     #|
   |   debug_inspect(
63 |     @toml.parse(escape_sequences_toml),
   |           ^^^^^
   |     content=(
   |       #|TomlTable(

<WORKDIR>/additional_official_tests_test.mbt:94:11-94:16:
   |     #|large_number = 9223372036854775807
   |     #|
   |   debug_inspect(
94 |     @toml.parse(numbers_toml),
   |           ^^^^^
   |     content=(
   |       #|TomlTable(

<WORKDIR>/additional_official_tests_test.mbt:123:11-123:16:
    |     #|array_with_spaces = [ [ 1 , 2 ] , [ 3 , 4 ] ]
    |     #|
    |   debug_inspect(
123 |     @toml.parse(nested_arrays_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/additional_official_tests_test.mbt:174:11-174:16:
    |     #|spaces = { key1 = "value1" , key2 = "value2" }
    |     #|
    |   debug_inspect(
174 |     @toml.parse(inline_tables_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/additional_official_tests_test.mbt:229:11-229:16:
    |     #|features = {new_ui = true, beta_api = false, experimental = true}
    |     #|
    |   debug_inspect(
229 |     @toml.parse(config_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/additional_official_tests_test.mbt:291:11-291:16:
    |     #|table3= { a=1 , b=2 }
    |     #|
    |   debug_inspect(
291 |     @toml.parse(whitespace_edge_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/additional_official_tests_test.mbt:329:11-329:16:
    |     #|single_key_table = {key = "value"}
    |     #|
    |   debug_inspect(
329 |     @toml.parse(boundary_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/cmd/toml/main.mbt:76:25-76:30:
   |       return 1
   |     }
   |   }
76 |   let value = @toml_lib.parse(source) catch {
   |                         ^^^^^
   |     err => {
   |       println("error: failed to parse \{path}: \{err}")

<WORKDIR>/cmd/toml/main.mbt:94:21-94:26:
   |       return 1
   |     }
   |   }
94 |   let _ = @toml_lib.parse(source) catch {
   |                     ^^^^^
   |     err => {
   |       println("error: failed to parse \{path}: \{err}")

<WORKDIR>/comprehensive_test.mbt:13:11-13:16:
   |     #|ports = [8000, 8001, 8002]
   |     #|
   |   debug_inspect(
13 |     @toml.parse(simple_toml),
   |           ^^^^^
   |     content=(
   |       #|TomlTable(

<WORKDIR>/comprehensive_test.mbt:39:11-39:16:
   |     #|floats = [1.1, 2.2, 3.3]
   |     #|
   |   debug_inspect(
39 |     @toml.parse(complex_toml),
   |           ^^^^^
   |     content=(
   |       #|TomlTable(

<WORKDIR>/comprehensive_test.mbt:85:11-85:16:
   |     #|endpoints = ["/api/v1", "/api/v2", "/health"]
   |     #|
   |   debug_inspect(
85 |     @toml.parse(inline_toml),
   |           ^^^^^
   |     content=(
   |       #|TomlTable(

<WORKDIR>/comprehensive_test.mbt:123:11-123:16:
    |     #|features = {logging = true, metrics = false, caching = {enabled = true, ttl = 300}}
    |     #|
    |   debug_inspect(
123 |     @toml.parse(app_config),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/comprehensive_test.mbt:166:11-166:16:
    |     #|mixed = ["double", 'single', "escaped\"quote"]
    |     #|
    |   debug_inspect(
166 |     @toml.parse(string_tests),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/comprehensive_test.mbt:202:11-202:16:
    |     #|mixed_numbers = [0, 1, 42, 3.14, 2.5, 0.0]
    |     #|
    |   debug_inspect(
202 |     @toml.parse(number_tests),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/comprehensive_test.mbt:229:11-229:16:
    | ///|
    | test "empty array" {
    |   debug_inspect(
229 |     @toml.parse(
    |           ^^^^^
    |       (
    |         #|empty_array = []

<WORKDIR>/comprehensive_test.mbt:253:11-253:16:
    |     #|small_negative = -0.001
    |     #|
    |   debug_inspect(
253 |     @toml.parse(negative_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/comprehensive_test.mbt:275:11-275:16:
    | test "negative numbers in context" {
    |   // Single negative integer
    |   debug_inspect(
275 |     @toml.parse(
    |           ^^^^^
    |       (
    |         #|count = -5

<WORKDIR>/comprehensive_test.mbt:287:11-287:16:
    | 
    |   // Single negative float  
    |   debug_inspect(
287 |     @toml.parse(
    |           ^^^^^
    |       (
    |         #|temperature = -15.5

<WORKDIR>/comprehensive_test.mbt:299:11-299:16:
    | 
    |   // Array with mixed positive and negative numbers
    |   debug_inspect(
299 |     @toml.parse(
    |           ^^^^^
    |       (
    |         #|values = [1, -2, 3.0, -4.5]

<WORKDIR>/comprehensive_test.mbt:314:11-314:16:
    |     #|coords = {x = -10, y = 20, z = -5.5}
    |     #|
    |   debug_inspect(
314 |     @toml.parse(coords_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable({ "coords": TomlTable({ "x": TomlInteger(-10), "y": TomlInteger(20), "z": TomlFloat(-5.5) }) })

<WORKDIR>/comprehensive_test.mbt:327:11-327:16:
    |     #|adjustment = -0.1
    |     #|
    |   debug_inspect(
327 |     @toml.parse(multi_negative),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/comprehensive_test.mbt:356:11-356:16:
    |     #|rate_limiting = {enabled = true, requests_per_minute = 1000, burst = 50}
    |     #|
    |   debug_inspect(
356 |     @toml.parse(microservice_config),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/comprehensive_test.mbt:655:15-655:20:
    | 
    |   // Test 5: Invalid syntax after comma
    |   debug_inspect(
655 |     try @toml.parse("table = {key1 = \"val1\", }") catch {
    |               ^^^^^
    |       err => Err(err)
    |     } noraise {

<WORKDIR>/comprehensive_test.mbt:880:11-880:16:
    | test "edge cases" {
    |   // Empty input should result in empty table
    |   debug_inspect(
880 |     @toml.parse(
    |           ^^^^^
    |       (
    |         #|

<WORKDIR>/comprehensive_test.mbt:897:11-897:16:
    |     #|# Another comment
    |     #|
    |   debug_inspect(
897 |     @toml.parse(comments_only_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable({})

<WORKDIR>/comprehensive_test.mbt:909:11-909:16:
    |     #|double = "value"
    |     #|
    |   debug_inspect(
909 |     @toml.parse(mixed_quotes_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable({ "single": TomlString("value"), "double": TomlString("value") })

<WORKDIR>/comprehensive_test.mbt:917:11-917:16:
    | 
    |   // Whitespace around equals sign
    |   debug_inspect(
917 |     @toml.parse(
    |           ^^^^^
    |       (
    |         #|spaced   =   "value"  

<WORKDIR>/comprehensive_test.mbt:939:11-939:16:
    |     #|# End comment
    |     #|
    |   debug_inspect(
939 |     @toml.parse(complex_whitespace),
    |           ^^^^^
    |     content=(
    |       #|TomlTable({ "key1": TomlString("value1"), "key2": TomlString("value2") })

<WORKDIR>/comprehensive_test.mbt:979:15-979:20:
    |     #|]  
    |     #|
    |   debug_inspect(
979 |     try @toml.parse(data3) catch {
    |               ^^^^^
    |       err => Err(err)
    |     } noraise {

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:9:22-9:27:
  | /// Test EOF handling in parser - covered by creating empty token arrays
  | test "parser_eof_handling" {
  |   // Test empty parse input to exercise EOF conditions
9 |   let result = @toml.parse(
  |                      ^^^^^
  |     (
  |       #|

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:26:22-26:27:
   | /// Test integer keys in inline tables
   | test "inline_table_with_integer_key" {
   |   let toml_input = "table = {123 = \"value\"}"
26 |   let result = @toml.parse(toml_input)
   |                      ^^^^^
   |   debug_inspect(
   |     result,

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:39:22-39:27:
   | /// Test string keys in table paths
   | test "table_path_with_string_key" {
   |   let toml_input = "[\"section\".\"subsection\"]\nkey = \"value\""
39 |   let result = @toml.parse(toml_input)
   |                      ^^^^^
   |   debug_inspect(
   |     result,

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:52:22-52:27:
   | /// Test integer keys in table paths
   | test "table_path_with_integer_key" {
   |   let toml_input = "[section.123]\nkey = \"value\""
52 |   let result = @toml.parse(toml_input)
   |                      ^^^^^
   |   debug_inspect(
   |     result,

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:65:22-65:27:
   | /// Test string keys in array of tables paths
   | test "array_of_tables_path_with_string_key" {
   |   let toml_input = "[[\"products\"]]\nname = \"Hammer\""
65 |   let result = @toml.parse(toml_input)
   |                      ^^^^^
   |   debug_inspect(
   |     result,

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:78:22-78:27:
   | /// Test integer keys in array of tables paths
   | test "array_of_tables_path_with_integer_key" {
   |   let toml_input = "[[section.123]]\nvalue = 42"
78 |   let result = @toml.parse(toml_input)
   |                      ^^^^^
   |   debug_inspect(
   |     result,

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:215:22-215:27:
    | /// Test empty inline table
    | test "empty_inline_table" {
    |   let toml_input = "table = {}"
215 |   let result = @toml.parse(toml_input)
    |                      ^^^^^
    |   debug_inspect(
    |     result,

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:228:22-228:27:
    | /// Test empty array
    | test "empty_array" {
    |   let toml_input = "arr = []"
228 |   let result = @toml.parse(toml_input)
    |                      ^^^^^
    |   debug_inspect(
    |     result,

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:284:22-284:27:
    | /// Test float token parsing to ensure coverage
    | test "float_token_parsing" {
    |   let toml_input = "pi = 3.14159"
284 |   let result = @toml.parse(toml_input)
    |                      ^^^^^
    |   debug_inspect(
    |     result,

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:297:22-297:27:
    | /// Test array with trailing comma
    | test "array_with_trailing_comma" {
    |   let toml_input = "numbers = [1, 2, 3,]"
297 |   let result = @toml.parse(toml_input)
    |                      ^^^^^
    |   debug_inspect(
    |     result,

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:346:23-346:28:
    | 
    |   // Test parsing like in main function
    |   let toml_input = "name = \"John Doe\"\nage = 30\nenabled = true"
346 |   let result1 = @toml.parse(toml_input)
    |                       ^^^^^
    |   debug_inspect(result1.to_string().contains("John Doe"), content="true")
    | 

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:351:23-351:28:
    | 
    |   // Test array parsing
    |   let toml_array = "numbers = [1, 2, 3, 4, 5]"
351 |   let result2 = @toml.parse(toml_array)
    |                       ^^^^^
    |   debug_inspect(result2.to_string().contains("[1, 2, 3, 4, 5]"), content="true")
    | 

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:356:23-356:28:
    | 
    |   // Test inline table parsing
    |   let toml_table = "person = {name = \"Alice\", age = 25}"
356 |   let result3 = @toml.parse(toml_table)
    |                       ^^^^^
    |   debug_inspect(result3.to_string().contains("Alice"), content="true")
    | }

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:364:22-364:27:
    | /// Test binary number parsing via hex format
    | test "hex_number_parsing_coverage" {
    |   let toml_input = "hex_num = 0xDEADBEEF"
364 |   let result = @toml.parse(toml_input)
    |                      ^^^^^
    |   debug_inspect(
    |     result,

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:377:22-377:27:
    | /// Test octal number parsing
    | test "octal_number_parsing_coverage" {
    |   let toml_input = "octal_num = 0o755"
377 |   let result = @toml.parse(toml_input)
    |                      ^^^^^
    |   debug_inspect(
    |     result,

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:390:22-390:27:
    | /// Test binary number parsing
    | test "binary_number_parsing_coverage" {
    |   let toml_input = "binary_num = 0b1010"
390 |   let result = @toml.parse(toml_input)
    |                      ^^^^^
    |   debug_inspect(
    |     result,

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:403:22-403:27:
    | /// Test multiple array of tables to exercise array appending logic
    | test "multiple_array_of_tables" {
    |   let toml_input = "[[products]]\nname = \"Hammer\"\n\n[[products]]\nname = \"Nail\""
403 |   let result = @toml.parse(toml_input)
    |                      ^^^^^
    |   debug_inspect(
    |     result,

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:425:22-425:27:
    | /// Test negative number parsing
    | test "negative_number_parsing" {
    |   let toml_input = "negative = -42"
425 |   let result = @toml.parse(toml_input)
    |                      ^^^^^
    |   debug_inspect(
    |     result,

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:453:22-453:27:
    | /// Test multiline basic string with line ending backslash
    | test "multiline_string_line_ending_backslash" {
    |   let toml_input = "multiline = \"\"\"\nLine 1 \\\n    Line 2\"\"\""
453 |   let result = @toml.parse(toml_input)
    |                      ^^^^^
    |   guard result is TomlTable({ "multiline": TomlString(str), .. }) else {
    |     fail("Expected table with multiline string")

<WORKDIR>/coverage_improvement_test.mbt:25:15-25:20:
   |     #|
   |   // This now successfully parses with nested tables support
   |   debug_inspect(
25 |     try @toml.parse(complex_toml) catch {
   |               ^^^^^
   |       err => Err(err)
   |     } noraise {

<WORKDIR>/coverage_improvement_test.mbt:152:15-152:20:
    |     #|quote = "say \"hello\""
    |     #|
    |   debug_inspect(
152 |     try @toml.parse(toml_with_escapes) catch {
    |               ^^^^^
    |       err => Err(err)
    |     } noraise {

<WORKDIR>/coverage_improvement_test.mbt:182:15-182:20:
    |     #|key2 = "value2"
    |     #|
    |   debug_inspect(
182 |     try @toml.parse(toml_with_whitespace) catch {
    |               ^^^^^
    |       err => Err(err)
    |     } noraise {

<WORKDIR>/e2e/e2e_test.mbt:23:28-23:33:
   |         continue
   |       }
   |     }
23 |     let parsed = try @toml.parse(toml_content) catch {
   |                            ^^^^^
   |       err => Err(err)
   |     } noraise {

<WORKDIR>/e2e/known_failures_test.mbt:10:26-10:31:
   | 
   | ///|
   | test "fixed: [a-a-a] table header parses correctly" {
10 |   let result = try @toml.parse("[a-a-a]\n_ = false\n") catch {
   |                          ^^^^^
   |     err => Err(err)
   |   } noraise {

<WORKDIR>/e2e/known_failures_test.mbt:25:26-25:31:
   | 
   | ///|
   | test "fixed: leading underscore value rejected (not infinite loop)" {
25 |   let result = try @toml.parse("x = _1.2\n") catch {
   |                          ^^^^^
   |     err => Err(err)
   |   } noraise {

<WORKDIR>/e2e/known_failures_test.mbt:44:26-44:31:
   | 
   | ///|
   | test "fixed: positive prefix '+' tokenized for integers" {
44 |   let result = try @toml.parse("pos = +99\n") catch {
   |                          ^^^^^
   |     err => Err(err)
   |   } noraise {

<WORKDIR>/e2e/known_failures_test.mbt:59:26-59:31:
   | 
   | ///|
   | test "fixed: positive prefix '+' tokenized for floats" {
59 |   let result = try @toml.parse("pos = +1.0\n") catch {
   |                          ^^^^^
   |     err => Err(err)
   |   } noraise {

<WORKDIR>/e2e/known_failures_test.mbt:78:26-78:31:
   | 
   | ///|
   | test "fixed: CRLF line ending handled" {
78 |   let result = try @toml.parse("key = \"val\"\r\n") catch {
   |                          ^^^^^
   |     err => Err(err)
   |   } noraise {

<WORKDIR>/e2e/known_failures_test.mbt:97:26-97:31:
   | 
   | ///|
   | test "fixed: datetime with space separator" {
97 |   let result = try @toml.parse("dt = 1987-07-05 17:45:00Z\n") catch {
   |                          ^^^^^
   |     err => Err(err)
   |   } noraise {

<WORKDIR>/e2e/known_failures_test.mbt:116:26-116:31:
    | 
    | ///|
    | test "fixed: numeric key leading zeros preserved" {
116 |   let result = try @toml.parse("0123 = true\n") catch {
    |                          ^^^^^
    |     err => Err(err)
    |   } noraise {

<WORKDIR>/e2e/known_failures_test.mbt:141:26-141:31:
    |     #|
    |     #|  fox jumps over the lazy dog."""
    |     #|
141 |   let result = try @toml.parse(input) catch {
    |                          ^^^^^
    |     err => Err(err)
    |   } noraise {

<WORKDIR>/e2e/known_failures_test.mbt:160:26-160:31:
    | 
    | ///|
    | test "fixed: hex escape \\xHH" {
160 |   let result = try @toml.parse("esc = \"\\x41\"\n") catch {
    |                          ^^^^^
    |     err => Err(err)
    |   } noraise {

<WORKDIR>/e2e/known_failures_test.mbt:175:26-175:31:
    | 
    | ///|
    | test "fixed: escape \\e (ESC)" {
175 |   let result = try @toml.parse("esc = \"\\e\"\n") catch {
    |                          ^^^^^
    |     err => Err(err)
    |   } noraise {

<WORKDIR>/e2e/known_failures_test.mbt:206:21-206:26:
    |     #|[[fruits]]
    |     #|name = "banana"
    |     #|
206 |   let _ = try @toml.parse(input) catch {
    |                     ^^^^^
    |     err => Err(err)
    |   } noraise {

<WORKDIR>/e2e/known_failures_test.mbt:220:26-220:31:
    | 
    | ///|
    | test "fixed: keyword as table name" {
220 |   let result = try @toml.parse("[true]\nx = 1\n") catch {
    |                          ^^^^^
    |     err => Err(err)
    |   } noraise {

<WORKDIR>/e2e/known_failures_test.mbt:247:21-247:26:
    |     #|  b = 2
    |     #|}
    |     #|
247 |   let _ = try @toml.parse(input) catch {
    |                     ^^^^^
    |     err => Err(err)
    |   } noraise {

<WORKDIR>/e2e/known_failures_test.mbt:262:26-262:31:
    | ///|
    | #skip
    | test "bug: datetime millisecond trailing zeros" {
262 |   let result = try @toml.parse("dt = 1987-07-05T17:45:56.600Z\n") catch {
    |                          ^^^^^
    |     err => Err(err)
    |   } noraise {

<WORKDIR>/e2e/known_failures_test.mbt:280:26-280:31:
    |   let input =
    |     #|str = """Here are two quotes: "". Cool."""
    |     #|
280 |   let result = try @toml.parse(input) catch {
    |                          ^^^^^
    |     err => Err(err)
    |   } noraise {

<WORKDIR>/e2e/known_failures_test.mbt:299:26-299:31:
    | 
    | ///|
    | test "fixed: dashed bare key starting with dash" {
299 |   let result = try @toml.parse("-key = 1\n") catch {
    |                          ^^^^^
    |     err => Err(err)
    |   } noraise {

<WORKDIR>/e2e/runner.mbt:49:26-49:31:
   |   let expected : Json = @json.parse(expected_json_str) catch {
   |     e => return Some("\{toml_path}: failed to parse expected JSON: \{e}")
   |   }
49 |   let parsed = try @toml.parse(toml_content) catch {
   |                          ^^^^^
   |     err => Err(err)
   |   } noraise {

<WORKDIR>/e2e/runner.mbt:79:26-79:31:
   |     // Non-UTF-8 file: parser would reject this, count as pass
   |     _ => return None
   |   }
79 |   let parsed = try @toml.parse(toml_content) catch {
   |                          ^^^^^
   |     err => Err(err)
   |   } noraise {

<WORKDIR>/internal/qc_model/roundtrip_test.mbt:6:13-6:18:
  |   doc : @qc_model.SimpleDocument,
  |   rendered : String,
  | ) -> Result[Unit, String] {
6 |   try @toml.parse(rendered) catch {
  |             ^^^^^
  |     error =>
  |       Err(

<WORKDIR>/official_toml_test_suite_test.mbt:14:11-14:16:
   |     #|basic = "value"
   |     #|
   |   debug_inspect(
14 |     @toml.parse(basic_string_toml),
   |           ^^^^^
   |     content=(
   |       #|TomlTable({ "basic": TomlString("value") })

<WORKDIR>/official_toml_test_suite_test.mbt:28:11-28:16:
   |     #|escaped = "I'm a string. \"You can quote me\". Name\tJosé\nLocation\tSF."
   |     #|
   |   debug_inspect(
28 |     @toml.parse(escaped_string_toml),
   |           ^^^^^
   |     content=(
   |       #|TomlTable({ "escaped": TomlString("I'm a string. \"You can quote me\". Name\tJosé\nLocation\tSF.") })

<WORKDIR>/official_toml_test_suite_test.mbt:44:11-44:16:
   |     #|zero = 0
   |     #|
   |   debug_inspect(
44 |     @toml.parse(integer_toml),
   |           ^^^^^
   |     content=(
   |       #|TomlTable(

<WORKDIR>/official_toml_test_suite_test.mbt:66:11-66:16:
   |     #|positive = 5.0
   |     #|
   |   debug_inspect(
66 |     @toml.parse(float_toml),
   |           ^^^^^
   |     content=(
   |       #|TomlTable(

<WORKDIR>/official_toml_test_suite_test.mbt:87:11-87:16:
   |     #|disabled = false
   |     #|
   |   debug_inspect(
87 |     @toml.parse(boolean_toml),
   |           ^^^^^
   |     content=(
   |       #|TomlTable({ "enabled": TomlBoolean(true), "disabled": TomlBoolean(false) })

<WORKDIR>/official_toml_test_suite_test.mbt:104:11-104:16:
    |     #|floats = [1.1, 2.2, 3.3]
    |     #|
    |   debug_inspect(
104 |     @toml.parse(array_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/official_toml_test_suite_test.mbt:133:11-133:16:
    |     #|nested = [[1, 2], [3, 4, 5]]
    |     #|
    |   debug_inspect(
133 |     @toml.parse(nested_array_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/official_toml_test_suite_test.mbt:156:11-156:16:
    |     #|empty = []
    |     #|
    |   debug_inspect(
156 |     @toml.parse(empty_array_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable({ "empty": TomlArray([]) })

<WORKDIR>/official_toml_test_suite_test.mbt:172:11-172:16:
    |     #|empty = {}
    |     #|
    |   debug_inspect(
172 |     @toml.parse(inline_table_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/official_toml_test_suite_test.mbt:197:11-197:16:
    |     #|tags = ["production", "web"]
    |     #|
    |   debug_inspect(
197 |     @toml.parse(complex_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/official_toml_test_suite_test.mbt:228:11-228:16:
    |     #|organization = "GitHub"
    |     #|
    |   debug_inspect(
228 |     @toml.parse(table_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/official_toml_test_suite_test.mbt:257:11-257:16:
    |     #|dc = "eqdc10"
    |     #|
    |   debug_inspect(
257 |     @toml.parse(nested_table_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/official_toml_test_suite_test.mbt:286:11-286:16:
    |     #|sku = 284758393
    |     #|
    |   debug_inspect(
286 |     @toml.parse(array_of_tables_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/official_toml_test_suite_test.mbt:315:11-315:16:
    |     #|shape = "banana"
    |     #|
    |   debug_inspect(
315 |     @toml.parse(nested_array_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/official_toml_test_suite_test.mbt:357:11-357:16:
    |     #|port = 5432
    |     #|
    |   debug_inspect(
357 |     @toml.parse(mixed_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/official_toml_test_suite_test.mbt:386:11-386:16:
    |     #|local_datetime = 1979-05-27T07:32:00
    |     #|
    |   debug_inspect(
386 |     @toml.parse(datetime_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/official_toml_test_suite_test.mbt:410:11-410:16:
    |     #|Violets are blue"""
    |     #|
    |   debug_inspect(
410 |     @toml.parse(multiline_basic_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable({ "str1": TomlString("Roses are red\nViolets are blue") })

<WORKDIR>/official_toml_test_suite_test.mbt:426:11-426:16:
    |     #|regex = '<\i\c*\s*>'
    |     #|
    |   debug_inspect(
426 |     @toml.parse(literal_string_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/official_toml_test_suite_test.mbt:453:11-453:16:
    |     #|'''
    |     #|
    |   debug_inspect(
453 |     @toml.parse(multiline_literal_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/official_toml_test_suite_test.mbt:474:11-474:16:
    |     #|another = "# This is not a comment"
    |     #|
    |   debug_inspect(
474 |     @toml.parse(comments_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/official_toml_test_suite_test.mbt:498:11-498:16:
    |     #|bin1 = 0b11010110
    |     #|
    |   debug_inspect(
498 |     @toml.parse(integer_formats_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/official_toml_test_suite_test.mbt:526:11-526:16:
    |     #|
    |   // FIXME: json.inspect get null
    |   debug_inspect(
526 |     @toml.parse(float_special_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/official_toml_test_suite_test.mbt:587:11-587:16:
    |     #|key2 = "value2"
    |     #|
    |   debug_inspect(
587 |     @toml.parse(comment_test),
    |           ^^^^^
    |     content=(
    |       #|TomlTable({ "key1": TomlString("value1"), "key2": TomlString("value2") })

<WORKDIR>/official_toml_test_suite_test.mbt:601:11-601:16:
    |     #|neg_nan = -nan
    |     #|
    |   debug_inspect(
601 |     @toml.parse(valid_inf_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/official_toml_test_suite_test.mbt:643:11-643:16:
    |     #|key4="value4"
    |     #|
    |   debug_inspect(
643 |     @toml.parse(whitespace_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/official_toml_test_suite_test.mbt:669:11-669:16:
    |     #|array2 = [1, 2, 3,]
    |     #|
    |   debug_inspect(
669 |     @toml.parse(array_formatting_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/parser.mbt:300:8-300:13:
    | /// On any lexical or syntactic error, `parse` raises with a message
    | /// containing the source location. Wrap the call in `try?` to receive a
    | /// `Result[TomlValue, Error]` instead.
300 | pub fn parse(input : String) -> TomlValue raise {
    |        ^^^^^
    |   let tokens = @tokenize.tokenize(input)
    |   let parser = Parser::Parser(tokens)

<WORKDIR>/parser_test.mbt:4:22-4:27:
  | ///|
  | /// Tests for the TOML parser
  | test "parse simple key-value string" {
4 |   let result = @toml.parse(
  |                      ^^^^^
  |     (
  |       #|name = "John"

<WORKDIR>/parser_test.mbt:19:22-19:27:
   | 
   | ///|
   | test "parse simple key-value integer" {
19 |   let result = @toml.parse(
   |                      ^^^^^
   |     (
   |       #|age = 25

<WORKDIR>/parser_test.mbt:34:22-34:27:
   | 
   | ///|
   | test "parse simple key-value boolean" {
34 |   let result = @toml.parse(
   |                      ^^^^^
   |     (
   |       #|enabled = true

<WORKDIR>/parser_test.mbt:49:22-49:27:
   | 
   | ///|
   | test "parse simple key-value float" {
49 |   let result = @toml.parse(
   |                      ^^^^^
   |     (
   |       #|pi = 3.14

<WORKDIR>/parser_test.mbt:69:22-69:27:
   |     #|age = 30
   |     #|enabled = false
   |     #|
69 |   let result = @toml.parse(multiple_kvp_toml)
   |                      ^^^^^
   |   debug_inspect(
   |     result,

<WORKDIR>/parser_test.mbt:86:22-86:27:
   | 
   | ///|
   | test "parse array" {
86 |   let result = @toml.parse(
   |                      ^^^^^
   |     (
   |       #|numbers = [1, 2, 3]

<WORKDIR>/parser_test.mbt:102:11-102:16:
    | ///|
    | test "parse array ending with exponent float" {
    |   let result = try
102 |     @toml.parse(
    |           ^^^^^
    |       (
    |         #|numbers = [-1e2]

<WORKDIR>/parser_test.mbt:125:22-125:27:
    |   let inline_table_toml =
    |     #|person = {name = "Bob", age = 25}
    |     #|
125 |   let result = @toml.parse(inline_table_toml)
    |                      ^^^^^
    |   debug_inspect(
    |     result,

<WORKDIR>/parser_test.mbt:148:15-148:20:
    | ///|
    | test "test parser EOF handling in peek" {
    |   debug_inspect(
148 |     try @toml.parse("") catch {
    |               ^^^^^
    |       err => Err(err)
    |     } noraise {

<WORKDIR>/parser_test.mbt:182:15-182:20:
    | ///|
    | test "test inline table with string keys" {
    |   debug_inspect(
182 |     try @toml.parse("table = {\"string key\" = \"value\"}") catch {
    |               ^^^^^
    |       err => Err(err)
    |     } noraise {

<WORKDIR>/parser_test.mbt:220:15-220:20:
    |     #|key = "value"
    |     #|
    |   debug_inspect(
220 |     try @toml.parse(string_table_name_toml) catch {
    |               ^^^^^
    |       err => Err(err)
    |     } noraise {

<WORKDIR>/parser_test.mbt:238:15-238:20:
    |     #|key = "value"
    |     #|
    |   debug_inspect(
238 |     try @toml.parse(numeric_table_name_toml) catch {
    |               ^^^^^
    |       err => Err(err)
    |     } noraise {

<WORKDIR>/parser_test.mbt:336:15-336:20:
    |     #|-10e-1 = "d"
    |     #|
    |   debug_inspect(
336 |     try @toml.parse(exponent_like_keys_toml) catch {
    |               ^^^^^
    |       err => Err(err)
    |     } noraise {

<WORKDIR>/parser_test.mbt:369:15-369:20:
    |     #|value = "d"
    |     #|
    |   debug_inspect(
369 |     try @toml.parse(exponent_like_table_names_toml) catch {
    |               ^^^^^
    |       err => Err(err)
    |     } noraise {

<WORKDIR>/parser_test.mbt:411:15-411:20:
    | test "overflow float accepted as bare key" {
    |   // The same overflow token is valid as a bare key (all chars are A-Za-z0-9_-)
    |   debug_inspect(
411 |     try @toml.parse("-31e368 = \"ok\"\n") catch {
    |               ^^^^^
    |       err => Err(err)
    |     } noraise {

<WORKDIR>/parser_test.mbt:426:15-426:20:
    | test "special float keywords as keys" {
    |   // inf, nan, +inf, -inf, etc. are valid bare keys in TOML
    |   debug_inspect(
426 |     try @toml.parse("+inf = 1\n") catch {
    |               ^^^^^
    |       err => Err(err)
    |     } noraise {

<WORKDIR>/parser_test.mbt:436:15-436:20:
    |     ),
    |   )
    |   debug_inspect(
436 |     try @toml.parse("-inf = 2\n") catch {
    |               ^^^^^
    |       err => Err(err)
    |     } noraise {

<WORKDIR>/parser_test.mbt:446:15-446:20:
    |     ),
    |   )
    |   debug_inspect(
446 |     try @toml.parse("nan = 3\n") catch {
    |               ^^^^^
    |       err => Err(err)
    |     } noraise {

<WORKDIR>/parser_test.mbt:461:15-461:20:
    | test "dotted key with float-like segments" {
    |   // Float token with dot in raw string should split into dotted keys
    |   debug_inspect(
461 |     try @toml.parse("1.2 = \"a\"\n") catch {
    |               ^^^^^
    |       err => Err(err)
    |     } noraise {

<WORKDIR>/parser_test.mbt:472:15-472:20:
    |   )
    |   // Float-like key followed by dotted sub-key
    |   debug_inspect(
472 |     try @toml.parse("[-80e-2.sub]\nval = 1\n") catch {
    |               ^^^^^
    |       err => Err(err)
    |     } noraise {

<WORKDIR>/parser_test.mbt:518:15-518:20:
    | /// Tests for inline table edge cases  
    | test "test empty inline table" {
    |   debug_inspect(
518 |     try @toml.parse("empty = {}") catch {
    |               ^^^^^
    |       err => Err(err)
    |     } noraise {

<WORKDIR>/parser_test.mbt:532:15-532:20:
    | ///|
    | test "test nested inline tables" {
    |   debug_inspect(
532 |     try @toml.parse("table = {inner = {key = \"value\"}}") catch {
    |               ^^^^^
    |       err => Err(err)
    |     } noraise {

<WORKDIR>/parser_test.mbt:546:15-546:20:
    | ///|
    | test "test inline table with multiple key types" {
    |   debug_inspect(
546 |     try @toml.parse("mixed = {\"quoted\" = 1, unquoted = 2}") catch {
    |               ^^^^^
    |       err => Err(err)
    |     } noraise {

<WORKDIR>/parser_test.mbt:560:15-560:20:
    | ///|
    | test "test inline table with array values" {
    |   debug_inspect(
560 |     try @toml.parse("table = {arr = [1, 2, 3], str = \"test\"}") catch {
    |               ^^^^^
    |       err => Err(err)
    |     } noraise {

<WORKDIR>/parser_test.mbt:585:22-585:27:
    | ///|
    | /// Test dotted key notation - simple case
    | test "dotted key notation simple" {
585 |   let result = @toml.parse(
    |                      ^^^^^
    |     (
    |       #|a.b.c = "value"

<WORKDIR>/parser_test.mbt:608:11-608:16:
    |     #|f = "value4"
    |     #|
    |   debug_inspect(
608 |     @toml.parse(dotted_multiple_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/parser_test.mbt:636:11-636:16:
    |     #|server.tags = ["web", "api"]
    |     #|
    |   debug_inspect(
636 |     @toml.parse(dotted_types_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable(

<WORKDIR>/parser_test.mbt:658:22-658:27:
    | ///|
    | /// Test dotted key notation - quoted keys
    | test "dotted key notation quoted keys" {
658 |   let result = @toml.parse(
    |                      ^^^^^
    |     (
    |       #|"first.part"."second.part" = "value"

<WORKDIR>/parser_test.mbt:674:22-674:27:
    | ///|
    | /// Test dotted key notation - integer keys
    | test "dotted key notation integer keys" {
674 |   let result = @toml.parse(
    |                      ^^^^^
    |     (
    |       #|1.2.3 = "numeric path"

<WORKDIR>/parser_test.mbt:696:11-696:16:
    |     #|c = "table"
    |     #|
    |   debug_inspect(
696 |     @toml.parse(conflict_toml),
    |           ^^^^^
    |     content=(
    |       #|TomlTable({ "a": TomlTable({ "b": TomlString("dotted"), "c": TomlString("table") }) })

<WORKDIR>/parser_test.mbt:706:22-706:27:
    | ///|
    | /// Test dotted key notation - deep nesting
    | test "dotted key notation deep nesting" {
706 |   let result = @toml.parse(
    |                      ^^^^^
    |     (
    |       #|a.b.c.d.e.f = "deep"

<WORKDIR>/parser_test.mbt:730:15-730:20:
    |     #|
    |   // TODO: fix
    |   debug_inspect(
730 |     try @toml.parse(data) catch {
    |               ^^^^^
    |       err => Err(err)
    |     } noraise {

<WORKDIR>/test_utils_test.mbt:3:13-3:18:
  | ///|
  | fn parse_expect_to_fail(input : String) -> String {
3 |   try @toml.parse(input) catch {
  |             ^^^^^
  |     e => {
  |       let s = e.to_string()

<WORKDIR>/toml_to_string_test.mbt:38:19-38:24:
   |       #|
   |     ),
   |   )
38 |   assert_eq(@toml.parse(serialized), original)
   |                   ^^^^^
   | }
   | 

<WORKDIR>/toml_to_string_test.mbt:386:22-386:27:
    |     #|debug = true
    |     #|max_connections = 100
    |     #|
386 |   let parsed = @toml.parse(toml)
    |                      ^^^^^
    |   let roundtripped = @toml.parse(parsed.to_string())
    |   assert_eq(parsed, roundtripped)

<WORKDIR>/toml_to_string_test.mbt:387:28-387:33:
    |     #|max_connections = 100
    |     #|
    |   let parsed = @toml.parse(toml)
387 |   let roundtripped = @toml.parse(parsed.to_string())
    |                            ^^^^^
    |   assert_eq(parsed, roundtripped)
    | }

<WORKDIR>/toml_to_string_test.mbt:402:22-402:27:
    |     #|user = "admin"
    |     #|password = "secret"
    |     #|
402 |   let parsed = @toml.parse(toml)
    |                      ^^^^^
    |   let roundtripped = @toml.parse(parsed.to_string())
    |   assert_eq(parsed, roundtripped)

<WORKDIR>/toml_to_string_test.mbt:403:28-403:33:
    |     #|password = "secret"
    |     #|
    |   let parsed = @toml.parse(toml)
403 |   let roundtripped = @toml.parse(parsed.to_string())
    |                            ^^^^^
    |   assert_eq(parsed, roundtripped)
    | }

<WORKDIR>/toml_to_string_test.mbt:418:22-418:27:
    |     #|name = "Nail"
    |     #|sku = 284758393
    |     #|
418 |   let parsed = @toml.parse(toml)
    |                      ^^^^^
    |   let roundtripped = @toml.parse(parsed.to_string())
    |   assert_eq(parsed, roundtripped)

<WORKDIR>/toml_to_string_test.mbt:419:28-419:33:
    |     #|sku = 284758393
    |     #|
    |   let parsed = @toml.parse(toml)
419 |   let roundtripped = @toml.parse(parsed.to_string())
    |                            ^^^^^
    |   assert_eq(parsed, roundtripped)
    | }

<WORKDIR>/toml_to_string_test.mbt:431:22-431:27:
    |     #|local_date = 2023-01-15
    |     #|local_time = 10:30:00
    |     #|
431 |   let parsed = @toml.parse(toml)
    |                      ^^^^^
    |   let roundtripped = @toml.parse(parsed.to_string())
    |   assert_eq(parsed, roundtripped)

<WORKDIR>/toml_to_string_test.mbt:432:28-432:33:
    |     #|local_time = 10:30:00
    |     #|
    |   let parsed = @toml.parse(toml)
432 |   let roundtripped = @toml.parse(parsed.to_string())
    |                            ^^^^^
    |   assert_eq(parsed, roundtripped)
    | }

<WORKDIR>/toml_to_string_test.mbt:443:22-443:27:
    |     #|strings = ["hello", "world"]
    |     #|nested = [[1, 2], [3, 4]]
    |     #|
443 |   let parsed = @toml.parse(toml)
    |                      ^^^^^
    |   let roundtripped = @toml.parse(parsed.to_string())
    |   assert_eq(parsed, roundtripped)

<WORKDIR>/toml_to_string_test.mbt:444:28-444:33:
    |     #|nested = [[1, 2], [3, 4]]
    |     #|
    |   let parsed = @toml.parse(toml)
444 |   let roundtripped = @toml.parse(parsed.to_string())
    |                            ^^^^^
    |   assert_eq(parsed, roundtripped)
    | }

<WORKDIR>/toml_to_string_test.mbt:456:22-456:27:
    |     #|nan_val = nan
    |     #|pi = 3.14
    |     #|
456 |   let parsed = @toml.parse(toml)
    |                      ^^^^^
    |   // NaN != NaN, so compare non-NaN values and check NaN separately
    |   let serialized = parsed.to_string()

<WORKDIR>/toml_to_string_test.mbt:459:28-459:33:
    |   let parsed = @toml.parse(toml)
    |   // NaN != NaN, so compare non-NaN values and check NaN separately
    |   let serialized = parsed.to_string()
459 |   let roundtripped = @toml.parse(serialized)
    |                            ^^^^^
    |   // Check that the serialized form re-parses correctly
    |   inspect(

<WORKDIR>/toml_to_string_test.mbt:500:22-500:27:
    |     #|name = "beta"
    |     #|ip = "10.0.0.2"
    |     #|
500 |   let parsed = @toml.parse(toml)
    |                      ^^^^^
    |   let roundtripped = @toml.parse(parsed.to_string())
    |   assert_eq(parsed, roundtripped)

<WORKDIR>/toml_to_string_test.mbt:501:28-501:33:
    |     #|ip = "10.0.0.2"
    |     #|
    |   let parsed = @toml.parse(toml)
501 |   let roundtripped = @toml.parse(parsed.to_string())
    |                            ^^^^^
    |   assert_eq(parsed, roundtripped)
    | }

<WORKDIR>/toml_to_string_test.mbt:510:22-510:27:
    |   let toml =
    |     #|escaped = "hello\nworld\ttab\\backslash\"quote"
    |     #|
510 |   let parsed = @toml.parse(toml)
    |                      ^^^^^
    |   let roundtripped = @toml.parse(parsed.to_string())
    |   assert_eq(parsed, roundtripped)

<WORKDIR>/toml_to_string_test.mbt:511:28-511:33:
    |     #|escaped = "hello\nworld\ttab\\backslash\"quote"
    |     #|
    |   let parsed = @toml.parse(toml)
511 |   let roundtripped = @toml.parse(parsed.to_string())
    |                            ^^^^^
    |   assert_eq(parsed, roundtripped)
    | }

<WORKDIR>/toml_to_string_test.mbt:576:28-576:33:
    |     ),
    |   )
    |   // Verify roundtrip
576 |   let roundtripped = @toml.parse(value.to_string())
    |                            ^^^^^
    |   assert_eq(value, roundtripped)
    | }

```
