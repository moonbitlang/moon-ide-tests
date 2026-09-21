# toml-parser find-references result coverage_improvement_comprehensive_test.mbt:9:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide find-references 'result' --loc 'coverage_improvement_comprehensive_test.mbt:9:7'
Found 1 references for symbol 'result':
<WORKDIR>/coverage_improvement_comprehensive_test.mbt:15:5-15:11:
   |     ),
   |   )
   |   debug_inspect(
15 |     result,
   |     ^^^^^^
   |     content=(
   |       #|TomlTable({})

```
