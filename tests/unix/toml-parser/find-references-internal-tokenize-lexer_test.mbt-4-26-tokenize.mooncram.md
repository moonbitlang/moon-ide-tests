# toml-parser find-references tokenize internal/tokenize/lexer_test.mbt:4:26

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
$ run_moon_ide moon ide find-references 'tokenize' --loc 'internal/tokenize/lexer_test.mbt:4:26'
Found 161 references for symbol 'tokenize':
<WORKDIR>/coverage_improvement_test.mbt:72:26-72:34:
   | ///|
   | test "test tokenizer unreachable path coverage" {
   |   // This is trying to hit the unreachable else branch in tokenize function
72 |   let tokens = @tokenize.tokenize(
   |                          ^^^^^^^^
   |     (
   |       #|simple = true

<WORKDIR>/coverage_improvement_test.mbt:101:15-101:23:
    |   // Try to trigger integer parsing errors
    | 
    |   let tokens = try
101 |     @tokenize.tokenize("huge = 999999999999999999999999999999999999999")
    |               ^^^^^^^^
    |   catch {
    |     err => Err(err)

<WORKDIR>/coverage_improvement_test.mbt:117:26-117:34:
    | 
    | ///|
    | test "test literal string handling" {
117 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|literal = 'this is a literal string'

<WORKDIR>/coverage_improvement_test.mbt:195:26-195:34:
    | 
    | ///|
    | test "test mixed case hex digits" {
195 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|mixed_hex = 0xaBcDeF

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:6:26-6:34:
  | ///|
  | /// Test LocalTime parsing - 2-digit start pattern
  | test "lexer datetime LocalTime basic" {
6 |   let tokens = @tokenize.tokenize(
  |                          ^^^^^^^^
  |     (
  |       #|time = 07:32:00

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:33:26-33:34:
   | ///|
   | /// Test LocalTime with fractional seconds
   | test "lexer datetime LocalTime with fractional seconds" {
33 |   let tokens = @tokenize.tokenize(
   |                          ^^^^^^^^
   |     (
   |       #|time = 07:32:00.999999

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:60:27-60:35:
   | ///|
   | /// Test LocalTime edge cases - midnight and end of day
   | test "lexer datetime LocalTime edge times" {
60 |   let tokens1 = @tokenize.tokenize(
   |                           ^^^^^^^^
   |     (
   |       #|time = 00:00:00

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:82:27-82:35:
   |       #|]
   |     ),
   |   )
82 |   let tokens2 = @tokenize.tokenize(
   |                           ^^^^^^^^
   |     (
   |       #|time = 23:59:59

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:109:26-109:34:
    | ///|
    | /// Test LocalDate parsing - 4-digit start, no time component
    | test "lexer datetime LocalDate basic" {
109 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|date = 1979-05-27

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:137:27-137:35:
    | /// Test LocalDate edge cases - various years
    | test "lexer datetime LocalDate various years" {
    |   // Historical date
137 |   let tokens1 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|date = 1900-01-01

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:160:27-160:35:
    |     ),
    |   )
    |   // Far future date
160 |   let tokens2 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|date = 9999-12-31

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:183:27-183:35:
    |     ),
    |   )
    |   // Leap year date
183 |   let tokens3 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|date = 2024-02-29

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:210:26-210:34:
    | ///|
    | /// Test LocalDateTime - date with T and time, no timezone
    | test "lexer datetime LocalDateTime basic" {
210 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|datetime = 1979-05-27T07:32:00

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:237:26-237:34:
    | ///|
    | /// Test LocalDateTime with fractional seconds
    | test "lexer datetime LocalDateTime with fractional seconds" {
237 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|datetime = 1979-05-27T00:32:00.999999

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:264:26-264:34:
    | ///|
    | /// Test OffsetDateTime with Z (UTC)
    | test "lexer datetime OffsetDateTime with Z" {
264 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|datetime = 1979-05-27T07:32:00Z

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:291:26-291:34:
    | ///|
    | /// Test OffsetDateTime with Z and fractional seconds
    | test "lexer datetime OffsetDateTime Z with fractional" {
291 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|datetime = 1979-05-27T07:32:00.123456Z

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:318:26-318:34:
    | ///|
    | /// Test OffsetDateTime with positive offset
    | test "lexer datetime OffsetDateTime positive offset" {
318 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|datetime = 1979-05-27T00:32:00+07:00

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:345:26-345:34:
    | ///|
    | /// Test OffsetDateTime with negative offset
    | test "lexer datetime OffsetDateTime negative offset" {
345 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|datetime = 1979-05-27T00:32:00-07:00

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:372:26-372:34:
    | ///|
    | /// Test OffsetDateTime with offset and fractional seconds
    | test "lexer datetime OffsetDateTime offset with fractional" {
372 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|datetime = 1979-05-27T00:32:00.999999-07:00

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:400:27-400:35:
    | /// Test OffsetDateTime with various timezone offsets
    | test "lexer datetime OffsetDateTime various offsets" {
    |   // +00:00 (UTC)
400 |   let tokens1 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|dt = 2023-01-01T12:00:00+00:00

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:423:27-423:35:
    |     ),
    |   )
    |   // -00:00 (UTC)
423 |   let tokens2 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|dt = 2023-01-01T12:00:00-00:00

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:446:27-446:35:
    |     ),
    |   )
    |   // +14:00 (max positive)
446 |   let tokens3 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|dt = 2023-01-01T12:00:00+14:00

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:469:27-469:35:
    |     ),
    |   )
    |   // -12:00 (max negative)
469 |   let tokens4 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|dt = 2023-01-01T12:00:00-12:00

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:492:27-492:35:
    |     ),
    |   )
    |   // Half-hour offset (India +05:30)
492 |   let tokens5 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|dt = 2023-01-01T12:00:00+05:30

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:519:26-519:34:
    | ///|
    | /// Test multiple datetime values in same TOML
    | test "lexer datetime multiple datetimes" {
519 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|time = 12:30:00

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:580:26-580:34:
    | ///|
    | /// Test datetime in array context
    | test "lexer datetime in array" {
580 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|dates = [2023-01-01, 2023-06-15, 2023-12-31]

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:619:26-619:34:
    | ///|
    | /// Test datetime followed by comment
    | test "lexer datetime with comment" {
619 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|date = 2023-06-15 # deployment date

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:647:27-647:35:
    | /// Test LocalTime with various fractional second precisions
    | test "lexer datetime LocalTime fractional precision" {
    |   // 1 digit
647 |   let tokens1 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|time = 12:30:45.1

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:670:27-670:35:
    |     ),
    |   )
    |   // 3 digits (milliseconds)
670 |   let tokens2 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|time = 12:30:45.123

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:693:27-693:35:
    |     ),
    |   )
    |   // 6 digits (microseconds)
693 |   let tokens3 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|time = 12:30:45.123456

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:716:27-716:35:
    |     ),
    |   )
    |   // 9 digits (nanoseconds)
716 |   let tokens4 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|time = 12:30:45.123456789

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:743:26-743:34:
    | ///|
    | /// Test inline table with datetime
    | test "lexer datetime in inline table" {
743 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|event = { date = 2023-06-15, time = 09:00:00 }

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:789:27-789:35:
    | test "lexer datetime disambiguation" {
    |   // Date followed by something that's NOT a time (no T)
    |   // This should parse as LocalDate only
789 |   let tokens1 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|date = 2023-06-15

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:828:27-828:35:
    | /// Test TOML spec RFC 3339 examples
    | test "lexer datetime RFC 3339 spec examples" {
    |   // Examples from TOML 1.0 spec
828 |   let tokens1 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|odt1 = 1979-05-27T07:32:00Z

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:850:27-850:35:
    |       #|]
    |     ),
    |   )
850 |   let tokens2 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|odt2 = 1979-05-27T00:32:00-07:00

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:872:27-872:35:
    |       #|]
    |     ),
    |   )
872 |   let tokens3 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|odt3 = 1979-05-27T00:32:00.999999-07:00

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:894:27-894:35:
    |       #|]
    |     ),
    |   )
894 |   let tokens4 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|ldt1 = 1979-05-27T07:32:00

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:916:27-916:35:
    |       #|]
    |     ),
    |   )
916 |   let tokens5 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|ldt2 = 1979-05-27T00:32:00.999999

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:938:27-938:35:
    |       #|]
    |     ),
    |   )
938 |   let tokens6 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|ld1 = 1979-05-27

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:960:27-960:35:
    |       #|]
    |     ),
    |   )
960 |   let tokens7 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|lt1 = 07:32:00

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:982:27-982:35:
    |       #|]
    |     ),
    |   )
