# toml-parser rename escape_toml_string toml_to_string.mbt:3:4

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
$ run_moon_ide moon ide rename 'escape_toml_string' 'escape_toml_string_renamed' --loc 'toml_to_string.mbt:3:4'
*** Begin Patch
*** Update File: <WORKDIR>/toml_to_string.mbt
@@
 ///|
 /// Helper function to escape strings according to TOML spec
-fn escape_toml_string(s : String) -> String {
+fn escape_toml_string_renamed(s : String) -> String {
   let result = StringBuilder()
   for char in s {
     match char {
@@
 /// Format a key for TOML output
 fn format_toml_key(key : String) -> String {
   if needs_quoting(key) {
-    "\"\{escape_toml_string(key)}\""
+    "\"\{escape_toml_string_renamed(key)}\""
   } else {
     key
   }
@@
   path : Array[String], // Current table path for nested tables
 ) -> Unit {
   match self {
-    TomlString(s) => output <+ "\"\{escape_toml_string(s)}\""
+    TomlString(s) => output <+ "\"\{escape_toml_string_renamed(s)}\""
     TomlInteger(i) => output <+ "\{i}"
     TomlFloat(f) =>
       // Handle special float values
*** End Patch

```
