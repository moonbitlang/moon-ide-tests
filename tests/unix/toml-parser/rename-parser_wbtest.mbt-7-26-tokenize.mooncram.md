# toml-parser rename tokenize parser_wbtest.mbt:7:26

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
$ run_moon_ide moon ide rename 'tokenize' 'tokenize_renamed' --loc 'parser_wbtest.mbt:7:26'
*** Begin Patch
*** Update File: <WORKDIR>/coverage_improvement_test.mbt
@@
 ///|
 test "test tokenizer unreachable path coverage" {
   // This is trying to hit the unreachable else branch in tokenize function
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|simple = true
     ),
@@
   // Try to trigger integer parsing errors
 
   let tokens = try
-    @tokenize.tokenize("huge = 999999999999999999999999999999999999999")
+    @tokenize.tokenize_renamed("huge = 999999999999999999999999999999999999999")
   catch {
     err => Err(err)
   } noraise {
@@
 
 ///|
 test "test literal string handling" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|literal = 'this is a literal string'
     ),
@@
 
 ///|
 test "test mixed case hex digits" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|mixed_hex = 0xaBcDeF
     ),
*** Update File: <WORKDIR>/internal/tokenize/datetime_lexer_test.mbt
@@
 ///|
 /// Test LocalTime parsing - 2-digit start pattern
 test "lexer datetime LocalTime basic" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|time = 07:32:00
     ),
@@
 ///|
 /// Test LocalTime with fractional seconds
 test "lexer datetime LocalTime with fractional seconds" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|time = 07:32:00.999999
     ),
@@
 ///|
 /// Test LocalTime edge cases - midnight and end of day
 test "lexer datetime LocalTime edge times" {
-  let tokens1 = @tokenize.tokenize(
+  let tokens1 = @tokenize.tokenize_renamed(
     (
       #|time = 00:00:00
     ),
@@
       #|]
     ),
   )
-  let tokens2 = @tokenize.tokenize(
+  let tokens2 = @tokenize.tokenize_renamed(
     (
       #|time = 23:59:59
     ),
@@
 ///|
 /// Test LocalDate parsing - 4-digit start, no time component
 test "lexer datetime LocalDate basic" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|date = 1979-05-27
     ),
@@
 /// Test LocalDate edge cases - various years
 test "lexer datetime LocalDate various years" {
   // Historical date
-  let tokens1 = @tokenize.tokenize(
+  let tokens1 = @tokenize.tokenize_renamed(
     (
       #|date = 1900-01-01
     ),
@@
     ),
   )
   // Far future date
-  let tokens2 = @tokenize.tokenize(
+  let tokens2 = @tokenize.tokenize_renamed(
     (
       #|date = 9999-12-31
     ),
@@
     ),
   )
   // Leap year date
-  let tokens3 = @tokenize.tokenize(
+  let tokens3 = @tokenize.tokenize_renamed(
     (
       #|date = 2024-02-29
     ),
@@
 ///|
 /// Test LocalDateTime - date with T and time, no timezone
 test "lexer datetime LocalDateTime basic" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|datetime = 1979-05-27T07:32:00
     ),
@@
 ///|
 /// Test LocalDateTime with fractional seconds
 test "lexer datetime LocalDateTime with fractional seconds" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|datetime = 1979-05-27T00:32:00.999999
     ),
@@
 ///|
 /// Test OffsetDateTime with Z (UTC)
 test "lexer datetime OffsetDateTime with Z" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|datetime = 1979-05-27T07:32:00Z
     ),
@@
 ///|
 /// Test OffsetDateTime with Z and fractional seconds
 test "lexer datetime OffsetDateTime Z with fractional" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|datetime = 1979-05-27T07:32:00.123456Z
     ),
@@
 ///|
 /// Test OffsetDateTime with positive offset
 test "lexer datetime OffsetDateTime positive offset" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|datetime = 1979-05-27T00:32:00+07:00
     ),
@@
 ///|
 /// Test OffsetDateTime with negative offset
 test "lexer datetime OffsetDateTime negative offset" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|datetime = 1979-05-27T00:32:00-07:00
     ),
