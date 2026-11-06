# openseek outline

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' outline 'agent_tool/job_output/job_output.mbt' --target native --no-check
  9 |pub fn definition(
 10 |  bg_runtime : @bgjobs.BgJobRuntime,
 11 |  subagent_report? : (String) -> Json?,
 12 |) -> @agent_tool.AgentToolDefinition {
    |...
 47 |async fn execute(
 48 |  bg_runtime : @bgjobs.BgJobRuntime,
 49 |  arguments : Json,
 50 |  subagent_report~ : ((String) -> Json?)?,
 51 |) -> @agent_tool.ToolAction {
    |...
208 |fn apply_output_rewrites(
209 |  text : String,
210 |  rewrites : Array[(String, String)],
211 |) -> String {
    |...
223 |fn page_of(text : String, offset~ : Int32, window~ : Int32) -> String {
    |...
231 |const ReportWindow : Int32 = 48_000
    |...
236 |fn subagent_output(
237 |  job_id : String,
238 |  info : @protocol.SubagentInfo,
239 |  running : Bool,
240 |  subagent_report : ((String) -> Json?)?,
241 |) -> @agent_tool.ToolAction {
    |...
"" (escaped)
```
