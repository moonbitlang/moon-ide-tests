# core rename decode_utf8_js encoding/utf8/decode_js.mbt:16:16

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
$ run_moon_ide moon ide rename 'decode_utf8_js' 'decode_utf8_js_renamed' --loc 'encoding/utf8/decode_js.mbt:16:16' --target js
*** Begin Patch
*** Update File: <WORKDIR>/encoding/utf8/decode_js.mbt
@@
 // limitations under the License.
 
 ///|
-extern "js" fn decode_utf8_js(
+extern "js" fn decode_utf8_js_renamed(
   bytes : Bytes,
   start : Int32,
   len : Int32,
@@
   bytes : BytesView,
   ignore_bom~ : Bool = false,
 ) -> String raise Malformed {
-  let result = decode_utf8_js(
+  let result = decode_utf8_js_renamed(
     bytes.data(),
     bytes.start_offset(),
     bytes.length(),
*** End Patch

```
