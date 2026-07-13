# toml-parser find-references version cmd\toml\main.mbt:2:5

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide find-references 'version' --loc 'cmd\toml\main.mbt:2:5'
Found 2 references for symbol 'version':
<WORKDIR>/cmd\toml\main.mbt:2:5-2:12:
  | ///|
2 | let version : String = "0.2.3"
  |     ^^^^^^^
  | 
  | ///|

<WORKDIR>/cmd\toml\main.mbt:9:5-9:12:
  |   Command(
  |     "toml",
  |     about="Parse, validate, and format TOML files.",
9 |     version~,
  |     ^^^^^^^
  |     arg_required_else_help=true,
  |     positionals=[

```
