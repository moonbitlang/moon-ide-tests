# toml-parser find-references parse_expect_to_fail test_utils_test.mbt:2:4

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide find-references 'parse_expect_to_fail' --loc 'test_utils_test.mbt:2:4'
Found 66 references for symbol 'parse_expect_to_fail':
<WORKDIR>/comprehensive_test.mbt:425:5-425:25:
    | 
    |   // Missing value
    |   inspect(
425 |     parse_expect_to_fail("key ="),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected value at { start: { line: 1, column: 6 }, end: { line: 1, column: 6 } })

<WORKDIR>/comprehensive_test.mbt:432:5-432:25:
    |   )
    |   // Missing key
    |   inspect(
432 |     parse_expect_to_fail("= \"value\""),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected key at { start: { line: 1, column: 1 }, end: { line: 1, column: 2 } })

<WORKDIR>/comprehensive_test.mbt:440:5-440:25:
    | 
    |   // Unterminated string
    |   inspect(
440 |     parse_expect_to_fail("key = \"unterminated"),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Unterminated string at line 1, column 8)

<WORKDIR>/comprehensive_test.mbt:448:5-448:25:
    | 
    |   // Invalid syntax - incomplete array
    |   inspect(
448 |     parse_expect_to_fail("key = [1, 2"),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected ',' or ']' in array at { start: { line: 1, column: 12 }, end: { line: 1, column: 12 } })

<WORKDIR>/comprehensive_test.mbt:456:5-456:25:
    | 
    |   // Empty key
    |   inspect(
456 |     parse_expect_to_fail(" = \"value\""),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected key at { start: { line: 1, column: 2 }, end: { line: 1, column: 3 } })

<WORKDIR>/comprehensive_test.mbt:469:5-469:25:
    | 
    |   // Test 1: Error at beginning of line
    |   inspect(
469 |     parse_expect_to_fail("=missing_key"),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected key at { start: { line: 1, column: 1 }, end: { line: 1, column: 2 } })

<WORKDIR>/comprehensive_test.mbt:477:5-477:25:
    | 
    |   // Test 2: Error in the middle of a line
    |   inspect(
477 |     parse_expect_to_fail("valid_key = "),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected value at { start: { line: 1, column: 13 }, end: { line: 1, column: 13 } })

<WORKDIR>/comprehensive_test.mbt:485:5-485:25:
    | 
    |   // Test 3: Error with spaces before it
    |   inspect(
485 |     parse_expect_to_fail("   key = "),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected value at { start: { line: 1, column: 10 }, end: { line: 1, column: 10 } })

<WORKDIR>/comprehensive_test.mbt:493:5-493:25:
    | 
    |   // Test 4: Missing equals sign
    |   inspect(
493 |     parse_expect_to_fail("key \"value\""),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected '=' at { start: { line: 1, column: 5 }, end: { line: 1, column: 12 } })

<WORKDIR>/comprehensive_test.mbt:501:5-501:25:
    | 
    |   // Test 5: Invalid value type
    |   inspect(
501 |     parse_expect_to_fail("key = invalid_unquoted"),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected value at { start: { line: 1, column: 7 }, end: { line: 1, column: 23 } })

<WORKDIR>/comprehensive_test.mbt:518:5-518:25:
    |     #|key2 =
    |     #|
    |   inspect(
518 |     parse_expect_to_fail(multiline_test1),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected value at { start: { line: 2, column: 7 }, end: { line: 3, column: 1 } })

<WORKDIR>/comprehensive_test.mbt:531:5-531:25:
    |     #|= missing_key
    |     #|
    |   inspect(
531 |     parse_expect_to_fail(multiline_test2),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected key at { start: { line: 3, column: 1 }, end: { line: 3, column: 2 } })

<WORKDIR>/comprehensive_test.mbt:543:5-543:25:
    |     #|key2 = [1, 2,
    |     #|
    |   inspect(
543 |     parse_expect_to_fail(multiline_test3),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected value at { start: { line: 2, column: 14 }, end: { line: 3, column: 1 } })

