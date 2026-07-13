# async find-references ReadFromProcess src\process\redirect.mbt:17:8

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide find-references 'ReadFromProcess' --loc 'src\process\redirect.mbt:17:8'
Found 6 references for symbol 'ReadFromProcess':
<WORKDIR>/src\process\redirect.mbt:17:8-17:23:
   | 
   | ///|
   | /// A temporary pipe used to read output from a spawned process
17 | struct ReadFromProcess {
   |        ^^^^^^^^^^^^^^^
   |   io : @event_loop.IoHandle
   |   read_buf : @io.ReaderBuffer

<WORKDIR>/src\process\redirect.mbt:34:32-34:47:
   | ///
   | /// `w` is temporary: it can only be passed to one `@process.run` call.
   | /// However, it is safe to pass `w` to both `stdout` and `stderr` of the same process.
34 | pub fn read_from_process() -> (ReadFromProcess, &ProcessOutput) raise {
   |                                ^^^^^^^^^^^^^^^
   |   let context = "@process.read_from_process()"
   |   let (r, w) = @fd_util.pipe(

<WORKDIR>/src\process\redirect.mbt:67:8-67:23:
   | }
   | 
   | ///|
67 | pub fn ReadFromProcess::close(self : ReadFromProcess) -> Unit {
   |        ^^^^^^^^^^^^^^^
   |   self.io.close()
   | }

<WORKDIR>/src\process\redirect.mbt:67:38-67:53:
   | }
   | 
   | ///|
67 | pub fn ReadFromProcess::close(self : ReadFromProcess) -> Unit {
   |                                      ^^^^^^^^^^^^^^^
   |   self.io.close()
   | }

<WORKDIR>/src\process\redirect.mbt:72:25-72:40:
   | }
   | 
   | ///|
72 | pub impl @io.Reader for ReadFromProcess with fn _get_internal_buffer(self) {
   |                         ^^^^^^^^^^^^^^^
   |   self.read_buf
   | }

<WORKDIR>/src\process\redirect.mbt:77:25-77:40:
   | }
   | 
   | ///|
77 | pub impl @io.Reader for ReadFromProcess with fn _direct_read(
   |                         ^^^^^^^^^^^^^^^
   |   self,
   |   buf,

```
