# core find-references TlsConnectionHandle async\tls\tls.wasm.mbt:17:13

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' find-references 'TlsConnectionHandle' --loc 'async\tls\tls.wasm.mbt:17:13'
Found 44 references for symbol 'TlsConnectionHandle':
<WORKDIR>/async\tls\server_for_wbtest.mbt:179:4-179:23:
    | #cfg(target="wasm")
    | #unsafe_skip_stub_check
    | #borrow(private_key_file, certificate_file)
179 | fn TlsConnectionHandle::set_server_files(
    |    ^^^^^^^^^^^^^^^^^^^
    |   self : TlsConnectionHandle,
    |   private_key_file : @os_string.OsString,

<WORKDIR>/async\tls\server_for_wbtest.mbt:180:10-180:29:
    | #unsafe_skip_stub_check
    | #borrow(private_key_file, certificate_file)
    | fn TlsConnectionHandle::set_server_files(
180 |   self : TlsConnectionHandle,
    |          ^^^^^^^^^^^^^^^^^^^
    |   private_key_file : @os_string.OsString,
    |   private_key_file_len~ : Int32 = private_key_file.to_string().length(),

<WORKDIR>/async\tls\server_for_wbtest.mbt:193:4-193:23:
    | #cfg(target="wasm")
    | #unsafe_skip_stub_check
    | #borrow(pfx_content)
193 | fn TlsConnectionHandle::set_server_pfx(
    |    ^^^^^^^^^^^^^^^^^^^
    |   self : TlsConnectionHandle,
    |   pfx_content : Bytes,

<WORKDIR>/async\tls\server_for_wbtest.mbt:194:10-194:29:
    | #unsafe_skip_stub_check
    | #borrow(pfx_content)
    | fn TlsConnectionHandle::set_server_pfx(
194 |   self : TlsConnectionHandle,
    |          ^^^^^^^^^^^^^^^^^^^
    |   pfx_content : Bytes,
    |   pfx_content_len~ : Int32 = pfx_content.length(),

<WORKDIR>/async\tls\server_for_wbtest.mbt:211:14-211:33:
    |   certificate_type? : X509FileType,
    |   pfx_file? : String,
    | ) -> Tls {
211 |   let conn = TlsConnectionHandle::new()
    |              ^^^^^^^^^^^^^^^^^^^
    |   let self = Tls::from_pair(
    |     conn,

<WORKDIR>/async\tls\tls.wasm.mbt:69:4-69:23:
   | // Returns a live handle containing pending configuration. TLS initialization
   | // errors are reported by the client and server setup calls.
   | #unsafe_skip_stub_check
69 | fn TlsConnectionHandle::new() -> TlsConnectionHandle = "moonbitlang/async" "tls/connection/new"
   |    ^^^^^^^^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/async\tls\tls.wasm.mbt:69:34-69:53:
   | // Returns a live handle containing pending configuration. TLS initialization
   | // errors are reported by the client and server setup calls.
   | #unsafe_skip_stub_check
69 | fn TlsConnectionHandle::new() -> TlsConnectionHandle = "moonbitlang/async" "tls/connection/new"
   |                                  ^^^^^^^^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/async\tls\tls.wasm.mbt:74:4-74:23:
   | ///|
   | #unsafe_skip_stub_check
   | #borrow(host)
74 | fn TlsConnectionHandle::set_client(
   |    ^^^^^^^^^^^^^^^^^^^
   |   self : TlsConnectionHandle,
   |   host : @os_string.OsString,

<WORKDIR>/async\tls\tls.wasm.mbt:75:10-75:29:
   | #unsafe_skip_stub_check
   | #borrow(host)
   | fn TlsConnectionHandle::set_client(
75 |   self : TlsConnectionHandle,
   |          ^^^^^^^^^^^^^^^^^^^
   |   host : @os_string.OsString,
   |   host_len~ : Int32 = host.to_string().length(),

<WORKDIR>/async\tls\tls.wasm.mbt:85:4-85:23:
   | ///|
   | #unsafe_skip_stub_check
   | #borrow(root)
85 | fn TlsConnectionHandle::add_root_certificate(
   |    ^^^^^^^^^^^^^^^^^^^
   |   self : TlsConnectionHandle,
   |   root : Bytes,

<WORKDIR>/async\tls\tls.wasm.mbt:86:10-86:29:
   | #unsafe_skip_stub_check
   | #borrow(root)
   | fn TlsConnectionHandle::add_root_certificate(
86 |   self : TlsConnectionHandle,
   |          ^^^^^^^^^^^^^^^^^^^
   |   root : Bytes,
   |   root_len~ : Int32 = root.length(),

<WORKDIR>/async\tls\tls.wasm.mbt:93:4-93:23:
   | 
   | ///|
   | #unsafe_skip_stub_check
93 | fn TlsConnectionHandle::free(self : TlsConnectionHandle) -> Unit = "moonbitlang/async" "tls/connection/free"
   |    ^^^^^^^^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/async\tls\tls.wasm.mbt:93:37-93:56:
   | 
   | ///|
   | #unsafe_skip_stub_check
93 | fn TlsConnectionHandle::free(self : TlsConnectionHandle) -> Unit = "moonbitlang/async" "tls/connection/free"
   |                                     ^^^^^^^^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/async\tls\tls.wasm.mbt:97:4-97:23:
   | 
   | ///|
   | #unsafe_skip_stub_check
97 | fn TlsConnectionHandle::take_error(
   |    ^^^^^^^^^^^^^^^^^^^
   |   self : TlsConnectionHandle,
   | ) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/take_error"

<WORKDIR>/async\tls\tls.wasm.mbt:98:10-98:29:
   | ///|
   | #unsafe_skip_stub_check
   | fn TlsConnectionHandle::take_error(
98 |   self : TlsConnectionHandle,
   |          ^^^^^^^^^^^^^^^^^^^
   | ) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/take_error"
   | 

<WORKDIR>/async\tls\tls.wasm.mbt:102:4-102:23:
    | ) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/take_error"
    | 
    | ///|
102 | fn TlsConnectionHandle::take_error_message(
    |    ^^^^^^^^^^^^^^^^^^^
    |   self : TlsConnectionHandle,
    | ) -> String {

<WORKDIR>/async\tls\tls.wasm.mbt:103:10-103:29:
    | 
    | ///|
    | fn TlsConnectionHandle::take_error_message(
103 |   self : TlsConnectionHandle,
    |          ^^^^^^^^^^^^^^^^^^^
    | ) -> String {
    |   let buf = self.take_error()

<WORKDIR>/async\tls\tls.wasm.mbt:113:4-113:23:
    | ///|
    | #unsafe_skip_stub_check
    | #borrow(in_buffer, out_buffer, plain_buffer)
113 | fn TlsConnectionHandle::read_plain(
    |    ^^^^^^^^^^^^^^^^^^^
    |   self : TlsConnectionHandle,
    |   in_buffer~ : FixedArray[Byte],

<WORKDIR>/async\tls\tls.wasm.mbt:114:10-114:29:
    | #unsafe_skip_stub_check
    | #borrow(in_buffer, out_buffer, plain_buffer)
    | fn TlsConnectionHandle::read_plain(
114 |   self : TlsConnectionHandle,
    |          ^^^^^^^^^^^^^^^^^^^
    |   in_buffer~ : FixedArray[Byte],
    |   in_buffer_offset~ : Int32,

<WORKDIR>/async\tls\tls.wasm.mbt:129:4-129:23:
    | ///|
    | #unsafe_skip_stub_check
    | #borrow(in_buffer, out_buffer, plain_buffer)
129 | fn TlsConnectionHandle::write_plain(
    |    ^^^^^^^^^^^^^^^^^^^
    |   self : TlsConnectionHandle,
    |   in_buffer~ : FixedArray[Byte],

<WORKDIR>/async\tls\tls.wasm.mbt:130:10-130:29:
    | #unsafe_skip_stub_check
    | #borrow(in_buffer, out_buffer, plain_buffer)
    | fn TlsConnectionHandle::write_plain(
130 |   self : TlsConnectionHandle,
    |          ^^^^^^^^^^^^^^^^^^^
    |   in_buffer~ : FixedArray[Byte],
    |   in_buffer_offset~ : Int32,

<WORKDIR>/async\tls\tls.wasm.mbt:145:4-145:23:
    | ///|
    | #unsafe_skip_stub_check
    | #borrow(in_buffer, out_buffer)
145 | fn TlsConnectionHandle::connect(
    |    ^^^^^^^^^^^^^^^^^^^
    |   self : TlsConnectionHandle,
    |   in_buffer~ : FixedArray[Byte],

<WORKDIR>/async\tls\tls.wasm.mbt:146:10-146:29:
    | #unsafe_skip_stub_check
    | #borrow(in_buffer, out_buffer)
    | fn TlsConnectionHandle::connect(
146 |   self : TlsConnectionHandle,
    |          ^^^^^^^^^^^^^^^^^^^
    |   in_buffer~ : FixedArray[Byte],
    |   in_buffer_offset~ : Int32,

<WORKDIR>/async\tls\tls.wasm.mbt:158:4-158:23:
    | ///|
    | #unsafe_skip_stub_check
    | #borrow(in_buffer, out_buffer)
158 | fn TlsConnectionHandle::accept(
    |    ^^^^^^^^^^^^^^^^^^^
    |   self : TlsConnectionHandle,
    |   in_buffer~ : FixedArray[Byte],

<WORKDIR>/async\tls\tls.wasm.mbt:159:10-159:29:
    | #unsafe_skip_stub_check
    | #borrow(in_buffer, out_buffer)
    | fn TlsConnectionHandle::accept(
159 |   self : TlsConnectionHandle,
    |          ^^^^^^^^^^^^^^^^^^^
    |   in_buffer~ : FixedArray[Byte],
    |   in_buffer_offset~ : Int32,

<WORKDIR>/async\tls\tls.wasm.mbt:170:4-170:23:
    | 
    | ///|
    | #unsafe_skip_stub_check
170 | fn TlsConnectionHandle::bytes_read(self : TlsConnectionHandle) -> Int32 = "moonbitlang/async" "tls/connection/bytes_read"
    |    ^^^^^^^^^^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/async\tls\tls.wasm.mbt:170:43-170:62:
    | 
    | ///|
    | #unsafe_skip_stub_check
170 | fn TlsConnectionHandle::bytes_read(self : TlsConnectionHandle) -> Int32 = "moonbitlang/async" "tls/connection/bytes_read"
    |                                           ^^^^^^^^^^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/async\tls\tls.wasm.mbt:174:4-174:23:
    | 
    | ///|
    | #unsafe_skip_stub_check
174 | fn TlsConnectionHandle::bytes_to_write(self : TlsConnectionHandle) -> Int32 = "moonbitlang/async" "tls/connection/bytes_to_write"
    |    ^^^^^^^^^^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/async\tls\tls.wasm.mbt:174:47-174:66:
    | 
    | ///|
    | #unsafe_skip_stub_check
174 | fn TlsConnectionHandle::bytes_to_write(self : TlsConnectionHandle) -> Int32 = "moonbitlang/async" "tls/connection/bytes_to_write"
    |                                               ^^^^^^^^^^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/async\tls\tls.wasm.mbt:178:4-178:23:
    | 
    | ///|
    | #unsafe_skip_stub_check
178 | fn TlsConnectionHandle::wants_read(self : TlsConnectionHandle) -> Bool = "moonbitlang/async" "tls/connection/wants_read"
    |    ^^^^^^^^^^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/async\tls\tls.wasm.mbt:178:43-178:62:
    | 
    | ///|
    | #unsafe_skip_stub_check
178 | fn TlsConnectionHandle::wants_read(self : TlsConnectionHandle) -> Bool = "moonbitlang/async" "tls/connection/wants_read"
    |                                           ^^^^^^^^^^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/async\tls\tls.wasm.mbt:182:4-182:23:
    | 
    | ///|
    | #unsafe_skip_stub_check
182 | fn TlsConnectionHandle::wants_write(self : TlsConnectionHandle) -> Bool = "moonbitlang/async" "tls/connection/wants_write"
    |    ^^^^^^^^^^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/async\tls\tls.wasm.mbt:182:44-182:63:
    | 
    | ///|
    | #unsafe_skip_stub_check
182 | fn TlsConnectionHandle::wants_write(self : TlsConnectionHandle) -> Bool = "moonbitlang/async" "tls/connection/wants_write"
    |                                            ^^^^^^^^^^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/async\tls\tls.wasm.mbt:186:4-186:23:
    | 
    | ///|
    | #unsafe_skip_stub_check
186 | fn TlsConnectionHandle::shutdown(self : TlsConnectionHandle) -> Int32 = "moonbitlang/async" "tls/connection/shutdown"
    |    ^^^^^^^^^^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/async\tls\tls.wasm.mbt:186:41-186:60:
    | 
    | ///|
    | #unsafe_skip_stub_check
186 | fn TlsConnectionHandle::shutdown(self : TlsConnectionHandle) -> Int32 = "moonbitlang/async" "tls/connection/shutdown"
    |                                         ^^^^^^^^^^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/async\tls\tls.wasm.mbt:190:4-190:23:
    | 
    | ///|
    | #unsafe_skip_stub_check
190 | fn TlsConnectionHandle::peer_certificate(
    |    ^^^^^^^^^^^^^^^^^^^
    |   self : TlsConnectionHandle,
    | ) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/peer_certificate"

<WORKDIR>/async\tls\tls.wasm.mbt:191:10-191:29:
    | ///|
    | #unsafe_skip_stub_check
    | fn TlsConnectionHandle::peer_certificate(
191 |   self : TlsConnectionHandle,
    |          ^^^^^^^^^^^^^^^^^^^
    | ) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/peer_certificate"
    | 

<WORKDIR>/async\tls\tls.wasm.mbt:196:4-196:23:
    | 
    | ///|
    | #unsafe_skip_stub_check
196 | fn TlsConnectionHandle::unique_channel_binding(
    |    ^^^^^^^^^^^^^^^^^^^
    |   self : TlsConnectionHandle,
    | ) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/unique_channel_binding"

<WORKDIR>/async\tls\tls.wasm.mbt:197:10-197:29:
    | ///|
    | #unsafe_skip_stub_check
    | fn TlsConnectionHandle::unique_channel_binding(
197 |   self : TlsConnectionHandle,
    |          ^^^^^^^^^^^^^^^^^^^
    | ) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/unique_channel_binding"
    | 

<WORKDIR>/async\tls\tls.wasm.mbt:202:4-202:23:
    | 
    | ///|
    | #unsafe_skip_stub_check
202 | fn TlsConnectionHandle::server_endpoint_channel_binding(
    |    ^^^^^^^^^^^^^^^^^^^
    |   self : TlsConnectionHandle,
    | ) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/server_endpoint_channel_binding"

<WORKDIR>/async\tls\tls.wasm.mbt:203:10-203:29:
    | ///|
    | #unsafe_skip_stub_check
    | fn TlsConnectionHandle::server_endpoint_channel_binding(
203 |   self : TlsConnectionHandle,
    |          ^^^^^^^^^^^^^^^^^^^
    | ) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/server_endpoint_channel_binding"
    | 

<WORKDIR>/async\tls\tls.wasm.mbt:208:10-208:29:
    | 
    | ///|
    | struct Tls {
208 |   conn : TlsConnectionHandle
    |          ^^^^^^^^^^^^^^^^^^^
    |   host : String?
    |   is_client : Bool

<WORKDIR>/async\tls\tls.wasm.mbt:221:10-221:29:
    | 
    | ///|
    | fn[R : @io.BinaryReader, W : @io.BinaryWriter] Tls::from_pair(
221 |   conn : TlsConnectionHandle,
    |          ^^^^^^^^^^^^^^^^^^^
    |   r : R,
    |   w : W,

<WORKDIR>/async\tls\tls.wasm.mbt:322:14-322:33:
    |     Some(host) => @os_string.from_string(host)
    |     None => @os_string.empty
    |   }
322 |   let conn = TlsConnectionHandle::new()
    |              ^^^^^^^^^^^^^^^^^^^
    |   let self = Tls::from_pair(
    |     conn,
"" (escaped)
```
