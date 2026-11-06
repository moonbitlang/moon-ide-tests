# openseek rename command desktop/backend/internal/console_proxy/main/main.mbt:4:7

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' rename 'command' 'command_renamed' --loc 'desktop/backend/internal/console_proxy/main/main.mbt:4:7' --target native --no-check
*** Begin Patch
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\backend\internal\console_proxy\main\main.mbt
@@
 ///|
 /// `console-proxy [--relay ORIGIN] [--port PORT] [--bundle DIR] [--demo]`
 async fn main {
-  let command = @argparse.Command(
+  let command_renamed = @argparse.Command(
     "console-proxy",
     about="Serve a locally built browser console against a SeekMoon relay.",
     flags=[
@@
       ),
     ],
   )
-  let parsed = command.parse()
+  let parsed = command_renamed.parse()
   guard parsed.values
     is { "relay": [relay], "port": [port], "bundle": [bundle], .. } else {
     fail("missing parsed options")
*** End Patch
"" (escaped)
```