<WORKDIR>/comprehensive_test.mbt:558:5-558:25:
    |     #|= error_here
    |     #|
    |   inspect(
558 |     parse_expect_to_fail(multiline_test4),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected key at { start: { line: 5, column: 1 }, end: { line: 5, column: 2 } })

<WORKDIR>/comprehensive_test.mbt:571:5-571:25:
    | 
    |   // Test 1: Missing closing bracket at specific position
    |   inspect(
571 |     parse_expect_to_fail("arr = [1, 2, 3"),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected ',' or ']' in array at { start: { line: 1, column: 15 }, end: { line: 1, column: 15 } })

<WORKDIR>/comprehensive_test.mbt:579:5-579:25:
    | 
    |   // Test 2: Missing comma between elements
    |   inspect(
579 |     parse_expect_to_fail("arr = [1 2]"),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected ',' or ']' in array at { start: { line: 1, column: 10 }, end: { line: 1, column: 11 } })

<WORKDIR>/comprehensive_test.mbt:587:5-587:25:
    | 
    |   // Test 3: Invalid value in array
    |   inspect(
587 |     parse_expect_to_fail("arr = [1, invalid, 3]"),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected value at { start: { line: 1, column: 11 }, end: { line: 1, column: 18 } })

<WORKDIR>/comprehensive_test.mbt:595:5-595:25:
    | 
    |   // Test 4: Nested array error
    |   inspect(
595 |     parse_expect_to_fail("arr = [[1, 2], [3, ]"),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected ',' or ']' in array at { start: { line: 1, column: 21 }, end: { line: 1, column: 21 } })

<WORKDIR>/comprehensive_test.mbt:610:5-610:25:
    |     #|]
    |     #|
    |   inspect(
610 |     parse_expect_to_fail(array_multiline),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected value at { start: { line: 3, column: 5 }, end: { line: 4, column: 1 } })

<WORKDIR>/comprehensive_test.mbt:623:5-623:25:
    | 
    |   // Test 1: Missing closing brace
    |   inspect(
623 |     parse_expect_to_fail("table = {key = \"value\""),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected ',' or '}' in inline table at { start: { line: 1, column: 23 }, end: { line: 1, column: 23 } })

<WORKDIR>/comprehensive_test.mbt:631:5-631:25:
    | 
    |   // Test 2: Missing key in inline table
    |   inspect(
631 |     parse_expect_to_fail("table = {= \"value\"}"),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected key at { start: { line: 1, column: 10 }, end: { line: 1, column: 11 } })

<WORKDIR>/comprehensive_test.mbt:639:5-639:25:
    | 
    |   // Test 3: Missing value in inline table
    |   inspect(
639 |     parse_expect_to_fail("table = {key = }"),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected value at { start: { line: 1, column: 16 }, end: { line: 1, column: 17 } })

<WORKDIR>/comprehensive_test.mbt:647:5-647:25:
    | 
    |   // Test 4: Missing equals in inline table
    |   inspect(
647 |     parse_expect_to_fail("table = {key \"value\"}"),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected '=' at { start: { line: 1, column: 14 }, end: { line: 1, column: 21 } })

<WORKDIR>/comprehensive_test.mbt:672:5-672:25:
    | 
    |   // Test 1: Missing closing bracket in table header
    |   inspect(
672 |     parse_expect_to_fail("[table_name"),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected ']' at { start: { line: 1, column: 12 }, end: { line: 1, column: 12 } })

<WORKDIR>/comprehensive_test.mbt:680:5-680:25:
    | 
    |   // Test 2: Missing table name
    |   inspect(
680 |     parse_expect_to_fail("[]"),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected key at { start: { line: 1, column: 2 }, end: { line: 1, column: 3 } })

<WORKDIR>/comprehensive_test.mbt:688:5-688:25:
    | 
    |   // Test 3: Array of tables missing second bracket
    |   inspect(
688 |     parse_expect_to_fail("[[table_name]"),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected ']]' at { start: { line: 1, column: 13 }, end: { line: 1, column: 14 } })