982 |   let tokens8 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|lt2 = 00:32:00.999999

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:1010:27-1010:35:
     | /// Test year boundary dates
     | test "lexer datetime year boundaries" {
     |   // Start of year
1010 |   let tokens1 = @tokenize.tokenize(
     |                           ^^^^^^^^
     |     (
     |       #|date = 2023-01-01

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:1033:27-1033:35:
     |     ),
     |   )
     |   // End of year
1033 |   let tokens2 = @tokenize.tokenize(
     |                           ^^^^^^^^
     |     (
     |       #|date = 2023-12-31

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:1056:27-1056:35:
     |     ),
     |   )
     |   // New Year's Eve 23:59:59
1056 |   let tokens3 = @tokenize.tokenize(
     |                           ^^^^^^^^
     |     (
     |       #|dt = 2023-12-31T23:59:59

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:1079:27-1079:35:
     |     ),
     |   )
     |   // New Year's Day 00:00:00
1079 |   let tokens4 = @tokenize.tokenize(
     |                           ^^^^^^^^
     |     (
     |       #|dt = 2024-01-01T00:00:00Z

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:4:15-4:23:
  | ///|
  | test "test invalid float parsing" {
  |   let maybe_tokens = try
4 |     @tokenize.tokenize(
  |               ^^^^^^^^
  |       (
  |         #|invalid = 1.2.3

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:44:15-44:23:
   | ///|
   | test "test invalid hex digit error" {
   |   let maybe_tokens = try
44 |     @tokenize.tokenize(
   |               ^^^^^^^^
   |       (
   |         #|hex = 0xGHI

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:65:15-65:23:
   | ///|
   | test "test octal without digits" {
   |   let maybe_tokens = try
65 |     @tokenize.tokenize(
   |               ^^^^^^^^
   |       (
   |         #|test = 0o

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:86:15-86:23:
   | ///|
   | test "test binary without digits" {
   |   let maybe_tokens = try
86 |     @tokenize.tokenize(
   |               ^^^^^^^^
   |       (
   |         #|test = 0b

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:107:15-107:23:
    | ///|
    | test "test hex with invalid delimiter" {
    |   let maybe_tokens = try
107 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|hex = 0x123XYZ

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:128:15-128:23:
    | ///|
    | test "test hex regex is anchored to current view" {
    |   let maybe_tokens = try
128 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|hex = 0xG0x10

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:148:26-148:34:
    | 
    | ///|
    | test "test datetime timezone regex is anchored to current view" {
148 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|dt = 2023-06-15T12:30:00xZ

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:179:15-179:23:
    | ///|
    | test "test octal regex is anchored to current view" {
    |   let maybe_tokens = try
179 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|oct = 0o80o7

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:200:15-200:23:
    | ///|
    | test "test binary regex is anchored to current view" {
    |   let maybe_tokens = try
200 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|bin = 0b20b10

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:220:27-220:35:
    | 
    | ///|
    | test "test hex with valid delimiters" {
220 |   let tokens1 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|hex = 0x123A

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:242:27-242:35:
    |       #|]
    |     ),
    |   )
242 |   let tokens2 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|arr = [0x123A, 0xB]

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:275:26-275:34:
    | 
    | ///|
    | test "test hex case variations" {
275 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|hex = 0xaBcDeF

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:302:15-302:23:
    | ///|
    | test "test octal with invalid digits" {
    |   let maybe_tokens = try
302 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|oct = 0o789

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:322:27-322:35:
    | 
    | ///|
    | test "test octal with valid delimiters" {
322 |   let tokens1 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|oct = 0o755

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:344:27-344:35:
    |       #|]
    |     ),
    |   )
344 |   let tokens2 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|arr = [0o644, 0o755]

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:378:15-378:23:
    | ///|
    | test "test binary with invalid digits" {
    |   let maybe_tokens = try
378 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|bin = 0b1012

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:398:27-398:35:
    | 
    | ///|
    | test "test binary with valid delimiters" {
398 |   let tokens1 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|bin = 0b1010

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:420:27-420:35:
    |       #|]
    |     ),
    |   )
420 |   let tokens2 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|arr = [0b101, 0b110]

<WORKDIR>/internal/tokenize/lexer_test.mbt:4:26-4:34:
  | ///|
  | /// Tests for the TOML lexer
  | test "tokenize simple key-value" {
4 |   let tokens = @tokenize.tokenize(
  |                          ^^^^^^^^
  |     (
  |       #|key = "value"

<WORKDIR>/internal/tokenize/lexer_test.mbt:31:26-31:34:
   | 
   | ///|
   | test "tokenize integer" {
31 |   let tokens = @tokenize.tokenize(
   |                          ^^^^^^^^
   |     (
   |       #|number = 42

<WORKDIR>/internal/tokenize/lexer_test.mbt:57:26-57:34:
   | 
   | ///|
   | test "tokenize float" {
57 |   let tokens = @tokenize.tokenize(
   |                          ^^^^^^^^
   |     (
   |       #|pi = 3.14

<WORKDIR>/internal/tokenize/lexer_test.mbt:84:26-84:34:
   | 
   | ///|
   | test "tokenize boolean" {
84 |   let tokens = @tokenize.tokenize(
   |                          ^^^^^^^^
   |     (
   |       #|enabled = true

<WORKDIR>/internal/tokenize/lexer_test.mbt:110:26-110:34:
    | 
    | ///|
    | test "tokenize array syntax" {
110 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|[1, 2, 3]

<WORKDIR>/internal/tokenize/lexer_test.mbt:143:26-143:34:
    | 
    | ///|
    | test "tokenize with comments" {
143 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|key = "value" # this is a comment

<WORKDIR>/internal/tokenize/lexer_test.mbt:170:26-170:34:
    | 
    | ///|
    | test "tokenize multiline" {
170 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|key1 = "value1"

<WORKDIR>/internal/tokenize/lexer_test.mbt:208:26-208:34:
    | 
    | ///|
    | test "unicode or emoji" {
208 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|key1 = "💩"

<WORKDIR>/internal/tokenize/lexer_test.mbt:265:26-265:34:
    | 
    | ///|
    | test "test LeftBrace token JSON serialization" {
265 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|{}

<WORKDIR>/internal/tokenize/lexer_test.mbt:284:26-284:34:
    | 
    | ///|
    | test "test RightBrace token JSON serialization" {
284 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|}

<WORKDIR>/internal/tokenize/lexer_test.mbt:302:26-302:34:
    | 
    | ///|
    | test "test Dot token JSON serialization" {
302 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|.

<WORKDIR>/internal/tokenize/lexer_test.mbt:321:26-321:34:
    | ///|
    | /// Test special number formats
    | test "tokenize hexadecimal numbers" {
321 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|hex = 0xDEAD

<WORKDIR>/internal/tokenize/lexer_test.mbt:343:27-343:35:
    |       #|]
    |     ),
    |   )
343 |   let tokens2 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|hex2 = 0X1F

<WORKDIR>/internal/tokenize/lexer_test.mbt:369:26-369:34:
    | 
    | ///|
    | test "tokenize octal numbers" {
369 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|oct = 0o755

<WORKDIR>/internal/tokenize/lexer_test.mbt:391:27-391:35:
    |       #|]
    |     ),
    |   )
391 |   let tokens2 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|oct2 = 0O123

<WORKDIR>/internal/tokenize/lexer_test.mbt:417:26-417:34:
    | 
    | ///|
    | test "tokenize binary numbers" {
417 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|bin = 0b1101

<WORKDIR>/internal/tokenize/lexer_test.mbt:439:27-439:35:
    |       #|]
    |     ),
    |   )
439 |   let tokens2 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|bin2 = 0B101010

<WORKDIR>/internal/tokenize/lexer_test.mbt:465:26-465:34:
    | 
    | ///|
    | test "tokenize numbers with underscores" {
465 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|num = 1_000_000

<WORKDIR>/internal/tokenize/lexer_test.mbt:487:27-487:35:
    |       #|]
    |     ),
    |   )
487 |   let tokens2 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|float_val = 3.14_159

<WORKDIR>/internal/tokenize/lexer_test.mbt:510:27-510:35:
    |       #|]
    |     ),
    |   )
510 |   let tokens3 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|hex_under = 0xFF_FF

<WORKDIR>/internal/tokenize/lexer_test.mbt:536:26-536:34:
    | 
    | ///|
    | test "tokenize special hex digits" {
536 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|hex_digits = 0x0123456789ABCDEF

<WORKDIR>/internal/tokenize/lexer_test.mbt:563:26-563:34:
    | ///|
    | /// Test uncovered escape sequences and error conditions
    | test "test escaped single quote in string" {
563 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|key = "test\' quote"

<WORKDIR>/internal/tokenize/lexer_test.mbt:591:15-591:23:
    | ///|
    | test "test invalid escape sequence error" {
    |   let maybe_tokens = try
591 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|key = "test\z invalid"

<WORKDIR>/internal/tokenize/lexer_test.mbt:613:15-613:23:
    | ///|
    | test "test unterminated string error" {
    |   let maybe_tokens = try
613 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|key = "unterminated

<WORKDIR>/internal/tokenize/lexer_test.mbt:635:15-635:23:
    | ///|
    | test "test unexpected end after escape" {
    |   let maybe_tokens = try
635 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|key = "test\

<WORKDIR>/internal/tokenize/lexer_test.mbt:657:15-657:23:
    | ///|
    | test "test invalid characters" {
    |   let maybe_tokens = try
657 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|key @ value

<WORKDIR>/internal/tokenize/lexer_test.mbt:677:26-677:34:
    | 
    | ///|
    | test "test binary number with underscores" {
677 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|bin = 0b1010_1100

<WORKDIR>/internal/tokenize/lexer_test.mbt:703:26-703:34:
    | 
    | ///|
    | test "test dash-starting identifier tokenized before parser validation" {
703 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|key = -abc

<WORKDIR>/internal/tokenize/lexer_test.mbt:751:26-751:34:
    | ///|
    | /// Test Unicode 4-digit escape with lowercase hex letters
    | test "unicode 4 escape lowercase hex" {
751 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|key = "\uabcd"

<WORKDIR>/internal/tokenize/lexer_test.mbt:779:26-779:34:
    | ///|
    | /// Test Unicode 4-digit escape with uppercase hex letters
    | test "unicode 4 escape uppercase hex" {
779 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|key = "\uABCD"

<WORKDIR>/internal/tokenize/lexer_test.mbt:808:15-808:23:
    | /// Test Unicode 4-digit escape invalid hex digit
    | test "unicode 4 escape invalid hex" {
    |   let maybe_tokens = try
808 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|key = "\uGHIJ"

<WORKDIR>/internal/tokenize/lexer_test.mbt:830:15-830:23:
    | /// Test Unicode 4-digit escape incomplete sequence
    | test "unicode 4 escape incomplete" {
    |   let maybe_tokens = try
830 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|key = "\u123"

<WORKDIR>/internal/tokenize/lexer_test.mbt:852:15-852:23:
    | /// Test Unicode 4-digit escape invalid code point
    | test "unicode 4 escape invalid code point" {
    |   let maybe_tokens = try
852 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|key = "\uD800"

<WORKDIR>/internal/tokenize/lexer_test.mbt:873:26-873:34:
    | ///|
    | /// Test Unicode 8-digit escape with lowercase hex letters
    | test "unicode 8 escape lowercase hex" {
873 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|key = "\U000000ab"

<WORKDIR>/internal/tokenize/lexer_test.mbt:901:26-901:34:
    | ///|
    | /// Test Unicode 8-digit escape with uppercase hex letters
    | test "unicode 8 escape uppercase hex" {
901 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|key = "\U000000AB"

<WORKDIR>/internal/tokenize/lexer_test.mbt:930:15-930:23:
    | /// Test Unicode 8-digit escape invalid hex digit
    | test "unicode 8 escape invalid hex" {
    |   let maybe_tokens = try
930 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|key = "\U0000000G"

<WORKDIR>/internal/tokenize/lexer_test.mbt:952:15-952:23:
    | /// Test Unicode 8-digit escape incomplete sequence
    | test "unicode 8 escape incomplete" {
    |   let maybe_tokens = try
952 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|key = "\U0000001"

<WORKDIR>/internal/tokenize/lexer_test.mbt:974:15-974:23:
    | /// Test Unicode 8-digit escape invalid code point (too large)
    | test "unicode 8 escape invalid code point large" {
    |   let maybe_tokens = try
974 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|key = "\U00110000"

<WORKDIR>/internal/tokenize/lexer_test.mbt:996:15-996:23:
    | /// Test Unicode 8-digit escape invalid code point (surrogate range)
    | test "unicode 8 escape invalid code point surrogate" {
    |   let maybe_tokens = try
996 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|key = "\U0000D800"

<WORKDIR>/internal/tokenize/lexer_test.mbt:1018:15-1018:23:
     | /// Test Unicode 8-digit escape invalid code point conversion
     | test "unicode 8 escape invalid conversion" {
     |   let maybe_tokens = try
1018 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = "\U7FFFFFFF"

<WORKDIR>/internal/tokenize/lexer_test.mbt:1039:26-1039:34:
     | ///|
     | /// Test backspace escape sequence
     | test "backspace escape sequence" {
1039 |   let tokens = @tokenize.tokenize(
     |                          ^^^^^^^^
     |     (
     |       #|key = "test\b"

<WORKDIR>/internal/tokenize/lexer_test.mbt:1067:26-1067:34:
     | ///|
     | /// Test form feed escape sequence
     | test "form feed escape sequence" {
1067 |   let tokens = @tokenize.tokenize(
     |                          ^^^^^^^^
     |     (
     |       #|key = "test\f"

<WORKDIR>/internal/tokenize/lexer_test.mbt:1096:26-1096:34:
     | ///|
     | /// Test multiline basic string with escape sequences
     | test "multiline basic string escapes" {
1096 |   let tokens = @tokenize.tokenize(
     |                          ^^^^^^^^
     |     (
     |       #|key = """line1\nline2\tindented"""

<WORKDIR>/internal/tokenize/lexer_test.mbt:1124:26-1124:34:
     | ///|
     | /// Test multiline basic string with all escape types
     | test "multiline basic string all escapes" {
1124 |   let tokens = @tokenize.tokenize(
     |                          ^^^^^^^^
     |     (
     |       #|key = """\n\t\r\\\"\b\f\u0041\U00000042"""

<WORKDIR>/internal/tokenize/lexer_test.mbt:1152:26-1152:34:
     | ///|
     | /// Test multiline basic string with line ending backslash and CR
     | test "multiline basic string line ending backslash CR" {
1152 |   let tokens = @tokenize.tokenize("key = \"\"\"line1\\\r\n   line2\"\"\"")
     |                          ^^^^^^^^
     |   debug_inspect(
     |     tokens,

<WORKDIR>/internal/tokenize/lexer_test.mbt:1177:15-1177:23:
     | /// Test multiline basic string invalid escape
     | test "multiline basic string invalid escape" {
     |   let maybe_tokens = try
1177 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = """\z"""

<WORKDIR>/internal/tokenize/lexer_test.mbt:1199:15-1199:23:
     | /// Test multiline basic string unexpected end after escape
     | test "multiline basic string unexpected end after escape" {
     |   let maybe_tokens = try
1199 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = """\

<WORKDIR>/internal/tokenize/lexer_test.mbt:1221:15-1221:23:
     | /// Test multiline basic string unterminated
     | test "multiline basic string unterminated" {
     |   let maybe_tokens = try
1221 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = """incomplete

<WORKDIR>/internal/tokenize/lexer_test.mbt:1243:15-1243:23:
     | /// Test multiline basic string early termination in loop
     | test "multiline basic string early termination" {
     |   let maybe_tokens = try
1243 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = """line

<WORKDIR>/internal/tokenize/lexer_test.mbt:1264:26-1264:34:
     | ///|
     | /// Test multiline literal string with CR+LF
     | test "multiline literal string CRLF" {
1264 |   let tokens = @tokenize.tokenize("key = '''line1\r\nline2'''")
     |                          ^^^^^^^^
     |   debug_inspect(
     |     tokens,

<WORKDIR>/internal/tokenize/lexer_test.mbt:1289:15-1289:23:
     | /// Test multiline literal string unterminated
     | test "multiline literal string unterminated" {
     |   let maybe_tokens = try
1289 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = '''incomplete

<WORKDIR>/internal/tokenize/lexer_test.mbt:1312:15-1312:23:
     | test "hex number invalid digit error path" {
     |   // This should fail because there are no hex digits after 0x
     |   let maybe_tokens = try
1312 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = 0x

<WORKDIR>/internal/tokenize/lexer_test.mbt:1335:26-1335:34:
     | test "invalid float error" {
     |   // This should trigger the invalid float error in read_number
     |   // but the current implementation may parse it differently
1335 |   let tokens = @tokenize.tokenize(
     |                          ^^^^^^^^
     |     (
     |       #|key = 3.14

<WORKDIR>/internal/tokenize/lexer_test.mbt:1363:26-1363:34:
     | ///|
     | /// Test multiline literal string tokenization
     | test "multiline literal string token" {
1363 |   let tokens = @tokenize.tokenize(
     |                          ^^^^^^^^
     |     (
     |       #|key = '''hello world'''

<WORKDIR>/internal/tokenize/lexer_test.mbt:1393:26-1393:34:
     | test "tokenize else branch coverage" {
     |   // This tests the else branch in tokenize function that should never be reached
     |   // The function returns inside the while loop, so the else is unreachable
1393 |   let tokens = @tokenize.tokenize(
     |                          ^^^^^^^^
     |     (
     |       #|key = "value"

<WORKDIR>/internal/tokenize/lexer_test.mbt:1421:26-1421:34:
     | ///|
     | /// Test multiline basic string with single quote escape
     | test "multiline basic string single quote escape" {
1421 |   let tokens = @tokenize.tokenize(
     |                          ^^^^^^^^
     |     (
     |       #|key = """line with \' quote"""

<WORKDIR>/internal/tokenize/lexer_test.mbt:1451:26-1451:34:
     | test "multiline basic string CR only" {
     |   // CR: '\r' is hard to visualize in the multipline string
     |   // explicit escaping is better for testing
1451 |   let tokens = @tokenize.tokenize("key = \"\"\"line1\\\rline2\"\"\"")
     |                          ^^^^^^^^
     |   debug_inspect(
     |     tokens,

<WORKDIR>/internal/tokenize/lexer_test.mbt:1477:15-1477:23:
     | test "multiline basic string none peek" {
     |   // This creates a string that will reach None in the peek() during processing
     |   let maybe_tokens = try
1477 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = """incomplete string

<WORKDIR>/internal/tokenize/lexer_test.mbt:1499:26-1499:34:
     | /// Test Unicode escape sequence that results in None from to_char
     | test "unicode escape invalid conversion to char" {
     |   // This tests an edge case where to_char returns None
1499 |   let tokens = @tokenize.tokenize(
     |                          ^^^^^^^^
     |     (
     |       #|key = "\uFFFF"

<WORKDIR>/internal/tokenize/lexer_test.mbt:1528:26-1528:34:
     | ///|
     | /// Test hex number with underscore in the middle
     | test "hex number with underscores" {
1528 |   let tokens = @tokenize.tokenize(
     |                          ^^^^^^^^
     |     (
     |       #|hex = 0xDE_AD_BE_EF

<WORKDIR>/internal/tokenize/lexer_test.mbt:1555:26-1555:34:
     | ///|
     | /// Test CR followed by LF after multiline string opening
     | test "multiline string opening CRLF" {
1555 |   let tokens = @tokenize.tokenize(
     |                          ^^^^^^^^
     |     (
     |       #|key = """

<WORKDIR>/internal/tokenize/lexer_test.mbt:1586:26-1586:34:
     | test "very large invalid float" {
     |   // A huge number that overflows to infinity during parsing
     |   let huge_number = "999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999.9999"
1586 |   let tokens = @tokenize.tokenize(
     |                          ^^^^^^^^
     |     (
     |       #|key =

<WORKDIR>/internal/tokenize/lexer_test.mbt:1608:26-1608:34:
     | /// Test edge case for hex digit error handling  
     | test "test hex overflow edge case" {
     |   // Test a hex number that might cause overflow issues
1608 |   let tokens = @tokenize.tokenize(
     |                          ^^^^^^^^
     |     (
     |       #|hex = 0xFFFFFFFFFFFFFFFF

<WORKDIR>/internal/tokenize/lexer_test.mbt:1638:15-1638:23:
     |   // Try to find a Unicode code that's valid as int but invalid as char
     |   // Code point 0x110000 is too large for valid Unicode
     |   let maybe_tokens = try
1638 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = "\U00110000"

<WORKDIR>/internal/tokenize/lexer_test.mbt:1660:15-1660:23:
     | test "multiline string abrupt end" {
     |   // Create a multiline string that ends abruptly without proper closing
     |   let maybe_tokens = try
1660 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = """content without closing

<WORKDIR>/internal/tokenize/lexer_test.mbt:1686:15-1686:23:
     |   // Try an edge case that might trigger the None path in unicode 8 escape
     |   // Use a very large value that might fail conversion
     |   let maybe_tokens = try
1686 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = "\U7FFFFFFF"

<WORKDIR>/internal/tokenize/lexer_test.mbt:1711:26-1711:34:
     | test "attempt hex digit error path" {
     |   // This tests the theoretical hex digit error path, though it's likely unreachable
     |   // due to pattern matching filtering
1711 |   let tokens = @tokenize.tokenize(
     |                          ^^^^^^^^
     |     (
     |       #|hex = 0xABCDEF123456

<WORKDIR>/internal/tokenize/lexer_test.mbt:1740:15-1740:23:
     | test "multiline string potential truncation" {
     |   // Try to create a scenario where multiline string processing might hit None
     |   let maybe_tokens = try
1740 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = """partial

<WORKDIR>/internal/tokenize/lexer_test.mbt:1759:15-1759:23:
     | ///|
     | test "trailing _ in binary number" {
     |   let maybe_tokens = try
1759 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = 0b10_10_

<WORKDIR>/internal/tokenize/lexer_test.mbt:1780:15-1780:23:
     | ///|
     | test "consequence _ in binary number" {
     |   let maybe_tokens = try
1780 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = 0b10__10_10

<WORKDIR>/internal/tokenize/lexer_test.mbt:1802:15-1802:23:
     | ///|
     | test "trailing _ in hex number" {
     |   let maybe_tokens = try
1802 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = 0xAB_CD_

<WORKDIR>/internal/tokenize/lexer_test.mbt:1823:15-1823:23:
     | ///|
     | test "consecutive _ in hex number" {
     |   let maybe_tokens = try
1823 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = 0xAB__CD_EF

<WORKDIR>/internal/tokenize/lexer_test.mbt:1845:15-1845:23:
     | ///|
     | test "trailing _ in octal number" {
     |   let maybe_tokens = try
1845 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = 0o755_

<WORKDIR>/internal/tokenize/lexer_test.mbt:1866:15-1866:23:
     | ///|
     | test "consecutive _ in octal number" {
     |   let maybe_tokens = try
1866 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = 0o7__55_44

<WORKDIR>/internal/tokenize/test_utils_test.mbt:16:17-16:25:
   | 
   | ///|
   | fn lexer_expect_to_fail(input : String) -> String {
16 |   try @tokenize.tokenize(input) catch {
   |                 ^^^^^^^^
   |     error => unwrap_failure_message(error)
   |   } noraise {

<WORKDIR>/internal/tokenize/tokenize.mbt:1351:8-1351:16:
     | 
     | ///|
     | /// Tokenize entire input
1351 | pub fn tokenize(input : String) -> Array[Token] raise {
     |        ^^^^^^^^
     |   let lexer = @lexer.Lexer::Lexer(input)
     |   let tokens = Array::new()

<WORKDIR>/internal/tokenize/tokenize.mbt:1512:16-1512:24:
     | ///|
     | /// Test datetime tokenization
     | test "datetime tokenization" {
1512 |   let tokens = tokenize("date = 1979-05-27T07:32:00Z")
     |                ^^^^^^^^
     |   debug_inspect(
     |     tokens,

<WORKDIR>/parser.mbt:301:26-301:34:
    | /// containing the source location. Wrap the call in `try?` to receive a
    | /// `Result[TomlValue, Error]` instead.
    | pub fn parse(input : String) -> TomlValue raise {
301 |   let tokens = @tokenize.tokenize(input)
    |                          ^^^^^^^^
    |   let parser = Parser::Parser(tokens)
    |   let main_table = Map([])

<WORKDIR>/parser_test.mbt:253:15-253:23:
    | test "tokenize exponent-like bare keys" {
    |   // Each line shows how the tokenizer sees an exponent-like key followed by `= "val"`
    |   debug_inspect(
253 |     @tokenize.tokenize("10e-1 = \"a\""),
    |               ^^^^^^^^
    |     content=(
    |       #|[

<WORKDIR>/parser_test.mbt:271:15-271:23:
    |     ),
    |   )
    |   debug_inspect(
271 |     @tokenize.tokenize("10e1 = \"b\""),
    |               ^^^^^^^^
    |     content=(
    |       #|[

<WORKDIR>/parser_test.mbt:289:15-289:23:
    |     ),
    |   )
    |   debug_inspect(
289 |     @tokenize.tokenize("-e-1 = \"c\""),
    |               ^^^^^^^^
    |     content=(
    |       #|[

<WORKDIR>/parser_test.mbt:307:15-307:23:
    |     ),
    |   )
    |   debug_inspect(
307 |     @tokenize.tokenize("-10e-1 = \"d\""),
    |               ^^^^^^^^
    |     content=(
    |       #|[

<WORKDIR>/parser_wbtest.mbt:7:26-7:34:
  | ///|
  | test "parse_dotted_key - simple identifier" {
  |   // Test parsing a simple identifier key
7 |   let tokens = @tokenize.tokenize("simple")
  |                          ^^^^^^^^
  |   let parser = Parser::Parser(tokens)
  |   let result = parser.parse_dotted_key()

<WORKDIR>/parser_wbtest.mbt:21:26-21:34:
   | ///|
   | test "parse_dotted_key - dotted identifiers" {
   |   // Test parsing dotted identifier keys
21 |   let tokens = @tokenize.tokenize("server.host.name")
   |                          ^^^^^^^^
   |   let parser = Parser::Parser(tokens)
   |   let result = parser.parse_dotted_key()

<WORKDIR>/parser_wbtest.mbt:35:26-35:34:
   | ///|
   | test "parse_dotted_key - string keys" {
   |   // Test parsing quoted string keys
35 |   let tokens = @tokenize.tokenize("\"quoted key\".\"another quoted\"")
   |                          ^^^^^^^^
   |   let parser = Parser::Parser(tokens)
   |   let result = parser.parse_dotted_key()

<WORKDIR>/parser_wbtest.mbt:49:26-49:34:
   | ///|
   | test "parse_dotted_key - integer keys" {
   |   // Test parsing integer keys - note these will be tokenized as floats
49 |   let tokens = @tokenize.tokenize("123.456.789")
   |                          ^^^^^^^^
   |   let parser = Parser::Parser(tokens)
   |   let result = parser.parse_dotted_key()

<WORKDIR>/parser_wbtest.mbt:63:26-63:34:
   | ///|
   | test "parse_dotted_key - string and integer mixed" {
   |   // Test parsing string followed by integer
63 |   let tokens = @tokenize.tokenize("\"key\".123")
   |                          ^^^^^^^^
   |   let parser = Parser::Parser(tokens)
   |   let result = parser.parse_dotted_key()

<WORKDIR>/parser_wbtest.mbt:77:26-77:34:
   | ///|
   | test "parse_dotted_key - mixed key types" {
   |   // Test parsing mixed key types
77 |   let tokens = @tokenize.tokenize("server.\"port number\".config")
   |                          ^^^^^^^^
   |   let parser = Parser::Parser(tokens)
   |   let result = parser.parse_dotted_key()

<WORKDIR>/parser_wbtest.mbt:92:26-92:34:
   | test "parse_dotted_key - float token as dotted keys" {
   |   // Test the special case where tokenizer sees "1.2" as a float
   |   // but we need to treat it as dotted keys "1.2"
92 |   let tokens = @tokenize.tokenize("1.2")
   |                          ^^^^^^^^
   |   let parser = Parser::Parser(tokens)
   |   let result = parser.parse_dotted_key()

<WORKDIR>/parser_wbtest.mbt:106:26-106:34:
    | ///|
    | test "parse_dotted_key - float token with additional dots" {
    |   // Test float token followed by more dotted keys
106 |   let tokens = @tokenize.tokenize("1.2.config.value")
    |                          ^^^^^^^^
    |   let parser = Parser::Parser(tokens)
    |   let result = parser.parse_dotted_key()

<WORKDIR>/parser_wbtest.mbt:121:26-121:34:
    | test "parse_dotted_key - float token without dot" {
    |   // Test float token that doesn't actually contain a dot (edge case)
    |   // We'll use a simpler test with a float that gets parsed as a single key
121 |   let tokens = @tokenize.tokenize("42.0")
    |                          ^^^^^^^^
    |   let parser = Parser::Parser(tokens)
    |   let result = parser.parse_dotted_key()

<WORKDIR>/parser_wbtest.mbt:135:26-135:34:
    | ///|
    | test "parse_dotted_key - complex nested structure" {
    |   // Test a complex real-world-like dotted key
135 |   let tokens = @tokenize.tokenize("database.connections.\"primary-db\".host")
    |                          ^^^^^^^^
    |   let parser = Parser::Parser(tokens)
    |   let result = parser.parse_dotted_key()

<WORKDIR>/parser_wbtest.mbt:149:26-149:34:
    | ///|
    | test "parse_dotted_key - single quoted string" {
    |   // Test single quoted string key
149 |   let tokens = @tokenize.tokenize("\"key\"")
    |                          ^^^^^^^^
    |   let parser = Parser::Parser(tokens)
    |   let result = parser.parse_dotted_key()

<WORKDIR>/parser_wbtest.mbt:163:26-163:34:
    | ///|
    | test "parse_dotted_key - single integer" {
    |   // Test single integer key
163 |   let tokens = @tokenize.tokenize("42")
    |                          ^^^^^^^^
    |   let parser = Parser::Parser(tokens)
    |   let result = parser.parse_dotted_key()

<WORKDIR>/parser_wbtest.mbt:177:26-177:34:
    | ///|
    | test "parse_dotted_key - error cases" {
    |   // Test error when no key is found
177 |   let tokens = @tokenize.tokenize("=")
    |                          ^^^^^^^^
    |   let parser = Parser::Parser(tokens)
    |   guard (try parser.parse_dotted_key() catch {

<WORKDIR>/parser_wbtest.mbt:202:26-202:34:
    | ///|
    | test "parse_dotted_key - error after dot" {
    |   // Test error when dot is followed by invalid token
202 |   let tokens = @tokenize.tokenize("key.=")
    |                          ^^^^^^^^
    |   let parser = Parser::Parser(tokens)
    |   guard (try parser.parse_dotted_key() catch {

<WORKDIR>/parser_wbtest.mbt:227:26-227:34:
    | ///|
    | test "parse_dotted_key - numeric float with continuation" {
    |   // Test numeric float like "3.14" followed by more keys
227 |   let tokens = @tokenize.tokenize("3.14.config")
    |                          ^^^^^^^^
    |   let parser = Parser::Parser(tokens)
    |   let result = parser.parse_dotted_key()

<WORKDIR>/parser_wbtest.mbt:241:26-241:34:
    | ///|
    | test "parse_dotted_key - zero values" {
    |   // Test with zero values in keys
241 |   let tokens = @tokenize.tokenize("0.0.config")
    |                          ^^^^^^^^
    |   let parser = Parser::Parser(tokens)
    |   let result = parser.parse_dotted_key()

```
