# sqlparser rename stmt src\prepare.mbt:7:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide rename 'stmt' 'stmt_renamed' --loc 'src\prepare.mbt:7:7'
*** Begin Patch
*** Update File: <WORKDIR>/src\prepare.mbt
@@
 ///|
 test "PREPARE simple SELECT" {
   let sql = "PREPARE stmt AS SELECT * FROM users WHERE id = ?"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt_renamed = parse_sql(sql)[0] |> pretty_print
   inspect(
-    stmt,
+    stmt_renamed,
     content=(
       #|PREPARE stmt AS SELECT
       #|  *
*** End Patch

```
