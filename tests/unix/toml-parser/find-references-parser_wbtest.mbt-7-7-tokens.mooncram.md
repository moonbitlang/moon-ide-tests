# toml-parser find-references tokens parser_wbtest.mbt:7:7

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
$ run_moon_ide moon ide find-references 'tokens' --loc 'parser_wbtest.mbt:7:7'
Found 2 references for symbol 'tokens':
<WORKDIR>/parser_wbtest.mbt:7:7-7:13:
  | ///|
  | test "parse_dotted_key - simple identifier" {
  |   // Test parsing a simple identifier key
7 |   let tokens = @tokenize.tokenize("simple")
  |       ^^^^^^
  |   let parser = Parser::Parser(tokens)
  |   let result = parser.parse_dotted_key()

<WORKDIR>/parser_wbtest.mbt:8:31-8:37:
  | test "parse_dotted_key - simple identifier" {
  |   // Test parsing a simple identifier key
  |   let tokens = @tokenize.tokenize("simple")
8 |   let parser = Parser::Parser(tokens)
  |                               ^^^^^^
  |   let result = parser.parse_dotted_key()
  |   debug_inspect(

```
