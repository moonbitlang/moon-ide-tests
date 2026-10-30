# uri find-references encoded uri_test_new_features.mbt:5:7

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/uri' moon ide find-references 'encoded' --loc 'uri_test_new_features.mbt:5:7'
Found 1 references for symbol 'encoded':
<WORKDIR>/uri_test_new_features.mbt:6:16-6:23:
  | test "url_encoding" {
  |   // Test basic encoding
  |   let encoded = Uri::encode("hello world!")
6 |   json_inspect(encoded, content="hello%20world%21")
  |                ^^^^^^^
  | 
"  |   // Test unreserved characters (should not be encoded)" (escaped)
"" (escaped)
````
