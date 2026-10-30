# async find-references mkfifo src/fs/named_pipe_test.mbt:18:15

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/async' moon ide find-references 'mkfifo' --loc 'src/fs/named_pipe_test.mbt:18:15'
Found 2 references for symbol 'mkfifo':
<WORKDIR>/src/fs/named_pipe_test.mbt:24:6-24:12:
   | #cfg(not(platform="windows"))
   | async test "cancel named fifo open" {
   |   let path = "_build/cancel_open_test"
24 |   if mkfifo(@os_string.encode(path), 0o644) < 0 {
   |      ^^^^^^
   |     @os_error.check_errno("mkfifo")
   |   }

<WORKDIR>/src/fs/named_pipe_test.mbt:60:8-60:14:
   | async test "named fifo" {
   |   @async.with_task_group() <| group => {
   |     let path = "_build/named_pipe_test"
60 |     if mkfifo(@os_string.encode(path), 0o644) < 0 {
   |        ^^^^^^
   |       @os_error.check_errno("mkfifo")
   |     }
"" (escaped)
````
