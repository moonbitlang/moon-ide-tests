# toml-parser hover

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
$ run_moon_ide moon ide hover 'key_variations_toml' --loc 'additional_official_tests_test.mbt:8:7'
///|
/// Test key names with various characters
test "key name variations" {
  let key_variations_toml =
      ^^^^^^^^^^^^^^^^^^^
      ```moonbit
      String
      ```
    #|bare_key = "value"
    #|bare-key = "value"
```

```mooncram
$ run_moon_ide moon ide hover 'parse' --loc 'additional_official_tests_test.mbt:17:11'
    #|"ʎǝʞ" = "value"
    #|
  debug_inspect(
    @toml.parse(key_variations_toml),
    ^^^^^^^^^^^
    ```moonbit
    fn @bobzhang/toml.parse(input : String) -> @toml.TomlValue raise
    ```
    ---
    
     Parse a TOML document and return its root table as a `TomlValue`.
    
     On success the result is always a `TomlTable` whose contents reflect the
     document's top-level keys, `[section]` headers, and `[[array]]` of
     tables. Standard TOML 1.0 plus 1.1 features (optional seconds, `\xHH`
     escapes, inline-table newlines) are accepted.
    
     On any lexical or syntactic error, `parse` raises with a message
     containing the source location. Wrap the call in `try?` to receive a
     `Result[TomlValue, Error]` instead.
    content=(
      #|TomlTable(
```

```mooncram
$ run_moon_ide moon ide hover 'result' --loc 'coverage_improvement_comprehensive_test.mbt:9:7'
/// Test EOF handling in parser - covered by creating empty token arrays
test "parser_eof_handling" {
  // Test empty parse input to exercise EOF conditions
  let result = @toml.parse(
      ^^^^^^
      ```moonbit
      @toml.TomlValue
      ```
    (
      #|
```

```mooncram
$ run_moon_ide moon ide hover 'parse' --loc 'coverage_improvement_comprehensive_test.mbt:9:22'
/// Test EOF handling in parser - covered by creating empty token arrays
test "parser_eof_handling" {
  // Test empty parse input to exercise EOF conditions
  let result = @toml.parse(
               ^^^^^^^^^^^
               ```moonbit
               fn @bobzhang/toml.parse(input : String) -> @toml.TomlValue raise
               ```
               ---
               
                Parse a TOML document and return its root table as a `TomlValue`.
               
                On success the result is always a `TomlTable` whose contents reflect the
                document's top-level keys, `[section]` headers, and `[[array]]` of
                tables. Standard TOML 1.0 plus 1.1 features (optional seconds, `\xHH`
                escapes, inline-table newlines) are accepted.
               
                On any lexical or syntactic error, `parse` raises with a message
                containing the source location. Wrap the call in `try?` to receive a
                `Result[TomlValue, Error]` instead.
    (
      #|
```

```mooncram
$ run_moon_ide moon ide hover 'TomlDateTime' --loc 'datetime/datetime.mbt:13:15'
/// Values are stored as their original string form. The parser preserves
/// the spelling supplied in the TOML source; it does not normalize or
/// validate the underlying calendar arithmetic.
pub(all) enum TomlDateTime {
              ^^^^^^^^^^^^
              ```moonbit
              enum TomlDateTime {
                OffsetDateTime(String)
                LocalDateTime(String)
                LocalDate(String)
                LocalTime(String)
              } derive(Eq, @debug.Debug)
              ```
              ---
              
               TOML datetime variants (RFC 3339 subset).
              
               TOML distinguishes four kinds of datetime literals:
               - `OffsetDateTime` — full date + time + UTC offset (e.g. `1979-05-27T07:32:00Z`)
               - `LocalDateTime` — date + time, no offset (e.g. `1979-05-27T07:32:00`)
               - `LocalDate` — date only (e.g. `1979-05-27`)
               - `LocalTime` — time only (e.g. `07:32:00`)
              
               Values are stored as their original string form. The parser preserves
               the spelling supplied in the TOML source; it does not normalize or
               validate the underlying calendar arithmetic.
  OffsetDateTime(String)
  LocalDateTime(String)
```

```mooncram
$ run_moon_ide moon ide hover 'OffsetDateTime' --loc 'datetime/datetime.mbt:14:3'
/// the spelling supplied in the TOML source; it does not normalize or
/// validate the underlying calendar arithmetic.
pub(all) enum TomlDateTime {
  OffsetDateTime(String)
  ^^^^^^^^^^^^^^
  ```moonbit
  (String) -> TomlDateTime
  ```
  LocalDateTime(String)
  LocalDate(String)
```

```mooncram
$ run_moon_ide moon ide hover 'offset_dt1' --loc 'datetime_extended_test.mbt:4:7'
///|
/// Extended datetime tests for improved coverage
test "test TomlDateTime types and equality" {
  let offset_dt1 = @datetime.OffsetDateTime("1979-05-27T07:32:00Z")
      ^^^^^^^^^^
      ```moonbit
      @datetime.TomlDateTime
      ```
  let offset_dt2 = @datetime.OffsetDateTime("1979-05-27T07:32:00Z")
  let offset_dt3 = @datetime.OffsetDateTime("1980-05-27T07:32:00Z")
```

```mooncram
$ run_moon_ide moon ide hover 'OffsetDateTime' --loc 'datetime_extended_test.mbt:4:30'
///|
/// Extended datetime tests for improved coverage
test "test TomlDateTime types and equality" {
  let offset_dt1 = @datetime.OffsetDateTime("1979-05-27T07:32:00Z")
                             ^^^^^^^^^^^^^^
                             ```moonbit
                             (String) -> @datetime.TomlDateTime
                             ```
  let offset_dt2 = @datetime.OffsetDateTime("1979-05-27T07:32:00Z")
  let offset_dt3 = @datetime.OffsetDateTime("1980-05-27T07:32:00Z")
```

```mooncram
$ run_moon_ide moon ide hover 'tokens' --loc 'internal/tokenize/lexer_test.mbt:4:7'
///|
/// Tests for the TOML lexer
test "tokenize simple key-value" {
  let tokens = @tokenize.tokenize(
      ^^^^^^
      ```moonbit
      Array[@tokenize.Token]
      ```
    (
      #|key = "value"
```

```mooncram
$ run_moon_ide moon ide hover 'tokenize' --loc 'internal/tokenize/lexer_test.mbt:4:26'
///|
/// Tests for the TOML lexer
test "tokenize simple key-value" {
  let tokens = @tokenize.tokenize(
               ^^^^^^^^^^^^^^^^^^
               ```moonbit
               fn @bobzhang/toml/internal/tokenize.tokenize(input : String) -> Array[@tokenize.Token] raise
               ```
               ---
               
                Tokenize entire input
    (
      #|key = "value"
```

```mooncram
$ run_moon_ide moon ide hover 'Loc' --loc 'internal/tokenize/token.mbt:9:17'
/// `adjacent` (no gap) when one's `end` equals the other's `start`, which
/// the parser uses to distinguish e.g. `[[` (array-of-tables) from `[ [`
/// (a nested array literal opening a normal table header).
pub(all) struct Loc {
                ^^^
                ```moonbit
                struct Loc {
                  start: @lexer.Position
                  end: @lexer.Position
                } derive(Eq, @debug.Debug)
                ```
                ---
                
                 Half-open source span `[start, end)` measured in lexer `Position`s.
                
                 `start` is the position of the first character of the lexeme and `end`
                 is the position immediately after its last character. Two locations are
                 `adjacent` (no gap) when one's `end` equals the other's `start`, which
                 the parser uses to distinguish e.g. `[[` (array-of-tables) from `[ [`
                 (a nested array literal opening a normal table header).
  start : @lexer.Position
  end : @lexer.Position
```

```mooncram
$ run_moon_ide moon ide hover 'start' --loc 'internal/tokenize/token.mbt:10:3'
/// the parser uses to distinguish e.g. `[[` (array-of-tables) from `[ [`
/// (a nested array literal opening a normal table header).
pub(all) struct Loc {
  start : @lexer.Position
  ^^^^^
  ```moonbit
  @lexer.Position
  ```
  end : @lexer.Position
} derive(Eq, Debug)
```

```mooncram
$ run_moon_ide moon ide hover 'Parser' --loc 'parser.mbt:3:4'
///|
/// Skip newline tokens
fn Parser::skip_newlines(self : Parser) -> Unit {
   ^^^^^^
   ```moonbit
   struct Parser {
     tokens: Array[@tokenize.Token]
     mut position: Int
   }
   ```
   ---
   
    Parser state (will implement methods later)
  let next_view = for view = self.view() {
    match view {
```

```mooncram
$ run_moon_ide moon ide hover 'skip_newlines' --loc 'parser.mbt:3:12'
///|
/// Skip newline tokens
fn Parser::skip_newlines(self : Parser) -> Unit {
           ^^^^^^^^^^^^^
           ```moonbit
           fn Parser::skip_newlines(self : Parser) -> Unit
           ```
           ---
           
            Skip newline tokens
  let next_view = for view = self.view() {
    match view {
```

```mooncram
$ run_moon_ide moon ide hover 'tokens' --loc 'parser_wbtest.mbt:7:7'
///|
test "parse_dotted_key - simple identifier" {
  // Test parsing a simple identifier key
  let tokens = @tokenize.tokenize("simple")
      ^^^^^^
      ```moonbit
      Array[@tokenize.Token]
      ```
  let parser = Parser::Parser(tokens)
  let result = parser.parse_dotted_key()
```

```mooncram
$ run_moon_ide moon ide hover 'tokenize' --loc 'parser_wbtest.mbt:7:26'
///|
test "parse_dotted_key - simple identifier" {
  // Test parsing a simple identifier key
  let tokens = @tokenize.tokenize("simple")
               ^^^^^^^^^^^^^^^^^^
               ```moonbit
               fn @bobzhang/toml/internal/tokenize.tokenize(input : String) -> Array[@tokenize.Token] raise
               ```
               ---
               
                Tokenize entire input
  let parser = Parser::Parser(tokens)
  let result = parser.parse_dotted_key()
```

```mooncram
$ run_moon_ide moon ide hover 'parse_expect_to_fail' --loc 'test_utils_test.mbt:2:4'
///|
fn parse_expect_to_fail(input : String) -> String {
   ^^^^^^^^^^^^^^^^^^^^
   ```moonbit
   fn parse_expect_to_fail(input : String) -> String
   ```
  try @toml.parse(input) catch {
    e => {
```

```mooncram
$ run_moon_ide moon ide hover 'input' --loc 'test_utils_test.mbt:2:25'
///|
fn parse_expect_to_fail(input : String) -> String {
                        ^^^^^
                        ```moonbit
                        String
                        ```
  try @toml.parse(input) catch {
    e => {
```

```mooncram
$ run_moon_ide moon ide hover 'escape_toml_string' --loc 'toml_to_string.mbt:3:4'
///|
/// Helper function to escape strings according to TOML spec
fn escape_toml_string(s : String) -> String {
   ^^^^^^^^^^^^^^^^^^
   ```moonbit
   fn escape_toml_string(s : String) -> String
   ```
   ---
   
    Helper function to escape strings according to TOML spec
  let result = StringBuilder()
  for char in s {
```

```mooncram
$ run_moon_ide moon ide hover 's' --loc 'toml_to_string.mbt:3:23'
///|
/// Helper function to escape strings according to TOML spec
fn escape_toml_string(s : String) -> String {
                      ^
                      ```moonbit
                      String
                      ```
  let result = StringBuilder()
  for char in s {
```
