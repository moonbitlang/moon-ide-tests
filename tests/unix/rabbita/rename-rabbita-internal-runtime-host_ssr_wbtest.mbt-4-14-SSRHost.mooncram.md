# rabbita rename SSRHost rabbita/internal/runtime/host_ssr_wbtest.mbt:4:14

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
$ run_moon_ide moon ide rename 'SSRHost' 'SSRHostRenamed' --loc 'rabbita/internal/runtime/host_ssr_wbtest.mbt:4:14' --target native
*** Begin Patch
*** Update File: <WORKDIR>/rabbita/internal/runtime/host_ssr.mbt
@@
 }
 
 ///|
-pub async fn SSRHost::SSRHost(
+pub async fn SSRHost::SSRHostRenamed(
   base_uri~ : String,
   path~ : String,
   builder : GraphBuilder,
*** Update File: <WORKDIR>/rabbita/internal/runtime/host_ssr_wbtest.mbt
@@
 ///|
 #cfg(not(target="js"))
 async test "SSR base URI combines the base and request path without reading base tags" {
-  let host = SSRHost(
+  let host = SSRHostRenamed(
     base_uri="https://example.test/site/",
     path="/uml/index.html?lang=en",
     () => {
*** Update File: <WORKDIR>/rabbita/top.mbt
@@
 ) -> String {
   let (base_uri, path) = split_url(url)
   @async.with_timeout(timeout, () => {
-    let host = @runtime.SSRHost(base_uri~, path~, () => {
+    let host = @runtime.SSRHostRenamed(base_uri~, path~, () => {
       let output = (self.builder)()
       output.0.map(html => html.0)
     })
*** End Patch

```
