# core peek-def

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide peek-def 'mkfifo' --loc 'async/fs/named_pipe_test.mbt:18:15'
Error: could not get package of loc async/fs/named_pipe_test.mbt:18:15
[1]
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide peek-def 'path' --loc 'async/fs/named_pipe_test.mbt:18:22'
Error: could not get package of loc async/fs/named_pipe_test.mbt:18:22
[1]
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide peek-def 'CaseInsensitiveString' --loc 'async/http/case_insensitive_string.mbt:19:17'
Definition found at file <WORKDIR>/async/http/case_insensitive_string.mbt
   | 
   | ///|
   | /// String type with case insensitive comparison (in the ASCII sense).
   | /// This type is implicitly convertible from `String` & string literal.
   | #derive(@json.ToJson)
19 | pub(all) struct CaseInsensitiveString(String)
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
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide peek-def 'CaseInsensitiveString' --loc 'async/http/case_insensitive_string.mbt:22:17'
Definition found at file <WORKDIR>/async/http/case_insensitive_string.mbt
   | 
   | ///|
   | /// String type with case insensitive comparison (in the ASCII sense).
   | /// This type is implicitly convertible from `String` & string literal.
   | #derive(@json.ToJson)
19 | pub(all) struct CaseInsensitiveString(String)
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
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide peek-def 'WINDOWS_CONSOLE_BUFFER_SIZE' --loc 'async/internal/event_loop/windows_console.mbt:16:7'
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
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide peek-def 'WindowsConsoleBuffer' --loc 'async/internal/event_loop/windows_console.mbt:23:13'
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
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide peek-def 'FileKind' --loc 'async/internal/fd_util/stat.mbt:18:15'
Definition found at file <WORKDIR>/async/internal/fd_util/stat.mbt
   | // limitations under the License.
   | 
   | ///|
   | /// Kind of a file descriptor/Windows HANDLE.
   | #derive(Eq, @debug.Debug)
18 | pub(all) enum FileKind {
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
   | }
   | 
   | ///|
   | let known_kinds : ReadOnlyArray[FileKind] = [
   |   Regular,
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide peek-def 'Unknown' --loc 'async/internal/fd_util/stat.mbt:19:3'
Definition found at file <WORKDIR>/async/internal/fd_util/stat.mbt
   | 
   | ///|
   | /// Kind of a file descriptor/Windows HANDLE.
   | #derive(Eq, @debug.Debug)
   | pub(all) enum FileKind {
19 |   Unknown = 0
   |   ^^^^^^^
   |   Regular = 1
   |   Directory = 2
   |   SymLink = 3
   |   Socket = 4
   |   Pipe = 5
   |   BlockDevice = 6
   |   CharDevice = 7
   |   Console = 8
   | }
   | 
   | ///|
   | let known_kinds : ReadOnlyArray[FileKind] = [
   |   Regular,
   |   Directory,
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide peek-def 'Kind' --loc 'async/os_error/extends.mbt:16:12'
Definition found at file <WORKDIR>/async/os_error/error_kind.mbt
   | ///|
   | /// A cross-platform enum describing common error kinds.
   | /// Useful for matching specific special error codes.
   | #derive(@debug.Debug, @json.ToJson, Eq)
   | #non_exhaustive
20 | pub(all) enum Kind {
   |               ^^^^
   |   NotFound
   |   AlreadyExists
   |   AccessDenied
   |   NotDirectory
   |   ConnectionRefused
   |   OperationNotSupported
   |   // TODO: add private constructor support & make `Unknown` private
   |   Unknown
   | }
   | 
   | ///|
   | let errno_table : Map[Int32, Kind] = match @env_util.platform {
   |   Linux =>
   |     Map([
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide peek-def 'equal' --loc 'async/os_error/extends.mbt:16:27'
Definition found at file <WORKDIR>/async/os_error/extends.mbt
   | // WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
16 | pub extend Kind with Eq::{equal}
   |                           ^^^^^
Definition found at file <WORKDIR>/async/os_error/error_kind.mbt
   | // limitations under the License.
   | 
   | ///|
   | /// A cross-platform enum describing common error kinds.
   | /// Useful for matching specific special error codes.
18 | #derive(@debug.Debug, @json.ToJson, Eq)
   |                                     ^^
   | #non_exhaustive
   | pub(all) enum Kind {
   |   NotFound
   |   AlreadyExists
   |   AccessDenied
   |   NotDirectory
   |   ConnectionRefused
   |   OperationNotSupported
   |   // TODO: add private constructor support & make `Unknown` private
   |   Unknown
   | }
   | 
   | ///|
   | let errno_table : Map[Int32, Kind] = match @env_util.platform {
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide peek-def 'TlsConnectionHandle' --loc 'async/tls/tls.wasm.mbt:17:13'
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
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide peek-def 'TlsTrustMode' --loc 'async/tls/tls.wasm.mbt:20:11'
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
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide peek-def 'fast_stream_run' --loc 'compress/flate/inflate_fast_wbtest.mbt:22:4'
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
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide peek-def 'input' --loc 'compress/flate/inflate_fast_wbtest.mbt:23:3'
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
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide peek-def 'decode_utf8_js' --loc 'encoding/utf8/decode_js.mbt:16:16' --target js
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
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide peek-def 'bytes' --loc 'encoding/utf8/decode_js.mbt:17:3' --target js
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
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide peek-def 'LazyState' --loc 'lazy/lazy.mbt:24:11'
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
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide peek-def 'Unforced' --loc 'lazy/lazy.mbt:25:3'
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
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide peek-def 'Test' --loc 'test/types.mbt:17:8'
Definition found at file <WORKDIR>/test/types.mbt
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
   | #derive(@debug.Debug)
17 | struct Test {
   |        ^^^^
   |   name : String
   |   buffer : StringBuilder
   | }
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
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide peek-def 'name' --loc 'test/types.mbt:18:3'
Definition found at file <WORKDIR>/test/types.mbt
   | // limitations under the License.
   | 
   | ///|
   | #derive(@debug.Debug)
   | struct Test {
18 |   name : String
   |   ^^^^
   |   buffer : StringBuilder
   | }
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
