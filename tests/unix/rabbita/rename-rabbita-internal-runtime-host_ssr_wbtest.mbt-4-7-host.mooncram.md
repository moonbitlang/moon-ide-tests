# rabbita rename host rabbita/internal/runtime/host_ssr_wbtest.mbt:4:7

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/rabbita" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide rename 'host' 'host_renamed' --loc 'rabbita/internal/runtime/host_ssr_wbtest.mbt:4:7' --target native
*** Begin Patch
*** Update File: <WORKDIR>/rabbita/internal/runtime/host_ssr_wbtest.mbt
@@
 ///|
 #cfg(not(target="js"))
 async test "SSR base URI combines the base and request path without reading base tags" {
-  let host = SSRHost(
+  let host_renamed = SSRHost(
     base_uri="https://example.test/site/",
     path="/uml/index.html?lang=en",
     () => {
@@
       )
     },
   )
-  defer host.cleanup()
+  defer host_renamed.cleanup()
   assert_eq(
-    host.get_base_uri(),
+    host_renamed.get_base_uri(),
     "https://example.test/site/uml/index.html?lang=en",
   )
 }
*** End Patch

```
