# toml-parser rename skip_newlines parser.mbt:3:12

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
$ run_moon_ide moon ide rename 'skip_newlines' 'skip_newlines_renamed' --loc 'parser.mbt:3:12'
*** Begin Patch
*** Update File: <WORKDIR>/parser.mbt
@@
 ///|
 /// Skip newline tokens
-fn Parser::skip_newlines(self : Parser) -> Unit {
+fn Parser::skip_newlines_renamed(self : Parser) -> Unit {
   let next_view = for view = self.view() {
     match view {
       [Newline(..), .. rest] => continue rest
@@
 /// No trailing comma allowed unlike Array
 fn Parser::parse_inline_table(self : Parser) -> TomlValue raise {
   let table = {}
-  self.skip_newlines() // TOML 1.1: allow newlines in inline tables
+  self.skip_newlines_renamed() // TOML 1.1: allow newlines in inline tables
   if self.view() is [RightBrace, .. rest] {
     self.update_view(rest)
     table[inline_table_marker] = TomlBoolean(true)
@@
     return TomlTable(table)
   }
   while true {
-    self.skip_newlines()
+    self.skip_newlines_renamed()
     // Parse dotted key
     let key_path = self.parse_dotted_key()
 
@@
     set_dotted_key_value(table, key_path, value) catch {
       error => self.error(error.to_string())
     }
-    self.skip_newlines()
+    self.skip_newlines_renamed()
     match self.view() {
       [Comma, .. rest] => {
         self.update_view(rest)
-        self.skip_newlines()
+        self.skip_newlines_renamed()
         // Trailing comma: check for closing brace after comma
         if self.view() is [RightBrace, .. rest2] {
           self.update_view(rest2)
@@
   let parser = Parser::Parser(tokens)
   let main_table = {}
   for current_table = main_table {
-    parser.skip_newlines()
+    parser.skip_newlines_renamed()
     match parser.view() {
       [EOF, ..] => break
       [LeftBracket(loc=loc1), LeftBracket(loc=loc2), .. rest] => {
*** End Patch

```
