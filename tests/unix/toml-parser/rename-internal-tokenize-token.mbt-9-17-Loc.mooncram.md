# toml-parser rename Loc internal/tokenize/token.mbt:9:17

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
$ run_moon_ide moon ide rename 'Loc' 'LocRenamed' --loc 'internal/tokenize/token.mbt:9:17'
*** Begin Patch
*** Update File: <WORKDIR>/internal/tokenize/token.mbt
@@
 /// `adjacent` (no gap) when one's `end` equals the other's `start`, which
 /// the parser uses to distinguish e.g. `[[` (array-of-tables) from `[ [`
 /// (a nested array literal opening a normal table header).
-pub(all) struct Loc {
+pub(all) struct LocRenamed {
   start : @lexer.Position
   end : @lexer.Position
 } derive(Eq, Debug)
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
 pub(all) enum Token {
   // Literals
-  StringToken(String, loc~ : Loc, multiline~ : Bool)
+  StringToken(String, loc~ : LocRenamed, multiline~ : Bool)
-  IntegerToken(Int64, loc~ : Loc)
+  IntegerToken(Int64, loc~ : LocRenamed)
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
 } derive(Eq, Debug)
 
 ///|
@@
 
 ///|
 /// Check if two locations are adjacent (end of first equals start of second).
-pub fn Loc::adjacent(self : Loc, other : Loc) -> Bool {
+pub fn LocRenamed::adjacent(self : LocRenamed, other : LocRenamed) -> Bool {
   self.end.equal(other.start)
 }
 
@@
 /// Every `Token` variant records the span of the lexeme it was produced
 /// from, so error messages can point back into the original input
 /// regardless of which alternative matched.
-pub fn Token::loc(self : Self) -> Loc {
+pub fn Token::loc(self : Self) -> LocRenamed {
   match self {
     StringToken(_, loc~, ..) => loc
     IntegerToken(_, loc~) => loc
*** Update File: <WORKDIR>/internal/tokenize/tokenize.mbt
@@
 ///|
 /// Default location for testing and compatibility
-pub fn default_loc() -> Loc {
+pub fn default_loc() -> LocRenamed {
   let pos : @lexer.Position = { line: 1, column: 1 }
   { start: pos, end: pos }
 }
@@
 
 ///|
 /// Create a location from lexer positions
-fn make_loc(start_pos : @lexer.Position, end_pos : @lexer.Position) -> Loc {
+fn make_loc(start_pos : @lexer.Position, end_pos : @lexer.Position) -> LocRenamed {
   { start: start_pos, end: end_pos }
 }
 
*** End Patch

```
