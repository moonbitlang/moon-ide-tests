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

<WORKDIR>/coverage_improvement_test.mbt:131:26-131:34:
    | 
    | ///|
    | test "test literal string handling" {
131 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|literal = 'this is a literal string'

<WORKDIR>/coverage_improvement_test.mbt:209:26-209:34:
    | 
    | ///|
    | test "test mixed case hex digits" {
209 |   let tokens = @tokenize.tokenize(
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

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:829:27-829:35:
    | /// Test TOML spec RFC 3339 examples
    | test "lexer datetime RFC 3339 spec examples" {
    |   // Examples from TOML 1.0 spec
829 |   let tokens1 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|odt1 = 1979-05-27T07:32:00Z

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:851:27-851:35:
    |       #|]
    |     ),
    |   )
851 |   let tokens2 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|odt2 = 1979-05-27T00:32:00-07:00

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:873:27-873:35:
    |       #|]
    |     ),
    |   )
873 |   let tokens3 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|odt3 = 1979-05-27T00:32:00.999999-07:00

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:895:27-895:35:
    |       #|]
    |     ),
    |   )
895 |   let tokens4 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|ldt1 = 1979-05-27T07:32:00

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:917:27-917:35:
    |       #|]
    |     ),
    |   )
917 |   let tokens5 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|ldt2 = 1979-05-27T00:32:00.999999

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:939:27-939:35:
    |       #|]
    |     ),
    |   )
939 |   let tokens6 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|ld1 = 1979-05-27

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:961:27-961:35:
    |       #|]
    |     ),
    |   )
961 |   let tokens7 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|lt1 = 07:32:00

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:983:27-983:35:
    |       #|]
    |     ),
    |   )
