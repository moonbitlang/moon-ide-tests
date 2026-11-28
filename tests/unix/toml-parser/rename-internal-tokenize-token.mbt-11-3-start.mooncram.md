# toml-parser rename start internal/tokenize/token.mbt:11:3

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' rename 'start' 'start_renamed' --loc 'internal/tokenize/token.mbt:11:3'
*** Begin Patch
*** Update File: <WORKDIR>/internal/tokenize/lexer.mbt
@@
 ///|
 /// The span from `start` to the cursor.
 fn Lexer::span(self : Lexer, start : Position) -> Loc {
-  { start, end: self.loc(), }
+  { start_renamed: start, end: self.loc(), }
 }
 
 ///|
*** Update File: <WORKDIR>/internal/tokenize/token.mbt
@@
 /// (a nested array literal opening a normal table header).
 #derive(Eq, Debug)
 pub(all) struct Loc {
-  start : Position
+  start_renamed : Position
   end : Position
 }
 
@@
 ///|
 /// Check if two locations are adjacent (end of first equals start of second).
 pub fn Loc::adjacent(self : Loc, other : Loc) -> Bool {
-  self.end == other.start
+  self.end == other.start_renamed
 }
 
 ///|
*** Update File: <WORKDIR>/internal/tokenize/tokenize.mbt
@@
 /// Default location for testing and compatibility
 pub fn default_loc() -> Loc {
   let pos = Position::{ line: 1, column: 1, }
-  { start: pos, end: pos, }
+  { start_renamed: pos, end: pos, }
 }
 
 ///|
@@
   self.skip_comments_or_whitespace()
   let start = self.loc()
   guard self.offset < self.input.length() else {
-    EOF(loc={ start, end: start, })
+    EOF(loc={ start_renamed: start, end: start, })
   }
   match self.input.unsafe_get(self.offset) {
     'a'..<='z' | 'A'..<='Z' | '_' => self.bare_key(start)
*** End Patch
"" (escaped)
```
