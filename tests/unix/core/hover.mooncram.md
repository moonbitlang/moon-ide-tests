# core hover

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'mkfifo' --loc 'async/fs/named_pipe_test.mbt:18:15'
Error: could not get package of loc async/fs/named_pipe_test.mbt:18:15
[1]
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'path' --loc 'async/fs/named_pipe_test.mbt:18:22'
Error: could not get package of loc async/fs/named_pipe_test.mbt:18:22
[1]
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'CaseInsensitiveString' --loc 'async/http/case_insensitive_string.mbt:19:17'
/// String type with case insensitive comparison (in the ASCII sense).
/// This type is implicitly convertible from `String` & string literal.
#derive(@json.ToJson)
pub(all) struct CaseInsensitiveString(String)
                ^^^^^^^^^^^^^^^^^^^^^
                ```moonbit
                #derive(@json.ToJson)
                struct CaseInsensitiveString(String)
                ```
                ---
                
                 String type with case insensitive comparison (in the ASCII sense).
                 This type is implicitly convertible from `String` & string literal.

///|
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'CaseInsensitiveString' --loc 'async/http/case_insensitive_string.mbt:22:17'
pub(all) struct CaseInsensitiveString(String)

///|
pub impl Eq for CaseInsensitiveString with fn equal(x, y) {
                ^^^^^^^^^^^^^^^^^^^^^
                ```moonbit
                #derive(@json.ToJson)
                struct CaseInsensitiveString(String)
                ```
                ---
                
                 String type with case insensitive comparison (in the ASCII sense).
                 This type is implicitly convertible from `String` & string literal.
  Compare::compare(x, y) == 0
}
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'WINDOWS_CONSOLE_BUFFER_SIZE' --loc 'async/internal/event_loop/windows_console.mbt:16:7'
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
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'WindowsConsoleBuffer' --loc 'async/internal/event_loop/windows_console.mbt:23:13'
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
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'FileKind' --loc 'async/internal/fd_util/stat.mbt:18:15'
///|
/// Kind of a file descriptor/Windows HANDLE.
#derive(Eq, @debug.Debug)
pub(all) enum FileKind {
              ^^^^^^^^
              ```moonbit
              #derive(Eq, @debug.Debug)
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
              }
              ```
              ---
              
               Kind of a file descriptor/Windows HANDLE.
  Unknown = 0
  Regular = 1
```

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'Unknown' --loc 'async/internal/fd_util/stat.mbt:19:3'
/// Kind of a file descriptor/Windows HANDLE.
#derive(Eq, @debug.Debug)
pub(all) enum FileKind {
  Unknown = 0
  ^^^^^^^
  ```moonbit
  FileKind
  ```
  Regular = 1
  Directory = 2
````

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'Kind' --loc 'async/os_error/extends.mbt:16:12'
// limitations under the License.

///|
pub extend Kind with Eq::{equal}
           ^^^^
           ```moonbit
           #non_exhaustive
           #derive(@debug.Debug, @json.ToJson, Eq)
           enum Kind {
             NotFound
             AlreadyExists
             AccessDenied
             NotDirectory
             ConnectionRefused
             OperationNotSupported
             NotEmpty
             Unknown
           }
           ```
           ---
           
            A cross-platform enum describing common error kinds.
            Useful for matching specific special error codes.
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'equal' --loc 'async/os_error/extends.mbt:16:27'
No hover information found for symbol 'equal' at async/os_error/extends.mbt:16:27
[1]
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'TlsConnectionHandle' --loc 'async/tls/tls.wasm.mbt:17:13'
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
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'TlsTrustMode' --loc 'async/tls/tls.wasm.mbt:20:11'
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

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'fast_stream_run' --loc 'compress/flate/inflate_fast_wbtest.mbt:22:4'
// same verdict on damaged streams.

///|
fn fast_stream_run(
   ^^^^^^^^^^^^^^^
   ```moonbit
   fn fast_stream_run(input : Bytes, chunk : Int, room : Int, fixed : Bool) -> Result[(Bytes, Int), InflateErrorKind]
   ```
  input : Bytes,
  chunk : Int32,
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'input' --loc 'compress/flate/inflate_fast_wbtest.mbt:23:3'
///|
fn fast_stream_run(
  input : Bytes,
  ^^^^^
  ```moonbit
  Bytes
  ```
  chunk : Int32,
  room : Int32,
````

Known IDE limitation: extern function declaration hover reports no information; declaration navigation and rename work.

<!-- known-ide-limitation: extern-function-hover -->
```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'decode_utf8_js' --loc 'encoding/utf8/decode_js.mbt:16:16' --target js
No hover information found for symbol 'decode_utf8_js' at encoding/utf8/decode_js.mbt:16:16
[1]
```

Known IDE limitation: extern function parameter hover reports no information; declaration navigation and rename work.

<!-- known-ide-limitation: extern-parameter-hover -->
```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'bytes' --loc 'encoding/utf8/decode_js.mbt:17:3' --target js
No hover information found for symbol 'bytes' at encoding/utf8/decode_js.mbt:17:3
[1]
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'LazyState' --loc 'lazy/lazy.mbt:24:11'
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

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'Unforced' --loc 'lazy/lazy.mbt:25:3'
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

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'Test' --loc 'test/types.mbt:17:8'
///|
#derive(@debug.Debug)
struct Test {
       ^^^^
       ```moonbit
       #derive(@debug.Debug)
       struct Test {
         name: String
         buffer: StringBuilder
       }
       ```
  name : String
  buffer : StringBuilder
```

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' hover 'name' --loc 'test/types.mbt:18:3'
///|
#derive(@debug.Debug)
struct Test {
  name : String
  ^^^^
  ```moonbit
  String
  ```
  buffer : StringBuilder
}
````
