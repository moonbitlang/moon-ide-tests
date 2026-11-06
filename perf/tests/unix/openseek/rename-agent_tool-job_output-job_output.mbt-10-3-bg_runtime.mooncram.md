# openseek rename bg_runtime agent_tool/job_output/job_output.mbt:10:3

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' rename 'bg_runtime' 'bg_runtime_renamed' --loc 'agent_tool/job_output/job_output.mbt:10:3' --target native --no-check
*** Begin Patch
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\agent_tool\job_output\job_output.mbt
@@
 /// session; a subagent job is answered with its outcome and report rather
 /// than its log.
 pub fn definition(
-  bg_runtime : @bgjobs.BgJobRuntime,
+  bg_runtime_renamed : @bgjobs.BgJobRuntime,
   subagent_report? : (String) -> Json?,
 ) -> @agent_tool.AgentToolDefinition {
   AgentToolDefinition(
@@
       },
       "required": ["job_id"],
     }),
-    execute=Async(arguments => execute(bg_runtime, arguments, subagent_report~)),
+    execute=Async(arguments => execute(bg_runtime_renamed, arguments, subagent_report~)),
   )
 }
 
*** End Patch
"" (escaped)
```
