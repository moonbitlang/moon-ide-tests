# openseek hover

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' hover 'command' --loc 'desktop/backend/internal/console_proxy/main/main.mbt:4:7' --target native --no-check
///|
/// `console-proxy [--relay ORIGIN] [--port PORT] [--bundle DIR] [--demo]`
async fn main {
  let command = @argparse.Command(
      ^^^^^^^
      ```moonbit
      @argparse.Command
      ```
    "console-proxy",
    about="Serve a locally built browser console against a SeekMoon relay.",
```
