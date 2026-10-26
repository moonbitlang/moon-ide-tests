# core rename WindowsConsoleBuffer async/internal/event_loop/windows_console.mbt:23:13

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
$ run_moon_ide moon ide rename 'WindowsConsoleBuffer' 'WindowsConsoleBufferRenamed' --loc 'async/internal/event_loop/windows_console.mbt:23:13'
*** Begin Patch
*** Update File: <WORKDIR>/async/internal/event_loop/io.mbt
@@
   priv mut write : IoStatus
   /// Similar to `read_offset`, but for the write end of the object.
   mut write_offset : Int64
-  priv console_state : WindowsConsoleBuffer
+  priv console_state : WindowsConsoleBufferRenamed
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
*** Update File: <WORKDIR>/async/internal/event_loop/stdio.mbt
@@
     read_offset: -1,
     write: Idle,
     write_offset: -1,
-    console_state: WindowsConsoleBuffer(kind),
+    console_state: WindowsConsoleBufferRenamed(kind),
   }
   stdio_handles[fd] = handle
   register_hook(
*** Update File: <WORKDIR>/async/internal/event_loop/windows_console.mbt
@@
 /// Binary IO over Windows console is interpreted as UTF-8,
 /// so we need to perform encoding/decoding before actually invoking
 /// `ReadConsoleW`/`WriteConsoleW`.
-priv struct WindowsConsoleBuffer {
+priv struct WindowsConsoleBufferRenamed {
   buffer : FixedArray[UInt16]
   /// For console input: unpaired high surrogate from the last read.
   /// Zero if there is no unpaired surrogate.
@@
 }
 
 ///|
-let dummy_console_buffer : WindowsConsoleBuffer = {
+let dummy_console_buffer : WindowsConsoleBufferRenamed = {
   buffer: [],
   unpaired_surrogate: 0,
   pending: [],
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
*** End Patch

```
