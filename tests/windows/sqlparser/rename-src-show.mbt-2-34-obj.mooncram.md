# sqlparser rename obj src\show.mbt:2:34

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide rename 'obj' 'obj_renamed' --loc 'src\show.mbt:2:34'
*** Begin Patch
*** Update File: <WORKDIR>/src\show.mbt
@@
 ///|
-fn[T : Debug] show_compact_debug(obj : T, logger : &Logger) -> Unit {
+fn[T : Debug] show_compact_debug(obj_renamed : T, logger : &Logger) -> Unit {
-  let input = @debug.to_string(obj)
+  let input = @debug.to_string(obj_renamed)
   let buffer = StringBuilder::new()
   let mut in_string = false
   let mut escaped = false
*** End Patch

```