@@
 ///|
 /// Test OffsetDateTime with offset and fractional seconds
 test "lexer datetime OffsetDateTime offset with fractional" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|datetime = 1979-05-27T00:32:00.999999-07:00
     ),
@@
 /// Test OffsetDateTime with various timezone offsets
 test "lexer datetime OffsetDateTime various offsets" {
   // +00:00 (UTC)
-  let tokens1 = @tokenize.tokenize(
+  let tokens1 = @tokenize.tokenize_renamed(
     (
       #|dt = 2023-01-01T12:00:00+00:00
     ),
@@
     ),
   )
   // -00:00 (UTC)
-  let tokens2 = @tokenize.tokenize(
+  let tokens2 = @tokenize.tokenize_renamed(
     (
       #|dt = 2023-01-01T12:00:00-00:00
     ),
@@
     ),
   )
   // +14:00 (max positive)
-  let tokens3 = @tokenize.tokenize(
+  let tokens3 = @tokenize.tokenize_renamed(
     (
       #|dt = 2023-01-01T12:00:00+14:00
     ),
@@
     ),
   )
   // -12:00 (max negative)
-  let tokens4 = @tokenize.tokenize(
+  let tokens4 = @tokenize.tokenize_renamed(
     (
       #|dt = 2023-01-01T12:00:00-12:00
     ),
@@
     ),
   )
   // Half-hour offset (India +05:30)
-  let tokens5 = @tokenize.tokenize(
+  let tokens5 = @tokenize.tokenize_renamed(
     (
       #|dt = 2023-01-01T12:00:00+05:30
     ),
@@
 ///|
 /// Test multiple datetime values in same TOML
 test "lexer datetime multiple datetimes" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|time = 12:30:00
       #|date = 2023-06-15
@@
 ///|
 /// Test datetime in array context
 test "lexer datetime in array" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|dates = [2023-01-01, 2023-06-15, 2023-12-31]
     ),
@@
 ///|
 /// Test datetime followed by comment
 test "lexer datetime with comment" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|date = 2023-06-15 # deployment date
     ),
@@
 /// Test LocalTime with various fractional second precisions
 test "lexer datetime LocalTime fractional precision" {
   // 1 digit
-  let tokens1 = @tokenize.tokenize(
+  let tokens1 = @tokenize.tokenize_renamed(
     (
       #|time = 12:30:45.1
     ),
@@
     ),
   )
   // 3 digits (milliseconds)
-  let tokens2 = @tokenize.tokenize(
+  let tokens2 = @tokenize.tokenize_renamed(
     (
       #|time = 12:30:45.123
     ),
@@
     ),
   )
   // 6 digits (microseconds)
-  let tokens3 = @tokenize.tokenize(
+  let tokens3 = @tokenize.tokenize_renamed(
     (
       #|time = 12:30:45.123456
     ),
@@
     ),
   )
   // 9 digits (nanoseconds)
-  let tokens4 = @tokenize.tokenize(
+  let tokens4 = @tokenize.tokenize_renamed(
     (
       #|time = 12:30:45.123456789
     ),
@@
 ///|
 /// Test inline table with datetime
 test "lexer datetime in inline table" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|event = { date = 2023-06-15, time = 09:00:00 }
     ),
@@
 test "lexer datetime disambiguation" {
   // Date followed by something that's NOT a time (no T)
   // This should parse as LocalDate only
-  let tokens1 = @tokenize.tokenize(
+  let tokens1 = @tokenize.tokenize_renamed(
     (
       #|date = 2023-06-15
       #|other = 123
@@
 /// Test TOML spec RFC 3339 examples
 test "lexer datetime RFC 3339 spec examples" {
   // Examples from TOML 1.0 spec
-  let tokens1 = @tokenize.tokenize(
+  let tokens1 = @tokenize.tokenize_renamed(
     (
       #|odt1 = 1979-05-27T07:32:00Z
     ),
@@
       #|]
     ),
   )
-  let tokens2 = @tokenize.tokenize(
+  let tokens2 = @tokenize.tokenize_renamed(
     (
       #|odt2 = 1979-05-27T00:32:00-07:00
     ),
@@
       #|]
     ),
   )
-  let tokens3 = @tokenize.tokenize(
+  let tokens3 = @tokenize.tokenize_renamed(
     (
       #|odt3 = 1979-05-27T00:32:00.999999-07:00
     ),
@@
       #|]
     ),
   )
-  let tokens4 = @tokenize.tokenize(
+  let tokens4 = @tokenize.tokenize_renamed(
     (
       #|ldt1 = 1979-05-27T07:32:00
     ),
@@
       #|]
     ),
   )
-  let tokens5 = @tokenize.tokenize(
+  let tokens5 = @tokenize.tokenize_renamed(
     (
       #|ldt2 = 1979-05-27T00:32:00.999999
     ),
@@
       #|]
     ),
   )
-  let tokens6 = @tokenize.tokenize(
+  let tokens6 = @tokenize.tokenize_renamed(
     (
       #|ld1 = 1979-05-27
     ),
@@
       #|]
     ),
   )
-  let tokens7 = @tokenize.tokenize(
+  let tokens7 = @tokenize.tokenize_renamed(
     (
       #|lt1 = 07:32:00
     ),
@@
       #|]
     ),
   )
-  let tokens8 = @tokenize.tokenize(
+  let tokens8 = @tokenize.tokenize_renamed(
     (
       #|lt2 = 00:32:00.999999
     ),
@@
 /// Test year boundary dates
 test "lexer datetime year boundaries" {
   // Start of year
-  let tokens1 = @tokenize.tokenize(
+  let tokens1 = @tokenize.tokenize_renamed(
     (
       #|date = 2023-01-01
     ),
@@
     ),
   )
   // End of year
-  let tokens2 = @tokenize.tokenize(
+  let tokens2 = @tokenize.tokenize_renamed(
     (
       #|date = 2023-12-31
     ),
@@
     ),
   )
   // New Year's Eve 23:59:59
-  let tokens3 = @tokenize.tokenize(
+  let tokens3 = @tokenize.tokenize_renamed(
     (
       #|dt = 2023-12-31T23:59:59
     ),
@@
     ),
   )
   // New Year's Day 00:00:00
-  let tokens4 = @tokenize.tokenize(
+  let tokens4 = @tokenize.tokenize_renamed(
     (
       #|dt = 2024-01-01T00:00:00Z
     ),
*** Update File: <WORKDIR>/internal/tokenize/lexer_bug_test.mbt
@@
 ///|
 test "test invalid float parsing" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|invalid = 1.2.3
       ),
@@
 ///|
 test "test invalid hex digit error" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|hex = 0xGHI
       ),
@@
 ///|
 test "test octal without digits" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|test = 0o
       ),
@@
 ///|
 test "test binary without digits" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|test = 0b
       ),
@@
 ///|
 test "test hex with invalid delimiter" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|hex = 0x123XYZ
       ),
@@
 ///|
 test "test hex regex is anchored to current view" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|hex = 0xG0x10
       ),
@@
 
 ///|
 test "test datetime timezone regex is anchored to current view" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|dt = 2023-06-15T12:30:00xZ
     ),
@@
 ///|
 test "test octal regex is anchored to current view" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|oct = 0o80o7
       ),
@@
 ///|
 test "test binary regex is anchored to current view" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|bin = 0b20b10
       ),
@@
 
 ///|
 test "test hex with valid delimiters" {
-  let tokens1 = @tokenize.tokenize(
+  let tokens1 = @tokenize.tokenize_renamed(
     (
       #|hex = 0x123A
     ),
@@
       #|]
     ),
   )
-  let tokens2 = @tokenize.tokenize(
+  let tokens2 = @tokenize.tokenize_renamed(
     (
       #|arr = [0x123A, 0xB]
     ),
@@
 
 ///|
 test "test hex case variations" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|hex = 0xaBcDeF
     ),
@@
 ///|
 test "test octal with invalid digits" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|oct = 0o789
       ),
@@
 
 ///|
 test "test octal with valid delimiters" {
-  let tokens1 = @tokenize.tokenize(
+  let tokens1 = @tokenize.tokenize_renamed(
     (
       #|oct = 0o755
     ),
@@
       #|]
     ),
   )
-  let tokens2 = @tokenize.tokenize(
+  let tokens2 = @tokenize.tokenize_renamed(
     (
       #|arr = [0o644, 0o755]
     ),
@@
 ///|
 test "test binary with invalid digits" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|bin = 0b1012
       ),
@@
 
 ///|
 test "test binary with valid delimiters" {
-  let tokens1 = @tokenize.tokenize(
+  let tokens1 = @tokenize.tokenize_renamed(
     (
       #|bin = 0b1010
     ),
@@
       #|]
     ),
   )
-  let tokens2 = @tokenize.tokenize(
+  let tokens2 = @tokenize.tokenize_renamed(
     (
       #|arr = [0b101, 0b110]
     ),
*** Update File: <WORKDIR>/internal/tokenize/lexer_test.mbt
@@
 ///|
 /// Tests for the TOML lexer
 test "tokenize simple key-value" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|key = "value"
     ),
@@
 
 ///|
 test "tokenize integer" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|number = 42
     ),
@@
 
 ///|
 test "tokenize float" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|pi = 3.14
     ),
@@
 
 ///|
 test "tokenize boolean" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|enabled = true
     ),
@@
 
 ///|
 test "tokenize array syntax" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|[1, 2, 3]
     ),
@@
 
 ///|
 test "tokenize with comments" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|key = "value" # this is a comment
     ),
@@
 
 ///|
 test "tokenize multiline" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|key1 = "value1"
       #|key2 = 42
@@
 
 ///|
 test "unicode or emoji" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|key1 = "💩"
       #|key2 = "💩"
@@
 
 ///|
 test "test LeftBrace token JSON serialization" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|{}
     ),
@@
 
 ///|
 test "test RightBrace token JSON serialization" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|}
     ),
@@
 
 ///|
 test "test Dot token JSON serialization" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|.
     ),
