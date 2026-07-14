# json find-references expect_accept src\tests\json_testsuite_y_test.mbt:9:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide find-references 'expect_accept' --loc 'src\tests\json_testsuite_y_test.mbt:9:3'
Found 96 references for symbol 'expect_accept':
<WORKDIR>/src\tests\json_testsuite_helpers_test.mbt:7:4-7:17:
  | }
  | 
  | ///|
7 | fn expect_accept(name : String, input : String) -> Unit raise {
  |    ^^^^^^^^^^^^^
  |   try @json.decode(input) catch {
  |     _ => json_testsuite_fail("expected JSONTestSuite accept: " + name)

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:9:3-9:16:
  | ///|
  | test "json_testsuite y_array_arraysWithSpaces" {
  |   let input = "[[]   ]"
9 |   expect_accept("y_array_arraysWithSpaces.json", input)
  |   ^^^^^^^^^^^^^
  | }
  | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:15:3-15:16:
   | ///|
   | test "json_testsuite y_array_empty-string" {
   |   let input = "[\"\"]"
15 |   expect_accept("y_array_empty-string.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:21:3-21:16:
   | ///|
   | test "json_testsuite y_array_empty" {
   |   let input = "[]"
21 |   expect_accept("y_array_empty.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:27:3-27:16:
   | ///|
   | test "json_testsuite y_array_ending_with_newline" {
   |   let input = "[\"a\"]"
27 |   expect_accept("y_array_ending_with_newline.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:33:3-33:16:
   | ///|
   | test "json_testsuite y_array_false" {
   |   let input = "[false]"
33 |   expect_accept("y_array_false.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:39:3-39:16:
   | ///|
   | test "json_testsuite y_array_heterogeneous" {
   |   let input = "[null, 1, \"1\", {}]"
39 |   expect_accept("y_array_heterogeneous.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:45:3-45:16:
   | ///|
   | test "json_testsuite y_array_null" {
   |   let input = "[null]"
45 |   expect_accept("y_array_null.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:51:3-51:16:
   | ///|
   | test "json_testsuite y_array_with_1_and_newline" {
   |   let input = "[1\n]"
51 |   expect_accept("y_array_with_1_and_newline.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:57:3-57:16:
   | ///|
   | test "json_testsuite y_array_with_leading_space" {
   |   let input = " [1]"
57 |   expect_accept("y_array_with_leading_space.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:63:3-63:16:
   | ///|
   | test "json_testsuite y_array_with_several_null" {
   |   let input = "[1,null,null,null,2]"
63 |   expect_accept("y_array_with_several_null.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:69:3-69:16:
   | ///|
   | test "json_testsuite y_array_with_trailing_space" {
   |   let input = "[2] "
69 |   expect_accept("y_array_with_trailing_space.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:75:3-75:16:
   | ///|
   | test "json_testsuite y_number" {
   |   let input = "[123e65]"
75 |   expect_accept("y_number.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:81:3-81:16:
   | ///|
   | test "json_testsuite y_number_0e+1" {
   |   let input = "[0e+1]"
81 |   expect_accept("y_number_0e+1.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:87:3-87:16:
   | ///|
   | test "json_testsuite y_number_0e1" {
   |   let input = "[0e1]"
87 |   expect_accept("y_number_0e1.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:93:3-93:16:
   | ///|
   | test "json_testsuite y_number_after_space" {
   |   let input = "[ 4]"
93 |   expect_accept("y_number_after_space.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:99:3-99:16:
   | ///|
   | test "json_testsuite y_number_double_close_to_zero" {
   |   let input = "[-0.000000000000000000000000000000000000000000000000000000000000000000000000000001]\n"
99 |   expect_accept("y_number_double_close_to_zero.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:105:3-105:16:
    | ///|
    | test "json_testsuite y_number_int_with_exp" {
    |   let input = "[20e1]"
105 |   expect_accept("y_number_int_with_exp.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:111:3-111:16:
    | ///|
    | test "json_testsuite y_number_minus_zero" {
    |   let input = "[-0]"
111 |   expect_accept("y_number_minus_zero.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:117:3-117:16:
    | ///|
    | test "json_testsuite y_number_negative_int" {
    |   let input = "[-123]"
117 |   expect_accept("y_number_negative_int.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:123:3-123:16:
    | ///|
    | test "json_testsuite y_number_negative_one" {
    |   let input = "[-1]"
123 |   expect_accept("y_number_negative_one.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:129:3-129:16:
    | ///|
    | test "json_testsuite y_number_negative_zero" {
    |   let input = "[-0]"
129 |   expect_accept("y_number_negative_zero.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:135:3-135:16:
    | ///|
    | test "json_testsuite y_number_real_capital_e" {
    |   let input = "[1E22]"
135 |   expect_accept("y_number_real_capital_e.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:141:3-141:16:
    | ///|
    | test "json_testsuite y_number_real_capital_e_neg_exp" {
    |   let input = "[1E-2]"
141 |   expect_accept("y_number_real_capital_e_neg_exp.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:147:3-147:16:
    | ///|
    | test "json_testsuite y_number_real_capital_e_pos_exp" {
    |   let input = "[1E+2]"
147 |   expect_accept("y_number_real_capital_e_pos_exp.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:153:3-153:16:
    | ///|
    | test "json_testsuite y_number_real_exponent" {
    |   let input = "[123e45]"
153 |   expect_accept("y_number_real_exponent.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:159:3-159:16:
    | ///|
    | test "json_testsuite y_number_real_fraction_exponent" {
    |   let input = "[123.456e78]"
159 |   expect_accept("y_number_real_fraction_exponent.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:165:3-165:16:
    | ///|
    | test "json_testsuite y_number_real_neg_exp" {
    |   let input = "[1e-2]"
165 |   expect_accept("y_number_real_neg_exp.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:171:3-171:16:
    | ///|
    | test "json_testsuite y_number_real_pos_exponent" {
    |   let input = "[1e+2]"
171 |   expect_accept("y_number_real_pos_exponent.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:177:3-177:16:
    | ///|
    | test "json_testsuite y_number_simple_int" {
    |   let input = "[123]"
177 |   expect_accept("y_number_simple_int.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:183:3-183:16:
    | ///|
    | test "json_testsuite y_number_simple_real" {
    |   let input = "[123.456789]"
183 |   expect_accept("y_number_simple_real.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:189:3-189:16:
    | ///|
    | test "json_testsuite y_object" {
    |   let input = "{\"asd\":\"sdf\", \"dfg\":\"fgh\"}"
189 |   expect_accept("y_object.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:195:3-195:16:
    | ///|
    | test "json_testsuite y_object_basic" {
    |   let input = "{\"asd\":\"sdf\"}"
195 |   expect_accept("y_object_basic.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:201:3-201:16:
    | ///|
    | test "json_testsuite y_object_duplicated_key" {
    |   let input = "{\"a\":\"b\",\"a\":\"c\"}"
201 |   expect_accept("y_object_duplicated_key.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:207:3-207:16:
    | ///|
    | test "json_testsuite y_object_duplicated_key_and_value" {
    |   let input = "{\"a\":\"b\",\"a\":\"b\"}"
207 |   expect_accept("y_object_duplicated_key_and_value.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:213:3-213:16:
    | ///|
    | test "json_testsuite y_object_empty" {
    |   let input = "{}"
213 |   expect_accept("y_object_empty.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:219:3-219:16:
    | ///|
    | test "json_testsuite y_object_empty_key" {
    |   let input = "{\"\":0}"
219 |   expect_accept("y_object_empty_key.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:225:3-225:16:
    | ///|
    | test "json_testsuite y_object_escaped_null_in_key" {
    |   let input = "{\"foo\\u0000bar\": 42}"
225 |   expect_accept("y_object_escaped_null_in_key.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:231:3-231:16:
    | ///|
    | test "json_testsuite y_object_extreme_numbers" {
    |   let input = "{ \"min\": -1.0e+28, \"max\": 1.0e+28 }"
231 |   expect_accept("y_object_extreme_numbers.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:238:3-238:16:
    | test "json_testsuite y_object_long_strings" {
    |   let input = "{\"x\":[{\"id\": \"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\"}], \"id\": \"xxxxxxxxxxxxxxxxxxxxx" +
    |     "xxxxxxxxxxxxxxxxxxx\"}"
238 |   expect_accept("y_object_long_strings.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:244:3-244:16:
    | ///|
    | test "json_testsuite y_object_simple" {
    |   let input = "{\"a\":[]}"
244 |   expect_accept("y_object_simple.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:251:3-251:16:
    | test "json_testsuite y_object_string_unicode" {
    |   let input = "{\"title\":\"\\u041f\\u043e\\u043b\\u0442\\u043e\\u0440\\u0430 \\u0417\\u0435\\u043c\\u043b\\u04" +
    |     "35\\u043a\\u043e\\u043f\\u0430\" }"
251 |   expect_accept("y_object_string_unicode.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:257:3-257:16:
    | ///|
    | test "json_testsuite y_object_with_newlines" {
    |   let input = "{\n\"a\": \"b\"\n}"
257 |   expect_accept("y_object_with_newlines.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:263:3-263:16:
    | ///|
    | test "json_testsuite y_string_1_2_3_bytes_UTF-8_sequences" {
    |   let input = "[\"\\u0060\\u012a\\u12AB\"]"
263 |   expect_accept("y_string_1_2_3_bytes_UTF-8_sequences.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:269:3-269:16:
    | ///|
    | test "json_testsuite y_string_accepted_surrogate_pair" {
    |   let input = "[\"\\uD801\\udc37\"]"
269 |   expect_accept("y_string_accepted_surrogate_pair.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:275:3-275:16:
    | ///|
    | test "json_testsuite y_string_accepted_surrogate_pairs" {
    |   let input = "[\"\\ud83d\\ude39\\ud83d\\udc8d\"]"
275 |   expect_accept("y_string_accepted_surrogate_pairs.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:281:3-281:16:
    | ///|
    | test "json_testsuite y_string_allowed_escapes" {
    |   let input = "[\"\\\"\\\\\\/\\b\\f\\n\\r\\t\"]"
281 |   expect_accept("y_string_allowed_escapes.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:287:3-287:16:
    | ///|
    | test "json_testsuite y_string_backslash_and_u_escaped_zero" {
    |   let input = "[\"\\\\u0000\"]"
287 |   expect_accept("y_string_backslash_and_u_escaped_zero.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:293:3-293:16:
    | ///|
    | test "json_testsuite y_string_backslash_doublequotes" {
    |   let input = "[\"\\\"\"]"
293 |   expect_accept("y_string_backslash_doublequotes.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:299:3-299:16:
    | ///|
    | test "json_testsuite y_string_comments" {
    |   let input = "[\"a/*b*/c/*d//e\"]"
299 |   expect_accept("y_string_comments.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:305:3-305:16:
    | ///|
    | test "json_testsuite y_string_double_escape_a" {
    |   let input = "[\"\\\\a\"]"
305 |   expect_accept("y_string_double_escape_a.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:311:3-311:16:
    | ///|
    | test "json_testsuite y_string_double_escape_n" {
    |   let input = "[\"\\\\n\"]"
311 |   expect_accept("y_string_double_escape_n.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:317:3-317:16:
    | ///|
    | test "json_testsuite y_string_escaped_control_character" {
    |   let input = "[\"\\u0012\"]"
317 |   expect_accept("y_string_escaped_control_character.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:323:3-323:16:
    | ///|
    | test "json_testsuite y_string_escaped_noncharacter" {
    |   let input = "[\"\\uFFFF\"]"
323 |   expect_accept("y_string_escaped_noncharacter.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:329:3-329:16:
    | ///|
    | test "json_testsuite y_string_in_array" {
    |   let input = "[\"asd\"]"
329 |   expect_accept("y_string_in_array.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:335:3-335:16:
    | ///|
    | test "json_testsuite y_string_in_array_with_leading_space" {
    |   let input = "[ \"asd\"]"
335 |   expect_accept("y_string_in_array_with_leading_space.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:341:3-341:16:
    | ///|
    | test "json_testsuite y_string_last_surrogates_1_and_2" {
    |   let input = "[\"\\uDBFF\\uDFFF\"]"
341 |   expect_accept("y_string_last_surrogates_1_and_2.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:347:3-347:16:
    | ///|
    | test "json_testsuite y_string_nbsp_uescaped" {
    |   let input = "[\"new\\u00A0line\"]"
347 |   expect_accept("y_string_nbsp_uescaped.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:353:3-353:16:
    | ///|
    | test "json_testsuite y_string_nonCharacterInUTF-8_U+10FFFF" {
    |   let input = "[\"\u{10ffff}\"]"
353 |   expect_accept("y_string_nonCharacterInUTF-8_U+10FFFF.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:359:3-359:16:
    | ///|
    | test "json_testsuite y_string_nonCharacterInUTF-8_U+FFFF" {
    |   let input = "[\"\u{ffff}\"]"
359 |   expect_accept("y_string_nonCharacterInUTF-8_U+FFFF.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:365:3-365:16:
    | ///|
    | test "json_testsuite y_string_null_escape" {
    |   let input = "[\"\\u0000\"]"
365 |   expect_accept("y_string_null_escape.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:371:3-371:16:
    | ///|
    | test "json_testsuite y_string_one-byte-utf-8" {
    |   let input = "[\"\\u002c\"]"
371 |   expect_accept("y_string_one-byte-utf-8.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:377:3-377:16:
    | ///|
    | test "json_testsuite y_string_pi" {
    |   let input = "[\"\u{3c0}\"]"
377 |   expect_accept("y_string_pi.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:383:3-383:16:
    | ///|
    | test "json_testsuite y_string_reservedCharacterInUTF-8_U+1BFFF" {
    |   let input = "[\"\u{1bfff}\"]"
383 |   expect_accept("y_string_reservedCharacterInUTF-8_U+1BFFF.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:389:3-389:16:
    | ///|
    | test "json_testsuite y_string_simple_ascii" {
    |   let input = "[\"asd \"]"
389 |   expect_accept("y_string_simple_ascii.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:395:3-395:16:
    | ///|
    | test "json_testsuite y_string_space" {
    |   let input = "\" \""
395 |   expect_accept("y_string_space.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:401:3-401:16:
    | ///|
    | test "json_testsuite y_string_surrogates_U+1D11E_MUSICAL_SYMBOL_G_CLEF" {
    |   let input = "[\"\\uD834\\uDd1e\"]"
401 |   expect_accept("y_string_surrogates_U+1D11E_MUSICAL_SYMBOL_G_CLEF.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:407:3-407:16:
    | ///|
    | test "json_testsuite y_string_three-byte-utf-8" {
    |   let input = "[\"\\u0821\"]"
407 |   expect_accept("y_string_three-byte-utf-8.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:413:3-413:16:
    | ///|
    | test "json_testsuite y_string_two-byte-utf-8" {
    |   let input = "[\"\\u0123\"]"
413 |   expect_accept("y_string_two-byte-utf-8.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:419:3-419:16:
    | ///|
    | test "json_testsuite y_string_u+2028_line_sep" {
    |   let input = "[\"\u{2028}\"]"
419 |   expect_accept("y_string_u+2028_line_sep.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:425:3-425:16:
    | ///|
    | test "json_testsuite y_string_u+2029_par_sep" {
    |   let input = "[\"\u{2029}\"]"
425 |   expect_accept("y_string_u+2029_par_sep.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:431:3-431:16:
    | ///|
    | test "json_testsuite y_string_uEscape" {
    |   let input = "[\"\\u0061\\u30af\\u30EA\\u30b9\"]"
431 |   expect_accept("y_string_uEscape.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:437:3-437:16:
    | ///|
    | test "json_testsuite y_string_uescaped_newline" {
    |   let input = "[\"new\\u000Aline\"]"
437 |   expect_accept("y_string_uescaped_newline.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:443:3-443:16:
    | ///|
    | test "json_testsuite y_string_unescaped_char_delete" {
    |   let input = "[\"\u{7f}\"]"
443 |   expect_accept("y_string_unescaped_char_delete.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:449:3-449:16:
    | ///|
    | test "json_testsuite y_string_unicode" {
    |   let input = "[\"\\uA66D\"]"
449 |   expect_accept("y_string_unicode.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:455:3-455:16:
    | ///|
    | test "json_testsuite y_string_unicodeEscapedBackslash" {
    |   let input = "[\"\\u005C\"]"
455 |   expect_accept("y_string_unicodeEscapedBackslash.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:461:3-461:16:
    | ///|
    | test "json_testsuite y_string_unicode_2" {
    |   let input = "[\"\u{2342}\u{3234}\u{2342}\"]"
461 |   expect_accept("y_string_unicode_2.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:467:3-467:16:
    | ///|
    | test "json_testsuite y_string_unicode_U+10FFFE_nonchar" {
    |   let input = "[\"\\uDBFF\\uDFFE\"]"
467 |   expect_accept("y_string_unicode_U+10FFFE_nonchar.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:473:3-473:16:
    | ///|
    | test "json_testsuite y_string_unicode_U+1FFFE_nonchar" {
    |   let input = "[\"\\uD83F\\uDFFE\"]"
473 |   expect_accept("y_string_unicode_U+1FFFE_nonchar.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:479:3-479:16:
    | ///|
    | test "json_testsuite y_string_unicode_U+200B_ZERO_WIDTH_SPACE" {
    |   let input = "[\"\\u200B\"]"
479 |   expect_accept("y_string_unicode_U+200B_ZERO_WIDTH_SPACE.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:485:3-485:16:
    | ///|
    | test "json_testsuite y_string_unicode_U+2064_invisible_plus" {
    |   let input = "[\"\\u2064\"]"
485 |   expect_accept("y_string_unicode_U+2064_invisible_plus.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:491:3-491:16:
    | ///|
    | test "json_testsuite y_string_unicode_U+FDD0_nonchar" {
    |   let input = "[\"\\uFDD0\"]"
491 |   expect_accept("y_string_unicode_U+FDD0_nonchar.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:497:3-497:16:
    | ///|
    | test "json_testsuite y_string_unicode_U+FFFE_nonchar" {
    |   let input = "[\"\\uFFFE\"]"
497 |   expect_accept("y_string_unicode_U+FFFE_nonchar.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:503:3-503:16:
    | ///|
    | test "json_testsuite y_string_unicode_escaped_double_quote" {
    |   let input = "[\"\\u0022\"]"
503 |   expect_accept("y_string_unicode_escaped_double_quote.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:509:3-509:16:
    | ///|
    | test "json_testsuite y_string_utf8" {
    |   let input = "[\"\u{20ac}\u{1d11e}\"]"
509 |   expect_accept("y_string_utf8.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:515:3-515:16:
    | ///|
    | test "json_testsuite y_string_with_del_character" {
    |   let input = "[\"a\u{7f}a\"]"
515 |   expect_accept("y_string_with_del_character.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:521:3-521:16:
    | ///|
    | test "json_testsuite y_structure_lonely_false" {
    |   let input = "false"
521 |   expect_accept("y_structure_lonely_false.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:527:3-527:16:
    | ///|
    | test "json_testsuite y_structure_lonely_int" {
    |   let input = "42"
527 |   expect_accept("y_structure_lonely_int.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:533:3-533:16:
    | ///|
    | test "json_testsuite y_structure_lonely_negative_real" {
    |   let input = "-0.1"
533 |   expect_accept("y_structure_lonely_negative_real.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:539:3-539:16:
    | ///|
    | test "json_testsuite y_structure_lonely_null" {
    |   let input = "null"
539 |   expect_accept("y_structure_lonely_null.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:545:3-545:16:
    | ///|
    | test "json_testsuite y_structure_lonely_string" {
    |   let input = "\"asd\""
545 |   expect_accept("y_structure_lonely_string.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:551:3-551:16:
    | ///|
    | test "json_testsuite y_structure_lonely_true" {
    |   let input = "true"
551 |   expect_accept("y_structure_lonely_true.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:557:3-557:16:
    | ///|
    | test "json_testsuite y_structure_string_empty" {
    |   let input = "\"\""
557 |   expect_accept("y_structure_string_empty.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:563:3-563:16:
    | ///|
    | test "json_testsuite y_structure_trailing_newline" {
    |   let input = "[\"a\"]\n"
563 |   expect_accept("y_structure_trailing_newline.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:569:3-569:16:
    | ///|
    | test "json_testsuite y_structure_true_in_array" {
    |   let input = "[true]"
569 |   expect_accept("y_structure_true_in_array.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:575:3-575:16:
    | ///|
    | test "json_testsuite y_structure_whitespace_array" {
    |   let input = " [] "
575 |   expect_accept("y_structure_whitespace_array.json", input)
    |   ^^^^^^^^^^^^^
    | }

```
