# toml-parser find-references tokens internal/tokenize/lexer_test.mbt:4:7

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
$ run_moon_ide moon ide find-references 'tokens' --loc 'internal/tokenize/lexer_test.mbt:4:7'
Found 2 references for symbol 'tokens':
<WORKDIR>/internal/tokenize/lexer_test.mbt:4:7-4:13:
  | ///|
  | /// Tests for the TOML lexer
  | test "tokenize simple key-value" {
4 |   let tokens = @tokenize.tokenize(
  |       ^^^^^^
  |     (
  |       #|key = "value"

<WORKDIR>/internal/tokenize/lexer_test.mbt:10:5-10:11:
   |     ),
   |   )
   |   debug_inspect(
10 |     tokens,
   |     ^^^^^^
   |     content=(
   |       #|[

```
