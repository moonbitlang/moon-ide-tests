# toml-parser find-references Loc internal/tokenize/token.mbt:9:17

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
$ run_moon_ide moon ide find-references 'Loc' --loc 'internal/tokenize/token.mbt:9:17'
Found 22 references for symbol 'Loc':
<WORKDIR>/internal/tokenize/token.mbt:9:17-9:20:
  | /// `adjacent` (no gap) when one's `end` equals the other's `start`, which
  | /// the parser uses to distinguish e.g. `[[` (array-of-tables) from `[ [`
  | /// (a nested array literal opening a normal table header).
9 | pub(all) struct Loc {
  |                 ^^^
  |   start : @lexer.Position
  |   end : @lexer.Position

<WORKDIR>/internal/tokenize/token.mbt:18:30-18:33:
   | /// Token types for the lexer
   | pub(all) enum Token {
   |   // Literals
18 |   StringToken(String, loc~ : Loc, multiline~ : Bool)
   |                              ^^^
   |   IntegerToken(Int64, loc~ : Loc)
   |   FloatToken(Double, loc~ : Loc, raw~ : String)

<WORKDIR>/internal/tokenize/token.mbt:19:30-19:33:
   | pub(all) enum Token {
   |   // Literals
   |   StringToken(String, loc~ : Loc, multiline~ : Bool)
19 |   IntegerToken(Int64, loc~ : Loc)
   |                              ^^^
   |   FloatToken(Double, loc~ : Loc, raw~ : String)
   |   BooleanToken(Bool, loc~ : Loc)

<WORKDIR>/internal/tokenize/token.mbt:20:29-20:32:
   |   // Literals
   |   StringToken(String, loc~ : Loc, multiline~ : Bool)
   |   IntegerToken(Int64, loc~ : Loc)
20 |   FloatToken(Double, loc~ : Loc, raw~ : String)
   |                             ^^^
   |   BooleanToken(Bool, loc~ : Loc)
   |   DateTimeToken(@datetime.TomlDateTime, loc~ : Loc)

<WORKDIR>/internal/tokenize/token.mbt:21:29-21:32:
   |   StringToken(String, loc~ : Loc, multiline~ : Bool)
   |   IntegerToken(Int64, loc~ : Loc)
   |   FloatToken(Double, loc~ : Loc, raw~ : String)
21 |   BooleanToken(Bool, loc~ : Loc)
   |                             ^^^
   |   DateTimeToken(@datetime.TomlDateTime, loc~ : Loc)
   | 

<WORKDIR>/internal/tokenize/token.mbt:22:48-22:51:
   |   IntegerToken(Int64, loc~ : Loc)
   |   FloatToken(Double, loc~ : Loc, raw~ : String)
   |   BooleanToken(Bool, loc~ : Loc)
22 |   DateTimeToken(@datetime.TomlDateTime, loc~ : Loc)
   |                                                ^^^
   | 
   |   // Symbols

<WORKDIR>/internal/tokenize/token.mbt:25:22-25:25:
   |   DateTimeToken(@datetime.TomlDateTime, loc~ : Loc)
   | 
   |   // Symbols
25 |   LeftBracket(loc~ : Loc) // [
   |                      ^^^
   |   RightBracket(loc~ : Loc) // ]
   |   LeftBrace(loc~ : Loc) // {

<WORKDIR>/internal/tokenize/token.mbt:26:23-26:26:
   | 
   |   // Symbols
   |   LeftBracket(loc~ : Loc) // [
26 |   RightBracket(loc~ : Loc) // ]
   |                       ^^^
   |   LeftBrace(loc~ : Loc) // {
   |   RightBrace(loc~ : Loc) // }

<WORKDIR>/internal/tokenize/token.mbt:27:20-27:23:
   |   // Symbols
   |   LeftBracket(loc~ : Loc) // [
   |   RightBracket(loc~ : Loc) // ]
27 |   LeftBrace(loc~ : Loc) // {
   |                    ^^^
   |   RightBrace(loc~ : Loc) // }
   |   Equals(loc~ : Loc) // =

<WORKDIR>/internal/tokenize/token.mbt:28:21-28:24:
   |   LeftBracket(loc~ : Loc) // [
   |   RightBracket(loc~ : Loc) // ]
   |   LeftBrace(loc~ : Loc) // {
28 |   RightBrace(loc~ : Loc) // }
   |                     ^^^
   |   Equals(loc~ : Loc) // =
   |   Comma(loc~ : Loc) // ,

<WORKDIR>/internal/tokenize/token.mbt:29:17-29:20:
   |   RightBracket(loc~ : Loc) // ]
   |   LeftBrace(loc~ : Loc) // {
   |   RightBrace(loc~ : Loc) // }
29 |   Equals(loc~ : Loc) // =
   |                 ^^^
   |   Comma(loc~ : Loc) // ,
   |   Dot(loc~ : Loc) // .

<WORKDIR>/internal/tokenize/token.mbt:30:16-30:19:
   |   LeftBrace(loc~ : Loc) // {
   |   RightBrace(loc~ : Loc) // }
   |   Equals(loc~ : Loc) // =
30 |   Comma(loc~ : Loc) // ,
   |                ^^^
   |   Dot(loc~ : Loc) // .
   | 

<WORKDIR>/internal/tokenize/token.mbt:31:14-31:17:
   |   RightBrace(loc~ : Loc) // }
   |   Equals(loc~ : Loc) // =
   |   Comma(loc~ : Loc) // ,
31 |   Dot(loc~ : Loc) // .
   |              ^^^
   | 
   |   // Identifiers and keywords

<WORKDIR>/internal/tokenize/token.mbt:34:29-34:32:
   |   Dot(loc~ : Loc) // .
   | 
   |   // Identifiers and keywords
34 |   Identifier(String, loc~ : Loc)
   |                             ^^^
   | 
   |   // Special

<WORKDIR>/internal/tokenize/token.mbt:37:18-37:21:
   |   Identifier(String, loc~ : Loc)
   | 
   |   // Special
37 |   Newline(loc~ : Loc)
   |                  ^^^
   |   EOF(loc~ : Loc)
   | } derive(Eq, Debug)

<WORKDIR>/internal/tokenize/token.mbt:38:14-38:17:
   | 
   |   // Special
   |   Newline(loc~ : Loc)
38 |   EOF(loc~ : Loc)
   |              ^^^
   | } derive(Eq, Debug)
   | 

<WORKDIR>/internal/tokenize/token.mbt:43:8-43:11:
   | 
   | ///|
   | /// Check if two locations are adjacent (end of first equals start of second).
43 | pub fn Loc::adjacent(self : Loc, other : Loc) -> Bool {
   |        ^^^
   |   self.end.equal(other.start)
   | }

<WORKDIR>/internal/tokenize/token.mbt:43:29-43:32:
   | 
   | ///|
   | /// Check if two locations are adjacent (end of first equals start of second).
43 | pub fn Loc::adjacent(self : Loc, other : Loc) -> Bool {
   |                             ^^^
   |   self.end.equal(other.start)
   | }

<WORKDIR>/internal/tokenize/token.mbt:43:42-43:45:
   | 
   | ///|
   | /// Check if two locations are adjacent (end of first equals start of second).
43 | pub fn Loc::adjacent(self : Loc, other : Loc) -> Bool {
   |                                          ^^^
   |   self.end.equal(other.start)
   | }

<WORKDIR>/internal/tokenize/token.mbt:53:35-53:38:
   | /// Every `Token` variant records the span of the lexeme it was produced
   | /// from, so error messages can point back into the original input
   | /// regardless of which alternative matched.
53 | pub fn Token::loc(self : Self) -> Loc {
   |                                   ^^^
   |   match self {
   |     StringToken(_, loc~, ..) => loc

<WORKDIR>/internal/tokenize/tokenize.mbt:3:25-3:28:
  | ///|
  | /// Default location for testing and compatibility
3 | pub fn default_loc() -> Loc {
  |                         ^^^
  |   let pos : @lexer.Position = { line: 1, column: 1 }
  |   { start: pos, end: pos }

<WORKDIR>/internal/tokenize/tokenize.mbt:13:72-13:75:
   | 
   | ///|
   | /// Create a location from lexer positions
13 | fn make_loc(start_pos : @lexer.Position, end_pos : @lexer.Position) -> Loc {
   |                                                                        ^^^
   |   { start: start_pos, end: end_pos }
   | }

```
