# openseek find-references command desktop/backend/internal/console_proxy/main/main.mbt:4:7

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' find-references 'command' --loc 'desktop/backend/internal/console_proxy/main/main.mbt:4:7' --target native --no-check
Found 1 references for symbol 'command':
e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\backend\internal\console_proxy\main\main.mbt:35:16-35:23:
   |       ),
   |     ],
   |   )
35 |   let parsed = command.parse()
   |                ^^^^^^^
   |   guard parsed.values
   |     is { "relay": [relay], "port": [port], "bundle": [bundle], .. } else {
"" (escaped)
```
