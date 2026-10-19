# async find-references parse_int src\socket\unimplemented.mbt:20:24

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide find-references 'parse_int' --loc 'src\socket\unimplemented.mbt:20:24' --target js
Found 3 references for symbol 'parse_int':
<WORKDIR>/src\http\unimplemented.mbt:22:24-22:33:
   | pub let unimplemented : Unit = {
   |   let _ : (@buffer.Buffer) -> Unit = ignore
   |   ignore(@int.MAX_VALUE)
22 |   ignore(() => @string.parse_int("0"))
   |                        ^^^^^^^^^
   |   ignore(@cmp.minimum(0, 0))
   |   ignore(@io.pipe)

<WORKDIR>/src\process\unimplemented_test.mbt:19:24-19:33:
   | #cfg(not(any(target="native", target="wasm")))
   | let _unimplemented : Unit = {
   |   ignore(@env.get_env_var)
19 |   ignore(() => @string.parse_int("0"))
   |                        ^^^^^^^^^
   |   ignore(@fs.unimplemented)
   |   ignore(@utf8.encode(""))

<WORKDIR>/src\socket\unimplemented.mbt:20:24-20:33:
   | #cfg(not(any(target="native", target="wasm")))
   | #coverage.skip
   | pub let unimplemented : Unit = {
20 |   ignore(() => @string.parse_int("0"))
   |                        ^^^^^^^^^
   |   ignore(@io.pipe)
   |   ignore(@event_loop.Timer::new)

```
