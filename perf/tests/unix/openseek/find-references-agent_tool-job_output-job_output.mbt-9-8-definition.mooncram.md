# openseek find-references definition agent_tool/job_output/job_output.mbt:9:8

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' find-references 'definition' --loc 'agent_tool/job_output/job_output.mbt:9:8' --target native --no-check
Found 8 references for symbol 'definition':
e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\agent\tool_definition.mbt:294:19-294:29:
    |       // ran — a policy refusal reaches it after minutes of real work — and the
    |       // sanctioned retry is worded for a run that did not happen. Offering it
    |       // here would misdescribe the state the job left behind.
294 |       @job_output.definition(
    |                   ^^^^^^^^^^
    |         bg_runtime,
    |         subagent_report?=launcher.map(launcher => {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\agent\tool_definition_wbtest.mbt:17:41-17:51:
   |   assert_true(output.content.contains("moved to the background"), loc~)
   |   guard bg_runtime.list() is [job, ..] else { fail("no job registered", loc~) }
   |   @async.with_timeout(30_000, () => bg_runtime.wait_any([job.id]))
17 |   let read = run_async_tool(@job_output.definition(bg_runtime), {
   |                                         ^^^^^^^^^^
   |     "job_id": job.id,
   |   })

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\agent\tool_definition_wbtest.mbt:169:43-169:53:
    |     )
    |     guard bg_runtime.list() is [job, ..] else { fail("no job registered") }
    |     @async.with_timeout(120_000, () => bg_runtime.wait_any([job.id]))
169 |     let read = run_async_tool(@job_output.definition(bg_runtime), {
    |                                           ^^^^^^^^^^
    |       "job_id": job.id,
    |     })

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\agent\tool_definition_wbtest.mbt:311:43-311:53:
    |       @async.sleep(25)
    |     }
    |     assert_true(saw_eof)
311 |     let read = run_async_tool(@job_output.definition(bg_runtime), {
    |                                           ^^^^^^^^^^
    |       "job_id": job.id,
    |     })

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\agent_tool\job_output\job_output_test.mbt:19:34-19:44:
   |   bg : @bgjobs.BgJobRuntime,
   |   arguments : Json,
   | ) -> @agent_tool.ToolOutput {
19 |   let action = match @job_output.definition(bg).execute {
   |                                  ^^^^^^^^^^
   |     Async(execute) => execute(arguments)
   |     Sync(_) => fail("job_output should be async")

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\agent_tool\mbtx\background_images_test.mbt:45:45-45:55:
   |         jobs.wait_any([job.id])
   |         @fs.remove("\{ws}/picture")
   |         for _ in 0..<2 {
45 |           let result = dispatch(@job_output.definition(jobs), {
   |                                             ^^^^^^^^^^
   |             "job_id": job.id,
   |           })

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\agent_tool\mbtx\background_ptc_test.mbt:68:43-68:53:
   |         let decoded : @openseek_protocol.JobRecord = @json.from_json(saved)
   |         assert_eq(decoded.data, record.data)
   |         assert_true(decoded.state is Exited(0))
68 |         let result = dispatch(@job_output.definition(jobs), { "job_id": job.id })
   |                                           ^^^^^^^^^^
   |         assert_eq(result.data, record.data)
   |       })

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\agent_tool\mbtx\background_ptc_test.mbt:342:43-342:53:
    |         }
    |         assert_true(record.state is Exited(0))
    |         assert_true(record.cleanup_error is Some(_))
342 |         let result = dispatch(@job_output.definition(jobs), { "job_id": job.id })
    |                                           ^^^^^^^^^^
    |         assert_true(result.is_error)
    |         assert_true(result.content.contains("unfinished tool calls"))
"" (escaped)
```
