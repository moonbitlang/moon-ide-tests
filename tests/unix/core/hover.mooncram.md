# core hover

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
$ run_moon_ide moon ide hover 'arr' --loc 'builtin/exact_view_test.mbt:17:7'
///|
test "exact_view uses the same bounds on all array types" {
  let arr = [1, 2, 3, 4]
      ^^^
      ```moonbit
      Array[Int]
      ```
  let fixed : FixedArray[Int] = [1, 2, 3, 4]
  let ro : ReadOnlyArray[Int] = [1, 2, 3, 4]
```

```mooncram
$ run_moon_ide moon ide hover 'fixed' --loc 'builtin/exact_view_test.mbt:18:7'
///|
test "exact_view uses the same bounds on all array types" {
  let arr = [1, 2, 3, 4]
  let fixed : FixedArray[Int] = [1, 2, 3, 4]
      ^^^^^
      ```moonbit
      FixedArray[Int]
      ```
  let ro : ReadOnlyArray[Int] = [1, 2, 3, 4]
  let view = [0, 1, 2, 3, 4, 5][1:5]
```

```mooncram
$ run_moon_ide moon ide hover 'self' --loc 'builtin/int64.mbt:26:21'
No hover information found for symbol 'self' at builtin/int64.mbt:26:21
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'from_int' --loc 'builtin/int64.mbt:44:15'
///   inspect(Int64::from_int(42), content="42")
/// }
/// ```
pub fn Int64::from_int(i : Int) -> Int64 {
              ^^^^^^^^
              ```moonbit
              fn Int64::from_int(i : Int) -> Int64
              ```
              ---
              
               Converts a 32-bit integer (`Int`) to a 64-bit integer (`Int64`).
              
               Parameters:
              
               * `i` : The integer value to be converted.
              
               Returns the converted 64-bit integer (`Int64`) value.
              
               Example:
              
               ```mbt check
               test {
                 inspect(Int64::from_int(42), content="42")
               }
               ```
  i.to_int64()
}
```

```mooncram
$ run_moon_ide moon ide hover 'ToStringView' --loc 'builtin/string_like.mbt:19:11'
/// Trait for values that can be viewed as `StringView`.
///
/// Types implementing this trait provide zero-copy access to string-like data.
pub trait ToStringView {
          ^^^^^^^^^^^^
          ```moonbit
          trait ToStringView {
            fn to_string_view(Self) -> StringView
          }
          ```
          ---
          
           Trait for values that can be viewed as `StringView`.
          
           Types implementing this trait provide zero-copy access to string-like data.
  fn to_string_view(Self) -> StringView
}
```

```mooncram
$ run_moon_ide moon ide hover 'to_string_view' --loc 'builtin/string_like.mbt:20:6'
///
/// Types implementing this trait provide zero-copy access to string-like data.
pub trait ToStringView {
  fn to_string_view(Self) -> StringView
     ^^^^^^^^^^^^^^
     ```moonbit
     (Self) -> StringView
     ```
}

```

```mooncram
$ run_moon_ide moon ide hover 'decode_utf8_js' --loc 'encoding/utf8/decode_js.mbt:16:16'
Error: could not get package of loc encoding/utf8/decode_js.mbt:16:16
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'bytes' --loc 'encoding/utf8/decode_js.mbt:17:3'
Error: could not get package of loc encoding/utf8/decode_js.mbt:17:3
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'ThreadSet' --loc 'internal/regex_engine/automata/thread_set.mbt:30:13'
/// nested `Seq` threads and `remove_duplicates` rebuilds every level), so
/// `assign_slot_in_place` may mutate them. Once a set is stored in a
/// `State` it is never mutated again.
priv struct ThreadSet(Array[Thread])
            ^^^^^^^^^
            ```moonbit
            struct ThreadSet(Array[Thread])
            ```
            ---
            
             The ordered collection of execution threads of a state.
            
             Threads are kept in an array in priority order: the first thread to reach
             `End` wins, so producers append in the order the semantics dictate and
             nothing ever inserts in the middle. Sets are built append-only through an
             accumulator (`rem` in `delta_*`, the same shape as ocaml-re's list
             accumulator), scanned a few times while the new state is finalized, and
             then frozen inside a `State`.
            
             Ownership: every array reachable from a set under construction was
             allocated by the current `delta` call (producers build new arrays for
             nested `Seq` threads and `remove_duplicates` rebuilds every level), so
             `assign_slot_in_place` may mutate them. Once a set is stored in a
             `State` it is never mutated again.

///|
```

```mooncram
$ run_moon_ide moon ide hover 'Thread' --loc 'internal/regex_engine/automata/thread_set.mbt:30:29'
/// nested `Seq` threads and `remove_duplicates` rebuilds every level), so
/// `assign_slot_in_place` may mutate them. Once a set is stored in a
/// `State` it is never mutated again.
priv struct ThreadSet(Array[Thread])
                            ^^^^^^
                            ```moonbit
                            enum Thread {
                              End(MarkSlotMap)
                              Exp(MarkSlotMap, Expr)
                              Seq(@shared_types.Preference, ThreadSet, Expr)
                            } derive(Eq, Hash)
                            ```
                            ---
                            
                             An execution thread in the automaton representing a possible matching path.
                            
                             `Thread` represents a single execution path during pattern matching. The automaton
                             maintains multiple threads simultaneously to handle nondeterministic choices
                             (alternations, quantifiers, etc.). Each thread tracks its current state using
                             a `MarkSlotMap` to record positions encountered so far.
                            
                             # Variants
                            
                             - `End(MarkSlotMap)`: Thread has reached a successful match state with the given marks
                             - `Exp(MarkSlotMap, Expr)`: Thread is executing the given expression with current marks
                             - `Seq(Preference, ThreadSet, Expr)`: Thread is executing a sequence where:
                               - The first part has produced multiple threads (stored in `ThreadSet`)
                               - The next expression hasn't been executed yet
                               - Preference determines how to prioritize results (First/Longest)
                            
                             # Thread Lifecycle
                            
                             1. Thread starts with `Exp(MarkSlotMap::empty(), initial_expr)`
                             2. During derivative computation, threads transform based on input:
                                - May split into multiple threads (alternation)
                                - May transition to `Seq` for sequences
                                - May reach `End` when matching succeeds
                             3. Threads are eliminated if they can't match the current input

///|
```

```mooncram
$ run_moon_ide moon ide hover 'LazyState' --loc 'lazy/lazy.mbt:24:11'
///   the thunk and silently break the at-most-once guarantee.
/// - `Forced(v)`: the thunk has produced `v`; the thunk reference is
///   dropped so its captures can be reclaimed.
priv enum LazyState[A] {
          ^^^^^^^^^
          ```moonbit
          enum LazyState[A] {
            Unforced(() -> A)
            Forcing
            Forced(A)
          }
          ```
          ---
          
           Internal cell state.
          
           - `Unforced(thunk)`: the thunk has not yet run.
           - `Forcing`: the thunk is currently running. Used to detect reentrant
             `force` calls on the same cell, which would otherwise re-evaluate
             the thunk and silently break the at-most-once guarantee.
           - `Forced(v)`: the thunk has produced `v`; the thunk reference is
             dropped so its captures can be reclaimed.
  Unforced(() -> A)
  Forcing
```

```mooncram
$ run_moon_ide moon ide hover 'Unforced' --loc 'lazy/lazy.mbt:25:3'
/// - `Forced(v)`: the thunk has produced `v`; the thunk reference is
///   dropped so its captures can be reclaimed.
priv enum LazyState[A] {
  Unforced(() -> A)
  ^^^^^^^^
  ```moonbit
  (() -> A) -> LazyState[A]
  ```
  Forcing
  Forced(A)
```

```mooncram
$ run_moon_ide moon ide hover 'Regex' --loc 'string/internal/regex_engine/regex.mbt:16:8'
// limitations under the License.

///|
struct Regex {
       ^^^^^
       ```moonbit
       struct Regex {
         profile: @shared_types.Profile
         ctx: @automata.Context
         expr: @automata.Expr
         groups: ReadOnlyArray[String?]
         symbol_table: @symbol_map.Table
         symbol_repr: ReadOnlyArray[Int]
         start_states: Array[(@shared_types.Category, StateId)]
         state_table: @hashmap.HashMap[@automata.State, StateId]
         mut transition_table: FixedArray[Int]
         mut slot_table: FixedArray[Int]
         mut max_slot: Int
         positions: Positions
         mut final_table: FixedArray[@list.List[(@shared_types.Category, @automata.Slot, @automata.Status)]]
         mut states: FixedArray[@automata.State]
         mut num_states: Int
       }
       ```
  profile : Profile
  ctx : @automata.Context
```

```mooncram
$ run_moon_ide moon ide hover 'profile' --loc 'string/internal/regex_engine/regex.mbt:17:3'
///|
struct Regex {
  profile : Profile
  ^^^^^^^
  ```moonbit
  @shared_types.Profile
  ```
  ctx : @automata.Context
  expr : @automata.Expr
```

```mooncram
$ run_moon_ide moon ide hover 'regex' --loc 'string/regex_test.mbt:17:7'
///|
test "execute/non_capture_group" {
  let regex = re"(?:ab)(c)(?:d)"
      ^^^^^
      ```moonbit
      @string.Regex
      ```
  guard regex.execute("abcd") is Some(m) else { fail("Expected match") }
  debug_inspect(
```

```mooncram
$ run_moon_ide moon ide hover 'execute' --loc 'string/regex_test.mbt:18:15'
///|
test "execute/non_capture_group" {
  let regex = re"(?:ab)(c)(?:d)"
  guard regex.execute("abcd") is Some(m) else { fail("Expected match") }
              ^^^^^^^
              ```moonbit
              fn @string.Regex::execute(self : @string.Regex, input : StringView, last_index? : Int) -> @string.MatchResult?
              ```
              ---
              
               Executes this regex on `input` and returns the first match found.
              
               Search starts at `last_index` (default `0`). The returned match, when
               present, starts at or after that index.
              
               `last_index` must satisfy `0 <= last_index <= input.length()`.
              
               For inputs containing supplementary Unicode characters, `last_index` must
               also be a valid UTF-16 character boundary (that is, not the second code
               unit of a surrogate pair).
              
               Passing a `last_index` in the middle of a surrogate pair may produce match
               offsets that split a character. `MatchResult::before`, `MatchResult::content`,
               and `MatchResult::after` trim such boundaries inward when slicing, so their
               views may omit that character.
              
               `last_index` only controls where searching starts. It does **not** change
               anchor semantics:
              
               - `^` still matches only the beginning of `input`
               - `$` still matches only the end of `input`
              
               This parameter is needed by iterative operations such as
               `Regex::find`, `Regex::replace_by`, and `Regex::split`, which repeatedly
               resume searching from the end of the previous match while keeping anchor
               behavior relative to the full `input`.
              
               Returns `None` when there is no match from `last_index` to the end of
               `input`.
              
               Example:
              
               ```mbt check
               test {
                 let regex = re"[[:digit:]]+"
                 let input = "a12b34"
              
                 guard regex.execute(input) is Some(first) else {
                   fail("Expected first match")
                 }
                 inspect(first.content(), content="12")
              
                 let next = first.before().length() + first.content().length()
                 guard regex.execute(input, last_index=next) is Some(second) else {
                   fail("Expected second match")
                 }
                 inspect(second.content(), content="34")
               }
               ```
              
               ```mbt check
               test {
                 let anchored = re"^ab$"
                 inspect(anchored.execute("ab", last_index=0) is Some(_), content="true")
                 inspect(anchored.execute("xaby", last_index=1) is Some(_), content="false")
               }
               ```
  debug_inspect(
    m,
```

```mooncram
$ run_moon_ide moon ide hover 'Test' --loc 'test/types.mbt:16:8'
// limitations under the License.

///|
struct Test {
       ^^^^
       ```moonbit
       struct Test {
         name: String
         buffer: StringBuilder
       } derive(@debug.Debug)
       ```
  name : String
  buffer : StringBuilder
```

```mooncram
$ run_moon_ide moon ide hover 'name' --loc 'test/types.mbt:17:3'
///|
struct Test {
  name : String
  ^^^^
  ```moonbit
  String
  ```
  buffer : StringBuilder
} derive(@debug.Debug)
```
