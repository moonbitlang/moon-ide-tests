# core find-references WindowsConsoleBuffer async/internal/event_loop/windows_console.mbt:23:13

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' find-references 'WindowsConsoleBuffer' --loc 'async/internal/event_loop/windows_console.mbt:23:13'
Found 9 references for symbol 'WindowsConsoleBuffer':
<WORKDIR>/async/internal/event_loop/io.mbt:47:28-47:48:
   |   priv mut write : IoStatus
   |   /// Similar to `read_offset`, but for the write end of the object.
   |   mut write_offset : Int64
47 |   priv mut console_state : WindowsConsoleBuffer
   |                            ^^^^^^^^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/async/internal/event_loop/io.mbt:129:20-129:40:
    |     } else {
    |       -1
    |     },
129 |     console_state: WindowsConsoleBuffer(kind),
    |                    ^^^^^^^^^^^^^^^^^^^^
    |   }
    |   evloop.fds[fd] = handle

<WORKDIR>/async/internal/event_loop/stdio.mbt:112:30-112:50:
    |       guard! evloop.fds.get(fd) is None
    |       let kind = kind_of_fd_sync(fd, context~)
    |       handle.kind = kind
112 |       handle.console_state = WindowsConsoleBuffer(kind)
    |                              ^^^^^^^^^^^^^^^^^^^^
    |       evloop.fds[fd] = handle
    |     },

<WORKDIR>/async/internal/event_loop/windows_console.mbt:39:28-39:48:
   | }
   | 
   | ///|
39 | let dummy_console_buffer : WindowsConsoleBuffer = {
   |                            ^^^^^^^^^^^^^^^^^^^^
   |   buffer: [],
   |   unpaired_surrogate: 0,

<WORKDIR>/async/internal/event_loop/windows_console.mbt:47:4-47:24:
   | }
   | 
   | ///|
47 | fn WindowsConsoleBuffer::WindowsConsoleBuffer(
   |    ^^^^^^^^^^^^^^^^^^^^
   |   kind : @fd_util.FileKind,
   | ) -> WindowsConsoleBuffer {

<WORKDIR>/async/internal/event_loop/windows_console.mbt:47:26-47:46:
   | }
   | 
   | ///|
47 | fn WindowsConsoleBuffer::WindowsConsoleBuffer(
   |                          ^^^^^^^^^^^^^^^^^^^^
   |   kind : @fd_util.FileKind,
   | ) -> WindowsConsoleBuffer {

<WORKDIR>/async/internal/event_loop/windows_console.mbt:49:6-49:26:
   | ///|
   | fn WindowsConsoleBuffer::WindowsConsoleBuffer(
   |   kind : @fd_util.FileKind,
49 | ) -> WindowsConsoleBuffer {
   |      ^^^^^^^^^^^^^^^^^^^^
   |   if kind is Console && platform is Windows {
   |     {

<WORKDIR>/async/internal/event_loop/windows_console.mbt:63:4-63:24:
   | }
   | 
   | ///|
63 | fn WindowsConsoleBuffer::write_pending(
   |    ^^^^^^^^^^^^^^^^^^^^
   |   self : WindowsConsoleBuffer,
   |   buf : FixedArray[Byte],

<WORKDIR>/async/internal/event_loop/windows_console.mbt:64:10-64:30:
   | 
   | ///|
   | fn WindowsConsoleBuffer::write_pending(
64 |   self : WindowsConsoleBuffer,
   |          ^^^^^^^^^^^^^^^^^^^^
   |   buf : FixedArray[Byte],
   |   offset~ : Int32,
"" (escaped)
```
