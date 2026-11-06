# openseek peek-def

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' peek-def 'Command' --loc 'desktop/backend/internal/console_proxy/main/main.mbt:4:27' --target native --no-check
Definition found at file c:\Users\17376\.moonup\toolchains\nightly\lib\core\argparse\command.mbt
   | /// - `arg_required_else_help=true` prints help when no argv tokens are provided.
   | /// - `subcommand_required=true` requires selecting a subcommand.
   | /// - `default_subcommand` dispatches missing subcommands to a visible child.
   | /// - `hidden=true` omits this command from parent command listings.
   | #alias(new, deprecated="Use `Command()` instead")
48 | pub fn Command::Command(
   |                 ^^^^^^^
   |   name : StringView,
   |   flags~ : ArrayView[FlagArg] = [],
   |   options~ : ArrayView[OptionArg] = [],
   |   positionals~ : ArrayView[PositionArg] = [],
   |   subcommands~ : ArrayView[Command] = [],
   |   about? : StringView,
   |   version? : StringView,
   |   disable_help_flag~ : Bool = false,
   |   disable_version_flag~ : Bool = false,
   |   disable_help_subcommand~ : Bool = false,
   |   arg_required_else_help~ : Bool = false,
   |   subcommand_required~ : Bool = false,
   |   hidden~ : Bool = false,
   |   groups~ : ArrayView[ArgGroup] = [],
```
