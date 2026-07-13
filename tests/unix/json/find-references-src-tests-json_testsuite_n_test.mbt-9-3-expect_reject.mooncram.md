# json find-references expect_reject src/tests/json_testsuite_n_test.mbt:9:3

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/json" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide find-references 'expect_reject' --loc 'src/tests/json_testsuite_n_test.mbt:9:3'
Found 181 references for symbol 'expect_reject':
<WORKDIR>/src/tests/json_testsuite_helpers_test.mbt:16:4-16:17:
   | }
   | 
   | ///|
16 | fn expect_reject(name : String, input : String) -> Unit raise {
   |    ^^^^^^^^^^^^^
   |   try @json.decode(input) catch {
   |     @lib.ParseError(_) => () (escaped)

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:9:3-9:16:
  | ///|
  | test "json_testsuite n_array_1_true_without_comma" {
  |   let input = "[1 true]"
9 |   expect_reject("n_array_1_true_without_comma.json", input)
  |   ^^^^^^^^^^^^^
  | }
  | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:15:3-15:16:
   | ///|
   | test "json_testsuite n_array_colon_instead_of_comma" {
   |   let input = "[\"\": 1]"
15 |   expect_reject("n_array_colon_instead_of_comma.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:21:3-21:16:
   | ///|
   | test "json_testsuite n_array_comma_after_close" {
   |   let input = "[\"\"],"
21 |   expect_reject("n_array_comma_after_close.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:27:3-27:16:
   | ///|
   | test "json_testsuite n_array_comma_and_number" {
   |   let input = "[,1]"
27 |   expect_reject("n_array_comma_and_number.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:33:3-33:16:
   | ///|
   | test "json_testsuite n_array_double_comma" {
   |   let input = "[1,,2]"
33 |   expect_reject("n_array_double_comma.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:39:3-39:16:
   | ///|
   | test "json_testsuite n_array_double_extra_comma" {
   |   let input = "[\"x\",,]"
39 |   expect_reject("n_array_double_extra_comma.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:45:3-45:16:
   | ///|
   | test "json_testsuite n_array_extra_close" {
   |   let input = "[\"x\"]]"
45 |   expect_reject("n_array_extra_close.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:51:3-51:16:
   | ///|
   | test "json_testsuite n_array_extra_comma" {
   |   let input = "[\"\",]"
51 |   expect_reject("n_array_extra_comma.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:57:3-57:16:
   | ///|
   | test "json_testsuite n_array_incomplete" {
   |   let input = "[\"x\""
57 |   expect_reject("n_array_incomplete.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:63:3-63:16:
   | ///|
   | test "json_testsuite n_array_incomplete_invalid_value" {
   |   let input = "[x"
63 |   expect_reject("n_array_incomplete_invalid_value.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:69:3-69:16:
   | ///|
   | test "json_testsuite n_array_inner_array_no_comma" {
   |   let input = "[3[4]]"
69 |   expect_reject("n_array_inner_array_no_comma.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:75:3-75:16:
   | ///|
   | test "json_testsuite n_array_items_separated_by_semicolon" {
   |   let input = "[1:2]"
75 |   expect_reject("n_array_items_separated_by_semicolon.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:81:3-81:16:
   | ///|
   | test "json_testsuite n_array_just_comma" {
   |   let input = "[,]"
81 |   expect_reject("n_array_just_comma.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:87:3-87:16:
   | ///|
   | test "json_testsuite n_array_just_minus" {
   |   let input = "[-]"
87 |   expect_reject("n_array_just_minus.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:93:3-93:16:
   | ///|
   | test "json_testsuite n_array_missing_value" {
   |   let input = "[   , \"\"]"
93 |   expect_reject("n_array_missing_value.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:99:3-99:16:
   | ///|
   | test "json_testsuite n_array_newlines_unclosed" {
   |   let input = "[\"a\",\n4\n,1,"
99 |   expect_reject("n_array_newlines_unclosed.json", input)
   |   ^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:105:3-105:16:
    | ///|
    | test "json_testsuite n_array_number_and_comma" {
    |   let input = "[1,]"
105 |   expect_reject("n_array_number_and_comma.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:111:3-111:16:
    | ///|
    | test "json_testsuite n_array_number_and_several_commas" {
    |   let input = "[1,,]"
111 |   expect_reject("n_array_number_and_several_commas.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:117:3-117:16:
    | ///|
    | test "json_testsuite n_array_spaces_vertical_tab_formfeed" {
    |   let input = "[\"\u{b}a\"\\f]"
117 |   expect_reject("n_array_spaces_vertical_tab_formfeed.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:123:3-123:16:
    | ///|
    | test "json_testsuite n_array_star_inside" {
    |   let input = "[*]"
123 |   expect_reject("n_array_star_inside.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:129:3-129:16:
    | ///|
    | test "json_testsuite n_array_unclosed" {
    |   let input = "[\"\""
129 |   expect_reject("n_array_unclosed.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:135:3-135:16:
    | ///|
    | test "json_testsuite n_array_unclosed_trailing_comma" {
    |   let input = "[1,"
135 |   expect_reject("n_array_unclosed_trailing_comma.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:141:3-141:16:
    | ///|
    | test "json_testsuite n_array_unclosed_with_new_lines" {
    |   let input = "[1,\n1\n,1"
141 |   expect_reject("n_array_unclosed_with_new_lines.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:147:3-147:16:
    | ///|
    | test "json_testsuite n_array_unclosed_with_object_inside" {
    |   let input = "[{}"
147 |   expect_reject("n_array_unclosed_with_object_inside.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:153:3-153:16:
    | ///|
    | test "json_testsuite n_incomplete_false" {
    |   let input = "[fals]"
153 |   expect_reject("n_incomplete_false.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:159:3-159:16:
    | ///|
    | test "json_testsuite n_incomplete_null" {
    |   let input = "[nul]"
159 |   expect_reject("n_incomplete_null.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:165:3-165:16:
    | ///|
    | test "json_testsuite n_incomplete_true" {
    |   let input = "[tru]"
165 |   expect_reject("n_incomplete_true.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:171:3-171:16:
    | ///|
    | test "json_testsuite n_multidigit_number_then_00" {
    |   let input = "123\u{0}"
171 |   expect_reject("n_multidigit_number_then_00.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:177:3-177:16:
    | ///|
    | test "json_testsuite n_number_++" {
    |   let input = "[++1234]"
177 |   expect_reject("n_number_++.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:183:3-183:16:
    | ///|
    | test "json_testsuite n_number_+1" {
    |   let input = "[+1]"
183 |   expect_reject("n_number_+1.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:189:3-189:16:
    | ///|
    | test "json_testsuite n_number_+Inf" {
    |   let input = "[+Inf]"
189 |   expect_reject("n_number_+Inf.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:195:3-195:16:
    | ///|
    | test "json_testsuite n_number_-01" {
    |   let input = "[-01]"
195 |   expect_reject("n_number_-01.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:201:3-201:16:
    | ///|
    | test "json_testsuite n_number_-1.0." {
    |   let input = "[-1.0.]"
201 |   expect_reject("n_number_-1.0..json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:207:3-207:16:
    | ///|
    | test "json_testsuite n_number_-2." {
    |   let input = "[-2.]"
207 |   expect_reject("n_number_-2..json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:213:3-213:16:
    | ///|
    | test "json_testsuite n_number_-NaN" {
    |   let input = "[-NaN]"
213 |   expect_reject("n_number_-NaN.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:219:3-219:16:
    | ///|
    | test "json_testsuite n_number_.-1" {
    |   let input = "[.-1]"
219 |   expect_reject("n_number_.-1.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:225:3-225:16:
    | ///|
    | test "json_testsuite n_number_.2e-3" {
    |   let input = "[.2e-3]"
225 |   expect_reject("n_number_.2e-3.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:231:3-231:16:
    | ///|
    | test "json_testsuite n_number_0.1.2" {
    |   let input = "[0.1.2]"
231 |   expect_reject("n_number_0.1.2.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:237:3-237:16:
    | ///|
    | test "json_testsuite n_number_0.3e+" {
    |   let input = "[0.3e+]"
237 |   expect_reject("n_number_0.3e+.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:243:3-243:16:
    | ///|
    | test "json_testsuite n_number_0.3e" {
    |   let input = "[0.3e]"
243 |   expect_reject("n_number_0.3e.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:249:3-249:16:
    | ///|
    | test "json_testsuite n_number_0.e1" {
    |   let input = "[0.e1]"
249 |   expect_reject("n_number_0.e1.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:255:3-255:16:
    | ///|
    | test "json_testsuite n_number_0_capital_E+" {
    |   let input = "[0E+]"
255 |   expect_reject("n_number_0_capital_E+.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:261:3-261:16:
    | ///|
    | test "json_testsuite n_number_0_capital_E" {
    |   let input = "[0E]"
261 |   expect_reject("n_number_0_capital_E.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:267:3-267:16:
    | ///|
    | test "json_testsuite n_number_0e+" {
    |   let input = "[0e+]"
267 |   expect_reject("n_number_0e+.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:273:3-273:16:
    | ///|
    | test "json_testsuite n_number_0e" {
    |   let input = "[0e]"
273 |   expect_reject("n_number_0e.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:279:3-279:16:
    | ///|
    | test "json_testsuite n_number_1.0e+" {
    |   let input = "[1.0e+]"
279 |   expect_reject("n_number_1.0e+.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:285:3-285:16:
    | ///|
    | test "json_testsuite n_number_1.0e-" {
    |   let input = "[1.0e-]"
285 |   expect_reject("n_number_1.0e-.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:291:3-291:16:
    | ///|
    | test "json_testsuite n_number_1.0e" {
    |   let input = "[1.0e]"
291 |   expect_reject("n_number_1.0e.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:297:3-297:16:
    | ///|
    | test "json_testsuite n_number_1_000" {
    |   let input = "[1 000.0]"
297 |   expect_reject("n_number_1_000.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:303:3-303:16:
    | ///|
    | test "json_testsuite n_number_1eE2" {
    |   let input = "[1eE2]"
303 |   expect_reject("n_number_1eE2.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:309:3-309:16:
    | ///|
    | test "json_testsuite n_number_2.e+3" {
    |   let input = "[2.e+3]"
309 |   expect_reject("n_number_2.e+3.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:315:3-315:16:
    | ///|
    | test "json_testsuite n_number_2.e-3" {
    |   let input = "[2.e-3]"
315 |   expect_reject("n_number_2.e-3.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:321:3-321:16:
    | ///|
    | test "json_testsuite n_number_2.e3" {
    |   let input = "[2.e3]"
321 |   expect_reject("n_number_2.e3.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:327:3-327:16:
    | ///|
    | test "json_testsuite n_number_9.e+" {
    |   let input = "[9.e+]"
327 |   expect_reject("n_number_9.e+.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:333:3-333:16:
    | ///|
    | test "json_testsuite n_number_Inf" {
    |   let input = "[Inf]"
333 |   expect_reject("n_number_Inf.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:339:3-339:16:
    | ///|
    | test "json_testsuite n_number_NaN" {
    |   let input = "[NaN]"
339 |   expect_reject("n_number_NaN.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:345:3-345:16:
    | ///|
    | test "json_testsuite n_number_U+FF11_fullwidth_digit_one" {
    |   let input = "[\u{ff11}]"
345 |   expect_reject("n_number_U+FF11_fullwidth_digit_one.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:351:3-351:16:
    | ///|
    | test "json_testsuite n_number_expression" {
    |   let input = "[1+2]"
351 |   expect_reject("n_number_expression.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:357:3-357:16:
    | ///|
    | test "json_testsuite n_number_hex_1_digit" {
    |   let input = "[0x1]"
357 |   expect_reject("n_number_hex_1_digit.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:363:3-363:16:
    | ///|
    | test "json_testsuite n_number_hex_2_digits" {
    |   let input = "[0x42]"
363 |   expect_reject("n_number_hex_2_digits.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:369:3-369:16:
    | ///|
    | test "json_testsuite n_number_infinity" {
    |   let input = "[Infinity]"
369 |   expect_reject("n_number_infinity.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:375:3-375:16:
    | ///|
    | test "json_testsuite n_number_invalid+-" {
    |   let input = "[0e+-1]"
375 |   expect_reject("n_number_invalid+-.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:381:3-381:16:
    | ///|
    | test "json_testsuite n_number_invalid-negative-real" {
    |   let input = "[-123.123foo]"
381 |   expect_reject("n_number_invalid-negative-real.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:387:3-387:16:
    | ///|
    | test "json_testsuite n_number_minus_infinity" {
    |   let input = "[-Infinity]"
387 |   expect_reject("n_number_minus_infinity.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:393:3-393:16:
    | ///|
    | test "json_testsuite n_number_minus_sign_with_trailing_garbage" {
    |   let input = "[-foo]"
393 |   expect_reject("n_number_minus_sign_with_trailing_garbage.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:399:3-399:16:
    | ///|
    | test "json_testsuite n_number_minus_space_1" {
    |   let input = "[- 1]"
399 |   expect_reject("n_number_minus_space_1.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:405:3-405:16:
    | ///|
    | test "json_testsuite n_number_neg_int_starting_with_zero" {
    |   let input = "[-012]"
405 |   expect_reject("n_number_neg_int_starting_with_zero.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:411:3-411:16:
    | ///|
    | test "json_testsuite n_number_neg_real_without_int_part" {
    |   let input = "[-.123]"
411 |   expect_reject("n_number_neg_real_without_int_part.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:417:3-417:16:
    | ///|
    | test "json_testsuite n_number_neg_with_garbage_at_end" {
    |   let input = "[-1x]"
417 |   expect_reject("n_number_neg_with_garbage_at_end.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:423:3-423:16:
    | ///|
    | test "json_testsuite n_number_real_garbage_after_e" {
    |   let input = "[1ea]"
423 |   expect_reject("n_number_real_garbage_after_e.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:429:3-429:16:
    | ///|
    | test "json_testsuite n_number_real_without_fractional_part" {
    |   let input = "[1.]"
429 |   expect_reject("n_number_real_without_fractional_part.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:435:3-435:16:
    | ///|
    | test "json_testsuite n_number_starting_with_dot" {
    |   let input = "[.123]"
435 |   expect_reject("n_number_starting_with_dot.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:441:3-441:16:
    | ///|
    | test "json_testsuite n_number_with_alpha" {
    |   let input = "[1.2a-3]"
441 |   expect_reject("n_number_with_alpha.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:447:3-447:16:
    | ///|
    | test "json_testsuite n_number_with_alpha_char" {
    |   let input = "[1.8011670033376514H-308]"
447 |   expect_reject("n_number_with_alpha_char.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:453:3-453:16:
    | ///|
    | test "json_testsuite n_number_with_leading_zero" {
    |   let input = "[012]"
453 |   expect_reject("n_number_with_leading_zero.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:459:3-459:16:
    | ///|
    | test "json_testsuite n_object_bad_value" {
    |   let input = "[\"x\", truth]"
459 |   expect_reject("n_object_bad_value.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:465:3-465:16:
    | ///|
    | test "json_testsuite n_object_bracket_key" {
    |   let input = "{[: \"x\"}\n"
465 |   expect_reject("n_object_bracket_key.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:471:3-471:16:
    | ///|
    | test "json_testsuite n_object_comma_instead_of_colon" {
    |   let input = "{\"x\", null}"
471 |   expect_reject("n_object_comma_instead_of_colon.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:477:3-477:16:
    | ///|
    | test "json_testsuite n_object_double_colon" {
    |   let input = "{\"x\"::\"b\"}"
477 |   expect_reject("n_object_double_colon.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:483:3-483:16:
    | ///|
    | test "json_testsuite n_object_emoji" {
    |   let input = "{\u{1f1e8}\u{1f1ed}}"
483 |   expect_reject("n_object_emoji.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:489:3-489:16:
    | ///|
    | test "json_testsuite n_object_garbage_at_end" {
    |   let input = "{\"a\":\"a\" 123}"
489 |   expect_reject("n_object_garbage_at_end.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:495:3-495:16:
    | ///|
    | test "json_testsuite n_object_key_with_single_quotes" {
    |   let input = "{key: 'value'}"
495 |   expect_reject("n_object_key_with_single_quotes.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:501:3-501:16:
    | ///|
    | test "json_testsuite n_object_missing_colon" {
    |   let input = "{\"a\" b}"
501 |   expect_reject("n_object_missing_colon.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:507:3-507:16:
    | ///|
    | test "json_testsuite n_object_missing_key" {
    |   let input = "{:\"b\"}"
507 |   expect_reject("n_object_missing_key.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:513:3-513:16:
    | ///|
    | test "json_testsuite n_object_missing_semicolon" {
    |   let input = "{\"a\" \"b\"}"
513 |   expect_reject("n_object_missing_semicolon.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:519:3-519:16:
    | ///|
    | test "json_testsuite n_object_missing_value" {
    |   let input = "{\"a\":"
519 |   expect_reject("n_object_missing_value.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:525:3-525:16:
    | ///|
    | test "json_testsuite n_object_no-colon" {
    |   let input = "{\"a\""
525 |   expect_reject("n_object_no-colon.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:531:3-531:16:
    | ///|
    | test "json_testsuite n_object_non_string_key" {
    |   let input = "{1:1}"
531 |   expect_reject("n_object_non_string_key.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:537:3-537:16:
    | ///|
    | test "json_testsuite n_object_non_string_key_but_huge_number_instead" {
    |   let input = "{9999E9999:1}"
537 |   expect_reject("n_object_non_string_key_but_huge_number_instead.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:543:3-543:16:
    | ///|
    | test "json_testsuite n_object_repeated_null_null" {
    |   let input = "{null:null,null:null}"
543 |   expect_reject("n_object_repeated_null_null.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:549:3-549:16:
    | ///|
    | test "json_testsuite n_object_several_trailing_commas" {
    |   let input = "{\"id\":0,,,,,}"
549 |   expect_reject("n_object_several_trailing_commas.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:555:3-555:16:
    | ///|
    | test "json_testsuite n_object_single_quote" {
    |   let input = "{'a':0}"
555 |   expect_reject("n_object_single_quote.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:561:3-561:16:
    | ///|
    | test "json_testsuite n_object_trailing_comma" {
    |   let input = "{\"id\":0,}"
561 |   expect_reject("n_object_trailing_comma.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:567:3-567:16:
    | ///|
    | test "json_testsuite n_object_trailing_comment" {
    |   let input = "{\"a\":\"b\"}/**/"
567 |   expect_reject("n_object_trailing_comment.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:573:3-573:16:
    | ///|
    | test "json_testsuite n_object_trailing_comment_open" {
    |   let input = "{\"a\":\"b\"}/**//"
573 |   expect_reject("n_object_trailing_comment_open.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:579:3-579:16:
    | ///|
    | test "json_testsuite n_object_trailing_comment_slash_open" {
    |   let input = "{\"a\":\"b\"}//"
579 |   expect_reject("n_object_trailing_comment_slash_open.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:585:3-585:16:
    | ///|
    | test "json_testsuite n_object_trailing_comment_slash_open_incomplete" {
    |   let input = "{\"a\":\"b\"}/"
585 |   expect_reject("n_object_trailing_comment_slash_open_incomplete.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:591:3-591:16:
    | ///|
    | test "json_testsuite n_object_two_commas_in_a_row" {
    |   let input = "{\"a\":\"b\",,\"c\":\"d\"}"
591 |   expect_reject("n_object_two_commas_in_a_row.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:597:3-597:16:
    | ///|
    | test "json_testsuite n_object_unquoted_key" {
    |   let input = "{a: \"b\"}"
597 |   expect_reject("n_object_unquoted_key.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:603:3-603:16:
    | ///|
    | test "json_testsuite n_object_unterminated-value" {
    |   let input = "{\"a\":\"a"
603 |   expect_reject("n_object_unterminated-value.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:609:3-609:16:
    | ///|
    | test "json_testsuite n_object_with_single_string" {
    |   let input = "{ \"foo\" : \"bar\", \"a\" }"
609 |   expect_reject("n_object_with_single_string.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:615:3-615:16:
    | ///|
    | test "json_testsuite n_object_with_trailing_garbage" {
    |   let input = "{\"a\":\"b\"}#"
615 |   expect_reject("n_object_with_trailing_garbage.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:621:3-621:16:
    | ///|
    | test "json_testsuite n_single_space" {
    |   let input = " "
621 |   expect_reject("n_single_space.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:627:3-627:16:
    | ///|
    | test "json_testsuite n_string_1_surrogate_then_escape" {
    |   let input = "[\"\\uD800\\\"]"
627 |   expect_reject("n_string_1_surrogate_then_escape.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:633:3-633:16:
    | ///|
    | test "json_testsuite n_string_1_surrogate_then_escape_u" {
    |   let input = "[\"\\uD800\\u\"]"
633 |   expect_reject("n_string_1_surrogate_then_escape_u.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:639:3-639:16:
    | ///|
    | test "json_testsuite n_string_1_surrogate_then_escape_u1" {
    |   let input = "[\"\\uD800\\u1\"]"
639 |   expect_reject("n_string_1_surrogate_then_escape_u1.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:645:3-645:16:
    | ///|
    | test "json_testsuite n_string_1_surrogate_then_escape_u1x" {
    |   let input = "[\"\\uD800\\u1x\"]"
645 |   expect_reject("n_string_1_surrogate_then_escape_u1x.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:651:3-651:16:
    | ///|
    | test "json_testsuite n_string_accentuated_char_no_quotes" {
    |   let input = "[\u{e9}]"
651 |   expect_reject("n_string_accentuated_char_no_quotes.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:657:3-657:16:
    | ///|
    | test "json_testsuite n_string_backslash_00" {
    |   let input = "[\"\\\u{0}\"]"
657 |   expect_reject("n_string_backslash_00.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:663:3-663:16:
    | ///|
    | test "json_testsuite n_string_escape_x" {
    |   let input = "[\"\\x00\"]"
663 |   expect_reject("n_string_escape_x.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:669:3-669:16:
    | ///|
    | test "json_testsuite n_string_escaped_backslash_bad" {
    |   let input = "[\"\\\\\\\"]"
669 |   expect_reject("n_string_escaped_backslash_bad.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:675:3-675:16:
    | ///|
    | test "json_testsuite n_string_escaped_ctrl_char_tab" {
    |   let input = "[\"\\\t\"]"
675 |   expect_reject("n_string_escaped_ctrl_char_tab.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:681:3-681:16:
    | ///|
    | test "json_testsuite n_string_escaped_emoji" {
    |   let input = "[\"\\\u{1f300}\"]"
681 |   expect_reject("n_string_escaped_emoji.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:687:3-687:16:
    | ///|
    | test "json_testsuite n_string_incomplete_escape" {
    |   let input = "[\"\\\"]"
687 |   expect_reject("n_string_incomplete_escape.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:693:3-693:16:
    | ///|
    | test "json_testsuite n_string_incomplete_escaped_character" {
    |   let input = "[\"\\u00A\"]"
693 |   expect_reject("n_string_incomplete_escaped_character.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:699:3-699:16:
    | ///|
    | test "json_testsuite n_string_incomplete_surrogate" {
    |   let input = "[\"\\uD834\\uDd\"]"
699 |   expect_reject("n_string_incomplete_surrogate.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:705:3-705:16:
    | ///|
    | test "json_testsuite n_string_incomplete_surrogate_escape_invalid" {
    |   let input = "[\"\\uD800\\uD800\\x\"]"
705 |   expect_reject("n_string_incomplete_surrogate_escape_invalid.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:711:3-711:16:
    | ///|
    | test "json_testsuite n_string_invalid_backslash_esc" {
    |   let input = "[\"\\a\"]"
711 |   expect_reject("n_string_invalid_backslash_esc.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:717:3-717:16:
    | ///|
    | test "json_testsuite n_string_invalid_unicode_escape" {
    |   let input = "[\"\\uqqqq\"]"
717 |   expect_reject("n_string_invalid_unicode_escape.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:723:3-723:16:
    | ///|
    | test "json_testsuite n_string_leading_uescaped_thinspace" {
    |   let input = "[\\u0020\"asd\"]"
723 |   expect_reject("n_string_leading_uescaped_thinspace.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:729:3-729:16:
    | ///|
    | test "json_testsuite n_string_no_quotes_with_bad_escape" {
    |   let input = "[\\n]"
729 |   expect_reject("n_string_no_quotes_with_bad_escape.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:735:3-735:16:
    | ///|
    | test "json_testsuite n_string_single_doublequote" {
    |   let input = "\""
735 |   expect_reject("n_string_single_doublequote.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:741:3-741:16:
    | ///|
    | test "json_testsuite n_string_single_quote" {
    |   let input = "['single quote']"
741 |   expect_reject("n_string_single_quote.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:747:3-747:16:
    | ///|
    | test "json_testsuite n_string_single_string_no_double_quotes" {
    |   let input = "abc"
747 |   expect_reject("n_string_single_string_no_double_quotes.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:753:3-753:16:
    | ///|
    | test "json_testsuite n_string_start_escape_unclosed" {
    |   let input = "[\"\\"
753 |   expect_reject("n_string_start_escape_unclosed.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:759:3-759:16:
    | ///|
    | test "json_testsuite n_string_unescaped_ctrl_char" {
    |   let input = "[\"a\u{0}a\"]"
759 |   expect_reject("n_string_unescaped_ctrl_char.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:765:3-765:16:
    | ///|
    | test "json_testsuite n_string_unescaped_newline" {
    |   let input = "[\"new\nline\"]"
765 |   expect_reject("n_string_unescaped_newline.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:771:3-771:16:
    | ///|
    | test "json_testsuite n_string_unescaped_tab" {
    |   let input = "[\"\t\"]"
771 |   expect_reject("n_string_unescaped_tab.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:777:3-777:16:
    | ///|
    | test "json_testsuite n_string_unicode_CapitalU" {
    |   let input = "\"\\UA66D\""
777 |   expect_reject("n_string_unicode_CapitalU.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:783:3-783:16:
    | ///|
    | test "json_testsuite n_string_with_trailing_garbage" {
    |   let input = "\"\"x"
783 |   expect_reject("n_string_with_trailing_garbage.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:789:3-789:16:
    | ///|
    | test "json_testsuite n_structure_U+2060_word_joined" {
    |   let input = "[\u{2060}]"
789 |   expect_reject("n_structure_U+2060_word_joined.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:795:3-795:16:
    | ///|
    | test "json_testsuite n_structure_UTF8_BOM_no_data" {
    |   let input = "\u{feff}"
795 |   expect_reject("n_structure_UTF8_BOM_no_data.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:801:3-801:16:
    | ///|
    | test "json_testsuite n_structure_angle_bracket_." {
    |   let input = "<.>"
801 |   expect_reject("n_structure_angle_bracket_..json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:807:3-807:16:
    | ///|
    | test "json_testsuite n_structure_angle_bracket_null" {
    |   let input = "[<null>]"
807 |   expect_reject("n_structure_angle_bracket_null.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:813:3-813:16:
    | ///|
    | test "json_testsuite n_structure_array_trailing_garbage" {
    |   let input = "[1]x"
813 |   expect_reject("n_structure_array_trailing_garbage.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:819:3-819:16:
    | ///|
    | test "json_testsuite n_structure_array_with_extra_array_close" {
    |   let input = "[1]]"
819 |   expect_reject("n_structure_array_with_extra_array_close.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:825:3-825:16:
    | ///|
    | test "json_testsuite n_structure_array_with_unclosed_string" {
    |   let input = "[\"asd]"
825 |   expect_reject("n_structure_array_with_unclosed_string.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:831:3-831:16:
    | ///|
    | test "json_testsuite n_structure_ascii-unicode-identifier" {
    |   let input = "a\u{e5}"
831 |   expect_reject("n_structure_ascii-unicode-identifier.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:837:3-837:16:
    | ///|
    | test "json_testsuite n_structure_capitalized_True" {
    |   let input = "[True]"
837 |   expect_reject("n_structure_capitalized_True.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:843:3-843:16:
    | ///|
    | test "json_testsuite n_structure_close_unopened_array" {
    |   let input = "1]"
843 |   expect_reject("n_structure_close_unopened_array.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:849:3-849:16:
    | ///|
    | test "json_testsuite n_structure_comma_instead_of_closing_brace" {
    |   let input = "{\"x\": true,"
849 |   expect_reject("n_structure_comma_instead_of_closing_brace.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:855:3-855:16:
    | ///|
    | test "json_testsuite n_structure_double_array" {
    |   let input = "[][]"
855 |   expect_reject("n_structure_double_array.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:861:3-861:16:
    | ///|
    | test "json_testsuite n_structure_end_array" {
    |   let input = "]"
861 |   expect_reject("n_structure_end_array.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:867:3-867:16:
    | ///|
    | test "json_testsuite n_structure_lone-open-bracket" {
    |   let input = "["
867 |   expect_reject("n_structure_lone-open-bracket.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:873:3-873:16:
    | ///|
    | test "json_testsuite n_structure_no_data" {
    |   let input = ""
873 |   expect_reject("n_structure_no_data.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:879:3-879:16:
    | ///|
    | test "json_testsuite n_structure_null-byte-outside-string" {
    |   let input = "[\u{0}]"
879 |   expect_reject("n_structure_null-byte-outside-string.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:885:3-885:16:
    | ///|
    | test "json_testsuite n_structure_number_with_trailing_garbage" {
    |   let input = "2@"
885 |   expect_reject("n_structure_number_with_trailing_garbage.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:891:3-891:16:
    | ///|
    | test "json_testsuite n_structure_object_followed_by_closing_object" {
    |   let input = "{}}"
891 |   expect_reject("n_structure_object_followed_by_closing_object.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:897:3-897:16:
    | ///|
    | test "json_testsuite n_structure_object_unclosed_no_value" {
    |   let input = "{\"\":"
897 |   expect_reject("n_structure_object_unclosed_no_value.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:903:3-903:16:
    | ///|
    | test "json_testsuite n_structure_object_with_comment" {
    |   let input = "{\"a\":/*comment*/\"b\"}"
903 |   expect_reject("n_structure_object_with_comment.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:909:3-909:16:
    | ///|
    | test "json_testsuite n_structure_object_with_trailing_garbage" {
    |   let input = "{\"a\": true} \"x\""
909 |   expect_reject("n_structure_object_with_trailing_garbage.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:915:3-915:16:
    | ///|
    | test "json_testsuite n_structure_open_array_apostrophe" {
    |   let input = "['"
915 |   expect_reject("n_structure_open_array_apostrophe.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:921:3-921:16:
    | ///|
    | test "json_testsuite n_structure_open_array_comma" {
    |   let input = "[,"
921 |   expect_reject("n_structure_open_array_comma.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:927:3-927:16:
    | ///|
    | test "json_testsuite n_structure_open_array_open_object" {
    |   let input = "[{"
927 |   expect_reject("n_structure_open_array_open_object.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:933:3-933:16:
    | ///|
    | test "json_testsuite n_structure_open_array_open_string" {
    |   let input = "[\"a"
933 |   expect_reject("n_structure_open_array_open_string.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:939:3-939:16:
    | ///|
    | test "json_testsuite n_structure_open_array_string" {
    |   let input = "[\"a\""
939 |   expect_reject("n_structure_open_array_string.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:945:3-945:16:
    | ///|
    | test "json_testsuite n_structure_open_object" {
    |   let input = "{"
945 |   expect_reject("n_structure_open_object.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:951:3-951:16:
    | ///|
    | test "json_testsuite n_structure_open_object_close_array" {
    |   let input = "{]"
951 |   expect_reject("n_structure_open_object_close_array.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:957:3-957:16:
    | ///|
    | test "json_testsuite n_structure_open_object_comma" {
    |   let input = "{,"
957 |   expect_reject("n_structure_open_object_comma.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:963:3-963:16:
    | ///|
    | test "json_testsuite n_structure_open_object_open_array" {
    |   let input = "{["
963 |   expect_reject("n_structure_open_object_open_array.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:969:3-969:16:
    | ///|
    | test "json_testsuite n_structure_open_object_open_string" {
    |   let input = "{\"a"
969 |   expect_reject("n_structure_open_object_open_string.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:975:3-975:16:
    | ///|
    | test "json_testsuite n_structure_open_object_string_with_apostrophes" {
    |   let input = "{'a'"
975 |   expect_reject("n_structure_open_object_string_with_apostrophes.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:981:3-981:16:
    | ///|
    | test "json_testsuite n_structure_open_open" {
    |   let input = "[\"\\{[\"\\{[\"\\{[\"\\{"
981 |   expect_reject("n_structure_open_open.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:987:3-987:16:
    | ///|
    | test "json_testsuite n_structure_single_star" {
    |   let input = "*"
987 |   expect_reject("n_structure_single_star.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:993:3-993:16:
    | ///|
    | test "json_testsuite n_structure_trailing_#" {
    |   let input = "{\"a\":\"b\"}#{}"
993 |   expect_reject("n_structure_trailing_#.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:999:3-999:16:
    | ///|
    | test "json_testsuite n_structure_uescaped_LF_before_string" {
    |   let input = "[\\u000A\"\"]"
999 |   expect_reject("n_structure_uescaped_LF_before_string.json", input)
    |   ^^^^^^^^^^^^^
    | }
    | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:1005:3-1005:16:
     | ///|
     | test "json_testsuite n_structure_unclosed_array" {
     |   let input = "[1"
1005 |   expect_reject("n_structure_unclosed_array.json", input)
     |   ^^^^^^^^^^^^^
     | }
     | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:1011:3-1011:16:
     | ///|
     | test "json_testsuite n_structure_unclosed_array_partial_null" {
     |   let input = "[ false, nul"
1011 |   expect_reject("n_structure_unclosed_array_partial_null.json", input)
     |   ^^^^^^^^^^^^^
     | }
     | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:1017:3-1017:16:
     | ///|
     | test "json_testsuite n_structure_unclosed_array_unfinished_false" {
     |   let input = "[ true, fals"
1017 |   expect_reject("n_structure_unclosed_array_unfinished_false.json", input)
     |   ^^^^^^^^^^^^^
     | }
     | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:1023:3-1023:16:
     | ///|
     | test "json_testsuite n_structure_unclosed_array_unfinished_true" {
     |   let input = "[ false, tru"
1023 |   expect_reject("n_structure_unclosed_array_unfinished_true.json", input)
     |   ^^^^^^^^^^^^^
     | }
     | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:1029:3-1029:16:
     | ///|
     | test "json_testsuite n_structure_unclosed_object" {
     |   let input = "{\"asd\":\"asd\""
1029 |   expect_reject("n_structure_unclosed_object.json", input)
     |   ^^^^^^^^^^^^^
     | }
     | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:1035:3-1035:16:
     | ///|
     | test "json_testsuite n_structure_unicode-identifier" {
     |   let input = "\u{e5}"
1035 |   expect_reject("n_structure_unicode-identifier.json", input)
     |   ^^^^^^^^^^^^^
     | }
     | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:1041:3-1041:16:
     | ///|
     | test "json_testsuite n_structure_whitespace_U+2060_word_joiner" {
     |   let input = "[\u{2060}]"
1041 |   expect_reject("n_structure_whitespace_U+2060_word_joiner.json", input)
     |   ^^^^^^^^^^^^^
     | }
     | 

<WORKDIR>/src/tests/json_testsuite_n_test.mbt:1047:3-1047:16:
     | ///|
     | test "json_testsuite n_structure_whitespace_formfeed" {
     |   let input = "[\u{0c}]"
1047 |   expect_reject("n_structure_whitespace_formfeed.json", input)
     |   ^^^^^^^^^^^^^
     | }

<WORKDIR>/src/tests/json_value_semantics_test.mbt:44:3-44:16:
   | 
   | ///|
   | test "json value semantics invalid string escapes are parser errors" {
44 |   expect_reject("manual invalid escape", "\"\\x\"")
   |   ^^^^^^^^^^^^^
   |   expect_reject("manual unescaped newline", "\"a\nb\"")
   |   expect_reject("manual unescaped tab", "\"\t\"")

<WORKDIR>/src/tests/json_value_semantics_test.mbt:45:3-45:16:
   | ///|
   | test "json value semantics invalid string escapes are parser errors" {
   |   expect_reject("manual invalid escape", "\"\\x\"")
45 |   expect_reject("manual unescaped newline", "\"a\nb\"")
   |   ^^^^^^^^^^^^^
   |   expect_reject("manual unescaped tab", "\"\t\"")
   |   expect_reject("manual unescaped nul", "\"\u{0}\"")

<WORKDIR>/src/tests/json_value_semantics_test.mbt:46:3-46:16:
   | test "json value semantics invalid string escapes are parser errors" {
   |   expect_reject("manual invalid escape", "\"\\x\"")
   |   expect_reject("manual unescaped newline", "\"a\nb\"")
46 |   expect_reject("manual unescaped tab", "\"\t\"")
   |   ^^^^^^^^^^^^^
   |   expect_reject("manual unescaped nul", "\"\u{0}\"")
   |   expect_reject("manual lone high surrogate", "\"\\uD834\"")

<WORKDIR>/src/tests/json_value_semantics_test.mbt:47:3-47:16:
   |   expect_reject("manual invalid escape", "\"\\x\"")
   |   expect_reject("manual unescaped newline", "\"a\nb\"")
   |   expect_reject("manual unescaped tab", "\"\t\"")
47 |   expect_reject("manual unescaped nul", "\"\u{0}\"")
   |   ^^^^^^^^^^^^^
   |   expect_reject("manual lone high surrogate", "\"\\uD834\"")
   |   expect_reject("manual lone low surrogate", "\"\\uDD1E\"")

<WORKDIR>/src/tests/json_value_semantics_test.mbt:48:3-48:16:
   |   expect_reject("manual unescaped newline", "\"a\nb\"")
   |   expect_reject("manual unescaped tab", "\"\t\"")
   |   expect_reject("manual unescaped nul", "\"\u{0}\"")
48 |   expect_reject("manual lone high surrogate", "\"\\uD834\"")
   |   ^^^^^^^^^^^^^
   |   expect_reject("manual lone low surrogate", "\"\\uDD1E\"")
   | }

<WORKDIR>/src/tests/json_value_semantics_test.mbt:49:3-49:16:
   |   expect_reject("manual unescaped tab", "\"\t\"")
   |   expect_reject("manual unescaped nul", "\"\u{0}\"")
   |   expect_reject("manual lone high surrogate", "\"\\uD834\"")
49 |   expect_reject("manual lone low surrogate", "\"\\uDD1E\"")
   |   ^^^^^^^^^^^^^
   | }

```
