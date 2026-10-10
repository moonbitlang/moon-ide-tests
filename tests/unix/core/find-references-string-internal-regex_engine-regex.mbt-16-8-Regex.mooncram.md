# core find-references Regex string/internal/regex_engine/regex.mbt:16:8

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
$ run_moon_ide moon ide find-references 'Regex' --loc 'string/internal/regex_engine/regex.mbt:16:8'
Found 24 references for symbol 'Regex':
<WORKDIR>/string/internal/regex_engine/compile.mbt:17:54-17:59:
   | 
   | ///|
   | /// Function `compile`.
17 | pub fn compile(profile~ : Profile, ast : Pattern) -> Regex {
   |                                                      ^^^^^
   |   let ast = if ast.is_anchored() {
   |     capture(ast)

<WORKDIR>/string/internal/regex_engine/compile.mbt:35:3-35:8:
   |   let tc = TranslateContext::new(ctx, symbol_table)
   |   let (expr, pref) = translate(tc, ast)
   |   let expr = enforce_pref(tc.ctx, First, pref, expr)
35 |   Regex::new(
   |   ^^^^^
   |     profile,
   |     ctx,

<WORKDIR>/string/internal/regex_engine/execute.mbt:51:8-51:13:
   | 
   | ///|
   | /// Execute using this compiled object.
51 | pub fn Regex::execute(
   |        ^^^^^
   |   self : Regex,
   |   input : StringView,

<WORKDIR>/string/internal/regex_engine/execute.mbt:52:10-52:15:
   | ///|
   | /// Execute using this compiled object.
   | pub fn Regex::execute(
52 |   self : Regex,
   |          ^^^^^
   |   input : StringView,
   |   last_index : Int,

<WORKDIR>/string/internal/regex_engine/regex.mbt:42:8-42:13:
   | 
   | ///|
   | /// Function `group_names`.
42 | pub fn Regex::group_names(self : Regex) -> ReadOnlyArray[String?] {
   |        ^^^^^
   |   self.groups
   | }

<WORKDIR>/string/internal/regex_engine/regex.mbt:42:34-42:39:
   | 
   | ///|
   | /// Function `group_names`.
42 | pub fn Regex::group_names(self : Regex) -> ReadOnlyArray[String?] {
   |                                  ^^^^^
   |   self.groups
   | }

<WORKDIR>/string/internal/regex_engine/regex.mbt:47:4-47:9:
   | }
   | 
   | ///|
47 | fn Regex::new(
   |    ^^^^^
   |   profile : Profile,
   |   ctx : @automata.Context,

<WORKDIR>/string/internal/regex_engine/regex.mbt:54:6-54:11:
   |   groups : ReadOnlyArray[String?],
   |   symbol_table : @symbol_map.Table,
   |   symbol_repr : ReadOnlyArray[Rechar],
54 | ) -> Regex {
   |      ^^^^^
   |   {
   |     profile,

<WORKDIR>/string/internal/regex_engine/regex.mbt:75:4-75:9:
   | }
   | 
   | ///|
75 | fn Regex::num_symbols(self : Regex) -> Int {
   |    ^^^^^
   |   self.symbol_repr.length()
   | }

<WORKDIR>/string/internal/regex_engine/regex.mbt:75:30-75:35:
   | }
   | 
   | ///|
75 | fn Regex::num_symbols(self : Regex) -> Int {
   |                              ^^^^^
   |   self.symbol_repr.length()
   | }

<WORKDIR>/string/internal/regex_engine/states.mbt:16:4-16:9:
   | // limitations under the License.
   | 
   | ///|
16 | fn Regex::get_state(self : Regex, state_id : StateId) -> @automata.State {
   |    ^^^^^
   |   self.states.unsafe_get(self.state_index(state_id))
   | }

<WORKDIR>/string/internal/regex_engine/states.mbt:16:28-16:33:
   | // limitations under the License.
   | 
   | ///|
16 | fn Regex::get_state(self : Regex, state_id : StateId) -> @automata.State {
   |                            ^^^^^
   |   self.states.unsafe_get(self.state_index(state_id))
   | }

<WORKDIR>/string/internal/regex_engine/states.mbt:21:4-21:9:
   | }
   | 
   | ///|
21 | fn Regex::state_index(self : Regex, state_id : StateId) -> Int {
   |    ^^^^^
   |   state_id.transition_base() / self.num_symbols()
   | }

<WORKDIR>/string/internal/regex_engine/states.mbt:21:30-21:35:
   | }
   | 
   | ///|
21 | fn Regex::state_index(self : Regex, state_id : StateId) -> Int {
   |                              ^^^^^
   |   state_id.transition_base() / self.num_symbols()
   | }

<WORKDIR>/string/internal/regex_engine/states.mbt:26:4-26:9:
   | }
   | 
   | ///|
26 | fn Regex::stablize_start_state(self : Regex, prev_cat : Category) -> StateId {
   |    ^^^^^
   |   for start_state in self.start_states {
   |     let (cat, state_id) = start_state

<WORKDIR>/string/internal/regex_engine/states.mbt:26:39-26:44:
   | }
   | 
   | ///|
26 | fn Regex::stablize_start_state(self : Regex, prev_cat : Category) -> StateId {
   |                                       ^^^^^
   |   for start_state in self.start_states {
   |     let (cat, state_id) = start_state

<WORKDIR>/string/internal/regex_engine/states.mbt:41:4-41:9:
   | }
   | 
   | ///|
41 | fn Regex::stablize_state(self : Regex, state : @automata.State) -> StateId {
   |    ^^^^^
   |   self.state_table.get_or_init(state, () => {
   |     let index = self.num_states

<WORKDIR>/string/internal/regex_engine/states.mbt:41:33-41:38:
   | }
   | 
   | ///|
41 | fn Regex::stablize_state(self : Regex, state : @automata.State) -> StateId {
   |                                 ^^^^^
   |   self.state_table.get_or_init(state, () => {
   |     let index = self.num_states

<WORKDIR>/string/internal/regex_engine/states.mbt:81:4-81:9:
   | }
   | 
   | ///|
81 | fn Regex::stablize_next_state(
   |    ^^^^^
   |   self : Regex,
   |   prev_state_id : StateId,

<WORKDIR>/string/internal/regex_engine/states.mbt:82:10-82:15:
   | 
   | ///|
   | fn Regex::stablize_next_state(
82 |   self : Regex,
   |          ^^^^^
   |   prev_state_id : StateId,
   |   symbol : Rechar,

<WORKDIR>/string/internal/regex_engine/states.mbt:97:4-97:9:
   | }
   | 
   | ///|
97 | fn Regex::stablize_final(
   |    ^^^^^
   |   self : Regex,
   |   state_id : StateId,

<WORKDIR>/string/internal/regex_engine/states.mbt:98:10-98:15:
   | 
   | ///|
   | fn Regex::stablize_final(
98 |   self : Regex,
   |          ^^^^^
   |   state_id : StateId,
   |   state : @automata.State,

<WORKDIR>/string/regex.mbt:19:21-19:26:
   | /// A compiled regular expression for string-oriented matching.
   | pub struct Regex {
   |   priv pat : @re.Pattern
19 |   priv mut re : @re.Regex?
   |                     ^^^^^
   | }
   | 

<WORKDIR>/string/regex.mbt:154:35-154:40:
    | }
    | 
    | ///|
154 | fn Regex::re(self : Regex) -> @re.Regex {
    |                                   ^^^^^
    |   match self.re {
    |     Some(re) => re

```
