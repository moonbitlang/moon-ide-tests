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
$ run_moon_ide moon ide peek-def 'QueueAlreadyClosed' --loc 'async/aqueue/deprecated.mbt:18:12'
Definition found at file <WORKDIR>/async/aqueue/aqueue.mbt
    |   data
    | }
    | 
    | ///|
    | /// Default error raised when trying to access an already-closed queue
328 | pub suberror QueueAlreadyClosed derive(@debug.Debug, @json.ToJson)
    |              ^^^^^^^^^^^^^^^^^^
    | 
    | ///|
    | /// Close an async queue. After the queue is closed:
    | ///
    | /// - blocking `put` and `get` operations will fail immediately.
    | /// - subsequent `put` and `try_put` operations also fail immediately
    | /// - if `clear = false` (`false` by default),
    | ///   sbusequent `get` and `try_get` operations can still retrieve
    | ///   buffered elements in the queue before `close`.
    | ///   After the queue becomes empty,
    | ///   subsequent `get` and `try_get` operations also fail immediately
    | /// - if `clear = true`, buffered elements in the queue will be cleared
    | ///
    | /// By default, writing to or reading from a closed queue
```

```mooncram
$ run_moon_ide moon ide peek-def 'to_repr' --loc 'async/aqueue/deprecated.mbt:18:51'
Definition found at file <WORKDIR>/async/aqueue/deprecated.mbt
   | // limitations under the License.
   | 
   | ///|
   | #deprecated
   | #doc(hidden)
18 | pub extend QueueAlreadyClosed with @debug.Debug::{to_repr}
   |                                                   ^^^^^^^
   | 
   | ///|
   | #deprecated
   | #doc(hidden)
   | pub extend QueueAlreadyClosed with @json.ToJson::{to_json}
Definition found at file <WORKDIR>/async/aqueue/aqueue.mbt
    |   data
    | }
    | 
    | ///|
    | /// Default error raised when trying to access an already-closed queue
328 | pub suberror QueueAlreadyClosed derive(@debug.Debug, @json.ToJson)
    |                                        ^^^^^^^^^^^^
    | 
    | ///|
    | /// Close an async queue. After the queue is closed:
    | ///
    | /// - blocking `put` and `get` operations will fail immediately.
    | /// - subsequent `put` and `try_put` operations also fail immediately
    | /// - if `clear = false` (`false` by default),
    | ///   sbusequent `get` and `try_get` operations can still retrieve
    | ///   buffered elements in the queue before `close`.
    | ///   After the queue becomes empty,
    | ///   subsequent `get` and `try_get` operations also fail immediately
    | /// - if `clear = true`, buffered elements in the queue will be cleared
    | ///
    | /// By default, writing to or reading from a closed queue
```

```mooncram
$ run_moon_ide moon ide peek-def 'mkfifo' --loc 'async/fs/named_pipe_test.mbt:18:15'
Error: could not get package of loc async/fs/named_pipe_test.mbt:18:15
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'path' --loc 'async/fs/named_pipe_test.mbt:18:22'
Error: could not get package of loc async/fs/named_pipe_test.mbt:18:22
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'CaseInsensitiveString' --loc 'async/http/case_insensitive_string.mbt:18:17'
Definition found at file <WORKDIR>/async/http/case_insensitive_string.mbt
   | // limitations under the License.
   | 
   | ///|
   | /// String type with case insensitive comparison (in the ASCII sense).
   | /// This type is implicitly convertible from `String` & string literal.
