# sqlparser rename LexerError src/lexer.mbt:2:10

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
$ run_moon_ide moon ide rename 'LexerError' 'LexerErrorRenamed' --loc 'src/lexer.mbt:2:10'
*** Begin Patch
*** Update File: <WORKDIR>/src/export.mbt
@@
 ///|
 pub suberror SqlParserError {
-  LexerError(LexerError)
+  LexerError(LexerErrorRenamed)
   ParserError(ParserError)
 } derive(Debug)
 
*** Update File: <WORKDIR>/src/lexer.mbt
@@
 ///|
-suberror LexerError {
+suberror LexerErrorRenamed {
   UnterminatedString
   UnknownCharacter(Char)
 } derive(Debug)
@@
 pub fn tokenize(
   dialect? : &Dialect = MySQL::{  },
   input : String,
-) -> Array[Token] raise LexerError {
+) -> Array[Token] raise LexerErrorRenamed {
   let lexer = Lexer::{ dialect, }
   let tokens = []
   for input = input[:] {
@@
 fn Lexer::next_token(
   self : Lexer,
   input : StringView,
-) -> (Token, StringView) raise LexerError {
+) -> (Token, StringView) raise LexerErrorRenamed {
   match skip_whitespace(input) {
     [',', .. rest] => (Comma, rest)
     // : followed by identifier is a named parameter, otherwise it's just Colon
@@
 fn Lexer::read_single_quoted_string(
   self : Lexer,
   input : StringView,
-) -> (Token, StringView) raise LexerError {
+) -> (Token, StringView) raise LexerErrorRenamed {
   let result = StringBuilder::new()
   let rest = for rest = input {
     match rest {
@@
         result.write_char(c)
         continue rest
       }
-      [] => raise LexerError::UnterminatedString
+      [] => raise LexerErrorRenamed::UnterminatedString
     }
   }
   (StringLiteral(result.to_string()), rest)
@@
 fn Lexer::read_double_quoted_string(
   self : Lexer,
   input : StringView,
-) -> (Token, StringView) raise LexerError {
+) -> (Token, StringView) raise LexerErrorRenamed {
   let result = StringBuilder::new()
   let rest = for rest = input {
     match rest {
@@
         result.write_char(c)
         continue rest
       }
-      [] => raise LexerError::UnterminatedString
+      [] => raise LexerErrorRenamed::UnterminatedString
     }
   }
   (StringLiteral(result.to_string()), rest)
@@
 fn Lexer::read_backtick_quoted_identifier(
   self : Lexer,
   input : StringView,
-) -> (Token, StringView) raise LexerError {
+) -> (Token, StringView) raise LexerErrorRenamed {
   let result = StringBuilder::new()
   let rest = for rest = input {
     match rest {
@@
         result.write_char(c)
         continue rest
       }
-      [] => raise LexerError::UnterminatedString
+      [] => raise LexerErrorRenamed::UnterminatedString
     }
   }
   (Identifier(result.to_string()), rest)
*** Update File: <WORKDIR>/src/show.mbt
@@
 }
 
 ///|
-pub impl Show for LexerError with output(self, logger) {
+pub impl Show for LexerErrorRenamed with output(self, logger) {
   show_compact_debug(self, logger)
 }
 
*** End Patch

```
