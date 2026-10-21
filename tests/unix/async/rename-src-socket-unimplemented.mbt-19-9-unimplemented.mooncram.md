# async rename unimplemented src/socket/unimplemented.mbt:19:9

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/async" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide rename 'unimplemented' 'unimplemented_renamed' --loc 'src/socket/unimplemented.mbt:19:9' --target js
*** Begin Patch
*** Update File: <WORKDIR>/src/external_loop_integration/unimplemented_test.mbt
@@
 #cfg(any(target="js", target="wasm-gc"))
 let _unused_non_wasm : Unit = {
   ignore(@utf8.encode(""))
-  ignore(@socket.unimplemented)
+  ignore(@socket.unimplemented_renamed)
   ignore(@pipe.unimplemented)
 }
*** Update File: <WORKDIR>/src/http/unimplemented.mbt
@@
   ignore(() => @string.parse_int("0"))
   ignore(@cmp.minimum(0, 0))
   ignore(@io.pipe)
-  ignore(@socket.unimplemented)
+  ignore(@socket.unimplemented_renamed)
   ignore(@tls.unimplemented)
   ignore(@io_buffer.new)
   ignore(@gzip.Decoder::is_finished)
*** Update File: <WORKDIR>/src/socket/unimplemented.mbt
@@
 /// This package currently does not support JavaScript backend
 #cfg(not(any(target="native", target="wasm")))
 #coverage.skip
-pub let unimplemented : Unit = {
+pub let unimplemented_renamed : Unit = {
   ignore(() => @string.parse_int("0"))
   ignore(@io.pipe)
   ignore(@event_loop.Timer::new)
*** Update File: <WORKDIR>/src/tls/unimplemented_test.mbt
@@
 let _ignore_unused_import : Unit = {
   ignore(@utf8.encode(""))
   ignore(@async.sleep)
-  ignore(@socket.unimplemented)
+  ignore(@socket.unimplemented_renamed)
   ignore((f : async () -> Unit) => @test_util.assert_raise_async(f))
 }
 
*** Update File: <WORKDIR>/src/websocket/unimplemented_test.mbt
@@
 fn init {
   ignore(@debug.to_string(0))
   ignore(@async.sleep)
-  ignore(@socket.unimplemented)
+  ignore(@socket.unimplemented_renamed)
   ignore(@process.unimplemented)
   ignore((f : async () -> Unit) => @test_util.assert_raise_async(f))
 }
*** End Patch

```