@@
 ///|
 /// Test special number formats
 test "tokenize hexadecimal numbers" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|hex = 0xDEAD
     ),
@@
       #|]
     ),
   )
-  let tokens2 = @tokenize.tokenize(
+  let tokens2 = @tokenize.tokenize_renamed(
     (
       #|hex2 = 0X1F
     ),
@@
 
 ///|
 test "tokenize octal numbers" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|oct = 0o755
     ),
@@
       #|]
     ),
   )
-  let tokens2 = @tokenize.tokenize(
+  let tokens2 = @tokenize.tokenize_renamed(
     (
       #|oct2 = 0O123
     ),
@@
 
 ///|
 test "tokenize binary numbers" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|bin = 0b1101
     ),
@@
       #|]
     ),
   )
-  let tokens2 = @tokenize.tokenize(
+  let tokens2 = @tokenize.tokenize_renamed(
     (
       #|bin2 = 0B101010
     ),
@@
 
 ///|
 test "tokenize numbers with underscores" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|num = 1_000_000
     ),
@@
       #|]
     ),
   )
-  let tokens2 = @tokenize.tokenize(
+  let tokens2 = @tokenize.tokenize_renamed(
     (
       #|float_val = 3.14_159
     ),
@@
       #|]
     ),
   )
-  let tokens3 = @tokenize.tokenize(
+  let tokens3 = @tokenize.tokenize_renamed(
     (
       #|hex_under = 0xFF_FF
     ),
@@
 
 ///|
 test "tokenize special hex digits" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|hex_digits = 0x0123456789ABCDEF
     ),
@@
 ///|
 /// Test uncovered escape sequences and error conditions
 test "test escaped single quote in string" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|key = "test\' quote"
     ),
