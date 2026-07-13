# core find-references Regex string\internal\regex_engine\regex.mbt:16:8

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide find-references 'Regex' --loc 'string\internal\regex_engine\regex.mbt:16:8'
Found 23 references for symbol 'Regex':
<WORKDIR>/string\internal\regex_engine\compile.mbt:17:54-17:59:
   | 
   | ///|
   | /// Function `compile`.
17 | pub fn compile(profile~ : Profile, ast : Pattern) -> Regex {
   |                                                      ^^^^^
   |   let ast = if ast.is_anchored() {
   |     capture(ast)

<WORKDIR>/string\internal\regex_engine\compile.mbt:35:3-35:8:
   |   let tc = TranslateContext::new(ctx, symbol_table)
   |   let (expr, pref) = translate(tc, ast)
   |   let expr = enforce_pref(tc.ctx, First, pref, expr)
35 |   Regex::new(
   |   ^^^^^
   |     profile,
   |     ctx,

<WORKDIR>/string\internal\regex_engine\execute.mbt:49:8-49:13:
   | 
   | ///|
   | /// Execute using this compiled object.
49 | pub fn Regex::execute(
   |        ^^^^^
   |   self : Regex,
   |   input : StringView,

<WORKDIR>/string\internal\regex_engine\execute.mbt:50:10-50:15:
   | ///|
   | /// Execute using this compiled object.
   | pub fn Regex::execute(
50 |   self : Regex,
   |          ^^^^^
   |   input : StringView,
   |   last_index : Int,

<WORKDIR>/string\internal\regex_engine\regex.mbt:16:8-16:13:
   | // limitations under the License.
   | 
   | ///|
16 | struct Regex {
   |        ^^^^^
   |   profile : Profile
   |   ctx : @automata.Context

<WORKDIR>/string\internal\regex_engine\regex.mbt:35:8-35:13:
   | 
   | ///|
   | /// Function `group_names`.
35 | pub fn Regex::group_names(self : Regex) -> ReadOnlyArray[String?] {
   |        ^^^^^
   |   self.groups
   | }

<WORKDIR>/string\internal\regex_engine\regex.mbt:35:34-35:39:
   | 
   | ///|
   | /// Function `group_names`.
35 | pub fn Regex::group_names(self : Regex) -> ReadOnlyArray[String?] {
   |                                  ^^^^^
   |   self.groups
   | }

<WORKDIR>/string\internal\regex_engine\regex.mbt:40:4-40:9:
   | }
   | 
   | ///|
40 | fn Regex::new(
   |    ^^^^^
   |   profile : Profile,
   |   ctx : @automata.Context,

<WORKDIR>/string\internal\regex_engine\regex.mbt:47:6-47:11:
   |   groups : ReadOnlyArray[String?],
   |   symbol_table : @symbol_map.Table,
   |   symbol_repr : ReadOnlyArray[Rechar],
47 | ) -> Regex {
   |      ^^^^^
   |   {
   |     profile,

<WORKDIR>/string\internal\regex_engine\regex.mbt:65:4-65:9:
   | }
   | 
   | ///|
65 | fn Regex::num_symbols(self : Regex) -> Int {
   |    ^^^^^
   |   self.symbol_repr.length()
   | }

<WORKDIR>/string\internal\regex_engine\regex.mbt:65:30-65:35:
   | }
   | 
   | ///|
65 | fn Regex::num_symbols(self : Regex) -> Int {
   |                              ^^^^^
   |   self.symbol_repr.length()
   | }

<WORKDIR>/string\internal\regex_engine\states.mbt:16:4-16:9:
   | // limitations under the License.
   | 
   | ///|
16 | fn Regex::get_state(self : Regex, state_id : StateId) -> @automata.State {
   |    ^^^^^
   |   self.states.unsafe_get(state_id.index())
   | }

<WORKDIR>/string\internal\regex_engine\states.mbt:16:28-16:33:
   | // limitations under the License.
   | 
   | ///|
16 | fn Regex::get_state(self : Regex, state_id : StateId) -> @automata.State {
   |                            ^^^^^
   |   self.states.unsafe_get(state_id.index())
   | }

<WORKDIR>/string\internal\regex_engine\states.mbt:21:4-21:9:
   | }
   | 
   | ///|
21 | fn Regex::stablize_start_state(self : Regex, prev_cat : Category) -> StateId {
   |    ^^^^^
   |   for start_state in self.start_states {
   |     let (cat, state_id) = start_state

<WORKDIR>/string\internal\regex_engine\states.mbt:21:39-21:44:
   | }
   | 
   | ///|
21 | fn Regex::stablize_start_state(self : Regex, prev_cat : Category) -> StateId {
   |                                       ^^^^^
   |   for start_state in self.start_states {
   |     let (cat, state_id) = start_state

<WORKDIR>/string\internal\regex_engine\states.mbt:36:4-36:9:
   | }
   | 
   | ///|
36 | fn Regex::stablize_state(self : Regex, state : @automata.State) -> StateId {
   |    ^^^^^
   |   self.state_table.get_or_init(state, () => {
   |     let index = self.num_states

<WORKDIR>/string\internal\regex_engine\states.mbt:36:33-36:38:
   | }
   | 
   | ///|
36 | fn Regex::stablize_state(self : Regex, state : @automata.State) -> StateId {
   |                                 ^^^^^
   |   self.state_table.get_or_init(state, () => {
   |     let index = self.num_states

<WORKDIR>/string\internal\regex_engine\states.mbt:75:4-75:9:
   | }
   | 
   | ///|
75 | fn Regex::stablize_next_state(
   |    ^^^^^
   |   self : Regex,
   |   prev_state_id : StateId,

<WORKDIR>/string\internal\regex_engine\states.mbt:76:10-76:15:
   | 
   | ///|
   | fn Regex::stablize_next_state(
76 |   self : Regex,
   |          ^^^^^
   |   prev_state_id : StateId,
   |   symbol : Rechar,

<WORKDIR>/string\internal\regex_engine\states.mbt:91:4-91:9:
   | }
   | 
   | ///|
91 | fn Regex::stablize_final(
   |    ^^^^^
   |   self : Regex,
   |   state_id : StateId,

<WORKDIR>/string\internal\regex_engine\states.mbt:92:10-92:15:
   | 
   | ///|
   | fn Regex::stablize_final(
92 |   self : Regex,
   |          ^^^^^
   |   state_id : StateId,
   |   state : @automata.State,

<WORKDIR>/string\regex.mbt:19:21-19:26:
   | /// A compiled regular expression for string-oriented matching.
   | pub struct Regex {
   |   priv pat : @re.Pattern
19 |   priv mut re : @re.Regex?
   |                     ^^^^^
   | }
   | 

<WORKDIR>/string\regex.mbt:153:35-153:40:
    | }
    | 
    | ///|
153 | fn Regex::re(self : Regex) -> @re.Regex {
    |                                   ^^^^^
    |   match self.re {
    |     Some(re) => re

```
