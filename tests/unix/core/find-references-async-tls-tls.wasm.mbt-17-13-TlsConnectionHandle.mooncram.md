# core find-references TlsConnectionHandle async/tls/tls.wasm.mbt:17:13

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
$ run_moon_ide moon ide find-references 'TlsConnectionHandle' --loc 'async/tls/tls.wasm.mbt:17:13'
Found 44 references for symbol 'TlsConnectionHandle':
<WORKDIR>/async/tls/tls.wasm.mbt:69:4-69:23:
   | // Returns a live handle containing pending configuration. TLS initialization
   | // errors are reported by the client and server setup calls.
   | #unsafe_skip_stub_check
69 | fn TlsConnectionHandle::new() -> TlsConnectionHandle = "moonbitlang/async" "tls/connection/new"
   |    ^^^^^^^^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/async/tls/tls.wasm.mbt:69:34-69:53:
   | // Returns a live handle containing pending configuration. TLS initialization
   | // errors are reported by the client and server setup calls.
   | #unsafe_skip_stub_check
69 | fn TlsConnectionHandle::new() -> TlsConnectionHandle = "moonbitlang/async" "tls/connection/new"
   |                                  ^^^^^^^^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/async/tls/tls.wasm.mbt:74:4-74:23:
   | ///|
   | #unsafe_skip_stub_check
   | #borrow(host)
