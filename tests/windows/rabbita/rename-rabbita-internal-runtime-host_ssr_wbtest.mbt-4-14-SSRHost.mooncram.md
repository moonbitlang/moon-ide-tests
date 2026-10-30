# rabbita rename SSRHost rabbita\internal\runtime\host_ssr_wbtest.mbt:4:14

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/rabbita' moon ide rename 'SSRHost' 'SSRHostRenamed' --loc 'rabbita\internal\runtime\host_ssr_wbtest.mbt:4:14' --target native
*** Begin Patch
*** Update File: <WORKDIR>/rabbita\internal\runtime\host_ssr.mbt
@@
 }
 
 ///|
-pub async fn SSRHost::SSRHost(
+pub async fn SSRHost::SSRHostRenamed(
   base_uri~ : String,
   path~ : String,
   builder : GraphBuilder,
*** Update File: <WORKDIR>/rabbita\internal\runtime\host_ssr_wbtest.mbt
@@
 ///|
 #cfg(not(target="js"))
 async test "SSR base URI combines the base and request path without reading base tags" {
-  let host = SSRHost(
+  let host = SSRHostRenamed(
     base_uri="https://example.test/site/",
     path="/uml/index.html?lang=en",
     () => {
*** Update File: <WORKDIR>/rabbita\top.mbt
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
"" (escaped)
````
