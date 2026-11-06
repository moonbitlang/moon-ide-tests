# openseek find-references bg_runtime agent_tool/job_output/job_output.mbt:10:3

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' find-references 'bg_runtime' --loc 'agent_tool/job_output/job_output.mbt:10:3' --target native --no-check
Found 1 references for symbol 'bg_runtime':
e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\agent_tool\job_output\job_output.mbt:42:40-42:50:
   |       },
   |       "required": ["job_id"],
   |     }),
42 |     execute=Async(arguments => execute(bg_runtime, arguments, subagent_report~)),
   |                                        ^^^^^^^^^^
   |   )
   | }
"" (escaped)
```
