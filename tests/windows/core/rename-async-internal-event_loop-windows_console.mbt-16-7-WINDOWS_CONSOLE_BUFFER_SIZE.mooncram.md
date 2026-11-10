# core rename WINDOWS_CONSOLE_BUFFER_SIZE async\internal\event_loop\windows_console.mbt:16:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'WINDOWS_CONSOLE_BUFFER_SIZE' 'WINDOWS_CONSOLE_BUFFER_SIZERenamed' --loc 'async\internal\event_loop\windows_console.mbt:16:7'
*** Begin Patch
*** Update File: <WORKDIR>/async\internal\event_loop\io.mbt
@@
     0
   }
   let max_read_len = @cmp.minimum(
-    WINDOWS_CONSOLE_BUFFER_SIZE - unpaired_offset,
+    WINDOWS_CONSOLE_BUFFER_SIZERenamed - unpaired_offset,
     @cmp.maximum(len / 3, 1),
   )
   let n = {
@@
   let offset = offset + cache_consumed
   let len = @cmp.minimum(
     len - cache_consumed,
-    (WINDOWS_CONSOLE_BUFFER_SIZE - cache_produced) / 2,
+    (WINDOWS_CONSOLE_BUFFER_SIZERenamed - cache_produced) / 2,
   )
 
   let remainder = match buf[offset:offset + len] {
*** Update File: <WORKDIR>/async\internal\event_loop\windows_console.mbt
@@
 // limitations under the License.
 
 ///|
-const WINDOWS_CONSOLE_BUFFER_SIZE : Int32 = 4096
+const WINDOWS_CONSOLE_BUFFER_SIZERenamed : Int32 = 4096
 
 ///|
 /// Intermediate buffer for automatic decoding in Windows console handling.
@@
 ) -> WindowsConsoleBuffer {
   if kind is Console && platform is Windows {
     {
-      buffer: FixedArray::make(WINDOWS_CONSOLE_BUFFER_SIZE, 0),
+      buffer: FixedArray::make(WINDOWS_CONSOLE_BUFFER_SIZERenamed, 0),
       unpaired_surrogate: 0,
       pending: FixedArray::make(4, 0),
       pending_len: 0,
*** End Patch

```
