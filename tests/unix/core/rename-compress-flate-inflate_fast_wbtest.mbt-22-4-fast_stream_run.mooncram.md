# core rename fast_stream_run compress/flate/inflate_fast_wbtest.mbt:22:4

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/core" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide rename 'fast_stream_run' 'fast_stream_run_renamed' --loc 'compress/flate/inflate_fast_wbtest.mbt:22:4'
*** Begin Patch
*** Update File: <WORKDIR>/compress/flate/inflate_fast_wbtest.mbt
@@
 // same verdict on damaged streams.
 
 ///|
-fn fast_stream_run(
+fn fast_stream_run_renamed(
   input : Bytes,
   chunk : Int32,
   room : Int32,
@@
         ] {
         let (chunk, room, fixed) = schedule
         @test.assert_eq(
-          fast_stream_run(stream, chunk, room, fixed),
+          fast_stream_run_renamed(stream, chunk, room, fixed),
           Err(Corrupt),
         )
       }
*** End Patch

```
