# toml-parser rename Loc internal/tokenize/token.mbt:10:17

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' rename 'Loc' 'LocRenamed' --loc 'internal/tokenize/token.mbt:10:17'
*** Begin Patch
*** Update File: <WORKDIR>/internal/tokenize/lexer.mbt
@@
 
 ///|
 /// The span from `start` to the cursor.
-fn Lexer::span(self : Lexer, start : Position) -> Loc {
+fn Lexer::span(self : Lexer, start : Position) -> LocRenamed {
   { start, end: self.loc(), }
 }
 
*** Update File: <WORKDIR>/internal/tokenize/token.mbt
@@
 /// the parser uses to distinguish e.g. `[[` (array-of-tables) from `[ [`
 /// (a nested array literal opening a normal table header).
 #derive(Eq, Debug)
-pub(all) struct Loc {
+pub(all) struct LocRenamed {
   start : Position
   end : Position
 }
@@
 
 ///|
 #deprecated("compare with `==`; the Eq impl is unaffected")
-pub extend Loc with Eq::{not_equal, equal}
+pub extend LocRenamed with Eq::{not_equal, equal}
 
 ///|
 #deprecated("render via the Debug trait, e.g. `debug_inspect`")
-pub extend Loc with Debug::{to_repr}
+pub extend LocRenamed with Debug::{to_repr}
 
 ///|
 /// Token types for the lexer
@@
 #derive(Eq, Debug)
 pub(all) enum Token {
   // Literals
-  StringToken(String, loc~ : Loc, multiline~ : Bool)
+  StringToken(String, loc~ : LocRenamed, multiline~ : Bool)
-  IntegerToken(Int64, loc~ : Loc, raw~ : String)
+  IntegerToken(Int64, loc~ : LocRenamed, raw~ : String)
-  FloatToken(Double, loc~ : Loc, raw~ : String)
+  FloatToken(Double, loc~ : LocRenamed, raw~ : String)
-  BooleanToken(Bool, loc~ : Loc)
+  BooleanToken(Bool, loc~ : LocRenamed)
-  DateTimeToken(@datetime.TomlDateTime, loc~ : Loc)
+  DateTimeToken(@datetime.TomlDateTime, loc~ : LocRenamed)
 
   // Symbols
-  LeftBracket(loc~ : Loc) // [
+  LeftBracket(loc~ : LocRenamed) // [
-  RightBracket(loc~ : Loc) // ]
+  RightBracket(loc~ : LocRenamed) // ]
-  LeftBrace(loc~ : Loc) // {
+  LeftBrace(loc~ : LocRenamed) // {
-  RightBrace(loc~ : Loc) // }
+  RightBrace(loc~ : LocRenamed) // }
-  Equals(loc~ : Loc) // =
+  Equals(loc~ : LocRenamed) // =
-  Comma(loc~ : Loc) // ,
+  Comma(loc~ : LocRenamed) // ,
-  Dot(loc~ : Loc) // .
+  Dot(loc~ : LocRenamed) // .
 
   // Identifiers and keywords
-  Identifier(String, loc~ : Loc)
+  Identifier(String, loc~ : LocRenamed)
 
   // Special
-  Newline(loc~ : Loc)
+  Newline(loc~ : LocRenamed)
-  EOF(loc~ : Loc)
+  EOF(loc~ : LocRenamed)
 }
 
 ///|
@@
 
 ///|
 /// Check if two locations are adjacent (end of first equals start of second).
-pub fn Loc::adjacent(self : Loc, other : Loc) -> Bool {
+pub fn LocRenamed::adjacent(self : LocRenamed, other : LocRenamed) -> Bool {
   self.end == other.start
 }
 
@@
 /// Every `Token` variant records the span of the lexeme it was produced
 /// from, so error messages can point back into the original input
 /// regardless of which alternative matched.
-pub fn Token::loc(self : Self) -> Loc {
+pub fn Token::loc(self : Self) -> LocRenamed {
   match self {
     StringToken(_, loc~, ..) => loc
     IntegerToken(_, loc~, ..) => loc
*** Update File: <WORKDIR>/internal/tokenize/tokenize.mbt
@@
 ///|
 /// Default location for testing and compatibility
-pub fn default_loc() -> Loc {
+pub fn default_loc() -> LocRenamed {
   let pos = Position::{ line: 1, column: 1, }
   { start: pos, end: pos, }
 }
*** End Patch
"" (escaped)
```
