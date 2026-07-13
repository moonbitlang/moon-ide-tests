# toml-parser rename version cmd\toml\main.mbt:2:5

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide rename 'version' 'version_renamed' --loc 'cmd\toml\main.mbt:2:5'
*** Begin Patch
*** Update File: <WORKDIR>/cmd\toml\main.mbt
@@
 ///|
-let version : String = "0.2.3"
+let version_renamed : String = "0.2.3"
 
 ///|
 fn toml_command() -> @argparse.Command {
@@
   Command(
     "toml",
     about="Parse, validate, and format TOML files.",
-    version~,
+    version_renamed~,
     arg_required_else_help=true,
     positionals=[
       PositionArg("file", about="Parse TOML and print normalized TOML."),
*** End Patch

```
