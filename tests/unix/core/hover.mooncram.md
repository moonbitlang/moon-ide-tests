# core hover

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide hover 'arr' --loc 'builtin/exact_view_test.mbt:17:7'
///|
test "exact_view uses the same bounds on all array types" {
  let arr = [1, 2, 3, 4]
      ^^^
      ```moonbit
      Array[Int]
      ```
  let fixed : FixedArray[Int32] = [1, 2, 3, 4]
  let ro : ReadOnlyArray[Int32] = [1, 2, 3, 4]
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide hover 'fixed' --loc 'builtin/exact_view_test.mbt:18:7'
///|
test "exact_view uses the same bounds on all array types" {
  let arr = [1, 2, 3, 4]
  let fixed : FixedArray[Int32] = [1, 2, 3, 4]
      ^^^^^
      ```moonbit
      FixedArray[Int]
      ```
  let ro : ReadOnlyArray[Int32] = [1, 2, 3, 4]
  let view = [0, 1, 2, 3, 4, 5][1:5]
````

Known IDE limitation: hover on the intrinsic declaration parameter reports no information; ordinary function parameters have hover information.

<!-- known-ide-limitation: intrinsic-parameter-hover -->
````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide hover 'self' --loc 'builtin/int64.mbt:26:21'
No hover information found for symbol 'self' at builtin/int64.mbt:26:21
[1]
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide hover 'from_int' --loc 'builtin/int64.mbt:44:15'
///   inspect(Int64::from_int(42), content="42")
/// }
/// ```
pub fn Int64::from_int(i : Int32) -> Int64 {
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
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide hover 'ToStringView' --loc 'builtin/string_like.mbt:19:11'
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
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide hover 'to_string_view' --loc 'builtin/string_like.mbt:20:6'
///
/// Types implementing this trait provide zero-copy access to string-like data.
pub trait ToStringView {
  fn to_string_view(Self) -> StringView
     ^^^^^^^^^^^^^^
     ```moonbit
     (Self) -> StringView
     ```
}
"" (escaped)
````

Known IDE limitation: extern function declaration hover reports no information; declaration navigation and rename work.

<!-- known-ide-limitation: extern-function-hover -->
````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide hover 'decode_utf8_js' --loc 'encoding/utf8/decode_js.mbt:16:16' --target js
No hover information found for symbol 'decode_utf8_js' at encoding/utf8/decode_js.mbt:16:16
[1]
````

Known IDE limitation: extern function parameter hover reports no information; declaration navigation and rename work.

<!-- known-ide-limitation: extern-parameter-hover -->
````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide hover 'bytes' --loc 'encoding/utf8/decode_js.mbt:17:3' --target js
No hover information found for symbol 'bytes' at encoding/utf8/decode_js.mbt:17:3
[1]
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide hover 'LazyState' --loc 'lazy/lazy.mbt:24:11'
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
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide hover 'Unforced' --loc 'lazy/lazy.mbt:25:3'
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
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide hover 'UNKNOWN' --loc 'string/internal/regex_engine/regex.mbt:17:7'
///|
/// Transition table entry: the transition has not been built yet.
const UNKNOWN : Int32 = -1
      ^^^^^^^
      ```moonbit
      Int
      ```
      ---
      
       Transition table entry: the transition has not been built yet.

///|
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide hover 'DEAD' --loc 'string/internal/regex_engine/regex.mbt:23:7'
/// Transition table entry: no thread survives and nothing was accepted.
/// Entries below `DEAD` denote a terminal state or a transition that moves
/// registers, see `terminal` and `moving`.
const DEAD : Int32 = -2
      ^^^^
      ```moonbit
      Int
      ```
      ---
      
       Transition table entry: no thread survives and nothing was accepted.
       Entries below `DEAD` denote a terminal state or a transition that moves
       registers, see `terminal` and `moving`.

///|
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide hover 'regex' --loc 'string/regex_test.mbt:17:7'
///|
test "execute/non_capture_group" {
  let regex = re"(?:ab)(c)(?:d)"
      ^^^^^
      ```moonbit
      @string.Regex
      ```
  guard regex.execute("abcd") is Some(m) else { fail("Expected match") }
  debug_inspect(
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide hover 'execute' --loc 'string/regex_test.mbt:18:15'
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
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide hover 'Test' --loc 'test/extends.mbt:22:12'
///|
#deprecated("Use `Debug::to_repr` instead", skip_current_package=true)
#doc(hidden)
pub extend Test with @debug.Debug::{to_repr}
           ^^^^
           ```moonbit
           struct Test {
             name: String
             buffer: StringBuilder
           } derive(@debug.Debug)
           ```
````

Known IDE limitation: extension declaration hover reports no information; call-site hover and declaration rename work, including without the deprecated/hidden attributes.

<!-- known-ide-limitation: extension-declaration-hover -->
````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide hover 'to_repr' --loc 'test/extends.mbt:22:37'
No hover information found for symbol 'to_repr' at test/extends.mbt:22:37
[1]
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide hover 'Test' --loc 'test/types.mbt:16:8'
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
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide hover 'name' --loc 'test/types.mbt:17:3'
///|
struct Test {
  name : String
  ^^^^
  ```moonbit
  String
  ```
  buffer : StringBuilder
} derive(@debug.Debug)
````
