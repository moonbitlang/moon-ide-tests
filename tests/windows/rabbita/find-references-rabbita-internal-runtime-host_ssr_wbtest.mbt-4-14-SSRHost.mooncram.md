# rabbita find-references SSRHost rabbita\internal\runtime\host_ssr_wbtest.mbt:4:14

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/rabbita' moon ide find-references 'SSRHost' --loc 'rabbita\internal\runtime\host_ssr_wbtest.mbt:4:14' --target native
Found 2 references for symbol 'SSRHost':
<WORKDIR>/rabbita\internal\runtime\host_ssr_wbtest.mbt:4:14-4:21:
  | ///|
  | #cfg(not(target="js"))
  | async test "SSR base URI combines the base and request path without reading base tags" {
4 |   let host = SSRHost(
  |              ^^^^^^^
  |     base_uri="https://example.test/site/",
  |     path="/uml/index.html?lang=en",

<WORKDIR>/rabbita\top.mbt:96:25-96:32:
   | ) -> String {
   |   let (base_uri, path) = split_url(url)
   |   @async.with_timeout(timeout, () => {
96 |     let host = @runtime.SSRHost(base_uri~, path~, () => {
   |                         ^^^^^^^
   |       let output = (self.builder)()
   |       output.0.map(html => html.0)
"" (escaped)
````