@@
 ///|
 test "test invalid escape sequence error" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|key = "test\z invalid"
       ),
@@
 ///|
 test "test unterminated string error" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|key = "unterminated
       ),
@@
 ///|
 test "test unexpected end after escape" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|key = "test\
       ),
@@
 ///|
 test "test invalid characters" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|key @ value
       ),
@@
 
 ///|
 test "test binary number with underscores" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|bin = 0b1010_1100
     ),
@@
 
 ///|
 test "test dash-starting identifier tokenized before parser validation" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|key = -abc
     ),
@@
 ///|
 /// Test Unicode 4-digit escape with lowercase hex letters
 test "unicode 4 escape lowercase hex" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|key = "\uabcd"
     ),
@@
 ///|
 /// Test Unicode 4-digit escape with uppercase hex letters
 test "unicode 4 escape uppercase hex" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|key = "\uABCD"
     ),
@@
 /// Test Unicode 4-digit escape invalid hex digit
 test "unicode 4 escape invalid hex" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|key = "\uGHIJ"
       ),
@@
 /// Test Unicode 4-digit escape incomplete sequence
 test "unicode 4 escape incomplete" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|key = "\u123"
       ),
@@
 /// Test Unicode 4-digit escape invalid code point
 test "unicode 4 escape invalid code point" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|key = "\uD800"
       ),
