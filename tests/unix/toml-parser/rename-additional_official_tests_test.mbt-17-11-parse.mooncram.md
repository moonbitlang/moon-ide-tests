# toml-parser rename parse additional_official_tests_test.mbt:17:11

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
$ run_moon_ide moon ide rename 'parse' 'parse_renamed' --loc 'additional_official_tests_test.mbt:17:11'
*** Begin Patch
*** Update File: <WORKDIR>/README.mbt.md
@@
 ///|
 test {
   // Quick start example - parsing and accessing values
-  let config = @toml.parse(
+  let config = @toml.parse_renamed(
     (
       #|title = "My App"
       #|version = "1.0.0"
@@
 test {
   // Error handling with try-catch
   let invalid_toml = "invalid = [unclosed"
-  let config = @toml.parse(invalid_toml) catch {
+  let config = @toml.parse_renamed(invalid_toml) catch {
     _ => TomlTable(Map([])) // Return default value on error
   }
   guard config is TomlTable(table) else { fail("Expected table") }
@@
   assert_eq(table.length(), 0) // Empty table from error handler
 
   // Error handling with try? - converts to Result type
-  let result = try @toml.parse("key = \"value\"") catch {
+  let result = try @toml.parse_renamed("key = \"value\"") catch {
     err => Err(err)
   } noraise {
     value => Ok(value)
@@
   }
 
   // Parsing error example
-  let bad_result = try @toml.parse("bad syntax here") catch {
+  let bad_result = try @toml.parse_renamed("bad syntax here") catch {
     err => Err(err)
   } noraise {
     value => Ok(value)
@@
     #|max_connections = 100
     #|
   debug_inspect(
-    @toml.parse(toml),
+    @toml.parse_renamed(toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|booleans = [true, false, true]
     #|
   debug_inspect(
-    @toml.parse(toml_arrays),
+    @toml.parse_renamed(toml_arrays),
     content=(
       #|TomlTable(
       #|  {
@@
     #|sku = 284758393
     #|
   debug_inspect(
-    @toml.parse(toml_tables),
+    @toml.parse_renamed(toml_tables),
     content=(
       #|TomlTable(
       #|  {
@@
     #|meeting_time = 14:30:00
     #|
   debug_inspect(
-    @toml.parse(toml_datetime),
+    @toml.parse_renamed(toml_datetime),
     content=(
       #|TomlTable(
       #|  {
@@
     #|cache = {enabled = true, ttl = 300}
     #|
   debug_inspect(
-    @toml.parse(toml_inline),
+    @toml.parse_renamed(toml_inline),
     content=(
       #|TomlTable(
       #|  {
@@
     #|  2023-08-20T02:00:00
     #|]
     #|
-  let result = @toml.parse(config)
+  let result = @toml.parse_renamed(config)
   assert_true(result.validate())
   // Verify the structure contains expected keys
   guard result
@@
     #|weight = 0.5
     #|
   debug_inspect(
-    @toml.parse(toml_advanced),
+    @toml.parse_renamed(toml_advanced),
     content=(
       #|TomlTable(
       #|  {
@@
 ///|
 test {
   // Working with nested tables
-  let parsed_toml = @toml.parse(
+  let parsed_toml = @toml.parse_renamed(
     (
       #|[database]
       #|host = "localhost"
@@
 ///|
 test {
   // Valid: all integers
-  let valid = @toml.parse("numbers = [1, 2, 3]")
+  let valid = @toml.parse_renamed("numbers = [1, 2, 3]")
   assert_true(valid.validate())
 
   // Mixed types are allowed during parsing but fail validation
-  let mixed = @toml.parse("mixed = [1, \"two\", 3.0]")
+  let mixed = @toml.parse_renamed("mixed = [1, \"two\", 3.0]")
   assert_false(mixed.validate()) // Validation catches the type mismatch
 }
 ```
@@
 ///|
 test {
   // Working with all 4 datetime types
-  let parsed_toml = @toml.parse(
+  let parsed_toml = @toml.parse_renamed(
     (
       #|offset_dt = 2023-01-15T10:30:00Z
       #|local_dt = 2023-01-15T10:30:00
*** Update File: <WORKDIR>/additional_official_tests_test.mbt
@@
     #|"ʎǝʞ" = "value"
     #|
   debug_inspect(
-    @toml.parse(key_variations_toml),
+    @toml.parse_renamed(key_variations_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|0 = "zero"
     #|
   debug_inspect(
-    @toml.parse(numeric_keys_toml),
+    @toml.parse_renamed(numeric_keys_toml),
     content=(
       #|TomlTable({ "1234": TomlString("value"), "0": TomlString("zero") })
     ),
@@
     #|quote = "This has a quote: \""
     #|
   debug_inspect(
-    @toml.parse(escape_sequences_toml),
+    @toml.parse_renamed(escape_sequences_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|large_number = 9223372036854775807
     #|
   debug_inspect(
-    @toml.parse(numbers_toml),
+    @toml.parse_renamed(numbers_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|array_with_spaces = [ [ 1 , 2 ] , [ 3 , 4 ] ]
     #|
   debug_inspect(
-    @toml.parse(nested_arrays_toml),
+    @toml.parse_renamed(nested_arrays_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|spaces = { key1 = "value1" , key2 = "value2" }
     #|
   debug_inspect(
-    @toml.parse(inline_tables_toml),
+    @toml.parse_renamed(inline_tables_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|features = {new_ui = true, beta_api = false, experimental = true}
     #|
   debug_inspect(
-    @toml.parse(config_toml),
+    @toml.parse_renamed(config_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|table3= { a=1 , b=2 }
     #|
   debug_inspect(
-    @toml.parse(whitespace_edge_toml),
+    @toml.parse_renamed(whitespace_edge_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|single_key_table = {key = "value"}
     #|
   debug_inspect(
-    @toml.parse(boundary_toml),
+    @toml.parse_renamed(boundary_toml),
     content=(
       #|TomlTable(
       #|  {
*** Update File: <WORKDIR>/cmd/toml/main.mbt
@@
       return 1
     }
   }
-  let value = @toml_lib.parse(source) catch {
+  let value = @toml_lib.parse_renamed(source) catch {
     err => {
       println("error: failed to parse \{path}: \{err}")
       return 1
@@
       return 1
     }
   }
-  let _ = @toml_lib.parse(source) catch {
+  let _ = @toml_lib.parse_renamed(source) catch {
     err => {
       println("error: failed to parse \{path}: \{err}")
       return 1
*** Update File: <WORKDIR>/comprehensive_test.mbt
@@
     #|ports = [8000, 8001, 8002]
     #|
   debug_inspect(
-    @toml.parse(simple_toml),
+    @toml.parse_renamed(simple_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|floats = [1.1, 2.2, 3.3]
     #|
   debug_inspect(
-    @toml.parse(complex_toml),
+    @toml.parse_renamed(complex_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|endpoints = ["/api/v1", "/api/v2", "/health"]
     #|
   debug_inspect(
-    @toml.parse(inline_toml),
+    @toml.parse_renamed(inline_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|features = {logging = true, metrics = false, caching = {enabled = true, ttl = 300}}
     #|
   debug_inspect(
-    @toml.parse(app_config),
+    @toml.parse_renamed(app_config),
     content=(
       #|TomlTable(
       #|  {
@@
     #|mixed = ["double", 'single', "escaped\"quote"]
     #|
   debug_inspect(
-    @toml.parse(string_tests),
+    @toml.parse_renamed(string_tests),
     content=(
       #|TomlTable(
       #|  {
@@
     #|mixed_numbers = [0, 1, 42, 3.14, 2.5, 0.0]
     #|
   debug_inspect(
-    @toml.parse(number_tests),
+    @toml.parse_renamed(number_tests),
     content=(
       #|TomlTable(
       #|  {
@@
 ///|
 test "empty array" {
   debug_inspect(
-    @toml.parse(
+    @toml.parse_renamed(
       (
         #|empty_array = []
       ),
@@
     #|small_negative = -0.001
     #|
   debug_inspect(
-    @toml.parse(negative_toml),
+    @toml.parse_renamed(negative_toml),
     content=(
       #|TomlTable(
       #|  {
@@
 test "negative numbers in context" {
   // Single negative integer
   debug_inspect(
-    @toml.parse(
+    @toml.parse_renamed(
       (
         #|count = -5
       ),
@@
 
   // Single negative float  
   debug_inspect(
-    @toml.parse(
+    @toml.parse_renamed(
       (
         #|temperature = -15.5
       ),
@@
 
   // Array with mixed positive and negative numbers
   debug_inspect(
-    @toml.parse(
+    @toml.parse_renamed(
       (
         #|values = [1, -2, 3.0, -4.5]
       ),
@@
     #|coords = {x = -10, y = 20, z = -5.5}
     #|
   debug_inspect(
-    @toml.parse(coords_toml),
+    @toml.parse_renamed(coords_toml),
     content=(
       #|TomlTable({ "coords": TomlTable({ "x": TomlInteger(-10), "y": TomlInteger(20), "z": TomlFloat(-5.5) }) })
     ),
@@
     #|adjustment = -0.1
     #|
   debug_inspect(
-    @toml.parse(multi_negative),
+    @toml.parse_renamed(multi_negative),
     content=(
       #|TomlTable(
       #|  {
@@
     #|rate_limiting = {enabled = true, requests_per_minute = 1000, burst = 50}
     #|
   debug_inspect(
-    @toml.parse(microservice_config),
+    @toml.parse_renamed(microservice_config),
     content=(
       #|TomlTable(
       #|  {
@@
 
   // Test 5: Invalid syntax after comma
   debug_inspect(
-    try @toml.parse("table = {key1 = \"val1\", }") catch {
+    try @toml.parse_renamed("table = {key1 = \"val1\", }") catch {
       err => Err(err)
     } noraise {
       value => Ok(value)
@@
 test "edge cases" {
   // Empty input should result in empty table
   debug_inspect(
-    @toml.parse(
+    @toml.parse_renamed(
       (
         #|
       ),
@@
     #|# Another comment
     #|
   debug_inspect(
-    @toml.parse(comments_only_toml),
+    @toml.parse_renamed(comments_only_toml),
     content=(
       #|TomlTable({})
     ),
@@
     #|double = "value"
     #|
   debug_inspect(
-    @toml.parse(mixed_quotes_toml),
+    @toml.parse_renamed(mixed_quotes_toml),
     content=(
       #|TomlTable({ "single": TomlString("value"), "double": TomlString("value") })
     ),
@@
 
   // Whitespace around equals sign
   debug_inspect(
-    @toml.parse(
+    @toml.parse_renamed(
       (
         #|spaced   =   "value"  
       ),
@@
     #|# End comment
     #|
   debug_inspect(
-    @toml.parse(complex_whitespace),
+    @toml.parse_renamed(complex_whitespace),
     content=(
       #|TomlTable({ "key1": TomlString("value1"), "key2": TomlString("value2") })
     ),
@@
     #|]  
     #|
   debug_inspect(
-    try @toml.parse(data3) catch {
+    try @toml.parse_renamed(data3) catch {
       err => Err(err)
     } noraise {
       value => Ok(value)
*** Update File: <WORKDIR>/coverage_improvement_comprehensive_test.mbt
@@
 /// Test EOF handling in parser - covered by creating empty token arrays
 test "parser_eof_handling" {
   // Test empty parse input to exercise EOF conditions
-  let result = @toml.parse(
+  let result = @toml.parse_renamed(
     (
       #|
     ),
@@
 /// Test integer keys in inline tables
 test "inline_table_with_integer_key" {
   let toml_input = "table = {123 = \"value\"}"
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   debug_inspect(
     result,
     content=(
@@
 /// Test string keys in table paths
 test "table_path_with_string_key" {
   let toml_input = "[\"section\".\"subsection\"]\nkey = \"value\""
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   debug_inspect(
     result,
     content=(
@@
 /// Test integer keys in table paths
 test "table_path_with_integer_key" {
   let toml_input = "[section.123]\nkey = \"value\""
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   debug_inspect(
     result,
     content=(
@@
 /// Test string keys in array of tables paths
 test "array_of_tables_path_with_string_key" {
   let toml_input = "[[\"products\"]]\nname = \"Hammer\""
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   debug_inspect(
     result,
     content=(
@@
 /// Test integer keys in array of tables paths
 test "array_of_tables_path_with_integer_key" {
   let toml_input = "[[section.123]]\nvalue = 42"
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   debug_inspect(
     result,
     content=(
@@
 /// Test empty inline table
 test "empty_inline_table" {
   let toml_input = "table = {}"
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   debug_inspect(
     result,
     content=(
@@
 /// Test empty array
 test "empty_array" {
   let toml_input = "arr = []"
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   debug_inspect(
     result,
     content=(
@@
 /// Test float token parsing to ensure coverage
 test "float_token_parsing" {
   let toml_input = "pi = 3.14159"
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   debug_inspect(
     result,
     content=(
@@
 /// Test array with trailing comma
 test "array_with_trailing_comma" {
   let toml_input = "numbers = [1, 2, 3,]"
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   debug_inspect(
     result,
     content=(
@@
 
   // Test parsing like in main function
   let toml_input = "name = \"John Doe\"\nage = 30\nenabled = true"
-  let result1 = @toml.parse(toml_input)
+  let result1 = @toml.parse_renamed(toml_input)
   debug_inspect(result1.to_string().contains("John Doe"), content="true")
 
   // Test array parsing
   let toml_array = "numbers = [1, 2, 3, 4, 5]"
-  let result2 = @toml.parse(toml_array)
+  let result2 = @toml.parse_renamed(toml_array)
   debug_inspect(result2.to_string().contains("[1, 2, 3, 4, 5]"), content="true")
 
   // Test inline table parsing
   let toml_table = "person = {name = \"Alice\", age = 25}"
-  let result3 = @toml.parse(toml_table)
+  let result3 = @toml.parse_renamed(toml_table)
   debug_inspect(result3.to_string().contains("Alice"), content="true")
 }
 
@@
 /// Test binary number parsing via hex format
 test "hex_number_parsing_coverage" {
   let toml_input = "hex_num = 0xDEADBEEF"
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   debug_inspect(
     result,
     content=(
@@
 /// Test octal number parsing
 test "octal_number_parsing_coverage" {
   let toml_input = "octal_num = 0o755"
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   debug_inspect(
     result,
     content=(
@@
 /// Test binary number parsing
 test "binary_number_parsing_coverage" {
   let toml_input = "binary_num = 0b1010"
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   debug_inspect(
     result,
     content=(
@@
 /// Test multiple array of tables to exercise array appending logic
 test "multiple_array_of_tables" {
   let toml_input = "[[products]]\nname = \"Hammer\"\n\n[[products]]\nname = \"Nail\""
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   debug_inspect(
     result,
     content=(
@@
 /// Test negative number parsing
 test "negative_number_parsing" {
   let toml_input = "negative = -42"
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   debug_inspect(
     result,
     content=(
@@
 /// Test multiline basic string with line ending backslash
 test "multiline_string_line_ending_backslash" {
   let toml_input = "multiline = \"\"\"\nLine 1 \\\n    Line 2\"\"\""
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   guard result is TomlTable({ "multiline": TomlString(str), .. }) else {
     fail("Expected table with multiline string")
   }
*** Update File: <WORKDIR>/coverage_improvement_test.mbt
@@
     #|
   // This now successfully parses with nested tables support
   debug_inspect(
-    try @toml.parse(complex_toml) catch {
+    try @toml.parse_renamed(complex_toml) catch {
       err => Err(err)
     } noraise {
       value => Ok(value)
@@
     #|quote = "say \"hello\""
     #|
   debug_inspect(
-    try @toml.parse(toml_with_escapes) catch {
+    try @toml.parse_renamed(toml_with_escapes) catch {
       err => Err(err)
     } noraise {
       value => Ok(value)
@@
     #|key2 = "value2"
     #|
   debug_inspect(
-    try @toml.parse(toml_with_whitespace) catch {
+    try @toml.parse_renamed(toml_with_whitespace) catch {
       err => Err(err)
     } noraise {
       value => Ok(value)
*** Update File: <WORKDIR>/e2e/e2e_test.mbt
@@
         continue
       }
     }
-    let parsed = try @toml.parse(toml_content) catch {
+    let parsed = try @toml.parse_renamed(toml_content) catch {
       err => Err(err)
     } noraise {
       value => Ok(value)
*** Update File: <WORKDIR>/e2e/known_failures_test.mbt
@@
 
 ///|
 test "fixed: [a-a-a] table header parses correctly" {
-  let result = try @toml.parse("[a-a-a]\n_ = false\n") catch {
+  let result = try @toml.parse_renamed("[a-a-a]\n_ = false\n") catch {
     err => Err(err)
   } noraise {
     value => Ok(value)
@@
 
 ///|
 test "fixed: leading underscore value rejected (not infinite loop)" {
-  let result = try @toml.parse("x = _1.2\n") catch {
+  let result = try @toml.parse_renamed("x = _1.2\n") catch {
     err => Err(err)
   } noraise {
     value => Ok(value)
@@
 
 ///|
 test "fixed: positive prefix '+' tokenized for integers" {
-  let result = try @toml.parse("pos = +99\n") catch {
+  let result = try @toml.parse_renamed("pos = +99\n") catch {
     err => Err(err)
   } noraise {
     value => Ok(value)
@@
 
 ///|
 test "fixed: positive prefix '+' tokenized for floats" {
-  let result = try @toml.parse("pos = +1.0\n") catch {
+  let result = try @toml.parse_renamed("pos = +1.0\n") catch {
     err => Err(err)
   } noraise {
     value => Ok(value)
@@
 
 ///|
 test "fixed: CRLF line ending handled" {
-  let result = try @toml.parse("key = \"val\"\r\n") catch {
+  let result = try @toml.parse_renamed("key = \"val\"\r\n") catch {
     err => Err(err)
   } noraise {
     value => Ok(value)
@@
 
 ///|
 test "fixed: datetime with space separator" {
-  let result = try @toml.parse("dt = 1987-07-05 17:45:00Z\n") catch {
+  let result = try @toml.parse_renamed("dt = 1987-07-05 17:45:00Z\n") catch {
     err => Err(err)
   } noraise {
     value => Ok(value)
@@
 
 ///|
 test "fixed: numeric key leading zeros preserved" {
-  let result = try @toml.parse("0123 = true\n") catch {
+  let result = try @toml.parse_renamed("0123 = true\n") catch {
     err => Err(err)
   } noraise {
     value => Ok(value)
@@
     #|
     #|  fox jumps over the lazy dog."""
     #|
-  let result = try @toml.parse(input) catch {
+  let result = try @toml.parse_renamed(input) catch {
     err => Err(err)
   } noraise {
     value => Ok(value)
@@
 
 ///|
 test "fixed: hex escape \\xHH" {
-  let result = try @toml.parse("esc = \"\\x41\"\n") catch {
+  let result = try @toml.parse_renamed("esc = \"\\x41\"\n") catch {
     err => Err(err)
   } noraise {
     value => Ok(value)
@@
 
 ///|
 test "fixed: escape \\e (ESC)" {
-  let result = try @toml.parse("esc = \"\\e\"\n") catch {
+  let result = try @toml.parse_renamed("esc = \"\\e\"\n") catch {
     err => Err(err)
   } noraise {
     value => Ok(value)
@@
     #|[[fruits]]
     #|name = "banana"
     #|
-  let _ = try @toml.parse(input) catch {
+  let _ = try @toml.parse_renamed(input) catch {
     err => Err(err)
   } noraise {
     value => Ok(value)
@@
 
 ///|
 test "fixed: keyword as table name" {
-  let result = try @toml.parse("[true]\nx = 1\n") catch {
+  let result = try @toml.parse_renamed("[true]\nx = 1\n") catch {
     err => Err(err)
   } noraise {
     value => Ok(value)
@@
     #|  b = 2
     #|}
     #|
-  let _ = try @toml.parse(input) catch {
+  let _ = try @toml.parse_renamed(input) catch {
     err => Err(err)
   } noraise {
     value => Ok(value)
@@
 ///|
 #skip
 test "bug: datetime millisecond trailing zeros" {
-  let result = try @toml.parse("dt = 1987-07-05T17:45:56.600Z\n") catch {
+  let result = try @toml.parse_renamed("dt = 1987-07-05T17:45:56.600Z\n") catch {
     err => Err(err)
   } noraise {
     value => Ok(value)
@@
   let input =
     #|str = """Here are two quotes: "". Cool."""
     #|
-  let result = try @toml.parse(input) catch {
+  let result = try @toml.parse_renamed(input) catch {
     err => Err(err)
   } noraise {
     value => Ok(value)
@@
 
 ///|
 test "fixed: dashed bare key starting with dash" {
-  let result = try @toml.parse("-key = 1\n") catch {
+  let result = try @toml.parse_renamed("-key = 1\n") catch {
     err => Err(err)
   } noraise {
     value => Ok(value)
*** Update File: <WORKDIR>/e2e/runner.mbt
@@
   let expected : Json = @json.parse(expected_json_str) catch {
     e => return Some("\{toml_path}: failed to parse expected JSON: \{e}")
   }
-  let parsed = try @toml.parse(toml_content) catch {
+  let parsed = try @toml.parse_renamed(toml_content) catch {
     err => Err(err)
   } noraise {
     value => Ok(value)
@@
     // Non-UTF-8 file: parser would reject this, count as pass
     _ => return None
   }
-  let parsed = try @toml.parse(toml_content) catch {
+  let parsed = try @toml.parse_renamed(toml_content) catch {
     err => Err(err)
   } noraise {
     value => Ok(value)
*** Update File: <WORKDIR>/internal/qc_model/roundtrip_test.mbt
@@
   doc : @qc_model.SimpleDocument,
   rendered : String,
 ) -> Result[Unit, String] {
-  try @toml.parse(rendered) catch {
+  try @toml.parse_renamed(rendered) catch {
     error =>
       Err(
         "parser rejected generated TOML\nrendered:\n\{rendered}\nerror:\n\{error}",
*** Update File: <WORKDIR>/official_toml_test_suite_test.mbt
@@
     #|basic = "value"
     #|
   debug_inspect(
-    @toml.parse(basic_string_toml),
+    @toml.parse_renamed(basic_string_toml),
     content=(
       #|TomlTable({ "basic": TomlString("value") })
     ),
@@
     #|escaped = "I'm a string. \"You can quote me\". Name\tJosé\nLocation\tSF."
     #|
   debug_inspect(
-    @toml.parse(escaped_string_toml),
+    @toml.parse_renamed(escaped_string_toml),
     content=(
       #|TomlTable({ "escaped": TomlString("I'm a string. \"You can quote me\". Name\tJosé\nLocation\tSF.") })
     ),
@@
     #|zero = 0
     #|
   debug_inspect(
-    @toml.parse(integer_toml),
+    @toml.parse_renamed(integer_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|positive = 5.0
     #|
   debug_inspect(
-    @toml.parse(float_toml),
+    @toml.parse_renamed(float_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|disabled = false
     #|
   debug_inspect(
-    @toml.parse(boolean_toml),
+    @toml.parse_renamed(boolean_toml),
     content=(
       #|TomlTable({ "enabled": TomlBoolean(true), "disabled": TomlBoolean(false) })
     ),
@@
     #|floats = [1.1, 2.2, 3.3]
     #|
   debug_inspect(
-    @toml.parse(array_toml),
+    @toml.parse_renamed(array_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|nested = [[1, 2], [3, 4, 5]]
     #|
   debug_inspect(
-    @toml.parse(nested_array_toml),
+    @toml.parse_renamed(nested_array_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|empty = []
     #|
   debug_inspect(
-    @toml.parse(empty_array_toml),
+    @toml.parse_renamed(empty_array_toml),
     content=(
       #|TomlTable({ "empty": TomlArray([]) })
     ),
@@
     #|empty = {}
     #|
   debug_inspect(
-    @toml.parse(inline_table_toml),
+    @toml.parse_renamed(inline_table_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|tags = ["production", "web"]
     #|
   debug_inspect(
-    @toml.parse(complex_toml),
+    @toml.parse_renamed(complex_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|organization = "GitHub"
     #|
   debug_inspect(
-    @toml.parse(table_toml),
+    @toml.parse_renamed(table_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|dc = "eqdc10"
     #|
   debug_inspect(
-    @toml.parse(nested_table_toml),
+    @toml.parse_renamed(nested_table_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|sku = 284758393
     #|
   debug_inspect(
-    @toml.parse(array_of_tables_toml),
+    @toml.parse_renamed(array_of_tables_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|shape = "banana"
     #|
   debug_inspect(
-    @toml.parse(nested_array_toml),
+    @toml.parse_renamed(nested_array_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|port = 5432
     #|
   debug_inspect(
-    @toml.parse(mixed_toml),
+    @toml.parse_renamed(mixed_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|local_datetime = 1979-05-27T07:32:00
     #|
   debug_inspect(
-    @toml.parse(datetime_toml),
+    @toml.parse_renamed(datetime_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|Violets are blue"""
     #|
   debug_inspect(
-    @toml.parse(multiline_basic_toml),
+    @toml.parse_renamed(multiline_basic_toml),
     content=(
       #|TomlTable({ "str1": TomlString("Roses are red\nViolets are blue") })
     ),
@@
     #|regex = '<\i\c*\s*>'
     #|
   debug_inspect(
-    @toml.parse(literal_string_toml),
+    @toml.parse_renamed(literal_string_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|'''
     #|
   debug_inspect(
-    @toml.parse(multiline_literal_toml),
+    @toml.parse_renamed(multiline_literal_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|another = "# This is not a comment"
     #|
   debug_inspect(
-    @toml.parse(comments_toml),
+    @toml.parse_renamed(comments_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|bin1 = 0b11010110
     #|
   debug_inspect(
-    @toml.parse(integer_formats_toml),
+    @toml.parse_renamed(integer_formats_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|
   // FIXME: json.inspect get null
   debug_inspect(
-    @toml.parse(float_special_toml),
+    @toml.parse_renamed(float_special_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|key2 = "value2"
     #|
   debug_inspect(
-    @toml.parse(comment_test),
+    @toml.parse_renamed(comment_test),
     content=(
       #|TomlTable({ "key1": TomlString("value1"), "key2": TomlString("value2") })
     ),
@@
     #|neg_nan = -nan
     #|
   debug_inspect(
-    @toml.parse(valid_inf_toml),
+    @toml.parse_renamed(valid_inf_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|key4="value4"
     #|
   debug_inspect(
-    @toml.parse(whitespace_toml),
+    @toml.parse_renamed(whitespace_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|array2 = [1, 2, 3,]
     #|
   debug_inspect(
-    @toml.parse(array_formatting_toml),
+    @toml.parse_renamed(array_formatting_toml),
     content=(
       #|TomlTable(
       #|  {
*** Update File: <WORKDIR>/parser.mbt
@@
 /// On any lexical or syntactic error, `parse` raises with a message
 /// containing the source location. Wrap the call in `try?` to receive a
 /// `Result[TomlValue, Error]` instead.
-pub fn parse(input : String) -> TomlValue raise {
+pub fn parse_renamed(input : String) -> TomlValue raise {
   let tokens = @tokenize.tokenize(input)
   let parser = Parser::Parser(tokens)
   let main_table = {}
*** Update File: <WORKDIR>/parser_test.mbt
@@
 ///|
 /// Tests for the TOML parser
 test "parse simple key-value string" {
-  let result = @toml.parse(
+  let result = @toml.parse_renamed(
     (
       #|name = "John"
     ),
@@
 
 ///|
 test "parse simple key-value integer" {
-  let result = @toml.parse(
+  let result = @toml.parse_renamed(
     (
       #|age = 25
     ),
@@
 
 ///|
 test "parse simple key-value boolean" {
-  let result = @toml.parse(
+  let result = @toml.parse_renamed(
     (
       #|enabled = true
     ),
@@
 
 ///|
 test "parse simple key-value float" {
-  let result = @toml.parse(
+  let result = @toml.parse_renamed(
     (
       #|pi = 3.14
     ),
@@
     #|age = 30
     #|enabled = false
     #|
-  let result = @toml.parse(multiple_kvp_toml)
+  let result = @toml.parse_renamed(multiple_kvp_toml)
   debug_inspect(
     result,
     content=(
@@
 
 ///|
 test "parse array" {
-  let result = @toml.parse(
+  let result = @toml.parse_renamed(
     (
       #|numbers = [1, 2, 3]
     ),
@@
 ///|
 test "parse array ending with exponent float" {
   let result = try
-    @toml.parse(
+    @toml.parse_renamed(
       (
         #|numbers = [-1e2]
       ),
@@
   let inline_table_toml =
     #|person = {name = "Bob", age = 25}
     #|
-  let result = @toml.parse(inline_table_toml)
+  let result = @toml.parse_renamed(inline_table_toml)
   debug_inspect(
     result,
     content=(
@@
 ///|
 test "test parser EOF handling in peek" {
   debug_inspect(
-    try @toml.parse("") catch {
+    try @toml.parse_renamed("") catch {
       err => Err(err)
     } noraise {
       value => Ok(value)
@@
 ///|
 test "test inline table with string keys" {
   debug_inspect(
-    try @toml.parse("table = {\"string key\" = \"value\"}") catch {
+    try @toml.parse_renamed("table = {\"string key\" = \"value\"}") catch {
       err => Err(err)
     } noraise {
       value => Ok(value)
@@
     #|key = "value"
     #|
   debug_inspect(
-    try @toml.parse(string_table_name_toml) catch {
+    try @toml.parse_renamed(string_table_name_toml) catch {
       err => Err(err)
     } noraise {
       value => Ok(value)
@@
     #|key = "value"
     #|
   debug_inspect(
-    try @toml.parse(numeric_table_name_toml) catch {
+    try @toml.parse_renamed(numeric_table_name_toml) catch {
       err => Err(err)
     } noraise {
       value => Ok(value)
@@
     #|-10e-1 = "d"
     #|
   debug_inspect(
-    try @toml.parse(exponent_like_keys_toml) catch {
+    try @toml.parse_renamed(exponent_like_keys_toml) catch {
       err => Err(err)
     } noraise {
       value => Ok(value)
@@
     #|value = "d"
     #|
   debug_inspect(
-    try @toml.parse(exponent_like_table_names_toml) catch {
+    try @toml.parse_renamed(exponent_like_table_names_toml) catch {
       err => Err(err)
     } noraise {
       value => Ok(value)
@@
 test "overflow float accepted as bare key" {
   // The same overflow token is valid as a bare key (all chars are A-Za-z0-9_-)
   debug_inspect(
-    try @toml.parse("-31e368 = \"ok\"\n") catch {
+    try @toml.parse_renamed("-31e368 = \"ok\"\n") catch {
       err => Err(err)
     } noraise {
       value => Ok(value)
@@
 test "special float keywords as keys" {
   // inf, nan, +inf, -inf, etc. are valid bare keys in TOML
   debug_inspect(
-    try @toml.parse("+inf = 1\n") catch {
+    try @toml.parse_renamed("+inf = 1\n") catch {
       err => Err(err)
     } noraise {
       value => Ok(value)
@@
     ),
   )
   debug_inspect(
-    try @toml.parse("-inf = 2\n") catch {
+    try @toml.parse_renamed("-inf = 2\n") catch {
       err => Err(err)
     } noraise {
       value => Ok(value)
@@
     ),
   )
   debug_inspect(
-    try @toml.parse("nan = 3\n") catch {
+    try @toml.parse_renamed("nan = 3\n") catch {
       err => Err(err)
     } noraise {
       value => Ok(value)
@@
 test "dotted key with float-like segments" {
   // Float token with dot in raw string should split into dotted keys
   debug_inspect(
-    try @toml.parse("1.2 = \"a\"\n") catch {
+    try @toml.parse_renamed("1.2 = \"a\"\n") catch {
       err => Err(err)
     } noraise {
       value => Ok(value)
@@
   )
   // Float-like key followed by dotted sub-key
   debug_inspect(
-    try @toml.parse("[-80e-2.sub]\nval = 1\n") catch {
+    try @toml.parse_renamed("[-80e-2.sub]\nval = 1\n") catch {
       err => Err(err)
     } noraise {
       value => Ok(value)
@@
 /// Tests for inline table edge cases  
 test "test empty inline table" {
   debug_inspect(
-    try @toml.parse("empty = {}") catch {
+    try @toml.parse_renamed("empty = {}") catch {
       err => Err(err)
     } noraise {
       value => Ok(value)
@@
 ///|
 test "test nested inline tables" {
   debug_inspect(
-    try @toml.parse("table = {inner = {key = \"value\"}}") catch {
+    try @toml.parse_renamed("table = {inner = {key = \"value\"}}") catch {
       err => Err(err)
     } noraise {
       value => Ok(value)
@@
 ///|
 test "test inline table with multiple key types" {
   debug_inspect(
-    try @toml.parse("mixed = {\"quoted\" = 1, unquoted = 2}") catch {
+    try @toml.parse_renamed("mixed = {\"quoted\" = 1, unquoted = 2}") catch {
       err => Err(err)
     } noraise {
       value => Ok(value)
@@
 ///|
 test "test inline table with array values" {
   debug_inspect(
-    try @toml.parse("table = {arr = [1, 2, 3], str = \"test\"}") catch {
+    try @toml.parse_renamed("table = {arr = [1, 2, 3], str = \"test\"}") catch {
       err => Err(err)
     } noraise {
       value => Ok(value)
@@
 ///|
 /// Test dotted key notation - simple case
 test "dotted key notation simple" {
-  let result = @toml.parse(
+  let result = @toml.parse_renamed(
     (
       #|a.b.c = "value"
     ),
@@
     #|f = "value4"
     #|
   debug_inspect(
-    @toml.parse(dotted_multiple_toml),
+    @toml.parse_renamed(dotted_multiple_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|server.tags = ["web", "api"]
     #|
   debug_inspect(
-    @toml.parse(dotted_types_toml),
+    @toml.parse_renamed(dotted_types_toml),
     content=(
       #|TomlTable(
       #|  {
@@
 ///|
 /// Test dotted key notation - quoted keys
 test "dotted key notation quoted keys" {
-  let result = @toml.parse(
+  let result = @toml.parse_renamed(
     (
       #|"first.part"."second.part" = "value"
     ),
@@
 ///|
 /// Test dotted key notation - integer keys
 test "dotted key notation integer keys" {
-  let result = @toml.parse(
+  let result = @toml.parse_renamed(
     (
       #|1.2.3 = "numeric path"
     ),
@@
     #|c = "table"
     #|
   debug_inspect(
-    @toml.parse(conflict_toml),
+    @toml.parse_renamed(conflict_toml),
     content=(
       #|TomlTable({ "a": TomlTable({ "b": TomlString("dotted"), "c": TomlString("table") }) })
     ),
@@
 ///|
 /// Test dotted key notation - deep nesting
 test "dotted key notation deep nesting" {
-  let result = @toml.parse(
+  let result = @toml.parse_renamed(
     (
       #|a.b.c.d.e.f = "deep"
     ),
@@
     #|
   // TODO: fix
   debug_inspect(
-    try @toml.parse(data) catch {
+    try @toml.parse_renamed(data) catch {
       err => Err(err)
     } noraise {
       value => Ok(value)
*** Update File: <WORKDIR>/test_utils_test.mbt
@@
 ///|
 fn parse_expect_to_fail(input : String) -> String {
-  try @toml.parse(input) catch {
+  try @toml.parse_renamed(input) catch {
     e => {
       let s = e.to_string()
       // e.to_string() gives: Failure("...FAILED: actual_message")
*** Update File: <WORKDIR>/toml_to_string_test.mbt
@@
       #|
     ),
   )
-  assert_eq(@toml.parse(serialized), original)
+  assert_eq(@toml.parse_renamed(serialized), original)
 }
 
 ///|
@@
     #|debug = true
     #|max_connections = 100
     #|
-  let parsed = @toml.parse(toml)
+  let parsed = @toml.parse_renamed(toml)
-  let roundtripped = @toml.parse(parsed.to_string())
+  let roundtripped = @toml.parse_renamed(parsed.to_string())
   assert_eq(parsed, roundtripped)
 }
 
@@
     #|user = "admin"
     #|password = "secret"
     #|
-  let parsed = @toml.parse(toml)
+  let parsed = @toml.parse_renamed(toml)
-  let roundtripped = @toml.parse(parsed.to_string())
+  let roundtripped = @toml.parse_renamed(parsed.to_string())
   assert_eq(parsed, roundtripped)
 }
 
@@
     #|name = "Nail"
     #|sku = 284758393
     #|
-  let parsed = @toml.parse(toml)
+  let parsed = @toml.parse_renamed(toml)
-  let roundtripped = @toml.parse(parsed.to_string())
+  let roundtripped = @toml.parse_renamed(parsed.to_string())
   assert_eq(parsed, roundtripped)
 }
 
@@
     #|local_date = 2023-01-15
     #|local_time = 10:30:00
     #|
-  let parsed = @toml.parse(toml)
+  let parsed = @toml.parse_renamed(toml)
-  let roundtripped = @toml.parse(parsed.to_string())
+  let roundtripped = @toml.parse_renamed(parsed.to_string())
   assert_eq(parsed, roundtripped)
 }
 
@@
     #|strings = ["hello", "world"]
     #|nested = [[1, 2], [3, 4]]
     #|
-  let parsed = @toml.parse(toml)
+  let parsed = @toml.parse_renamed(toml)
-  let roundtripped = @toml.parse(parsed.to_string())
+  let roundtripped = @toml.parse_renamed(parsed.to_string())
   assert_eq(parsed, roundtripped)
 }
 
@@
     #|nan_val = nan
     #|pi = 3.14
     #|
-  let parsed = @toml.parse(toml)
+  let parsed = @toml.parse_renamed(toml)
   // NaN != NaN, so compare non-NaN values and check NaN separately
   let serialized = parsed.to_string()
-  let roundtripped = @toml.parse(serialized)
+  let roundtripped = @toml.parse_renamed(serialized)
   // Check that the serialized form re-parses correctly
   inspect(
     serialized,
@@
     #|name = "beta"
     #|ip = "10.0.0.2"
     #|
-  let parsed = @toml.parse(toml)
+  let parsed = @toml.parse_renamed(toml)
-  let roundtripped = @toml.parse(parsed.to_string())
+  let roundtripped = @toml.parse_renamed(parsed.to_string())
   assert_eq(parsed, roundtripped)
 }
 
@@
   let toml =
     #|escaped = "hello\nworld\ttab\\backslash\"quote"
     #|
-  let parsed = @toml.parse(toml)
+  let parsed = @toml.parse_renamed(toml)
-  let roundtripped = @toml.parse(parsed.to_string())
+  let roundtripped = @toml.parse_renamed(parsed.to_string())
   assert_eq(parsed, roundtripped)
 }
 
@@
     ),
   )
   // Verify roundtrip
-  let roundtripped = @toml.parse(value.to_string())
+  let roundtripped = @toml.parse_renamed(value.to_string())
   assert_eq(value, roundtripped)
 }
*** End Patch

```
