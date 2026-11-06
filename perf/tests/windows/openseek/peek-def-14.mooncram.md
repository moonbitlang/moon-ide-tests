# openseek peek-def

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' peek-def 'StartupSubscription' --loc 'editor/internal/shell/examples/embedded_viewer/main.mbt:11:15' --target js --no-check
Definition found at file e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt
   | 
   | ///|
   | let memory_root : String = "memory://workspace"
   | 
   | ///|
11 | priv suberror StartupSubscription
   |               ^^^^^^^^^^^^^^^^^^^
   | 
   | ///|
   | fn startup_sub(cmd : @cmd.Cmd) -> @sub.Sub {
   |   @sub.custom_sub(
   |     "embedded-viewer-startup",
   |     Local,
   |     StartupSubscription,
   |     SubLoader((_, scheduler) => {
   |       scheduler.add(cmd)
   |       Some({ unload: _ => (), update_tagger: _ => (), })
   |     }),
   |   )
   | }
   | 
```
