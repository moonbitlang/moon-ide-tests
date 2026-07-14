# uri rename encoded uri_test_new_features.mbt:5:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\uri' moon ide rename 'encoded' 'encoded_renamed' --loc 'uri_test_new_features.mbt:5:7'
*** Begin Patch
*** Update File: <WORKDIR>/uri_test_new_features.mbt
@@
 /// Test URL encoding functionality
 test "url_encoding" {
   // Test basic encoding
-  let encoded = Uri::encode("hello world!")
+  let encoded_renamed = Uri::encode("hello world!")
-  json_inspect(encoded, content="hello%20world%21")
+  json_inspect(encoded_renamed, content="hello%20world%21")
 
   // Test unreserved characters (should not be encoded) (escaped)
   let unreserved = "hello-world_123.test~"
*** End Patch

```
