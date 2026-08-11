# toml-parser find-references start internal/tokenize/token.mbt:10:3

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
$ run_moon_ide moon ide find-references 'start' --loc 'internal/tokenize/token.mbt:10:3'
Found 4 references for symbol 'start':
<WORKDIR>/internal/tokenize/token.mbt:10:3-10:8:
   | /// the parser uses to distinguish e.g. `[[` (array-of-tables) from `[ [`
   | /// (a nested array literal opening a normal table header).
   | pub(all) struct Loc {
10 |   start : @lexer.Position
   |   ^^^^^
   |   end : @lexer.Position
   | } derive(Eq, Debug)

<WORKDIR>/internal/tokenize/token.mbt:60:24-60:29:
   | ///|
   | /// Check if two locations are adjacent (end of first equals start of second).
   | pub fn Loc::adjacent(self : Loc, other : Loc) -> Bool {
60 |   self.end.equal(other.start)
   |                        ^^^^^
   | }
   | 

<WORKDIR>/internal/tokenize/tokenize.mbt:9:5-9:10:
  |   // spelling both the annotation and the `T::` prefix trips
  |   // unnecessary_annotation.
  |   let pos = @lexer.Position::{ line: 1, column: 1 }
9 |   { start: pos, end: pos }
  |     ^^^^^
  | }
  | 

<WORKDIR>/internal/tokenize/tokenize.mbt:26:5-26:10:
   | ///|
   | /// Create a location from lexer positions
   | fn make_loc(start_pos : @lexer.Position, end_pos : @lexer.Position) -> Loc {
26 |   { start: start_pos, end: end_pos }
   |     ^^^^^
   | }
   | 

```
