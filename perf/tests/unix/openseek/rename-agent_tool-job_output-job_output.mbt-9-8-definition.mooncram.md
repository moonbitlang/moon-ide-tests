# openseek rename definition agent_tool/job_output/job_output.mbt:9:8

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' rename 'definition' 'definition_renamed' --loc 'agent_tool/job_output/job_output.mbt:9:8' --target native --no-check
*** Begin Patch
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\agent\tool_definition.mbt
@@
       // ran — a policy refusal reaches it after minutes of real work — and the
       // sanctioned retry is worded for a run that did not happen. Offering it
       // here would misdescribe the state the job left behind.
-      @job_output.definition(
+      @job_output.definition_renamed(
         bg_runtime,
         subagent_report?=launcher.map(launcher => {
           session => launcher.report(session)
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\agent\tool_definition_wbtest.mbt
@@
   assert_true(output.content.contains("moved to the background"), loc~)
   guard bg_runtime.list() is [job, ..] else { fail("no job registered", loc~) }
   @async.with_timeout(30_000, () => bg_runtime.wait_any([job.id]))
-  let read = run_async_tool(@job_output.definition(bg_runtime), {
+  let read = run_async_tool(@job_output.definition_renamed(bg_runtime), {
     "job_id": job.id,
   })
   guard read is Respond(result) else { fail("expected Respond", loc~) }
@@
     )
     guard bg_runtime.list() is [job, ..] else { fail("no job registered") }
     @async.with_timeout(120_000, () => bg_runtime.wait_any([job.id]))
-    let read = run_async_tool(@job_output.definition(bg_runtime), {
+    let read = run_async_tool(@job_output.definition_renamed(bg_runtime), {
       "job_id": job.id,
     })
     guard read is Respond(result) else { fail("expected Respond") }
@@
       @async.sleep(25)
     }
     assert_true(saw_eof)
-    let read = run_async_tool(@job_output.definition(bg_runtime), {
+    let read = run_async_tool(@job_output.definition_renamed(bg_runtime), {
       "job_id": job.id,
     })
     guard read is Respond(job) else { fail("expected Respond") }
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\agent_tool\job_output\job_output.mbt
@@
 /// `subagent_report` reads the report a subagent job captured, by its child
 /// session; a subagent job is answered with its outcome and report rather
 /// than its log.
-pub fn definition(
+pub fn definition_renamed(
   bg_runtime : @bgjobs.BgJobRuntime,
   subagent_report? : (String) -> Json?,
 ) -> @agent_tool.AgentToolDefinition {
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\agent_tool\job_output\job_output_test.mbt
@@
   bg : @bgjobs.BgJobRuntime,
   arguments : Json,
 ) -> @agent_tool.ToolOutput {
-  let action = match @job_output.definition(bg).execute {
+  let action = match @job_output.definition_renamed(bg).execute {
     Async(execute) => execute(arguments)
     Sync(_) => fail("job_output should be async")
   }
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\agent_tool\mbtx\background_images_test.mbt
@@
         jobs.wait_any([job.id])
         @fs.remove("\{ws}/picture")
         for _ in 0..<2 {
-          let result = dispatch(@job_output.definition(jobs), {
+          let result = dispatch(@job_output.definition_renamed(jobs), {
             "job_id": job.id,
           })
           assert_false(result.is_error, msg=result.content)
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\agent_tool\mbtx\background_ptc_test.mbt
@@
         let decoded : @openseek_protocol.JobRecord = @json.from_json(saved)
         assert_eq(decoded.data, record.data)
         assert_true(decoded.state is Exited(0))
-        let result = dispatch(@job_output.definition(jobs), { "job_id": job.id })
+        let result = dispatch(@job_output.definition_renamed(jobs), { "job_id": job.id })
         assert_eq(result.data, record.data)
       })
     })
@@
         }
         assert_true(record.state is Exited(0))
         assert_true(record.cleanup_error is Some(_))
-        let result = dispatch(@job_output.definition(jobs), { "job_id": job.id })
+        let result = dispatch(@job_output.definition_renamed(jobs), { "job_id": job.id })
         assert_true(result.is_error)
         assert_true(result.content.contains("unfinished tool calls"))
       })
*** End Patch
"" (escaped)
```