@@
 ///|
 /// Test Unicode 8-digit escape with lowercase hex letters
 test "unicode 8 escape lowercase hex" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|key = "\U000000ab"
     ),
@@
 ///|
 /// Test Unicode 8-digit escape with uppercase hex letters
 test "unicode 8 escape uppercase hex" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|key = "\U000000AB"
     ),
@@
 /// Test Unicode 8-digit escape invalid hex digit
 test "unicode 8 escape invalid hex" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|key = "\U0000000G"
       ),
@@
 /// Test Unicode 8-digit escape incomplete sequence
 test "unicode 8 escape incomplete" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|key = "\U0000001"
       ),
@@
 /// Test Unicode 8-digit escape invalid code point (too large)
 test "unicode 8 escape invalid code point large" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|key = "\U00110000"
       ),
@@
 /// Test Unicode 8-digit escape invalid code point (surrogate range)
 test "unicode 8 escape invalid code point surrogate" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|key = "\U0000D800"
       ),
@@
 /// Test Unicode 8-digit escape invalid code point conversion
 test "unicode 8 escape invalid conversion" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|key = "\U7FFFFFFF"
       ),
@@
 ///|
 /// Test backspace escape sequence
 test "backspace escape sequence" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|key = "test\b"
     ),
@@
 ///|
 /// Test form feed escape sequence
 test "form feed escape sequence" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|key = "test\f"
     ),
@@
 ///|
 /// Test multiline basic string with escape sequences
 test "multiline basic string escapes" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|key = """line1\nline2\tindented"""
     ),
@@
 ///|
 /// Test multiline basic string with all escape types
 test "multiline basic string all escapes" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|key = """\n\t\r\\\"\b\f\u0041\U00000042"""
     ),
@@
 ///|
 /// Test multiline basic string with line ending backslash and CR
 test "multiline basic string line ending backslash CR" {
-  let tokens = @tokenize.tokenize("key = \"\"\"line1\\\r\n   line2\"\"\"")
+  let tokens = @tokenize.tokenize_renamed("key = \"\"\"line1\\\r\n   line2\"\"\"")
   debug_inspect(
     tokens,
     content=(
@@
 /// Test multiline basic string invalid escape
 test "multiline basic string invalid escape" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|key = """\z"""
       ),
@@
 /// Test multiline basic string unexpected end after escape
 test "multiline basic string unexpected end after escape" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|key = """\
       ),
@@
 /// Test multiline basic string unterminated
 test "multiline basic string unterminated" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|key = """incomplete
       ),
@@
 /// Test multiline basic string early termination in loop
 test "multiline basic string early termination" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|key = """line
       ),
@@
 ///|
 /// Test multiline literal string with CR+LF
 test "multiline literal string CRLF" {
-  let tokens = @tokenize.tokenize("key = '''line1\r\nline2'''")
+  let tokens = @tokenize.tokenize_renamed("key = '''line1\r\nline2'''")
   debug_inspect(
     tokens,
     content=(
@@
 /// Test multiline literal string unterminated
 test "multiline literal string unterminated" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|key = '''incomplete
       ),
@@
 test "hex number invalid digit error path" {
   // This should fail because there are no hex digits after 0x
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|key = 0x
       ),
@@
 test "invalid float error" {
   // This should trigger the invalid float error in read_number
   // but the current implementation may parse it differently
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|key = 3.14
     ),
@@
 ///|
 /// Test multiline literal string tokenization
 test "multiline literal string token" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|key = '''hello world'''
     ),
@@
 test "tokenize else branch coverage" {
   // This tests the else branch in tokenize function that should never be reached
   // The function returns inside the while loop, so the else is unreachable
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|key = "value"
     ),
@@
 ///|
 /// Test multiline basic string with single quote escape
 test "multiline basic string single quote escape" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|key = """line with \' quote"""
     ),
