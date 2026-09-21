# uri find-references uri uri_test.mbt:5:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\uri' moon ide find-references 'uri' --loc 'uri_test.mbt:5:7'
Found 1 references for symbol 'uri':
<WORKDIR>/uri_test.mbt:6:16-6:19:
  | test "basic_uri_parsing" {
  |   // Test simple HTTP URI
  |   let uri = @uri.parse("https://example.com/path")
6 |   json_inspect(uri, content={
  |                ^^^
  |     "scheme": "https",
  |     "authority": { "host": "example.com" },

```
