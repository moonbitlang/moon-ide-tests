# toml-parser find-references start internal\tokenize\token.mbt:10:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide find-references 'start' --loc 'internal\tokenize\token.mbt:10:3'
Found 3 references for symbol 'start':
<WORKDIR>/internal\tokenize\token.mbt:60:21-60:26:
   | ///|
   | /// Check if two locations are adjacent (end of first equals start of second).
   | pub fn Loc::adjacent(self : Loc, other : Loc) -> Bool {
60 |   self.end == other.start
   |                     ^^^^^
   | }
   | 

<WORKDIR>/internal\tokenize\tokenize.mbt:9:5-9:10:
  |   // spelling both the annotation and the `T::` prefix trips
  |   // unnecessary_annotation.
  |   let pos = @lexer.Position::{ line: 1, column: 1, }
9 |   { start: pos, end: pos, }
  |     ^^^^^
  | }
  | 

<WORKDIR>/internal\tokenize\tokenize.mbt:26:5-26:10:
   | ///|
   | /// Create a location from lexer positions
   | fn make_loc(start_pos : @lexer.Position, end_pos : @lexer.Position) -> Loc {
26 |   { start: start_pos, end: end_pos, }
   |     ^^^^^
   | }
   | 

```
