# core hover

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide hover 'from_int' --loc 'builtin\int64.mbt:31:15'
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
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide hover 'i' --loc 'builtin\int64.mbt:31:24'
///   inspect(Int64::from_int(42), content="42")
/// }
/// ```
pub fn Int64::from_int(i : Int) -> Int64 {
                       ^
                       ```moonbit
                       Int
                       ```
  i.to_int64()
}
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide hover 'ToStringView' --loc 'builtin\string_like.mbt:19:11'
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
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide hover 'to_string_view' --loc 'builtin\string_like.mbt:20:6'
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
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide hover 'ReprDelta' --loc 'debug\delta.mbt:17:11'
///|
/// Tree-shaped diff between two `Repr` values.
priv enum ReprDelta {
          ^^^^^^^^^
          ```moonbit
          enum ReprDelta {
            Same(Repr, Array[ReprDelta])
            Different(Repr, Repr)
            Extra1(Repr)
            Extra2(Repr)
          }
          ```
          ---
          
           Tree-shaped diff between two `Repr` values.
  Same(Repr, Array[ReprDelta])
  Different(Repr, Repr)
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide hover 'Same' --loc 'debug\delta.mbt:18:3'
///|
/// Tree-shaped diff between two `Repr` values.
priv enum ReprDelta {
  Same(Repr, Array[ReprDelta])
  ^^^^
  ```moonbit
  (Repr, Array[ReprDelta]) -> ReprDelta
  ```
  Different(Repr, Repr)
  Extra1(Repr)
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide hover 'decode_utf8_js' --loc 'encoding\utf8\decode_js.mbt:16:16'
No hover information found for symbol 'decode_utf8_js' at encoding\utf8\decode_js.mbt:16:16
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide hover 'bytes' --loc 'encoding\utf8\decode_js.mbt:17:3'
No hover information found for symbol 'bytes' at encoding\utf8\decode_js.mbt:17:3
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide hover 'ThreadSet' --loc 'internal\regex_engine\automata\thread_set.mbt:46:11'
/// During execution, each `State` contains a `ThreadSet` collection representing all
/// possible execution paths from that state. When computing the derivative with
/// respect to input, threads are transformed and may split into multiple threads.
priv enum ThreadSet {
          ^^^^^^^^^
          ```moonbit
          enum ThreadSet {
            Empty
            Node(i~ : ThreadSetNodeInfo, l~ : ThreadSet, t~ : Thread, r~ : ThreadSet, p~ : Int)
          }
          ```
          ---
          
           A collection of execution threads stored in a Treap-based rope structure.
          
           `ThreadSet` maintains an ordered set of `Thread` instances representing all active
           execution paths in the automaton. The order matters because it encodes matching
           priorities - the first thread to reach an `End` state produces the match result.
          
           # Data Structure
          
           Uses a Treap (randomized binary search tree) to efficiently:
           - Maintain thread ordering while allowing efficient insertion/merging
           - Track metadata (`ThreadSetNodeInfo`) to optimize operations
           - Support efficient operations like `flat_map`, `merge`, and iteration
          
           Each node tracks `no_match`: true if no thread in the subtree has reached `End` state.
           This allows quick pruning of subtrees that cannot contribute to matches.
          
           # Key Operations
          
           - `merge`/`+`: Combines two thread sets while preserving order
           - `flat_map`: Applies a function that may expand each thread to multiple threads
           - `find_first_match`: Finds the first successful match (if any)
           - `remove_matches`: Removes all threads in `End` state from the collection
           - `remove_duplicates`: Eliminates redundant threads with same state
           - `split_at_first_match`: Separates threads before/after first match
          
           # Usage in Automaton
          
           During execution, each `State` contains a `ThreadSet` collection representing all
           possible execution paths from that state. When computing the derivative with
           respect to input, threads are transformed and may split into multiple threads.
  Empty
  Node(
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide hover 'Empty' --loc 'internal\regex_engine\automata\thread_set.mbt:47:3'
/// possible execution paths from that state. When computing the derivative with
/// respect to input, threads are transformed and may split into multiple threads.
priv enum ThreadSet {
  Empty
  ^^^^^
  ```moonbit
  ThreadSet
  ```
  Node(
    i~ : ThreadSetNodeInfo,
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide hover 'LazyState' --loc 'lazy\lazy.mbt:24:11'
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
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide hover 'Unforced' --loc 'lazy\lazy.mbt:25:3'
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
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide hover 'Regex' --loc 'string\internal\regex_engine\regex.mbt:16:8'
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
         mut transition_table: FixedArray[StateId]
         mut final_table: FixedArray[@list.List[(@shared_types.Category, @automata.Slot, @automata.Status)]]
         mut states: FixedArray[@automata.State]
         mut num_states: Int
       }
       ```
  profile : Profile
  ctx : @automata.Context
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide hover 'profile' --loc 'string\internal\regex_engine\regex.mbt:17:3'
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
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide hover 'regex' --loc 'string\regex_test.mbt:17:7'
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
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide hover 'execute' --loc 'string\regex_test.mbt:18:15'
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
               offsets that later cause `MatchResult::before`, `MatchResult::content`, or
               `MatchResult::after` to panic when slicing.
              
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
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide hover 'Test' --loc 'test\types.mbt:16:8'
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
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide hover 'name' --loc 'test\types.mbt:17:3'
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
