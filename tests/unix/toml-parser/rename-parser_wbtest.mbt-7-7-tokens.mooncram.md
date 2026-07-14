# toml-parser rename tokens parser_wbtest.mbt:7:7

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
$ run_moon_ide moon ide rename 'tokens' 'tokens_renamed' --loc 'parser_wbtest.mbt:7:7'
*** Begin Patch
*** Update File: <WORKDIR>/parser_wbtest.mbt
@@
 ///|
 test "parse_dotted_key - simple identifier" {
   // Test parsing a simple identifier key
-  let tokens = @tokenize.tokenize("simple")
+  let tokens_renamed = @tokenize.tokenize("simple")
-  let parser = Parser::Parser(tokens)
+  let parser = Parser::Parser(tokens_renamed)
   let result = parser.parse_dotted_key()
   debug_inspect(
     result,
*** End Patch

```
