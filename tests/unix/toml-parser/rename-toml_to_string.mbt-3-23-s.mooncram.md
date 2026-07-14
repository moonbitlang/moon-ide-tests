# toml-parser rename s toml_to_string.mbt:3:23

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
$ run_moon_ide moon ide rename 's' 's_renamed' --loc 'toml_to_string.mbt:3:23'
*** Begin Patch
*** Update File: <WORKDIR>/toml_to_string.mbt
@@
 ///|
 /// Helper function to escape strings according to TOML spec
-fn escape_toml_string(s : String) -> String {
+fn escape_toml_string(s_renamed : String) -> String {
   let result = StringBuilder()
   for char in s {
     match char {
@@
         output <+ "\{format_toml_key(key)}]\n"
         let new_path = path.copy()
         new_path.push(key)
-        write_table_contents(t, output, new_path)
+        write_table_contents(s_renamed, output, new_path)
       }
       _ => () // Should not happen
     }
*** End Patch

```
