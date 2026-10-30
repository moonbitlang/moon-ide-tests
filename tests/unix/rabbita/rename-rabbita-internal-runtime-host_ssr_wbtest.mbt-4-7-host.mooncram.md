# rabbita rename host rabbita/internal/runtime/host_ssr_wbtest.mbt:4:7

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/rabbita' moon ide rename 'host' 'host_renamed' --loc 'rabbita/internal/runtime/host_ssr_wbtest.mbt:4:7' --target native
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
"" (escaped)
````
