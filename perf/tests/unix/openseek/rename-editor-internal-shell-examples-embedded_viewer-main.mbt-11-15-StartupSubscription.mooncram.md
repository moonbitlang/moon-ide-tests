# openseek rename StartupSubscription editor/internal/shell/examples/embedded_viewer/main.mbt:11:15

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' rename 'StartupSubscription' 'StartupSubscriptionRenamed' --loc 'editor/internal/shell/examples/embedded_viewer/main.mbt:11:15' --target js --no-check
*** Begin Patch
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt
@@
 let memory_root : String = "memory://workspace"
 
 ///|
-priv suberror StartupSubscription
+priv suberror StartupSubscriptionRenamed
 
 ///|
 fn startup_sub(cmd : @cmd.Cmd) -> @sub.Sub {
@@
   @sub.custom_sub(
     "embedded-viewer-startup",
     Local,
-    StartupSubscription,
+    StartupSubscriptionRenamed,
     SubLoader((_, scheduler) => {
       scheduler.add(cmd)
       Some({ unload: _ => (), update_tagger: _ => (), })
*** End Patch
"" (escaped)
```
