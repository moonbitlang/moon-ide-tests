# sqlparser find-references stmt src\prepare.mbt:7:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide find-references 'stmt' --loc 'src\prepare.mbt:7:7'
Found 2 references for symbol 'stmt':
<WORKDIR>/src\prepare.mbt:7:7-7:11:
  | ///|
  | test "PREPARE simple SELECT" {
  |   let sql = "PREPARE stmt AS SELECT * FROM users WHERE id = ?"
7 |   let stmt = parse_sql(sql)[0] |> pretty_print
  |       ^^^^
  |   inspect(
  |     stmt,

<WORKDIR>/src\prepare.mbt:9:5-9:9:
  |   let sql = "PREPARE stmt AS SELECT * FROM users WHERE id = ?"
  |   let stmt = parse_sql(sql)[0] |> pretty_print
  |   inspect(
9 |     stmt,
  |     ^^^^
  |     content=(
  |       #|PREPARE stmt AS SELECT

```
