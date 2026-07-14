# async find-references buf src\pipe\read_exactly_test.mbt:17:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide find-references 'buf' --loc 'src\pipe\read_exactly_test.mbt:17:7'
Found 3 references for symbol 'buf':
<WORKDIR>/src\pipe\read_exactly_test.mbt:17:7-17:10:
   | 
   | ///|
   | async test "read_exactly" {
17 |   let buf = StringBuilder::new()
   |       ^^^
   |   fn log(msg) {
   |     buf..write_string(msg).write_char('\n')

<WORKDIR>/src\pipe\read_exactly_test.mbt:19:5-19:8:
   | async test "read_exactly" {
   |   let buf = StringBuilder::new()
   |   fn log(msg) {
19 |     buf..write_string(msg).write_char('\n')
   |     ^^^
   |   }
   | 

<WORKDIR>/src\pipe\read_exactly_test.mbt:45:5-45:8:
   |     }
   |   }
   |   inspect(
45 |     buf.to_string(),
   |     ^^^
   |     content=(
   |       #|first message sent

```
