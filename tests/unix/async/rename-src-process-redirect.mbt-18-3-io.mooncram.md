# async rename io src/process/redirect.mbt:18:3

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/async" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide rename 'io' 'io_renamed' --loc 'src/process/redirect.mbt:18:3'
*** Begin Patch
*** Update File: <WORKDIR>/src/process/redirect.mbt
@@
 ///|
 /// A temporary pipe used to read output from a spawned process
 struct ReadFromProcess {
-  io : @event_loop.IoHandle
+  io_renamed : @event_loop.IoHandle
   read_buf : @io.ReaderBuffer
 }
 
@@
   let r = @event_loop.IoHandle::from_fd(r, kind=Pipe)
   let w = @event_loop.IoHandle::from_fd(w, kind=Pipe, is_async=false)
   (
-    { io: r, read_buf: @io.ReaderBuffer::new() },
+    { io_renamed: r, read_buf: @io.ReaderBuffer::new() },
     TempPipeWrite::{ pipe: w, closed: false },
   )
 }
@@
 
 ///|
 pub fn ReadFromProcess::close(self : ReadFromProcess) -> Unit {
-  self.io.close()
+  self.io_renamed.close()
 }
 
 ///|
@@
   offset~,
   max_len~,
 ) {
-  self.io.read(
+  self.io_renamed.read(
     buf,
     offset~,
     len=max_len,
*** End Patch

```