<WORKDIR>/comprehensive_test.mbt:696:5-696:25:
    | 
    |   // Test 4: Array of tables missing table name
    |   inspect(
696 |     parse_expect_to_fail("[[]]"),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected key at { start: { line: 1, column: 3 }, end: { line: 1, column: 4 } })

<WORKDIR>/comprehensive_test.mbt:704:5-704:25:
    | 
    |   // Test 5: Invalid character in table name position
    |   inspect(
704 |     parse_expect_to_fail("[#invalid]"),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected key at { start: { line: 1, column: 11 }, end: { line: 1, column: 11 } })

<WORKDIR>/comprehensive_test.mbt:717:5-717:25:
    | 
    |   // Test 1: Error at specific column with tabs (assuming tab = 1 column)
    |   inspect(
717 |     parse_expect_to_fail("\tkey ="),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected value at { start: { line: 1, column: 7 }, end: { line: 1, column: 7 } })

<WORKDIR>/comprehensive_test.mbt:725:5-725:25:
    | 
    |   // Test 2: Error with mixed spaces and content (should fail due to missing newline)
    |   inspect(
725 |     parse_expect_to_fail("  key1 = \"val\"  key2 = "),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected newline or end of file after key-value pair at { start: { line: 1, column: 17 }, end: { line: 1, column: 21 } })

<WORKDIR>/comprehensive_test.mbt:733:5-733:25:
    | 
    |   // Test 3: Long key name error position
    |   inspect(
733 |     parse_expect_to_fail("very_long_key_name_here = "),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected value at { start: { line: 1, column: 27 }, end: { line: 1, column: 27 } })

<WORKDIR>/comprehensive_test.mbt:741:5-741:25:
    | 
    |   // Test 4: Error position after unicode characters
    |   inspect(
741 |     parse_expect_to_fail("café = "),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Unexpected character: 'é')

<WORKDIR>/comprehensive_test.mbt:749:5-749:25:
    | 
    |   // Test 5: Multiple equals signs - error on second one
    |   inspect(
749 |     parse_expect_to_fail("key = = \"value\""),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected value at { start: { line: 1, column: 7 }, end: { line: 1, column: 8 } })

<WORKDIR>/comprehensive_test.mbt:771:5-771:25:
    |     #|}
    |     #|
    |   inspect(
771 |     parse_expect_to_fail(deep_nested),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected value at { start: { line: 4, column: 12 }, end: { line: 5, column: 1 } })

<WORKDIR>/comprehensive_test.mbt:779:5-779:25:
    | 
    |   // Test 2: Error at end of file
    |   inspect(
779 |     parse_expect_to_fail("key = [1, 2, 3"),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected ',' or ']' in array at { start: { line: 1, column: 15 }, end: { line: 1, column: 15 } })

<WORKDIR>/comprehensive_test.mbt:787:5-787:25:
    | 
    |   // Test 3: Error with different quote types
    |   inspect(
787 |     parse_expect_to_fail("key = 'unterminated"),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Unterminated string at line 1, column 8)

<WORKDIR>/comprehensive_test.mbt:802:5-802:25:
    |     #|name =
    |     #|
    |   inspect(
802 |     parse_expect_to_fail(aot_error),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected value at { start: { line: 5, column: 7 }, end: { line: 6, column: 1 } })

<WORKDIR>/comprehensive_test.mbt:815:5-815:25:
    |     #|
    |     #|
    |   inspect(
815 |     parse_expect_to_fail(trailing_ws),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected value at { start: { line: 2, column: 7 }, end: { line: 3, column: 1 } })

<WORKDIR>/comprehensive_test.mbt:828:5-828:25:
    | 
    |   // Test 1: Error after comment on same line (should fail since comments aren't implemented)
    |   inspect(
828 |     parse_expect_to_fail("key = # comment"),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected value at { start: { line: 1, column: 16 }, end: { line: 1, column: 16 } })

<WORKDIR>/comprehensive_test.mbt:836:5-836:25:
    | 
    |   // Test 2: Error with windows-style line endings (if supported)
    |   inspect(
836 |     parse_expect_to_fail("key1 = \"value\"\r\nkey2 = "),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected value at { start: { line: 2, column: 8 }, end: { line: 2, column: 8 } })

