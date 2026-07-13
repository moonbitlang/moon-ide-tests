# toml-parser find-references toml_command cmd\toml\main.mbt:5:4

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide find-references 'toml_command' --loc 'cmd\toml\main.mbt:5:4'
Found 2 references for symbol 'toml_command':
<WORKDIR>/cmd\toml\main.mbt:5:4-5:16:
  | let version : String = "0.2.3"
  | 
  | ///|
5 | fn toml_command() -> @argparse.Command {
  |    ^^^^^^^^^^^^
  |   Command(
  |     "toml",

<WORKDIR>/cmd\toml\main.mbt:43:33-43:45:
   | 
   | ///|
   | fn run(args : ArrayView[String]) -> Int {
43 |   let matches = @argparse.parse(toml_command(), argv=args, env={}) catch {
   |                                 ^^^^^^^^^^^^
   |     err => {
   |       println(err)

```
