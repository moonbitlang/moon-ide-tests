# core rename WindowsConsoleBuffer async\internal\event_loop\windows_console.mbt:23:13

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' rename 'WindowsConsoleBuffer' 'WindowsConsoleBufferRenamed' --loc 'async\internal\event_loop\windows_console.mbt:23:13'
*** Begin Patch
*** Update File: <WORKDIR>/async\internal\event_loop\io.mbt
@@
   priv mut write : IoStatus
   /// Similar to `read_offset`, but for the write end of the object.
   mut write_offset : Int64
-  priv mut console_state : WindowsConsoleBuffer
+  priv mut console_state : WindowsConsoleBufferRenamed
 }
 
 ///|
@@
     } else {
       -1
     },
-    console_state: WindowsConsoleBuffer(kind),
+    console_state: WindowsConsoleBufferRenamed(kind),
   }
   evloop.fds[fd] = handle
   handle
*** Update File: <WORKDIR>/async\internal\event_loop\stdio.mbt
@@
       guard! evloop.fds.get(fd) is None
       let kind = kind_of_fd_sync(fd, context~)
       handle.kind = kind
-      handle.console_state = WindowsConsoleBuffer(kind)
+      handle.console_state = WindowsConsoleBufferRenamed(kind)
       evloop.fds[fd] = handle
     },
     exit=() => handle.detach_from_event_loop(),
*** Update File: <WORKDIR>/async\internal\event_loop\windows_console.mbt
@@
 /// Binary IO over Windows console is interpreted as UTF-8,
 /// so we need to perform encoding/decoding before actually invoking
 /// `ReadConsoleW`/`WriteConsoleW`.
-priv struct WindowsConsoleBuffer {
+priv struct WindowsConsoleBufferRenamed {
   buffer : FixedArray[UInt16]
   mut buffer_offset : Int32
   mut buffer_len : Int32
@@
 }
 
 ///|
-let dummy_console_buffer : WindowsConsoleBuffer = {
+let dummy_console_buffer : WindowsConsoleBufferRenamed = {
   buffer: [],
   buffer_offset: 0,
   buffer_len: 0,
@@
 }
 
 ///|
-fn WindowsConsoleBuffer::WindowsConsoleBuffer(
+fn WindowsConsoleBufferRenamed::WindowsConsoleBufferRenamed(
   kind : @fd_util.FileKind,
-) -> WindowsConsoleBuffer {
+) -> WindowsConsoleBufferRenamed {
   if kind is Console && platform is Windows {
     {
       buffer: FixedArray::make(WINDOWS_CONSOLE_BUFFER_SIZE, 0),
@@
 }
 
 ///|
-fn WindowsConsoleBuffer::write_pending(
+fn WindowsConsoleBufferRenamed::write_pending(
-  self : WindowsConsoleBuffer,
+  self : WindowsConsoleBufferRenamed,
   buf : FixedArray[Byte],
   offset~ : Int32,
   len~ : Int32,
@@
 
 ///|
 /// Return the new value of `produced`
-fn WindowsConsoleBuffer::emit_char(
+fn WindowsConsoleBufferRenamed::emit_char(
-  console : WindowsConsoleBuffer,
+  console : WindowsConsoleBufferRenamed,
   char : Int32,
   buf : FixedArray[Byte],
   offset~ : Int32,
@@
 }
 
 ///|
-fn WindowsConsoleBuffer::decode_utf16(
+fn WindowsConsoleBufferRenamed::decode_utf16(
-  console : WindowsConsoleBuffer,
+  console : WindowsConsoleBufferRenamed,
   buf : FixedArray[Byte],
   offset~ : Int32,
   len~ : Int32,
*** Update File: <WORKDIR>/async\internal\event_loop\windows_console_wbtest.mbt
@@
 // limitations under the License.
 
 ///|
-fn console_buffer_for_test(buffer : FixedArray[UInt16]) -> WindowsConsoleBuffer {
+fn console_buffer_for_test(buffer : FixedArray[UInt16]) -> WindowsConsoleBufferRenamed {
   {
     buffer,
     buffer_offset: 0,
*** End Patch
"" (escaped)
```
