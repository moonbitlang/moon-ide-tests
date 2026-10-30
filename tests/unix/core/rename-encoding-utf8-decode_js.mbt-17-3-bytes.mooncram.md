# core rename bytes encoding/utf8/decode_js.mbt:17:3

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide rename 'bytes' 'bytes_renamed' --loc 'encoding/utf8/decode_js.mbt:17:3' --target js
*** Begin Patch
*** Update File: <WORKDIR>/encoding/utf8/decode_js.mbt
@@
 
 ///|
 extern "js" fn decode_utf8_js(
-  bytes : Bytes,
+  bytes_renamed : Bytes,
   start : Int32,
   len : Int32,
   preserve_bom : Bool,
*** End Patch
"" (escaped)
````
