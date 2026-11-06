# openseek hover

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' hover 'definition' --loc 'agent_tool/job_output/job_output.mbt:9:8' --target native --no-check
/// `subagent_report` reads the report a subagent job captured, by its child
/// session; a subagent job is answered with its outcome and report rather
/// than its log.
pub fn definition(
       ^^^^^^^^^^
       ```moonbit
       fn definition(bg_runtime : @bgjobs.BgJobRuntime, subagent_report? : (String) -> Json?) -> @agent_tool.AgentToolDefinition
       ```
       ---
       
        Tool `job_output`: read a background job's output and status by id.
        The id comes from a command automatically moved to the background after its
        foreground grace period.
       
        `subagent_report` reads the report a subagent job captured, by its child
        session; a subagent job is answered with its outcome and report rather
        than its log.
  bg_runtime : @bgjobs.BgJobRuntime,
  subagent_report? : (String) -> Json?,
```
