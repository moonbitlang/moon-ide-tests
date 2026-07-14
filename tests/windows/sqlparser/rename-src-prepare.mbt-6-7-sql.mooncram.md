# sqlparser rename sql src\prepare.mbt:6:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide rename 'sql' 'sql_renamed' --loc 'src\prepare.mbt:6:7'
*** Begin Patch
*** Update File: <WORKDIR>/src\prepare.mbt
@@
 
 ///|
 test "PREPARE simple SELECT" {
-  let sql = "PREPARE stmt AS SELECT * FROM users WHERE id = ?"
+  let sql_renamed = "PREPARE stmt AS SELECT * FROM users WHERE id = ?"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql_renamed)[0] |> pretty_print
   inspect(
     stmt,
     content=(
*** End Patch

```
