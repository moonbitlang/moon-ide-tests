# core outline

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' outline 'async/fs/named_pipe_test.mbt'
 16 |#cfg(not(platform="windows"))
 17 |#borrow(path)
 18 |extern "C" fn mkfifo(path : @os_string.OsString, mode : Int32) -> Int32 = "mkfifo"
    |...
 21 |#cfg(not(platform="windows"))
    |...
 35 |#cfg(platform="windows")
    |...
 56 |#cfg(not(platform="windows"))
    |...
 85 |#cfg(platform="windows")
    |...
120 |#cfg(platform="windows")
    |...
"" (escaped)
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' outline 'async/http/case_insensitive_string.mbt'
18 |#derive(@json.ToJson)
19 |pub(all) struct CaseInsensitiveString(String)
   |...
22 |pub impl Eq for CaseInsensitiveString with fn equal(x, y) {
   |...
27 |pub impl Compare for CaseInsensitiveString with fn compare(x, y) {
   |...
32 |pub impl @debug.Debug for CaseInsensitiveString with fn to_repr(self) {
   |...
37 |pub impl Show for CaseInsensitiveString with fn to_string(self) {
   |...
42 |pub extend CaseInsensitiveString with Show::{to_string}
   |...
45 |pub impl Hash for CaseInsensitiveString with fn hash_combine(self, hasher) {
   |...
"" (escaped)
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' outline 'async/internal/event_loop/windows_console.mbt'
16 |const WINDOWS_CONSOLE_BUFFER_SIZE : Int32 = 4096
   |...
23 |priv struct WindowsConsoleBuffer {
   |...
39 |let dummy_console_buffer : WindowsConsoleBuffer = {
   |...
47 |fn WindowsConsoleBuffer::WindowsConsoleBuffer(
48 |  kind : @fd_util.FileKind,
49 |) -> WindowsConsoleBuffer {
   |...
63 |fn WindowsConsoleBuffer::write_pending(
64 |  self : WindowsConsoleBuffer,
65 |  buf : FixedArray[Byte],
66 |  offset~ : Int32,
67 |  len~ : Int32,
68 |) -> Int32 {
   |...
81 |fn encode_utf8_char(
82 |  char : Int32,
83 |  buf : FixedArray[Byte],
84 |  offset~ : Int32,
85 |) -> Unit {
   |...
"" (escaped)
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' outline 'async/internal/fd_util/stat.mbt'
17 |#derive(Eq, @debug.Debug)
18 |pub(all) enum FileKind {
   |...
31 |let known_kinds : ReadOnlyArray[FileKind] = [
   |...
45 |pub fn FileKind::from_int(value : Int32) -> FileKind {
   |...
57 |pub fn FileKind::can_poll(self : FileKind) -> Bool {
   |...
"" (escaped)
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' outline 'async/os_error/extends.mbt'
16 |pub extend Kind with Eq::{equal}
   |...
"" (escaped)
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' outline 'async/tls/tls.wasm.mbt'
 17 |priv struct TlsConnectionHandle(UInt64)
    |...
 20 |priv enum TlsTrustMode {
    |...
 27 |priv enum TlsState {
    |...
 40 |const TLS_ERROR = -1
    |...
 43 |const TLS_CLOSED = -2
    |...
 46 |const TLS_WOULD_BLOCK = -3
    |...
 49 |const TLS_RENEGOTIATION = -4
    |...
 52 |fn TrustedRoot::mode(self : TrustedRoot) -> TlsTrustMode {
    |...
 61 |#unsafe_skip_stub_check
 62 |#borrow(buf)
 63 |fn tls_buffer_length(buf : @c_buffer.Buffer) -> Int32 = "moonbitlang/async" "c_buffer/length"
    |...
 68 |#unsafe_skip_stub_check
 69 |fn TlsConnectionHandle::new() -> TlsConnectionHandle = "moonbitlang/async" "tls/connection/new"
    |...
 72 |#unsafe_skip_stub_check
 73 |#borrow(host)
 74 |fn TlsConnectionHandle::set_client(
 75 |  self : TlsConnectionHandle,
 76 |  host : @os_string.OsString,
 77 |  host_len~ : Int32 = host.to_string().length(),
 78 |  sni~ : Bool,
 79 |  trust : TlsTrustMode,
 80 |) -> Int32 = "moonbitlang/async" "tls/connection/set_client"
    |...
 83 |#unsafe_skip_stub_check
 84 |#borrow(root)
 85 |fn TlsConnectionHandle::add_root_certificate(
 86 |  self : TlsConnectionHandle,
 87 |  root : Bytes,
 88 |  root_len~ : Int32 = root.length(),
 89 |) -> Int32 = "moonbitlang/async" "tls/connection/add_root_certificate"
    |...
 92 |#unsafe_skip_stub_check
 93 |fn TlsConnectionHandle::free(self : TlsConnectionHandle) -> Unit = "moonbitlang/async" "tls/connection/free"
    |...
 96 |#unsafe_skip_stub_check
 97 |fn TlsConnectionHandle::take_error(
 98 |  self : TlsConnectionHandle,
 99 |) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/take_error"
    |...
102 |fn TlsConnectionHandle::take_error_message(
103 |  self : TlsConnectionHandle,
104 |) -> String {
    |...
111 |#unsafe_skip_stub_check
112 |#borrow(in_buffer, out_buffer, plain_buffer)
113 |fn TlsConnectionHandle::read_plain(
114 |  self : TlsConnectionHandle,
115 |  in_buffer~ : FixedArray[Byte],
116 |  in_buffer_offset~ : Int32,
117 |  in_buffer_len~ : Int32,
118 |  out_buffer~ : FixedArray[Byte],
119 |  out_buffer_offset~ : Int32,
120 |  out_buffer_len~ : Int32,
121 |  plain_buffer~ : FixedArray[Byte],
122 |  plain_buffer_offset~ : Int32,
123 |  plain_buffer_len~ : Int32,
124 |) -> Int32 = "moonbitlang/async" "tls/connection/read_plain"
    |...
127 |#unsafe_skip_stub_check
128 |#borrow(in_buffer, out_buffer, plain_buffer)
129 |fn TlsConnectionHandle::write_plain(
130 |  self : TlsConnectionHandle,
131 |  in_buffer~ : FixedArray[Byte],
132 |  in_buffer_offset~ : Int32,
133 |  in_buffer_len~ : Int32,
134 |  out_buffer~ : FixedArray[Byte],
135 |  out_buffer_offset~ : Int32,
136 |  out_buffer_len~ : Int32,
137 |  plain_buffer~ : Bytes,
138 |  plain_buffer_offset~ : Int32,
139 |  plain_buffer_len~ : Int32,
140 |) -> Int32 = "moonbitlang/async" "tls/connection/write_plain"
    |...
143 |#unsafe_skip_stub_check
144 |#borrow(in_buffer, out_buffer)
145 |fn TlsConnectionHandle::connect(
146 |  self : TlsConnectionHandle,
147 |  in_buffer~ : FixedArray[Byte],
148 |  in_buffer_offset~ : Int32,
149 |  in_buffer_len~ : Int32,
150 |  out_buffer~ : FixedArray[Byte],
151 |  out_buffer_offset~ : Int32,
152 |  out_buffer_len~ : Int32,
153 |) -> TlsState = "moonbitlang/async" "tls/connection/connect"
    |...
156 |#unsafe_skip_stub_check
157 |#borrow(in_buffer, out_buffer)
158 |fn TlsConnectionHandle::accept(
159 |  self : TlsConnectionHandle,
160 |  in_buffer~ : FixedArray[Byte],
161 |  in_buffer_offset~ : Int32,
162 |  in_buffer_len~ : Int32,
163 |  out_buffer~ : FixedArray[Byte],
164 |  out_buffer_offset~ : Int32,
165 |  out_buffer_len~ : Int32,
166 |) -> TlsState = "moonbitlang/async" "tls/connection/accept"
    |...
169 |#unsafe_skip_stub_check
170 |fn TlsConnectionHandle::bytes_read(self : TlsConnectionHandle) -> Int32 = "moonbitlang/async" "tls/connection/bytes_read"
    |...
173 |#unsafe_skip_stub_check
174 |fn TlsConnectionHandle::bytes_to_write(self : TlsConnectionHandle) -> Int32 = "moonbitlang/async" "tls/connection/bytes_to_write"
    |...
177 |#unsafe_skip_stub_check
178 |fn TlsConnectionHandle::wants_read(self : TlsConnectionHandle) -> Bool = "moonbitlang/async" "tls/connection/wants_read"
    |...
181 |#unsafe_skip_stub_check
182 |fn TlsConnectionHandle::wants_write(self : TlsConnectionHandle) -> Bool = "moonbitlang/async" "tls/connection/wants_write"
    |...
185 |#unsafe_skip_stub_check
186 |fn TlsConnectionHandle::shutdown(self : TlsConnectionHandle) -> Int32 = "moonbitlang/async" "tls/connection/shutdown"
    |...
189 |#unsafe_skip_stub_check
190 |fn TlsConnectionHandle::peer_certificate(
191 |  self : TlsConnectionHandle,
192 |) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/peer_certificate"
    |...
195 |#unsafe_skip_stub_check
196 |fn TlsConnectionHandle::unique_channel_binding(
197 |  self : TlsConnectionHandle,
198 |) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/unique_channel_binding"
    |...
201 |#unsafe_skip_stub_check
202 |fn TlsConnectionHandle::server_endpoint_channel_binding(
203 |  self : TlsConnectionHandle,
204 |) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/server_endpoint_channel_binding"
    |...
207 |struct Tls {
    |...
220 |fn[R : @io.BinaryReader, W : @io.BinaryWriter] Tls::from_pair(
221 |  conn : TlsConnectionHandle,
222 |  r : R,
223 |  w : W,
224 |  is_client~ : Bool,
225 |  host~ : String?,
226 |  require_shutdown~ : Bool,
227 |) -> Tls {
    |...
242 |async fn Tls::connect(self : Tls) -> Unit {
    |...
275 |async fn Tls::accept(self : Tls) -> Unit {
    |...
310 |pub async fn[R : @io.BinaryReader, W : @io.BinaryWriter] Tls::client_from_pair(
311 |  r : R,
312 |  w : W,
313 |  host? : String,
314 |  sni~ : Bool = true,
315 |  require_shutdown~ : Bool = true,
316 |  trust~ : TrustedRoot = SystemRoot,
317 |) -> Tls {
    |...
350 |impl @io.BinaryReaderImpl for Tls with fn raw_read_impl(
351 |  self,
352 |  buf,
353 |  offset~,
354 |  max_len~,
355 |) {
    |...
419 |impl @io.BinaryReaderImpl for Tls with fn name(_self) {
    |...
424 |impl @io.BinaryReaderImpl for Tls with fn get_controller(self) {
    |...
429 |impl @io.BinaryWriterImpl for Tls with fn raw_write_impl(
430 |  self,
431 |  buf,
432 |  offset~,
433 |  len~,
434 |) {
    |...
488 |impl @io.BinaryWriterImpl for Tls with fn name(_self) {
    |...
493 |impl @io.BinaryWriterImpl for Tls with fn get_controller(self) {
    |...
498 |impl @io.BinaryWriterImpl for Tls with fn flush_partial_data(self) {
    |...
508 |pub fn Tls::close(self : Tls) -> Unit {
    |...
526 |pub async fn Tls::shutdown(self : Tls) -> Unit {
    |...
556 |pub fn Tls::get_peer_certificate(self : Tls) -> Bytes? raise {
    |...
571 |pub fn Tls::unique_channel_binding(self : Tls) -> Bytes raise {
    |...
591 |pub fn Tls::server_endpoint_channel_binding(self : Tls) -> Bytes raise {
    |...
607 |let _unused : Unit = {
    |...
"" (escaped)
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' outline 'compress/flate/inflate_fast_wbtest.mbt'
 22 |fn fast_stream_run(
 23 |  input : Bytes,
 24 |  chunk : Int32,
 25 |  room : Int32,
 26 |  fixed : Bool,
 27 |) -> Result[(Bytes, Int32), InflateErrorKind] {
    |...
 54 |#cfg(target="native")
 55 |fn fast_stream_sources() -> Array[Bytes] {
    |...
 93 |#cfg(target="native")
 94 |fn assert_calls_agree(
 95 |  input : Bytes,
 96 |  chunk : Int32,
 97 |  room : Int32,
 98 |  fixed : Bool,
 99 |) -> Result[(Bytes, Int32), InflateErrorKind] raise {
    |...
173 |#cfg(target="native")
    |...
224 |fn fast_stream_malformed(literals : Int32, unit : (BitWriter) -> Unit) -> Bytes {
    |...
245 |test "malformed units are corrupt for every output room" {
    |...
299 |#cfg(target="native")
    |...
"" (escaped)
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' outline 'encoding/utf8/decode_js.mbt'
 16 |extern "js" fn decode_utf8_js(
 17 |  bytes : Bytes,
 18 |  start : Int32,
 19 |  len : Int32,
 20 |  preserve_bom : Bool,
 21 |) -> FixedArray[String] =
    |...
 37 |extern "js" fn decode_utf8_lossy_js(
 38 |  bytes : Bytes,
 39 |  start : Int32,
 40 |  len : Int32,
 41 |  preserve_bom : Bool,
 42 |) -> String =
    |...
 54 |fn utf8_find_malformed(
 55 |  src : Bytes,
 56 |  src_offset : Int32,
 57 |  src_length : Int32,
 58 |) -> Int32 {
    |...
 90 |fn strict_malformed_suffix(bytes : BytesView) -> BytesView {
    |...
100 |pub fn decode(
101 |  bytes : BytesView,
102 |  ignore_bom~ : Bool = false,
103 |) -> String raise Malformed {
    |...
123 |pub fn decode_lossy(bytes : BytesView, ignore_bom~ : Bool = false) -> String {
    |...
"" (escaped)
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' outline 'lazy/lazy.mbt'
 24 |priv enum LazyState[A] {
    |...
 68 |struct Lazy[A] {
    |...
 88 |#owned(thunk)
 89 |pub fn[A] Lazy::Lazy(thunk : () -> A) -> Lazy[A] {
    |...
103 |#owned(value)
104 |pub fn[A] Lazy::ready(value : A) -> Lazy[A] {
    |...
126 |pub fn[A] Lazy::peek(self : Lazy[A]) -> A? {
    |...
141 |pub fn[A] Lazy::force(self : Lazy[A]) -> A {
    |...
"" (escaped)
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' outline 'test/types.mbt'
16 |#derive(@debug.Debug)
17 |struct Test {
   |...
24 |#alias(new, deprecated="Use `Test()` instead")
25 |#as_free_fn
26 |#as_free_fn(new, deprecated="Use `Test()` instead")
27 |pub fn Test::Test(name : String) -> Test {
   |...
"" (escaped)
```
