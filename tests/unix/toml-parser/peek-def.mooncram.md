# toml-parser peek-def

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
$ run_moon_ide moon ide peek-def 'key_variations_toml' --loc 'additional_official_tests_test.mbt:8:7'
Definition found at file <WORKDIR>/additional_official_tests_test.mbt
  | ///| These provide additional coverage of edge cases and complex scenarios
  | 
  | ///|
  | /// Test key names with various characters
  | test "key name variations" {
8 |   let key_variations_toml =
  |       ^^^^^^^^^^^^^^^^^^^
  |     #|bare_key = "value"
  |     #|bare-key = "value"
  |     #|bare_key2 = "value"
  |     #|"127.0.0.1" = "value"
  |     #|"character encoding" = "value"
  |     #|"ʎǝʞ" = "value"
  |     #|
  |   debug_inspect(
  |     @toml.parse(key_variations_toml),
  |     content=(
  |       #|TomlTable(
  |       #|  {
  |       #|    "bare_key": TomlString("value"),
  |       #|    "bare-key": TomlString("value"),
```

```mooncram
$ run_moon_ide moon ide peek-def 'parse' --loc 'additional_official_tests_test.mbt:17:11'
Definition found at file <WORKDIR>/parser.mbt
    | /// escapes, inline-table newlines) are accepted.
    | ///
    | /// On any lexical or syntactic error, `parse` raises with a message
    | /// containing the source location. Wrap the call in `try?` to receive a
    | /// `Result[TomlValue, Error]` instead.
333 | pub fn parse(input : String) -> TomlValue raise {
    |        ^^^^^
    |   let tokens = @tokenize.tokenize(input)
    |   let parser = Parser::Parser(tokens)
    |   let main_table = Map([])
    |   for current_table = main_table {
    |     parser.skip_newlines()
    |     match parser.view() {
    |       [EOF, ..] => break
    |       [LeftBracket(loc=loc1), LeftBracket(loc=loc2), .. rest] => {
    |         if !loc1.adjacent(loc2) {
    |           parser.error("Invalid table header: space between '[' and '['")
    |         }
    |         parser.update_view(rest)
    |         let table_path = parser.parse_table_path()
    |         match parser.view() {
```

```mooncram
$ run_moon_ide moon ide peek-def 'result' --loc 'coverage_improvement_comprehensive_test.mbt:9:7'
Definition found at file <WORKDIR>/coverage_improvement_comprehensive_test.mbt
  | 
  | ///|
  | /// Test EOF handling in parser - covered by creating empty token arrays
  | test "parser_eof_handling" {
  |   // Test empty parse input to exercise EOF conditions
9 |   let result = @toml.parse(
  |       ^^^^^^
  |     (
  |       #|
  |     ),
  |   )
  |   debug_inspect(
  |     result,
  |     content=(
  |       #|TomlTable({})
  |     ),
  |   )
  | }
  | 
  | ///|
  | /// Test integer keys in inline tables
```

```mooncram
$ run_moon_ide moon ide peek-def 'parse' --loc 'coverage_improvement_comprehensive_test.mbt:9:22'
Definition found at file <WORKDIR>/parser.mbt
    | /// escapes, inline-table newlines) are accepted.
    | ///
    | /// On any lexical or syntactic error, `parse` raises with a message
    | /// containing the source location. Wrap the call in `try?` to receive a
    | /// `Result[TomlValue, Error]` instead.
333 | pub fn parse(input : String) -> TomlValue raise {
    |        ^^^^^
    |   let tokens = @tokenize.tokenize(input)
    |   let parser = Parser::Parser(tokens)
    |   let main_table = Map([])
    |   for current_table = main_table {
    |     parser.skip_newlines()
    |     match parser.view() {
    |       [EOF, ..] => break
    |       [LeftBracket(loc=loc1), LeftBracket(loc=loc2), .. rest] => {
    |         if !loc1.adjacent(loc2) {
    |           parser.error("Invalid table header: space between '[' and '['")
    |         }
    |         parser.update_view(rest)
    |         let table_path = parser.parse_table_path()
    |         match parser.view() {
```

```mooncram
$ run_moon_ide moon ide peek-def 'TomlDateTime' --loc 'datetime/datetime.mbt:13:15'
Definition found at file <WORKDIR>/datetime/datetime.mbt
   | /// - `LocalTime` — time only (e.g. `07:32:00`)
   | ///
   | /// Values are stored as their original string form. The parser preserves
   | /// the spelling supplied in the TOML source; it does not normalize or
   | /// validate the underlying calendar arithmetic.
13 | pub(all) enum TomlDateTime {
   |               ^^^^^^^^^^^^
   |   OffsetDateTime(String)
   |   LocalDateTime(String)
   |   LocalDate(String)
   |   LocalTime(String)
   | } derive(Eq, Debug)
   | 
   | ///|
   | #deprecated("compare with `==`; the Eq impl is unaffected")
   | pub extend TomlDateTime with Eq::{not_equal, equal}
   | 
   | ///|
   | #deprecated("render via the Debug trait, e.g. `debug_inspect`")
   | pub extend TomlDateTime with Debug::{to_repr}
   | 
```

```mooncram
$ run_moon_ide moon ide peek-def 'OffsetDateTime' --loc 'datetime/datetime.mbt:14:3'
Definition found at file <WORKDIR>/datetime/datetime.mbt
   | ///
   | /// Values are stored as their original string form. The parser preserves
   | /// the spelling supplied in the TOML source; it does not normalize or
   | /// validate the underlying calendar arithmetic.
   | pub(all) enum TomlDateTime {
14 |   OffsetDateTime(String)
   |   ^^^^^^^^^^^^^^
   |   LocalDateTime(String)
   |   LocalDate(String)
   |   LocalTime(String)
   | } derive(Eq, Debug)
   | 
   | ///|
   | #deprecated("compare with `==`; the Eq impl is unaffected")
   | pub extend TomlDateTime with Eq::{not_equal, equal}
   | 
   | ///|
   | #deprecated("render via the Debug trait, e.g. `debug_inspect`")
   | pub extend TomlDateTime with Debug::{to_repr}
   | 
   | ///|
```

```mooncram
$ run_moon_ide moon ide peek-def 'offset_dt1' --loc 'datetime_extended_test.mbt:4:7'
Definition found at file <WORKDIR>/datetime_extended_test.mbt
  | ///|
  | /// Extended datetime tests for improved coverage
  | test "test TomlDateTime types and equality" {
4 |   let offset_dt1 = @datetime.OffsetDateTime("1979-05-27T07:32:00Z")
  |       ^^^^^^^^^^
  |   let offset_dt2 = @datetime.OffsetDateTime("1979-05-27T07:32:00Z")
  |   let offset_dt3 = @datetime.OffsetDateTime("1980-05-27T07:32:00Z")
  |   debug_inspect(offset_dt1 == offset_dt2, content="true")
  |   debug_inspect(offset_dt1 == offset_dt3, content="false")
  |   let local_dt = @datetime.LocalDateTime("1979-05-27T07:32:00")
  |   let local_date = @datetime.LocalDate("1979-05-27")
  |   let local_time = @datetime.LocalTime("07:32:00")
  |   debug_inspect(offset_dt1 == local_dt, content="false")
  |   debug_inspect(local_dt == local_date, content="false")
  |   debug_inspect(local_date == local_time, content="false")
  | }
  | 
  | ///|
  | test "test datetime token debug representation" {
```

```mooncram
$ run_moon_ide moon ide peek-def 'OffsetDateTime' --loc 'datetime_extended_test.mbt:4:30'
Definition found at file <WORKDIR>/datetime/datetime.mbt
   | ///
   | /// Values are stored as their original string form. The parser preserves
   | /// the spelling supplied in the TOML source; it does not normalize or
   | /// validate the underlying calendar arithmetic.
   | pub(all) enum TomlDateTime {
14 |   OffsetDateTime(String)
   |   ^^^^^^^^^^^^^^
   |   LocalDateTime(String)
   |   LocalDate(String)
   |   LocalTime(String)
   | } derive(Eq, Debug)
   | 
   | ///|
   | #deprecated("compare with `==`; the Eq impl is unaffected")
   | pub extend TomlDateTime with Eq::{not_equal, equal}
   | 
   | ///|
   | #deprecated("render via the Debug trait, e.g. `debug_inspect`")
   | pub extend TomlDateTime with Debug::{to_repr}
   | 
   | ///|
```

```mooncram
$ run_moon_ide moon ide peek-def 'tokens' --loc 'internal/tokenize/lexer_test.mbt:4:7'
Definition found at file <WORKDIR>/internal/tokenize/lexer_test.mbt
  | ///|
  | /// Tests for the TOML lexer
  | test "tokenize simple key-value" {
4 |   let tokens = @tokenize.tokenize(
  |       ^^^^^^
  |     (
  |       #|key = "value"
  |     ),
  |   )
  |   debug_inspect(
  |     tokens,
  |     content=(
  |       #|[
  |       #|  Identifier(
  |       #|    "key",
  |       #|    loc={ start: { line: 1, column: 1 }, end: { line: 1, column: 4 } },
  |       #|  ),
  |       #|  Equals(loc={ start: { line: 1, column: 5 }, end: { line: 1, column: 6 } }),
  |       #|  StringToken(
```

```mooncram
$ run_moon_ide moon ide peek-def 'tokenize' --loc 'internal/tokenize/lexer_test.mbt:4:26'
Definition found at file <WORKDIR>/internal/tokenize/tokenize.mbt
     |   }
     | }
     | 
     | ///|
     | /// Tokenize entire input
1397 | pub fn tokenize(input : String) -> Array[Token] raise {
     |        ^^^^^^^^
     |   let lexer = @lexer.Lexer::Lexer(input)
     |   let tokens = Array::new()
     |   for current_token = lexer.next_token() {
     |     match current_token {
     |       EOF(_) as t => {
     |         tokens.push(t)
     |         break tokens
     |       }
     |       _ as t => {
     |         tokens.push(t)
     |         continue lexer.next_token()
     |       }
     |     }
     |   }
```

```mooncram
$ run_moon_ide moon ide peek-def 'Loc' --loc 'internal/tokenize/token.mbt:9:17'
Definition found at file <WORKDIR>/internal/tokenize/token.mbt
  | /// `start` is the position of the first character of the lexeme and `end`
  | /// is the position immediately after its last character. Two locations are
  | /// `adjacent` (no gap) when one's `end` equals the other's `start`, which
  | /// the parser uses to distinguish e.g. `[[` (array-of-tables) from `[ [`
  | /// (a nested array literal opening a normal table header).
9 | pub(all) struct Loc {
  |                 ^^^
  |   start : @lexer.Position
  |   end : @lexer.Position
  | } derive(Eq, Debug)
  | 
  | ///|
  | #deprecated("compare with `==`; the Eq impl is unaffected")
  | pub extend Loc with Eq::{not_equal, equal}
  | 
  | ///|
  | #deprecated("render via the Debug trait, e.g. `debug_inspect`")
  | pub extend Loc with Debug::{to_repr}
  | 
  | ///|
  | /// Token types for the lexer
```

```mooncram
$ run_moon_ide moon ide peek-def 'start' --loc 'internal/tokenize/token.mbt:10:3'
Definition found at file <WORKDIR>/internal/tokenize/token.mbt
   | /// is the position immediately after its last character. Two locations are
   | /// `adjacent` (no gap) when one's `end` equals the other's `start`, which
   | /// the parser uses to distinguish e.g. `[[` (array-of-tables) from `[ [`
   | /// (a nested array literal opening a normal table header).
   | pub(all) struct Loc {
10 |   start : @lexer.Position
   |   ^^^^^
   |   end : @lexer.Position
   | } derive(Eq, Debug)
   | 
   | ///|
   | #deprecated("compare with `==`; the Eq impl is unaffected")
   | pub extend Loc with Eq::{not_equal, equal}
   | 
   | ///|
   | #deprecated("render via the Debug trait, e.g. `debug_inspect`")
   | pub extend Loc with Debug::{to_repr}
   | 
   | ///|
   | /// Token types for the lexer
   | pub(all) enum Token {
```

```mooncram
$ run_moon_ide moon ide peek-def 'Parser' --loc 'parser.mbt:3:4'
Definition found at file <WORKDIR>/toml.mbt
   |   }
   | }
   | 
   | ///|
   | /// Parser state (will implement methods later)
42 | priv struct Parser {
   |             ^^^^^^
   |   tokens : Array[@tokenize.Token]
   |   mut position : Int
   | }
   | 
   | ///|
   | /// Return a view of the tokens from the current position to end of input.
   | ///
   | /// When `skip_newlines` is true, leading `Newline` tokens are dropped from
   | /// the returned view; this is convenient at grammar boundaries where line
   | /// breaks are insignificant (e.g. between top-level statements). The
   | /// parser's position is not advanced — callers commit progress by passing
   | /// the consumed tail back through `update_view`.
   | fn Parser::view(
   |   self : Self,
```

```mooncram
$ run_moon_ide moon ide peek-def 'skip_newlines' --loc 'parser.mbt:3:12'
Definition found at file <WORKDIR>/parser.mbt
  | ///|
  | /// Skip newline tokens
3 | fn Parser::skip_newlines(self : Parser) -> Unit {
  |            ^^^^^^^^^^^^^
  |   let next_view = for view = self.view() {
  |     match view {
  |       [Newline(..), .. rest] => continue rest
  |       rest => break rest
  |     }
  |   }
  |   self.update_view(next_view)
  | }
  | 
  | ///|
  | /// Try to consume a single bare key from the current position.
  | /// Handles identifiers, strings, integers, booleans (true/false),
  | /// and special float keywords (inf/nan) in key position.
  | ///
```

```mooncram
$ run_moon_ide moon ide peek-def 'tokens' --loc 'parser_wbtest.mbt:7:7'
Definition found at file <WORKDIR>/parser_wbtest.mbt
  | /// White-box tests for internal parser methods
  | 
  | ///|
  | test "parse_dotted_key - simple identifier" {
  |   // Test parsing a simple identifier key
7 |   let tokens = @tokenize.tokenize("simple")
  |       ^^^^^^
  |   let parser = Parser::Parser(tokens)
  |   let result = parser.parse_dotted_key()
  |   debug_inspect(
  |     result,
  |     content=(
  |       #|["simple"]
  |     ),
  |   )
  | }
  | 
  | ///|
  | test "parse_dotted_key - dotted identifiers" {
  |   // Test parsing dotted identifier keys
  |   let tokens = @tokenize.tokenize("server.host.name")
```

```mooncram
$ run_moon_ide moon ide peek-def 'tokenize' --loc 'parser_wbtest.mbt:7:26'
Definition found at file <WORKDIR>/internal/tokenize/tokenize.mbt
     |   }
     | }
     | 
     | ///|
     | /// Tokenize entire input
1397 | pub fn tokenize(input : String) -> Array[Token] raise {
     |        ^^^^^^^^
     |   let lexer = @lexer.Lexer::Lexer(input)
     |   let tokens = Array::new()
     |   for current_token = lexer.next_token() {
     |     match current_token {
     |       EOF(_) as t => {
     |         tokens.push(t)
     |         break tokens
     |       }
     |       _ as t => {
     |         tokens.push(t)
     |         continue lexer.next_token()
     |       }
     |     }
     |   }
```

```mooncram
$ run_moon_ide moon ide peek-def 'parse_expect_to_fail' --loc 'test_utils_test.mbt:2:4'
Definition found at file <WORKDIR>/test_utils_test.mbt
  | ///|
2 | fn parse_expect_to_fail(input : String) -> String {
  |    ^^^^^^^^^^^^^^^^^^^^
  |   try @toml.parse(input) catch {
  |     e => {
  |       let s = e.to_string()
  |       // e.to_string() gives: Failure("...FAILED: actual_message")
  |       // We want just actual_message
  |       match s.after("FAILED: ") {
  |         Some(rest) =>
  |           // Remove trailing ") left over from Failure("...") wrapping
  |           match rest.rev_before("\")") {
  |             Some(clean) => clean.to_owned()
  |             None => rest.to_owned()
  |           }
  |         None => s
  |       }
```

```mooncram
$ run_moon_ide moon ide peek-def 'input' --loc 'test_utils_test.mbt:2:25'
Definition found at file <WORKDIR>/test_utils_test.mbt
  | ///|
2 | fn parse_expect_to_fail(input : String) -> String {
  |                         ^^^^^
  |   try @toml.parse(input) catch {
  |     e => {
  |       let s = e.to_string()
  |       // e.to_string() gives: Failure("...FAILED: actual_message")
  |       // We want just actual_message
  |       match s.after("FAILED: ") {
  |         Some(rest) =>
  |           // Remove trailing ") left over from Failure("...") wrapping
  |           match rest.rev_before("\")") {
  |             Some(clean) => clean.to_owned()
  |             None => rest.to_owned()
  |           }
  |         None => s
  |       }
```

```mooncram
$ run_moon_ide moon ide peek-def 'escape_toml_string' --loc 'toml_to_string.mbt:3:4'
Definition found at file <WORKDIR>/toml_to_string.mbt
  | ///|
  | /// Helper function to escape strings according to TOML spec
3 | fn escape_toml_string(s : String) -> String {
  |    ^^^^^^^^^^^^^^^^^^
  |   let result = StringBuilder()
  |   for char in s {
  |     match char {
  |       '\b' => result <+ "\\b"
  |       '\t' => result <+ "\\t"
  |       '\n' => result <+ "\\n"
  |       '\f' => result <+ "\\f"
  |       '\r' => result <+ "\\r"
  |       '"' => result <+ "\\\""
  |       '\\' => result <+ "\\\\"
  |       // Control characters (U+0000 to U+001F) except the above
  |       c if c >= '\u0000' && c <= '\u001F' => {
  |         result <+ "\\u"
  |         let code = c.to_int()
```

```mooncram
$ run_moon_ide moon ide peek-def 's' --loc 'toml_to_string.mbt:3:23'
Definition found at file <WORKDIR>/toml_to_string.mbt
  | ///|
  | /// Helper function to escape strings according to TOML spec
3 | fn escape_toml_string(s : String) -> String {
  |                       ^
  |   let result = StringBuilder()
  |   for char in s {
  |     match char {
  |       '\b' => result <+ "\\b"
  |       '\t' => result <+ "\\t"
  |       '\n' => result <+ "\\n"
  |       '\f' => result <+ "\\f"
  |       '\r' => result <+ "\\r"
  |       '"' => result <+ "\\\""
  |       '\\' => result <+ "\\\\"
  |       // Control characters (U+0000 to U+001F) except the above
  |       c if c >= '\u0000' && c <= '\u001F' => {
  |         result <+ "\\u"
  |         let code = c.to_int()
```
