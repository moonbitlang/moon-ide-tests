# core find-references decode_utf8_js encoding/utf8/decode_js.mbt:16:16

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide find-references 'decode_utf8_js' --loc 'encoding/utf8/decode_js.mbt:16:16' --target js
Found 1 references for symbol 'decode_utf8_js':
<WORKDIR>/encoding/utf8/decode_js.mbt:104:16-104:30:
    |   bytes : BytesView,
    |   ignore_bom~ : Bool = false,
    | ) -> String raise Malformed {
104 |   let result = decode_utf8_js(
    |                ^^^^^^^^^^^^^^
    |     bytes.data(),
    |     bytes.start_offset(),
"" (escaped)
````
