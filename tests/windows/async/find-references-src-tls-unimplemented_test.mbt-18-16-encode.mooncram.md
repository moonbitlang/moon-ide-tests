# async find-references encode src\tls\unimplemented_test.mbt:18:16

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide find-references 'encode' --loc 'src\tls\unimplemented_test.mbt:18:16' --target js
Found 19 references for symbol 'encode':
<WORKDIR>/src\external_loop_integration\unimplemented_test.mbt:34:16-34:22:
   | ///|
   | #cfg(any(target="js", target="wasm-gc"))
   | let _unused_non_wasm : Unit = {
34 |   ignore(@utf8.encode(""))
   |                ^^^^^^
   |   ignore(@socket.unimplemented)
   |   ignore(@pipe.unimplemented)

<WORKDIR>/src\fs\unimplemented_test.mbt:18:16-18:22:
   | ///|
   | #cfg(not(any(target="native", target="wasm")))
   | let _ignore_unused_import : Unit = {
18 |   ignore(@utf8.encode(""))
   |                ^^^^^^
   |   ignore(@debug.to_string(0))
   |   ignore(@env.get_env_var)

<WORKDIR>/src\http\unimplemented_test.mbt:20:16-20:22:
   | let _ignore_unused_import : Unit = {
   |   ignore(@debug.to_string(0))
   |   ignore(@async.sleep)
20 |   ignore(@utf8.encode(""))
   |                ^^^^^^
   |   ignore((_ : @gzip_stream.Encoder[&@io.Writer]) => ())
   |   ignore(@fs.unimplemented)

<WORKDIR>/src\http\unimplemented_wbtest.mbt:24:16-24:22:
   |   ignore(@async.sleep)
   |   ignore(@fs.unimplemented)
   |   ignore(@bytes_util.ascii_to_string)
24 |   ignore(@utf8.encode(""))
   |                ^^^^^^
   |   ignore((f : async () -> Unit) => @test_util.assert_raise_async(f))
   | }

<WORKDIR>/src\internal\event_loop\event_loop.js.mbt:27:16-27:22:
   |   ignore(@os_error.unimplemented)
   |   let _ : (&@external_loop_integration.ExternalEventLoop) -> Unit = ignore
   |   ignore((_ : @env_util.Platform) => ())
27 |   ignore(@utf8.encode(""))
   |                ^^^^^^
   | }
   | 

<WORKDIR>/src\internal\event_loop\unimplemented_test.mbt:20:16-20:22:
   | let _ignore_unused_import : Unit = {
   |   ignore(@async.sleep)
   |   ignore(@fs.unimplemented)
20 |   ignore(@utf8.encode(""))
   |                ^^^^^^
   |   ignore(@io.Encoding::UTF8)
   | }

<WORKDIR>/src\internal\os_string\unimplemented.mbt:21:16-21:22:
   | #coverage.skip
   | pub let unimplemented : Unit = {
   |   ignore(@c_buffer.unimplemented)
21 |   ignore(@utf8.encode(""))
   |                ^^^^^^
   | }
   | 

<WORKDIR>/src\io\data.mbt:50:9-50:15:
   | 
   | ///|
   | pub impl Data for String with fn to_bytes(self) {
50 |   @utf8.encode(self)
   |         ^^^^^^
   | }
   | 

<WORKDIR>/src\io\data.mbt:55:9-55:15:
   | 
   | ///|
   | pub impl Data for StringView with fn to_bytes(self) {
55 |   @utf8.encode(self)
   |         ^^^^^^
   | }
   | 

<WORKDIR>/src\io\data.mbt:60:9-60:15:
   | 
   | ///|
   | pub impl Data for Json with fn to_bytes(self) {
60 |   @utf8.encode(self.stringify())
   |         ^^^^^^
   | }
   | 

<WORKDIR>/src\io\reader.mbt:220:19-220:25:
    | /// The segment of input from start of reader to start of `sep` or EOF is returned.
    | /// `sep` will be conusmed from the input, but is not included in the return value.
    | impl Reader with fn read_until(self, sep) {
220 |   let sep = @utf8.encode(sep)
    |                   ^^^^^^
    |   let buf = self._get_internal_buffer()
    |   match buf.find_opt(sep, reader=self) {

<WORKDIR>/src\js_async\unimplemented_test.mbt:19:16-19:22:
   | #coverage.skip
   | let _ignore_unused_import : Unit = {
   |   ignore(@async.sleep)
19 |   ignore(@utf8.encode(""))
   |                ^^^^^^
   |   ignore((f : async () -> Unit) => @test_util.assert_raise_async(f))
   | }

<WORKDIR>/src\pipe\unimplemented_test.mbt:19:16-19:22:
   | #cfg(not(target="native"))
   | let _ignore_unused_import : Unit = {
   |   ignore(@async.sleep)
19 |   ignore(@utf8.encode(""))
   |                ^^^^^^
   |   ignore((f : async () -> Unit) => @test_util.assert_raise_async(f))
   | }

<WORKDIR>/src\process\unimplemented_test.mbt:21:16-21:22:
   |   ignore(@env.get_env_var)
   |   ignore(() => @string.parse_int("0"))
   |   ignore(@fs.unimplemented)
21 |   ignore(@utf8.encode(""))
   |                ^^^^^^
   |   ignore((f : async () -> Unit) => @test_util.assert_raise_async(f))
   | }

<WORKDIR>/src\signal\unimplemented_test.mbt:18:16-18:22:
   | ///|
   | #cfg(not(any(target="native", target="wasm")))
   | let _ignore_unused_import : Unit = {
18 |   ignore(@utf8.encode(""))
   |                ^^^^^^
   |   ignore(@async.sleep)
   |   ignore(@process.unimplemented)

<WORKDIR>/src\socket\unimplemented_test.mbt:20:16-20:22:
   | let _ignore_unused_import : Unit = {
   |   ignore(@debug.to_string(0))
   |   ignore(() => @test.assert_raise(() => ()))
20 |   ignore(@utf8.encode(""))
   |                ^^^^^^
   |   ignore((f : async () -> Unit) => @test_util.assert_raise_async(f))
   | }

<WORKDIR>/src\tls\unimplemented.mbt:30:16-30:22:
   |   ignore(@semaphore.Semaphore::acquire)
   |   ignore(@os_string.unimplemented)
   |   ignore(@os_error.unimplemented)
30 |   ignore(@utf8.encode(""))
   |                ^^^^^^
   |   ignore(@fs.unimplemented)
   | }

<WORKDIR>/src\tls\unimplemented_test.mbt:18:16-18:22:
   | ///|
   | #cfg(not(any(target="native", target="wasm")))
   | let _ignore_unused_import : Unit = {
18 |   ignore(@utf8.encode(""))
   |                ^^^^^^
   |   ignore(@async.sleep)
   |   ignore(@socket.unimplemented)

<WORKDIR>/src\websocket\unimplemented.mbt:28:16-28:22:
   |   ignore(@tls.unimplemented)
   |   ignore(@http.unimplemented)
   |   ignore(@coroutine.Coroutine::wake)
28 |   ignore(@utf8.encode(""))
   |                ^^^^^^
   | }

```
