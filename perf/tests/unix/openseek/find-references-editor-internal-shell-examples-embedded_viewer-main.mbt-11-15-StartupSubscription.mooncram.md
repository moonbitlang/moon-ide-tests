# openseek find-references StartupSubscription editor/internal/shell/examples/embedded_viewer/main.mbt:11:15

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' find-references 'StartupSubscription' --loc 'editor/internal/shell/examples/embedded_viewer/main.mbt:11:15' --target js --no-check
Found 1 references for symbol 'StartupSubscription':
e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:18:5-18:24:
   |   @sub.custom_sub(
   |     "embedded-viewer-startup",
   |     Local,
18 |     StartupSubscription,
   |     ^^^^^^^^^^^^^^^^^^^
   |     SubLoader((_, scheduler) => {
   |       scheduler.add(cmd)
"" (escaped)
```
