# core rename decode_utf8_js encoding\utf8\decode_js.mbt:16:16

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide rename 'decode_utf8_js' 'decode_utf8_js_renamed' --loc 'encoding\utf8\decode_js.mbt:16:16' --target js
*** Begin Patch
*** Update File: <WORKDIR>/encoding\utf8\decode_js.mbt
@@
 // limitations under the License.
 
 ///|
-extern "js" fn decode_utf8_js(
+extern "js" fn decode_utf8_js_renamed(
   bytes : Bytes,
   start : Int32,
   len : Int32,
@@
   bytes : BytesView,
   ignore_bom~ : Bool = false,
 ) -> String raise Malformed {
-  let result = decode_utf8_js(
+  let result = decode_utf8_js_renamed(
     bytes.data(),
     bytes.start_offset(),
     bytes.length(),
*** End Patch
"" (escaped)
````
