# toml-parser rename tokens internal/tokenize/lexer_test.mbt:4:7

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
$ run_moon_ide moon ide rename 'tokens' 'tokens_renamed' --loc 'internal/tokenize/lexer_test.mbt:4:7'
*** Begin Patch
*** Update File: <WORKDIR>/internal/tokenize/lexer_test.mbt
@@
 ///|
 /// Tests for the TOML lexer
 test "tokenize simple key-value" {
-  let tokens = @tokenize.tokenize(
+  let tokens_renamed = @tokenize.tokenize(
     (
       #|key = "value"
     ),
   )
   debug_inspect(
-    tokens,
+    tokens_renamed,
     content=(
       #|[
       #|  Identifier(
*** End Patch

```
