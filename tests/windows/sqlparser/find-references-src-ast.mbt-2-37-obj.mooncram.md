# sqlparser find-references obj src\ast.mbt:2:37

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide find-references 'obj' --loc 'src\ast.mbt:2:37'
Found 2 references for symbol 'obj':
<WORKDIR>/src\ast.mbt:2:37-2:40:
  | ///|
2 | pub fn[T : @pp.Pretty] pretty_print(obj : T) -> String {
  |                                     ^^^
  |   @pp.pretty(obj).to_string()
  | }

<WORKDIR>/src\ast.mbt:3:14-3:17:
  | ///|
  | pub fn[T : @pp.Pretty] pretty_print(obj : T) -> String {
3 |   @pp.pretty(obj).to_string()
  |              ^^^
  | }
  | 

```
