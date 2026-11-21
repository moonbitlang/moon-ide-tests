# toml-parser find-references Loc internal\tokenize\token.mbt:10:17

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' find-references 'Loc' --loc 'internal\tokenize\token.mbt:10:17'
Found 23 references for symbol 'Loc':
<WORKDIR>/internal\tokenize\lexer.mbt:89:51-89:54:
   | 
   | ///|
   | /// The span from `start` to the cursor.
89 | fn Lexer::span(self : Lexer, start : Position) -> Loc {
   |                                                   ^^^
   |   { start, end: self.loc(), }
   | }

<WORKDIR>/internal\tokenize\token.mbt:17:12-17:15:
   | 
   | ///|
   | #deprecated("compare with `==`; the Eq impl is unaffected")
17 | pub extend Loc with Eq::{not_equal, equal}
   |            ^^^
   | 
   | ///|

<WORKDIR>/internal\tokenize\token.mbt:21:12-21:15:
   | 
   | ///|
   | #deprecated("render via the Debug trait, e.g. `debug_inspect`")
21 | pub extend Loc with Debug::{to_repr}
   |            ^^^
   | 
   | ///|

<WORKDIR>/internal\tokenize\token.mbt:28:30-28:33:
   | #derive(Eq, Debug)
   | pub(all) enum Token {
   |   // Literals
28 |   StringToken(String, loc~ : Loc, multiline~ : Bool)
   |                              ^^^
   |   IntegerToken(Int64, loc~ : Loc, raw~ : String)
   |   FloatToken(Double, loc~ : Loc, raw~ : String)

<WORKDIR>/internal\tokenize\token.mbt:29:30-29:33:
   | pub(all) enum Token {
   |   // Literals
   |   StringToken(String, loc~ : Loc, multiline~ : Bool)
29 |   IntegerToken(Int64, loc~ : Loc, raw~ : String)
   |                              ^^^
   |   FloatToken(Double, loc~ : Loc, raw~ : String)
   |   BooleanToken(Bool, loc~ : Loc)

<WORKDIR>/internal\tokenize\token.mbt:30:29-30:32:
   |   // Literals
   |   StringToken(String, loc~ : Loc, multiline~ : Bool)
   |   IntegerToken(Int64, loc~ : Loc, raw~ : String)
30 |   FloatToken(Double, loc~ : Loc, raw~ : String)
   |                             ^^^
   |   BooleanToken(Bool, loc~ : Loc)
   |   DateTimeToken(@datetime.TomlDateTime, loc~ : Loc)

<WORKDIR>/internal\tokenize\token.mbt:31:29-31:32:
   |   StringToken(String, loc~ : Loc, multiline~ : Bool)
   |   IntegerToken(Int64, loc~ : Loc, raw~ : String)
   |   FloatToken(Double, loc~ : Loc, raw~ : String)
31 |   BooleanToken(Bool, loc~ : Loc)
   |                             ^^^
   |   DateTimeToken(@datetime.TomlDateTime, loc~ : Loc)
   | 

<WORKDIR>/internal\tokenize\token.mbt:32:48-32:51:
   |   IntegerToken(Int64, loc~ : Loc, raw~ : String)
   |   FloatToken(Double, loc~ : Loc, raw~ : String)
   |   BooleanToken(Bool, loc~ : Loc)
32 |   DateTimeToken(@datetime.TomlDateTime, loc~ : Loc)
   |                                                ^^^
   | 
   |   // Symbols

<WORKDIR>/internal\tokenize\token.mbt:35:22-35:25:
   |   DateTimeToken(@datetime.TomlDateTime, loc~ : Loc)
   | 
   |   // Symbols
35 |   LeftBracket(loc~ : Loc) // [
   |                      ^^^
   |   RightBracket(loc~ : Loc) // ]
   |   LeftBrace(loc~ : Loc) // {

<WORKDIR>/internal\tokenize\token.mbt:36:23-36:26:
   | 
   |   // Symbols
   |   LeftBracket(loc~ : Loc) // [
36 |   RightBracket(loc~ : Loc) // ]
   |                       ^^^
   |   LeftBrace(loc~ : Loc) // {
   |   RightBrace(loc~ : Loc) // }

<WORKDIR>/internal\tokenize\token.mbt:37:20-37:23:
   |   // Symbols
   |   LeftBracket(loc~ : Loc) // [
   |   RightBracket(loc~ : Loc) // ]
37 |   LeftBrace(loc~ : Loc) // {
   |                    ^^^
   |   RightBrace(loc~ : Loc) // }
   |   Equals(loc~ : Loc) // =

<WORKDIR>/internal\tokenize\token.mbt:38:21-38:24:
   |   LeftBracket(loc~ : Loc) // [
   |   RightBracket(loc~ : Loc) // ]
   |   LeftBrace(loc~ : Loc) // {
38 |   RightBrace(loc~ : Loc) // }
   |                     ^^^
   |   Equals(loc~ : Loc) // =
   |   Comma(loc~ : Loc) // ,

<WORKDIR>/internal\tokenize\token.mbt:39:17-39:20:
   |   RightBracket(loc~ : Loc) // ]
   |   LeftBrace(loc~ : Loc) // {
   |   RightBrace(loc~ : Loc) // }
39 |   Equals(loc~ : Loc) // =
   |                 ^^^
   |   Comma(loc~ : Loc) // ,
   |   Dot(loc~ : Loc) // .

<WORKDIR>/internal\tokenize\token.mbt:40:16-40:19:
   |   LeftBrace(loc~ : Loc) // {
   |   RightBrace(loc~ : Loc) // }
   |   Equals(loc~ : Loc) // =
40 |   Comma(loc~ : Loc) // ,
   |                ^^^
   |   Dot(loc~ : Loc) // .
   | 

<WORKDIR>/internal\tokenize\token.mbt:41:14-41:17:
   |   RightBrace(loc~ : Loc) // }
   |   Equals(loc~ : Loc) // =
   |   Comma(loc~ : Loc) // ,
41 |   Dot(loc~ : Loc) // .
   |              ^^^
   | 
   |   // Identifiers and keywords

<WORKDIR>/internal\tokenize\token.mbt:44:29-44:32:
   |   Dot(loc~ : Loc) // .
   | 
   |   // Identifiers and keywords
44 |   Identifier(String, loc~ : Loc)
   |                             ^^^
   | 
   |   // Special

<WORKDIR>/internal\tokenize\token.mbt:47:18-47:21:
   |   Identifier(String, loc~ : Loc)
   | 
   |   // Special
47 |   Newline(loc~ : Loc)
   |                  ^^^
   |   EOF(loc~ : Loc)
   | }

<WORKDIR>/internal\tokenize\token.mbt:48:14-48:17:
   | 
   |   // Special
   |   Newline(loc~ : Loc)
48 |   EOF(loc~ : Loc)
   |              ^^^
   | }
   | 