983 |   let tokens8 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|lt2 = 00:32:00.999999

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:1011:27-1011:35:
     | /// Test year boundary dates
     | test "lexer datetime year boundaries" {
     |   // Start of year
1011 |   let tokens1 = @tokenize.tokenize(
     |                           ^^^^^^^^
     |     (
     |       #|date = 2023-01-01

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:1034:27-1034:35:
     |     ),
     |   )
     |   // End of year
1034 |   let tokens2 = @tokenize.tokenize(
     |                           ^^^^^^^^
     |     (
     |       #|date = 2023-12-31

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:1057:27-1057:35:
     |     ),
     |   )
     |   // New Year's Eve 23:59:59
1057 |   let tokens3 = @tokenize.tokenize(
     |                           ^^^^^^^^
     |     (
     |       #|dt = 2023-12-31T23:59:59

<WORKDIR>/internal/tokenize/datetime_lexer_test.mbt:1080:27-1080:35:
     |     ),
     |   )
     |   // New Year's Day 00:00:00
1080 |   let tokens4 = @tokenize.tokenize(
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

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:45:15-45:23:
   | ///|
   | test "test invalid hex digit error" {
   |   let maybe_tokens = try
45 |     @tokenize.tokenize(
   |               ^^^^^^^^
   |       (
   |         #|hex = 0xGHI

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:66:15-66:23:
   | ///|
   | test "test octal without digits" {
   |   let maybe_tokens = try
66 |     @tokenize.tokenize(
   |               ^^^^^^^^
   |       (
   |         #|test = 0o

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:87:15-87:23:
   | ///|
   | test "test binary without digits" {
   |   let maybe_tokens = try
87 |     @tokenize.tokenize(
   |               ^^^^^^^^
   |       (
   |         #|test = 0b

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:108:15-108:23:
    | ///|
    | test "test hex with invalid delimiter" {
    |   let maybe_tokens = try
108 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|hex = 0x123XYZ

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:129:15-129:23:
    | ///|
    | test "test hex regex is anchored to current view" {
    |   let maybe_tokens = try
129 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|hex = 0xG0x10

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:149:26-149:34:
    | 
    | ///|
    | test "test datetime timezone regex is anchored to current view" {
149 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|dt = 2023-06-15T12:30:00xZ

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:180:15-180:23:
    | ///|
    | test "test octal regex is anchored to current view" {
    |   let maybe_tokens = try
180 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|oct = 0o80o7

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:201:15-201:23:
    | ///|
    | test "test binary regex is anchored to current view" {
    |   let maybe_tokens = try
201 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|bin = 0b20b10

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:221:27-221:35:
    | 
    | ///|
    | test "test hex with valid delimiters" {
221 |   let tokens1 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|hex = 0x123A

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:244:27-244:35:
    |       #|]
    |     ),
    |   )
244 |   let tokens2 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|arr = [0x123A, 0xB]

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:279:26-279:34:
    | 
    | ///|
    | test "test hex case variations" {
279 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|hex = 0xaBcDeF

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:307:15-307:23:
    | ///|
    | test "test octal with invalid digits" {
    |   let maybe_tokens = try
307 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|oct = 0o789

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:327:27-327:35:
    | 
    | ///|
    | test "test octal with valid delimiters" {
327 |   let tokens1 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|oct = 0o755

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:350:27-350:35:
    |       #|]
    |     ),
    |   )
350 |   let tokens2 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|arr = [0o644, 0o755]

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:386:15-386:23:
    | ///|
    | test "test binary with invalid digits" {
    |   let maybe_tokens = try
386 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|bin = 0b1012

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:406:27-406:35:
    | 
    | ///|
    | test "test binary with valid delimiters" {
406 |   let tokens1 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|bin = 0b1010

<WORKDIR>/internal/tokenize/lexer_bug_test.mbt:429:27-429:35:
    |       #|]
    |     ),
    |   )
429 |   let tokens2 = @tokenize.tokenize(
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

<WORKDIR>/internal/tokenize/lexer_test.mbt:58:26-58:34:
   | 
   | ///|
   | test "tokenize float" {
58 |   let tokens = @tokenize.tokenize(
   |                          ^^^^^^^^
   |     (
   |       #|pi = 3.14

<WORKDIR>/internal/tokenize/lexer_test.mbt:85:26-85:34:
   | 
   | ///|
   | test "tokenize boolean" {
85 |   let tokens = @tokenize.tokenize(
   |                          ^^^^^^^^
   |     (
   |       #|enabled = true

<WORKDIR>/internal/tokenize/lexer_test.mbt:111:26-111:34:
    | 
    | ///|
    | test "tokenize array syntax" {
111 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|[1, 2, 3]

<WORKDIR>/internal/tokenize/lexer_test.mbt:147:26-147:34:
    | 
    | ///|
    | test "tokenize with comments" {
147 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|key = "value" # this is a comment

<WORKDIR>/internal/tokenize/lexer_test.mbt:174:26-174:34:
    | 
    | ///|
    | test "tokenize multiline" {
174 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|key1 = "value1"

<WORKDIR>/internal/tokenize/lexer_test.mbt:213:26-213:34:
    | 
    | ///|
    | test "unicode or emoji" {
213 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|key1 = "💩"

<WORKDIR>/internal/tokenize/lexer_test.mbt:270:26-270:34:
    | 
    | ///|
    | test "test LeftBrace token JSON serialization" {
270 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|{}

<WORKDIR>/internal/tokenize/lexer_test.mbt:289:26-289:34:
    | 
    | ///|
    | test "test RightBrace token JSON serialization" {
289 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|}

<WORKDIR>/internal/tokenize/lexer_test.mbt:307:26-307:34:
    | 
    | ///|
    | test "test Dot token JSON serialization" {
307 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|.

<WORKDIR>/internal/tokenize/lexer_test.mbt:326:26-326:34:
    | ///|
    | /// Test special number formats
    | test "tokenize hexadecimal numbers" {
326 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|hex = 0xDEAD

<WORKDIR>/internal/tokenize/lexer_test.mbt:349:27-349:35:
    |       #|]
    |     ),
    |   )
349 |   let tokens2 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|hex2 = 0X1F

<WORKDIR>/internal/tokenize/lexer_test.mbt:375:26-375:34:
    | 
    | ///|
    | test "tokenize octal numbers" {
375 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|oct = 0o755

<WORKDIR>/internal/tokenize/lexer_test.mbt:398:27-398:35:
    |       #|]
    |     ),
    |   )
398 |   let tokens2 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|oct2 = 0O123

<WORKDIR>/internal/tokenize/lexer_test.mbt:424:26-424:34:
    | 
    | ///|
    | test "tokenize binary numbers" {
424 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|bin = 0b1101

<WORKDIR>/internal/tokenize/lexer_test.mbt:447:27-447:35:
    |       #|]
    |     ),
    |   )
447 |   let tokens2 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|bin2 = 0B101010

<WORKDIR>/internal/tokenize/lexer_test.mbt:473:26-473:34:
    | 
    | ///|
    | test "tokenize numbers with underscores" {
473 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|num = 1_000_000

<WORKDIR>/internal/tokenize/lexer_test.mbt:496:27-496:35:
    |       #|]
    |     ),
    |   )
496 |   let tokens2 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|float_val = 3.14_159

<WORKDIR>/internal/tokenize/lexer_test.mbt:519:27-519:35:
    |       #|]
    |     ),
    |   )
519 |   let tokens3 = @tokenize.tokenize(
    |                           ^^^^^^^^
    |     (
    |       #|hex_under = 0xFF_FF

<WORKDIR>/internal/tokenize/lexer_test.mbt:546:26-546:34:
    | 
    | ///|
    | test "tokenize special hex digits" {
546 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|hex_digits = 0x0123456789ABCDEF

<WORKDIR>/internal/tokenize/lexer_test.mbt:574:26-574:34:
    | ///|
    | /// Test uncovered escape sequences and error conditions
    | test "test escaped single quote in string" {
574 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|key = "test\' quote"

<WORKDIR>/internal/tokenize/lexer_test.mbt:602:15-602:23:
    | ///|
    | test "test invalid escape sequence error" {
    |   let maybe_tokens = try
602 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|key = "test\z invalid"

<WORKDIR>/internal/tokenize/lexer_test.mbt:624:15-624:23:
    | ///|
    | test "test unterminated string error" {
    |   let maybe_tokens = try
624 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|key = "unterminated

<WORKDIR>/internal/tokenize/lexer_test.mbt:646:15-646:23:
    | ///|
    | test "test unexpected end after escape" {
    |   let maybe_tokens = try
646 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|key = "test\

<WORKDIR>/internal/tokenize/lexer_test.mbt:668:15-668:23:
    | ///|
    | test "test invalid characters" {
    |   let maybe_tokens = try
668 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|key @ value

<WORKDIR>/internal/tokenize/lexer_test.mbt:688:26-688:34:
    | 
    | ///|
    | test "test binary number with underscores" {
688 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|bin = 0b1010_1100

<WORKDIR>/internal/tokenize/lexer_test.mbt:715:26-715:34:
    | 
    | ///|
    | test "test dash-starting identifier tokenized before parser validation" {
715 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|key = -abc

<WORKDIR>/internal/tokenize/lexer_test.mbt:763:26-763:34:
    | ///|
    | /// Test Unicode 4-digit escape with lowercase hex letters
    | test "unicode 4 escape lowercase hex" {
763 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|key = "\uabcd"

<WORKDIR>/internal/tokenize/lexer_test.mbt:791:26-791:34:
    | ///|
    | /// Test Unicode 4-digit escape with uppercase hex letters
    | test "unicode 4 escape uppercase hex" {
791 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|key = "\uABCD"

<WORKDIR>/internal/tokenize/lexer_test.mbt:820:15-820:23:
    | /// Test Unicode 4-digit escape invalid hex digit
    | test "unicode 4 escape invalid hex" {
    |   let maybe_tokens = try
820 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|key = "\uGHIJ"

<WORKDIR>/internal/tokenize/lexer_test.mbt:842:15-842:23:
    | /// Test Unicode 4-digit escape incomplete sequence
    | test "unicode 4 escape incomplete" {
    |   let maybe_tokens = try
842 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|key = "\u123"

<WORKDIR>/internal/tokenize/lexer_test.mbt:864:15-864:23:
    | /// Test Unicode 4-digit escape invalid code point
    | test "unicode 4 escape invalid code point" {
    |   let maybe_tokens = try
864 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|key = "\uD800"

<WORKDIR>/internal/tokenize/lexer_test.mbt:885:26-885:34:
    | ///|
    | /// Test Unicode 8-digit escape with lowercase hex letters
    | test "unicode 8 escape lowercase hex" {
885 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|key = "\U000000ab"

<WORKDIR>/internal/tokenize/lexer_test.mbt:913:26-913:34:
    | ///|
    | /// Test Unicode 8-digit escape with uppercase hex letters
    | test "unicode 8 escape uppercase hex" {
913 |   let tokens = @tokenize.tokenize(
    |                          ^^^^^^^^
    |     (
    |       #|key = "\U000000AB"

<WORKDIR>/internal/tokenize/lexer_test.mbt:942:15-942:23:
    | /// Test Unicode 8-digit escape invalid hex digit
    | test "unicode 8 escape invalid hex" {
    |   let maybe_tokens = try
942 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|key = "\U0000000G"

<WORKDIR>/internal/tokenize/lexer_test.mbt:964:15-964:23:
    | /// Test Unicode 8-digit escape incomplete sequence
    | test "unicode 8 escape incomplete" {
    |   let maybe_tokens = try
964 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|key = "\U0000001"

<WORKDIR>/internal/tokenize/lexer_test.mbt:986:15-986:23:
    | /// Test Unicode 8-digit escape invalid code point (too large)
    | test "unicode 8 escape invalid code point large" {
    |   let maybe_tokens = try
986 |     @tokenize.tokenize(
    |               ^^^^^^^^
    |       (
    |         #|key = "\U00110000"

<WORKDIR>/internal/tokenize/lexer_test.mbt:1008:15-1008:23:
     | /// Test Unicode 8-digit escape invalid code point (surrogate range)
     | test "unicode 8 escape invalid code point surrogate" {
     |   let maybe_tokens = try
1008 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = "\U0000D800"

<WORKDIR>/internal/tokenize/lexer_test.mbt:1030:15-1030:23:
     | /// Test Unicode 8-digit escape invalid code point conversion
     | test "unicode 8 escape invalid conversion" {
     |   let maybe_tokens = try
1030 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = "\U7FFFFFFF"

<WORKDIR>/internal/tokenize/lexer_test.mbt:1051:26-1051:34:
     | ///|
     | /// Test backspace escape sequence
     | test "backspace escape sequence" {
1051 |   let tokens = @tokenize.tokenize(
     |                          ^^^^^^^^
     |     (
     |       #|key = "test\b"

<WORKDIR>/internal/tokenize/lexer_test.mbt:1079:26-1079:34:
     | ///|
     | /// Test form feed escape sequence
     | test "form feed escape sequence" {
1079 |   let tokens = @tokenize.tokenize(
     |                          ^^^^^^^^
     |     (
     |       #|key = "test\f"

<WORKDIR>/internal/tokenize/lexer_test.mbt:1108:26-1108:34:
     | ///|
     | /// Test multiline basic string with escape sequences
     | test "multiline basic string escapes" {
1108 |   let tokens = @tokenize.tokenize(
     |                          ^^^^^^^^
     |     (
     |       #|key = """line1\nline2\tindented"""

<WORKDIR>/internal/tokenize/lexer_test.mbt:1136:26-1136:34:
     | ///|
     | /// Test multiline basic string with all escape types
     | test "multiline basic string all escapes" {
1136 |   let tokens = @tokenize.tokenize(
     |                          ^^^^^^^^
     |     (
     |       #|key = """\n\t\r\\\"\b\f\u0041\U00000042"""

<WORKDIR>/internal/tokenize/lexer_test.mbt:1164:26-1164:34:
     | ///|
     | /// Test multiline basic string with line ending backslash and CR
     | test "multiline basic string line ending backslash CR" {
1164 |   let tokens = @tokenize.tokenize("key = \"\"\"line1\\\r\n   line2\"\"\"")
     |                          ^^^^^^^^
     |   debug_inspect(
     |     tokens,

<WORKDIR>/internal/tokenize/lexer_test.mbt:1189:15-1189:23:
     | /// Test multiline basic string invalid escape
     | test "multiline basic string invalid escape" {
     |   let maybe_tokens = try
1189 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = """\z"""

<WORKDIR>/internal/tokenize/lexer_test.mbt:1211:15-1211:23:
     | /// Test multiline basic string unexpected end after escape
     | test "multiline basic string unexpected end after escape" {
     |   let maybe_tokens = try
1211 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = """\

<WORKDIR>/internal/tokenize/lexer_test.mbt:1233:15-1233:23:
     | /// Test multiline basic string unterminated
     | test "multiline basic string unterminated" {
     |   let maybe_tokens = try
1233 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = """incomplete

<WORKDIR>/internal/tokenize/lexer_test.mbt:1255:15-1255:23:
     | /// Test multiline basic string early termination in loop
     | test "multiline basic string early termination" {
     |   let maybe_tokens = try
1255 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = """line

<WORKDIR>/internal/tokenize/lexer_test.mbt:1276:26-1276:34:
     | ///|
     | /// Test multiline literal string with CR+LF
     | test "multiline literal string CRLF" {
1276 |   let tokens = @tokenize.tokenize("key = '''line1\r\nline2'''")
     |                          ^^^^^^^^
     |   debug_inspect(
     |     tokens,

<WORKDIR>/internal/tokenize/lexer_test.mbt:1301:15-1301:23:
     | /// Test multiline literal string unterminated
     | test "multiline literal string unterminated" {
     |   let maybe_tokens = try
1301 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = '''incomplete

<WORKDIR>/internal/tokenize/lexer_test.mbt:1324:15-1324:23:
     | test "hex number invalid digit error path" {
     |   // This should fail because there are no hex digits after 0x
     |   let maybe_tokens = try
1324 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = 0x

<WORKDIR>/internal/tokenize/lexer_test.mbt:1347:26-1347:34:
     | test "invalid float error" {
     |   // This should trigger the invalid float error in read_number
     |   // but the current implementation may parse it differently
1347 |   let tokens = @tokenize.tokenize(
     |                          ^^^^^^^^
     |     (
     |       #|key = 3.14

<WORKDIR>/internal/tokenize/lexer_test.mbt:1375:26-1375:34:
     | ///|
     | /// Test multiline literal string tokenization
     | test "multiline literal string token" {
1375 |   let tokens = @tokenize.tokenize(
     |                          ^^^^^^^^
     |     (
     |       #|key = '''hello world'''

<WORKDIR>/internal/tokenize/lexer_test.mbt:1405:26-1405:34:
     | test "tokenize else branch coverage" {
     |   // This tests the else branch in tokenize function that should never be reached
     |   // The function returns inside the while loop, so the else is unreachable
1405 |   let tokens = @tokenize.tokenize(
     |                          ^^^^^^^^
     |     (
     |       #|key = "value"

<WORKDIR>/internal/tokenize/lexer_test.mbt:1433:26-1433:34:
     | ///|
     | /// Test multiline basic string with single quote escape
     | test "multiline basic string single quote escape" {
1433 |   let tokens = @tokenize.tokenize(
     |                          ^^^^^^^^
     |     (
     |       #|key = """line with \' quote"""

<WORKDIR>/internal/tokenize/lexer_test.mbt:1463:26-1463:34:
     | test "multiline basic string CR only" {
     |   // CR: '\r' is hard to visualize in the multipline string
     |   // explicit escaping is better for testing
1463 |   let tokens = @tokenize.tokenize("key = \"\"\"line1\\\rline2\"\"\"")
     |                          ^^^^^^^^
     |   debug_inspect(
     |     tokens,

<WORKDIR>/internal/tokenize/lexer_test.mbt:1489:15-1489:23:
     | test "multiline basic string none peek" {
     |   // This creates a string that will reach None in the peek() during processing
     |   let maybe_tokens = try
1489 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = """incomplete string

<WORKDIR>/internal/tokenize/lexer_test.mbt:1511:26-1511:34:
     | /// Test Unicode escape sequence that results in None from to_char
     | test "unicode escape invalid conversion to char" {
     |   // This tests an edge case where to_char returns None
1511 |   let tokens = @tokenize.tokenize(
     |                          ^^^^^^^^
     |     (
     |       #|key = "\uFFFF"

<WORKDIR>/internal/tokenize/lexer_test.mbt:1540:26-1540:34:
     | ///|
     | /// Test hex number with underscore in the middle
     | test "hex number with underscores" {
1540 |   let tokens = @tokenize.tokenize(
     |                          ^^^^^^^^
     |     (
     |       #|hex = 0xDE_AD_BE_EF

<WORKDIR>/internal/tokenize/lexer_test.mbt:1568:26-1568:34:
     | ///|
     | /// Test CR followed by LF after multiline string opening
     | test "multiline string opening CRLF" {
1568 |   let tokens = @tokenize.tokenize(
     |                          ^^^^^^^^
     |     (
     |       #|key = """

<WORKDIR>/internal/tokenize/lexer_test.mbt:1599:26-1599:34:
     | test "very large invalid float" {
     |   // A huge number that overflows to infinity during parsing
     |   let huge_number = "999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999.9999"
1599 |   let tokens = @tokenize.tokenize(
     |                          ^^^^^^^^
     |     (
     |       #|key =

<WORKDIR>/internal/tokenize/lexer_test.mbt:1623:17-1623:25:
     | test "test hex overflow edge case" {
     |   debug_inspect(
     |     try
1623 |       @tokenize.tokenize(
     |                 ^^^^^^^^
     |         (
     |           #|hex = 0xFFFFFFFFFFFFFFFF

<WORKDIR>/internal/tokenize/lexer_test.mbt:1645:15-1645:23:
     |   // Try to find a Unicode code that's valid as int but invalid as char
     |   // Code point 0x110000 is too large for valid Unicode
     |   let maybe_tokens = try
1645 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = "\U00110000"

<WORKDIR>/internal/tokenize/lexer_test.mbt:1667:15-1667:23:
     | test "multiline string abrupt end" {
     |   // Create a multiline string that ends abruptly without proper closing
     |   let maybe_tokens = try
1667 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = """content without closing

<WORKDIR>/internal/tokenize/lexer_test.mbt:1693:15-1693:23:
     |   // Try an edge case that might trigger the None path in unicode 8 escape
     |   // Use a very large value that might fail conversion
     |   let maybe_tokens = try
1693 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = "\U7FFFFFFF"

<WORKDIR>/internal/tokenize/lexer_test.mbt:1718:26-1718:34:
     | test "attempt hex digit error path" {
     |   // This tests the theoretical hex digit error path, though it's likely unreachable
     |   // due to pattern matching filtering
1718 |   let tokens = @tokenize.tokenize(
     |                          ^^^^^^^^
     |     (
     |       #|hex = 0xABCDEF123456

<WORKDIR>/internal/tokenize/lexer_test.mbt:1748:15-1748:23:
     | test "multiline string potential truncation" {
     |   // Try to create a scenario where multiline string processing might hit None
     |   let maybe_tokens = try
1748 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = """partial

<WORKDIR>/internal/tokenize/lexer_test.mbt:1767:15-1767:23:
     | ///|
     | test "trailing _ in binary number" {
     |   let maybe_tokens = try
1767 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = 0b10_10_

<WORKDIR>/internal/tokenize/lexer_test.mbt:1788:15-1788:23:
     | ///|
     | test "consequence _ in binary number" {
     |   let maybe_tokens = try
1788 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = 0b10__10_10

<WORKDIR>/internal/tokenize/lexer_test.mbt:1810:15-1810:23:
     | ///|
     | test "trailing _ in hex number" {
     |   let maybe_tokens = try
1810 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = 0xAB_CD_

<WORKDIR>/internal/tokenize/lexer_test.mbt:1831:15-1831:23:
     | ///|
     | test "consecutive _ in hex number" {
     |   let maybe_tokens = try
1831 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = 0xAB__CD_EF

<WORKDIR>/internal/tokenize/lexer_test.mbt:1853:15-1853:23:
     | ///|
     | test "trailing _ in octal number" {
     |   let maybe_tokens = try
1853 |     @tokenize.tokenize(
     |               ^^^^^^^^
     |       (
     |         #|key = 0o755_

<WORKDIR>/internal/tokenize/lexer_test.mbt:1874:15-1874:23:
     | ///|
     | test "consecutive _ in octal number" {
     |   let maybe_tokens = try
1874 |     @tokenize.tokenize(
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

<WORKDIR>/internal/tokenize/tokenize.mbt:1397:8-1397:16:
     | 
     | ///|
     | /// Tokenize entire input
1397 | pub fn tokenize(input : String) -> Array[Token] raise {
     |        ^^^^^^^^
     |   let lexer = @lexer.Lexer::Lexer(input)
     |   let tokens = Array::new()

<WORKDIR>/internal/tokenize/tokenize.mbt:1574:16-1574:24:
     | ///|
     | /// Test datetime tokenization
     | test "datetime tokenization" {
1574 |   let tokens = tokenize("date = 1979-05-27T07:32:00Z")
     |                ^^^^^^^^
     |   debug_inspect(
     |     tokens,

<WORKDIR>/parser.mbt:334:26-334:34:
    | /// containing the source location. Wrap the call in `try?` to receive a
    | /// `Result[TomlValue, Error]` instead.
    | pub fn parse(input : String) -> TomlValue raise {
334 |   let tokens = @tokenize.tokenize(input)
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

<WORKDIR>/parser_test.mbt:272:15-272:23:
    |     ),
    |   )
    |   debug_inspect(
272 |     @tokenize.tokenize("10e1 = \"b\""),
    |               ^^^^^^^^
    |     content=(
    |       #|[

<WORKDIR>/parser_test.mbt:291:15-291:23:
    |     ),
    |   )
    |   debug_inspect(
291 |     @tokenize.tokenize("-e-1 = \"c\""),
    |               ^^^^^^^^
    |     content=(
    |       #|[

<WORKDIR>/parser_test.mbt:309:15-309:23:
    |     ),
    |   )
    |   debug_inspect(
309 |     @tokenize.tokenize("-10e-1 = \"d\""),
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
