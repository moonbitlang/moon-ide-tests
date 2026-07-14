# core peek-def

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
$ run_moon_ide moon ide peek-def 'from_int' --loc 'builtin/int64.mbt:31:15'
Definition found at file <WORKDIR>/builtin/int64.mbt
   | /// ```mbt check
   | /// test {
   | ///   inspect(Int64::from_int(42), content="42")
   | /// }
   | /// ```
31 | pub fn Int64::from_int(i : Int) -> Int64 {
   |               ^^^^^^^^
   |   i.to_int64()
   | }
   | 
   | ///|
   | /// Computes the absolute value of a 64-bit integer.
   | ///
   | /// Parameters:
   | ///
   | /// * `self` : The 64-bit integer whose absolute value is to be computed.
   | ///
   | /// Returns the absolute value of the input integer.
   | ///
   | /// Example:
   | ///
```

```mooncram
$ run_moon_ide moon ide peek-def 'i' --loc 'builtin/int64.mbt:31:24'
Definition found at file <WORKDIR>/builtin/int64.mbt
   | /// ```mbt check
   | /// test {
   | ///   inspect(Int64::from_int(42), content="42")
   | /// }
   | /// ```
31 | pub fn Int64::from_int(i : Int) -> Int64 {
   |                        ^
   |   i.to_int64()
   | }
   | 
   | ///|
   | /// Computes the absolute value of a 64-bit integer.
   | ///
   | /// Parameters:
   | ///
   | /// * `self` : The 64-bit integer whose absolute value is to be computed.
   | ///
   | /// Returns the absolute value of the input integer.
   | ///
   | /// Example:
   | ///
```

```mooncram
$ run_moon_ide moon ide peek-def 'ToStringView' --loc 'builtin/string_like.mbt:19:11'
Definition found at file <WORKDIR>/builtin/string_like.mbt
   | 
   | ///|
   | /// Trait for values that can be viewed as `StringView`.
   | ///
   | /// Types implementing this trait provide zero-copy access to string-like data.
19 | pub trait ToStringView {
   | ^
   |   fn to_string_view(Self) -> StringView
   | }
   | 
   | ///|
   | pub impl ToStringView for String with fn to_string_view(self) -> StringView {
   |   self
   | }
   | 
   | ///|
   | pub impl ToStringView for StringView with fn to_string_view(self) -> StringView {
   |   self
   | }
```

```mooncram
$ run_moon_ide moon ide peek-def 'to_string_view' --loc 'builtin/string_like.mbt:20:6'
Definition found at file <WORKDIR>/builtin/string_like.mbt
   | ///|
   | /// Trait for values that can be viewed as `StringView`.
   | ///
   | /// Types implementing this trait provide zero-copy access to string-like data.
   | pub trait ToStringView {
20 |   fn to_string_view(Self) -> StringView
   |      ^^^^^^^^^^^^^^
   | }
   | 
   | ///|
   | pub impl ToStringView for String with fn to_string_view(self) -> StringView {
   |   self
   | }
   | 
   | ///|
   | pub impl ToStringView for StringView with fn to_string_view(self) -> StringView {
   |   self
   | }
```

```mooncram
$ run_moon_ide moon ide peek-def 'ReprDelta' --loc 'debug/delta.mbt:17:11'
Definition found at file <WORKDIR>/debug/delta.mbt
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
   | /// Tree-shaped diff between two `Repr` values.
