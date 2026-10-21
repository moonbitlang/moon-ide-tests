# async find-references unimplemented src\socket\unimplemented.mbt:19:9

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide find-references 'unimplemented' --loc 'src\socket\unimplemented.mbt:19:9' --target js
Found 4 references for symbol 'unimplemented':
<WORKDIR>/src\external_loop_integration\unimplemented_test.mbt:35:18-35:31:
   | #cfg(any(target="js", target="wasm-gc"))
   | let _unused_non_wasm : Unit = {
   |   ignore(@utf8.encode(""))
35 |   ignore(@socket.unimplemented)
   |                  ^^^^^^^^^^^^^
   |   ignore(@pipe.unimplemented)
   | }

<WORKDIR>/src\http\unimplemented.mbt:25:18-25:31:
   |   ignore(() => @string.parse_int("0"))
   |   ignore(@cmp.minimum(0, 0))
   |   ignore(@io.pipe)
25 |   ignore(@socket.unimplemented)
   |                  ^^^^^^^^^^^^^
   |   ignore(@tls.unimplemented)
   |   ignore(@io_buffer.new)

<WORKDIR>/src\tls\unimplemented_test.mbt:20:18-20:31:
   | let _ignore_unused_import : Unit = {
   |   ignore(@utf8.encode(""))
   |   ignore(@async.sleep)
20 |   ignore(@socket.unimplemented)
   |                  ^^^^^^^^^^^^^
   |   ignore((f : async () -> Unit) => @test_util.assert_raise_async(f))
   | }

<WORKDIR>/src\websocket\unimplemented_test.mbt:20:18-20:31:
   | fn init {
   |   ignore(@debug.to_string(0))
   |   ignore(@async.sleep)
20 |   ignore(@socket.unimplemented)
   |                  ^^^^^^^^^^^^^
   |   ignore(@process.unimplemented)
   |   ignore((f : async () -> Unit) => @test_util.assert_raise_async(f))

```