74 | fn TlsConnectionHandle::set_client(
   |    ^^^^^^^^^^^^^^^^^^^
   |   self : TlsConnectionHandle,
   |   host : String,

<WORKDIR>/async/tls/tls.wasm.mbt:75:10-75:29:
   | #unsafe_skip_stub_check
   | #borrow(host)
   | fn TlsConnectionHandle::set_client(
75 |   self : TlsConnectionHandle,
   |          ^^^^^^^^^^^^^^^^^^^
   |   host : String,
   |   host_len~ : Int32 = host.length(),

<WORKDIR>/async/tls/tls.wasm.mbt:85:4-85:23:
   | ///|
   | #unsafe_skip_stub_check
   | #borrow(root)
85 | fn TlsConnectionHandle::add_root_certificate(
   |    ^^^^^^^^^^^^^^^^^^^
   |   self : TlsConnectionHandle,
   |   root : Bytes,

<WORKDIR>/async/tls/tls.wasm.mbt:86:10-86:29:
   | #unsafe_skip_stub_check
   | #borrow(root)
   | fn TlsConnectionHandle::add_root_certificate(
86 |   self : TlsConnectionHandle,
   |          ^^^^^^^^^^^^^^^^^^^
   |   root : Bytes,
   |   root_len~ : Int32 = root.length(),

<WORKDIR>/async/tls/tls.wasm.mbt:94:4-94:23:
   | ///|
   | #unsafe_skip_stub_check
   | #borrow(private_key_file, certificate_file)
94 | fn TlsConnectionHandle::set_server_files(
   |    ^^^^^^^^^^^^^^^^^^^
   |   self : TlsConnectionHandle,
   |   private_key_file : @os_string.OsString,

<WORKDIR>/async/tls/tls.wasm.mbt:95:10-95:29:
   | #unsafe_skip_stub_check
   | #borrow(private_key_file, certificate_file)
   | fn TlsConnectionHandle::set_server_files(
95 |   self : TlsConnectionHandle,
   |          ^^^^^^^^^^^^^^^^^^^
   |   private_key_file : @os_string.OsString,
   |   private_key_file_len~ : Int32 = private_key_file.to_string().length(),

<WORKDIR>/async/tls/tls.wasm.mbt:107:4-107:23:
    | ///|
    | #unsafe_skip_stub_check
    | #borrow(pfx_content)
107 | fn TlsConnectionHandle::set_server_pfx(
    |    ^^^^^^^^^^^^^^^^^^^
    |   self : TlsConnectionHandle,
    |   pfx_content : Bytes,

<WORKDIR>/async/tls/tls.wasm.mbt:108:10-108:29:
    | #unsafe_skip_stub_check
    | #borrow(pfx_content)
    | fn TlsConnectionHandle::set_server_pfx(
108 |   self : TlsConnectionHandle,
    |          ^^^^^^^^^^^^^^^^^^^
    |   pfx_content : Bytes,
    |   pfx_content_len~ : Int32 = pfx_content.length(),

<WORKDIR>/async/tls/tls.wasm.mbt:115:4-115:23:
    | 
    | ///|
    | #unsafe_skip_stub_check
115 | fn TlsConnectionHandle::free(self : TlsConnectionHandle) -> Unit = "moonbitlang/async" "tls/connection/free"
    |    ^^^^^^^^^^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/async/tls/tls.wasm.mbt:115:37-115:56:
    | 
    | ///|
    | #unsafe_skip_stub_check
115 | fn TlsConnectionHandle::free(self : TlsConnectionHandle) -> Unit = "moonbitlang/async" "tls/connection/free"
    |                                     ^^^^^^^^^^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/async/tls/tls.wasm.mbt:119:4-119:23:
    | 
    | ///|
    | #unsafe_skip_stub_check
119 | fn TlsConnectionHandle::take_error(
    |    ^^^^^^^^^^^^^^^^^^^
    |   self : TlsConnectionHandle,
    | ) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/take_error"

<WORKDIR>/async/tls/tls.wasm.mbt:120:10-120:29:
    | ///|
    | #unsafe_skip_stub_check
    | fn TlsConnectionHandle::take_error(
120 |   self : TlsConnectionHandle,
    |          ^^^^^^^^^^^^^^^^^^^
    | ) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/take_error"
    | 

<WORKDIR>/async/tls/tls.wasm.mbt:124:4-124:23:
    | ) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/take_error"
    | 
    | ///|
124 | fn TlsConnectionHandle::take_error_message(
    |    ^^^^^^^^^^^^^^^^^^^
    |   self : TlsConnectionHandle,
    | ) -> String {

<WORKDIR>/async/tls/tls.wasm.mbt:125:10-125:29:
    | 
    | ///|
    | fn TlsConnectionHandle::take_error_message(
125 |   self : TlsConnectionHandle,
    |          ^^^^^^^^^^^^^^^^^^^
    | ) -> String {
    |   let buf = self.take_error()

<WORKDIR>/async/tls/tls.wasm.mbt:135:4-135:23:
    | ///|
    | #unsafe_skip_stub_check
    | #borrow(in_buffer, out_buffer, plain_buffer)
135 | fn TlsConnectionHandle::read_plain(
    |    ^^^^^^^^^^^^^^^^^^^
    |   self : TlsConnectionHandle,
    |   in_buffer~ : FixedArray[Byte],

<WORKDIR>/async/tls/tls.wasm.mbt:136:10-136:29:
    | #unsafe_skip_stub_check
    | #borrow(in_buffer, out_buffer, plain_buffer)
    | fn TlsConnectionHandle::read_plain(
136 |   self : TlsConnectionHandle,
    |          ^^^^^^^^^^^^^^^^^^^
    |   in_buffer~ : FixedArray[Byte],
    |   in_buffer_offset~ : Int32,

<WORKDIR>/async/tls/tls.wasm.mbt:151:4-151:23:
    | ///|
    | #unsafe_skip_stub_check
    | #borrow(in_buffer, out_buffer, plain_buffer)
151 | fn TlsConnectionHandle::write_plain(
    |    ^^^^^^^^^^^^^^^^^^^
    |   self : TlsConnectionHandle,
    |   in_buffer~ : FixedArray[Byte],

<WORKDIR>/async/tls/tls.wasm.mbt:152:10-152:29:
    | #unsafe_skip_stub_check
    | #borrow(in_buffer, out_buffer, plain_buffer)
    | fn TlsConnectionHandle::write_plain(
152 |   self : TlsConnectionHandle,
    |          ^^^^^^^^^^^^^^^^^^^
    |   in_buffer~ : FixedArray[Byte],
    |   in_buffer_offset~ : Int32,

<WORKDIR>/async/tls/tls.wasm.mbt:167:4-167:23:
    | ///|
    | #unsafe_skip_stub_check
    | #borrow(in_buffer, out_buffer)
167 | fn TlsConnectionHandle::connect(
    |    ^^^^^^^^^^^^^^^^^^^
    |   self : TlsConnectionHandle,
    |   in_buffer~ : FixedArray[Byte],

<WORKDIR>/async/tls/tls.wasm.mbt:168:10-168:29:
    | #unsafe_skip_stub_check
    | #borrow(in_buffer, out_buffer)
    | fn TlsConnectionHandle::connect(
168 |   self : TlsConnectionHandle,
    |          ^^^^^^^^^^^^^^^^^^^
    |   in_buffer~ : FixedArray[Byte],
    |   in_buffer_offset~ : Int32,

<WORKDIR>/async/tls/tls.wasm.mbt:180:4-180:23:
    | ///|
    | #unsafe_skip_stub_check
    | #borrow(in_buffer, out_buffer)
180 | fn TlsConnectionHandle::accept(
    |    ^^^^^^^^^^^^^^^^^^^
    |   self : TlsConnectionHandle,
    |   in_buffer~ : FixedArray[Byte],

<WORKDIR>/async/tls/tls.wasm.mbt:181:10-181:29:
    | #unsafe_skip_stub_check
    | #borrow(in_buffer, out_buffer)
    | fn TlsConnectionHandle::accept(
181 |   self : TlsConnectionHandle,
    |          ^^^^^^^^^^^^^^^^^^^
    |   in_buffer~ : FixedArray[Byte],
    |   in_buffer_offset~ : Int32,

<WORKDIR>/async/tls/tls.wasm.mbt:192:4-192:23:
    | 
    | ///|
    | #unsafe_skip_stub_check
192 | fn TlsConnectionHandle::bytes_read(self : TlsConnectionHandle) -> Int32 = "moonbitlang/async" "tls/connection/bytes_read"
    |    ^^^^^^^^^^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/async/tls/tls.wasm.mbt:192:43-192:62:
    | 
    | ///|
    | #unsafe_skip_stub_check
192 | fn TlsConnectionHandle::bytes_read(self : TlsConnectionHandle) -> Int32 = "moonbitlang/async" "tls/connection/bytes_read"
    |                                           ^^^^^^^^^^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/async/tls/tls.wasm.mbt:196:4-196:23:
    | 
    | ///|
    | #unsafe_skip_stub_check
196 | fn TlsConnectionHandle::bytes_to_write(self : TlsConnectionHandle) -> Int32 = "moonbitlang/async" "tls/connection/bytes_to_write"
    |    ^^^^^^^^^^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/async/tls/tls.wasm.mbt:196:47-196:66:
    | 
    | ///|
    | #unsafe_skip_stub_check
196 | fn TlsConnectionHandle::bytes_to_write(self : TlsConnectionHandle) -> Int32 = "moonbitlang/async" "tls/connection/bytes_to_write"
    |                                               ^^^^^^^^^^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/async/tls/tls.wasm.mbt:200:4-200:23:
    | 
    | ///|
    | #unsafe_skip_stub_check
200 | fn TlsConnectionHandle::wants_read(self : TlsConnectionHandle) -> Bool = "moonbitlang/async" "tls/connection/wants_read"
    |    ^^^^^^^^^^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/async/tls/tls.wasm.mbt:200:43-200:62:
    | 
    | ///|
    | #unsafe_skip_stub_check
200 | fn TlsConnectionHandle::wants_read(self : TlsConnectionHandle) -> Bool = "moonbitlang/async" "tls/connection/wants_read"
    |                                           ^^^^^^^^^^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/async/tls/tls.wasm.mbt:204:4-204:23:
    | 
    | ///|
    | #unsafe_skip_stub_check
204 | fn TlsConnectionHandle::wants_write(self : TlsConnectionHandle) -> Bool = "moonbitlang/async" "tls/connection/wants_write"
    |    ^^^^^^^^^^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/async/tls/tls.wasm.mbt:204:44-204:63:
    | 
    | ///|
    | #unsafe_skip_stub_check
204 | fn TlsConnectionHandle::wants_write(self : TlsConnectionHandle) -> Bool = "moonbitlang/async" "tls/connection/wants_write"
    |                                            ^^^^^^^^^^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/async/tls/tls.wasm.mbt:208:4-208:23:
    | 
    | ///|
    | #unsafe_skip_stub_check
208 | fn TlsConnectionHandle::shutdown(self : TlsConnectionHandle) -> Int32 = "moonbitlang/async" "tls/connection/shutdown"
    |    ^^^^^^^^^^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/async/tls/tls.wasm.mbt:208:41-208:60:
    | 
    | ///|
    | #unsafe_skip_stub_check
208 | fn TlsConnectionHandle::shutdown(self : TlsConnectionHandle) -> Int32 = "moonbitlang/async" "tls/connection/shutdown"
    |                                         ^^^^^^^^^^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/async/tls/tls.wasm.mbt:212:4-212:23:
    | 
    | ///|
    | #unsafe_skip_stub_check
212 | fn TlsConnectionHandle::peer_certificate(
    |    ^^^^^^^^^^^^^^^^^^^
    |   self : TlsConnectionHandle,
    | ) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/peer_certificate"

<WORKDIR>/async/tls/tls.wasm.mbt:213:10-213:29:
    | ///|
    | #unsafe_skip_stub_check
    | fn TlsConnectionHandle::peer_certificate(
213 |   self : TlsConnectionHandle,
    |          ^^^^^^^^^^^^^^^^^^^
    | ) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/peer_certificate"
    | 

<WORKDIR>/async/tls/tls.wasm.mbt:218:4-218:23:
    | 
    | ///|
    | #unsafe_skip_stub_check
218 | fn TlsConnectionHandle::unique_channel_binding(
    |    ^^^^^^^^^^^^^^^^^^^
    |   self : TlsConnectionHandle,
    | ) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/unique_channel_binding"

<WORKDIR>/async/tls/tls.wasm.mbt:219:10-219:29:
    | ///|
    | #unsafe_skip_stub_check
    | fn TlsConnectionHandle::unique_channel_binding(
219 |   self : TlsConnectionHandle,
    |          ^^^^^^^^^^^^^^^^^^^
    | ) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/unique_channel_binding"
    | 

<WORKDIR>/async/tls/tls.wasm.mbt:224:4-224:23:
    | 
    | ///|
    | #unsafe_skip_stub_check
224 | fn TlsConnectionHandle::server_endpoint_channel_binding(
    |    ^^^^^^^^^^^^^^^^^^^
    |   self : TlsConnectionHandle,
    | ) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/server_endpoint_channel_binding"

<WORKDIR>/async/tls/tls.wasm.mbt:225:10-225:29:
    | ///|
    | #unsafe_skip_stub_check
    | fn TlsConnectionHandle::server_endpoint_channel_binding(
225 |   self : TlsConnectionHandle,
    |          ^^^^^^^^^^^^^^^^^^^
    | ) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/server_endpoint_channel_binding"
    | 

<WORKDIR>/async/tls/tls.wasm.mbt:230:10-230:29:
    | 
    | ///|
    | struct Tls {
230 |   conn : TlsConnectionHandle
    |          ^^^^^^^^^^^^^^^^^^^
    |   host : String?
    |   is_client : Bool

<WORKDIR>/async/tls/tls.wasm.mbt:242:10-242:29:
    | 
    | ///|
    | fn[R : @io.BinaryReader, W : @io.BinaryWriter] Tls::from_pair(
242 |   conn : TlsConnectionHandle,
    |          ^^^^^^^^^^^^^^^^^^^
    |   r : R,
    |   w : W,

<WORKDIR>/async/tls/tls.wasm.mbt:340:14-340:33:
    |     Some(host) => host
    |     None => ""
    |   }
340 |   let conn = TlsConnectionHandle::new()
    |              ^^^^^^^^^^^^^^^^^^^
    |   let self = Tls::from_pair(conn, r, w, is_client=true, host~)
    |   errdefer self.close()

<WORKDIR>/async/tls/tls.wasm.mbt:371:14-371:33:
    |   certificate_type? : X509FileType,
    |   pfx_file? : String,
    | ) -> Tls {
371 |   let conn = TlsConnectionHandle::new()
    |              ^^^^^^^^^^^^^^^^^^^
    |   let self = Tls::from_pair(conn, r, w, is_client=false, host=None)
    |   errdefer self.close()

```
