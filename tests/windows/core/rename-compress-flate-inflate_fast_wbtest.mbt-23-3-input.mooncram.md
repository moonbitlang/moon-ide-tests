# core rename input compress\flate\inflate_fast_wbtest.mbt:23:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'input' 'input_renamed' --loc 'compress\flate\inflate_fast_wbtest.mbt:23:3'
*** Begin Patch
*** Update File: <WORKDIR>/compress\flate\inflate_fast_wbtest.mbt
@@
 
 ///|
 fn fast_stream_run(
-  input : Bytes,
+  input_renamed : Bytes,
   chunk : Int32,
   room : Int32,
   fixed : Bool,
@@
   let decoded = @buffer.Buffer()
   let mut position = 0
   for ;; {
-    let end = (position + chunk).min(input.length())
+    let end = (position + chunk).min(input_renamed.length())
-    let status_result = inflater.step(input[position:end], output) catch {
+    let status_result = inflater.step(input_renamed[position:end], output) catch {
       InflateError(kind, _) => return Err(kind)
     }
     let status = status_result.status
-    if status is NeedMoreInput && end == input.length() {
+    if status is NeedMoreInput && end == input_renamed.length() {
       return Err(Truncated)
     }
     position += status_result.consumed
*** End Patch

```
