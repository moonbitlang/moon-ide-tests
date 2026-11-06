# openseek peek-def

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' peek-def 'bg_runtime' --loc 'agent_tool/job_output/job_output.mbt:10:3' --target native --no-check
Definition found at file e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\agent_tool\job_output\job_output.mbt
   | ///
   | /// `subagent_report` reads the report a subagent job captured, by its child
   | /// session; a subagent job is answered with its outcome and report rather
   | /// than its log.
   | pub fn definition(
10 |   bg_runtime : @bgjobs.BgJobRuntime,
   |   ^^^^^^^^^^
   |   subagent_report? : (String) -> Json?,
   | ) -> @agent_tool.AgentToolDefinition {
   |   AgentToolDefinition(
   |     name="job_output",
   |     description=(
   |       #|Read a background job's recent output and status by its job_id (returned when
   |       #|a command moves to the background after its foreground grace period).
   |       #|Returns the most recent window of captured output (with truncation metadata naming
   |       #|the total size when output exceeds the window) and whether the job is still
   |       #|running. Output beyond the window is retained: pass offset (a character offset
   |       #|from the START) to read an earlier window instead — offsets 0, 12000, 24000, …
   |       #|page through all of total_chars. If you need the job's result before you can
   |       #|continue and have no other work to do, call job_wait with job_ids first.
   |       #|This tool reads immediately without waiting for completion; it has no wait_ms.
```
