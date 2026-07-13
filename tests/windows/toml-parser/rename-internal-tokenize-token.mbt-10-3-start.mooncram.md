# toml-parser rename start internal\tokenize\token.mbt:10:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide rename 'start' 'start_renamed' --loc 'internal\tokenize\token.mbt:10:3'
*** Begin Patch
*** Update File: <WORKDIR>/internal\tokenize\token.mbt
@@
 /// the parser uses to distinguish e.g. `[[` (array-of-tables) from `[ [`
 /// (a nested array literal opening a normal table header).
 pub(all) struct Loc {
-  start : @lexer.Position
+  start_renamed : @lexer.Position
   end : @lexer.Position
 } derive(Eq, Debug)
 
@@
 ///|
 /// Check if two locations are adjacent (end of first equals start of second).
 pub fn Loc::adjacent(self : Loc, other : Loc) -> Bool {
-  self.end.equal(other.start)
+  self.end.equal(other.start_renamed)
 }
 
 ///|
*** Update File: <WORKDIR>/internal\tokenize\tokenize.mbt
@@
 /// Default location for testing and compatibility
 pub fn default_loc() -> Loc {
   let pos : @lexer.Position = { line: 1, column: 1 }
-  { start: pos, end: pos }
+  { start_renamed: pos, end: pos }
 }
 
 ///|
@@
 ///|
 /// Create a location from lexer positions
 fn make_loc(start_pos : @lexer.Position, end_pos : @lexer.Position) -> Loc {
-  { start: start_pos, end: end_pos }
+  { start_renamed: start_pos, end: end_pos }
 }
 
 ///|
*** End Patch

```
