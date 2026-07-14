# sqlparser find-references obj src\show.mbt:2:34

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide find-references 'obj' --loc 'src\show.mbt:2:34'
Found 2 references for symbol 'obj':
<WORKDIR>/src\show.mbt:2:34-2:37:
  | ///|
2 | fn[T : Debug] show_compact_debug(obj : T, logger : &Logger) -> Unit {
  |                                  ^^^
  |   let input = @debug.to_string(obj)
  |   let buffer = StringBuilder::new()

<WORKDIR>/src\show.mbt:3:32-3:35:
  | ///|
  | fn[T : Debug] show_compact_debug(obj : T, logger : &Logger) -> Unit {
3 |   let input = @debug.to_string(obj)
  |                                ^^^
  |   let buffer = StringBuilder::new()
  |   let mut in_string = false

```
