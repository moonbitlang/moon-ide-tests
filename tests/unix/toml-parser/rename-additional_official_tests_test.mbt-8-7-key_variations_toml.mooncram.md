# toml-parser rename key_variations_toml additional_official_tests_test.mbt:8:7

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
$ run_moon_ide moon ide rename 'key_variations_toml' 'key_variations_toml_renamed' --loc 'additional_official_tests_test.mbt:8:7'
*** Begin Patch
*** Update File: <WORKDIR>/additional_official_tests_test.mbt
@@
 ///|
 /// Test key names with various characters
 test "key name variations" {
-  let key_variations_toml =
+  let key_variations_toml_renamed =
     #|bare_key = "value"
     #|bare-key = "value"
     #|bare_key2 = "value"
@@
     #|"ʎǝʞ" = "value"
     #|
   debug_inspect(
-    @toml.parse(key_variations_toml),
+    @toml.parse(key_variations_toml_renamed),
     content=(
       #|TomlTable(
       #|  {
*** End Patch

```
