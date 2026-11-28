# sqlparser find-references LexerError src\lexer.mbt:3:10

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' find-references 'LexerError' --loc 'src\lexer.mbt:3:10'
Found 9 references for symbol 'LexerError':
<WORKDIR>/src\export.mbt:4:14-4:24:
  | ///|
  | #derive(Debug)
  | pub suberror SqlParserError {
4 |   LexerError(LexerError)
  |              ^^^^^^^^^^
  |   ParserError(ParserError)
  | }

<WORKDIR>/src\lexer.mbt:60:25-60:35:
   | pub fn tokenize(
   |   dialect~ : &Dialect = MySQL::{ },
   |   input : String,
60 | ) -> Array[Token] raise LexerError {
   |                         ^^^^^^^^^^
   |   let lexer = Lexer::{ dialect, }
   |   let tokens = []

<WORKDIR>/src\lexer.mbt:80:32-80:42:
   | fn Lexer::next_token(
   |   self : Lexer,
   |   input : StringView,
80 | ) -> (Token, StringView) raise LexerError {
   |                                ^^^^^^^^^^
   |   match skip_whitespace(input) {
   |     [',', .. rest] => (Comma, rest)

<WORKDIR>/src\lexer.mbt:476:32-476:42:
    | fn Lexer::read_single_quoted_string(
    |   self : Lexer,
    |   input : StringView,
476 | ) -> (Token, StringView) raise LexerError {
    |                                ^^^^^^^^^^
    |   let result = StringBuilder()
    |   let rest = for rest = input {

<WORKDIR>/src\lexer.mbt:523:32-523:42:
    | fn Lexer::read_double_quoted_string(
    |   self : Lexer,
    |   input : StringView,
523 | ) -> (Token, StringView) raise LexerError {
    |                                ^^^^^^^^^^
    |   let result = StringBuilder()
    |   let rest = for rest = input {

<WORKDIR>/src\lexer.mbt:566:32-566:42:
    | fn Lexer::read_backtick_quoted_identifier(
    |   self : Lexer,
    |   input : StringView,
566 | ) -> (Token, StringView) raise LexerError {
    |                                ^^^^^^^^^^
    |   let result = StringBuilder()
    |   let rest = for rest = input {

<WORKDIR>/src\lexer.mbt:853:12-853:22:
    | }
    | 
    | ///|
853 | pub extend LexerError with Debug::{to_repr}
    |            ^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/src\show.mbt:584:19-584:29:
    | }
    | 
    | ///|
584 | pub impl Show for LexerError with fn output(self, logger) {
    |                   ^^^^^^^^^^
    |   show_compact_debug(self, logger)
    | }

<WORKDIR>/src\show.mbt:761:12-761:22:
    | pub extend Keyword with Show::{to_string, output}
    | 
    | ///|
761 | pub extend LexerError with Show::{to_string, output}
    |            ^^^^^^^^^^
    | 
    | ///|
"" (escaped)
```