<WORKDIR>/internal\tokenize\token.mbt:61:8-61:11:
   | 
   | ///|
   | /// Check if two locations are adjacent (end of first equals start of second).
61 | pub fn Loc::adjacent(self : Loc, other : Loc) -> Bool {
   |        ^^^
   |   self.end == other.start
   | }

<WORKDIR>/internal\tokenize\token.mbt:61:29-61:32:
   | 
   | ///|
   | /// Check if two locations are adjacent (end of first equals start of second).
61 | pub fn Loc::adjacent(self : Loc, other : Loc) -> Bool {
   |                             ^^^
   |   self.end == other.start
   | }

<WORKDIR>/internal\tokenize\token.mbt:61:42-61:45:
   | 
   | ///|
   | /// Check if two locations are adjacent (end of first equals start of second).
61 | pub fn Loc::adjacent(self : Loc, other : Loc) -> Bool {
   |                                          ^^^
   |   self.end == other.start
   | }

<WORKDIR>/internal\tokenize\token.mbt:71:35-71:38:
   | /// Every `Token` variant records the span of the lexeme it was produced
   | /// from, so error messages can point back into the original input
   | /// regardless of which alternative matched.
71 | pub fn Token::loc(self : Self) -> Loc {
   |                                   ^^^
   |   match self {
   |     StringToken(_, loc~, ..) => loc

<WORKDIR>/internal\tokenize\tokenize.mbt:3:25-3:28:
  | ///|
  | /// Default location for testing and compatibility
3 | pub fn default_loc() -> Loc {
  |                         ^^^
  |   let pos = Position::{ line: 1, column: 1, }
  |   { start: pos, end: pos, }
"" (escaped)
```