<WORKDIR>/comprehensive_test.mbt:844:5-844:25:
    | 
    |   // Test 3: Error with just spaces as a key
    |   inspect(
844 |     parse_expect_to_fail("   = \"value\""),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected key at { start: { line: 1, column: 4 }, end: { line: 1, column: 5 } })

<WORKDIR>/comprehensive_test.mbt:859:5-859:25:
    |     #|]
    |     #|
    |   inspect(
859 |     parse_expect_to_fail(complex_array),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected value at { start: { line: 4, column: 17 }, end: { line: 4, column: 30 } })

<WORKDIR>/comprehensive_test.mbt:868:5-868:25:
    |   // Test 5: Very long line with error at the end
    |   let long_line = "very_long_key_name_that_goes_on_and_on_and_on_and_on_and_on = "
    |   inspect(
868 |     parse_expect_to_fail(long_line),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected value at { start: { line: 1, column: 63 }, end: { line: 1, column: 63 } })

<WORKDIR>/comprehensive_test.mbt:953:5-953:25:
    |     #|key1 =
    |     #|  3
    |   inspect(
953 |     parse_expect_to_fail(data),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected value at { start: { line: 1, column: 7 }, end: { line: 2, column: 1 } })

<WORKDIR>/comprehensive_test.mbt:964:5-964:25:
    |     #|   "localhost"
    |     #| }
    |   inspect(
964 |     parse_expect_to_fail(data2),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected value at { start: { line: 1, column: 18 }, end: { line: 2, column: 1 } })

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:91:5-91:25:
   | /// Test invalid Unicode escape sequences to trigger error paths
   | test "invalid_unicode_escapes" {
   |   inspect(
91 |     parse_expect_to_fail(
   |     ^^^^^^^^^^^^^^^^^^^^
   |       (
   |         #|key = "\uZZZZ"

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:106:5-106:25:
    | /// Test invalid 8-byte Unicode escape
    | test "invalid_8byte_unicode_escape" {
    |   inspect(
106 |     parse_expect_to_fail(
    |     ^^^^^^^^^^^^^^^^^^^^
    |       (
    |         #|key = "\U00200000"

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:121:5-121:25:
    | /// Test unterminated multiline string
    | test "unterminated_multiline_string" {
    |   inspect(
121 |     parse_expect_to_fail(
    |     ^^^^^^^^^^^^^^^^^^^^
    |       (
    |         #|key = """This is unterminated

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:183:5-183:25:
    | /// Test table path conflict error  
    | test "table_path_conflict_error" {
    |   inspect(
183 |     parse_expect_to_fail(
    |     ^^^^^^^^^^^^^^^^^^^^
    |       (
    |         #|key = 42

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:199:5-199:25:
    | /// Test array of tables path conflict error
    | test "array_of_tables_path_conflict_error" {
    |   inspect(
199 |     parse_expect_to_fail(
    |     ^^^^^^^^^^^^^^^^^^^^
    |       (
    |         #|key = 42

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:438:5-438:25:
    | /// Test error handling with invalid characters
    | test "invalid_character_error" {
    |   inspect(
438 |     parse_expect_to_fail(
    |     ^^^^^^^^^^^^^^^^^^^^
    |       (
    |         #|key = @invalid

<WORKDIR>/official_toml_test_suite_test.mbt:548:5-548:25:
    |     #|inf = -infx
    |     #|
    |   inspect(
548 |     parse_expect_to_fail(inf_failure_toml),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Invalid character 'x' after special value at line 1, column 11)

<WORKDIR>/official_toml_test_suite_test.mbt:557:5-557:25:
    |     #|inf = -infx=2
    |     #|
    |   inspect(
557 |     parse_expect_to_fail(inf_failure_toml2),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Invalid character 'x' after special value at line 1, column 11)

<WORKDIR>/official_toml_test_suite_test.mbt:566:5-566:25:
    |     #|inf = -inf x=2
    |     #|
    |   inspect(
566 |     parse_expect_to_fail(inf_failure_toml2),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected newline or end of file after key-value pair at { start: { line: 1, column: 12 }, end: { line: 1, column: 13 } })

<WORKDIR>/official_toml_test_suite_test.mbt:575:5-575:25:
    |     #|a = 3 b = 2
    |     #|
    |   inspect(
575 |     parse_expect_to_fail(table_failure),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected newline or end of file after key-value pair at { start: { line: 1, column: 7 }, end: { line: 1, column: 8 } })

<WORKDIR>/parser_test.mbt:138:5-138:25:
    | /// Tests for uncovered parser error conditions
    | test "test parser expect method failure" {
    |   inspect(
138 |     parse_expect_to_fail("key = [missing_bracket"),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected value at { start: { line: 1, column: 8 }, end: { line: 1, column: 23 } })

<WORKDIR>/parser_test.mbt:162:5-162:25:
    | ///|
    | test "test parser EOF handling in advance" {
    |   inspect(
162 |     parse_expect_to_fail("key ="),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected value at { start: { line: 1, column: 6 }, end: { line: 1, column: 6 } })

<WORKDIR>/parser_test.mbt:172:5-172:25:
    | ///|
    | test "test parser rejects dash-starting identifier as value" {
    |   inspect(
172 |     parse_expect_to_fail("key = -abc"),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected value at { start: { line: 1, column: 7 }, end: { line: 1, column: 11 } })

<WORKDIR>/parser_test.mbt:196:5-196:25:
    | ///|
    | test "test inline table invalid syntax" {
    |   inspect(
196 |     parse_expect_to_fail("table = {key value}"),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected '=' at { start: { line: 1, column: 14 }, end: { line: 1, column: 19 } })

<WORKDIR>/parser_test.mbt:206:5-206:25:
    | ///|
    | test "test inline table missing comma or closing brace" {
    |   inspect(
206 |     parse_expect_to_fail("table = {key = \"value\" invalid}"),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Expected ',' or '}' in inline table at { start: { line: 1, column: 24 }, end: { line: 1, column: 31 } })

<WORKDIR>/parser_test.mbt:394:5-394:25:
    |   // 1e100000 overflows Double but should NOT silently become infinity.
    |   // TOML reserves inf/nan as the only valid non-finite spellings.
    |   inspect(
394 |     parse_expect_to_fail("x = 1e100000\n"),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Invalid float: 1e100000 at { start: { line: 1, column: 5 }, end: { line: 1, column: 13 } })

<WORKDIR>/parser_test.mbt:400:5-400:25:
    |     ),
    |   )
    |   inspect(
400 |     parse_expect_to_fail("x = -31e368\n"),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Invalid float: -31e368 at { start: { line: 1, column: 5 }, end: { line: 1, column: 12 } })

<WORKDIR>/parser_test.mbt:492:5-492:25:
    |     #|key2 = "value2"
    |     #|
    |   inspect(
492 |     parse_expect_to_fail(duplicate_table_toml),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|Duplicate table definition: [table] at { start: { line: 3, column: 8 }, end: { line: 4, column: 1 } })

<WORKDIR>/parser_test.mbt:507:5-507:25:
    |     #|key = "value"
    |     #|
    |   inspect(
507 |     parse_expect_to_fail(conflicting_table_toml),
    |     ^^^^^^^^^^^^^^^^^^^^
    |     content=(
    |       #|ExpectedTable("table", "string

<WORKDIR>/test_utils_test.mbt:2:4-2:24:
  | ///|
2 | fn parse_expect_to_fail(input : String) -> String {
  |    ^^^^^^^^^^^^^^^^^^^^
  |   try @toml.parse(input) catch {
  |     e => {

<WORKDIR>/test_utils_test.mbt:26:5-26:25:
   | ///|
   | test "verify parse_expect_to_fail output" {
   |   inspect(
26 |     parse_expect_to_fail("key ="),
   |     ^^^^^^^^^^^^^^^^^^^^
   |     content=(
   |       #|Expected value at { start: { line: 1, column: 6 }, end: { line: 1, column: 6 } })

```
