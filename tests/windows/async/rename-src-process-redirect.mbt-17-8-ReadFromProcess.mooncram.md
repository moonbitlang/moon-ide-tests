# async rename ReadFromProcess src\process\redirect.mbt:17:8

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide rename 'ReadFromProcess' 'ReadFromProcessRenamed' --loc 'src\process\redirect.mbt:17:8'
*** Begin Patch
*** Update File: <WORKDIR>/src\process\redirect.mbt
@@
 
 ///|
 /// A temporary pipe used to read output from a spawned process
-struct ReadFromProcess {
+struct ReadFromProcessRenamed {
   io : @event_loop.IoHandle
   read_buf : @io.ReaderBuffer
 }
@@
 ///
 /// `w` is temporary: it can only be passed to one `@process.run` call.
 /// However, it is safe to pass `w` to both `stdout` and `stderr` of the same process.
-pub fn read_from_process() -> (ReadFromProcess, &ProcessOutput) raise {
+pub fn read_from_process() -> (ReadFromProcessRenamed, &ProcessOutput) raise {
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
*** End Patch

```
