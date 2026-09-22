# async find-references io src\process\redirect.mbt:18:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide find-references 'io' --loc 'src\process\redirect.mbt:18:3'
Found 3 references for symbol 'io':
<WORKDIR>/src\process\redirect.mbt:60:7-60:9:
   |   let r = @event_loop.IoHandle::from_fd(r, kind=Pipe)
   |   let w = @event_loop.IoHandle::from_fd(w, kind=Pipe, is_async=false)
   |   (
60 |     { io: r, read_buf: @io.ReaderBuffer::new(), },
   |       ^^
   |     TempPipeWrite::{ pipe: w, shared, closed: false, },
   |   )

<WORKDIR>/src\process\redirect.mbt:102:8-102:10:
    | 
    | ///|
    | pub fn ReadFromProcess::close(self : ReadFromProcess) -> Unit {
102 |   self.io.close()
    |        ^^
    | }
    | 

<WORKDIR>/src\process\redirect.mbt:117:8-117:10:
    |   offset~,
    |   max_len~,
    | ) {
117 |   self.io.read(
    |        ^^
    |     buf,
    |     offset~,

```
