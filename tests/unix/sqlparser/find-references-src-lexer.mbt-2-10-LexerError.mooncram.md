# sqlparser find-references LexerError src/lexer.mbt:2:10

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/sqlparser" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide find-references 'LexerError' --loc 'src/lexer.mbt:2:10'
Found 9 references for symbol 'LexerError':
<WORKDIR>/src/export.mbt:3:14-3:24:
  | ///|
  | pub suberror SqlParserError {
3 |   LexerError(LexerError)
  |              ^^^^^^^^^^
  |   ParserError(ParserError)
  | } derive(Debug)

<WORKDIR>/src/lexer.mbt:58:25-58:35:
   | pub fn tokenize(
   |   dialect~ : &Dialect = MySQL::{ },
   |   input : String,
58 | ) -> Array[Token] raise LexerError {
   |                         ^^^^^^^^^^
   |   let lexer = Lexer::{ dialect, }
   |   let tokens = []

<WORKDIR>/src/lexer.mbt:78:32-78:42:
   | fn Lexer::next_token(
   |   self : Lexer,
   |   input : StringView,
78 | ) -> (Token, StringView) raise LexerError {
   |                                ^^^^^^^^^^
   |   match skip_whitespace(input) {
   |     [',', .. rest] => (Comma, rest)

<WORKDIR>/src/lexer.mbt:474:32-474:42:
    | fn Lexer::read_single_quoted_string(
    |   self : Lexer,
    |   input : StringView,
474 | ) -> (Token, StringView) raise LexerError {
    |                                ^^^^^^^^^^
    |   let result = StringBuilder()
    |   let rest = for rest = input {

<WORKDIR>/src/lexer.mbt:521:32-521:42:
    | fn Lexer::read_double_quoted_string(
    |   self : Lexer,
    |   input : StringView,
521 | ) -> (Token, StringView) raise LexerError {
    |                                ^^^^^^^^^^
    |   let result = StringBuilder()
    |   let rest = for rest = input {

<WORKDIR>/src/lexer.mbt:564:32-564:42:
    | fn Lexer::read_backtick_quoted_identifier(
    |   self : Lexer,
    |   input : StringView,
564 | ) -> (Token, StringView) raise LexerError {
    |                                ^^^^^^^^^^
    |   let result = StringBuilder()
    |   let rest = for rest = input {

<WORKDIR>/src/lexer.mbt:851:12-851:22:
    | }
    | 
    | ///|
851 | pub extend LexerError with Debug::{to_repr}
    |            ^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/src/show.mbt:584:19-584:29:
    | }
    | 
    | ///|
584 | pub impl Show for LexerError with fn output(self, logger) {
    |                   ^^^^^^^^^^
    |   show_compact_debug(self, logger)
    | }

<WORKDIR>/src/show.mbt:761:12-761:22:
    | pub extend Keyword with Show::{to_string, output}
    | 
    | ///|
761 | pub extend LexerError with Show::{to_string, output}
    |            ^^^^^^^^^^
    | 
    | ///|

```
