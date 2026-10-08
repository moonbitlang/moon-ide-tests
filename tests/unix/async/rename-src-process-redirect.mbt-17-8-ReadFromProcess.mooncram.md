# async rename ReadFromProcess src/process/redirect.mbt:17:8

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
$ run_moon_ide moon ide rename 'ReadFromProcess' 'ReadFromProcessRenamed' --loc 'src/process/redirect.mbt:17:8'
*** Begin Patch
*** Update File: <WORKDIR>/src/process/redirect.mbt
@@
 
 ///|
 /// A temporary pipe used to read output from a spawned process
-struct ReadFromProcess {
+struct ReadFromProcessRenamed {
   io : @event_loop.IoHandle
   read_buf : @io.ReaderBuffer
 }
@@
 /// the read end `r` will fail to observe EOF from children process.
 pub fn read_from_process(
   shared? : Bool = false,
-) -> (ReadFromProcess, &ProcessOutput) raise {
+) -> (ReadFromProcessRenamed, &ProcessOutput) raise {
   let context = "@process.read_from_process()"
   let (r, w) = @fd_util.pipe(
     read_end_is_async=true,
@@
 }
 
 ///|
-pub fn ReadFromProcess::close(self : ReadFromProcess) -> Unit {
+pub fn ReadFromProcessRenamed::close(self : ReadFromProcessRenamed) -> Unit {
   self.io.close()
 }
 
 ///|
-pub impl @io.Reader for ReadFromProcess with fn _get_internal_buffer(self) {
+pub impl @io.Reader for ReadFromProcessRenamed with fn _get_internal_buffer(self) {
   self.read_buf
 }
 
 ///|
-pub impl @io.Reader for ReadFromProcess with fn _direct_read(
+pub impl @io.Reader for ReadFromProcessRenamed with fn _direct_read(
   self,
   buf,
   offset~,
@@
 }
 
 ///|
-pub extend ReadFromProcess with @io.Reader::{
+pub extend ReadFromProcessRenamed with @io.Reader::{
   read,
   drop,
   read_exactly,
*** Update File: <WORKDIR>/src/shell/execute.mbt
@@
 
 ///|
 async fn read_bounded(
-  reader : @process.ReadFromProcess,
+  reader : @process.ReadFromProcessRenamed,
   captured : Ref[Int],
   limit : Int,
   stream : String,
@@
 /// bound. A CRLF terminator's CR is punctuation, not content, and so does not
 /// consume the line's allowance.
 async fn read_lines(
-  reader : @process.ReadFromProcess,
+  reader : @process.ReadFromProcessRenamed,
   on_line : async (String) -> Unit,
   limit : Int,
 ) -> Unit {
*** End Patch

```
