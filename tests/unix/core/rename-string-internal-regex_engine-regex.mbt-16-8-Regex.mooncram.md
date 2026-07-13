# core rename Regex string/internal/regex_engine/regex.mbt:16:8

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
$ run_moon_ide moon ide rename 'Regex' 'RegexRenamed' --loc 'string/internal/regex_engine/regex.mbt:16:8'
*** Begin Patch
*** Update File: <WORKDIR>/string/internal/regex_engine/compile.mbt
@@
 
 ///|
 /// Function `compile`.
-pub fn compile(profile~ : Profile, ast : Pattern) -> Regex {
+pub fn compile(profile~ : Profile, ast : Pattern) -> RegexRenamed {
   let ast = if ast.is_anchored() {
     capture(ast)
   } else {
@@
   let tc = TranslateContext::new(ctx, symbol_table)
   let (expr, pref) = translate(tc, ast)
   let expr = enforce_pref(tc.ctx, First, pref, expr)
-  Regex::new(
+  RegexRenamed::new(
     profile,
     ctx,
     expr,
*** Update File: <WORKDIR>/string/internal/regex_engine/execute.mbt
@@
 
 ///|
 /// Execute using this compiled object.
-pub fn Regex::execute(
+pub fn RegexRenamed::execute(
-  self : Regex,
+  self : RegexRenamed,
   input : StringView,
   last_index : Int,
 ) -> MatchResult? {
*** Update File: <WORKDIR>/string/internal/regex_engine/regex.mbt
@@
 // limitations under the License.
 
 ///|
-struct Regex {
+struct RegexRenamed {
   profile : Profile
   ctx : @automata.Context
   expr : @automata.Expr
@@
 
 ///|
 /// Function `group_names`.
-pub fn Regex::group_names(self : Regex) -> ReadOnlyArray[String?] {
+pub fn RegexRenamed::group_names(self : RegexRenamed) -> ReadOnlyArray[String?] {
   self.groups
 }
 
 ///|
-fn Regex::new(
+fn RegexRenamed::new(
   profile : Profile,
   ctx : @automata.Context,
   expr : @automata.Expr,
@@
   groups : ReadOnlyArray[String?],
   symbol_table : @symbol_map.Table,
   symbol_repr : ReadOnlyArray[Rechar],
-) -> Regex {
+) -> RegexRenamed {
   {
     profile,
     ctx,
@@
 }
 
 ///|
-fn Regex::num_symbols(self : Regex) -> Int {
+fn RegexRenamed::num_symbols(self : RegexRenamed) -> Int {
   self.symbol_repr.length()
 }
*** Update File: <WORKDIR>/string/internal/regex_engine/states.mbt
@@
 // limitations under the License.
 
 ///|
-fn Regex::get_state(self : Regex, state_id : StateId) -> @automata.State {
+fn RegexRenamed::get_state(self : RegexRenamed, state_id : StateId) -> @automata.State {
   self.states.unsafe_get(state_id.index())
 }
 
 ///|
-fn Regex::stablize_start_state(self : Regex, prev_cat : Category) -> StateId {
+fn RegexRenamed::stablize_start_state(self : RegexRenamed, prev_cat : Category) -> StateId {
   for start_state in self.start_states {
     let (cat, state_id) = start_state
     if cat == prev_cat {
@@
 }
 
 ///|
-fn Regex::stablize_state(self : Regex, state : @automata.State) -> StateId {
+fn RegexRenamed::stablize_state(self : RegexRenamed, state : @automata.State) -> StateId {
   self.state_table.get_or_init(state, () => {
     let index = self.num_states
     self.num_states += 1
@@
 }
 
 ///|
-fn Regex::stablize_next_state(
+fn RegexRenamed::stablize_next_state(
-  self : Regex,
+  self : RegexRenamed,
   prev_state_id : StateId,
   symbol : Rechar,
 ) -> StateId {
@@
 }
 
 ///|
-fn Regex::stablize_final(
+fn RegexRenamed::stablize_final(
-  self : Regex,
+  self : RegexRenamed,
   state_id : StateId,
   state : @automata.State,
   next_cat : Category,
*** Update File: <WORKDIR>/string/regex.mbt
@@
 /// A compiled regular expression for string-oriented matching.
 pub struct Regex {
   priv pat : @re.Pattern
-  priv mut re : @re.Regex?
+  priv mut re : @re.RegexRenamed?
 }
 
 ///|
@@
 }
 
 ///|
-fn Regex::re(self : Regex) -> @re.Regex {
+fn Regex::re(self : Regex) -> @re.RegexRenamed {
   match self.re {
     Some(re) => re
     None => {
*** End Patch

```
