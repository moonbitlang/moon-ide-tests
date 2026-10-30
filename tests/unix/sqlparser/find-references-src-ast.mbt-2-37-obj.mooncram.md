# sqlparser find-references obj src/ast.mbt:2:37

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/sqlparser' moon ide find-references 'obj' --loc 'src/ast.mbt:2:37'
Found 1 references for symbol 'obj':
<WORKDIR>/src/ast.mbt:3:14-3:17:
"  | ///|" (escaped)
"  | pub fn[T : @pp.Pretty] pretty_print(obj : T) -> String {" (escaped)
"3 |   @pp.pretty(obj).to_string()" (escaped)
"  |              ^^^" (escaped)
"  | }" (escaped)
"  | " (escaped)
"" (escaped)
````
