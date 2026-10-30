# core rename TlsConnectionHandle async\tls\tls.wasm.mbt:17:13

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'TlsConnectionHandle' 'TlsConnectionHandleRenamed' --loc 'async\tls\tls.wasm.mbt:17:13'
*** Begin Patch
*** Update File: <WORKDIR>/async\tls\tls.wasm.mbt
@@
 
 ///|
 // A single TLS session: handshake state, encrypted/plain buffers, and wants flags.
-priv struct TlsConnectionHandle(UInt64)
+priv struct TlsConnectionHandleRenamed(UInt64)
 
 ///|
 priv enum TlsTrustMode {
@@
 // Returns a live handle containing pending configuration. TLS initialization
 // errors are reported by the client and server setup calls.
 #unsafe_skip_stub_check
-fn TlsConnectionHandle::new() -> TlsConnectionHandle = "moonbitlang/async" "tls/connection/new"
+fn TlsConnectionHandleRenamed::new() -> TlsConnectionHandleRenamed = "moonbitlang/async" "tls/connection/new"
 
 ///|
 #unsafe_skip_stub_check
 #borrow(host)
-fn TlsConnectionHandle::set_client(
+fn TlsConnectionHandleRenamed::set_client(
-  self : TlsConnectionHandle,
+  self : TlsConnectionHandleRenamed,
   host : String,
   host_len~ : Int32 = host.length(),
   sni~ : Bool,
@@
 ///|
 #unsafe_skip_stub_check
 #borrow(root)
-fn TlsConnectionHandle::add_root_certificate(
+fn TlsConnectionHandleRenamed::add_root_certificate(
-  self : TlsConnectionHandle,
+  self : TlsConnectionHandleRenamed,
   root : Bytes,
   root_len~ : Int32 = root.length(),
 ) -> Int32 = "moonbitlang/async" "tls/connection/add_root_certificate"
@@
 ///|
 #unsafe_skip_stub_check
 #borrow(private_key_file, certificate_file)
-fn TlsConnectionHandle::set_server_files(
+fn TlsConnectionHandleRenamed::set_server_files(
-  self : TlsConnectionHandle,
+  self : TlsConnectionHandleRenamed,
   private_key_file : @os_string.OsString,
   private_key_file_len~ : Int32 = private_key_file.to_string().length(),
   private_key_type : X509FileType,
@@
 ///|
 #unsafe_skip_stub_check
 #borrow(pfx_content)
-fn TlsConnectionHandle::set_server_pfx(
+fn TlsConnectionHandleRenamed::set_server_pfx(
-  self : TlsConnectionHandle,
+  self : TlsConnectionHandleRenamed,
   pfx_content : Bytes,
   pfx_content_len~ : Int32 = pfx_content.length(),
 ) -> Int32 = "moonbitlang/async" "tls/connection/set_server_pfx"
@@
 
 ///|
 #unsafe_skip_stub_check
-fn TlsConnectionHandle::free(self : TlsConnectionHandle) -> Unit = "moonbitlang/async" "tls/connection/free"
+fn TlsConnectionHandleRenamed::free(self : TlsConnectionHandleRenamed) -> Unit = "moonbitlang/async" "tls/connection/free"
 
 ///|
 #unsafe_skip_stub_check
-fn TlsConnectionHandle::take_error(
+fn TlsConnectionHandleRenamed::take_error(
-  self : TlsConnectionHandle,
+  self : TlsConnectionHandleRenamed,
 ) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/take_error"
 
 ///|
-fn TlsConnectionHandle::take_error_message(
+fn TlsConnectionHandleRenamed::take_error_message(
-  self : TlsConnectionHandle,
+  self : TlsConnectionHandleRenamed,
 ) -> String {
   let buf = self.take_error()
   defer buf.free()
@@
 ///|
 #unsafe_skip_stub_check
 #borrow(in_buffer, out_buffer, plain_buffer)
-fn TlsConnectionHandle::read_plain(
+fn TlsConnectionHandleRenamed::read_plain(
-  self : TlsConnectionHandle,
+  self : TlsConnectionHandleRenamed,
   in_buffer~ : FixedArray[Byte],
   in_buffer_offset~ : Int32,
   in_buffer_len~ : Int32,
@@
 ///|
 #unsafe_skip_stub_check
 #borrow(in_buffer, out_buffer, plain_buffer)
-fn TlsConnectionHandle::write_plain(
+fn TlsConnectionHandleRenamed::write_plain(
-  self : TlsConnectionHandle,
+  self : TlsConnectionHandleRenamed,
   in_buffer~ : FixedArray[Byte],
   in_buffer_offset~ : Int32,
   in_buffer_len~ : Int32,
@@
 ///|
 #unsafe_skip_stub_check
 #borrow(in_buffer, out_buffer)
-fn TlsConnectionHandle::connect(
+fn TlsConnectionHandleRenamed::connect(
-  self : TlsConnectionHandle,
+  self : TlsConnectionHandleRenamed,
   in_buffer~ : FixedArray[Byte],
   in_buffer_offset~ : Int32,
   in_buffer_len~ : Int32,
@@
 ///|
 #unsafe_skip_stub_check
 #borrow(in_buffer, out_buffer)
-fn TlsConnectionHandle::accept(
+fn TlsConnectionHandleRenamed::accept(
-  self : TlsConnectionHandle,
+  self : TlsConnectionHandleRenamed,
   in_buffer~ : FixedArray[Byte],
   in_buffer_offset~ : Int32,
   in_buffer_len~ : Int32,
@@
 
 ///|
 #unsafe_skip_stub_check
-fn TlsConnectionHandle::bytes_read(self : TlsConnectionHandle) -> Int32 = "moonbitlang/async" "tls/connection/bytes_read"
+fn TlsConnectionHandleRenamed::bytes_read(self : TlsConnectionHandleRenamed) -> Int32 = "moonbitlang/async" "tls/connection/bytes_read"
 
 ///|
 #unsafe_skip_stub_check
-fn TlsConnectionHandle::bytes_to_write(self : TlsConnectionHandle) -> Int32 = "moonbitlang/async" "tls/connection/bytes_to_write"
+fn TlsConnectionHandleRenamed::bytes_to_write(self : TlsConnectionHandleRenamed) -> Int32 = "moonbitlang/async" "tls/connection/bytes_to_write"
 
 ///|
 #unsafe_skip_stub_check
-fn TlsConnectionHandle::wants_read(self : TlsConnectionHandle) -> Bool = "moonbitlang/async" "tls/connection/wants_read"
+fn TlsConnectionHandleRenamed::wants_read(self : TlsConnectionHandleRenamed) -> Bool = "moonbitlang/async" "tls/connection/wants_read"
 
 ///|
 #unsafe_skip_stub_check
-fn TlsConnectionHandle::wants_write(self : TlsConnectionHandle) -> Bool = "moonbitlang/async" "tls/connection/wants_write"
+fn TlsConnectionHandleRenamed::wants_write(self : TlsConnectionHandleRenamed) -> Bool = "moonbitlang/async" "tls/connection/wants_write"
 
 ///|
 #unsafe_skip_stub_check
-fn TlsConnectionHandle::shutdown(self : TlsConnectionHandle) -> Int32 = "moonbitlang/async" "tls/connection/shutdown"
+fn TlsConnectionHandleRenamed::shutdown(self : TlsConnectionHandleRenamed) -> Int32 = "moonbitlang/async" "tls/connection/shutdown"
 
 ///|
 #unsafe_skip_stub_check
-fn TlsConnectionHandle::peer_certificate(
+fn TlsConnectionHandleRenamed::peer_certificate(
-  self : TlsConnectionHandle,
+  self : TlsConnectionHandleRenamed,
 ) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/peer_certificate"
 
 ///|
 #unsafe_skip_stub_check
-fn TlsConnectionHandle::unique_channel_binding(
+fn TlsConnectionHandleRenamed::unique_channel_binding(
-  self : TlsConnectionHandle,
+  self : TlsConnectionHandleRenamed,
 ) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/unique_channel_binding"
 
 ///|
 #unsafe_skip_stub_check
-fn TlsConnectionHandle::server_endpoint_channel_binding(
+fn TlsConnectionHandleRenamed::server_endpoint_channel_binding(
-  self : TlsConnectionHandle,
+  self : TlsConnectionHandleRenamed,
 ) -> @c_buffer.Buffer = "moonbitlang/async" "tls/connection/server_endpoint_channel_binding"
 
 ///|
 struct Tls {
-  conn : TlsConnectionHandle
+  conn : TlsConnectionHandleRenamed
   host : String?
   is_client : Bool
   transport : Transport
@@
 
 ///|
 fn[R : @io.BinaryReader, W : @io.BinaryWriter] Tls::from_pair(
-  conn : TlsConnectionHandle,
+  conn : TlsConnectionHandleRenamed,
   r : R,
   w : W,
   is_client~ : Bool,
@@
     Some(host) => host
     None => ""
   }
-  let conn = TlsConnectionHandle::new()
+  let conn = TlsConnectionHandleRenamed::new()
   let self = Tls::from_pair(conn, r, w, is_client=true, host~)
   errdefer self.close()
   if trust is CustomPemFile(path) {
@@
   certificate_type? : X509FileType,
   pfx_file? : String,
 ) -> Tls {
-  let conn = TlsConnectionHandle::new()
+  let conn = TlsConnectionHandleRenamed::new()
   let self = Tls::from_pair(conn, r, w, is_client=false, host=None)
   errdefer self.close()
   let status = if @event_loop.platform is Windows {
*** End Patch

```
