# core outline

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide outline 'async\aqueue\deprecated.mbt'
16 |#deprecated
17 |#doc(hidden)
18 |pub extend QueueAlreadyClosed with @debug.Debug::{to_repr}
   |...
21 |#deprecated
22 |#doc(hidden)
23 |pub extend QueueAlreadyClosed with @json.ToJson::{to_json}
   |...

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide outline 'async\fs\named_pipe_test.mbt'
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

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide outline 'async\http\case_insensitive_string.mbt'
18 |pub(all) struct CaseInsensitiveString(String) derive(@json.ToJson)
   |...
21 |pub impl Eq for CaseInsensitiveString with fn equal(x, y) {
   |...
26 |pub impl Compare for CaseInsensitiveString with fn compare(x, y) {
   |...
31 |pub impl @debug.Debug for CaseInsensitiveString with fn to_repr(self) {
   |...
36 |pub impl Show for CaseInsensitiveString with fn to_string(self) {
   |...
41 |pub extend CaseInsensitiveString with Show::{to_string}
   |...
44 |pub impl Hash for CaseInsensitiveString with fn hash_combine(self, hasher) {
   |...

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide outline 'async\internal\event_loop\windows_console.mbt'
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

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide outline 'async\internal\fd_util\stat.mbt'
17 |pub(all) enum FileKind {
   |...
30 |let known_kinds : ReadOnlyArray[FileKind] = [
   |...
44 |pub fn FileKind::from_int(value : Int32) -> FileKind {
   |...
56 |pub fn FileKind::can_poll(self : FileKind) -> Bool {
   |...

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide outline 'async\tls\tls.wasm.mbt'
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
 76 |  host : String,
 77 |  host_len~ : Int32 = host.length(),
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
 93 |#borrow(private_key_file, certificate_file)
 94 |fn TlsConnectionHandle::set_server_files(
 95 |  self : TlsConnectionHandle,
 96 |  private_key_file : @os_string.OsString,
 97 |  private_key_file_len~ : Int32 = private_key_file.to_string().length(),
 98 |  private_key_type : X509FileType,
 99 |  certificate_file : @os_string.OsString,
100 |  certificate_file_len~ : Int32 = certificate_file.to_string().length(),
101 |  certificate_type : X509FileType,
102 |) -> Int32 = "moonbitlang/async" "tls/connection/set_server_files"
    |...
105 |#unsafe_skip_stub_check
106 |#borrow(pfx_content)
107 |fn TlsConnectionHandle::set_server_pfx(
108 |  self : TlsConnectionHandle,
109 |  pfx_content : Bytes,
110 |  pfx_content_len~ : Int32 = pfx_content.length(),
111 |) -> Int32 = "moonbitlang/async" "tls/connection/set_server_pfx"
    |...
114 |#unsafe_skip_stub_check
115 |fn TlsConnectionHandle::free(self : TlsConnectionHandle) -> Unit = "moonbitlang/async" "tls/connection/free"
    |...
118 |#unsafe_skip_stub_check
119 |fn TlsConnectionHandle::take_error(
120 |  self : TlsConnectionHandle,
121 |) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/take_error"
    |...
124 |fn TlsConnectionHandle::take_error_message(
125 |  self : TlsConnectionHandle,
126 |) -> String {
    |...
133 |#unsafe_skip_stub_check
134 |#borrow(in_buffer, out_buffer, plain_buffer)
135 |fn TlsConnectionHandle::read_plain(
136 |  self : TlsConnectionHandle,
137 |  in_buffer~ : FixedArray[Byte],
138 |  in_buffer_offset~ : Int32,
139 |  in_buffer_len~ : Int32,
140 |  out_buffer~ : FixedArray[Byte],
141 |  out_buffer_offset~ : Int32,
142 |  out_buffer_len~ : Int32,
143 |  plain_buffer~ : FixedArray[Byte],
144 |  plain_buffer_offset~ : Int32,
145 |  plain_buffer_len~ : Int32,
146 |) -> Int32 = "moonbitlang/async" "tls/connection/read_plain"
    |...
149 |#unsafe_skip_stub_check
150 |#borrow(in_buffer, out_buffer, plain_buffer)
151 |fn TlsConnectionHandle::write_plain(
152 |  self : TlsConnectionHandle,
153 |  in_buffer~ : FixedArray[Byte],
154 |  in_buffer_offset~ : Int32,
155 |  in_buffer_len~ : Int32,
156 |  out_buffer~ : FixedArray[Byte],
157 |  out_buffer_offset~ : Int32,
158 |  out_buffer_len~ : Int32,
159 |  plain_buffer~ : Bytes,
160 |  plain_buffer_offset~ : Int32,
161 |  plain_buffer_len~ : Int32,
162 |) -> Int32 = "moonbitlang/async" "tls/connection/write_plain"
    |...
165 |#unsafe_skip_stub_check
166 |#borrow(in_buffer, out_buffer)
167 |fn TlsConnectionHandle::connect(
168 |  self : TlsConnectionHandle,
169 |  in_buffer~ : FixedArray[Byte],
170 |  in_buffer_offset~ : Int32,
171 |  in_buffer_len~ : Int32,
172 |  out_buffer~ : FixedArray[Byte],
173 |  out_buffer_offset~ : Int32,
174 |  out_buffer_len~ : Int32,
175 |) -> TlsState = "moonbitlang/async" "tls/connection/connect"
    |...
178 |#unsafe_skip_stub_check
179 |#borrow(in_buffer, out_buffer)
180 |fn TlsConnectionHandle::accept(
181 |  self : TlsConnectionHandle,
182 |  in_buffer~ : FixedArray[Byte],
183 |  in_buffer_offset~ : Int32,
184 |  in_buffer_len~ : Int32,
185 |  out_buffer~ : FixedArray[Byte],
186 |  out_buffer_offset~ : Int32,
187 |  out_buffer_len~ : Int32,
188 |) -> TlsState = "moonbitlang/async" "tls/connection/accept"
    |...
191 |#unsafe_skip_stub_check
192 |fn TlsConnectionHandle::bytes_read(self : TlsConnectionHandle) -> Int32 = "moonbitlang/async" "tls/connection/bytes_read"
    |...
195 |#unsafe_skip_stub_check
196 |fn TlsConnectionHandle::bytes_to_write(self : TlsConnectionHandle) -> Int32 = "moonbitlang/async" "tls/connection/bytes_to_write"
    |...
199 |#unsafe_skip_stub_check
200 |fn TlsConnectionHandle::wants_read(self : TlsConnectionHandle) -> Bool = "moonbitlang/async" "tls/connection/wants_read"
    |...
203 |#unsafe_skip_stub_check
204 |fn TlsConnectionHandle::wants_write(self : TlsConnectionHandle) -> Bool = "moonbitlang/async" "tls/connection/wants_write"
    |...
207 |#unsafe_skip_stub_check
208 |fn TlsConnectionHandle::shutdown(self : TlsConnectionHandle) -> Int32 = "moonbitlang/async" "tls/connection/shutdown"
    |...
211 |#unsafe_skip_stub_check
212 |fn TlsConnectionHandle::peer_certificate(
213 |  self : TlsConnectionHandle,
214 |) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/peer_certificate"
    |...
217 |#unsafe_skip_stub_check
218 |fn TlsConnectionHandle::unique_channel_binding(
219 |  self : TlsConnectionHandle,
220 |) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/unique_channel_binding"
    |...
223 |#unsafe_skip_stub_check
224 |fn TlsConnectionHandle::server_endpoint_channel_binding(
225 |  self : TlsConnectionHandle,
226 |) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/server_endpoint_channel_binding"
    |...
229 |struct Tls {
    |...
241 |fn[R : @io.BinaryReader, W : @io.BinaryWriter] Tls::from_pair(
242 |  conn : TlsConnectionHandle,
243 |  r : R,
244 |  w : W,
245 |  is_client~ : Bool,
246 |  host~ : String?,
247 |) -> Tls {
    |...
261 |async fn Tls::connect(self : Tls) -> Unit {
    |...
294 |async fn Tls::accept(self : Tls) -> Unit {
    |...
329 |pub async fn[R : @io.BinaryReader, W : @io.BinaryWriter] Tls::client_from_pair(
330 |  r : R,
331 |  w : W,
332 |  host? : String,
333 |  sni~ : Bool = true,
334 |  trust~ : TrustedRoot = SystemRoot,
335 |) -> Tls {
    |...
361 |#internal(internal, "do not use, for internal testing only")
362 |pub async fn[R : @io.BinaryReader, W : @io.BinaryWriter] Tls::server_from_pair(
363 |  r : R,
364 |  w : W,
365 |  private_key_file? : String,
366 |  private_key_type? : X509FileType,
367 |  certificate_file? : String,
368 |  certificate_type? : X509FileType,
369 |  pfx_file? : String,
370 |) -> Tls {
    |...
426 |#internal(internal, "do not use, for internal testing only")
427 |pub async fn[Inner : @io.BinaryReader + @io.BinaryWriter] Tls::server(
428 |  inner : Inner,
429 |  private_key_file? : String,
430 |  private_key_type? : X509FileType,
431 |  certificate_file? : String,
432 |  certificate_type? : X509FileType,
433 |  pfx_file? : String,
434 |) -> Tls {
    |...
447 |impl @io.BinaryReaderImpl for Tls with fn raw_read_impl(
448 |  self,
449 |  buf,
450 |  offset~,
451 |  max_len~,
452 |) {
    |...
511 |impl @io.BinaryReaderImpl for Tls with fn get_controller(self) {
    |...
516 |impl @io.BinaryWriterImpl for Tls with fn raw_write_impl(
517 |  self,
518 |  buf,
519 |  offset~,
520 |  len~,
521 |) {
    |...
575 |impl @io.BinaryWriterImpl for Tls with fn get_controller(self) {
    |...
585 |pub fn Tls::close(self : Tls) -> Unit {
    |...
603 |pub async fn Tls::shutdown(self : Tls) -> Unit {
    |...
633 |pub fn Tls::get_peer_certificate(self : Tls) -> Bytes? raise {
    |...
648 |pub fn Tls::unique_channel_binding(self : Tls) -> Bytes raise {
    |...
668 |pub fn Tls::server_endpoint_channel_binding(self : Tls) -> Bytes raise {
    |...
684 |let _unused : Unit = {
    |...

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide outline 'compress\flate\inflate_fast_wbtest.mbt'
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

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide outline 'encoding\utf8\decode_js.mbt'
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

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide outline 'lazy\lazy.mbt'
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

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide outline 'test\types.mbt'
16 |struct Test {
   |...
23 |#alias(new, deprecated="Use `Test()` instead")
24 |#as_free_fn
25 |#as_free_fn(new, deprecated="Use `Test()` instead")
26 |pub fn Test::Test(name : String) -> Test {
   |...

```
