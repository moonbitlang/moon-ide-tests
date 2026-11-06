# openseek peek-def

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' peek-def 'command' --loc 'desktop/backend/internal/console_proxy/main/main.mbt:4:7' --target native --no-check
Definition found at file e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\backend\internal\console_proxy\main\main.mbt
  | ///|
  | /// `console-proxy [--relay ORIGIN] [--port PORT] [--bundle DIR] [--demo]`
  | async fn main {
4 |   let command = @argparse.Command(
  |       ^^^^^^^
  |     "console-proxy",
  |     about="Serve a locally built browser console against a SeekMoon relay.",
  |     flags=[
  |       @argparse.FlagArg(
  |         "demo",
  |         long="demo",
  |         about="Answer account and device routes with fixed demo data instead of a relay.",
  |       ),
  |     ],
  |     options=[
  |       @argparse.OptionArg(
  |         "relay",
  |         long="relay",
  |         default_values=[@console_proxy.DefaultRelay],
```
