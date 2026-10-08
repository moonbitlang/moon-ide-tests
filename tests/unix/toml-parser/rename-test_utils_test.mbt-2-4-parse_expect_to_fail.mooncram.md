# toml-parser rename parse_expect_to_fail test_utils_test.mbt:2:4

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
$ run_moon_ide moon ide rename 'parse_expect_to_fail' 'parse_expect_to_fail_renamed' --loc 'test_utils_test.mbt:2:4'
*** Begin Patch
*** Update File: <WORKDIR>/comprehensive_test.mbt
@@
 
   // Missing value
   inspect(
-    parse_expect_to_fail("key ="),
+    parse_expect_to_fail_renamed("key ="),
     content=(
       #|Expected value at { start: { line: 1, column: 6 }, end: { line: 1, column: 6 } })
     ),
@@
   )
   // Missing key
   inspect(
-    parse_expect_to_fail("= \"value\""),
+    parse_expect_to_fail_renamed("= \"value\""),
     content=(
       #|Expected key at { start: { line: 1, column: 1 }, end: { line: 1, column: 2 } })
     ),
@@
 
   // Unterminated string
   inspect(
-    parse_expect_to_fail("key = \"unterminated"),
+    parse_expect_to_fail_renamed("key = \"unterminated"),
     content=(
       #|Unterminated string at line 1, column 8)
     ),
@@
 
   // Invalid syntax - incomplete array
   inspect(
-    parse_expect_to_fail("key = [1, 2"),
+    parse_expect_to_fail_renamed("key = [1, 2"),
     content=(
       #|Expected ',' or ']' in array at { start: { line: 1, column: 12 }, end: { line: 1, column: 12 } })
     ),
@@
 
   // Empty key
   inspect(
-    parse_expect_to_fail(" = \"value\""),
+    parse_expect_to_fail_renamed(" = \"value\""),
     content=(
       #|Expected key at { start: { line: 1, column: 2 }, end: { line: 1, column: 3 } })
     ),
@@
 
   // Test 1: Error at beginning of line
   inspect(
-    parse_expect_to_fail("=missing_key"),
+    parse_expect_to_fail_renamed("=missing_key"),
     content=(
       #|Expected key at { start: { line: 1, column: 1 }, end: { line: 1, column: 2 } })
     ),
@@
 
   // Test 2: Error in the middle of a line
   inspect(
-    parse_expect_to_fail("valid_key = "),
+    parse_expect_to_fail_renamed("valid_key = "),
     content=(
       #|Expected value at { start: { line: 1, column: 13 }, end: { line: 1, column: 13 } })
     ),
@@
 
   // Test 3: Error with spaces before it
   inspect(
-    parse_expect_to_fail("   key = "),
+    parse_expect_to_fail_renamed("   key = "),
     content=(
       #|Expected value at { start: { line: 1, column: 10 }, end: { line: 1, column: 10 } })
     ),
@@
 
   // Test 4: Missing equals sign
   inspect(
-    parse_expect_to_fail("key \"value\""),
+    parse_expect_to_fail_renamed("key \"value\""),
     content=(
       #|Expected '=' at { start: { line: 1, column: 5 }, end: { line: 1, column: 12 } })
     ),
@@
 
   // Test 5: Invalid value type
   inspect(
-    parse_expect_to_fail("key = invalid_unquoted"),
+    parse_expect_to_fail_renamed("key = invalid_unquoted"),
     content=(
       #|Expected value at { start: { line: 1, column: 7 }, end: { line: 1, column: 23 } })
     ),
@@
     #|key2 =
     #|
   inspect(
-    parse_expect_to_fail(multiline_test1),
+    parse_expect_to_fail_renamed(multiline_test1),
     content=(
       #|Expected value at { start: { line: 2, column: 7 }, end: { line: 3, column: 1 } })
     ),
@@
     #|= missing_key
     #|
   inspect(
-    parse_expect_to_fail(multiline_test2),
+    parse_expect_to_fail_renamed(multiline_test2),
     content=(
       #|Expected key at { start: { line: 3, column: 1 }, end: { line: 3, column: 2 } })
     ),
@@
     #|key2 = [1, 2,
     #|
   inspect(
-    parse_expect_to_fail(multiline_test3),
+    parse_expect_to_fail_renamed(multiline_test3),
     content=(
       #|Expected value at { start: { line: 2, column: 14 }, end: { line: 3, column: 1 } })
     ),
@@
     #|= error_here
     #|
   inspect(
-    parse_expect_to_fail(multiline_test4),
+    parse_expect_to_fail_renamed(multiline_test4),
     content=(
       #|Expected key at { start: { line: 5, column: 1 }, end: { line: 5, column: 2 } })
     ),
@@
 
   // Test 1: Missing closing bracket at specific position
   inspect(
-    parse_expect_to_fail("arr = [1, 2, 3"),
+    parse_expect_to_fail_renamed("arr = [1, 2, 3"),
     content=(
       #|Expected ',' or ']' in array at { start: { line: 1, column: 15 }, end: { line: 1, column: 15 } })
     ),
@@
 
   // Test 2: Missing comma between elements
   inspect(
-    parse_expect_to_fail("arr = [1 2]"),
+    parse_expect_to_fail_renamed("arr = [1 2]"),
     content=(
       #|Expected ',' or ']' in array at { start: { line: 1, column: 10 }, end: { line: 1, column: 11 } })
     ),
@@
 
   // Test 3: Invalid value in array
   inspect(
-    parse_expect_to_fail("arr = [1, invalid, 3]"),
+    parse_expect_to_fail_renamed("arr = [1, invalid, 3]"),
     content=(
       #|Expected value at { start: { line: 1, column: 11 }, end: { line: 1, column: 18 } })
     ),
@@
 
   // Test 4: Nested array error
   inspect(
-    parse_expect_to_fail("arr = [[1, 2], [3, ]"),
+    parse_expect_to_fail_renamed("arr = [[1, 2], [3, ]"),
     content=(
       #|Expected ',' or ']' in array at { start: { line: 1, column: 21 }, end: { line: 1, column: 21 } })
     ),
@@
     #|]
     #|
   inspect(
-    parse_expect_to_fail(array_multiline),
+    parse_expect_to_fail_renamed(array_multiline),
     content=(
       #|Expected value at { start: { line: 3, column: 5 }, end: { line: 4, column: 1 } })
     ),
@@
 
   // Test 1: Missing closing brace
   inspect(
-    parse_expect_to_fail("table = {key = \"value\""),
+    parse_expect_to_fail_renamed("table = {key = \"value\""),
     content=(
       #|Expected ',' or '}' in inline table at { start: { line: 1, column: 23 }, end: { line: 1, column: 23 } })
     ),
@@
 
   // Test 2: Missing key in inline table
   inspect(
-    parse_expect_to_fail("table = {= \"value\"}"),
+    parse_expect_to_fail_renamed("table = {= \"value\"}"),
     content=(
       #|Expected key at { start: { line: 1, column: 10 }, end: { line: 1, column: 11 } })
     ),
@@
 
   // Test 3: Missing value in inline table
   inspect(
-    parse_expect_to_fail("table = {key = }"),
+    parse_expect_to_fail_renamed("table = {key = }"),
     content=(
       #|Expected value at { start: { line: 1, column: 16 }, end: { line: 1, column: 17 } })
     ),
@@
 
   // Test 4: Missing equals in inline table
   inspect(
-    parse_expect_to_fail("table = {key \"value\"}"),
+    parse_expect_to_fail_renamed("table = {key \"value\"}"),
     content=(
       #|Expected '=' at { start: { line: 1, column: 14 }, end: { line: 1, column: 21 } })
     ),
@@
 
   // Test 1: Missing closing bracket in table header
   inspect(
-    parse_expect_to_fail("[table_name"),
+    parse_expect_to_fail_renamed("[table_name"),
     content=(
       #|Expected ']' at { start: { line: 1, column: 12 }, end: { line: 1, column: 12 } })
     ),
@@
 
   // Test 2: Missing table name
   inspect(
-    parse_expect_to_fail("[]"),
+    parse_expect_to_fail_renamed("[]"),
     content=(
       #|Expected key at { start: { line: 1, column: 2 }, end: { line: 1, column: 3 } })
     ),
@@
 
   // Test 3: Array of tables missing second bracket
   inspect(
-    parse_expect_to_fail("[[table_name]"),
+    parse_expect_to_fail_renamed("[[table_name]"),
     content=(
       #|Expected ']]' at { start: { line: 1, column: 13 }, end: { line: 1, column: 14 } })
     ),
@@
 
   // Test 4: Array of tables missing table name
   inspect(
-    parse_expect_to_fail("[[]]"),
+    parse_expect_to_fail_renamed("[[]]"),
     content=(
       #|Expected key at { start: { line: 1, column: 3 }, end: { line: 1, column: 4 } })
     ),
@@
 
   // Test 5: Invalid character in table name position
   inspect(
-    parse_expect_to_fail("[#invalid]"),
+    parse_expect_to_fail_renamed("[#invalid]"),
     content=(
       #|Expected key at { start: { line: 1, column: 11 }, end: { line: 1, column: 11 } })
     ),
@@
 
   // Test 1: Error at specific column with tabs (assuming tab = 1 column)
   inspect(
-    parse_expect_to_fail("\tkey ="),
+    parse_expect_to_fail_renamed("\tkey ="),
     content=(
       #|Expected value at { start: { line: 1, column: 7 }, end: { line: 1, column: 7 } })
     ),
@@
 
   // Test 2: Error with mixed spaces and content (should fail due to missing newline)
   inspect(
-    parse_expect_to_fail("  key1 = \"val\"  key2 = "),
+    parse_expect_to_fail_renamed("  key1 = \"val\"  key2 = "),
     content=(
       #|Expected newline or end of file after key-value pair at { start: { line: 1, column: 17 }, end: { line: 1, column: 21 } })
     ),
@@
 
   // Test 3: Long key name error position
   inspect(
-    parse_expect_to_fail("very_long_key_name_here = "),
+    parse_expect_to_fail_renamed("very_long_key_name_here = "),
     content=(
       #|Expected value at { start: { line: 1, column: 27 }, end: { line: 1, column: 27 } })
     ),
@@
 
   // Test 4: Error position after unicode characters
   inspect(
-    parse_expect_to_fail("café = "),
+    parse_expect_to_fail_renamed("café = "),
     content=(
       #|Unexpected character: 'é')
     ),
@@
 
   // Test 5: Multiple equals signs - error on second one
   inspect(
-    parse_expect_to_fail("key = = \"value\""),
+    parse_expect_to_fail_renamed("key = = \"value\""),
     content=(
       #|Expected value at { start: { line: 1, column: 7 }, end: { line: 1, column: 8 } })
     ),
@@
     #|}
     #|
   inspect(
-    parse_expect_to_fail(deep_nested),
+    parse_expect_to_fail_renamed(deep_nested),
     content=(
       #|Expected value at { start: { line: 4, column: 12 }, end: { line: 5, column: 1 } })
     ),
@@
 
   // Test 2: Error at end of file
   inspect(
-    parse_expect_to_fail("key = [1, 2, 3"),
+    parse_expect_to_fail_renamed("key = [1, 2, 3"),
     content=(
       #|Expected ',' or ']' in array at { start: { line: 1, column: 15 }, end: { line: 1, column: 15 } })
     ),
@@
 
   // Test 3: Error with different quote types
   inspect(
-    parse_expect_to_fail("key = 'unterminated"),
+    parse_expect_to_fail_renamed("key = 'unterminated"),
     content=(
       #|Unterminated string at line 1, column 8)
     ),
@@
     #|name =
     #|
   inspect(
-    parse_expect_to_fail(aot_error),
+    parse_expect_to_fail_renamed(aot_error),
     content=(
       #|Expected value at { start: { line: 5, column: 7 }, end: { line: 6, column: 1 } })
     ),
@@
     #|
     #|
   inspect(
-    parse_expect_to_fail(trailing_ws),
+    parse_expect_to_fail_renamed(trailing_ws),
     content=(
       #|Expected value at { start: { line: 2, column: 7 }, end: { line: 3, column: 1 } })
     ),
@@
 
   // Test 1: Error after comment on same line (should fail since comments aren't implemented)
   inspect(
-    parse_expect_to_fail("key = # comment"),
+    parse_expect_to_fail_renamed("key = # comment"),
     content=(
       #|Expected value at { start: { line: 1, column: 16 }, end: { line: 1, column: 16 } })
     ),
@@
 
   // Test 2: Error with windows-style line endings (if supported)
   inspect(
-    parse_expect_to_fail("key1 = \"value\"\r\nkey2 = "),
+    parse_expect_to_fail_renamed("key1 = \"value\"\r\nkey2 = "),
     content=(
       #|Expected value at { start: { line: 2, column: 8 }, end: { line: 2, column: 8 } })
     ),
@@
 
   // Test 3: Error with just spaces as a key
   inspect(
-    parse_expect_to_fail("   = \"value\""),
+    parse_expect_to_fail_renamed("   = \"value\""),
     content=(
       #|Expected key at { start: { line: 1, column: 4 }, end: { line: 1, column: 5 } })
     ),
@@
     #|]
     #|
   inspect(
-    parse_expect_to_fail(complex_array),
+    parse_expect_to_fail_renamed(complex_array),
     content=(
       #|Expected value at { start: { line: 4, column: 17 }, end: { line: 4, column: 30 } })
     ),
@@
   // Test 5: Very long line with error at the end
   let long_line = "very_long_key_name_that_goes_on_and_on_and_on_and_on_and_on = "
   inspect(
-    parse_expect_to_fail(long_line),
+    parse_expect_to_fail_renamed(long_line),
     content=(
       #|Expected value at { start: { line: 1, column: 63 }, end: { line: 1, column: 63 } })
     ),
@@
     #|key1 =
     #|  3
   inspect(
-    parse_expect_to_fail(data),
+    parse_expect_to_fail_renamed(data),
     content=(
       #|Expected value at { start: { line: 1, column: 7 }, end: { line: 2, column: 1 } })
     ),
@@
     #|   "localhost"
     #| }
   inspect(
-    parse_expect_to_fail(data2),
+    parse_expect_to_fail_renamed(data2),
     content=(
       #|Expected value at { start: { line: 1, column: 18 }, end: { line: 2, column: 1 } })
     ),
*** Update File: <WORKDIR>/coverage_improvement_comprehensive_test.mbt
@@
 /// Test invalid Unicode escape sequences to trigger error paths
 test "invalid_unicode_escapes" {
   inspect(
-    parse_expect_to_fail(
+    parse_expect_to_fail_renamed(
       (
         #|key = "\uZZZZ"
       ),
@@
 /// Test invalid 8-byte Unicode escape
 test "invalid_8byte_unicode_escape" {
   inspect(
-    parse_expect_to_fail(
+    parse_expect_to_fail_renamed(
       (
         #|key = "\U00200000"
       ),
@@
 /// Test unterminated multiline string
 test "unterminated_multiline_string" {
   inspect(
-    parse_expect_to_fail(
+    parse_expect_to_fail_renamed(
       (
         #|key = """This is unterminated
       ),
@@
 /// Test table path conflict error  
 test "table_path_conflict_error" {
   inspect(
-    parse_expect_to_fail(
+    parse_expect_to_fail_renamed(
       (
         #|key = 42
         #|[key]
@@
 /// Test array of tables path conflict error
 test "array_of_tables_path_conflict_error" {
   inspect(
-    parse_expect_to_fail(
+    parse_expect_to_fail_renamed(
       (
         #|key = 42
         #|[[key]]
@@
 /// Test error handling with invalid characters
 test "invalid_character_error" {
   inspect(
-    parse_expect_to_fail(
+    parse_expect_to_fail_renamed(
       (
         #|key = @invalid
       ),
*** Update File: <WORKDIR>/key_value_disambiguation_test.mbt
@@
   // TOML only allows lowercase 0x/0o/0b prefixes, so 0X/0O/0B in value
   // position is an error...
   for input in ["x = 0XDEAD\n", "x = 0O755\n", "x = 0B1010\n"] {
-    assert_true(parse_expect_to_fail(input).has_prefix("Expected value"))
+    assert_true(parse_expect_to_fail_renamed(input).has_prefix("Expected value"))
   }
   // ...but they are still valid bare keys.
   debug_inspect(
@@
   // '+' is not a bare-key character, so all of these must be rejected
   // (several used to parse with the '+' silently dropped).
   inspect(
-    parse_expect_to_fail("+5 = 3\n"),
+    parse_expect_to_fail_renamed("+5 = 3\n"),
     content=(
       #|Expected key at { start: { line: 1, column: 1 }, end: { line: 1, column: 3 } })
     ),
   )
   inspect(
-    parse_expect_to_fail("+5.5 = 3\n"),
+    parse_expect_to_fail_renamed("+5.5 = 3\n"),
     content=(
       #|Expected key at { start: { line: 1, column: 1 }, end: { line: 1, column: 5 } })
     ),
   )
   inspect(
-    parse_expect_to_fail("+5e3 = 3\n"),
+    parse_expect_to_fail_renamed("+5e3 = 3\n"),
     content=(
       #|Expected key at { start: { line: 1, column: 1 }, end: { line: 1, column: 5 } })
     ),
   )
   inspect(
-    parse_expect_to_fail("+5y = 3\n"),
+    parse_expect_to_fail_renamed("+5y = 3\n"),
     content=(
       #|Expected key at { start: { line: 1, column: 1 }, end: { line: 1, column: 3 } })
     ),
   )
   inspect(
-    parse_expect_to_fail("[+5]\n"),
+    parse_expect_to_fail_renamed("[+5]\n"),
     content=(
       #|Expected key at { start: { line: 1, column: 2 }, end: { line: 1, column: 4 } })
     ),
   )
   inspect(
-    parse_expect_to_fail("+inf = 1\n"),
+    parse_expect_to_fail_renamed("+inf = 1\n"),
     content=(
       #|Expected key at { start: { line: 1, column: 1 }, end: { line: 1, column: 5 } })
     ),
@@
   // These used to silently wrap around (0xFFFFFFFFFFFFFFFF parsed as -1)
   // while decimal overflow was already an error.
   inspect(
-    parse_expect_to_fail("x = 0xFFFFFFFFFFFFFFFF\n"),
+    parse_expect_to_fail_renamed("x = 0xFFFFFFFFFFFFFFFF\n"),
     content=(
       #|Invalid hex number: value out of Int64 range at line 1, column 5)
     ),
   )
   inspect(
-    parse_expect_to_fail(
+    parse_expect_to_fail_renamed(
       "x = 0b1111111111111111111111111111111111111111111111111111111111111111\n",
     ),
     content=(
@@
     ),
   )
   inspect(
-    parse_expect_to_fail("x = 0o2000000000000000000000\n"),
+    parse_expect_to_fail_renamed("x = 0o2000000000000000000000\n"),
     content=(
       #|Invalid octal number: value out of Int64 range at line 1, column 5)
     ),
@@
   // TOML 1.0: dotted keys define the tables for each key part, and such
   // tables cannot be redefined with a [table] header.
   inspect(
-    parse_expect_to_fail("fruit.apple = 1\n\n[fruit]\n"),
+    parse_expect_to_fail_renamed("fruit.apple = 1\n\n[fruit]\n"),
     content=(
       #|Duplicate table definition: [fruit] at { start: { line: 3, column: 8 }, end: { line: 4, column: 1 } })
     ),
   )
   inspect(
-    parse_expect_to_fail("a.b.c = 1\n[a]\n"),
+    parse_expect_to_fail_renamed("a.b.c = 1\n[a]\n"),
     content=(
       #|Duplicate table definition: [a] at { start: { line: 2, column: 4 }, end: { line: 3, column: 1 } })
     ),
   )
   inspect(
-    parse_expect_to_fail("a.b.c = 1\n[a.b]\n"),
+    parse_expect_to_fail_renamed("a.b.c = 1\n[a.b]\n"),
     content=(
       #|Duplicate table definition: [a.b] at { start: { line: 2, column: 6 }, end: { line: 3, column: 1 } })
     ),
   )
   inspect(
-    parse_expect_to_fail("[[a]]\nb.c = 1\n[a.b]\n"),
+    parse_expect_to_fail_renamed("[[a]]\nb.c = 1\n[a.b]\n"),
     content=(
       #|Duplicate table definition: [a.b] at { start: { line: 3, column: 6 }, end: { line: 4, column: 1 } })
     ),
@@
     input in [
       "a = []\n[[a]]\n", "a = [{}]\n[[a]]\n", "a = [ {x = 1} ]\n[[a]]\ny = 2\n",
     ] {
-    assert_true(parse_expect_to_fail(input).has_prefix("ExpectedArray"))
+    assert_true(parse_expect_to_fail_renamed(input).has_prefix("ExpectedArray"))
   }
 }
 
@@
   // reason rather than degrading to a generic "Expected value".
   debug_inspect(
     [
-      parse_expect_to_fail("x = 1__0\n"),
+      parse_expect_to_fail_renamed("x = 1__0\n"),
-      parse_expect_to_fail("arr = [1__0]\n"),
+      parse_expect_to_fail_renamed("arr = [1__0]\n"),
-      parse_expect_to_fail("x = 1_\n"),
+      parse_expect_to_fail_renamed("x = 1_\n"),
-      parse_expect_to_fail("x = 1.5_\n"),
+      parse_expect_to_fail_renamed("x = 1.5_\n"),
-      parse_expect_to_fail("x = 99999999999999999999\n"),
+      parse_expect_to_fail_renamed("x = 99999999999999999999\n"),
     ],
     content=(
       #|[
*** Update File: <WORKDIR>/official_toml_test_suite_test.mbt
@@
     #|inf = -infx
     #|
   inspect(
-    parse_expect_to_fail(inf_failure_toml),
+    parse_expect_to_fail_renamed(inf_failure_toml),
     content=(
       #|Invalid character 'x' after special value at line 1, column 11)
     ),
@@
     #|inf = -infx=2
     #|
   inspect(
-    parse_expect_to_fail(inf_failure_toml2),
+    parse_expect_to_fail_renamed(inf_failure_toml2),
     content=(
       #|Invalid character 'x' after special value at line 1, column 11)
     ),
@@
     #|inf = -inf x=2
     #|
   inspect(
-    parse_expect_to_fail(inf_failure_toml2),
+    parse_expect_to_fail_renamed(inf_failure_toml2),
     content=(
       #|Expected newline or end of file after key-value pair at { start: { line: 1, column: 12 }, end: { line: 1, column: 13 } })
     ),
@@
     #|a = 3 b = 2
     #|
   inspect(
-    parse_expect_to_fail(table_failure),
+    parse_expect_to_fail_renamed(table_failure),
     content=(
       #|Expected newline or end of file after key-value pair at { start: { line: 1, column: 7 }, end: { line: 1, column: 8 } })
     ),
*** Update File: <WORKDIR>/parser_test.mbt
@@
 /// Tests for uncovered parser error conditions
 test "test parser expect method failure" {
   inspect(
-    parse_expect_to_fail("key = [missing_bracket"),
+    parse_expect_to_fail_renamed("key = [missing_bracket"),
     content=(
       #|Expected value at { start: { line: 1, column: 8 }, end: { line: 1, column: 23 } })
     ),
@@
 ///|
 test "test parser EOF handling in advance" {
   inspect(
-    parse_expect_to_fail("key ="),
+    parse_expect_to_fail_renamed("key ="),
     content=(
       #|Expected value at { start: { line: 1, column: 6 }, end: { line: 1, column: 6 } })
     ),
@@
 ///|
 test "test parser rejects dash-starting identifier as value" {
   inspect(
-    parse_expect_to_fail("key = -abc"),
+    parse_expect_to_fail_renamed("key = -abc"),
     content=(
       #|Expected value at { start: { line: 1, column: 7 }, end: { line: 1, column: 11 } })
     ),
@@
 ///|
 test "test inline table invalid syntax" {
   inspect(
-    parse_expect_to_fail("table = {key value}"),
+    parse_expect_to_fail_renamed("table = {key value}"),
     content=(
       #|Expected '=' at { start: { line: 1, column: 14 }, end: { line: 1, column: 19 } })
     ),
@@
 ///|
 test "test inline table missing comma or closing brace" {
   inspect(
-    parse_expect_to_fail("table = {key = \"value\" invalid}"),
+    parse_expect_to_fail_renamed("table = {key = \"value\" invalid}"),
     content=(
       #|Expected ',' or '}' in inline table at { start: { line: 1, column: 24 }, end: { line: 1, column: 31 } })
     ),
@@
   // 1e100000 overflows Double but should NOT silently become infinity.
   // TOML reserves inf/nan as the only valid non-finite spellings.
   inspect(
-    parse_expect_to_fail("x = 1e100000\n"),
+    parse_expect_to_fail_renamed("x = 1e100000\n"),
     content=(
       #|Invalid float: 1e100000 at { start: { line: 1, column: 5 }, end: { line: 1, column: 13 } })
     ),
   )
   inspect(
-    parse_expect_to_fail("x = -31e368\n"),
+    parse_expect_to_fail_renamed("x = -31e368\n"),
     content=(
       #|Invalid float: -31e368 at { start: { line: 1, column: 5 }, end: { line: 1, column: 12 } })
     ),
@@
     #|key2 = "value2"
     #|
   inspect(
-    parse_expect_to_fail(duplicate_table_toml),
+    parse_expect_to_fail_renamed(duplicate_table_toml),
     content=(
       #|Duplicate table definition: [table] at { start: { line: 3, column: 8 }, end: { line: 4, column: 1 } })
     ),
@@
     #|key = "value"
     #|
   inspect(
-    parse_expect_to_fail(conflicting_table_toml),
+    parse_expect_to_fail_renamed(conflicting_table_toml),
     content=(
       #|ExpectedTable("table", "string
     ),
*** Update File: <WORKDIR>/test_utils_test.mbt
@@
 ///|
-fn parse_expect_to_fail(input : String) -> String {
+fn parse_expect_to_fail_renamed(input : String) -> String {
   try @toml.parse(input) catch {
     e => {
       let s = e.to_string()
@@
 ///|
 test "verify parse_expect_to_fail output" {
   inspect(
-    parse_expect_to_fail("key ="),
+    parse_expect_to_fail_renamed("key ="),
     content=(
       #|Expected value at { start: { line: 1, column: 6 }, end: { line: 1, column: 6 } })
     ),
*** End Patch

```
