# openseek hover

````mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' hover 'bg_runtime' --loc 'agent_tool/job_output/job_output.mbt:10:3' --target native --no-check
/// session; a subagent job is answered with its outcome and report rather
/// than its log.
pub fn definition(
  bg_runtime : @bgjobs.BgJobRuntime,
  ^^^^^^^^^^
  ```moonbit
  @bgjobs.BgJobRuntime
  ```
  subagent_report? : (String) -> Json?,
) -> @agent_tool.AgentToolDefinition {
````