@@
 test "multiline basic string CR only" {
   // CR: '\r' is hard to visualize in the multipline string
   // explicit escaping is better for testing
-  let tokens = @tokenize.tokenize("key = \"\"\"line1\\\rline2\"\"\"")
+  let tokens = @tokenize.tokenize_renamed("key = \"\"\"line1\\\rline2\"\"\"")
   debug_inspect(
     tokens,
     content=(
@@
 test "multiline basic string none peek" {
   // This creates a string that will reach None in the peek() during processing
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|key = """incomplete string
       ),
@@
 /// Test Unicode escape sequence that results in None from to_char
 test "unicode escape invalid conversion to char" {
   // This tests an edge case where to_char returns None
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|key = "\uFFFF"
     ),
@@
 ///|
 /// Test hex number with underscore in the middle
 test "hex number with underscores" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|hex = 0xDE_AD_BE_EF
     ),
@@
 ///|
 /// Test CR followed by LF after multiline string opening
 test "multiline string opening CRLF" {
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|key = """
       #|content"""
@@
 test "very large invalid float" {
   // A huge number that overflows to infinity during parsing
   let huge_number = "999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999.9999"
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|key =
     ) +
@@
 /// Test edge case for hex digit error handling  
 test "test hex overflow edge case" {
   // Test a hex number that might cause overflow issues
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|hex = 0xFFFFFFFFFFFFFFFF
     ),
@@
   // Try to find a Unicode code that's valid as int but invalid as char
   // Code point 0x110000 is too large for valid Unicode
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|key = "\U00110000"
       ),
@@
 test "multiline string abrupt end" {
   // Create a multiline string that ends abruptly without proper closing
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|key = """content without closing
       ),
@@
   // Try an edge case that might trigger the None path in unicode 8 escape
   // Use a very large value that might fail conversion
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|key = "\U7FFFFFFF"
       ),
@@
 test "attempt hex digit error path" {
   // This tests the theoretical hex digit error path, though it's likely unreachable
   // due to pattern matching filtering
-  let tokens = @tokenize.tokenize(
+  let tokens = @tokenize.tokenize_renamed(
     (
       #|hex = 0xABCDEF123456
     ),
@@
 test "multiline string potential truncation" {
   // Try to create a scenario where multiline string processing might hit None
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|key = """partial
       ),
@@
 ///|
 test "trailing _ in binary number" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|key = 0b10_10_
       ),
@@
 ///|
 test "consequence _ in binary number" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|key = 0b10__10_10
       ),
@@
 ///|
 test "trailing _ in hex number" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|key = 0xAB_CD_
       ),
@@
 ///|
 test "consecutive _ in hex number" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|key = 0xAB__CD_EF
       ),
@@
 ///|
 test "trailing _ in octal number" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|key = 0o755_
       ),
