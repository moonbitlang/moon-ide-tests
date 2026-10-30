# async find-references from_core_stdio src\internal\event_loop\stdio.mbt:17:4

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide find-references 'from_core_stdio' --loc 'src\internal\event_loop\stdio.mbt:17:4'
Found 3 references for symbol 'from_core_stdio':
<WORKDIR>/src\internal\event_loop\stdio.mbt:23:43-23:58:
   | 
   | ///|
   | #warnings("-alert_internal")
23 | pub let stdin : Result[IoHandle, Error] = from_core_stdio(
   |                                           ^^^^^^^^^^^^^^^
   |   @runtime_internal.stdin,
   | )

<WORKDIR>/src\internal\event_loop\stdio.mbt:29:44-29:59:
   | 
   | ///|
   | #warnings("-alert_internal")
29 | pub let stdout : Result[IoHandle, Error] = from_core_stdio(
   |                                            ^^^^^^^^^^^^^^^
   |   @runtime_internal.stdout,
   | )

<WORKDIR>/src\internal\event_loop\stdio.mbt:35:44-35:59:
   | 
   | ///|
   | #warnings("-alert_internal")
35 | pub let stderr : Result[IoHandle, Error] = from_core_stdio(
   |                                            ^^^^^^^^^^^^^^^
   |   @runtime_internal.stderr,
   | )

```
