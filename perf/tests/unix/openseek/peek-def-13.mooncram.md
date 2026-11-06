# openseek peek-def

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' peek-def 'memory_root' --loc 'editor/internal/shell/examples/embedded_viewer/main.mbt:8:5' --target js --no-check
Definition found at file e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt
  | // against in-memory documents and an in-memory tree provider, with zero server
  | // or websocket involvement. The host owns document selection and passes
  | // text models directly to the viewer.
  | 
  | ///|
8 | let memory_root : String = "memory://workspace"
  |     ^^^^^^^^^^^
  | 
  | ///|
  | priv suberror StartupSubscription
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
```