@@
 ///|
 test "consecutive _ in octal number" {
   let maybe_tokens = try
-    @tokenize.tokenize(
+    @tokenize.tokenize_renamed(
       (
         #|key = 0o7__55_44
       ),
*** Update File: <WORKDIR>/internal/tokenize/test_utils_test.mbt
@@
 
 ///|
 fn lexer_expect_to_fail(input : String) -> String {
-  try @tokenize.tokenize(input) catch {
+  try @tokenize.tokenize_renamed(input) catch {
     error => unwrap_failure_message(error)
   } noraise {
     _ => abort("Expected lexer failure but tokenize succeeded")
*** Update File: <WORKDIR>/internal/tokenize/tokenize.mbt
@@
 
 ///|
 /// Tokenize entire input
-pub fn tokenize(input : String) -> Array[Token] raise {
+pub fn tokenize_renamed(input : String) -> Array[Token] raise {
   let lexer = @lexer.Lexer::Lexer(input)
   let tokens = Array::new()
   for current_token = lexer.next_token() {
@@
 ///|
 /// Test datetime tokenization
 test "datetime tokenization" {
-  let tokens = tokenize("date = 1979-05-27T07:32:00Z")
+  let tokens = tokenize_renamed("date = 1979-05-27T07:32:00Z")
   debug_inspect(
     tokens,
     content=(
*** Update File: <WORKDIR>/parser.mbt
@@
 /// containing the source location. Wrap the call in `try?` to receive a
 /// `Result[TomlValue, Error]` instead.
 pub fn parse(input : String) -> TomlValue raise {
-  let tokens = @tokenize.tokenize(input)
+  let tokens = @tokenize.tokenize_renamed(input)
   let parser = Parser::Parser(tokens)
   let main_table = {}
   for current_table = main_table {
*** Update File: <WORKDIR>/parser_test.mbt
@@
 test "tokenize exponent-like bare keys" {
   // Each line shows how the tokenizer sees an exponent-like key followed by `= "val"`
   debug_inspect(
-    @tokenize.tokenize("10e-1 = \"a\""),
+    @tokenize.tokenize_renamed("10e-1 = \"a\""),
     content=(
       #|[
       #|  Identifier(
@@
     ),
   )
   debug_inspect(
-    @tokenize.tokenize("10e1 = \"b\""),
+    @tokenize.tokenize_renamed("10e1 = \"b\""),
     content=(
       #|[
       #|  Identifier(
@@
     ),
   )
   debug_inspect(
-    @tokenize.tokenize("-e-1 = \"c\""),
+    @tokenize.tokenize_renamed("-e-1 = \"c\""),
     content=(
       #|[
       #|  Identifier(
@@
     ),
   )
   debug_inspect(
-    @tokenize.tokenize("-10e-1 = \"d\""),
+    @tokenize.tokenize_renamed("-10e-1 = \"d\""),
     content=(
       #|[
       #|  FloatToken(
*** Update File: <WORKDIR>/parser_wbtest.mbt
@@
 ///|
 test "parse_dotted_key - simple identifier" {
   // Test parsing a simple identifier key
-  let tokens = @tokenize.tokenize("simple")
+  let tokens = @tokenize.tokenize_renamed("simple")
   let parser = Parser::Parser(tokens)
   let result = parser.parse_dotted_key()
   debug_inspect(
@@
 ///|
 test "parse_dotted_key - dotted identifiers" {
   // Test parsing dotted identifier keys
-  let tokens = @tokenize.tokenize("server.host.name")
+  let tokens = @tokenize.tokenize_renamed("server.host.name")
   let parser = Parser::Parser(tokens)
   let result = parser.parse_dotted_key()
   debug_inspect(
@@
 ///|
 test "parse_dotted_key - string keys" {
   // Test parsing quoted string keys
-  let tokens = @tokenize.tokenize("\"quoted key\".\"another quoted\"")
+  let tokens = @tokenize.tokenize_renamed("\"quoted key\".\"another quoted\"")
   let parser = Parser::Parser(tokens)
   let result = parser.parse_dotted_key()
   debug_inspect(
@@
 ///|
 test "parse_dotted_key - integer keys" {
   // Test parsing integer keys - note these will be tokenized as floats
-  let tokens = @tokenize.tokenize("123.456.789")
+  let tokens = @tokenize.tokenize_renamed("123.456.789")
   let parser = Parser::Parser(tokens)
   let result = parser.parse_dotted_key()
   debug_inspect(
@@
 ///|
 test "parse_dotted_key - string and integer mixed" {
   // Test parsing string followed by integer
-  let tokens = @tokenize.tokenize("\"key\".123")
+  let tokens = @tokenize.tokenize_renamed("\"key\".123")
   let parser = Parser::Parser(tokens)
   let result = parser.parse_dotted_key()
   debug_inspect(
@@
 ///|
 test "parse_dotted_key - mixed key types" {
   // Test parsing mixed key types
-  let tokens = @tokenize.tokenize("server.\"port number\".config")
+  let tokens = @tokenize.tokenize_renamed("server.\"port number\".config")
   let parser = Parser::Parser(tokens)
   let result = parser.parse_dotted_key()
   debug_inspect(
@@
 test "parse_dotted_key - float token as dotted keys" {
   // Test the special case where tokenizer sees "1.2" as a float
   // but we need to treat it as dotted keys "1.2"
-  let tokens = @tokenize.tokenize("1.2")
+  let tokens = @tokenize.tokenize_renamed("1.2")
   let parser = Parser::Parser(tokens)
   let result = parser.parse_dotted_key()
   debug_inspect(
@@
 ///|
 test "parse_dotted_key - float token with additional dots" {
   // Test float token followed by more dotted keys
-  let tokens = @tokenize.tokenize("1.2.config.value")
+  let tokens = @tokenize.tokenize_renamed("1.2.config.value")
   let parser = Parser::Parser(tokens)
   let result = parser.parse_dotted_key()
   debug_inspect(
@@
 test "parse_dotted_key - float token without dot" {
   // Test float token that doesn't actually contain a dot (edge case)
   // We'll use a simpler test with a float that gets parsed as a single key
-  let tokens = @tokenize.tokenize("42.0")
+  let tokens = @tokenize.tokenize_renamed("42.0")
   let parser = Parser::Parser(tokens)
   let result = parser.parse_dotted_key()
   debug_inspect(
@@
 ///|
 test "parse_dotted_key - complex nested structure" {
   // Test a complex real-world-like dotted key
-  let tokens = @tokenize.tokenize("database.connections.\"primary-db\".host")
+  let tokens = @tokenize.tokenize_renamed("database.connections.\"primary-db\".host")
   let parser = Parser::Parser(tokens)
   let result = parser.parse_dotted_key()
   debug_inspect(
@@
 ///|
 test "parse_dotted_key - single quoted string" {
   // Test single quoted string key
-  let tokens = @tokenize.tokenize("\"key\"")
+  let tokens = @tokenize.tokenize_renamed("\"key\"")
   let parser = Parser::Parser(tokens)
   let result = parser.parse_dotted_key()
   debug_inspect(
@@
 ///|
 test "parse_dotted_key - single integer" {
   // Test single integer key
-  let tokens = @tokenize.tokenize("42")
+  let tokens = @tokenize.tokenize_renamed("42")
   let parser = Parser::Parser(tokens)
   let result = parser.parse_dotted_key()
   debug_inspect(
@@
 ///|
 test "parse_dotted_key - error cases" {
   // Test error when no key is found
-  let tokens = @tokenize.tokenize("=")
+  let tokens = @tokenize.tokenize_renamed("=")
   let parser = Parser::Parser(tokens)
   guard (try parser.parse_dotted_key() catch {
       err => Err(err)
@@
 ///|
 test "parse_dotted_key - error after dot" {
   // Test error when dot is followed by invalid token
-  let tokens = @tokenize.tokenize("key.=")
+  let tokens = @tokenize.tokenize_renamed("key.=")
   let parser = Parser::Parser(tokens)
   guard (try parser.parse_dotted_key() catch {
       err => Err(err)
@@
 ///|
 test "parse_dotted_key - numeric float with continuation" {
   // Test numeric float like "3.14" followed by more keys
-  let tokens = @tokenize.tokenize("3.14.config")
+  let tokens = @tokenize.tokenize_renamed("3.14.config")
   let parser = Parser::Parser(tokens)
   let result = parser.parse_dotted_key()
   debug_inspect(
@@
 ///|
 test "parse_dotted_key - zero values" {
   // Test with zero values in keys
-  let tokens = @tokenize.tokenize("0.0.config")
+  let tokens = @tokenize.tokenize_renamed("0.0.config")
   let parser = Parser::Parser(tokens)
   let result = parser.parse_dotted_key()
   debug_inspect(
*** End Patch

```
