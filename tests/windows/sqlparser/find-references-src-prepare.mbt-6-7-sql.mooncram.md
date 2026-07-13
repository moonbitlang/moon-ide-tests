# sqlparser find-references sql src\prepare.mbt:6:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide find-references 'sql' --loc 'src\prepare.mbt:6:7'
Found 2 references for symbol 'sql':
<WORKDIR>/src\prepare.mbt:6:7-6:10:
  | 
  | ///|
  | test "PREPARE simple SELECT" {
6 |   let sql = "PREPARE stmt AS SELECT * FROM users WHERE id = ?"
  |       ^^^
  |   let stmt = parse_sql(sql)[0] |> pretty_print
  |   inspect(

<WORKDIR>/src\prepare.mbt:7:24-7:27:
  | ///|
  | test "PREPARE simple SELECT" {
  |   let sql = "PREPARE stmt AS SELECT * FROM users WHERE id = ?"
7 |   let stmt = parse_sql(sql)[0] |> pretty_print
  |                        ^^^
  |   inspect(
  |     stmt,

```
