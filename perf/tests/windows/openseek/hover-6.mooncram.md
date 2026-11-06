# openseek hover

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' hover 'Command' --loc 'desktop/backend/internal/console_proxy/main/main.mbt:4:27' --target native --no-check
///|
/// `console-proxy [--relay ORIGIN] [--port PORT] [--bundle DIR] [--demo]`
async fn main {
  let command = @argparse.Command(
                          ^^^^^^^
                          ```moonbit
                          fn @argparse.Command::Command(name : StringView, about~ : StringView, flags~ : ArrayView[@argparse.FlagArg], options~ : ArrayView[@argparse.OptionArg], positionals? : ArrayView[@argparse.PositionArg], subcommands? : ArrayView[@argparse.Command], version? : StringView, disable_help_flag? : Bool, disable_version_flag? : Bool, disable_help_subcommand? : Bool, arg_required_else_help? : Bool, subcommand_required? : Bool, hidden? : Bool, groups? : ArrayView[@argparse.ArgGroup], default_subcommand? : StringView) -> @argparse.Command
                          ```
                          ---
                          
                           Create a declarative command specification.
                          
                           Notes:
                           - `flags`, `options`, and `positionals` declare arguments by kind.
                           - `groups` declares argument-group membership and policies.
                           - `disable_help_flag` / `disable_version_flag` disable built-in
                             `--help` / `--version`.
                           - `disable_help_subcommand` disables built-in `help <subcommand>` routing.
                           - `arg_required_else_help=true` prints help when no argv tokens are provided.
                           - `subcommand_required=true` requires selecting a subcommand.
                           - `default_subcommand` dispatches missing subcommands to a visible child.
                           - `hidden=true` omits this command from parent command listings.
    "console-proxy",
    about="Serve a locally built browser console against a SeekMoon relay.",
```
