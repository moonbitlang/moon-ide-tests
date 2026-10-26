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
$ run_moon_ide moon ide hover 'QueueAlreadyClosed' --loc 'async/aqueue/deprecated.mbt:18:12'
///|
#deprecated
#doc(hidden)
pub extend QueueAlreadyClosed with @debug.Debug::{to_repr}
           ^^^^^^^^^^^^^^^^^^
           ```moonbit
           suberror QueueAlreadyClosed derive(@debug.Debug, ToJson)
           ```
           ---
           
            Default error raised when trying to access an already-closed queue

///|
```

```mooncram
$ run_moon_ide moon ide hover 'to_repr' --loc 'async/aqueue/deprecated.mbt:18:51'
No hover information found for symbol 'to_repr' at async/aqueue/deprecated.mbt:18:51
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'mkfifo' --loc 'async/fs/named_pipe_test.mbt:18:15'
Error: could not get package of loc async/fs/named_pipe_test.mbt:18:15
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'path' --loc 'async/fs/named_pipe_test.mbt:18:22'
Error: could not get package of loc async/fs/named_pipe_test.mbt:18:22
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'CaseInsensitiveString' --loc 'async/http/case_insensitive_string.mbt:18:17'
///|
/// String type with case insensitive comparison (in the ASCII sense).
/// This type is implicitly convertible from `String` & string literal.
pub(all) struct CaseInsensitiveString(String) derive(@json.ToJson)
                ^^^^^^^^^^^^^^^^^^^^^
                ```moonbit
                struct CaseInsensitiveString(String) derive(ToJson)
                ```
                ---
                
                 String type with case insensitive comparison (in the ASCII sense).
                 This type is implicitly convertible from `String` & string literal.

///|
```

```mooncram
$ run_moon_ide moon ide hover 'CaseInsensitiveString' --loc 'async/http/case_insensitive_string.mbt:21:17'
pub(all) struct CaseInsensitiveString(String) derive(@json.ToJson)

///|
pub impl Eq for CaseInsensitiveString with fn equal(x, y) {
                ^^^^^^^^^^^^^^^^^^^^^
                ```moonbit
                struct CaseInsensitiveString(String) derive(ToJson)
                ```
                ---
                
                 String type with case insensitive comparison (in the ASCII sense).
                 This type is implicitly convertible from `String` & string literal.
  Compare::compare(x, y) == 0
}
```

```mooncram
$ run_moon_ide moon ide hover 'WINDOWS_CONSOLE_BUFFER_SIZE' --loc 'async/internal/event_loop/windows_console.mbt:16:7'
// limitations under the License.

///|
const WINDOWS_CONSOLE_BUFFER_SIZE : Int32 = 4096
      ^^^^^^^^^^^^^^^^^^^^^^^^^^^
      ```moonbit
      Int
      ```
      ---
      

///|
```

```mooncram
$ run_moon_ide moon ide hover 'WindowsConsoleBuffer' --loc 'async/internal/event_loop/windows_console.mbt:23:13'
/// Binary IO over Windows console is interpreted as UTF-8,
/// so we need to perform encoding/decoding before actually invoking
/// `ReadConsoleW`/`WriteConsoleW`.
priv struct WindowsConsoleBuffer {
            ^^^^^^^^^^^^^^^^^^^^
            ```moonbit
            struct WindowsConsoleBuffer {
              buffer: FixedArray[UInt16]
              mut unpaired_surrogate: UInt16
              pending: FixedArray[Byte]
              mut pending_len: Int
            }
            ```
            ---
            
             Intermediate buffer for automatic decoding in Windows console handling.
             Binary IO over Windows console is interpreted as UTF-8,
             so we need to perform encoding/decoding before actually invoking
             `ReadConsoleW`/`WriteConsoleW`.
  buffer : FixedArray[UInt16]
  /// For console input: unpaired high surrogate from the last read.
```

```mooncram
$ run_moon_ide moon ide hover 'FileKind' --loc 'async/internal/fd_util/stat.mbt:17:15'
///|
/// Kind of a file descriptor/Windows HANDLE.
pub(all) enum FileKind {
              ^^^^^^^^
              ```moonbit
              enum FileKind {
                Unknown
                Regular
                Directory
                SymLink
                Socket
                Pipe
                BlockDevice
                CharDevice
                Console
              } derive(Eq, @debug.Debug)
              ```
              ---
              
               Kind of a file descriptor/Windows HANDLE.
  Unknown = 0
  Regular = 1
```

```mooncram
$ run_moon_ide moon ide hover 'Unknown' --loc 'async/internal/fd_util/stat.mbt:18:3'
///|
/// Kind of a file descriptor/Windows HANDLE.
pub(all) enum FileKind {
  Unknown = 0
  ^^^^^^^
  ```moonbit
  FileKind
  ```
  Regular = 1
  Directory = 2
```

```mooncram
$ run_moon_ide moon ide hover 'TlsConnectionHandle' --loc 'async/tls/tls.wasm.mbt:17:13'
///|
// A single TLS session: handshake state, encrypted/plain buffers, and wants flags.
priv struct TlsConnectionHandle(UInt64)
            ^^^^^^^^^^^^^^^^^^^
            ```moonbit
            struct TlsConnectionHandle(UInt64)
            ```

///|
```

```mooncram
$ run_moon_ide moon ide hover 'TlsTrustMode' --loc 'async/tls/tls.wasm.mbt:20:11'
priv struct TlsConnectionHandle(UInt64)

///|
priv enum TlsTrustMode {
          ^^^^^^^^^^^^
          ```moonbit
          enum TlsTrustMode {
            TrustNoVerification
            TrustSystemRoot
            TrustCustomRoot
          }
          ```
  TrustNoVerification = 0
  TrustSystemRoot = 1
```

```mooncram
$ run_moon_ide moon ide hover 'fast_stream_run' --loc 'compress/flate/inflate_fast_wbtest.mbt:22:4'
// same verdict on damaged streams.

///|
fn fast_stream_run(
   ^^^^^^^^^^^^^^^
   ```moonbit
   fn fast_stream_run(input : Bytes, chunk : Int, room : Int, fixed : Bool) -> Result[(Bytes, Int), InflateErrorKind]
   ```
  input : Bytes,
  chunk : Int32,
```

```mooncram
$ run_moon_ide moon ide hover 'input' --loc 'compress/flate/inflate_fast_wbtest.mbt:23:3'
///|
fn fast_stream_run(
  input : Bytes,
  ^^^^^
  ```moonbit
  Bytes
  ```
  chunk : Int32,
  room : Int32,
```

Known IDE limitation: extern function declaration hover reports no information; declaration navigation and rename work.

<!-- known-ide-limitation: extern-function-hover -->
```mooncram
$ run_moon_ide moon ide hover 'decode_utf8_js' --loc 'encoding/utf8/decode_js.mbt:16:16' --target js
No hover information found for symbol 'decode_utf8_js' at encoding/utf8/decode_js.mbt:16:16
[1]
```

Known IDE limitation: extern function parameter hover reports no information; declaration navigation and rename work.

<!-- known-ide-limitation: extern-parameter-hover -->
```mooncram
$ run_moon_ide moon ide hover 'bytes' --loc 'encoding/utf8/decode_js.mbt:17:3' --target js
No hover information found for symbol 'bytes' at encoding/utf8/decode_js.mbt:17:3
[1]
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
