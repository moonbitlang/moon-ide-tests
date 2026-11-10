# core rename input compress/flate/inflate_fast_wbtest.mbt:23:3

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
$ run_moon_ide moon ide rename 'input' 'input_renamed' --loc 'compress/flate/inflate_fast_wbtest.mbt:23:3'
*** Begin Patch
*** Update File: <WORKDIR>/compress/flate/inflate_fast_wbtest.mbt
@@
 
 ///|
 fn fast_stream_run(
-  input : Bytes,
+  input_renamed : Bytes,
   chunk : Int32,
   room : Int32,
   fixed : Bool,
@@
   let decoded = @buffer.Buffer()
   let mut position = 0
   for ;; {
-    let end = (position + chunk).min(input.length())
+    let end = (position + chunk).min(input_renamed.length())
-    let status_result = inflater.step(input[position:end], output) catch {
+    let status_result = inflater.step(input_renamed[position:end], output) catch {
       InflateError(kind, _) => return Err(kind)
     }
     let status = status_result.status
-    if status is NeedMoreInput && end == input.length() {
+    if status is NeedMoreInput && end == input_renamed.length() {
       return Err(Truncated)
     }
     position += status_result.consumed
*** End Patch

```
