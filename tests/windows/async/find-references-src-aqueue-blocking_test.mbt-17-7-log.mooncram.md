# async find-references log src\aqueue\blocking_test.mbt:17:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide find-references 'log' --loc 'src\aqueue\blocking_test.mbt:17:7'
Found 4 references for symbol 'log':
<WORKDIR>/src\aqueue\blocking_test.mbt:17:7-17:10:
   | 
   | ///|
   | async test "blocking unbuffered" {
17 |   let log = []
   |       ^^^
   |   @async.with_task_group() <| group => {
   |     let q = @async.Queue(kind=Blocking(1))

<WORKDIR>/src\aqueue\blocking_test.mbt:23:9-23:12:
   |     group.spawn_bg() <| () => {
   |       for i in 0..<3 {
   |         q.put(i)
23 |         log.push("put(\{i})")
   |         ^^^
   |       }
   |     }

<WORKDIR>/src\aqueue\blocking_test.mbt:29:9-29:12:
   |     group.spawn_bg() <| () => {
   |       for _ in 0..<3 {
   |         let x = q.get()
29 |         log.push("get() => \{x}")
   |         ^^^
   |         @async.sleep(100)
   |       }

<WORKDIR>/src\aqueue\blocking_test.mbt:34:16-34:19:
   |       }
   |     }
   |   }
34 |   json_inspect(log, content=[
   |                ^^^
   |     "put(0)", "get() => 0", "put(1)", "get() => 1", "put(2)", "get() => 2",
   |   ])

```
