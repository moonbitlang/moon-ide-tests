# uri find-references uri uri_test.mbt:5:7

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/uri' moon ide find-references 'uri' --loc 'uri_test.mbt:5:7'
Found 1 references for symbol 'uri':
<WORKDIR>/uri_test.mbt:6:16-6:19:
"  | test \"basic_uri_parsing\" {" (escaped)
"  |   // Test simple HTTP URI" (escaped)
"  |   let uri = @uri.parse(\"https://example.com/path\")" (escaped)
"6 |   json_inspect(uri, content={" (escaped)
"  |                ^^^" (escaped)
"  |     \"scheme\": \"https\"," (escaped)
"  |     \"authority\": { \"host\": \"example.com\" }," (escaped)
"" (escaped)
````
