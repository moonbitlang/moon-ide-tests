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
Found 24 references for symbol 'Loc':
<WORKDIR>/internal/tokenize/token.mbt:9:17-9:20:
  | /// `adjacent` (no gap) when one's `end` equals the other's `start`, which
  | /// the parser uses to distinguish e.g. `[[` (array-of-tables) from `[ [`
  | /// (a nested array literal opening a normal table header).
9 | pub(all) struct Loc {
  |                 ^^^
  |   start : @lexer.Position
  |   end : @lexer.Position

<WORKDIR>/internal/tokenize/token.mbt:16:12-16:15:
   | 
   | ///|
   | #deprecated("compare with `==`; the Eq impl is unaffected")
16 | pub extend Loc with Eq::{not_equal, equal}
   |            ^^^
   | 
   | ///|

<WORKDIR>/internal/tokenize/token.mbt:20:12-20:15:
   | 
   | ///|
   | #deprecated("render via the Debug trait, e.g. `debug_inspect`")
20 | pub extend Loc with Debug::{to_repr}
   |            ^^^
   | 
   | ///|

<WORKDIR>/internal/tokenize/token.mbt:26:30-26:33:
   | /// Token types for the lexer
   | pub(all) enum Token {
   |   // Literals
26 |   StringToken(String, loc~ : Loc, multiline~ : Bool)
   |                              ^^^
   |   IntegerToken(Int64, loc~ : Loc)
   |   FloatToken(Double, loc~ : Loc, raw~ : String)

<WORKDIR>/internal/tokenize/token.mbt:27:30-27:33:
   | pub(all) enum Token {
   |   // Literals
   |   StringToken(String, loc~ : Loc, multiline~ : Bool)
27 |   IntegerToken(Int64, loc~ : Loc)
   |                              ^^^
   |   FloatToken(Double, loc~ : Loc, raw~ : String)
   |   BooleanToken(Bool, loc~ : Loc)

<WORKDIR>/internal/tokenize/token.mbt:28:29-28:32:
   |   // Literals
   |   StringToken(String, loc~ : Loc, multiline~ : Bool)
   |   IntegerToken(Int64, loc~ : Loc)
28 |   FloatToken(Double, loc~ : Loc, raw~ : String)
   |                             ^^^
   |   BooleanToken(Bool, loc~ : Loc)
   |   DateTimeToken(@datetime.TomlDateTime, loc~ : Loc)

<WORKDIR>/internal/tokenize/token.mbt:29:29-29:32:
   |   StringToken(String, loc~ : Loc, multiline~ : Bool)
   |   IntegerToken(Int64, loc~ : Loc)
   |   FloatToken(Double, loc~ : Loc, raw~ : String)
29 |   BooleanToken(Bool, loc~ : Loc)
   |                             ^^^
   |   DateTimeToken(@datetime.TomlDateTime, loc~ : Loc)
   | 

<WORKDIR>/internal/tokenize/token.mbt:30:48-30:51:
   |   IntegerToken(Int64, loc~ : Loc)
   |   FloatToken(Double, loc~ : Loc, raw~ : String)
   |   BooleanToken(Bool, loc~ : Loc)
30 |   DateTimeToken(@datetime.TomlDateTime, loc~ : Loc)
   |                                                ^^^
   | 
   |   // Symbols

<WORKDIR>/internal/tokenize/token.mbt:33:22-33:25:
   |   DateTimeToken(@datetime.TomlDateTime, loc~ : Loc)
   | 
   |   // Symbols
33 |   LeftBracket(loc~ : Loc) // [
   |                      ^^^
   |   RightBracket(loc~ : Loc) // ]
   |   LeftBrace(loc~ : Loc) // {

<WORKDIR>/internal/tokenize/token.mbt:34:23-34:26:
   | 
   |   // Symbols
   |   LeftBracket(loc~ : Loc) // [
34 |   RightBracket(loc~ : Loc) // ]
   |                       ^^^
   |   LeftBrace(loc~ : Loc) // {
   |   RightBrace(loc~ : Loc) // }

<WORKDIR>/internal/tokenize/token.mbt:35:20-35:23:
   |   // Symbols
   |   LeftBracket(loc~ : Loc) // [
   |   RightBracket(loc~ : Loc) // ]
35 |   LeftBrace(loc~ : Loc) // {
   |                    ^^^
   |   RightBrace(loc~ : Loc) // }
   |   Equals(loc~ : Loc) // =

<WORKDIR>/internal/tokenize/token.mbt:36:21-36:24:
   |   LeftBracket(loc~ : Loc) // [
   |   RightBracket(loc~ : Loc) // ]
   |   LeftBrace(loc~ : Loc) // {
36 |   RightBrace(loc~ : Loc) // }
   |                     ^^^
   |   Equals(loc~ : Loc) // =
   |   Comma(loc~ : Loc) // ,

<WORKDIR>/internal/tokenize/token.mbt:37:17-37:20:
   |   RightBracket(loc~ : Loc) // ]
   |   LeftBrace(loc~ : Loc) // {
   |   RightBrace(loc~ : Loc) // }
37 |   Equals(loc~ : Loc) // =
   |                 ^^^
   |   Comma(loc~ : Loc) // ,
   |   Dot(loc~ : Loc) // .

<WORKDIR>/internal/tokenize/token.mbt:38:16-38:19:
   |   LeftBrace(loc~ : Loc) // {
   |   RightBrace(loc~ : Loc) // }
   |   Equals(loc~ : Loc) // =
38 |   Comma(loc~ : Loc) // ,
   |                ^^^
   |   Dot(loc~ : Loc) // .
   | 

<WORKDIR>/internal/tokenize/token.mbt:39:14-39:17:
   |   RightBrace(loc~ : Loc) // }
   |   Equals(loc~ : Loc) // =
   |   Comma(loc~ : Loc) // ,
39 |   Dot(loc~ : Loc) // .
   |              ^^^
   | 
   |   // Identifiers and keywords

<WORKDIR>/internal/tokenize/token.mbt:42:29-42:32:
   |   Dot(loc~ : Loc) // .
   | 
   |   // Identifiers and keywords
42 |   Identifier(String, loc~ : Loc)
   |                             ^^^
   | 
   |   // Special

<WORKDIR>/internal/tokenize/token.mbt:45:18-45:21:
   |   Identifier(String, loc~ : Loc)
   | 
   |   // Special
45 |   Newline(loc~ : Loc)
   |                  ^^^
   |   EOF(loc~ : Loc)
   | } derive(Eq, Debug)

<WORKDIR>/internal/tokenize/token.mbt:46:14-46:17:
   | 
   |   // Special
   |   Newline(loc~ : Loc)
46 |   EOF(loc~ : Loc)
   |              ^^^
   | } derive(Eq, Debug)
   | 

<WORKDIR>/internal/tokenize/token.mbt:59:8-59:11:
   | 
   | ///|
   | /// Check if two locations are adjacent (end of first equals start of second).
59 | pub fn Loc::adjacent(self : Loc, other : Loc) -> Bool {
   |        ^^^
   |   self.end.equal(other.start)
   | }

<WORKDIR>/internal/tokenize/token.mbt:59:29-59:32:
   | 
   | ///|
   | /// Check if two locations are adjacent (end of first equals start of second).
59 | pub fn Loc::adjacent(self : Loc, other : Loc) -> Bool {
   |                             ^^^
   |   self.end.equal(other.start)
   | }

<WORKDIR>/internal/tokenize/token.mbt:59:42-59:45:
   | 
   | ///|
   | /// Check if two locations are adjacent (end of first equals start of second).
59 | pub fn Loc::adjacent(self : Loc, other : Loc) -> Bool {
   |                                          ^^^
   |   self.end.equal(other.start)
   | }

<WORKDIR>/internal/tokenize/token.mbt:69:35-69:38:
   | /// Every `Token` variant records the span of the lexeme it was produced
   | /// from, so error messages can point back into the original input
   | /// regardless of which alternative matched.
69 | pub fn Token::loc(self : Self) -> Loc {
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

<WORKDIR>/internal/tokenize/tokenize.mbt:21:72-21:75:
   | 
   | ///|
   | /// Create a location from lexer positions
21 | fn make_loc(start_pos : @lexer.Position, end_pos : @lexer.Position) -> Loc {
   |                                                                        ^^^
   |   { start: start_pos, end: end_pos }
   | }

```
