# core rename profile string/internal/regex_engine/regex.mbt:17:3

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/core" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide rename 'profile' 'profile_renamed' --loc 'string/internal/regex_engine/regex.mbt:17:3'
*** Begin Patch
*** Update File: <WORKDIR>/string/internal/regex_engine/execute.mbt
@@
   guard last_index >= 0 && last_index <= input.length() else { panic() }
   let symbol_table = self.symbol_table
   let prev_cat = category_from_symbol(
-    profile=self.profile,
+    profile=self.profile_renamed,
     symbol_repr=self.symbol_repr,
     if last_index == 0 {
       NULL_SYMBOL
@@
     Failed => None
     Running => {
       let next_cat = category_from_symbol(
-        profile=self.profile,
+        profile=self.profile_renamed,
         symbol_repr=self.symbol_repr,
         if pos >= end {
           NULL_SYMBOL
*** Update File: <WORKDIR>/string/internal/regex_engine/regex.mbt
@@
 
 ///|
 struct Regex {
-  profile : Profile
+  profile_renamed : Profile
   ctx : @automata.Context
   expr : @automata.Expr
   groups : ReadOnlyArray[String?]
@@
   symbol_repr : ReadOnlyArray[Rechar],
 ) -> Regex {
   {
-    profile,
+    profile_renamed: profile,
     ctx,
     expr,
     groups,
*** Update File: <WORKDIR>/string/internal/regex_engine/states.mbt
@@
   symbol : Rechar,
 ) -> StateId {
   let cat = category_from_symbol(
-    profile=self.profile,
+    profile=self.profile_renamed,
     symbol_repr=self.symbol_repr,
     symbol,
   )
*** End Patch

```
