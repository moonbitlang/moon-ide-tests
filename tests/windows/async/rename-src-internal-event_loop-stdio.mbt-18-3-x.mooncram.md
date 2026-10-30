# async rename x src\internal\event_loop\stdio.mbt:18:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide rename 'x' 'x_renamed' --loc 'src\internal\event_loop\stdio.mbt:18:3'
*** Begin Patch
*** Update File: <WORKDIR>/src\internal\event_loop\stdio.mbt
@@
 ///|
 #warnings("-alert_internal-result_error_return")
 fn from_core_stdio(
-  x : @runtime_internal.StdioChannel,
+  x_renamed : @runtime_internal.StdioChannel,
 ) -> Result[IoHandle, Error] = "%identity"
 
 ///|
*** End Patch

```
