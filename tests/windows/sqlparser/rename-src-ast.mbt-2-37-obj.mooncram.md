# sqlparser rename obj src\ast.mbt:2:37

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide rename 'obj' 'obj_renamed' --loc 'src\ast.mbt:2:37'
*** Begin Patch
*** Update File: <WORKDIR>/src\ast.mbt
@@
 ///|
-pub fn[T : @pp.Pretty] pretty_print(obj : T) -> String {
+pub fn[T : @pp.Pretty] pretty_print(obj_renamed : T) -> String {
-  @pp.pretty(obj).to_string()
+  @pp.pretty(obj_renamed).to_string()
 }
 
 ///|
*** End Patch

```
