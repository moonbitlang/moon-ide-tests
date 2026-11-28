# core find-references WindowsConsoleBuffer async\internal\event_loop\windows_console.mbt:23:13

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' find-references 'WindowsConsoleBuffer' --loc 'async\internal\event_loop\windows_console.mbt:23:13'
Found 14 references for symbol 'WindowsConsoleBuffer':
<WORKDIR>/async\internal\event_loop\io.mbt:47:28-47:48:
   |   priv mut write : IoStatus
   |   /// Similar to `read_offset`, but for the write end of the object.
   |   mut write_offset : Int64
47 |   priv mut console_state : WindowsConsoleBuffer
   |                            ^^^^^^^^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/async\internal\event_loop\io.mbt:132:20-132:40:
    |     } else {
    |       -1
    |     },
132 |     console_state: WindowsConsoleBuffer(kind),
    |                    ^^^^^^^^^^^^^^^^^^^^
    |   }
    |   evloop.fds[fd] = handle

<WORKDIR>/async\internal\event_loop\stdio.mbt:112:30-112:50:
    |       guard! evloop.fds.get(fd) is None
    |       let kind = kind_of_fd_sync(fd, context~)
    |       handle.kind = kind
112 |       handle.console_state = WindowsConsoleBuffer(kind)
    |                              ^^^^^^^^^^^^^^^^^^^^
    |       evloop.fds[fd] = handle
    |     },

<WORKDIR>/async\internal\event_loop\windows_console.mbt:50:28-50:48:
   | }
   | 
   | ///|
50 | let dummy_console_buffer : WindowsConsoleBuffer = {
   |                            ^^^^^^^^^^^^^^^^^^^^
   |   buffer: [],
   |   buffer_offset: 0,

<WORKDIR>/async\internal\event_loop\windows_console.mbt:61:4-61:24:
   | }
   | 
   | ///|
61 | fn WindowsConsoleBuffer::WindowsConsoleBuffer(
   |    ^^^^^^^^^^^^^^^^^^^^
   |   kind : @fd_util.FileKind,
   | ) -> WindowsConsoleBuffer {

<WORKDIR>/async\internal\event_loop\windows_console.mbt:61:26-61:46:
   | }
   | 
   | ///|
61 | fn WindowsConsoleBuffer::WindowsConsoleBuffer(
   |                          ^^^^^^^^^^^^^^^^^^^^
   |   kind : @fd_util.FileKind,
   | ) -> WindowsConsoleBuffer {

<WORKDIR>/async\internal\event_loop\windows_console.mbt:63:6-63:26:
   | ///|
   | fn WindowsConsoleBuffer::WindowsConsoleBuffer(
   |   kind : @fd_util.FileKind,
63 | ) -> WindowsConsoleBuffer {
   |      ^^^^^^^^^^^^^^^^^^^^
   |   if kind is Console && platform is Windows {
   |     {

<WORKDIR>/async\internal\event_loop\windows_console.mbt:80:4-80:24:
   | }
   | 
   | ///|
80 | fn WindowsConsoleBuffer::write_pending(
   |    ^^^^^^^^^^^^^^^^^^^^
   |   self : WindowsConsoleBuffer,
   |   buf : FixedArray[Byte],

<WORKDIR>/async\internal\event_loop\windows_console.mbt:81:10-81:30:
   | 
   | ///|
   | fn WindowsConsoleBuffer::write_pending(
81 |   self : WindowsConsoleBuffer,
   |          ^^^^^^^^^^^^^^^^^^^^
   |   buf : FixedArray[Byte],
   |   offset~ : Int32,

<WORKDIR>/async\internal\event_loop\windows_console.mbt:125:4-125:24:
    | 
    | ///|
    | /// Return the new value of `produced`
125 | fn WindowsConsoleBuffer::emit_char(
    |    ^^^^^^^^^^^^^^^^^^^^
    |   console : WindowsConsoleBuffer,
    |   char : Int32,

<WORKDIR>/async\internal\event_loop\windows_console.mbt:126:13-126:33:
    | ///|
    | /// Return the new value of `produced`
    | fn WindowsConsoleBuffer::emit_char(
126 |   console : WindowsConsoleBuffer,
    |             ^^^^^^^^^^^^^^^^^^^^
    |   char : Int32,
    |   buf : FixedArray[Byte],

<WORKDIR>/async\internal\event_loop\windows_console.mbt:151:4-151:24:
    | }
    | 
    | ///|
151 | fn WindowsConsoleBuffer::decode_utf16(
    |    ^^^^^^^^^^^^^^^^^^^^
    |   console : WindowsConsoleBuffer,
    |   buf : FixedArray[Byte],

<WORKDIR>/async\internal\event_loop\windows_console.mbt:152:13-152:33:
    | 
    | ///|
    | fn WindowsConsoleBuffer::decode_utf16(
152 |   console : WindowsConsoleBuffer,
    |             ^^^^^^^^^^^^^^^^^^^^
    |   buf : FixedArray[Byte],
    |   offset~ : Int32,

<WORKDIR>/async\internal\event_loop\windows_console_wbtest.mbt:16:60-16:80:
   | // limitations under the License.
   | 
   | ///|
16 | fn console_buffer_for_test(buffer : FixedArray[UInt16]) -> WindowsConsoleBuffer {
   |                                                            ^^^^^^^^^^^^^^^^^^^^
   |   {
   |     buffer,
"" (escaped)
```
