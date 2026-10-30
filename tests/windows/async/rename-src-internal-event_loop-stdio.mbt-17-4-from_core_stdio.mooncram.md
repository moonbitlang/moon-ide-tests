# async rename from_core_stdio src\internal\event_loop\stdio.mbt:17:4

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide rename 'from_core_stdio' 'from_core_stdio_renamed' --loc 'src\internal\event_loop\stdio.mbt:17:4'
*** Begin Patch
*** Update File: <WORKDIR>/src\internal\event_loop\stdio.mbt
@@
 
 ///|
 #warnings("-alert_internal-result_error_return")
-fn from_core_stdio(
+fn from_core_stdio_renamed(
   x : @runtime_internal.StdioChannel,
 ) -> Result[IoHandle, Error] = "%identity"
 
 ///|
 #warnings("-alert_internal")
-pub let stdin : Result[IoHandle, Error] = from_core_stdio(
+pub let stdin : Result[IoHandle, Error] = from_core_stdio_renamed(
   @runtime_internal.stdin,
 )
 
 ///|
 #warnings("-alert_internal")
-pub let stdout : Result[IoHandle, Error] = from_core_stdio(
+pub let stdout : Result[IoHandle, Error] = from_core_stdio_renamed(
   @runtime_internal.stdout,
 )
 
 ///|
 #warnings("-alert_internal")
-pub let stderr : Result[IoHandle, Error] = from_core_stdio(
+pub let stderr : Result[IoHandle, Error] = from_core_stdio_renamed(
   @runtime_internal.stderr,
 )
*** End Patch

```
