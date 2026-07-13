# toml-parser rename toml_command cmd\toml\main.mbt:5:4

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide rename 'toml_command' 'toml_command_renamed' --loc 'cmd\toml\main.mbt:5:4'
*** Begin Patch
*** Update File: <WORKDIR>/cmd\toml\main.mbt
@@
 let version : String = "0.2.3"
 
 ///|
-fn toml_command() -> @argparse.Command {
+fn toml_command_renamed() -> @argparse.Command {
   Command(
     "toml",
     about="Parse, validate, and format TOML files.",
@@
 
 ///|
 fn run(args : ArrayView[String]) -> Int {
-  let matches = @argparse.parse(toml_command(), argv=args, env={}) catch {
+  let matches = @argparse.parse(toml_command_renamed(), argv=args, env={}) catch {
     err => {
       println(err)
       return 2
*** End Patch

```
