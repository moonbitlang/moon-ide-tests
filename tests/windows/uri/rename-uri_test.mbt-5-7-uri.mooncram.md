# uri rename uri uri_test.mbt:5:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\uri' moon ide rename 'uri' 'uri_renamed' --loc 'uri_test.mbt:5:7'
*** Begin Patch
*** Update File: <WORKDIR>/uri_test.mbt
@@
 /// Test basic URI parsing functionality
 test "basic_uri_parsing" {
   // Test simple HTTP URI
-  let uri = @uri.parse("https://example.com/path")
+  let uri_renamed = @uri.parse("https://example.com/path")
-  json_inspect(uri, content={
+  json_inspect(uri_renamed, content={
     "scheme": "https",
     "authority": { "host": "example.com" },
     "path": "/path",
*** End Patch

```
