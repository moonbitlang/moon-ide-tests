# uri find-references uri uri_test.mbt:5:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\uri' moon ide find-references 'uri' --loc 'uri_test.mbt:5:7'
Found 2 references for symbol 'uri':
<WORKDIR>/uri_test.mbt:5:7-5:10:
  | /// Test basic URI parsing functionality
  | test "basic_uri_parsing" {
  |   // Test simple HTTP URI
5 |   let uri = @uri.parse("https://example.com/path")
  |       ^^^
  |   json_inspect(uri, content={
  |     "scheme": "https",

<WORKDIR>/uri_test.mbt:6:16-6:19:
  | test "basic_uri_parsing" {
  |   // Test simple HTTP URI
  |   let uri = @uri.parse("https://example.com/path")
6 |   json_inspect(uri, content={
  |                ^^^
  |     "scheme": "https",
  |     "authority": { "host": "example.com" },

```