17 | priv enum ReprDelta {
   |           ^^^^^^^^^
   |   Same(Repr, Array[ReprDelta])
   |   Different(Repr, Repr)
   |   Extra1(Repr)
   |   Extra2(Repr)
   | }
   | 
   | ///|
   | /// Default max relative error for `DoubleLit` comparisons.
   | const DEFAULT_MAX_RELATIVE_ERROR : Double = 0.000000000001
   | 
   | ///|
   | /// Absolute value for `Double`.
   | fn double_abs(x : Double) -> Double {
   |   if x < 0.0 {
```

```mooncram
$ run_moon_ide moon ide peek-def 'Same' --loc 'debug/delta.mbt:18:3'
Definition found at file <WORKDIR>/debug/delta.mbt
   | // limitations under the License.
   | 
   | ///|
   | /// Tree-shaped diff between two `Repr` values.
   | priv enum ReprDelta {
18 |   Same(Repr, Array[ReprDelta])
   |   ^^^^
   |   Different(Repr, Repr)
   |   Extra1(Repr)
   |   Extra2(Repr)
   | }
   | 
   | ///|
   | /// Default max relative error for `DoubleLit` comparisons.
   | const DEFAULT_MAX_RELATIVE_ERROR : Double = 0.000000000001
   | 
   | ///|
   | /// Absolute value for `Double`.
   | fn double_abs(x : Double) -> Double {
   |   if x < 0.0 {
   |     -x
```

```mooncram
$ run_moon_ide moon ide peek-def 'decode_utf8_js' --loc 'encoding/utf8/decode_js.mbt:16:16'
Error: could not find definition for symbol 'decode_utf8_js' at encoding/utf8/decode_js.mbt:16:16
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'bytes' --loc 'encoding/utf8/decode_js.mbt:17:3'
Error: could not find definition for symbol 'bytes' at encoding/utf8/decode_js.mbt:17:3
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'ThreadSet' --loc 'internal/regex_engine/automata/thread_set.mbt:46:11'
Definition found at file <WORKDIR>/internal/regex_engine/automata/thread_set.mbt
   | /// # Usage in Automaton
   | ///
   | /// During execution, each `State` contains a `ThreadSet` collection representing all
   | /// possible execution paths from that state. When computing the derivative with
   | /// respect to input, threads are transformed and may split into multiple threads.
46 | priv enum ThreadSet {
   |           ^^^^^^^^^
   |   Empty
   |   Node(
   |     i~ : ThreadSetNodeInfo,
   |     l~ : ThreadSet,
   |     t~ : Thread,
   |     r~ : ThreadSet,
   |     p~ : Int
   |   )
   | }
   | 
   | ///|
   | #valtype
   | priv struct ThreadSetNodeInfo {
   |   // No match inside this subtree
```

```mooncram
$ run_moon_ide moon ide peek-def 'Empty' --loc 'internal/regex_engine/automata/thread_set.mbt:47:3'
Definition found at file <WORKDIR>/internal/regex_engine/automata/thread_set.mbt
   | ///
   | /// During execution, each `State` contains a `ThreadSet` collection representing all
   | /// possible execution paths from that state. When computing the derivative with
   | /// respect to input, threads are transformed and may split into multiple threads.
   | priv enum ThreadSet {
47 |   Empty
   |   ^^^^^
   |   Node(
   |     i~ : ThreadSetNodeInfo,
   |     l~ : ThreadSet,
   |     t~ : Thread,
   |     r~ : ThreadSet,
   |     p~ : Int
   |   )
   | }
   | 
   | ///|
   | #valtype
   | priv struct ThreadSetNodeInfo {
   |   // No match inside this subtree
   |   no_match : Bool
```

```mooncram
$ run_moon_ide moon ide peek-def 'LazyState' --loc 'lazy/lazy.mbt:24:11'
Definition found at file <WORKDIR>/lazy/lazy.mbt
   | /// - `Forcing`: the thunk is currently running. Used to detect reentrant
   | ///   `force` calls on the same cell, which would otherwise re-evaluate
   | ///   the thunk and silently break the at-most-once guarantee.
   | /// - `Forced(v)`: the thunk has produced `v`; the thunk reference is
   | ///   dropped so its captures can be reclaimed.
24 | priv enum LazyState[A] {
   |           ^^^^^^^^^
   |   Unforced(() -> A)
   |   Forcing
   |   Forced(A)
   | }
   | 
   | ///|
   | /// A memoized thunk: the first call to `force` runs the thunk and caches
   | /// the result; later calls return the cached value without re-running it.
   | ///
   | /// Construct one with `Lazy(thunk)` (deferred) or `ready(value)` (already
   | /// evaluated). For fallible work, wrap the result in a `Result` value
   | /// inside the thunk — failure as data is the recommended shape; see the
   | /// rationale below.
   | ///
```

```mooncram
$ run_moon_ide moon ide peek-def 'Unforced' --loc 'lazy/lazy.mbt:25:3'
Definition found at file <WORKDIR>/lazy/lazy.mbt
   | ///   `force` calls on the same cell, which would otherwise re-evaluate
   | ///   the thunk and silently break the at-most-once guarantee.
   | /// - `Forced(v)`: the thunk has produced `v`; the thunk reference is
   | ///   dropped so its captures can be reclaimed.
   | priv enum LazyState[A] {
25 |   Unforced(() -> A)
   |   ^^^^^^^^
   |   Forcing
   |   Forced(A)
   | }
   | 
   | ///|
   | /// A memoized thunk: the first call to `force` runs the thunk and caches
   | /// the result; later calls return the cached value without re-running it.
   | ///
   | /// Construct one with `Lazy(thunk)` (deferred) or `ready(value)` (already
   | /// evaluated). For fallible work, wrap the result in a `Result` value
   | /// inside the thunk — failure as data is the recommended shape; see the
   | /// rationale below.
   | ///
   | /// ## Why force is non-raising / non-async
```

```mooncram
$ run_moon_ide moon ide peek-def 'Regex' --loc 'string/internal/regex_engine/regex.mbt:16:8'
Definition found at file <WORKDIR>/string/internal/regex_engine/regex.mbt
   | // WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
16 | struct Regex {
   |        ^^^^^
   |   profile : Profile
   |   ctx : @automata.Context
   |   expr : @automata.Expr
   |   groups : ReadOnlyArray[String?]
   |   symbol_table : @symbol_map.Table
   |   symbol_repr : ReadOnlyArray[Rechar]
   |   start_states : Array[(Category, StateId)]
   |   state_table : @hashmap.HashMap[@automata.State, StateId]
   |   mut transition_table : FixedArray[StateId]
   |   mut final_table : FixedArray[
   |     @list.List[(Category, @automata.Slot, @automata.Status)],
   |   ]
   |   mut states : FixedArray[@automata.State]
   |   mut num_states : Int
```

```mooncram
$ run_moon_ide moon ide peek-def 'profile' --loc 'string/internal/regex_engine/regex.mbt:17:3'
Definition found at file <WORKDIR>/string/internal/regex_engine/regex.mbt
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
   | struct Regex {
17 |   profile : Profile
   |   ^^^^^^^
   |   ctx : @automata.Context
   |   expr : @automata.Expr
   |   groups : ReadOnlyArray[String?]
   |   symbol_table : @symbol_map.Table
   |   symbol_repr : ReadOnlyArray[Rechar]
   |   start_states : Array[(Category, StateId)]
   |   state_table : @hashmap.HashMap[@automata.State, StateId]
   |   mut transition_table : FixedArray[StateId]
   |   mut final_table : FixedArray[
   |     @list.List[(Category, @automata.Slot, @automata.Status)],
   |   ]
   |   mut states : FixedArray[@automata.State]
   |   mut num_states : Int
   | }
```

```mooncram
$ run_moon_ide moon ide peek-def 'regex' --loc 'string/regex_test.mbt:17:7'
Definition found at file <WORKDIR>/string/regex_test.mbt
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
   | test "execute/non_capture_group" {
17 |   let regex = re"(?:ab)(c)(?:d)"
   |       ^^^^^
   |   guard regex.execute("abcd") is Some(m) else { fail("Expected match") }
   |   debug_inspect(
   |     m,
   |     content=(
   |       #|{
   |       #|  input: <StringView: "abcd">,
   |       #|  group_names: <ReadOnlyArray: [None, None]>,
   |       #|  result: MatchResult([0, 4, 2, 3]),
   |       #|}
   |     ),
   |   )
   | }
   | 
   | ///|
```

```mooncram
$ run_moon_ide moon ide peek-def 'execute' --loc 'string/regex_test.mbt:18:15'
Definition found at file <WORKDIR>/string/regex.mbt
    | ///   let anchored = re"^ab$"
    | ///   inspect(anchored.execute("ab", last_index=0) is Some(_), content="true")
    | ///   inspect(anchored.execute("xaby", last_index=1) is Some(_), content="false")
    | /// }
    | /// ```
348 | pub fn Regex::execute(
    |               ^^^^^^^
    |   self : Regex,
    |   input : StringView,
    |   last_index? : Int = 0,
    | ) -> MatchResult? {
    |   match self.re().execute(input, last_index) {
    |     None => None
    |     Some(result) =>
    |       Some({ input, group_names: self.re().group_names(), result })
    |   }
    | }
    | 
    | ///|
    | /// Wraps this regex in a named capture group.
    | ///
```

```mooncram
$ run_moon_ide moon ide peek-def 'Test' --loc 'test/types.mbt:16:8'
Definition found at file <WORKDIR>/test/types.mbt
   | // WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
16 | struct Test {
   |        ^^^^
   |   name : String
   |   buffer : StringBuilder
   | } derive(@debug.Debug)
   | 
   | ///|
   | /// Create a new instance.
   | #alias(new, deprecated="Use `Test()` instead")
   | #as_free_fn
   | #as_free_fn(new, deprecated="Use `Test()` instead")
   | pub fn Test::Test(name : String) -> Test {
   |   { name, buffer: StringBuilder() }
   | }
```

```mooncram
$ run_moon_ide moon ide peek-def 'name' --loc 'test/types.mbt:17:3'
Definition found at file <WORKDIR>/test/types.mbt
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
   | struct Test {
17 |   name : String
   |   ^^^^
   |   buffer : StringBuilder
   | } derive(@debug.Debug)
   | 
   | ///|
   | /// Create a new instance.
   | #alias(new, deprecated="Use `Test()` instead")
   | #as_free_fn
   | #as_free_fn(new, deprecated="Use `Test()` instead")
   | pub fn Test::Test(name : String) -> Test {
   |   { name, buffer: StringBuilder() }
   | }
```
