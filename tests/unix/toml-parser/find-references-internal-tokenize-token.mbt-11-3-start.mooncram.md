# toml-parser find-references start internal/tokenize/token.mbt:11:3

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' find-references 'start' --loc 'internal/tokenize/token.mbt:11:3'
Found 4 references for symbol 'start':
<WORKDIR>/internal/tokenize/lexer.mbt:90:5-90:10:
   | ///|
   | /// The span from `start` to the cursor.
   | fn Lexer::span(self : Lexer, start : Position) -> Loc {
90 |   { start, end: self.loc(), }
   |     ^^^^^
   | }
   | 

<WORKDIR>/internal/tokenize/token.mbt:62:21-62:26:
   | ///|
   | /// Check if two locations are adjacent (end of first equals start of second).
   | pub fn Loc::adjacent(self : Loc, other : Loc) -> Bool {
62 |   self.end == other.start
   |                     ^^^^^
   | }
   | 

<WORKDIR>/internal/tokenize/tokenize.mbt:5:5-5:10:
  | /// Default location for testing and compatibility
  | pub fn default_loc() -> Loc {
  |   let pos = Position::{ line: 1, column: 1, }
5 |   { start: pos, end: pos, }
  |     ^^^^^
  | }
  | 

<WORKDIR>/internal/tokenize/tokenize.mbt:57:15-57:20:
   |   self.skip_comments_or_whitespace()
   |   let start = self.loc()
   |   guard self.offset < self.input.length() else {
57 |     EOF(loc={ start, end: start, })
   |               ^^^^^
   |   }
   |   match self.input.unsafe_get(self.offset) {
"" (escaped)
```