18 | pub(all) struct CaseInsensitiveString(String) derive(@json.ToJson)
   |                 ^^^^^^^^^^^^^^^^^^^^^
   | 
   | ///|
   | pub impl Eq for CaseInsensitiveString with fn equal(x, y) {
   |   Compare::compare(x, y) == 0
   | }
   | 
   | ///|
   | pub impl Compare for CaseInsensitiveString with fn compare(x, y) {
   |   x.0.compare_ignore_ascii_case(y.0)
   | }
   | 
   | ///|
   | pub impl @debug.Debug for CaseInsensitiveString with fn to_repr(self) {
   |   @debug.Debug::to_repr(self.0)
```

```mooncram
$ run_moon_ide moon ide peek-def 'CaseInsensitiveString' --loc 'async/http/case_insensitive_string.mbt:21:17'
Definition found at file <WORKDIR>/async/http/case_insensitive_string.mbt
   | // limitations under the License.
   | 
   | ///|
   | /// String type with case insensitive comparison (in the ASCII sense).
   | /// This type is implicitly convertible from `String` & string literal.
18 | pub(all) struct CaseInsensitiveString(String) derive(@json.ToJson)
   |                 ^^^^^^^^^^^^^^^^^^^^^
   | 
   | ///|
   | pub impl Eq for CaseInsensitiveString with fn equal(x, y) {
   |   Compare::compare(x, y) == 0
   | }
   | 
   | ///|
   | pub impl Compare for CaseInsensitiveString with fn compare(x, y) {
   |   x.0.compare_ignore_ascii_case(y.0)
   | }
   | 
   | ///|
   | pub impl @debug.Debug for CaseInsensitiveString with fn to_repr(self) {
   |   @debug.Debug::to_repr(self.0)
```

```mooncram
$ run_moon_ide moon ide peek-def 'WINDOWS_CONSOLE_BUFFER_SIZE' --loc 'async/internal/event_loop/windows_console.mbt:16:7'
Definition found at file <WORKDIR>/async/internal/event_loop/windows_console.mbt
   | // WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
16 | const WINDOWS_CONSOLE_BUFFER_SIZE : Int32 = 4096
   |       ^^^^^^^^^^^^^^^^^^^^^^^^^^^
   | 
   | ///|
   | /// Intermediate buffer for automatic decoding in Windows console handling.
   | /// Binary IO over Windows console is interpreted as UTF-8,
   | /// so we need to perform encoding/decoding before actually invoking
   | /// `ReadConsoleW`/`WriteConsoleW`.
   | priv struct WindowsConsoleBuffer {
   |   buffer : FixedArray[UInt16]
   |   /// For console input: unpaired high surrogate from the last read.
   |   /// Zero if there is no unpaired surrogate.
   |   mut unpaired_surrogate : UInt16
   |   /// - For console input: bytes from the last read character,
   |   ///   not delivered due to insufficient user buffer.
   |   ///   The whole byte sequence is stored right-aligned in `pending`,
```

```mooncram
$ run_moon_ide moon ide peek-def 'WindowsConsoleBuffer' --loc 'async/internal/event_loop/windows_console.mbt:23:13'
Definition found at file <WORKDIR>/async/internal/event_loop/windows_console.mbt
   | ///|
   | /// Intermediate buffer for automatic decoding in Windows console handling.
   | /// Binary IO over Windows console is interpreted as UTF-8,
   | /// so we need to perform encoding/decoding before actually invoking
   | /// `ReadConsoleW`/`WriteConsoleW`.
23 | priv struct WindowsConsoleBuffer {
   |             ^^^^^^^^^^^^^^^^^^^^
   |   buffer : FixedArray[UInt16]
   |   /// For console input: unpaired high surrogate from the last read.
   |   /// Zero if there is no unpaired surrogate.
   |   mut unpaired_surrogate : UInt16
   |   /// - For console input: bytes from the last read character,
   |   ///   not delivered due to insufficient user buffer.
   |   ///   The whole byte sequence is stored right-aligned in `pending`,
   |   ///   and the number of remaining bytes is determined by `pending_len`
   |   /// - for console output: incomplete UTF-8 sequence from the last write
   |   pending : FixedArray[Byte]
   |   /// number of bytes in `pending`
   |   mut pending_len : Int32
   | }
   | 
```

```mooncram
$ run_moon_ide moon ide peek-def 'FileKind' --loc 'async/internal/fd_util/stat.mbt:17:15'
Definition found at file <WORKDIR>/async/internal/fd_util/stat.mbt
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
   | /// Kind of a file descriptor/Windows HANDLE.
17 | pub(all) enum FileKind {
   |               ^^^^^^^^
   |   Unknown = 0
   |   Regular = 1
   |   Directory = 2
   |   SymLink = 3
   |   Socket = 4
   |   Pipe = 5
   |   BlockDevice = 6
   |   CharDevice = 7
   |   Console = 8
   | } derive(Eq, @debug.Debug)
   | 
   | ///|
   | let known_kinds : ReadOnlyArray[FileKind] = [
   |   Regular,
```

```mooncram
$ run_moon_ide moon ide peek-def 'Unknown' --loc 'async/internal/fd_util/stat.mbt:18:3'
Definition found at file <WORKDIR>/async/internal/fd_util/stat.mbt
   | // limitations under the License.
   | 
   | ///|
   | /// Kind of a file descriptor/Windows HANDLE.
   | pub(all) enum FileKind {
18 |   Unknown = 0
   |   ^^^^^^^
   |   Regular = 1
   |   Directory = 2
   |   SymLink = 3
   |   Socket = 4
   |   Pipe = 5
   |   BlockDevice = 6
   |   CharDevice = 7
   |   Console = 8
   | } derive(Eq, @debug.Debug)
   | 
   | ///|
   | let known_kinds : ReadOnlyArray[FileKind] = [
   |   Regular,
   |   Directory,
```

```mooncram
$ run_moon_ide moon ide peek-def 'TlsConnectionHandle' --loc 'async/tls/tls.wasm.mbt:17:13'
Definition found at file <WORKDIR>/async/tls/tls.wasm.mbt
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
   | // A single TLS session: handshake state, encrypted/plain buffers, and wants flags.
17 | priv struct TlsConnectionHandle(UInt64)
   |             ^^^^^^^^^^^^^^^^^^^
   | 
   | ///|
   | priv enum TlsTrustMode {
   |   TrustNoVerification = 0
   |   TrustSystemRoot = 1
   |   TrustCustomRoot = 2
   | }
   | 
   | ///|
   | priv enum TlsState {
   |   Completed = 0
   |   WantRead = 1
   |   WantWrite = 2
   |   Error = 3
```

```mooncram
$ run_moon_ide moon ide peek-def 'TlsTrustMode' --loc 'async/tls/tls.wasm.mbt:20:11'
Definition found at file <WORKDIR>/async/tls/tls.wasm.mbt
   | ///|
   | // A single TLS session: handshake state, encrypted/plain buffers, and wants flags.
   | priv struct TlsConnectionHandle(UInt64)
   | 
   | ///|
20 | priv enum TlsTrustMode {
   |           ^^^^^^^^^^^^
   |   TrustNoVerification = 0
   |   TrustSystemRoot = 1
   |   TrustCustomRoot = 2
   | }
   | 
   | ///|
   | priv enum TlsState {
   |   Completed = 0
   |   WantRead = 1
   |   WantWrite = 2
   |   Error = 3
   |   Eof = 4
   |   ReNegotiation = 5
   | }
```

```mooncram
$ run_moon_ide moon ide peek-def 'fast_stream_run' --loc 'compress/flate/inflate_fast_wbtest.mbt:22:4'
Definition found at file <WORKDIR>/compress/flate/inflate_fast_wbtest.mbt
   | // With less room every unit takes the careful path. Both must give the same
   | // bytes, the same consumption (bytes behind the stream stay unread) and the
   | // same verdict on damaged streams.
   | 
   | ///|
22 | fn fast_stream_run(
   |    ^^^^^^^^^^^^^^^
   |   input : Bytes,
   |   chunk : Int32,
   |   room : Int32,
   |   fixed : Bool,
   | ) -> Result[(Bytes, Int32), InflateErrorKind] {
   |   let inflater = IncrementalDecoder()
   |   let output = if fixed {
   |     FixedArray::make(room, b'\x00').mut_view()
   |   } else {
   |     Array::make(room, b'\x00').mut_view()
   |   }
   |   let decoded = @buffer.Buffer()
   |   let mut position = 0
   |   for ;; {
```

```mooncram
$ run_moon_ide moon ide peek-def 'input' --loc 'compress/flate/inflate_fast_wbtest.mbt:23:3'
Definition found at file <WORKDIR>/compress/flate/inflate_fast_wbtest.mbt
   | // bytes, the same consumption (bytes behind the stream stay unread) and the
   | // same verdict on damaged streams.
   | 
   | ///|
   | fn fast_stream_run(
23 |   input : Bytes,
   |   ^^^^^
   |   chunk : Int32,
   |   room : Int32,
   |   fixed : Bool,
   | ) -> Result[(Bytes, Int32), InflateErrorKind] {
   |   let inflater = IncrementalDecoder()
   |   let output = if fixed {
   |     FixedArray::make(room, b'\x00').mut_view()
   |   } else {
   |     Array::make(room, b'\x00').mut_view()
   |   }
   |   let decoded = @buffer.Buffer()
   |   let mut position = 0
   |   for ;; {
   |     let end = (position + chunk).min(input.length())
```

```mooncram
$ run_moon_ide moon ide peek-def 'decode_utf8_js' --loc 'encoding/utf8/decode_js.mbt:16:16' --target js
Definition found at file <WORKDIR>/encoding/utf8/decode_js.mbt
   | // WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
16 | extern "js" fn decode_utf8_js(
   |                ^^^^^^^^^^^^^^
   |   bytes : Bytes,
   |   start : Int32,
   |   len : Int32,
   |   preserve_bom : Bool,
   | ) -> FixedArray[String] =
   |   #| ((preserveBOMDecoder, dropBOMDecoder) => function(bytes, start, len, preserveBOM) {
   |   #|   try {
   |   #|     const end = start + len;
   |   #|     const slice = bytes.subarray(start, end);
   |   #|     const decoder = preserveBOM ? preserveBOMDecoder : dropBOMDecoder;
   |   #|     return [decoder.decode(slice)];
   |   #|   } catch (_) {
   |   #|     return [];
   |   #|   }
```

```mooncram
$ run_moon_ide moon ide peek-def 'bytes' --loc 'encoding/utf8/decode_js.mbt:17:3' --target js
Definition found at file <WORKDIR>/encoding/utf8/decode_js.mbt
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
   | extern "js" fn decode_utf8_js(
17 |   bytes : Bytes,
   |   ^^^^^
   |   start : Int32,
   |   len : Int32,
   |   preserve_bom : Bool,
   | ) -> FixedArray[String] =
   |   #| ((preserveBOMDecoder, dropBOMDecoder) => function(bytes, start, len, preserveBOM) {
   |   #|   try {
   |   #|     const end = start + len;
   |   #|     const slice = bytes.subarray(start, end);
   |   #|     const decoder = preserveBOM ? preserveBOMDecoder : dropBOMDecoder;
   |   #|     return [decoder.decode(slice)];
   |   #|   } catch (_) {
   |   #|     return [];
   |   #|   }
   |   #| })(
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
   |   { name, buffer: StringBuilder(), }
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
   |   { name, buffer: StringBuilder(), }
   | }
```
