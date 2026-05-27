# sqlparser rename

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$PWD"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide rename pass pass_renamed --loc 'src/tests/good_test.mbt:4:4'
*** Begin Patch
*** Update File: <WORKDIR>/src/tests/good_test.mbt
@@
 // These tests are copied from https://github.com/hyrise/sql-parser/blob/main/test/queries/queries-good.sql
 
 ///|
-fn pass(input : String) -> Unit {
+fn pass_renamed(input : String) -> Unit {
   (@sqlparser.parse_sql(input) catch {
     e => { (escaped)
       println(e)
@@
 
 ///|
 test {
-  "SELECT * FROM orders;" |> pass
+  "SELECT * FROM orders;" |> pass_renamed
 }
 
 ///|
 test {
-  "SELECT a FROM foo WHERE a > 12 OR b > 3 AND NOT c LIMIT 10;" |> pass
+  "SELECT a FROM foo WHERE a > 12 OR b > 3 AND NOT c LIMIT 10;" |> pass_renamed
 }
 
 ///|
 test {
   "SELECT a FROM some_schema.foo WHERE a > 12 OR b > 3 AND NOT c LIMIT 10;"
-  |> pass
+  |> pass_renamed
 }
 
 ///|
@@
   (
     #|SELECT col1 AS myname, col2, 'test' FROM "table", foo AS t WHERE age > 12 AND zipcode = 12345 GROUP BY col1;
   )
-  |> pass
+  |> pass_renamed
 }
 
 ///|
@@
   (
     #|SELECT * from "table" JOIN table2 ON a = b WHERE (b OR NOT a) AND a = 12.5
   )
-  |> pass
+  |> pass_renamed
 }
 
 ///|
 test {
   "(SELECT a FROM foo WHERE a > 12 OR b > 3 AND c NOT LIKE 's%' LIMIT 10);"
-  |> pass
+  |> pass_renamed
 }
 
 ///|
@@
   (
     #|SELECT * FROM "table" LIMIT 10 OFFSET 10; SELECT * FROM another;
   )
-  |> pass
+  |> pass_renamed
 }
 
 ///|
 test {
-  "SELECT * FROM t1 UNION SELECT * FROM t2 ORDER BY col1;" |> pass
+  "SELECT * FROM t1 UNION SELECT * FROM t2 ORDER BY col1;" |> pass_renamed
 }
 
 ///|
 test {
-  "SELECT * FROM (SELECT * FROM t1);" |> pass
+  "SELECT * FROM (SELECT * FROM t1);" |> pass_renamed
 }
 
 ///|
 test {
   "SELECT * FROM t1 UNION (SELECT * FROM t2 UNION SELECT * FROM t3) ORDER BY col1;"
-  |> pass
+  |> pass_renamed
 }
 
 ///|
 test {
-  "SELECT TOP 10 * FROM t1 ORDER BY col1, col2;" |> pass
+  "SELECT TOP 10 * FROM t1 ORDER BY col1, col2;" |> pass_renamed
 }
 
 ///|
 test {
-  "SELECT a, MAX(b), MAX(c, d), CUSTOM(q, UP(r)) AS f FROM t1;" |> pass
+  "SELECT a, MAX(b), MAX(c, d), CUSTOM(q, UP(r)) AS f FROM t1;" |> pass_renamed
 }
 
 ///|
 test {
-  "SELECT * FROM t WHERE a BETWEEN 1 and c;" |> pass
+  "SELECT * FROM t WHERE a BETWEEN 1 and c;" |> pass_renamed
 }
 
 ///|
 test {
-  "SELECT * FROM t WHERE a = ? AND b = ?;" |> pass
+  "SELECT * FROM t WHERE a = ? AND b = ?;" |> pass_renamed
 }
 
 ///|
 test {
   "SELECT City.name, Product.category, SUM(price) FROM fact INNER JOIN City ON fact.city_id = City.id INNER JOIN Product ON fact.product_id = Product.id GROUP BY City.name, Product.category;"
-  |> pass
+  |> pass_renamed
 }
 
 ///|
 test {
-  "SELECT SUBSTR(a, 3, 5) FROM t;" |> pass
+  "SELECT SUBSTR(a, 3, 5) FROM t;" |> pass_renamed
 }
 
 ///|
 test {
-  "SELECT * FROM t WHERE a = DATE '1996-12-31';" |> pass
+  "SELECT * FROM t WHERE a = DATE '1996-12-31';" |> pass_renamed
 }
 
 ///|
@@
   (
     #| SELECT t1.a, t1.b, t2.c FROM "table" AS t1 JOIN (SELECT * FROM foo JOIN bar ON foo.id = bar.id) t2 ON t1.a = t2.b WHERE (t1.b OR NOT t1.a) AND t2.c = 12.5
   )
-  |> pass
+  |> pass_renamed
 }
 
 ///|
 test {
-  "SELECT * FROM t1 JOIN t2 ON c1 = c2;" |> pass
+  "SELECT * FROM t1 JOIN t2 ON c1 = c2;" |> pass_renamed
 }
 
 ///|
 test {
-  "SELECT a, SUM(b) FROM t2 GROUP BY a HAVING SUM(b) > 100;" |> pass
+  "SELECT a, SUM(b) FROM t2 GROUP BY a HAVING SUM(b) > 100;" |> pass_renamed
 }
 
 ///|
 test {
-  "INSERT INTO test_table VALUES (1, 2, 'test');" |> pass
+  "INSERT INTO test_table VALUES (1, 2, 'test');" |> pass_renamed
 }
 
 ///|
 test {
-  "INSERT INTO test_table (id, value, name) VALUES (1, 2, 'test');" |> pass
+  "INSERT INTO test_table (id, value, name) VALUES (1, 2, 'test');" |> pass_renamed
 }
 
 ///|
 test {
-  "INSERT INTO test_table SELECT * FROM students;" |> pass
+  "INSERT INTO test_table SELECT * FROM students;" |> pass_renamed
 }
 
 ///|
 test {
   "INSERT INTO some_schema.test_table SELECT * FROM another_schema.students;"
-  |> pass
+  |> pass_renamed
 }
 
 ///|
 test {
-  "CREATE TABLE IF NOT EXISTS \"table\" (id INTEGER);" |> pass
+  "CREATE TABLE IF NOT EXISTS \"table\" (id INTEGER);" |> pass_renamed
 }
 
 ///|
 test {
-  "CREATE TABLE students_2 AS SELECT * FROM students;" |> pass
+  "CREATE TABLE students_2 AS SELECT * FROM students;" |> pass_renamed
 }
 
 ///|
 test {
   "CREATE TABLE students_3 AS SELECT city, grade FROM students WHERE grade > 3.0;"
-  |> pass
+  |> pass_renamed
 }
 
 ///|
 test {
-  "DELETE FROM students WHERE grade > 3.0" |> pass
+  "DELETE FROM students WHERE grade > 3.0" |> pass_renamed
 }
 
 ///|
 test {
-  "DELETE FROM students" |> pass
+  "DELETE FROM students" |> pass_renamed
 }
 
 ///|
 test {
-  "UPDATE students SET grade = 1.3 WHERE name = 'Max Mustermann';" |> pass
+  "UPDATE students SET grade = 1.3 WHERE name = 'Max Mustermann';" |> pass_renamed
 }
 
 ///|
 test {
   "UPDATE students SET grade = 1.3, name='Felix Fürstenberg' WHERE name = 'Max Mustermann';"
-  |> pass
+  |> pass_renamed
 }
 
 ///|
 test {
-  "UPDATE students SET grade = 1.0;" |> pass
+  "UPDATE students SET grade = 1.0;" |> pass_renamed
 }
 
 ///|
 test {
-  "UPDATE some_schema.students SET grade = 1.0;" |> pass
+  "UPDATE some_schema.students SET grade = 1.0;" |> pass_renamed
 }
 
 ///|
 test {
-  "TRUNCATE students" |> pass
+  "TRUNCATE students" |> pass_renamed
 }
 
 ///|
 test {
-  "DROP TABLE students;" |> pass
+  "DROP TABLE students;" |> pass_renamed
 }
 
 ///|
 test {
-  "DROP TABLE IF EXISTS students;" |> pass
+  "DROP TABLE IF EXISTS students;" |> pass_renamed
 }
 
 ///|
 test {
-  "ALTER TABLE mytable DROP COLUMN IF EXISTS mycolumn;" |> pass
+  "ALTER TABLE mytable DROP COLUMN IF EXISTS mycolumn;" |> pass_renamed
 }
 
 ///|
 test {
-  "ALTER TABLE IF EXISTS mytable DROP COLUMN IF EXISTS mycolumn;" |> pass
+  "ALTER TABLE IF EXISTS mytable DROP COLUMN IF EXISTS mycolumn;" |> pass_renamed
 }
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename input input_renamed --loc 'src/tests/good_test.mbt:4:9'
*** Begin Patch
*** Update File: <WORKDIR>/src/tests/good_test.mbt
@@
 // These tests are copied from https://github.com/hyrise/sql-parser/blob/main/test/queries/queries-good.sql
 
 ///|
-fn pass(input : String) -> Unit {
+fn pass(input_renamed : String) -> Unit {
-  (@sqlparser.parse_sql(input) catch {
+  (@sqlparser.parse_sql(input_renamed) catch {
     e => { (escaped)
       println(e)
       panic()
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename read_and_parse read_and_parse_renamed --loc 'src/tests/tpch_test.mbt:2:4'
*** Begin Patch
*** Update File: <WORKDIR>/src/tests/tpch_test.mbt
@@
 ///|
-fn read_and_parse(path : String) -> @sqlparser.Statements {
+fn read_and_parse_renamed(path : String) -> @sqlparser.Statements {
   let input = @fs.read_file_to_string(path) catch {
     e => { (escaped)
       println("Read file error: \{e.to_string()}")
@@
 
 ///|
 test "TPCH 1" {
-  let stmt = read_and_parse("src/tests/tpch/1.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/1.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 2" {
-  let stmt = read_and_parse("src/tests/tpch/2.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/2.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 3" {
-  let stmt = read_and_parse("src/tests/tpch/3.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/3.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 4" {
-  let stmt = read_and_parse("src/tests/tpch/4.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/4.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 5" {
-  let stmt = read_and_parse("src/tests/tpch/5.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/5.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 6" {
-  let stmt = read_and_parse("src/tests/tpch/6.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/6.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 7" {
-  let stmt = read_and_parse("src/tests/tpch/7.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/7.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 8" {
-  let stmt = read_and_parse("src/tests/tpch/8.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/8.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 9" {
-  let stmt = read_and_parse("src/tests/tpch/9.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/9.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 10" {
-  let stmt = read_and_parse("src/tests/tpch/10.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/10.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 11" {
-  let stmt = read_and_parse("src/tests/tpch/11.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/11.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 12" {
-  let stmt = read_and_parse("src/tests/tpch/12.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/12.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 13" {
-  let stmt = read_and_parse("src/tests/tpch/13.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/13.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 14" {
-  let stmt = read_and_parse("src/tests/tpch/14.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/14.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 15" {
-  let stmt = read_and_parse("src/tests/tpch/15.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/15.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 16" {
-  let stmt = read_and_parse("src/tests/tpch/16.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/16.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 17" {
-  let stmt = read_and_parse("src/tests/tpch/17.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/17.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 18" {
-  let stmt = read_and_parse("src/tests/tpch/18.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/18.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 19" {
-  let stmt = read_and_parse("src/tests/tpch/19.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/19.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 20" {
-  let stmt = read_and_parse("src/tests/tpch/20.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/20.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 21" {
-  let stmt = read_and_parse("src/tests/tpch/21.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/21.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 22" {
-  let stmt = read_and_parse("src/tests/tpch/22.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/22.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename path path_renamed --loc 'src/tests/tpch_test.mbt:2:19'
*** Begin Patch
*** Update File: <WORKDIR>/src/tests/tpch_test.mbt
@@
 ///|
-fn read_and_parse(path : String) -> @sqlparser.Statements {
+fn read_and_parse(path_renamed : String) -> @sqlparser.Statements {
-  let input = @fs.read_file_to_string(path) catch {
+  let input = @fs.read_file_to_string(path_renamed) catch {
     e => { (escaped)
       println("Read file error: \{e.to_string()}")
       panic()
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename sql sql_renamed --loc 'src/tests/dialect_test.mbt:9:7'
*** Begin Patch
*** Update File: <WORKDIR>/src/tests/dialect_test.mbt
@@
 
 ///|
 test "MySQL SHOW TABLES statement" {
-  let sql = @sqlparser.parse_sql("SHOW TABLES;")
+  let sql_renamed = @sqlparser.parse_sql("SHOW TABLES;")
-  inspect(sql.stmts.length(), content="1")
+  inspect(sql_renamed.stmts.length(), content="1")
-  let pretty = sql.stmts[0] |> @sqlparser.pretty_print
+  let pretty = sql_renamed.stmts[0] |> @sqlparser.pretty_print
   inspect(pretty, content="SHOW TABLES;")
 }
 
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename parse_sql parse_sql_renamed --loc 'src/tests/dialect_test.mbt:9:24'
*** Begin Patch
*** Update File: <WORKDIR>/src/bigquery.mbt
@@
 
 test "BigQuery named parameter" {
   let tokens = "SELECT * FROM users WHERE id = @user_id;"
-  let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "BigQuery positional parameter" {
   let tokens = "SELECT * FROM users WHERE id = ?;"
-  let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "BigQuery mixed parameters" {
   let tokens = "SELECT * FROM users WHERE id = @user_id AND age > ?;"
-  let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "BigQuery multiple named parameters" {
   let tokens = "SELECT @field FROM @table WHERE @condition = @value;"
-  let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 
 test "Named parameters treated as identifiers in MySQL" {
   let tokens = "SELECT @user_id FROM users;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
*** Update File: <WORKDIR>/src/dcl.mbt
@@
 
 test "GRANT SELECT statement" {
   let tokens = "GRANT SELECT ON users TO alice;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "GRANT multiple privileges statement" {
   let tokens = "GRANT SELECT, INSERT, UPDATE ON users TO alice, bob;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "GRANT with column specification" {
   let tokens = "GRANT SELECT (name, email), UPDATE (email) ON users TO alice;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "GRANT ALL PRIVILEGES statement" {
   let tokens = "GRANT ALL PRIVILEGES ON users TO alice WITH GRANT OPTION;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "REVOKE SELECT statement" {
   let tokens = "REVOKE SELECT ON users FROM alice;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "REVOKE with CASCADE" {
   let tokens = "REVOKE ALL PRIVILEGES ON users FROM alice CASCADE;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "REVOKE GRANT OPTION FOR" {
   let tokens = "REVOKE GRANT OPTION FOR SELECT ON users FROM alice RESTRICT;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
*** Update File: <WORKDIR>/src/ddl.mbt
@@
 /// CREATE INDEX Tests
 test "CREATE INDEX - Simple" {
   let tokens = "CREATE INDEX idx_name ON users (email);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE UNIQUE INDEX" {
   let tokens = "CREATE UNIQUE INDEX idx_unique_email ON users (email);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE INDEX with multiple columns" {
   let tokens = "CREATE INDEX idx_name_age ON users (name, age DESC);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE INDEX with USING method" {
   let tokens = "CREATE INDEX idx_hash ON users USING HASH (id);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE INDEX with WHERE clause" {
   let tokens = "CREATE INDEX idx_active_users ON users (created_at) WHERE active = true;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE INDEX CONCURRENTLY" {
   let tokens = "CREATE INDEX CONCURRENTLY idx_concurrent ON users (email);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE INDEX IF NOT EXISTS" {
   let tokens = "CREATE INDEX IF NOT EXISTS idx_exists ON users (email);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE INDEX with NULLS ordering" {
   let tokens = "CREATE INDEX idx_ordered ON users (name ASC NULLS FIRST, age DESC NULLS LAST);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE INDEX with expression" {
   let tokens = "CREATE INDEX idx_lower_email ON users (LOWER(email));"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE UNIQUE INDEX with all options" {
   let tokens = "CREATE UNIQUE INDEX CONCURRENTLY IF NOT EXISTS idx_complex ON users USING BTREE (email ASC NULLS FIRST, created_at DESC) WHERE active = true;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Create table" {
   let tokens = "CREATE TABLE users;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Create table IF NOT EXISTS" {
   let tokens = "CREATE TABLE IF NOT EXISTS users (id INTEGER);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Create table AS SELECT" {
   let tokens = "CREATE TABLE students_2 AS SELECT * FROM students;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Create table AS SELECT with WHERE" {
   let tokens = "CREATE TABLE students_3 AS SELECT city, grade FROM students WHERE grade > 3.0;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Create table with two columns" {
   let tokens = "CREATE TABLE users (id INTEGER, name INTEGER);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
     #|  description TEXT,
     #|  profile_picture BLOB
     #|);
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "With options" {
   let tokens = "CREATE TABLE users (id INTEGER NOT NULL UNIQUE, name INTEGER DEFAULT 18);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Create view with columns" {
   let tokens = "CREATE VIEW user_view (id, name) AS SELECT id, name FROM users;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Drop view statement" {
   let tokens = "DROP VIEW user_view;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
     #|  PRIMARY KEY (id, name),
     #|  UNIQUE (name)
     #|);
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
     #|  name VARCHAR(100) UNIQUE,
     #|  FOREIGN KEY (id) REFERENCES other_table (other_id)
     #|);
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
     #|  name VARCHAR(100) UNIQUE,
     #|  FOREIGN KEY (name) REFERENCES other_table
     #|);
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
     #|  name VARCHAR(100) UNIQUE,
     #|  CHECK (id > 0)
     #|);
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Drop table" {
   let tokens = "DROP TABLE students;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Drop table IF EXISTS" {
   let tokens = "DROP TABLE IF EXISTS students;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "DROP INDEX - Simple" {
   let tokens = "DROP INDEX idx_name;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "DROP INDEX IF EXISTS" {
   let tokens = "DROP INDEX IF EXISTS idx_name;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "DROP INDEX CONCURRENTLY" {
   let tokens = "DROP INDEX CONCURRENTLY idx_name;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "DROP INDEX CONCURRENTLY IF EXISTS" {
   let tokens = "DROP INDEX CONCURRENTLY IF EXISTS idx_name;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "DROP INDEX with table name" {
   let tokens = "DROP INDEX idx_name ON users;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Alter table drop column" {
   let tokens = "ALTER TABLE mytable DROP COLUMN mycolumn;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Alter table drop column IF EXISTS" {
   let tokens = "ALTER TABLE mytable DROP COLUMN IF EXISTS mycolumn;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Alter table IF EXISTS drop column IF EXISTS" {
   let tokens = "ALTER TABLE IF EXISTS mytable DROP COLUMN IF EXISTS mycolumn;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "ALTER INDEX - RENAME TO" {
   let tokens = "ALTER INDEX idx_old RENAME TO idx_new;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "ALTER INDEX IF EXISTS RENAME TO" {
   let tokens = "ALTER INDEX IF EXISTS idx_old RENAME TO idx_new;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "ALTER INDEX - SET TABLESPACE" {
   let tokens = "ALTER INDEX idx_name SET TABLESPACE fast_ssd;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "ALTER INDEX - RESET parameters" {
   let tokens = "ALTER INDEX idx_name RESET (fillfactor, fastupdate);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "ALTER INDEX - SET parameters" {
   let tokens = "ALTER INDEX idx_name SET (fillfactor = 70, fastupdate = off);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "ALTER INDEX - Simple RENAME test" {
   let tokens = "ALTER INDEX idx_old RENAME TO idx_new;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "ALTER INDEX - Complex RENAME with quoted names" {
   let tokens = "ALTER INDEX \"old-index-name\" RENAME TO \"new-index-name\";"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(stmt, content="ALTER INDEX old-index-name RENAME TO new-index-name;")
 }
 
@@
 ///|
 test "CREATE DATABASE - Simple" {
   let tokens = "CREATE DATABASE mydb;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE DATABASE IF NOT EXISTS" {
   let tokens = "CREATE DATABASE IF NOT EXISTS mydb;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE DATABASE with CHARACTER SET" {
   let tokens = "CREATE DATABASE mydb CHARACTER SET utf8;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE DATABASE with CHARACTER SET and COLLATE" {
   let tokens = "CREATE DATABASE mydb CHARACTER SET utf8 COLLATE utf8_general_ci;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SCHEMA - Simple" {
   let tokens = "CREATE SCHEMA myschema;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SCHEMA IF NOT EXISTS" {
   let tokens = "CREATE SCHEMA IF NOT EXISTS myschema;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SCHEMA with AUTHORIZATION" {
   let tokens = "CREATE SCHEMA myschema AUTHORIZATION myuser;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE FUNCTION - Simple" {
   let tokens = "CREATE FUNCTION my_func() RETURNS INTEGER AS 'SELECT 1';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE FUNCTION IF NOT EXISTS" {
   let tokens = "CREATE FUNCTION IF NOT EXISTS my_func() RETURNS INTEGER AS 'SELECT 1';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE FUNCTION with parameters" {
   let tokens = "CREATE FUNCTION add_nums(IN a INTEGER, IN b INTEGER) RETURNS INTEGER LANGUAGE sql AS 'SELECT a + b';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE FUNCTION DETERMINISTIC" {
   let tokens = "CREATE FUNCTION my_func() RETURNS INTEGER DETERMINISTIC AS 'SELECT 1';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE PROCEDURE - Simple" {
   let tokens = "CREATE PROCEDURE my_proc() AS 'BEGIN SELECT 1; END';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE PROCEDURE with parameters" {
   let tokens = "CREATE PROCEDURE update_user(IN user_id INTEGER, IN new_name VARCHAR(100)) LANGUAGE plpgsql AS 'BEGIN UPDATE users SET name = new_name WHERE id = user_id; END';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE FUNCTION with OUT parameter" {
   let tokens = "CREATE FUNCTION get_user_info(IN user_id INTEGER, OUT user_name VARCHAR(100), OUT user_age INTEGER) AS 'SELECT name, age FROM users WHERE id = user_id';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE FUNCTION with INOUT parameter" {
   let tokens = "CREATE FUNCTION modify_value(INOUT value INTEGER) RETURNS INTEGER AS 'SELECT value * 2';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE - Simple" {
   let tokens = "CREATE SEQUENCE my_seq;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE IF NOT EXISTS" {
   let tokens = "CREATE SEQUENCE IF NOT EXISTS my_seq;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE TEMPORARY SEQUENCE" {
   let tokens = "CREATE TEMPORARY SEQUENCE temp_seq;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE with INCREMENT BY" {
   let tokens = "CREATE SEQUENCE my_seq INCREMENT BY 5;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE with MINVALUE and MAXVALUE" {
   let tokens = "CREATE SEQUENCE my_seq MINVALUE 1 MAXVALUE 1000;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE with NO MINVALUE NO MAXVALUE" {
   let tokens = "CREATE SEQUENCE my_seq NO MINVALUE NO MAXVALUE;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE with START WITH and CACHE" {
   let tokens = "CREATE SEQUENCE my_seq START WITH 10 CACHE 20;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE with CYCLE" {
   let tokens = "CREATE SEQUENCE my_seq CYCLE;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE with NO CYCLE" {
   let tokens = "CREATE SEQUENCE my_seq NO CYCLE;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE with OWNED BY" {
   let tokens = "CREATE SEQUENCE user_id_seq OWNED BY users.id;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE with OWNED BY NONE" {
   let tokens = "CREATE SEQUENCE my_seq OWNED BY NONE;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE with all options" {
   let tokens = "CREATE TEMPORARY SEQUENCE IF NOT EXISTS user_seq INCREMENT BY 2 MINVALUE 1 MAXVALUE 9999 START WITH 100 CACHE 10 CYCLE OWNED BY users.id;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
*** Update File: <WORKDIR>/src/dml.mbt
@@
 ///|
 test "Parse select with two columns" {
   let tokens = "SELECT col1, col2 FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Parse select with function call" {
   let tokens = "SELECT MAX(arg1, arg2), MIN() as m FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Nested expression" {
   let tokens = "SELECT sum(l_extendedprice * (1 - l_discount)) FROM lineitem;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Binary expression" {
   let tokens = "SELECT 1 + 2 * 3 FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Complecated binary expression" {
   let tokens = "SELECT sum(a * (1 - b) * (2 + b)) AS c FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Selection clause" {
   let tokens = "SELECT * FROM t WHERE id = 1;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
     #|  AND name ILIKE 'TEST' 
     #|  AND name NOT LIKE 'test2' 
     #|  AND name NOT ILIKE 'TEST2';
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "From multiple table refs" {
   let tokens = "SELECT * FROM t1, t2;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "SubQuery" {
   let tokens = "SELECT sub FROM (SELECT name FROM users WHERE active = true) AS sub;"
-  let stmt = parse_sql(tokens, dialect=Postgres::{  })[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens, dialect=Postgres::{  })[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Exists, not exists" {
   let tokens = "SELECT * FROM t WHERE EXISTS (SELECT 1 FROM t2) AND NOT EXISTS (SELECT 1 FROM t3);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Between and" {
   let tokens = "SELECT * FROM t WHERE id BETWEEN 1 AND 10;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Compound identifiers" {
   let tokens = "SELECT t1.col1, t2.col2 FROM t1, t2;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Extract function" {
   let tokens = "SELECT EXTRACT(YEAR FROM date_col) FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Aliasing omits AS" {
   let tokens = "SELECT col1 c1, col2 FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Case when" {
   let tokens = "SELECT CASE WHEN a > 0 THEN 'positive' WHEN a < 0 THEN 'negative' ELSE 'zero' END AS result FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Having" {
   let tokens = "SELECT col1, COUNT(*) FROM t GROUP BY col1 HAVING COUNT(*) > 1;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "In list" {
   let tokens = "SELECT * FROM t WHERE col1 IN (1, 2, 3);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "In subquery" {
   let tokens = "SELECT * FROM t WHERE col1 IN (SELECT col2 FROM t2);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Join with ON condition" {
   let tokens = "SELECT * FROM t1 JOIN t2 ON t1.id = t2.id;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Cross join" {
   let tokens = "SELECT * FROM t1 CROSS JOIN t2;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Left join" {
   let tokens = "SELECT * FROM t1 LEFT JOIN t2 ON t1.id = t2.id GROUP BY x;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Right join" {
   let tokens = "SELECT * FROM t1 RIGHT JOIN t2 ON t1.id = t2.id;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Full outer join" {
   let tokens = "SELECT * FROM t1 LEFT OUTER JOIN t2 ON t1.id = t2.id;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Null, true and false" {
   let tokens = "SELECT NULL, true, false FROM t1;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=Postgres::{  }, tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Unary plus and minus" {
   let tokens = "SELECT +1, -2 FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Unary not expression" {
   let tokens = "SELECT NOT a FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Using clause in join" {
   let tokens = "SELECT * FROM t1 JOIN t2 USING (id);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Multiple statements" {
   let tokens = "SELECT * FROM t1; SELECT * FROM t2;"
-  let stmts = parse_sql(tokens) |> pretty_print
+  let stmts = parse_sql_renamed(tokens) |> pretty_print
   inspect(
     stmts,
     content=(
@@
 ///|
 test "String literal as column" {
   let tokens = "SELECT test FROM 't';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Limit and offset" {
   let tokens = "SELECT * FROM t LIMIT 10 OFFSET 5;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Limit without offset" {
   let tokens = "SELECT * FROM t LIMIT N;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Offset without limit" {
   let tokens = "SELECT * FROM t OFFSET N;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Duplicate treatment" {
   let tokens = "SELECT COUNT(DISTINCT *) FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Substring" {
   let tokens = "SELECT SUBSTRING(col FROM 1 FOR 5) FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Substring with start only" {
   let tokens = "SELECT SUBSTRING(col FROM 1) FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Substring another way" {
   let tokens = "SELECT SUBSTRING(col, 1, 5) FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test {
   let tokens = "SELECT * FROM t1 UNION (SELECT * FROM t2 UNION SELECT * FROM t3) ORDER BY col1;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Non projections" {
   let tokens = "SELECT FROM t1;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Top 10" {
   let tokens = "SELECT TOP 10 * FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Insert with values - simple" {
   let tokens = "INSERT INTO test_table VALUES (1, 2, 'test');"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Insert with columns and values" {
   let tokens = "INSERT INTO test_table (id, value, name) VALUES (1, 2, 'test');"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Insert with SELECT" {
   let tokens = "INSERT INTO test_table SELECT * FROM students;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Insert with schema" {
   let tokens = "INSERT INTO some_schema.test_table SELECT * FROM another_schema.students;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 /// PostgreSQL ON CONFLICT Tests
 test "INSERT with ON CONFLICT DO NOTHING" {
   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT DO NOTHING;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "INSERT with ON CONFLICT (column) DO NOTHING" {
   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT (email) DO NOTHING;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "INSERT with ON CONFLICT (multiple columns) DO UPDATE" {
   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT (id, email) DO UPDATE SET name = EXCLUDED.name;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "INSERT with ON CONFLICT ON CONSTRAINT" {
   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT ON CONSTRAINT users_email_key DO UPDATE SET name = EXCLUDED.name;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "INSERT with ON CONFLICT DO UPDATE with WHERE" {
   let tokens = "INSERT INTO users (id, name, email, active) VALUES (1, 'John', 'john@example.com', true) ON CONFLICT (email) DO UPDATE SET name = EXCLUDED.name, active = EXCLUDED.active WHERE users.created_at < NOW();"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "INSERT with ON CONFLICT (expression) WHERE condition" {
   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT (LOWER(email)) WHERE active = true DO UPDATE SET name = EXCLUDED.name;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Delete with WHERE" {
   let tokens = "DELETE FROM students WHERE grade > 3.0;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Delete without WHERE" {
   let tokens = "DELETE FROM students;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Update with single assignment and WHERE" {
   let tokens = "UPDATE students SET grade = 1.3 WHERE name = 'Max Mustermann';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Update with multiple assignments and WHERE" {
   let tokens = "UPDATE students SET grade = 1.3, name='Felix Fürstenberg' WHERE name = 'Max Mustermann';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Update without WHERE" {
   let tokens = "UPDATE students SET grade = 1.0;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Truncate table" {
   let tokens = "TRUNCATE students;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 
 test "Simple CTE with WITH clause" {
   let tokens = "WITH sales AS (SELECT * FROM orders) SELECT * FROM sales;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CTE with column specification" {
   let tokens = "WITH sales(id, total) AS (SELECT order_id, amount FROM orders) SELECT * FROM sales;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Multiple CTEs" {
   let tokens = "WITH sales AS (SELECT * FROM orders), customers AS (SELECT * FROM users) SELECT * FROM sales JOIN customers ON sales.user_id = customers.id;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CTE with ORDER BY and LIMIT" {
   let tokens = "WITH top_sales AS (SELECT * FROM orders ORDER BY amount DESC LIMIT 10) SELECT * FROM top_sales;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Nested CTE (CTE referencing another CTE)" {
   let tokens = "WITH sales AS (SELECT * FROM orders), big_sales AS (SELECT * FROM sales WHERE amount > 1000) SELECT * FROM big_sales;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CTE with aggregation" {
   let tokens = "WITH monthly_sales AS (SELECT date_month, SUM(amount) as total FROM orders GROUP BY date_month) SELECT * FROM monthly_sales;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 /// Window Functions Tests
 test "Simple window function with empty OVER clause" {
   let tokens = "SELECT rank() OVER () FROM test;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Window function with ORDER BY" {
   let tokens = "SELECT rank() OVER (ORDER BY salary DESC) FROM employees;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Window function with PARTITION BY" {
   let tokens = "SELECT count(*) OVER (PARTITION BY department) FROM employees;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Window function with PARTITION BY and ORDER BY" {
   let tokens = "SELECT row_number() OVER (PARTITION BY department ORDER BY salary DESC) FROM employees;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Window function with ROWS frame - UNBOUNDED PRECEDING" {
   let tokens = "SELECT sum(salary) OVER (ORDER BY hire_date ROWS UNBOUNDED PRECEDING) FROM employees;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Window function with ROWS frame - BETWEEN" {
   let tokens = "SELECT avg(salary) OVER (ORDER BY hire_date ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) FROM employees;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MERGE - Simple" {
   let tokens = "MERGE INTO target_table USING source_table ON target_table.id = source_table.id WHEN MATCHED THEN UPDATE SET name = source_table.name WHEN NOT MATCHED THEN INSERT VALUES (source_table.id, source_table.name);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MERGE with table aliases" {
   let tokens = "MERGE INTO customers c USING customer_updates cu ON c.id = cu.id WHEN MATCHED THEN UPDATE SET name = cu.name;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MERGE with subquery source" {
   let tokens = "MERGE INTO dest_table t USING (SELECT id, name FROM source) s ON t.id = s.id WHEN NOT MATCHED THEN INSERT (id, name) VALUES (s.id, s.name);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MERGE with conditional WHEN" {
   let tokens = "MERGE INTO products p USING updates u ON p.id = u.id WHEN MATCHED AND u.price > p.price THEN UPDATE SET price = u.price WHEN NOT MATCHED THEN INSERT VALUES (u.id, u.name, u.price);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MERGE with DELETE action" {
   let tokens = "MERGE INTO inventory i USING changes c ON i.id = c.id WHEN MATCHED AND c.quantity = 0 THEN DELETE WHEN MATCHED THEN UPDATE SET quantity = c.quantity;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
*** Update File: <WORKDIR>/src/export.mbt
@@
 } derive(Debug)
 
 ///|
-pub fn parse_sql(
+pub fn parse_sql_renamed(
   dialect? : &Dialect = MySQL::{  },
   input : String,
 ) -> Statements raise SqlParserError {
*** Update File: <WORKDIR>/src/mysql.mbt
@@
 ///|
 test "MySQL SHOW TABLES" {
   let tokens = "SHOW TABLES;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SHOW COLUMNS FROM table" {
   let tokens = "SHOW COLUMNS FROM users;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SHOW TABLES LIKE pattern" {
   let tokens = "SHOW TABLES LIKE 'user%';"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL with backticks in SHOW" {
   let tokens = "SHOW COLUMNS FROM `table name`;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL LOCK TABLES" {
   let tokens = "LOCK TABLES users;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL UNLOCK TABLES" {
   let tokens = "UNLOCK TABLES;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL DIV operator" {
   let tokens = "SELECT 10 DIV 3 FROM test;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SHOW VARIABLES" {
   let tokens = "SHOW VARIABLES;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SHOW GLOBAL STATUS" {
   let tokens = "SHOW GLOBAL STATUS;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SHOW FULL PROCESSLIST" {
   let tokens = "SHOW FULL PROCESSLIST;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SHOW CREATE TABLE" {
   let tokens = "SHOW CREATE TABLE users;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SHOW EXTENDED COLUMNS" {
   let tokens = "SHOW EXTENDED COLUMNS FROM users LIKE 'name%';"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SET session variable" {
   let tokens = "SET SESSION sql_mode = 'STRICT_TRANS_TABLES';"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SET global variable" {
   let tokens = "SET GLOBAL max_connections = 200;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SET user variable" {
   let tokens = "SET @counter = 1;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SET multiple variables" {
   let tokens = "SET @name = 'John', @age = 30, @salary = 50000.50;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SET local variable" {
   let tokens = "SET autocommit = 0;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL REPLACE INTO statement" {
   let tokens = "REPLACE INTO users (id, name) VALUES (1, 'John');"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL REPLACE INTO with multiple values" {
   let tokens = "REPLACE INTO products (id, name, price) VALUES (1, 'Widget', 10.50), (2, 'Gadget', 15.00);"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL INSERT OR REPLACE statement" {
   let tokens = "INSERT OR REPLACE INTO settings (key, value) VALUES ('theme', 'dark');"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL INSERT with ON DUPLICATE KEY UPDATE" {
   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON DUPLICATE KEY UPDATE name = 'John Updated', email = 'john.new@example.com';"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL INSERT single assignment ON DUPLICATE KEY UPDATE" {
   let tokens = "INSERT INTO counters (id, count) VALUES (1, 1) ON DUPLICATE KEY UPDATE count = count + 1;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL REPLACE with ON DUPLICATE KEY UPDATE" {
   let tokens = "REPLACE INTO settings (setting_key, setting_value) VALUES ('theme', 'dark') ON DUPLICATE KEY UPDATE setting_value = 'light';"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL basic LOAD DATA statement" {
   let tokens = "LOAD DATA INFILE '/tmp/data.csv' INTO TABLE users;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL LOAD DATA with LOCAL and REPLACE" {
   let tokens = "LOAD DATA LOCAL INFILE '/tmp/users.txt' REPLACE INTO TABLE employees;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL LOAD DATA with FIELDS options" {
   let tokens = "LOAD DATA INFILE '/data/products.csv' INTO TABLE products CHARACTER SET utf8 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL LOAD DATA with LINES options" {
   let tokens = "LOAD DATA INFILE '/tmp/logs.txt' INTO TABLE logs LINES STARTING BY '>>>' TERMINATED BY '\n' IGNORE 5 LINES;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL LOAD DATA with column list and SET" {
   let tokens = "LOAD DATA INFILE '/data/sales.csv' IGNORE INTO TABLE sales FIELDS TERMINATED BY ',' (date, amount, customer) SET created_at = now();"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
*** Update File: <WORKDIR>/src/parameterized.mbt
@@
 ///|
 test "Question mark placeholder in WHERE clause" {
   let sql = "SELECT * FROM users WHERE id = ?;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Multiple question mark placeholders" {
   let sql = "SELECT * FROM users WHERE age > ? AND name = ?;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Question mark placeholder in INSERT" {
   let sql = "INSERT INTO users (name, age) VALUES (?, ?);"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Question mark placeholder in UPDATE" {
   let sql = "UPDATE users SET name = ?, age = ? WHERE id = ?;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Question mark placeholder in LIMIT" {
   let sql = "SELECT * FROM users LIMIT ?;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Question mark placeholder in LIMIT and OFFSET" {
   let sql = "SELECT * FROM users LIMIT ? OFFSET ?;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL $1 numbered placeholder" {
   let sql = "SELECT * FROM users WHERE id = $1;"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL multiple numbered placeholders" {
   let sql = "SELECT * FROM users WHERE age > $1 AND name = $2;"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL numbered placeholders in INSERT" {
   let sql = "INSERT INTO users (name, age, email) VALUES ($1, $2, $3);"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
   inspect(
     stmt,
     content="INSERT INTO users (name, age, email) VALUES ($1, $2, $3);",
@@
 ///|
 test "PostgreSQL numbered placeholders in LIMIT OFFSET" {
   let sql = "SELECT * FROM users LIMIT $1 OFFSET $2;"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL numbered placeholders out of order" {
   let sql = "SELECT * FROM users WHERE id = $2 AND name = $1;"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Colon named parameter" {
   let sql = "SELECT * FROM users WHERE name = :username;"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Multiple colon named parameters" {
   let sql = "SELECT * FROM users WHERE age > :min_age AND city = :city_name;"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Colon named parameters in INSERT" {
   let sql = "INSERT INTO users (name, age) VALUES (:name, :age);"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
   inspect(stmt, content="INSERT INTO users (name, age) VALUES (:name, :age);")
 }
 
@@
 ///|
 test "At-sign named parameter" {
   let sql = "SELECT * FROM users WHERE name = @username;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Multiple at-sign named parameters" {
   let sql = "SELECT * FROM users WHERE age > @min_age AND city = @city_name;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Placeholder in function call" {
   let sql = "SELECT UPPER(?) FROM users;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Placeholder in expression" {
   let sql = "SELECT * FROM users WHERE age + ? > 100;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Placeholder in BETWEEN clause" {
   let sql = "SELECT * FROM users WHERE age BETWEEN ? AND ?;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Placeholder in IN list" {
   let sql = "SELECT * FROM users WHERE id IN (?, ?, ?);"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL numbered placeholder in CASE expression" {
   let sql = "SELECT CASE WHEN age > $1 THEN 'old' ELSE 'young' END FROM users;"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Named parameter in JOIN condition" {
   let sql = "SELECT * FROM users u JOIN orders o ON u.id = o.user_id WHERE o.total > :min_total;"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
   let sql1 = "SELECT * FROM users WHERE id = ?;"
   let sql2 = "SELECT * FROM users WHERE id = $1;"
   let sql3 = "SELECT * FROM users WHERE id = :user_id;"
-  let stmt1 = parse_sql(dialect=MySQL::{  }, sql1).stmts[0] |> pretty_print
+  let stmt1 = parse_sql_renamed(dialect=MySQL::{  }, sql1).stmts[0] |> pretty_print
-  let stmt2 = parse_sql(dialect=Postgres::{  }, sql2).stmts[0] |> pretty_print
+  let stmt2 = parse_sql_renamed(dialect=Postgres::{  }, sql2).stmts[0] |> pretty_print
-  let stmt3 = parse_sql(dialect=Postgres::{  }, sql3).stmts[0] |> pretty_print
+  let stmt3 = parse_sql_renamed(dialect=Postgres::{  }, sql3).stmts[0] |> pretty_print
   inspect(
     stmt1,
     content=(
@@
 ///|
 test "Placeholder in DELETE statement" {
   let sql = "DELETE FROM users WHERE id = ?;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
*** Update File: <WORKDIR>/src/postgres.mbt
@@
 ///|
 test "PostgreSQL LISTEN" {
   let tokens = "LISTEN my_channel;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL NOTIFY without payload" {
   let tokens = "NOTIFY my_channel;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL NOTIFY with payload" {
   let tokens = "NOTIFY my_channel, 'hello world';"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 
 test "PostgreSQL ARRAY syntax with integers" {
   let tokens = "SELECT ARRAY[1, 2, 3, 4] FROM test;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL bracket array syntax" {
   let tokens = "SELECT [1, 2, 3] FROM test;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL empty ARRAY" {
   let tokens = "SELECT ARRAY[] FROM test;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL ARRAY with strings" {
   let tokens = "SELECT ARRAY['hello', 'world'] FROM test;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL nested arrays" {
   let tokens = "SELECT ARRAY[ARRAY[1, 2], ARRAY[3, 4]] FROM test;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL mixed bracket and ARRAY syntax" {
   let tokens = "SELECT ARRAY[[1, 2], [3, 4]] FROM test;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 test "ARRAY syntax fails with MySQL dialect" {
   let tokens = "SELECT ARRAY[1, 2, 3] FROM test;"
   try {
-    let _ = parse_sql(dialect=MySQL::{  }, tokens)
+    let _ = parse_sql_renamed(dialect=MySQL::{  }, tokens)
     abort("Expected parsing to fail with MySQL dialect")
   } catch {
     _e => () // Expected behavior - parsing should fail (escaped)
@@
 test "Bracket array syntax fails with MySQL dialect" {
   let tokens = "SELECT [1, 2, 3] FROM test;"
   try {
-    let _ = parse_sql(dialect=MySQL::{  }, tokens)
+    let _ = parse_sql_renamed(dialect=MySQL::{  }, tokens)
     abort("Expected parsing to fail with MySQL dialect")
   } catch {
     _e => () // Expected behavior - parsing should fail (escaped)
@@
 test "ARRAY syntax fails with SQLite dialect" {
   let tokens = "SELECT ARRAY[1, 2, 3] FROM test;"
   try {
-    let _ = parse_sql(dialect=SQLite::{  }, tokens)
+    let _ = parse_sql_renamed(dialect=SQLite::{  }, tokens)
     abort("Expected parsing to fail with SQLite dialect")
   } catch {
     _e => () // Expected behavior - parsing should fail (escaped)
@@
 test "Bracket array syntax fails with SQLite dialect" {
   let tokens = "SELECT [1, 2, 3] FROM test;"
   try {
-    let _ = parse_sql(dialect=SQLite::{  }, tokens)
+    let _ = parse_sql_renamed(dialect=SQLite::{  }, tokens)
     abort("Expected parsing to fail with SQLite dialect")
   } catch {
     _e => () // Expected behavior - parsing should fail (escaped)
@@
 test "LISTEN statement fails with MySQL dialect" {
   let tokens = "LISTEN my_channel;"
   try {
-    let _ = parse_sql(dialect=MySQL::{  }, tokens)
+    let _ = parse_sql_renamed(dialect=MySQL::{  }, tokens)
     abort("Expected parsing to fail with MySQL dialect")
   } catch {
     _e => () // Expected behavior - parsing should fail (escaped)
@@
 test "NOTIFY statement fails with MySQL dialect" {
   let tokens = "NOTIFY my_channel;"
   try {
-    let _ = parse_sql(dialect=MySQL::{  }, tokens)
+    let _ = parse_sql_renamed(dialect=MySQL::{  }, tokens)
     abort("Expected parsing to fail with MySQL dialect")
   } catch {
     _e => () // Expected behavior - parsing should fail (escaped)
@@
 test "Complex PostgreSQL arrays fail with generic dialect" {
   let tokens = "SELECT ARRAY[ARRAY[1, 2], [3, 4]] FROM test;"
   try {
-    let _ = parse_sql(dialect=Generic::{  }, tokens)
+    let _ = parse_sql_renamed(dialect=Generic::{  }, tokens)
     abort("Expected parsing to fail with Generic dialect")
   } catch {
     _e => () // Expected behavior - parsing should fail (escaped)
@@
 
 test "PostgreSQL JSON extract operator" {
   let tokens = "SELECT data -> 'key' FROM json_table;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL JSON extract text operator" {
   let tokens = "SELECT data ->> 'key' FROM json_table;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL JSON path extract operator" {
   let tokens = "SELECT data #> ARRAY['key', 'subkey'] FROM json_table;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL JSON contains operator" {
   let tokens = "SELECT data @> '{\"key\":\"value\"}' FROM json_table;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL JSON contained in operator" {
   let tokens = "SELECT '{\"a\":1}' <@ data FROM json_table;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 
 test "PostgreSQL COUNT with FILTER" {
   let tokens = "SELECT count(*) FILTER (WHERE active) FROM users;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL COUNT without FILTER" {
   let tokens = "SELECT count(*) FROM users;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL SUM with FILTER" {
   let tokens = "SELECT sum(amount) FILTER (WHERE status = 'completed') FROM orders;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL multiple aggregations with FILTER" {
   let tokens = "SELECT count(*) FILTER (WHERE active), avg(age) FILTER (WHERE age > 18) FROM users;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql_renamed(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
*** Update File: <WORKDIR>/src/prepare.mbt
@@
 ///|
 test "PREPARE simple SELECT" {
   let sql = "PREPARE stmt AS SELECT * FROM users WHERE id = ?"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql_renamed(sql)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PREPARE with data types" {
   let sql = "PREPARE stmt (INTEGER, VARCHAR(50)) AS SELECT * FROM users WHERE id = ? AND name = ?"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql_renamed(sql)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PREPARE INSERT statement" {
   let sql = "PREPARE insert_user AS INSERT INTO users (name, email) VALUES (?, ?)"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql_renamed(sql)[0] |> pretty_print
   inspect(
     stmt,
     content="PREPARE insert_user AS INSERT INTO users (name, email) VALUES (?, ?);",
@@
 ///|
 test "PREPARE UPDATE statement" {
   let sql = "PREPARE update_user AS UPDATE users SET name = ? WHERE id = ?"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql_renamed(sql)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PREPARE DELETE statement" {
   let sql = "PREPARE delete_user AS DELETE FROM users WHERE id = ?"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql_renamed(sql)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PREPARE with PostgreSQL numbered placeholders" {
   let sql = "PREPARE stmt (INTEGER, TEXT) AS SELECT * FROM users WHERE id = $1 AND name = $2"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql_renamed(sql)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PREPARE with named parameters" {
   let sql = "PREPARE stmt AS SELECT * FROM users WHERE id = :id AND name = :name"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql_renamed(sql)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PREPARE with complex query" {
   let sql = "PREPARE complex_query AS SELECT u.id, u.name, COUNT(o.id) as order_count FROM users u LEFT JOIN orders o ON u.id = o.user_id WHERE u.is_active = ? GROUP BY u.id, u.name HAVING COUNT(o.id) > ?"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql_renamed(sql)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PREPARE with subquery" {
   let sql = "PREPARE subquery_stmt AS SELECT * FROM users WHERE id IN (SELECT user_id FROM orders WHERE amount > ?)"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql_renamed(sql)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PREPARE with window function" {
   let sql = "PREPARE window_stmt AS SELECT name, salary, RANK() OVER (ORDER BY salary DESC) as rank FROM employees WHERE department = ?"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql_renamed(sql)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PREPARE with CTE" {
   let sql = "PREPARE cte_stmt AS WITH recent_orders AS (SELECT * FROM orders WHERE created_at > ?) SELECT * FROM recent_orders WHERE status = ?"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql_renamed(sql)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "EXECUTE simple" {
   let sql = "EXECUTE stmt"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql_renamed(sql)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "EXECUTE with parenthesized parameters" {
   let sql = "EXECUTE stmt(1, 'John')"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql_renamed(sql)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "EXECUTE with USING clause" {
   let sql = "EXECUTE stmt USING 1, 'John'"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql_renamed(sql)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "EXECUTE with complex expressions" {
   let sql = "EXECUTE stmt USING 1 + 2, CONCAT('Hello', ' World')"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql_renamed(sql)[0] |> pretty_print
   inspect(stmt, content="EXECUTE stmt USING 1 + 2, concat('Hello', ' World');")
 }
 
@@
 ///|
 test "EXECUTE IMMEDIATE" {
   let sql = "EXECUTE IMMEDIATE"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql_renamed(sql)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "EXECUTE IMMEDIATE with INTO" {
   let sql = "EXECUTE IMMEDIATE INTO v_result"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql_renamed(sql)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "EXECUTE IMMEDIATE with INTO and USING" {
   let sql = "EXECUTE IMMEDIATE INTO v_result USING 1, 'test'"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql_renamed(sql)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "EXECUTE with multiple INTO variables" {
   let sql = "EXECUTE IMMEDIATE INTO v_name, v_email, v_age"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql_renamed(sql)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "DEALLOCATE simple" {
   let sql = "DEALLOCATE stmt"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql_renamed(sql)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "DEALLOCATE with PREPARE keyword" {
   let sql = "DEALLOCATE PREPARE stmt"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql_renamed(sql)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 test "PREPARE and EXECUTE separately" {
   let sql1 = "PREPARE user_query AS SELECT * FROM users WHERE id = ?"
   let sql2 = "EXECUTE user_query(123)"
-  let stmt1 = parse_sql(sql1)[0] |> pretty_print
+  let stmt1 = parse_sql_renamed(sql1)[0] |> pretty_print
-  let stmt2 = parse_sql(sql2)[0] |> pretty_print
+  let stmt2 = parse_sql_renamed(sql2)[0] |> pretty_print
   inspect(
     stmt1,
     content=(
@@
 ///|
 test "PREPARE with multiple data types" {
   let sql = "PREPARE stmt (INTEGER, VARCHAR(100), DOUBLE) AS SELECT * FROM users WHERE id = ?"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql_renamed(sql)[0] |> pretty_print
   inspect(
     stmt,
     content=(
*** Update File: <WORKDIR>/src/tcl.mbt
@@
 
 test "BEGIN statement" {
   let tokens = "BEGIN;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "BEGIN WORK statement" {
   let tokens = "BEGIN WORK;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "BEGIN TRANSACTION statement" {
   let tokens = "BEGIN TRANSACTION;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "START TRANSACTION statement" {
   let tokens = "START TRANSACTION;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "COMMIT statement" {
   let tokens = "COMMIT;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "COMMIT WORK statement" {
   let tokens = "COMMIT WORK;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "ROLLBACK statement" {
   let tokens = "ROLLBACK;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "ROLLBACK TO SAVEPOINT statement" {
   let tokens = "ROLLBACK TO SAVEPOINT sp1;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "SAVEPOINT statement" {
   let tokens = "SAVEPOINT sp1;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "RELEASE SAVEPOINT statement" {
   let tokens = "RELEASE SAVEPOINT sp1;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql_renamed(tokens)[0] |> pretty_print
   inspect(
     stmt,
     content=(
*** Update File: <WORKDIR>/src/tests/dialect_test.mbt
@@
 
 ///|
 test "MySQL SHOW TABLES statement" {
-  let sql = @sqlparser.parse_sql("SHOW TABLES;")
+  let sql = @sqlparser.parse_sql_renamed("SHOW TABLES;")
   inspect(sql.stmts.length(), content="1")
   let pretty = sql.stmts[0] |> @sqlparser.pretty_print
   inspect(pretty, content="SHOW TABLES;")
@@
 
 ///|
 test "MySQL SHOW COLUMNS with FROM" {
-  let sql = @sqlparser.parse_sql("SHOW COLUMNS FROM users;")
+  let sql = @sqlparser.parse_sql_renamed("SHOW COLUMNS FROM users;")
   inspect(sql.stmts.length(), content="1")
   let pretty = sql.stmts[0] |> @sqlparser.pretty_print
   inspect(pretty, content="SHOW COLUMNS FROM users;")
@@
 
 ///|
 test "MySQL SHOW TABLES with LIKE filter" {
-  let sql = @sqlparser.parse_sql("SHOW TABLES LIKE 'user%';")
+  let sql = @sqlparser.parse_sql_renamed("SHOW TABLES LIKE 'user%';")
   inspect(sql.stmts.length(), content="1")
   let pretty = sql.stmts[0] |> @sqlparser.pretty_print
   inspect(pretty, content="SHOW TABLES LIKE 'user%';")
@@
 
 ///|
 test "MySQL SHOW STATUS statement" {
-  let sql = @sqlparser.parse_sql("SHOW STATUS;")
+  let sql = @sqlparser.parse_sql_renamed("SHOW STATUS;")
   inspect(sql.stmts.length(), content="1")
   let pretty = sql.stmts[0] |> @sqlparser.pretty_print
   inspect(pretty, content="SHOW STATUS;")
@@
 
 ///|
 test "MySQL SHOW DATABASES statement" {
-  let sql = @sqlparser.parse_sql("SHOW DATABASES;")
+  let sql = @sqlparser.parse_sql_renamed("SHOW DATABASES;")
   inspect(sql.stmts.length(), content="1")
   let pretty = sql.stmts[0] |> @sqlparser.pretty_print
   inspect(pretty, content="SHOW DATABASES;")
@@
 
 ///|
 test "MySQL backtick quoted table names" {
-  let sql = @sqlparser.parse_sql("SELECT * FROM `table name`;")
+  let sql = @sqlparser.parse_sql_renamed("SELECT * FROM `table name`;")
   inspect(sql.stmts.length(), content="1")
   let pretty = sql.stmts[0] |> @sqlparser.pretty_print
   inspect(pretty, content="SELECT\n  *\nFROM\n  `table name`;")
@@
 
 ///|
 test "MySQL backtick quoted column names" {
-  let sql = @sqlparser.parse_sql(
+  let sql = @sqlparser.parse_sql_renamed(
     "SELECT `column name`, `another col` FROM users;",
   )
   inspect(sql.stmts.length(), content="1")
@@
 
 ///|
 test "MySQL backtick quoted database.table" {
-  let sql = @sqlparser.parse_sql("SELECT * FROM `my db`.`my table`;")
+  let sql = @sqlparser.parse_sql_renamed("SELECT * FROM `my db`.`my table`;")
   inspect(sql.stmts.length(), content="1")
   let pretty = sql.stmts[0] |> @sqlparser.pretty_print
   inspect(pretty, content="SELECT\n  *\nFROM\n  `my db`.`my table`;")
@@
 
 ///|
 test "MySQL mixed quoted and unquoted identifiers" {
-  let sql = @sqlparser.parse_sql("SELECT id, `full name` FROM users;")
+  let sql = @sqlparser.parse_sql_renamed("SELECT id, `full name` FROM users;")
   inspect(sql.stmts.length(), content="1")
 }
 
 ///|
 test "MySQL backtick with spaces in WHERE clause" {
-  let sql = @sqlparser.parse_sql(
+  let sql = @sqlparser.parse_sql_renamed(
     "SELECT * FROM users WHERE `first name` = 'John';",
   )
   inspect(sql.stmts.length(), content="1")
@@
 
 ///|
 test "MySQL complex backtick identifiers" {
-  let sql = @sqlparser.parse_sql(
+  let sql = @sqlparser.parse_sql_renamed(
     "SELECT `user-id`, `total.amount`, `my column` FROM `my-database`.`user-table`;",
   )
   inspect(sql.stmts.length(), content="1")
@@
 
 ///|
 test "MySQL string literal with backslash escapes" {
-  let sql = @sqlparser.parse_sql("SELECT 'It\\'s working' FROM dual;")
+  let sql = @sqlparser.parse_sql_renamed("SELECT 'It\\'s working' FROM dual;")
   inspect(sql.stmts.length(), content="1")
 }
 
 ///|
 test "MySQL string literal with escaped quotes" {
-  let sql = @sqlparser.parse_sql("SELECT 'Say \"hello\" world' FROM dual;")
+  let sql = @sqlparser.parse_sql_renamed("SELECT 'Say \"hello\" world' FROM dual;")
   inspect(sql.stmts.length(), content="1")
 }
 
 ///|
 test "MySQL string literal with escaped backslashes" {
-  let sql = @sqlparser.parse_sql(
+  let sql = @sqlparser.parse_sql_renamed(
     "SELECT 'Path: C:\\\\Users\\\\name' FROM dual;",
   )
   inspect(sql.stmts.length(), content="1")
@@
 
 ///|
 test "MySQL SHOW COLUMNS with complex table name" {
-  let sql = @sqlparser.parse_sql("SHOW COLUMNS FROM `user data`;")
+  let sql = @sqlparser.parse_sql_renamed("SHOW COLUMNS FROM `user data`;")
   inspect(sql.stmts.length(), content="1")
   let pretty = sql.stmts[0] |> @sqlparser.pretty_print
   inspect(pretty, content="SHOW COLUMNS FROM `user data`;")
@@
 
 ///|
 test "MySQL SHOW TABLES with complex pattern" {
-  let sql = @sqlparser.parse_sql("SHOW TABLES LIKE 'test_%_data';")
+  let sql = @sqlparser.parse_sql_renamed("SHOW TABLES LIKE 'test_%_data';")
   inspect(sql.stmts.length(), content="1")
   let pretty = sql.stmts[0] |> @sqlparser.pretty_print
   inspect(pretty, content="SHOW TABLES LIKE 'test_%_data';")
@@
 
 ///|
 test "Standard SELECT with various clauses" {
-  let sql = @sqlparser.parse_sql(
+  let sql = @sqlparser.parse_sql_renamed(
     "SELECT DISTINCT id, name FROM users WHERE id > 10 ORDER BY name LIMIT 5;",
   )
   inspect(sql.stmts.length(), content="1")
@@
 
 ///|
 test "CREATE TABLE with various data types" {
-  let sql = @sqlparser.parse_sql(
+  let sql = @sqlparser.parse_sql_renamed(
     "CREATE TABLE users (id INTEGER, name VARCHAR(50), created_at TIMESTAMP);",
   )
   inspect(sql.stmts.length(), content="1")
@@
 
 ///|
 test "INSERT statement with values" {
-  let sql = @sqlparser.parse_sql(
+  let sql = @sqlparser.parse_sql_renamed(
     "INSERT INTO users (id, name) VALUES (1, 'John'), (2, 'Jane');",
   )
   inspect(sql.stmts.length(), content="1")
@@
 
 ///|
 test "UPDATE statement with WHERE clause" {
-  let sql = @sqlparser.parse_sql(
+  let sql = @sqlparser.parse_sql_renamed(
     "UPDATE users SET name = 'Updated Name' WHERE id = 1;",
   )
   inspect(sql.stmts.length(), content="1")
@@
 
 ///|
 test "DELETE statement with WHERE clause" {
-  let sql = @sqlparser.parse_sql("DELETE FROM users WHERE id = 1;")
+  let sql = @sqlparser.parse_sql_renamed("DELETE FROM users WHERE id = 1;")
   inspect(sql.stmts.length(), content="1")
 }
 
@@
 
 ///|
 test "MySQL boolean literals in SELECT" {
-  let sql = @sqlparser.parse_sql("SELECT TRUE, FALSE FROM dual;")
+  let sql = @sqlparser.parse_sql_renamed("SELECT TRUE, FALSE FROM dual;")
   inspect(sql.stmts.length(), content="1")
 }
 
 ///|
 test "MySQL boolean literals in WHERE" {
-  let sql = @sqlparser.parse_sql("SELECT * FROM users WHERE active = TRUE;")
+  let sql = @sqlparser.parse_sql_renamed("SELECT * FROM users WHERE active = TRUE;")
   inspect(sql.stmts.length(), content="1")
 }
*** Update File: <WORKDIR>/src/tests/good_test.mbt
@@
 
 ///|
 fn pass(input : String) -> Unit {
-  (@sqlparser.parse_sql(input) catch {
+  (@sqlparser.parse_sql_renamed(input) catch {
     e => { (escaped)
       println(e)
       panic()
*** Update File: <WORKDIR>/src/tests/tpch_test.mbt
@@
       panic()
     }
   }
-  @sqlparser.parse_sql(input) catch {
+  @sqlparser.parse_sql_renamed(input) catch {
     LexerError(e) => { (escaped)
       println(e)
       panic()
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename pretty_print pretty_print_renamed --loc 'src/ast.mbt:2:24'
*** Begin Patch
*** Update File: <WORKDIR>/src/ast.mbt
@@
 ///|
-pub fn[T : @pp.Pretty] pretty_print(obj : T) -> String {
+pub fn[T : @pp.Pretty] pretty_print_renamed(obj : T) -> String {
   @pp.pretty(obj).to_string()
 }
 
*** Update File: <WORKDIR>/src/bigquery.mbt
@@
 
 test "BigQuery named parameter" {
   let tokens = "SELECT * FROM users WHERE id = @user_id;"
-  let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "BigQuery positional parameter" {
   let tokens = "SELECT * FROM users WHERE id = ?;"
-  let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "BigQuery mixed parameters" {
   let tokens = "SELECT * FROM users WHERE id = @user_id AND age > ?;"
-  let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "BigQuery multiple named parameters" {
   let tokens = "SELECT @field FROM @table WHERE @condition = @value;"
-  let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 test "Named parameters treated as identifiers in MySQL" {
   let tokens = "SELECT @user_id FROM users;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
*** Update File: <WORKDIR>/src/dcl.mbt
@@
 
 test "GRANT SELECT statement" {
   let tokens = "GRANT SELECT ON users TO alice;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "GRANT multiple privileges statement" {
   let tokens = "GRANT SELECT, INSERT, UPDATE ON users TO alice, bob;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "GRANT with column specification" {
   let tokens = "GRANT SELECT (name, email), UPDATE (email) ON users TO alice;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "GRANT ALL PRIVILEGES statement" {
   let tokens = "GRANT ALL PRIVILEGES ON users TO alice WITH GRANT OPTION;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "REVOKE SELECT statement" {
   let tokens = "REVOKE SELECT ON users FROM alice;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "REVOKE with CASCADE" {
   let tokens = "REVOKE ALL PRIVILEGES ON users FROM alice CASCADE;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "REVOKE GRANT OPTION FOR" {
   let tokens = "REVOKE GRANT OPTION FOR SELECT ON users FROM alice RESTRICT;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
*** Update File: <WORKDIR>/src/ddl.mbt
@@
 /// CREATE INDEX Tests
 test "CREATE INDEX - Simple" {
   let tokens = "CREATE INDEX idx_name ON users (email);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE UNIQUE INDEX" {
   let tokens = "CREATE UNIQUE INDEX idx_unique_email ON users (email);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE INDEX with multiple columns" {
   let tokens = "CREATE INDEX idx_name_age ON users (name, age DESC);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE INDEX with USING method" {
   let tokens = "CREATE INDEX idx_hash ON users USING HASH (id);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE INDEX with WHERE clause" {
   let tokens = "CREATE INDEX idx_active_users ON users (created_at) WHERE active = true;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE INDEX CONCURRENTLY" {
   let tokens = "CREATE INDEX CONCURRENTLY idx_concurrent ON users (email);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE INDEX IF NOT EXISTS" {
   let tokens = "CREATE INDEX IF NOT EXISTS idx_exists ON users (email);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE INDEX with NULLS ordering" {
   let tokens = "CREATE INDEX idx_ordered ON users (name ASC NULLS FIRST, age DESC NULLS LAST);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE INDEX with expression" {
   let tokens = "CREATE INDEX idx_lower_email ON users (LOWER(email));"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE UNIQUE INDEX with all options" {
   let tokens = "CREATE UNIQUE INDEX CONCURRENTLY IF NOT EXISTS idx_complex ON users USING BTREE (email ASC NULLS FIRST, created_at DESC) WHERE active = true;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Create table" {
   let tokens = "CREATE TABLE users;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Create table IF NOT EXISTS" {
   let tokens = "CREATE TABLE IF NOT EXISTS users (id INTEGER);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Create table AS SELECT" {
   let tokens = "CREATE TABLE students_2 AS SELECT * FROM students;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Create table AS SELECT with WHERE" {
   let tokens = "CREATE TABLE students_3 AS SELECT city, grade FROM students WHERE grade > 3.0;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Create table with two columns" {
   let tokens = "CREATE TABLE users (id INTEGER, name INTEGER);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
     #|  description TEXT,
     #|  profile_picture BLOB
     #|);
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "With options" {
   let tokens = "CREATE TABLE users (id INTEGER NOT NULL UNIQUE, name INTEGER DEFAULT 18);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Create view with columns" {
   let tokens = "CREATE VIEW user_view (id, name) AS SELECT id, name FROM users;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Drop view statement" {
   let tokens = "DROP VIEW user_view;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
     #|  PRIMARY KEY (id, name),
     #|  UNIQUE (name)
     #|);
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
     #|  name VARCHAR(100) UNIQUE,
     #|  FOREIGN KEY (id) REFERENCES other_table (other_id)
     #|);
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
     #|  name VARCHAR(100) UNIQUE,
     #|  FOREIGN KEY (name) REFERENCES other_table
     #|);
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
     #|  name VARCHAR(100) UNIQUE,
     #|  CHECK (id > 0)
     #|);
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Drop table" {
   let tokens = "DROP TABLE students;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Drop table IF EXISTS" {
   let tokens = "DROP TABLE IF EXISTS students;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "DROP INDEX - Simple" {
   let tokens = "DROP INDEX idx_name;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "DROP INDEX IF EXISTS" {
   let tokens = "DROP INDEX IF EXISTS idx_name;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "DROP INDEX CONCURRENTLY" {
   let tokens = "DROP INDEX CONCURRENTLY idx_name;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "DROP INDEX CONCURRENTLY IF EXISTS" {
   let tokens = "DROP INDEX CONCURRENTLY IF EXISTS idx_name;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "DROP INDEX with table name" {
   let tokens = "DROP INDEX idx_name ON users;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Alter table drop column" {
   let tokens = "ALTER TABLE mytable DROP COLUMN mycolumn;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Alter table drop column IF EXISTS" {
   let tokens = "ALTER TABLE mytable DROP COLUMN IF EXISTS mycolumn;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Alter table IF EXISTS drop column IF EXISTS" {
   let tokens = "ALTER TABLE IF EXISTS mytable DROP COLUMN IF EXISTS mycolumn;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "ALTER INDEX - RENAME TO" {
   let tokens = "ALTER INDEX idx_old RENAME TO idx_new;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "ALTER INDEX IF EXISTS RENAME TO" {
   let tokens = "ALTER INDEX IF EXISTS idx_old RENAME TO idx_new;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "ALTER INDEX - SET TABLESPACE" {
   let tokens = "ALTER INDEX idx_name SET TABLESPACE fast_ssd;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "ALTER INDEX - RESET parameters" {
   let tokens = "ALTER INDEX idx_name RESET (fillfactor, fastupdate);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "ALTER INDEX - SET parameters" {
   let tokens = "ALTER INDEX idx_name SET (fillfactor = 70, fastupdate = off);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "ALTER INDEX - Simple RENAME test" {
   let tokens = "ALTER INDEX idx_old RENAME TO idx_new;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "ALTER INDEX - Complex RENAME with quoted names" {
   let tokens = "ALTER INDEX \"old-index-name\" RENAME TO \"new-index-name\";"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(stmt, content="ALTER INDEX old-index-name RENAME TO new-index-name;")
 }
 
@@
 ///|
 test "CREATE DATABASE - Simple" {
   let tokens = "CREATE DATABASE mydb;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE DATABASE IF NOT EXISTS" {
   let tokens = "CREATE DATABASE IF NOT EXISTS mydb;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE DATABASE with CHARACTER SET" {
   let tokens = "CREATE DATABASE mydb CHARACTER SET utf8;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE DATABASE with CHARACTER SET and COLLATE" {
   let tokens = "CREATE DATABASE mydb CHARACTER SET utf8 COLLATE utf8_general_ci;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SCHEMA - Simple" {
   let tokens = "CREATE SCHEMA myschema;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SCHEMA IF NOT EXISTS" {
   let tokens = "CREATE SCHEMA IF NOT EXISTS myschema;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SCHEMA with AUTHORIZATION" {
   let tokens = "CREATE SCHEMA myschema AUTHORIZATION myuser;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE FUNCTION - Simple" {
   let tokens = "CREATE FUNCTION my_func() RETURNS INTEGER AS 'SELECT 1';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE FUNCTION IF NOT EXISTS" {
   let tokens = "CREATE FUNCTION IF NOT EXISTS my_func() RETURNS INTEGER AS 'SELECT 1';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE FUNCTION with parameters" {
   let tokens = "CREATE FUNCTION add_nums(IN a INTEGER, IN b INTEGER) RETURNS INTEGER LANGUAGE sql AS 'SELECT a + b';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE FUNCTION DETERMINISTIC" {
   let tokens = "CREATE FUNCTION my_func() RETURNS INTEGER DETERMINISTIC AS 'SELECT 1';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE PROCEDURE - Simple" {
   let tokens = "CREATE PROCEDURE my_proc() AS 'BEGIN SELECT 1; END';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE PROCEDURE with parameters" {
   let tokens = "CREATE PROCEDURE update_user(IN user_id INTEGER, IN new_name VARCHAR(100)) LANGUAGE plpgsql AS 'BEGIN UPDATE users SET name = new_name WHERE id = user_id; END';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE FUNCTION with OUT parameter" {
   let tokens = "CREATE FUNCTION get_user_info(IN user_id INTEGER, OUT user_name VARCHAR(100), OUT user_age INTEGER) AS 'SELECT name, age FROM users WHERE id = user_id';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE FUNCTION with INOUT parameter" {
   let tokens = "CREATE FUNCTION modify_value(INOUT value INTEGER) RETURNS INTEGER AS 'SELECT value * 2';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE - Simple" {
   let tokens = "CREATE SEQUENCE my_seq;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE IF NOT EXISTS" {
   let tokens = "CREATE SEQUENCE IF NOT EXISTS my_seq;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE TEMPORARY SEQUENCE" {
   let tokens = "CREATE TEMPORARY SEQUENCE temp_seq;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE with INCREMENT BY" {
   let tokens = "CREATE SEQUENCE my_seq INCREMENT BY 5;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE with MINVALUE and MAXVALUE" {
   let tokens = "CREATE SEQUENCE my_seq MINVALUE 1 MAXVALUE 1000;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE with NO MINVALUE NO MAXVALUE" {
   let tokens = "CREATE SEQUENCE my_seq NO MINVALUE NO MAXVALUE;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE with START WITH and CACHE" {
   let tokens = "CREATE SEQUENCE my_seq START WITH 10 CACHE 20;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE with CYCLE" {
   let tokens = "CREATE SEQUENCE my_seq CYCLE;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE with NO CYCLE" {
   let tokens = "CREATE SEQUENCE my_seq NO CYCLE;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE with OWNED BY" {
   let tokens = "CREATE SEQUENCE user_id_seq OWNED BY users.id;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE with OWNED BY NONE" {
   let tokens = "CREATE SEQUENCE my_seq OWNED BY NONE;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE with all options" {
   let tokens = "CREATE TEMPORARY SEQUENCE IF NOT EXISTS user_seq INCREMENT BY 2 MINVALUE 1 MAXVALUE 9999 START WITH 100 CACHE 10 CYCLE OWNED BY users.id;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
*** Update File: <WORKDIR>/src/dml.mbt
@@
 ///|
 test "Parse select with two columns" {
   let tokens = "SELECT col1, col2 FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Parse select with function call" {
   let tokens = "SELECT MAX(arg1, arg2), MIN() as m FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Nested expression" {
   let tokens = "SELECT sum(l_extendedprice * (1 - l_discount)) FROM lineitem;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Binary expression" {
   let tokens = "SELECT 1 + 2 * 3 FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Complecated binary expression" {
   let tokens = "SELECT sum(a * (1 - b) * (2 + b)) AS c FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Selection clause" {
   let tokens = "SELECT * FROM t WHERE id = 1;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
     #|  AND name ILIKE 'TEST' 
     #|  AND name NOT LIKE 'test2' 
     #|  AND name NOT ILIKE 'TEST2';
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "From multiple table refs" {
   let tokens = "SELECT * FROM t1, t2;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "SubQuery" {
   let tokens = "SELECT sub FROM (SELECT name FROM users WHERE active = true) AS sub;"
-  let stmt = parse_sql(tokens, dialect=Postgres::{  })[0] |> pretty_print
+  let stmt = parse_sql(tokens, dialect=Postgres::{  })[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Exists, not exists" {
   let tokens = "SELECT * FROM t WHERE EXISTS (SELECT 1 FROM t2) AND NOT EXISTS (SELECT 1 FROM t3);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Between and" {
   let tokens = "SELECT * FROM t WHERE id BETWEEN 1 AND 10;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Compound identifiers" {
   let tokens = "SELECT t1.col1, t2.col2 FROM t1, t2;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Extract function" {
   let tokens = "SELECT EXTRACT(YEAR FROM date_col) FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Aliasing omits AS" {
   let tokens = "SELECT col1 c1, col2 FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Case when" {
   let tokens = "SELECT CASE WHEN a > 0 THEN 'positive' WHEN a < 0 THEN 'negative' ELSE 'zero' END AS result FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Having" {
   let tokens = "SELECT col1, COUNT(*) FROM t GROUP BY col1 HAVING COUNT(*) > 1;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "In list" {
   let tokens = "SELECT * FROM t WHERE col1 IN (1, 2, 3);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "In subquery" {
   let tokens = "SELECT * FROM t WHERE col1 IN (SELECT col2 FROM t2);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Join with ON condition" {
   let tokens = "SELECT * FROM t1 JOIN t2 ON t1.id = t2.id;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Cross join" {
   let tokens = "SELECT * FROM t1 CROSS JOIN t2;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Left join" {
   let tokens = "SELECT * FROM t1 LEFT JOIN t2 ON t1.id = t2.id GROUP BY x;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Right join" {
   let tokens = "SELECT * FROM t1 RIGHT JOIN t2 ON t1.id = t2.id;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Full outer join" {
   let tokens = "SELECT * FROM t1 LEFT OUTER JOIN t2 ON t1.id = t2.id;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Null, true and false" {
   let tokens = "SELECT NULL, true, false FROM t1;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens)[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Unary plus and minus" {
   let tokens = "SELECT +1, -2 FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Unary not expression" {
   let tokens = "SELECT NOT a FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Using clause in join" {
   let tokens = "SELECT * FROM t1 JOIN t2 USING (id);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Multiple statements" {
   let tokens = "SELECT * FROM t1; SELECT * FROM t2;"
-  let stmts = parse_sql(tokens) |> pretty_print
+  let stmts = parse_sql(tokens) |> pretty_print_renamed
   inspect(
     stmts,
     content=(
@@
 ///|
 test "String literal as column" {
   let tokens = "SELECT test FROM 't';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Limit and offset" {
   let tokens = "SELECT * FROM t LIMIT 10 OFFSET 5;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Limit without offset" {
   let tokens = "SELECT * FROM t LIMIT N;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Offset without limit" {
   let tokens = "SELECT * FROM t OFFSET N;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Duplicate treatment" {
   let tokens = "SELECT COUNT(DISTINCT *) FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Substring" {
   let tokens = "SELECT SUBSTRING(col FROM 1 FOR 5) FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Substring with start only" {
   let tokens = "SELECT SUBSTRING(col FROM 1) FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Substring another way" {
   let tokens = "SELECT SUBSTRING(col, 1, 5) FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test {
   let tokens = "SELECT * FROM t1 UNION (SELECT * FROM t2 UNION SELECT * FROM t3) ORDER BY col1;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Non projections" {
   let tokens = "SELECT FROM t1;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Top 10" {
   let tokens = "SELECT TOP 10 * FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Insert with values - simple" {
   let tokens = "INSERT INTO test_table VALUES (1, 2, 'test');"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Insert with columns and values" {
   let tokens = "INSERT INTO test_table (id, value, name) VALUES (1, 2, 'test');"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Insert with SELECT" {
   let tokens = "INSERT INTO test_table SELECT * FROM students;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Insert with schema" {
   let tokens = "INSERT INTO some_schema.test_table SELECT * FROM another_schema.students;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 /// PostgreSQL ON CONFLICT Tests
 test "INSERT with ON CONFLICT DO NOTHING" {
   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT DO NOTHING;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "INSERT with ON CONFLICT (column) DO NOTHING" {
   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT (email) DO NOTHING;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "INSERT with ON CONFLICT (multiple columns) DO UPDATE" {
   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT (id, email) DO UPDATE SET name = EXCLUDED.name;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "INSERT with ON CONFLICT ON CONSTRAINT" {
   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT ON CONSTRAINT users_email_key DO UPDATE SET name = EXCLUDED.name;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "INSERT with ON CONFLICT DO UPDATE with WHERE" {
   let tokens = "INSERT INTO users (id, name, email, active) VALUES (1, 'John', 'john@example.com', true) ON CONFLICT (email) DO UPDATE SET name = EXCLUDED.name, active = EXCLUDED.active WHERE users.created_at < NOW();"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "INSERT with ON CONFLICT (expression) WHERE condition" {
   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT (LOWER(email)) WHERE active = true DO UPDATE SET name = EXCLUDED.name;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Delete with WHERE" {
   let tokens = "DELETE FROM students WHERE grade > 3.0;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Delete without WHERE" {
   let tokens = "DELETE FROM students;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Update with single assignment and WHERE" {
   let tokens = "UPDATE students SET grade = 1.3 WHERE name = 'Max Mustermann';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Update with multiple assignments and WHERE" {
   let tokens = "UPDATE students SET grade = 1.3, name='Felix Fürstenberg' WHERE name = 'Max Mustermann';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Update without WHERE" {
   let tokens = "UPDATE students SET grade = 1.0;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Truncate table" {
   let tokens = "TRUNCATE students;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 test "Simple CTE with WITH clause" {
   let tokens = "WITH sales AS (SELECT * FROM orders) SELECT * FROM sales;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CTE with column specification" {
   let tokens = "WITH sales(id, total) AS (SELECT order_id, amount FROM orders) SELECT * FROM sales;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Multiple CTEs" {
   let tokens = "WITH sales AS (SELECT * FROM orders), customers AS (SELECT * FROM users) SELECT * FROM sales JOIN customers ON sales.user_id = customers.id;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CTE with ORDER BY and LIMIT" {
   let tokens = "WITH top_sales AS (SELECT * FROM orders ORDER BY amount DESC LIMIT 10) SELECT * FROM top_sales;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Nested CTE (CTE referencing another CTE)" {
   let tokens = "WITH sales AS (SELECT * FROM orders), big_sales AS (SELECT * FROM sales WHERE amount > 1000) SELECT * FROM big_sales;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CTE with aggregation" {
   let tokens = "WITH monthly_sales AS (SELECT date_month, SUM(amount) as total FROM orders GROUP BY date_month) SELECT * FROM monthly_sales;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 /// Window Functions Tests
 test "Simple window function with empty OVER clause" {
   let tokens = "SELECT rank() OVER () FROM test;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Window function with ORDER BY" {
   let tokens = "SELECT rank() OVER (ORDER BY salary DESC) FROM employees;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Window function with PARTITION BY" {
   let tokens = "SELECT count(*) OVER (PARTITION BY department) FROM employees;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Window function with PARTITION BY and ORDER BY" {
   let tokens = "SELECT row_number() OVER (PARTITION BY department ORDER BY salary DESC) FROM employees;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Window function with ROWS frame - UNBOUNDED PRECEDING" {
   let tokens = "SELECT sum(salary) OVER (ORDER BY hire_date ROWS UNBOUNDED PRECEDING) FROM employees;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Window function with ROWS frame - BETWEEN" {
   let tokens = "SELECT avg(salary) OVER (ORDER BY hire_date ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) FROM employees;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MERGE - Simple" {
   let tokens = "MERGE INTO target_table USING source_table ON target_table.id = source_table.id WHEN MATCHED THEN UPDATE SET name = source_table.name WHEN NOT MATCHED THEN INSERT VALUES (source_table.id, source_table.name);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MERGE with table aliases" {
   let tokens = "MERGE INTO customers c USING customer_updates cu ON c.id = cu.id WHEN MATCHED THEN UPDATE SET name = cu.name;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MERGE with subquery source" {
   let tokens = "MERGE INTO dest_table t USING (SELECT id, name FROM source) s ON t.id = s.id WHEN NOT MATCHED THEN INSERT (id, name) VALUES (s.id, s.name);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MERGE with conditional WHEN" {
   let tokens = "MERGE INTO products p USING updates u ON p.id = u.id WHEN MATCHED AND u.price > p.price THEN UPDATE SET price = u.price WHEN NOT MATCHED THEN INSERT VALUES (u.id, u.name, u.price);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MERGE with DELETE action" {
   let tokens = "MERGE INTO inventory i USING changes c ON i.id = c.id WHEN MATCHED AND c.quantity = 0 THEN DELETE WHEN MATCHED THEN UPDATE SET quantity = c.quantity;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
*** Update File: <WORKDIR>/src/mysql.mbt
@@
 ///|
 test "MySQL SHOW TABLES" {
   let tokens = "SHOW TABLES;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SHOW COLUMNS FROM table" {
   let tokens = "SHOW COLUMNS FROM users;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SHOW TABLES LIKE pattern" {
   let tokens = "SHOW TABLES LIKE 'user%';"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL with backticks in SHOW" {
   let tokens = "SHOW COLUMNS FROM `table name`;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL LOCK TABLES" {
   let tokens = "LOCK TABLES users;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL UNLOCK TABLES" {
   let tokens = "UNLOCK TABLES;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL DIV operator" {
   let tokens = "SELECT 10 DIV 3 FROM test;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SHOW VARIABLES" {
   let tokens = "SHOW VARIABLES;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SHOW GLOBAL STATUS" {
   let tokens = "SHOW GLOBAL STATUS;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SHOW FULL PROCESSLIST" {
   let tokens = "SHOW FULL PROCESSLIST;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SHOW CREATE TABLE" {
   let tokens = "SHOW CREATE TABLE users;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SHOW EXTENDED COLUMNS" {
   let tokens = "SHOW EXTENDED COLUMNS FROM users LIKE 'name%';"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SET session variable" {
   let tokens = "SET SESSION sql_mode = 'STRICT_TRANS_TABLES';"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SET global variable" {
   let tokens = "SET GLOBAL max_connections = 200;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SET user variable" {
   let tokens = "SET @counter = 1;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SET multiple variables" {
   let tokens = "SET @name = 'John', @age = 30, @salary = 50000.50;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SET local variable" {
   let tokens = "SET autocommit = 0;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL REPLACE INTO statement" {
   let tokens = "REPLACE INTO users (id, name) VALUES (1, 'John');"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL REPLACE INTO with multiple values" {
   let tokens = "REPLACE INTO products (id, name, price) VALUES (1, 'Widget', 10.50), (2, 'Gadget', 15.00);"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL INSERT OR REPLACE statement" {
   let tokens = "INSERT OR REPLACE INTO settings (key, value) VALUES ('theme', 'dark');"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL INSERT with ON DUPLICATE KEY UPDATE" {
   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON DUPLICATE KEY UPDATE name = 'John Updated', email = 'john.new@example.com';"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL INSERT single assignment ON DUPLICATE KEY UPDATE" {
   let tokens = "INSERT INTO counters (id, count) VALUES (1, 1) ON DUPLICATE KEY UPDATE count = count + 1;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL REPLACE with ON DUPLICATE KEY UPDATE" {
   let tokens = "REPLACE INTO settings (setting_key, setting_value) VALUES ('theme', 'dark') ON DUPLICATE KEY UPDATE setting_value = 'light';"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL basic LOAD DATA statement" {
   let tokens = "LOAD DATA INFILE '/tmp/data.csv' INTO TABLE users;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL LOAD DATA with LOCAL and REPLACE" {
   let tokens = "LOAD DATA LOCAL INFILE '/tmp/users.txt' REPLACE INTO TABLE employees;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL LOAD DATA with FIELDS options" {
   let tokens = "LOAD DATA INFILE '/data/products.csv' INTO TABLE products CHARACTER SET utf8 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL LOAD DATA with LINES options" {
   let tokens = "LOAD DATA INFILE '/tmp/logs.txt' INTO TABLE logs LINES STARTING BY '>>>' TERMINATED BY '\n' IGNORE 5 LINES;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL LOAD DATA with column list and SET" {
   let tokens = "LOAD DATA INFILE '/data/sales.csv' IGNORE INTO TABLE sales FIELDS TERMINATED BY ',' (date, amount, customer) SET created_at = now();"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
*** Update File: <WORKDIR>/src/parameterized.mbt
@@
 ///|
 test "Question mark placeholder in WHERE clause" {
   let sql = "SELECT * FROM users WHERE id = ?;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Multiple question mark placeholders" {
   let sql = "SELECT * FROM users WHERE age > ? AND name = ?;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Question mark placeholder in INSERT" {
   let sql = "INSERT INTO users (name, age) VALUES (?, ?);"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Question mark placeholder in UPDATE" {
   let sql = "UPDATE users SET name = ?, age = ? WHERE id = ?;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Question mark placeholder in LIMIT" {
   let sql = "SELECT * FROM users LIMIT ?;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Question mark placeholder in LIMIT and OFFSET" {
   let sql = "SELECT * FROM users LIMIT ? OFFSET ?;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL $1 numbered placeholder" {
   let sql = "SELECT * FROM users WHERE id = $1;"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL multiple numbered placeholders" {
   let sql = "SELECT * FROM users WHERE age > $1 AND name = $2;"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL numbered placeholders in INSERT" {
   let sql = "INSERT INTO users (name, age, email) VALUES ($1, $2, $3);"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content="INSERT INTO users (name, age, email) VALUES ($1, $2, $3);",
@@
 ///|
 test "PostgreSQL numbered placeholders in LIMIT OFFSET" {
   let sql = "SELECT * FROM users LIMIT $1 OFFSET $2;"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL numbered placeholders out of order" {
   let sql = "SELECT * FROM users WHERE id = $2 AND name = $1;"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Colon named parameter" {
   let sql = "SELECT * FROM users WHERE name = :username;"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Multiple colon named parameters" {
   let sql = "SELECT * FROM users WHERE age > :min_age AND city = :city_name;"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Colon named parameters in INSERT" {
   let sql = "INSERT INTO users (name, age) VALUES (:name, :age);"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(stmt, content="INSERT INTO users (name, age) VALUES (:name, :age);")
 }
 
@@
 ///|
 test "At-sign named parameter" {
   let sql = "SELECT * FROM users WHERE name = @username;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Multiple at-sign named parameters" {
   let sql = "SELECT * FROM users WHERE age > @min_age AND city = @city_name;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Placeholder in function call" {
   let sql = "SELECT UPPER(?) FROM users;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Placeholder in expression" {
   let sql = "SELECT * FROM users WHERE age + ? > 100;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Placeholder in BETWEEN clause" {
   let sql = "SELECT * FROM users WHERE age BETWEEN ? AND ?;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Placeholder in IN list" {
   let sql = "SELECT * FROM users WHERE id IN (?, ?, ?);"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL numbered placeholder in CASE expression" {
   let sql = "SELECT CASE WHEN age > $1 THEN 'old' ELSE 'young' END FROM users;"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Named parameter in JOIN condition" {
   let sql = "SELECT * FROM users u JOIN orders o ON u.id = o.user_id WHERE o.total > :min_total;"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
   let sql1 = "SELECT * FROM users WHERE id = ?;"
   let sql2 = "SELECT * FROM users WHERE id = $1;"
   let sql3 = "SELECT * FROM users WHERE id = :user_id;"
-  let stmt1 = parse_sql(dialect=MySQL::{  }, sql1).stmts[0] |> pretty_print
+  let stmt1 = parse_sql(dialect=MySQL::{  }, sql1).stmts[0] |> pretty_print_renamed
-  let stmt2 = parse_sql(dialect=Postgres::{  }, sql2).stmts[0] |> pretty_print
+  let stmt2 = parse_sql(dialect=Postgres::{  }, sql2).stmts[0] |> pretty_print_renamed
-  let stmt3 = parse_sql(dialect=Postgres::{  }, sql3).stmts[0] |> pretty_print
+  let stmt3 = parse_sql(dialect=Postgres::{  }, sql3).stmts[0] |> pretty_print_renamed
   inspect(
     stmt1,
     content=(
@@
 ///|
 test "Placeholder in DELETE statement" {
   let sql = "DELETE FROM users WHERE id = ?;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
*** Update File: <WORKDIR>/src/parser.mbt
@@
     Token::Identifier("t"),
     Token::Semicolon,
   ]
-  let stmt = parse(tokens)[0] |> pretty_print
+  let stmt = parse(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Parse USE database statement" {
   let tokens = [Keyword(Use), Token::Identifier("mydb"), Token::Semicolon]
-  let stmt = parse(tokens)[0] |> pretty_print
+  let stmt = parse(tokens)[0] |> pretty_print_renamed
   inspect(stmt, content="USE mydb;")
 }
 
@@
     Token::Identifier("production"),
     Token::Semicolon,
   ]
-  let stmt = parse(tokens)[0] |> pretty_print
+  let stmt = parse(tokens)[0] |> pretty_print_renamed
   inspect(stmt, content="USE company.production;")
 }
 
@@
     Token::Identifier("my database"),
     Token::Semicolon,
   ]
-  let stmt = parse(tokens)[0] |> pretty_print
+  let stmt = parse(tokens)[0] |> pretty_print_renamed
   inspect(stmt, content="USE `my database`;")
 }
 
@@
     Token::StringLiteral("/tmp/users.csv"),
     Token::Semicolon,
   ]
-  let stmt = parse(tokens)[0] |> pretty_print
+  let stmt = parse(tokens)[0] |> pretty_print_renamed
   inspect(stmt, content="COPY users TO '/tmp/users.csv';")
 }
 
@@
     Token::RParen,
     Token::Semicolon,
   ]
-  let stmt = parse(tokens)[0] |> pretty_print
+  let stmt = parse(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content="COPY products FROM '/data/products.csv' (FORMAT CSV, HEADER);",
@@
     Keyword(Stdout),
     Token::Semicolon,
   ]
-  let stmt = parse(tokens)[0] |> pretty_print
+  let stmt = parse(tokens)[0] |> pretty_print_renamed
   inspect(stmt, content="COPY orders (id, amount) TO STDOUT;")
 }
 
@@
     Token::RParen,
     Token::Semicolon,
   ]
-  let stmt = parse(tokens)[0] |> pretty_print
+  let stmt = parse(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content="COPY (\n  SELECT\n    *\n  FROM\n    customers\n) TO '/tmp/customers.csv' (FORMAT CSV, DELIMITER ',', NULL '');",
@@
     Token::RParen,
     Token::Semicolon,
   ]
-  let stmt = parse(tokens)[0] |> pretty_print
+  let stmt = parse(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content="COPY employees FROM STDIN (FORMAT CSV, QUOTE '\"', ESCAPE '\\', FORCE_QUOTE *);",
*** Update File: <WORKDIR>/src/postgres.mbt
@@
 ///|
 test "PostgreSQL LISTEN" {
   let tokens = "LISTEN my_channel;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL NOTIFY without payload" {
   let tokens = "NOTIFY my_channel;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL NOTIFY with payload" {
   let tokens = "NOTIFY my_channel, 'hello world';"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 test "PostgreSQL ARRAY syntax with integers" {
   let tokens = "SELECT ARRAY[1, 2, 3, 4] FROM test;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL bracket array syntax" {
   let tokens = "SELECT [1, 2, 3] FROM test;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL empty ARRAY" {
   let tokens = "SELECT ARRAY[] FROM test;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL ARRAY with strings" {
   let tokens = "SELECT ARRAY['hello', 'world'] FROM test;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL nested arrays" {
   let tokens = "SELECT ARRAY[ARRAY[1, 2], ARRAY[3, 4]] FROM test;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL mixed bracket and ARRAY syntax" {
   let tokens = "SELECT ARRAY[[1, 2], [3, 4]] FROM test;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 test "PostgreSQL JSON extract operator" {
   let tokens = "SELECT data -> 'key' FROM json_table;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL JSON extract text operator" {
   let tokens = "SELECT data ->> 'key' FROM json_table;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL JSON path extract operator" {
   let tokens = "SELECT data #> ARRAY['key', 'subkey'] FROM json_table;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL JSON contains operator" {
   let tokens = "SELECT data @> '{\"key\":\"value\"}' FROM json_table;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL JSON contained in operator" {
   let tokens = "SELECT '{\"a\":1}' <@ data FROM json_table;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 test "PostgreSQL COUNT with FILTER" {
   let tokens = "SELECT count(*) FILTER (WHERE active) FROM users;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL COUNT without FILTER" {
   let tokens = "SELECT count(*) FROM users;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL SUM with FILTER" {
   let tokens = "SELECT sum(amount) FILTER (WHERE status = 'completed') FROM orders;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL multiple aggregations with FILTER" {
   let tokens = "SELECT count(*) FILTER (WHERE active), avg(age) FILTER (WHERE age > 18) FROM users;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
*** Update File: <WORKDIR>/src/prepare.mbt
@@
 ///|
 test "PREPARE simple SELECT" {
   let sql = "PREPARE stmt AS SELECT * FROM users WHERE id = ?"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PREPARE with data types" {
   let sql = "PREPARE stmt (INTEGER, VARCHAR(50)) AS SELECT * FROM users WHERE id = ? AND name = ?"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PREPARE INSERT statement" {
   let sql = "PREPARE insert_user AS INSERT INTO users (name, email) VALUES (?, ?)"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content="PREPARE insert_user AS INSERT INTO users (name, email) VALUES (?, ?);",
@@
 ///|
 test "PREPARE UPDATE statement" {
   let sql = "PREPARE update_user AS UPDATE users SET name = ? WHERE id = ?"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PREPARE DELETE statement" {
   let sql = "PREPARE delete_user AS DELETE FROM users WHERE id = ?"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PREPARE with PostgreSQL numbered placeholders" {
   let sql = "PREPARE stmt (INTEGER, TEXT) AS SELECT * FROM users WHERE id = $1 AND name = $2"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PREPARE with named parameters" {
   let sql = "PREPARE stmt AS SELECT * FROM users WHERE id = :id AND name = :name"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PREPARE with complex query" {
   let sql = "PREPARE complex_query AS SELECT u.id, u.name, COUNT(o.id) as order_count FROM users u LEFT JOIN orders o ON u.id = o.user_id WHERE u.is_active = ? GROUP BY u.id, u.name HAVING COUNT(o.id) > ?"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PREPARE with subquery" {
   let sql = "PREPARE subquery_stmt AS SELECT * FROM users WHERE id IN (SELECT user_id FROM orders WHERE amount > ?)"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PREPARE with window function" {
   let sql = "PREPARE window_stmt AS SELECT name, salary, RANK() OVER (ORDER BY salary DESC) as rank FROM employees WHERE department = ?"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PREPARE with CTE" {
   let sql = "PREPARE cte_stmt AS WITH recent_orders AS (SELECT * FROM orders WHERE created_at > ?) SELECT * FROM recent_orders WHERE status = ?"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "EXECUTE simple" {
   let sql = "EXECUTE stmt"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "EXECUTE with parenthesized parameters" {
   let sql = "EXECUTE stmt(1, 'John')"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "EXECUTE with USING clause" {
   let sql = "EXECUTE stmt USING 1, 'John'"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "EXECUTE with complex expressions" {
   let sql = "EXECUTE stmt USING 1 + 2, CONCAT('Hello', ' World')"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(stmt, content="EXECUTE stmt USING 1 + 2, concat('Hello', ' World');")
 }
 
@@
 ///|
 test "EXECUTE IMMEDIATE" {
   let sql = "EXECUTE IMMEDIATE"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "EXECUTE IMMEDIATE with INTO" {
   let sql = "EXECUTE IMMEDIATE INTO v_result"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "EXECUTE IMMEDIATE with INTO and USING" {
   let sql = "EXECUTE IMMEDIATE INTO v_result USING 1, 'test'"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "EXECUTE with multiple INTO variables" {
   let sql = "EXECUTE IMMEDIATE INTO v_name, v_email, v_age"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "DEALLOCATE simple" {
   let sql = "DEALLOCATE stmt"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "DEALLOCATE with PREPARE keyword" {
   let sql = "DEALLOCATE PREPARE stmt"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 test "PREPARE and EXECUTE separately" {
   let sql1 = "PREPARE user_query AS SELECT * FROM users WHERE id = ?"
   let sql2 = "EXECUTE user_query(123)"
-  let stmt1 = parse_sql(sql1)[0] |> pretty_print
+  let stmt1 = parse_sql(sql1)[0] |> pretty_print_renamed
-  let stmt2 = parse_sql(sql2)[0] |> pretty_print
+  let stmt2 = parse_sql(sql2)[0] |> pretty_print_renamed
   inspect(
     stmt1,
     content=(
@@
 ///|
 test "PREPARE with multiple data types" {
   let sql = "PREPARE stmt (INTEGER, VARCHAR(100), DOUBLE) AS SELECT * FROM users WHERE id = ?"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
*** Update File: <WORKDIR>/src/tcl.mbt
@@
 
 test "BEGIN statement" {
   let tokens = "BEGIN;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "BEGIN WORK statement" {
   let tokens = "BEGIN WORK;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "BEGIN TRANSACTION statement" {
   let tokens = "BEGIN TRANSACTION;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "START TRANSACTION statement" {
   let tokens = "START TRANSACTION;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "COMMIT statement" {
   let tokens = "COMMIT;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "COMMIT WORK statement" {
   let tokens = "COMMIT WORK;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "ROLLBACK statement" {
   let tokens = "ROLLBACK;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "ROLLBACK TO SAVEPOINT statement" {
   let tokens = "ROLLBACK TO SAVEPOINT sp1;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "SAVEPOINT statement" {
   let tokens = "SAVEPOINT sp1;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "RELEASE SAVEPOINT statement" {
   let tokens = "RELEASE SAVEPOINT sp1;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
*** Update File: <WORKDIR>/src/tests/dialect_test.mbt
@@
 test "MySQL SHOW TABLES statement" {
   let sql = @sqlparser.parse_sql("SHOW TABLES;")
   inspect(sql.stmts.length(), content="1")
-  let pretty = sql.stmts[0] |> @sqlparser.pretty_print
+  let pretty = sql.stmts[0] |> @sqlparser.pretty_print_renamed
   inspect(pretty, content="SHOW TABLES;")
 }
 
@@
 test "MySQL SHOW COLUMNS with FROM" {
   let sql = @sqlparser.parse_sql("SHOW COLUMNS FROM users;")
   inspect(sql.stmts.length(), content="1")
-  let pretty = sql.stmts[0] |> @sqlparser.pretty_print
+  let pretty = sql.stmts[0] |> @sqlparser.pretty_print_renamed
   inspect(pretty, content="SHOW COLUMNS FROM users;")
 }
 
@@
 test "MySQL SHOW TABLES with LIKE filter" {
   let sql = @sqlparser.parse_sql("SHOW TABLES LIKE 'user%';")
   inspect(sql.stmts.length(), content="1")
-  let pretty = sql.stmts[0] |> @sqlparser.pretty_print
+  let pretty = sql.stmts[0] |> @sqlparser.pretty_print_renamed
   inspect(pretty, content="SHOW TABLES LIKE 'user%';")
 }
 
@@
 test "MySQL SHOW STATUS statement" {
   let sql = @sqlparser.parse_sql("SHOW STATUS;")
   inspect(sql.stmts.length(), content="1")
-  let pretty = sql.stmts[0] |> @sqlparser.pretty_print
+  let pretty = sql.stmts[0] |> @sqlparser.pretty_print_renamed
   inspect(pretty, content="SHOW STATUS;")
 }
 
@@
 test "MySQL SHOW DATABASES statement" {
   let sql = @sqlparser.parse_sql("SHOW DATABASES;")
   inspect(sql.stmts.length(), content="1")
-  let pretty = sql.stmts[0] |> @sqlparser.pretty_print
+  let pretty = sql.stmts[0] |> @sqlparser.pretty_print_renamed
   inspect(pretty, content="SHOW DATABASES;")
 }
 
@@
 test "MySQL backtick quoted table names" {
   let sql = @sqlparser.parse_sql("SELECT * FROM `table name`;")
   inspect(sql.stmts.length(), content="1")
-  let pretty = sql.stmts[0] |> @sqlparser.pretty_print
+  let pretty = sql.stmts[0] |> @sqlparser.pretty_print_renamed
   inspect(pretty, content="SELECT\n  *\nFROM\n  `table name`;")
 }
 
@@
 test "MySQL backtick quoted database.table" {
   let sql = @sqlparser.parse_sql("SELECT * FROM `my db`.`my table`;")
   inspect(sql.stmts.length(), content="1")
-  let pretty = sql.stmts[0] |> @sqlparser.pretty_print
+  let pretty = sql.stmts[0] |> @sqlparser.pretty_print_renamed
   inspect(pretty, content="SELECT\n  *\nFROM\n  `my db`.`my table`;")
 }
 
@@
 test "MySQL SHOW COLUMNS with complex table name" {
   let sql = @sqlparser.parse_sql("SHOW COLUMNS FROM `user data`;")
   inspect(sql.stmts.length(), content="1")
-  let pretty = sql.stmts[0] |> @sqlparser.pretty_print
+  let pretty = sql.stmts[0] |> @sqlparser.pretty_print_renamed
   inspect(pretty, content="SHOW COLUMNS FROM `user data`;")
 }
 
@@
 test "MySQL SHOW TABLES with complex pattern" {
   let sql = @sqlparser.parse_sql("SHOW TABLES LIKE 'test_%_data';")
   inspect(sql.stmts.length(), content="1")
-  let pretty = sql.stmts[0] |> @sqlparser.pretty_print
+  let pretty = sql.stmts[0] |> @sqlparser.pretty_print_renamed
   inspect(pretty, content="SHOW TABLES LIKE 'test_%_data';")
 }
 
*** Update File: <WORKDIR>/src/tests/tpch_test.mbt
@@
 
 ///|
 test "TPCH 1" {
-  let stmt = read_and_parse("src/tests/tpch/1.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/1.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 2" {
-  let stmt = read_and_parse("src/tests/tpch/2.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/2.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 3" {
-  let stmt = read_and_parse("src/tests/tpch/3.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/3.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 4" {
-  let stmt = read_and_parse("src/tests/tpch/4.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/4.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 5" {
-  let stmt = read_and_parse("src/tests/tpch/5.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/5.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 6" {
-  let stmt = read_and_parse("src/tests/tpch/6.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/6.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 7" {
-  let stmt = read_and_parse("src/tests/tpch/7.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/7.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 8" {
-  let stmt = read_and_parse("src/tests/tpch/8.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/8.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 9" {
-  let stmt = read_and_parse("src/tests/tpch/9.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/9.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 10" {
-  let stmt = read_and_parse("src/tests/tpch/10.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/10.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 11" {
-  let stmt = read_and_parse("src/tests/tpch/11.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/11.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 12" {
-  let stmt = read_and_parse("src/tests/tpch/12.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/12.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 13" {
-  let stmt = read_and_parse("src/tests/tpch/13.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/13.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 14" {
-  let stmt = read_and_parse("src/tests/tpch/14.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/14.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 15" {
-  let stmt = read_and_parse("src/tests/tpch/15.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/15.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 16" {
-  let stmt = read_and_parse("src/tests/tpch/16.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/16.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 17" {
-  let stmt = read_and_parse("src/tests/tpch/17.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/17.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 18" {
-  let stmt = read_and_parse("src/tests/tpch/18.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/18.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 19" {
-  let stmt = read_and_parse("src/tests/tpch/19.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/19.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 20" {
-  let stmt = read_and_parse("src/tests/tpch/20.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/20.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 21" {
-  let stmt = read_and_parse("src/tests/tpch/21.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/21.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 22" {
-  let stmt = read_and_parse("src/tests/tpch/22.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/22.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename obj obj_renamed --loc 'src/ast.mbt:2:37'
*** Begin Patch
*** Update File: <WORKDIR>/src/ast.mbt
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

```mooncram
$ run_moon_ide moon ide rename Parser ParserRenamed --loc 'src/dcl.mbt:5:4'
*** Begin Patch
*** Update File: <WORKDIR>/src/ansi.mbt
@@
 ///|
 pub impl Dialect for ANSI with parse_statement(
   _self : ANSI,
-  _parser : Parser,
+  _parser : ParserRenamed,
   _tokens : ArrayView[Token],
 ) -> ParserResult[Statement]? raise ParserError {
   None
*** Update File: <WORKDIR>/src/bigquery.mbt
@@
 ///|
 pub impl Dialect for BigQuery with parse_statement(
   _self : BigQuery,
-  _parser : Parser,
+  _parser : ParserRenamed,
   _tokens : ArrayView[Token],
 ) -> ParserResult[Statement]? raise ParserError {
   None
*** Update File: <WORKDIR>/src/clickhouse.mbt
@@
 ///|
 pub impl Dialect for ClickHouse with parse_statement(
   _self : ClickHouse,
-  _parser : Parser,
+  _parser : ParserRenamed,
   _tokens : ArrayView[Token],
 ) -> ParserResult[Statement]? raise ParserError {
   None
*** Update File: <WORKDIR>/src/dcl.mbt
@@
 // DCL (Data Control Language) parsing functions
 
 ///|
-fn Parser::parse_grant_statement(
+fn ParserRenamed::parse_grant_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[GrantStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Grant))
@@
 }
 
 ///|
-fn Parser::parse_revoke_statement(
+fn ParserRenamed::parse_revoke_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[RevokeStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Revoke))
@@
 }
 
 ///|
-fn Parser::parse_privilege_list(
+fn ParserRenamed::parse_privilege_list(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Array[Privilege]] raise ParserError {
   let privileges = []
@@
 }
 
 ///|
-fn Parser::parse_privilege(
+fn ParserRenamed::parse_privilege(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Privilege] raise ParserError {
   match tokens {
@@
 }
 
 ///|
-fn Parser::parse_optional_column_list(
+fn ParserRenamed::parse_optional_column_list(
-  _self : Parser,
+  _self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Array[String]?] raise ParserError {
   match tokens {
@@
 }
 
 ///|
-fn Parser::parse_object_name_list(
+fn ParserRenamed::parse_object_name_list(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Array[ObjectName]] raise ParserError {
   let objects = []
@@
 }
 
 ///|
-fn Parser::parse_grantee_list(
+fn ParserRenamed::parse_grantee_list(
-  _self : Parser,
+  _self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Array[String]] raise ParserError {
   let grantees = []
*** Update File: <WORKDIR>/src/ddl.mbt
@@
 ///|
-fn Parser::parse_create_table_statement(
+fn ParserRenamed::parse_create_table_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[CreateTableStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Create))
@@
 
 ///|
 /// Parse CREATE INDEX statement
-fn Parser::parse_create_index_statement(
+fn ParserRenamed::parse_create_index_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[CreateIndexStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Create))
@@
 }
 
 ///|
-fn Parser::parse_column_defs(
+fn ParserRenamed::parse_column_defs(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[(Array[ColumnDef], Array[TableConstraint])] raise ParserError {
   let columns = []
@@
 }
 
 ///|
-fn Parser::parse_data_type(
+fn ParserRenamed::parse_data_type(
-  _self : Parser,
+  _self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[DataType] raise ParserError {
   match tokens {
@@
 }
 
 ///|
-fn Parser::parse_column_def_option(
+fn ParserRenamed::parse_column_def_option(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Array[ColumnDefOption]] raise ParserError {
   let options = []
@@
 }
 
 ///|
-fn Parser::parse_create_view_statement(
+fn ParserRenamed::parse_create_view_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[CreateViewStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Create))
@@
 }
 
 ///|
-fn Parser::parse_view_column_def(
+fn ParserRenamed::parse_view_column_def(
-  _self : Parser,
+  _self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[ViewColumnDef] raise ParserError {
   match tokens {
@@
 }
 
 ///|
-fn Parser::parse_drop_view_statement(
+fn ParserRenamed::parse_drop_view_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[DropViewStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Drop))
@@
 }
 
 ///|
-fn Parser::parse_table_constraint(
+fn ParserRenamed::parse_table_constraint(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[TableConstraint] raise ParserError {
   match tokens {
@@
 }
 
 ///|
-fn Parser::parse_foreign_key_constraint(
+fn ParserRenamed::parse_foreign_key_constraint(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[TableConstraint] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Foreign))
@@
 }
 
 ///|
-fn Parser::parse_drop_table_statement(
+fn ParserRenamed::parse_drop_table_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[DropTableStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Drop))
@@
 }
 
 ///|
-fn Parser::parse_drop_index_statement(
+fn ParserRenamed::parse_drop_index_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[DropIndexStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Drop))
@@
 }
 
 ///|
-fn Parser::parse_alter_table_statement(
+fn ParserRenamed::parse_alter_table_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[AlterTableStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Alter))
@@
 
 ///|
 /// ALTER INDEX statement
-fn Parser::parse_alter_index_statement(
+fn ParserRenamed::parse_alter_index_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[AlterIndexStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Alter))
@@
 }
 
 ///|
-fn Parser::parse_create_database_statement(
+fn ParserRenamed::parse_create_database_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[CreateDatabaseStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Create))
@@
 }
 
 ///|
-fn Parser::parse_create_schema_statement(
+fn ParserRenamed::parse_create_schema_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[CreateSchemaStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Create))
@@
 }
 
 ///|
-fn Parser::parse_create_function_statement(
+fn ParserRenamed::parse_create_function_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[CreateFunctionStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Create))
@@
 }
 
 ///|
-fn Parser::parse_create_procedure_statement(
+fn ParserRenamed::parse_create_procedure_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[CreateProcedureStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Create))
@@
 }
 
 ///|
-fn Parser::parse_function_parameter(
+fn ParserRenamed::parse_function_parameter(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[FunctionParameter] raise ParserError {
   // Parse optional parameter mode (IN, OUT, INOUT)
@@
 }
 
 ///|
-fn Parser::parse_create_sequence_statement(
+fn ParserRenamed::parse_create_sequence_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[CreateSequenceStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Create))
*** Update File: <WORKDIR>/src/dialect.mbt
@@
   parse_expr(Self, tokens : ArrayView[Token]) -> ParserResult[Expr]? raise ParserError = _
 
   /// Custom statement parsing for dialect-specific syntax
-  parse_statement(Self, parser : Parser, tokens : ArrayView[Token]) -> ParserResult[
+  parse_statement(Self, parser : ParserRenamed, tokens : ArrayView[Token]) -> ParserResult[
     Statement,
   ]? raise ParserError = _
 
@@
 ///|
 impl Dialect with parse_statement(
   _self : Self,
-  _parser : Parser,
+  _parser : ParserRenamed,
   _tokens : ArrayView[Token],
 ) -> ParserResult[Statement]? raise ParserError {
   // Debug: If this is being called instead of dialect-specific implementation,
*** Update File: <WORKDIR>/src/dml.mbt
@@
 ///|
-fn Parser::parse_set_expr(
+fn ParserRenamed::parse_set_expr(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
   min_bp : Int,
 ) -> ParserResult[SetExpr] raise ParserError {
@@
 }
 
 ///|
-fn Parser::parse_select(
+fn ParserRenamed::parse_select(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[SelectStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Select))
@@
 }
 
 ///|
-fn Parser::parse_query(
+fn ParserRenamed::parse_query(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[QueryStmt] raise ParserError {
   let (with_clause, tokens) = match tokens {
@@
 }
 
 ///|
-fn Parser::parse_aliasing(
+fn ParserRenamed::parse_aliasing(
-  _self : Parser,
+  _self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[TableAlias?] raise ParserError {
   let tokens = match tokens {
@@
 }
 
 ///|
-fn Parser::parse_projections(
+fn ParserRenamed::parse_projections(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Array[Projection]] raise ParserError {
   let projections = []
@@
 }
 
 ///|
-fn Parser::parse_expr(
+fn ParserRenamed::parse_expr(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Expr] raise ParserError {
   if self.dialect.parse_expr(tokens) is Some(res) {
@@
 }
 
 ///|
-fn Parser::parse_binary_expr(
+fn ParserRenamed::parse_binary_expr(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
   min_bp : Int,
 ) -> ParserResult[Expr] raise ParserError {
@@
 }
 
 ///|
-fn Parser::parse_infix(
+fn ParserRenamed::parse_infix(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
   left : Expr,
   min_bp : Int,
@@
 }
 
 ///|
-fn Parser::parse_primary_expr(
+fn ParserRenamed::parse_primary_expr(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Expr] raise ParserError {
   match tokens {
@@
 }
 
 ///|
-fn Parser::parse_postfix_expr(
+fn ParserRenamed::parse_postfix_expr(
-  self : Parser,
+  self : ParserRenamed,
   expr : Expr,
   tokens : ArrayView[Token],
 ) -> ParserResult[Expr] raise ParserError {
@@
 }
 
 ///|
-fn Parser::parse_subscript(
+fn ParserRenamed::parse_subscript(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Subscript] raise ParserError {
   // tokens start right after the '['
@@
 }
 
 ///|
-fn Parser::parse_table_refs(
+fn ParserRenamed::parse_table_refs(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Array[TableRef]] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(From))
@@
 }
 
 ///|
-fn Parser::parse_table_ref(
+fn ParserRenamed::parse_table_ref(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[TableRef] raise ParserError {
   let (factor, tokens) = self.parse_table_factor(tokens)
@@
 }
 
 ///|
-fn Parser::parse_table_factor(
+fn ParserRenamed::parse_table_factor(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[TableFactor] raise ParserError {
   match tokens {
@@
 }
 
 ///|
-fn Parser::parse_group_by(
+fn ParserRenamed::parse_group_by(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Array[Expr]] raise ParserError {
   let group_by = []
@@
 }
 
 ///|
-fn Parser::parse_order_by(
+fn ParserRenamed::parse_order_by(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Array[OrderByExpr]] raise ParserError {
   let order_by = []
@@
 }
 
 ///|
-fn Parser::parse_order_by_expr(
+fn ParserRenamed::parse_order_by_expr(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[OrderByExpr] raise ParserError {
   let (expr, tokens) = self.parse_expr(tokens)
@@
 }
 
 ///|
-fn Parser::parse_date_expr(
+fn ParserRenamed::parse_date_expr(
-  _self : Parser,
+  _self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Expr] raise ParserError {
   match tokens {
@@
 }
 
 ///|
-fn Parser::parse_interval_expr(
+fn ParserRenamed::parse_interval_expr(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Expr] raise ParserError {
   match tokens {
@@
 }
 
 ///|
-fn Parser::parse_extract_expr(
+fn ParserRenamed::parse_extract_expr(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Expr] raise ParserError {
   match tokens {
@@
 }
 
 ///|
-fn Parser::parse_case_expr(
+fn ParserRenamed::parse_case_expr(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Expr] raise ParserError {
   let when_then_clauses = []
@@
 }
 
 ///|
-fn Parser::parse_interval_qualifier(
+fn ParserRenamed::parse_interval_qualifier(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[IntervalQualifier] raise ParserError {
   let (field1, tokens) = self.parse_primary_datetime_field(tokens)
@@
 }
 
 ///|
-fn Parser::parse_primary_datetime_field(
+fn ParserRenamed::parse_primary_datetime_field(
-  _self : Parser,
+  _self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[PrimaryDatetimeField] raise ParserError {
   match tokens {
@@
 }
 
 ///|
-fn Parser::parse_between_expr(
+fn ParserRenamed::parse_between_expr(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
   left : Expr,
   positive : Bool,
@@
 }
 
 ///|
-fn Parser::parse_in_expr(
+fn ParserRenamed::parse_in_expr(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
   left : Expr,
   positive : Bool,
@@
 }
 
 ///|
-fn Parser::parse_substring_expr(
+fn ParserRenamed::parse_substring_expr(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Expr] raise ParserError {
   let tokens = self.expect_token(tokens, LParen)
@@
 }
 
 ///|
-fn Parser::parse_array_expr(
+fn ParserRenamed::parse_array_expr(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
   named : Bool,
 ) -> ParserResult[Expr] raise ParserError {
@@
 }
 
 ///|
-fn Parser::parse_object_name(
+fn ParserRenamed::parse_object_name(
-  _self : Parser,
+  _self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[ObjectName] raise ParserError {
   let parts = []
@@
 }
 
 ///|
-fn Parser::parse_top(
+fn ParserRenamed::parse_top(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Top?] raise ParserError {
   match tokens {
@@
 }
 
 ///|
-fn Parser::parse_insert_statement(
+fn ParserRenamed::parse_insert_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[InsertStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Insert))
@@
 }
 
 ///|
-fn Parser::parse_delete_statement(
+fn ParserRenamed::parse_delete_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[DeleteStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Delete))
@@
 }
 
 ///|
-fn Parser::parse_update_statement(
+fn ParserRenamed::parse_update_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[UpdateStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Update))
@@
 }
 
 ///|
-fn Parser::parse_truncate_statement(
+fn ParserRenamed::parse_truncate_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[TruncateStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Truncate))
@@
 }
 
 ///|
-fn Parser::parse_cte_list(
+fn ParserRenamed::parse_cte_list(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Array[Cte]] raise ParserError {
   let ctes = []
@@
 }
 
 ///|
-fn Parser::parse_cte(
+fn ParserRenamed::parse_cte(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Cte] raise ParserError {
   // Parse CTE name
@@
 
 ///|
 /// Parse window specification: [PARTITION BY ...] [ORDER BY ...] [frame_clause]
-fn Parser::parse_window_spec(
+fn ParserRenamed::parse_window_spec(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[WindowSpec] raise ParserError {
   // Parse optional PARTITION BY clause
@@
 
 ///|
 /// Parse window frame clause: ROWS/RANGE [BETWEEN ... AND ...] or ROWS/RANGE ...
-fn Parser::parse_window_frame_clause(
+fn ParserRenamed::parse_window_frame_clause(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[WindowFrameClause?] raise ParserError {
   match tokens {
@@
 
 ///|
 /// Parse frame bounds: [BETWEEN ... AND ...] or single bound
-fn Parser::parse_frame_bounds(
+fn ParserRenamed::parse_frame_bounds(
-  self : Parser,
+  self : ParserRenamed,
   frame_units : WindowFrameUnits,
   tokens : ArrayView[Token],
 ) -> ParserResult[WindowFrameClause?] raise ParserError {
@@
 
 ///|
 /// Parse individual frame bound
-fn Parser::parse_frame_bound(
+fn ParserRenamed::parse_frame_bound(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[WindowFrameBound] raise ParserError {
   match tokens {
@@
 }
 
 ///|
-fn Parser::parse_merge_statement(
+fn ParserRenamed::parse_merge_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[MergeStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Merge))
@@
 }
 
 ///|
-fn Parser::parse_merge_when_clause(
+fn ParserRenamed::parse_merge_when_clause(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[MergeWhenClause] raise ParserError {
   // Parse MATCHED or NOT MATCHED
@@
 }
 
 ///|
-fn Parser::parse_merge_action(
+fn ParserRenamed::parse_merge_action(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[MergeAction] raise ParserError {
   match tokens {
*** Update File: <WORKDIR>/src/duckdb.mbt
@@
 ///|
 pub impl Dialect for DuckDB with parse_statement(
   _self : DuckDB,
-  _parser : Parser,
+  _parser : ParserRenamed,
   _tokens : ArrayView[Token],
 ) -> ParserResult[Statement]? raise ParserError {
   None
*** Update File: <WORKDIR>/src/generic.mbt
@@
 ///|
 pub impl Dialect for Generic with parse_statement(
   _self : Generic,
-  _parser : Parser,
+  _parser : ParserRenamed,
   _tokens : ArrayView[Token],
 ) -> ParserResult[Statement]? raise ParserError {
   None
*** Update File: <WORKDIR>/src/mysql.mbt
@@
 ///|
 pub impl Dialect for MySQL with parse_statement(
   _self : MySQL,
-  parser : Parser,
+  parser : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Statement]? raise ParserError {
   match tokens {
*** Update File: <WORKDIR>/src/parser.mbt
@@
 type ParserResult[T] = (T, ArrayView[Token])
 
 ///|
-pub struct Parser {
+pub struct ParserRenamed {
   dialect : &Dialect
   // recursion counter
 }
@@
 }
 
 ///|
-fn Parser::expect_token(
+fn ParserRenamed::expect_token(
-  _self : Parser,
+  _self : ParserRenamed,
   tokens : ArrayView[Token],
   expected : Token,
 ) -> ArrayView[Token] raise ParserError {
@@
   tokens : ArrayView[Token],
   dialect? : &Dialect = MySQL::{  },
 ) -> Array[Statement] raise ParserError {
-  let parser = Parser::{ dialect, }
+  let parser = ParserRenamed::{ dialect, }
   let statements = []
   for tokens = tokens {
     match tokens {
@@
 }
 
 ///|
-fn Parser::parse_statement(
+fn ParserRenamed::parse_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Statement] raise ParserError {
   // Try dialect-specific parsing first
@@
 ///|
 
 ///|
-fn Parser::parse_show_statement(
+fn ParserRenamed::parse_show_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[ShowStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Show))
@@
 }
 
 ///|
-fn Parser::parse_set_statement(
+fn ParserRenamed::parse_set_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[SetStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Set))
@@
 }
 
 ///|
-fn Parser::parse_set_assignments(
+fn ParserRenamed::parse_set_assignments(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Array[SetAssignment]] raise ParserError {
   let assignments : Array[SetAssignment] = []
@@
 }
 
 ///|
-fn Parser::parse_replace_statement(
+fn ParserRenamed::parse_replace_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[InsertStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Replace))
@@
 }
 
 ///|
-fn Parser::parse_copy_statement(
+fn ParserRenamed::parse_copy_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[CopyStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Copy))
@@
 }
 
 ///|
-fn Parser::parse_copy_options(
+fn ParserRenamed::parse_copy_options(
-  _self : Parser,
+  _self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Array[CopyOption]] raise ParserError {
   let options = []
@@
 }
 
 ///|
-fn Parser::parse_use_statement(
+fn ParserRenamed::parse_use_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[UseStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Use))
@@
 }
 
 ///|
-fn Parser::parse_comma_separated_exprs(
+fn ParserRenamed::parse_comma_separated_exprs(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Array[Expr]] raise ParserError {
   let exprs = []
@@
 }
 
 ///|
-fn Parser::parse_duplicate_key_assignments(
+fn ParserRenamed::parse_duplicate_key_assignments(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Array[Assignment]] raise ParserError {
   let assignments = []
@@
 }
 
 ///|
-fn Parser::parse_on_conflict_clause(
+fn ParserRenamed::parse_on_conflict_clause(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[OnConflictClause] raise ParserError {
   // Parse optional conflict target
@@
 }
 
 ///|
-fn Parser::parse_load_data_statement(
+fn ParserRenamed::parse_load_data_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[LoadDataStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Load))
@@
 }
 
 ///|
-fn Parser::parse_load_data_fields_options(
+fn ParserRenamed::parse_load_data_fields_options(
-  _self : Parser,
+  _self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[LoadDataFieldsOptions] {
   let mut terminated_by = None
@@
 }
 
 ///|
-fn Parser::parse_load_data_lines_options(
+fn ParserRenamed::parse_load_data_lines_options(
-  _self : Parser,
+  _self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[LoadDataLinesOptions] {
   let mut starting_by = None
@@
 ///|
 /// Parse PREPARE statement
 /// Syntax: PREPARE name [(data_type [, ...])] AS statement
-fn Parser::parse_prepare_statement(
+fn ParserRenamed::parse_prepare_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[PrepareStmt] raise ParserError {
   // PREPARE
@@
 ///   EXECUTE name [(param [, ...])]
 ///   EXECUTE name USING expr [, ...]
 ///   EXECUTE IMMEDIATE 'sql_string' [INTO var [, ...]] [USING expr [, ...]]
-fn Parser::parse_execute_statement(
+fn ParserRenamed::parse_execute_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[ExecuteStmt] raise ParserError {
   // EXECUTE
@@
 ///|
 /// Parse DEALLOCATE statement
 /// Syntax: DEALLOCATE [PREPARE] name
-fn Parser::parse_deallocate_statement(
+fn ParserRenamed::parse_deallocate_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[DeallocateStmt] raise ParserError {
   // DEALLOCATE
*** Update File: <WORKDIR>/src/postgres.mbt
@@
 ///|
 pub impl Dialect for Postgres with parse_statement(
   _self : Postgres,
-  _parser : Parser,
+  _parser : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Statement]? raise ParserError {
   match tokens {
*** Update File: <WORKDIR>/src/redshift.mbt
@@
 ///|
 pub impl Dialect for Redshift with parse_statement(
   _self : Redshift,
-  _parser : Parser,
+  _parser : ParserRenamed,
   _tokens : ArrayView[Token],
 ) -> ParserResult[Statement]? raise ParserError {
   None
*** Update File: <WORKDIR>/src/snowflake.mbt
@@
 ///|
 pub impl Dialect for Snowflake with parse_statement(
   _self : Snowflake,
-  _parser : Parser,
+  _parser : ParserRenamed,
   _tokens : ArrayView[Token],
 ) -> ParserResult[Statement]? raise ParserError {
   None
*** Update File: <WORKDIR>/src/sqlite.mbt
@@
 ///|
 pub impl Dialect for SQLite with parse_statement(
   _self : SQLite,
-  _parser : Parser,
+  _parser : ParserRenamed,
   _tokens : ArrayView[Token],
 ) -> ParserResult[Statement]? raise ParserError {
   None
*** Update File: <WORKDIR>/src/tcl.mbt
@@
 // TCL (Transaction Control Language) parsing functions
 
 ///|
-fn Parser::parse_begin_statement(
+fn ParserRenamed::parse_begin_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[BeginStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Begin))
@@
 }
 
 ///|
-fn Parser::parse_start_transaction_statement(
+fn ParserRenamed::parse_start_transaction_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[BeginStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Start))
@@
 }
 
 ///|
-fn Parser::parse_commit_statement(
+fn ParserRenamed::parse_commit_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[CommitStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Commit))
@@
 }
 
 ///|
-fn Parser::parse_rollback_statement(
+fn ParserRenamed::parse_rollback_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[RollbackStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Rollback))
@@
 }
 
 ///|
-fn Parser::parse_savepoint_statement(
+fn ParserRenamed::parse_savepoint_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[SavepointStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Savepoint))
@@
 }
 
 ///|
-fn Parser::parse_release_savepoint_statement(
+fn ParserRenamed::parse_release_savepoint_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[ReleaseSavepointStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Release))
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename parse_grant_statement parse_grant_statement_renamed --loc 'src/dcl.mbt:5:12'
*** Begin Patch
*** Update File: <WORKDIR>/src/dcl.mbt
@@
 // DCL (Data Control Language) parsing functions
 
 ///|
-fn Parser::parse_grant_statement(
+fn Parser::parse_grant_statement_renamed(
   self : Parser,
   tokens : ArrayView[Token],
 ) -> ParserResult[GrantStmt] raise ParserError {
*** Update File: <WORKDIR>/src/parser.mbt
@@
       .parse_release_savepoint_statement(tokens)
       .map(stmt => Statement::ReleaseSavepoint(stmt)) (escaped)
     [Keyword(Grant), .. _rest] => (escaped)
-      self.parse_grant_statement(tokens).map(stmt => Statement::Grant(stmt)) (escaped)
+      self.parse_grant_statement_renamed(tokens).map(stmt => Statement::Grant(stmt)) (escaped)
     [Keyword(Revoke), .. _rest] => (escaped)
       self.parse_revoke_statement(tokens).map(stmt => Statement::Revoke(stmt)) (escaped)
     [Keyword(Use), .. _rest] => (escaped)
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'pass' pass_renamed
*** Begin Patch
*** Update File: <WORKDIR>/src/tests/good_test.mbt
@@
 // These tests are copied from https://github.com/hyrise/sql-parser/blob/main/test/queries/queries-good.sql
 
 ///|
-fn pass(input : String) -> Unit {
+fn pass_renamed(input : String) -> Unit {
   (@sqlparser.parse_sql(input) catch {
     e => { (escaped)
       println(e)
@@
 
 ///|
 test {
-  "SELECT * FROM orders;" |> pass
+  "SELECT * FROM orders;" |> pass_renamed
 }
 
 ///|
 test {
-  "SELECT a FROM foo WHERE a > 12 OR b > 3 AND NOT c LIMIT 10;" |> pass
+  "SELECT a FROM foo WHERE a > 12 OR b > 3 AND NOT c LIMIT 10;" |> pass_renamed
 }
 
 ///|
 test {
   "SELECT a FROM some_schema.foo WHERE a > 12 OR b > 3 AND NOT c LIMIT 10;"
-  |> pass
+  |> pass_renamed
 }
 
 ///|
@@
   (
     #|SELECT col1 AS myname, col2, 'test' FROM "table", foo AS t WHERE age > 12 AND zipcode = 12345 GROUP BY col1;
   )
-  |> pass
+  |> pass_renamed
 }
 
 ///|
@@
   (
     #|SELECT * from "table" JOIN table2 ON a = b WHERE (b OR NOT a) AND a = 12.5
   )
-  |> pass
+  |> pass_renamed
 }
 
 ///|
 test {
   "(SELECT a FROM foo WHERE a > 12 OR b > 3 AND c NOT LIKE 's%' LIMIT 10);"
-  |> pass
+  |> pass_renamed
 }
 
 ///|
@@
   (
     #|SELECT * FROM "table" LIMIT 10 OFFSET 10; SELECT * FROM another;
   )
-  |> pass
+  |> pass_renamed
 }
 
 ///|
 test {
-  "SELECT * FROM t1 UNION SELECT * FROM t2 ORDER BY col1;" |> pass
+  "SELECT * FROM t1 UNION SELECT * FROM t2 ORDER BY col1;" |> pass_renamed
 }
 
 ///|
 test {
-  "SELECT * FROM (SELECT * FROM t1);" |> pass
+  "SELECT * FROM (SELECT * FROM t1);" |> pass_renamed
 }
 
 ///|
 test {
   "SELECT * FROM t1 UNION (SELECT * FROM t2 UNION SELECT * FROM t3) ORDER BY col1;"
-  |> pass
+  |> pass_renamed
 }
 
 ///|
 test {
-  "SELECT TOP 10 * FROM t1 ORDER BY col1, col2;" |> pass
+  "SELECT TOP 10 * FROM t1 ORDER BY col1, col2;" |> pass_renamed
 }
 
 ///|
 test {
-  "SELECT a, MAX(b), MAX(c, d), CUSTOM(q, UP(r)) AS f FROM t1;" |> pass
+  "SELECT a, MAX(b), MAX(c, d), CUSTOM(q, UP(r)) AS f FROM t1;" |> pass_renamed
 }
 
 ///|
 test {
-  "SELECT * FROM t WHERE a BETWEEN 1 and c;" |> pass
+  "SELECT * FROM t WHERE a BETWEEN 1 and c;" |> pass_renamed
 }
 
 ///|
 test {
-  "SELECT * FROM t WHERE a = ? AND b = ?;" |> pass
+  "SELECT * FROM t WHERE a = ? AND b = ?;" |> pass_renamed
 }
 
 ///|
 test {
   "SELECT City.name, Product.category, SUM(price) FROM fact INNER JOIN City ON fact.city_id = City.id INNER JOIN Product ON fact.product_id = Product.id GROUP BY City.name, Product.category;"
-  |> pass
+  |> pass_renamed
 }
 
 ///|
 test {
-  "SELECT SUBSTR(a, 3, 5) FROM t;" |> pass
+  "SELECT SUBSTR(a, 3, 5) FROM t;" |> pass_renamed
 }
 
 ///|
 test {
-  "SELECT * FROM t WHERE a = DATE '1996-12-31';" |> pass
+  "SELECT * FROM t WHERE a = DATE '1996-12-31';" |> pass_renamed
 }
 
 ///|
@@
   (
     #| SELECT t1.a, t1.b, t2.c FROM "table" AS t1 JOIN (SELECT * FROM foo JOIN bar ON foo.id = bar.id) t2 ON t1.a = t2.b WHERE (t1.b OR NOT t1.a) AND t2.c = 12.5
   )
-  |> pass
+  |> pass_renamed
 }
 
 ///|
 test {
-  "SELECT * FROM t1 JOIN t2 ON c1 = c2;" |> pass
+  "SELECT * FROM t1 JOIN t2 ON c1 = c2;" |> pass_renamed
 }
 
 ///|
 test {
-  "SELECT a, SUM(b) FROM t2 GROUP BY a HAVING SUM(b) > 100;" |> pass
+  "SELECT a, SUM(b) FROM t2 GROUP BY a HAVING SUM(b) > 100;" |> pass_renamed
 }
 
 ///|
 test {
-  "INSERT INTO test_table VALUES (1, 2, 'test');" |> pass
+  "INSERT INTO test_table VALUES (1, 2, 'test');" |> pass_renamed
 }
 
 ///|
 test {
-  "INSERT INTO test_table (id, value, name) VALUES (1, 2, 'test');" |> pass
+  "INSERT INTO test_table (id, value, name) VALUES (1, 2, 'test');" |> pass_renamed
 }
 
 ///|
 test {
-  "INSERT INTO test_table SELECT * FROM students;" |> pass
+  "INSERT INTO test_table SELECT * FROM students;" |> pass_renamed
 }
 
 ///|
 test {
   "INSERT INTO some_schema.test_table SELECT * FROM another_schema.students;"
-  |> pass
+  |> pass_renamed
 }
 
 ///|
 test {
-  "CREATE TABLE IF NOT EXISTS \"table\" (id INTEGER);" |> pass
+  "CREATE TABLE IF NOT EXISTS \"table\" (id INTEGER);" |> pass_renamed
 }
 
 ///|
 test {
-  "CREATE TABLE students_2 AS SELECT * FROM students;" |> pass
+  "CREATE TABLE students_2 AS SELECT * FROM students;" |> pass_renamed
 }
 
 ///|
 test {
   "CREATE TABLE students_3 AS SELECT city, grade FROM students WHERE grade > 3.0;"
-  |> pass
+  |> pass_renamed
 }
 
 ///|
 test {
-  "DELETE FROM students WHERE grade > 3.0" |> pass
+  "DELETE FROM students WHERE grade > 3.0" |> pass_renamed
 }
 
 ///|
 test {
-  "DELETE FROM students" |> pass
+  "DELETE FROM students" |> pass_renamed
 }
 
 ///|
 test {
-  "UPDATE students SET grade = 1.3 WHERE name = 'Max Mustermann';" |> pass
+  "UPDATE students SET grade = 1.3 WHERE name = 'Max Mustermann';" |> pass_renamed
 }
 
 ///|
 test {
   "UPDATE students SET grade = 1.3, name='Felix Fürstenberg' WHERE name = 'Max Mustermann';"
-  |> pass
+  |> pass_renamed
 }
 
 ///|
 test {
-  "UPDATE students SET grade = 1.0;" |> pass
+  "UPDATE students SET grade = 1.0;" |> pass_renamed
 }
 
 ///|
 test {
-  "UPDATE some_schema.students SET grade = 1.0;" |> pass
+  "UPDATE some_schema.students SET grade = 1.0;" |> pass_renamed
 }
 
 ///|
 test {
-  "TRUNCATE students" |> pass
+  "TRUNCATE students" |> pass_renamed
 }
 
 ///|
 test {
-  "DROP TABLE students;" |> pass
+  "DROP TABLE students;" |> pass_renamed
 }
 
 ///|
 test {
-  "DROP TABLE IF EXISTS students;" |> pass
+  "DROP TABLE IF EXISTS students;" |> pass_renamed
 }
 
 ///|
 test {
-  "ALTER TABLE mytable DROP COLUMN IF EXISTS mycolumn;" |> pass
+  "ALTER TABLE mytable DROP COLUMN IF EXISTS mycolumn;" |> pass_renamed
 }
 
 ///|
 test {
-  "ALTER TABLE IF EXISTS mytable DROP COLUMN IF EXISTS mycolumn;" |> pass
+  "ALTER TABLE IF EXISTS mytable DROP COLUMN IF EXISTS mycolumn;" |> pass_renamed
 }
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'read_and_parse' read_and_parse_renamed
*** Begin Patch
*** Update File: <WORKDIR>/src/tests/tpch_test.mbt
@@
 ///|
-fn read_and_parse(path : String) -> @sqlparser.Statements {
+fn read_and_parse_renamed(path : String) -> @sqlparser.Statements {
   let input = @fs.read_file_to_string(path) catch {
     e => { (escaped)
       println("Read file error: \{e.to_string()}")
@@
 
 ///|
 test "TPCH 1" {
-  let stmt = read_and_parse("src/tests/tpch/1.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/1.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 2" {
-  let stmt = read_and_parse("src/tests/tpch/2.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/2.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 3" {
-  let stmt = read_and_parse("src/tests/tpch/3.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/3.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 4" {
-  let stmt = read_and_parse("src/tests/tpch/4.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/4.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 5" {
-  let stmt = read_and_parse("src/tests/tpch/5.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/5.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 6" {
-  let stmt = read_and_parse("src/tests/tpch/6.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/6.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 7" {
-  let stmt = read_and_parse("src/tests/tpch/7.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/7.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 8" {
-  let stmt = read_and_parse("src/tests/tpch/8.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/8.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 9" {
-  let stmt = read_and_parse("src/tests/tpch/9.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/9.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 10" {
-  let stmt = read_and_parse("src/tests/tpch/10.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/10.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 11" {
-  let stmt = read_and_parse("src/tests/tpch/11.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/11.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 12" {
-  let stmt = read_and_parse("src/tests/tpch/12.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/12.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 13" {
-  let stmt = read_and_parse("src/tests/tpch/13.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/13.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 14" {
-  let stmt = read_and_parse("src/tests/tpch/14.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/14.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 15" {
-  let stmt = read_and_parse("src/tests/tpch/15.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/15.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 16" {
-  let stmt = read_and_parse("src/tests/tpch/16.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/16.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 17" {
-  let stmt = read_and_parse("src/tests/tpch/17.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/17.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 18" {
-  let stmt = read_and_parse("src/tests/tpch/18.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/18.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 19" {
-  let stmt = read_and_parse("src/tests/tpch/19.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/19.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 20" {
-  let stmt = read_and_parse("src/tests/tpch/20.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/20.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 21" {
-  let stmt = read_and_parse("src/tests/tpch/21.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/21.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 22" {
-  let stmt = read_and_parse("src/tests/tpch/22.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse_renamed("src/tests/tpch/22.sql") |> @sqlparser.pretty_print
   inspect(
     stmt,
     content=(
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'pretty_print' pretty_print_renamed
*** Begin Patch
*** Update File: <WORKDIR>/src/ast.mbt
@@
 ///|
-pub fn[T : @pp.Pretty] pretty_print(obj : T) -> String {
+pub fn[T : @pp.Pretty] pretty_print_renamed(obj : T) -> String {
   @pp.pretty(obj).to_string()
 }
 
*** Update File: <WORKDIR>/src/bigquery.mbt
@@
 
 test "BigQuery named parameter" {
   let tokens = "SELECT * FROM users WHERE id = @user_id;"
-  let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "BigQuery positional parameter" {
   let tokens = "SELECT * FROM users WHERE id = ?;"
-  let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "BigQuery mixed parameters" {
   let tokens = "SELECT * FROM users WHERE id = @user_id AND age > ?;"
-  let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "BigQuery multiple named parameters" {
   let tokens = "SELECT @field FROM @table WHERE @condition = @value;"
-  let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 test "Named parameters treated as identifiers in MySQL" {
   let tokens = "SELECT @user_id FROM users;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
*** Update File: <WORKDIR>/src/dcl.mbt
@@
 
 test "GRANT SELECT statement" {
   let tokens = "GRANT SELECT ON users TO alice;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "GRANT multiple privileges statement" {
   let tokens = "GRANT SELECT, INSERT, UPDATE ON users TO alice, bob;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "GRANT with column specification" {
   let tokens = "GRANT SELECT (name, email), UPDATE (email) ON users TO alice;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "GRANT ALL PRIVILEGES statement" {
   let tokens = "GRANT ALL PRIVILEGES ON users TO alice WITH GRANT OPTION;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "REVOKE SELECT statement" {
   let tokens = "REVOKE SELECT ON users FROM alice;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "REVOKE with CASCADE" {
   let tokens = "REVOKE ALL PRIVILEGES ON users FROM alice CASCADE;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "REVOKE GRANT OPTION FOR" {
   let tokens = "REVOKE GRANT OPTION FOR SELECT ON users FROM alice RESTRICT;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
*** Update File: <WORKDIR>/src/ddl.mbt
@@
 /// CREATE INDEX Tests
 test "CREATE INDEX - Simple" {
   let tokens = "CREATE INDEX idx_name ON users (email);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE UNIQUE INDEX" {
   let tokens = "CREATE UNIQUE INDEX idx_unique_email ON users (email);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE INDEX with multiple columns" {
   let tokens = "CREATE INDEX idx_name_age ON users (name, age DESC);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE INDEX with USING method" {
   let tokens = "CREATE INDEX idx_hash ON users USING HASH (id);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE INDEX with WHERE clause" {
   let tokens = "CREATE INDEX idx_active_users ON users (created_at) WHERE active = true;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE INDEX CONCURRENTLY" {
   let tokens = "CREATE INDEX CONCURRENTLY idx_concurrent ON users (email);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE INDEX IF NOT EXISTS" {
   let tokens = "CREATE INDEX IF NOT EXISTS idx_exists ON users (email);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE INDEX with NULLS ordering" {
   let tokens = "CREATE INDEX idx_ordered ON users (name ASC NULLS FIRST, age DESC NULLS LAST);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE INDEX with expression" {
   let tokens = "CREATE INDEX idx_lower_email ON users (LOWER(email));"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE UNIQUE INDEX with all options" {
   let tokens = "CREATE UNIQUE INDEX CONCURRENTLY IF NOT EXISTS idx_complex ON users USING BTREE (email ASC NULLS FIRST, created_at DESC) WHERE active = true;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Create table" {
   let tokens = "CREATE TABLE users;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Create table IF NOT EXISTS" {
   let tokens = "CREATE TABLE IF NOT EXISTS users (id INTEGER);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Create table AS SELECT" {
   let tokens = "CREATE TABLE students_2 AS SELECT * FROM students;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Create table AS SELECT with WHERE" {
   let tokens = "CREATE TABLE students_3 AS SELECT city, grade FROM students WHERE grade > 3.0;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Create table with two columns" {
   let tokens = "CREATE TABLE users (id INTEGER, name INTEGER);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
     #|  description TEXT,
     #|  profile_picture BLOB
     #|);
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "With options" {
   let tokens = "CREATE TABLE users (id INTEGER NOT NULL UNIQUE, name INTEGER DEFAULT 18);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Create view with columns" {
   let tokens = "CREATE VIEW user_view (id, name) AS SELECT id, name FROM users;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Drop view statement" {
   let tokens = "DROP VIEW user_view;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
     #|  PRIMARY KEY (id, name),
     #|  UNIQUE (name)
     #|);
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
     #|  name VARCHAR(100) UNIQUE,
     #|  FOREIGN KEY (id) REFERENCES other_table (other_id)
     #|);
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
     #|  name VARCHAR(100) UNIQUE,
     #|  FOREIGN KEY (name) REFERENCES other_table
     #|);
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
     #|  name VARCHAR(100) UNIQUE,
     #|  CHECK (id > 0)
     #|);
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Drop table" {
   let tokens = "DROP TABLE students;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Drop table IF EXISTS" {
   let tokens = "DROP TABLE IF EXISTS students;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "DROP INDEX - Simple" {
   let tokens = "DROP INDEX idx_name;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "DROP INDEX IF EXISTS" {
   let tokens = "DROP INDEX IF EXISTS idx_name;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "DROP INDEX CONCURRENTLY" {
   let tokens = "DROP INDEX CONCURRENTLY idx_name;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "DROP INDEX CONCURRENTLY IF EXISTS" {
   let tokens = "DROP INDEX CONCURRENTLY IF EXISTS idx_name;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "DROP INDEX with table name" {
   let tokens = "DROP INDEX idx_name ON users;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Alter table drop column" {
   let tokens = "ALTER TABLE mytable DROP COLUMN mycolumn;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Alter table drop column IF EXISTS" {
   let tokens = "ALTER TABLE mytable DROP COLUMN IF EXISTS mycolumn;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Alter table IF EXISTS drop column IF EXISTS" {
   let tokens = "ALTER TABLE IF EXISTS mytable DROP COLUMN IF EXISTS mycolumn;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "ALTER INDEX - RENAME TO" {
   let tokens = "ALTER INDEX idx_old RENAME TO idx_new;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "ALTER INDEX IF EXISTS RENAME TO" {
   let tokens = "ALTER INDEX IF EXISTS idx_old RENAME TO idx_new;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "ALTER INDEX - SET TABLESPACE" {
   let tokens = "ALTER INDEX idx_name SET TABLESPACE fast_ssd;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "ALTER INDEX - RESET parameters" {
   let tokens = "ALTER INDEX idx_name RESET (fillfactor, fastupdate);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "ALTER INDEX - SET parameters" {
   let tokens = "ALTER INDEX idx_name SET (fillfactor = 70, fastupdate = off);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "ALTER INDEX - Simple RENAME test" {
   let tokens = "ALTER INDEX idx_old RENAME TO idx_new;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "ALTER INDEX - Complex RENAME with quoted names" {
   let tokens = "ALTER INDEX \"old-index-name\" RENAME TO \"new-index-name\";"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(stmt, content="ALTER INDEX old-index-name RENAME TO new-index-name;")
 }
 
@@
 ///|
 test "CREATE DATABASE - Simple" {
   let tokens = "CREATE DATABASE mydb;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE DATABASE IF NOT EXISTS" {
   let tokens = "CREATE DATABASE IF NOT EXISTS mydb;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE DATABASE with CHARACTER SET" {
   let tokens = "CREATE DATABASE mydb CHARACTER SET utf8;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE DATABASE with CHARACTER SET and COLLATE" {
   let tokens = "CREATE DATABASE mydb CHARACTER SET utf8 COLLATE utf8_general_ci;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SCHEMA - Simple" {
   let tokens = "CREATE SCHEMA myschema;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SCHEMA IF NOT EXISTS" {
   let tokens = "CREATE SCHEMA IF NOT EXISTS myschema;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SCHEMA with AUTHORIZATION" {
   let tokens = "CREATE SCHEMA myschema AUTHORIZATION myuser;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE FUNCTION - Simple" {
   let tokens = "CREATE FUNCTION my_func() RETURNS INTEGER AS 'SELECT 1';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE FUNCTION IF NOT EXISTS" {
   let tokens = "CREATE FUNCTION IF NOT EXISTS my_func() RETURNS INTEGER AS 'SELECT 1';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE FUNCTION with parameters" {
   let tokens = "CREATE FUNCTION add_nums(IN a INTEGER, IN b INTEGER) RETURNS INTEGER LANGUAGE sql AS 'SELECT a + b';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE FUNCTION DETERMINISTIC" {
   let tokens = "CREATE FUNCTION my_func() RETURNS INTEGER DETERMINISTIC AS 'SELECT 1';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE PROCEDURE - Simple" {
   let tokens = "CREATE PROCEDURE my_proc() AS 'BEGIN SELECT 1; END';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE PROCEDURE with parameters" {
   let tokens = "CREATE PROCEDURE update_user(IN user_id INTEGER, IN new_name VARCHAR(100)) LANGUAGE plpgsql AS 'BEGIN UPDATE users SET name = new_name WHERE id = user_id; END';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE FUNCTION with OUT parameter" {
   let tokens = "CREATE FUNCTION get_user_info(IN user_id INTEGER, OUT user_name VARCHAR(100), OUT user_age INTEGER) AS 'SELECT name, age FROM users WHERE id = user_id';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE FUNCTION with INOUT parameter" {
   let tokens = "CREATE FUNCTION modify_value(INOUT value INTEGER) RETURNS INTEGER AS 'SELECT value * 2';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE - Simple" {
   let tokens = "CREATE SEQUENCE my_seq;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE IF NOT EXISTS" {
   let tokens = "CREATE SEQUENCE IF NOT EXISTS my_seq;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE TEMPORARY SEQUENCE" {
   let tokens = "CREATE TEMPORARY SEQUENCE temp_seq;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE with INCREMENT BY" {
   let tokens = "CREATE SEQUENCE my_seq INCREMENT BY 5;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE with MINVALUE and MAXVALUE" {
   let tokens = "CREATE SEQUENCE my_seq MINVALUE 1 MAXVALUE 1000;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE with NO MINVALUE NO MAXVALUE" {
   let tokens = "CREATE SEQUENCE my_seq NO MINVALUE NO MAXVALUE;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE with START WITH and CACHE" {
   let tokens = "CREATE SEQUENCE my_seq START WITH 10 CACHE 20;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE with CYCLE" {
   let tokens = "CREATE SEQUENCE my_seq CYCLE;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE with NO CYCLE" {
   let tokens = "CREATE SEQUENCE my_seq NO CYCLE;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE with OWNED BY" {
   let tokens = "CREATE SEQUENCE user_id_seq OWNED BY users.id;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE with OWNED BY NONE" {
   let tokens = "CREATE SEQUENCE my_seq OWNED BY NONE;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CREATE SEQUENCE with all options" {
   let tokens = "CREATE TEMPORARY SEQUENCE IF NOT EXISTS user_seq INCREMENT BY 2 MINVALUE 1 MAXVALUE 9999 START WITH 100 CACHE 10 CYCLE OWNED BY users.id;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
*** Update File: <WORKDIR>/src/dml.mbt
@@
 ///|
 test "Parse select with two columns" {
   let tokens = "SELECT col1, col2 FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Parse select with function call" {
   let tokens = "SELECT MAX(arg1, arg2), MIN() as m FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Nested expression" {
   let tokens = "SELECT sum(l_extendedprice * (1 - l_discount)) FROM lineitem;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Binary expression" {
   let tokens = "SELECT 1 + 2 * 3 FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Complecated binary expression" {
   let tokens = "SELECT sum(a * (1 - b) * (2 + b)) AS c FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Selection clause" {
   let tokens = "SELECT * FROM t WHERE id = 1;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
     #|  AND name ILIKE 'TEST' 
     #|  AND name NOT LIKE 'test2' 
     #|  AND name NOT ILIKE 'TEST2';
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "From multiple table refs" {
   let tokens = "SELECT * FROM t1, t2;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "SubQuery" {
   let tokens = "SELECT sub FROM (SELECT name FROM users WHERE active = true) AS sub;"
-  let stmt = parse_sql(tokens, dialect=Postgres::{  })[0] |> pretty_print
+  let stmt = parse_sql(tokens, dialect=Postgres::{  })[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Exists, not exists" {
   let tokens = "SELECT * FROM t WHERE EXISTS (SELECT 1 FROM t2) AND NOT EXISTS (SELECT 1 FROM t3);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Between and" {
   let tokens = "SELECT * FROM t WHERE id BETWEEN 1 AND 10;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Compound identifiers" {
   let tokens = "SELECT t1.col1, t2.col2 FROM t1, t2;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Extract function" {
   let tokens = "SELECT EXTRACT(YEAR FROM date_col) FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Aliasing omits AS" {
   let tokens = "SELECT col1 c1, col2 FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Case when" {
   let tokens = "SELECT CASE WHEN a > 0 THEN 'positive' WHEN a < 0 THEN 'negative' ELSE 'zero' END AS result FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Having" {
   let tokens = "SELECT col1, COUNT(*) FROM t GROUP BY col1 HAVING COUNT(*) > 1;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "In list" {
   let tokens = "SELECT * FROM t WHERE col1 IN (1, 2, 3);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "In subquery" {
   let tokens = "SELECT * FROM t WHERE col1 IN (SELECT col2 FROM t2);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Join with ON condition" {
   let tokens = "SELECT * FROM t1 JOIN t2 ON t1.id = t2.id;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Cross join" {
   let tokens = "SELECT * FROM t1 CROSS JOIN t2;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Left join" {
   let tokens = "SELECT * FROM t1 LEFT JOIN t2 ON t1.id = t2.id GROUP BY x;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Right join" {
   let tokens = "SELECT * FROM t1 RIGHT JOIN t2 ON t1.id = t2.id;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Full outer join" {
   let tokens = "SELECT * FROM t1 LEFT OUTER JOIN t2 ON t1.id = t2.id;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Null, true and false" {
   let tokens = "SELECT NULL, true, false FROM t1;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens)[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Unary plus and minus" {
   let tokens = "SELECT +1, -2 FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Unary not expression" {
   let tokens = "SELECT NOT a FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Using clause in join" {
   let tokens = "SELECT * FROM t1 JOIN t2 USING (id);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Multiple statements" {
   let tokens = "SELECT * FROM t1; SELECT * FROM t2;"
-  let stmts = parse_sql(tokens) |> pretty_print
+  let stmts = parse_sql(tokens) |> pretty_print_renamed
   inspect(
     stmts,
     content=(
@@
 ///|
 test "String literal as column" {
   let tokens = "SELECT test FROM 't';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Limit and offset" {
   let tokens = "SELECT * FROM t LIMIT 10 OFFSET 5;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Limit without offset" {
   let tokens = "SELECT * FROM t LIMIT N;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Offset without limit" {
   let tokens = "SELECT * FROM t OFFSET N;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Duplicate treatment" {
   let tokens = "SELECT COUNT(DISTINCT *) FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Substring" {
   let tokens = "SELECT SUBSTRING(col FROM 1 FOR 5) FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Substring with start only" {
   let tokens = "SELECT SUBSTRING(col FROM 1) FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Substring another way" {
   let tokens = "SELECT SUBSTRING(col, 1, 5) FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test {
   let tokens = "SELECT * FROM t1 UNION (SELECT * FROM t2 UNION SELECT * FROM t3) ORDER BY col1;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Non projections" {
   let tokens = "SELECT FROM t1;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Top 10" {
   let tokens = "SELECT TOP 10 * FROM t;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Insert with values - simple" {
   let tokens = "INSERT INTO test_table VALUES (1, 2, 'test');"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Insert with columns and values" {
   let tokens = "INSERT INTO test_table (id, value, name) VALUES (1, 2, 'test');"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Insert with SELECT" {
   let tokens = "INSERT INTO test_table SELECT * FROM students;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Insert with schema" {
   let tokens = "INSERT INTO some_schema.test_table SELECT * FROM another_schema.students;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 /// PostgreSQL ON CONFLICT Tests
 test "INSERT with ON CONFLICT DO NOTHING" {
   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT DO NOTHING;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "INSERT with ON CONFLICT (column) DO NOTHING" {
   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT (email) DO NOTHING;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "INSERT with ON CONFLICT (multiple columns) DO UPDATE" {
   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT (id, email) DO UPDATE SET name = EXCLUDED.name;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "INSERT with ON CONFLICT ON CONSTRAINT" {
   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT ON CONSTRAINT users_email_key DO UPDATE SET name = EXCLUDED.name;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "INSERT with ON CONFLICT DO UPDATE with WHERE" {
   let tokens = "INSERT INTO users (id, name, email, active) VALUES (1, 'John', 'john@example.com', true) ON CONFLICT (email) DO UPDATE SET name = EXCLUDED.name, active = EXCLUDED.active WHERE users.created_at < NOW();"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "INSERT with ON CONFLICT (expression) WHERE condition" {
   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT (LOWER(email)) WHERE active = true DO UPDATE SET name = EXCLUDED.name;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Delete with WHERE" {
   let tokens = "DELETE FROM students WHERE grade > 3.0;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Delete without WHERE" {
   let tokens = "DELETE FROM students;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Update with single assignment and WHERE" {
   let tokens = "UPDATE students SET grade = 1.3 WHERE name = 'Max Mustermann';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Update with multiple assignments and WHERE" {
   let tokens = "UPDATE students SET grade = 1.3, name='Felix Fürstenberg' WHERE name = 'Max Mustermann';"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Update without WHERE" {
   let tokens = "UPDATE students SET grade = 1.0;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Truncate table" {
   let tokens = "TRUNCATE students;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 test "Simple CTE with WITH clause" {
   let tokens = "WITH sales AS (SELECT * FROM orders) SELECT * FROM sales;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CTE with column specification" {
   let tokens = "WITH sales(id, total) AS (SELECT order_id, amount FROM orders) SELECT * FROM sales;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Multiple CTEs" {
   let tokens = "WITH sales AS (SELECT * FROM orders), customers AS (SELECT * FROM users) SELECT * FROM sales JOIN customers ON sales.user_id = customers.id;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CTE with ORDER BY and LIMIT" {
   let tokens = "WITH top_sales AS (SELECT * FROM orders ORDER BY amount DESC LIMIT 10) SELECT * FROM top_sales;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Nested CTE (CTE referencing another CTE)" {
   let tokens = "WITH sales AS (SELECT * FROM orders), big_sales AS (SELECT * FROM sales WHERE amount > 1000) SELECT * FROM big_sales;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "CTE with aggregation" {
   let tokens = "WITH monthly_sales AS (SELECT date_month, SUM(amount) as total FROM orders GROUP BY date_month) SELECT * FROM monthly_sales;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 /// Window Functions Tests
 test "Simple window function with empty OVER clause" {
   let tokens = "SELECT rank() OVER () FROM test;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Window function with ORDER BY" {
   let tokens = "SELECT rank() OVER (ORDER BY salary DESC) FROM employees;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Window function with PARTITION BY" {
   let tokens = "SELECT count(*) OVER (PARTITION BY department) FROM employees;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Window function with PARTITION BY and ORDER BY" {
   let tokens = "SELECT row_number() OVER (PARTITION BY department ORDER BY salary DESC) FROM employees;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Window function with ROWS frame - UNBOUNDED PRECEDING" {
   let tokens = "SELECT sum(salary) OVER (ORDER BY hire_date ROWS UNBOUNDED PRECEDING) FROM employees;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Window function with ROWS frame - BETWEEN" {
   let tokens = "SELECT avg(salary) OVER (ORDER BY hire_date ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) FROM employees;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MERGE - Simple" {
   let tokens = "MERGE INTO target_table USING source_table ON target_table.id = source_table.id WHEN MATCHED THEN UPDATE SET name = source_table.name WHEN NOT MATCHED THEN INSERT VALUES (source_table.id, source_table.name);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MERGE with table aliases" {
   let tokens = "MERGE INTO customers c USING customer_updates cu ON c.id = cu.id WHEN MATCHED THEN UPDATE SET name = cu.name;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MERGE with subquery source" {
   let tokens = "MERGE INTO dest_table t USING (SELECT id, name FROM source) s ON t.id = s.id WHEN NOT MATCHED THEN INSERT (id, name) VALUES (s.id, s.name);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MERGE with conditional WHEN" {
   let tokens = "MERGE INTO products p USING updates u ON p.id = u.id WHEN MATCHED AND u.price > p.price THEN UPDATE SET price = u.price WHEN NOT MATCHED THEN INSERT VALUES (u.id, u.name, u.price);"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MERGE with DELETE action" {
   let tokens = "MERGE INTO inventory i USING changes c ON i.id = c.id WHEN MATCHED AND c.quantity = 0 THEN DELETE WHEN MATCHED THEN UPDATE SET quantity = c.quantity;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
*** Update File: <WORKDIR>/src/mysql.mbt
@@
 ///|
 test "MySQL SHOW TABLES" {
   let tokens = "SHOW TABLES;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SHOW COLUMNS FROM table" {
   let tokens = "SHOW COLUMNS FROM users;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SHOW TABLES LIKE pattern" {
   let tokens = "SHOW TABLES LIKE 'user%';"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL with backticks in SHOW" {
   let tokens = "SHOW COLUMNS FROM `table name`;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL LOCK TABLES" {
   let tokens = "LOCK TABLES users;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL UNLOCK TABLES" {
   let tokens = "UNLOCK TABLES;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL DIV operator" {
   let tokens = "SELECT 10 DIV 3 FROM test;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SHOW VARIABLES" {
   let tokens = "SHOW VARIABLES;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SHOW GLOBAL STATUS" {
   let tokens = "SHOW GLOBAL STATUS;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SHOW FULL PROCESSLIST" {
   let tokens = "SHOW FULL PROCESSLIST;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SHOW CREATE TABLE" {
   let tokens = "SHOW CREATE TABLE users;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SHOW EXTENDED COLUMNS" {
   let tokens = "SHOW EXTENDED COLUMNS FROM users LIKE 'name%';"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SET session variable" {
   let tokens = "SET SESSION sql_mode = 'STRICT_TRANS_TABLES';"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SET global variable" {
   let tokens = "SET GLOBAL max_connections = 200;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SET user variable" {
   let tokens = "SET @counter = 1;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SET multiple variables" {
   let tokens = "SET @name = 'John', @age = 30, @salary = 50000.50;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL SET local variable" {
   let tokens = "SET autocommit = 0;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL REPLACE INTO statement" {
   let tokens = "REPLACE INTO users (id, name) VALUES (1, 'John');"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL REPLACE INTO with multiple values" {
   let tokens = "REPLACE INTO products (id, name, price) VALUES (1, 'Widget', 10.50), (2, 'Gadget', 15.00);"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL INSERT OR REPLACE statement" {
   let tokens = "INSERT OR REPLACE INTO settings (key, value) VALUES ('theme', 'dark');"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL INSERT with ON DUPLICATE KEY UPDATE" {
   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON DUPLICATE KEY UPDATE name = 'John Updated', email = 'john.new@example.com';"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL INSERT single assignment ON DUPLICATE KEY UPDATE" {
   let tokens = "INSERT INTO counters (id, count) VALUES (1, 1) ON DUPLICATE KEY UPDATE count = count + 1;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL REPLACE with ON DUPLICATE KEY UPDATE" {
   let tokens = "REPLACE INTO settings (setting_key, setting_value) VALUES ('theme', 'dark') ON DUPLICATE KEY UPDATE setting_value = 'light';"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL basic LOAD DATA statement" {
   let tokens = "LOAD DATA INFILE '/tmp/data.csv' INTO TABLE users;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL LOAD DATA with LOCAL and REPLACE" {
   let tokens = "LOAD DATA LOCAL INFILE '/tmp/users.txt' REPLACE INTO TABLE employees;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL LOAD DATA with FIELDS options" {
   let tokens = "LOAD DATA INFILE '/data/products.csv' INTO TABLE products CHARACTER SET utf8 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL LOAD DATA with LINES options" {
   let tokens = "LOAD DATA INFILE '/tmp/logs.txt' INTO TABLE logs LINES STARTING BY '>>>' TERMINATED BY '\n' IGNORE 5 LINES;"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "MySQL LOAD DATA with column list and SET" {
   let tokens = "LOAD DATA INFILE '/data/sales.csv' IGNORE INTO TABLE sales FIELDS TERMINATED BY ',' (date, amount, customer) SET created_at = now();"
-  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
*** Update File: <WORKDIR>/src/parameterized.mbt
@@
 ///|
 test "Question mark placeholder in WHERE clause" {
   let sql = "SELECT * FROM users WHERE id = ?;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Multiple question mark placeholders" {
   let sql = "SELECT * FROM users WHERE age > ? AND name = ?;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Question mark placeholder in INSERT" {
   let sql = "INSERT INTO users (name, age) VALUES (?, ?);"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Question mark placeholder in UPDATE" {
   let sql = "UPDATE users SET name = ?, age = ? WHERE id = ?;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Question mark placeholder in LIMIT" {
   let sql = "SELECT * FROM users LIMIT ?;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Question mark placeholder in LIMIT and OFFSET" {
   let sql = "SELECT * FROM users LIMIT ? OFFSET ?;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL $1 numbered placeholder" {
   let sql = "SELECT * FROM users WHERE id = $1;"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL multiple numbered placeholders" {
   let sql = "SELECT * FROM users WHERE age > $1 AND name = $2;"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL numbered placeholders in INSERT" {
   let sql = "INSERT INTO users (name, age, email) VALUES ($1, $2, $3);"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content="INSERT INTO users (name, age, email) VALUES ($1, $2, $3);",
@@
 ///|
 test "PostgreSQL numbered placeholders in LIMIT OFFSET" {
   let sql = "SELECT * FROM users LIMIT $1 OFFSET $2;"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL numbered placeholders out of order" {
   let sql = "SELECT * FROM users WHERE id = $2 AND name = $1;"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Colon named parameter" {
   let sql = "SELECT * FROM users WHERE name = :username;"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Multiple colon named parameters" {
   let sql = "SELECT * FROM users WHERE age > :min_age AND city = :city_name;"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Colon named parameters in INSERT" {
   let sql = "INSERT INTO users (name, age) VALUES (:name, :age);"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(stmt, content="INSERT INTO users (name, age) VALUES (:name, :age);")
 }
 
@@
 ///|
 test "At-sign named parameter" {
   let sql = "SELECT * FROM users WHERE name = @username;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Multiple at-sign named parameters" {
   let sql = "SELECT * FROM users WHERE age > @min_age AND city = @city_name;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Placeholder in function call" {
   let sql = "SELECT UPPER(?) FROM users;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Placeholder in expression" {
   let sql = "SELECT * FROM users WHERE age + ? > 100;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Placeholder in BETWEEN clause" {
   let sql = "SELECT * FROM users WHERE age BETWEEN ? AND ?;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Placeholder in IN list" {
   let sql = "SELECT * FROM users WHERE id IN (?, ?, ?);"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL numbered placeholder in CASE expression" {
   let sql = "SELECT CASE WHEN age > $1 THEN 'old' ELSE 'young' END FROM users;"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Named parameter in JOIN condition" {
   let sql = "SELECT * FROM users u JOIN orders o ON u.id = o.user_id WHERE o.total > :min_total;"
-  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
   let sql1 = "SELECT * FROM users WHERE id = ?;"
   let sql2 = "SELECT * FROM users WHERE id = $1;"
   let sql3 = "SELECT * FROM users WHERE id = :user_id;"
-  let stmt1 = parse_sql(dialect=MySQL::{  }, sql1).stmts[0] |> pretty_print
+  let stmt1 = parse_sql(dialect=MySQL::{  }, sql1).stmts[0] |> pretty_print_renamed
-  let stmt2 = parse_sql(dialect=Postgres::{  }, sql2).stmts[0] |> pretty_print
+  let stmt2 = parse_sql(dialect=Postgres::{  }, sql2).stmts[0] |> pretty_print_renamed
-  let stmt3 = parse_sql(dialect=Postgres::{  }, sql3).stmts[0] |> pretty_print
+  let stmt3 = parse_sql(dialect=Postgres::{  }, sql3).stmts[0] |> pretty_print_renamed
   inspect(
     stmt1,
     content=(
@@
 ///|
 test "Placeholder in DELETE statement" {
   let sql = "DELETE FROM users WHERE id = ?;"
-  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
*** Update File: <WORKDIR>/src/parser.mbt
@@
     Token::Identifier("t"),
     Token::Semicolon,
   ]
-  let stmt = parse(tokens)[0] |> pretty_print
+  let stmt = parse(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "Parse USE database statement" {
   let tokens = [Keyword(Use), Token::Identifier("mydb"), Token::Semicolon]
-  let stmt = parse(tokens)[0] |> pretty_print
+  let stmt = parse(tokens)[0] |> pretty_print_renamed
   inspect(stmt, content="USE mydb;")
 }
 
@@
     Token::Identifier("production"),
     Token::Semicolon,
   ]
-  let stmt = parse(tokens)[0] |> pretty_print
+  let stmt = parse(tokens)[0] |> pretty_print_renamed
   inspect(stmt, content="USE company.production;")
 }
 
@@
     Token::Identifier("my database"),
     Token::Semicolon,
   ]
-  let stmt = parse(tokens)[0] |> pretty_print
+  let stmt = parse(tokens)[0] |> pretty_print_renamed
   inspect(stmt, content="USE `my database`;")
 }
 
@@
     Token::StringLiteral("/tmp/users.csv"),
     Token::Semicolon,
   ]
-  let stmt = parse(tokens)[0] |> pretty_print
+  let stmt = parse(tokens)[0] |> pretty_print_renamed
   inspect(stmt, content="COPY users TO '/tmp/users.csv';")
 }
 
@@
     Token::RParen,
     Token::Semicolon,
   ]
-  let stmt = parse(tokens)[0] |> pretty_print
+  let stmt = parse(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content="COPY products FROM '/data/products.csv' (FORMAT CSV, HEADER);",
@@
     Keyword(Stdout),
     Token::Semicolon,
   ]
-  let stmt = parse(tokens)[0] |> pretty_print
+  let stmt = parse(tokens)[0] |> pretty_print_renamed
   inspect(stmt, content="COPY orders (id, amount) TO STDOUT;")
 }
 
@@
     Token::RParen,
     Token::Semicolon,
   ]
-  let stmt = parse(tokens)[0] |> pretty_print
+  let stmt = parse(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content="COPY (\n  SELECT\n    *\n  FROM\n    customers\n) TO '/tmp/customers.csv' (FORMAT CSV, DELIMITER ',', NULL '');",
@@
     Token::RParen,
     Token::Semicolon,
   ]
-  let stmt = parse(tokens)[0] |> pretty_print
+  let stmt = parse(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content="COPY employees FROM STDIN (FORMAT CSV, QUOTE '\"', ESCAPE '\\', FORCE_QUOTE *);",
*** Update File: <WORKDIR>/src/postgres.mbt
@@
 ///|
 test "PostgreSQL LISTEN" {
   let tokens = "LISTEN my_channel;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL NOTIFY without payload" {
   let tokens = "NOTIFY my_channel;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL NOTIFY with payload" {
   let tokens = "NOTIFY my_channel, 'hello world';"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 test "PostgreSQL ARRAY syntax with integers" {
   let tokens = "SELECT ARRAY[1, 2, 3, 4] FROM test;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL bracket array syntax" {
   let tokens = "SELECT [1, 2, 3] FROM test;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL empty ARRAY" {
   let tokens = "SELECT ARRAY[] FROM test;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL ARRAY with strings" {
   let tokens = "SELECT ARRAY['hello', 'world'] FROM test;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL nested arrays" {
   let tokens = "SELECT ARRAY[ARRAY[1, 2], ARRAY[3, 4]] FROM test;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL mixed bracket and ARRAY syntax" {
   let tokens = "SELECT ARRAY[[1, 2], [3, 4]] FROM test;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 test "PostgreSQL JSON extract operator" {
   let tokens = "SELECT data -> 'key' FROM json_table;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL JSON extract text operator" {
   let tokens = "SELECT data ->> 'key' FROM json_table;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL JSON path extract operator" {
   let tokens = "SELECT data #> ARRAY['key', 'subkey'] FROM json_table;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL JSON contains operator" {
   let tokens = "SELECT data @> '{\"key\":\"value\"}' FROM json_table;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL JSON contained in operator" {
   let tokens = "SELECT '{\"a\":1}' <@ data FROM json_table;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 test "PostgreSQL COUNT with FILTER" {
   let tokens = "SELECT count(*) FILTER (WHERE active) FROM users;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL COUNT without FILTER" {
   let tokens = "SELECT count(*) FROM users;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL SUM with FILTER" {
   let tokens = "SELECT sum(amount) FILTER (WHERE status = 'completed') FROM orders;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PostgreSQL multiple aggregations with FILTER" {
   let tokens = "SELECT count(*) FILTER (WHERE active), avg(age) FILTER (WHERE age > 18) FROM users;"
-  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
*** Update File: <WORKDIR>/src/prepare.mbt
@@
 ///|
 test "PREPARE simple SELECT" {
   let sql = "PREPARE stmt AS SELECT * FROM users WHERE id = ?"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PREPARE with data types" {
   let sql = "PREPARE stmt (INTEGER, VARCHAR(50)) AS SELECT * FROM users WHERE id = ? AND name = ?"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PREPARE INSERT statement" {
   let sql = "PREPARE insert_user AS INSERT INTO users (name, email) VALUES (?, ?)"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content="PREPARE insert_user AS INSERT INTO users (name, email) VALUES (?, ?);",
@@
 ///|
 test "PREPARE UPDATE statement" {
   let sql = "PREPARE update_user AS UPDATE users SET name = ? WHERE id = ?"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PREPARE DELETE statement" {
   let sql = "PREPARE delete_user AS DELETE FROM users WHERE id = ?"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PREPARE with PostgreSQL numbered placeholders" {
   let sql = "PREPARE stmt (INTEGER, TEXT) AS SELECT * FROM users WHERE id = $1 AND name = $2"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PREPARE with named parameters" {
   let sql = "PREPARE stmt AS SELECT * FROM users WHERE id = :id AND name = :name"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PREPARE with complex query" {
   let sql = "PREPARE complex_query AS SELECT u.id, u.name, COUNT(o.id) as order_count FROM users u LEFT JOIN orders o ON u.id = o.user_id WHERE u.is_active = ? GROUP BY u.id, u.name HAVING COUNT(o.id) > ?"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PREPARE with subquery" {
   let sql = "PREPARE subquery_stmt AS SELECT * FROM users WHERE id IN (SELECT user_id FROM orders WHERE amount > ?)"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PREPARE with window function" {
   let sql = "PREPARE window_stmt AS SELECT name, salary, RANK() OVER (ORDER BY salary DESC) as rank FROM employees WHERE department = ?"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "PREPARE with CTE" {
   let sql = "PREPARE cte_stmt AS WITH recent_orders AS (SELECT * FROM orders WHERE created_at > ?) SELECT * FROM recent_orders WHERE status = ?"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "EXECUTE simple" {
   let sql = "EXECUTE stmt"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "EXECUTE with parenthesized parameters" {
   let sql = "EXECUTE stmt(1, 'John')"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "EXECUTE with USING clause" {
   let sql = "EXECUTE stmt USING 1, 'John'"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "EXECUTE with complex expressions" {
   let sql = "EXECUTE stmt USING 1 + 2, CONCAT('Hello', ' World')"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(stmt, content="EXECUTE stmt USING 1 + 2, concat('Hello', ' World');")
 }
 
@@
 ///|
 test "EXECUTE IMMEDIATE" {
   let sql = "EXECUTE IMMEDIATE"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "EXECUTE IMMEDIATE with INTO" {
   let sql = "EXECUTE IMMEDIATE INTO v_result"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "EXECUTE IMMEDIATE with INTO and USING" {
   let sql = "EXECUTE IMMEDIATE INTO v_result USING 1, 'test'"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "EXECUTE with multiple INTO variables" {
   let sql = "EXECUTE IMMEDIATE INTO v_name, v_email, v_age"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "DEALLOCATE simple" {
   let sql = "DEALLOCATE stmt"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "DEALLOCATE with PREPARE keyword" {
   let sql = "DEALLOCATE PREPARE stmt"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 test "PREPARE and EXECUTE separately" {
   let sql1 = "PREPARE user_query AS SELECT * FROM users WHERE id = ?"
   let sql2 = "EXECUTE user_query(123)"
-  let stmt1 = parse_sql(sql1)[0] |> pretty_print
+  let stmt1 = parse_sql(sql1)[0] |> pretty_print_renamed
-  let stmt2 = parse_sql(sql2)[0] |> pretty_print
+  let stmt2 = parse_sql(sql2)[0] |> pretty_print_renamed
   inspect(
     stmt1,
     content=(
@@
 ///|
 test "PREPARE with multiple data types" {
   let sql = "PREPARE stmt (INTEGER, VARCHAR(100), DOUBLE) AS SELECT * FROM users WHERE id = ?"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt = parse_sql(sql)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
*** Update File: <WORKDIR>/src/tcl.mbt
@@
 
 test "BEGIN statement" {
   let tokens = "BEGIN;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "BEGIN WORK statement" {
   let tokens = "BEGIN WORK;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "BEGIN TRANSACTION statement" {
   let tokens = "BEGIN TRANSACTION;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "START TRANSACTION statement" {
   let tokens = "START TRANSACTION;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "COMMIT statement" {
   let tokens = "COMMIT;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "COMMIT WORK statement" {
   let tokens = "COMMIT WORK;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "ROLLBACK statement" {
   let tokens = "ROLLBACK;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "ROLLBACK TO SAVEPOINT statement" {
   let tokens = "ROLLBACK TO SAVEPOINT sp1;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "SAVEPOINT statement" {
   let tokens = "SAVEPOINT sp1;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 ///|
 test "RELEASE SAVEPOINT statement" {
   let tokens = "RELEASE SAVEPOINT sp1;"
-  let stmt = parse_sql(tokens)[0] |> pretty_print
+  let stmt = parse_sql(tokens)[0] |> pretty_print_renamed
   inspect(
     stmt,
     content=(
*** Update File: <WORKDIR>/src/tests/dialect_test.mbt
@@
 test "MySQL SHOW TABLES statement" {
   let sql = @sqlparser.parse_sql("SHOW TABLES;")
   inspect(sql.stmts.length(), content="1")
-  let pretty = sql.stmts[0] |> @sqlparser.pretty_print
+  let pretty = sql.stmts[0] |> @sqlparser.pretty_print_renamed
   inspect(pretty, content="SHOW TABLES;")
 }
 
@@
 test "MySQL SHOW COLUMNS with FROM" {
   let sql = @sqlparser.parse_sql("SHOW COLUMNS FROM users;")
   inspect(sql.stmts.length(), content="1")
-  let pretty = sql.stmts[0] |> @sqlparser.pretty_print
+  let pretty = sql.stmts[0] |> @sqlparser.pretty_print_renamed
   inspect(pretty, content="SHOW COLUMNS FROM users;")
 }
 
@@
 test "MySQL SHOW TABLES with LIKE filter" {
   let sql = @sqlparser.parse_sql("SHOW TABLES LIKE 'user%';")
   inspect(sql.stmts.length(), content="1")
-  let pretty = sql.stmts[0] |> @sqlparser.pretty_print
+  let pretty = sql.stmts[0] |> @sqlparser.pretty_print_renamed
   inspect(pretty, content="SHOW TABLES LIKE 'user%';")
 }
 
@@
 test "MySQL SHOW STATUS statement" {
   let sql = @sqlparser.parse_sql("SHOW STATUS;")
   inspect(sql.stmts.length(), content="1")
-  let pretty = sql.stmts[0] |> @sqlparser.pretty_print
+  let pretty = sql.stmts[0] |> @sqlparser.pretty_print_renamed
   inspect(pretty, content="SHOW STATUS;")
 }
 
@@
 test "MySQL SHOW DATABASES statement" {
   let sql = @sqlparser.parse_sql("SHOW DATABASES;")
   inspect(sql.stmts.length(), content="1")
-  let pretty = sql.stmts[0] |> @sqlparser.pretty_print
+  let pretty = sql.stmts[0] |> @sqlparser.pretty_print_renamed
   inspect(pretty, content="SHOW DATABASES;")
 }
 
@@
 test "MySQL backtick quoted table names" {
   let sql = @sqlparser.parse_sql("SELECT * FROM `table name`;")
   inspect(sql.stmts.length(), content="1")
-  let pretty = sql.stmts[0] |> @sqlparser.pretty_print
+  let pretty = sql.stmts[0] |> @sqlparser.pretty_print_renamed
   inspect(pretty, content="SELECT\n  *\nFROM\n  `table name`;")
 }
 
@@
 test "MySQL backtick quoted database.table" {
   let sql = @sqlparser.parse_sql("SELECT * FROM `my db`.`my table`;")
   inspect(sql.stmts.length(), content="1")
-  let pretty = sql.stmts[0] |> @sqlparser.pretty_print
+  let pretty = sql.stmts[0] |> @sqlparser.pretty_print_renamed
   inspect(pretty, content="SELECT\n  *\nFROM\n  `my db`.`my table`;")
 }
 
@@
 test "MySQL SHOW COLUMNS with complex table name" {
   let sql = @sqlparser.parse_sql("SHOW COLUMNS FROM `user data`;")
   inspect(sql.stmts.length(), content="1")
-  let pretty = sql.stmts[0] |> @sqlparser.pretty_print
+  let pretty = sql.stmts[0] |> @sqlparser.pretty_print_renamed
   inspect(pretty, content="SHOW COLUMNS FROM `user data`;")
 }
 
@@
 test "MySQL SHOW TABLES with complex pattern" {
   let sql = @sqlparser.parse_sql("SHOW TABLES LIKE 'test_%_data';")
   inspect(sql.stmts.length(), content="1")
-  let pretty = sql.stmts[0] |> @sqlparser.pretty_print
+  let pretty = sql.stmts[0] |> @sqlparser.pretty_print_renamed
   inspect(pretty, content="SHOW TABLES LIKE 'test_%_data';")
 }
 
*** Update File: <WORKDIR>/src/tests/tpch_test.mbt
@@
 
 ///|
 test "TPCH 1" {
-  let stmt = read_and_parse("src/tests/tpch/1.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/1.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 2" {
-  let stmt = read_and_parse("src/tests/tpch/2.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/2.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 3" {
-  let stmt = read_and_parse("src/tests/tpch/3.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/3.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 4" {
-  let stmt = read_and_parse("src/tests/tpch/4.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/4.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 5" {
-  let stmt = read_and_parse("src/tests/tpch/5.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/5.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 6" {
-  let stmt = read_and_parse("src/tests/tpch/6.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/6.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 7" {
-  let stmt = read_and_parse("src/tests/tpch/7.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/7.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 8" {
-  let stmt = read_and_parse("src/tests/tpch/8.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/8.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 9" {
-  let stmt = read_and_parse("src/tests/tpch/9.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/9.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 10" {
-  let stmt = read_and_parse("src/tests/tpch/10.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/10.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 11" {
-  let stmt = read_and_parse("src/tests/tpch/11.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/11.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 12" {
-  let stmt = read_and_parse("src/tests/tpch/12.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/12.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 13" {
-  let stmt = read_and_parse("src/tests/tpch/13.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/13.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 14" {
-  let stmt = read_and_parse("src/tests/tpch/14.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/14.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 15" {
-  let stmt = read_and_parse("src/tests/tpch/15.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/15.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 16" {
-  let stmt = read_and_parse("src/tests/tpch/16.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/16.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 17" {
-  let stmt = read_and_parse("src/tests/tpch/17.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/17.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 18" {
-  let stmt = read_and_parse("src/tests/tpch/18.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/18.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 19" {
-  let stmt = read_and_parse("src/tests/tpch/19.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/19.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 20" {
-  let stmt = read_and_parse("src/tests/tpch/20.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/20.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 21" {
-  let stmt = read_and_parse("src/tests/tpch/21.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/21.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
@@
 
 ///|
 test "TPCH 22" {
-  let stmt = read_and_parse("src/tests/tpch/22.sql") |> @sqlparser.pretty_print
+  let stmt = read_and_parse("src/tests/tpch/22.sql") |> @sqlparser.pretty_print_renamed
   inspect(
     stmt,
     content=(
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'structural_print' structural_print_renamed
*** Begin Patch
*** Update File: <WORKDIR>/src/ast.mbt
@@
 }
 
 ///|
-pub fn[T : Show] structural_print(obj : T) -> String {
+pub fn[T : Show] structural_print_renamed(obj : T) -> String {
   obj.to_string()
 }
 
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'Statements' StatementsRenamed
*** Begin Patch
*** Update File: <WORKDIR>/src/ast.mbt
@@
 }
 
 ///|
-pub(all) struct Statements {
+pub(all) struct StatementsRenamed {
   /// The list of SQL statements parsed from the input.
   stmts : Array[Statement]
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for Statements with pretty(self) {
+pub impl @pp.Pretty for StatementsRenamed with pretty(self) {
   @pp.separate(@pp.hardline + @pp.hardline, self.stmts.map(@pp.pretty))
 }
 
 ///|
-pub fn Statements::op_get(self : Self, index : Int) -> Statement {
+pub fn StatementsRenamed::op_get(self : Self, index : Int) -> Statement {
   self.stmts[index]
 }
 
*** Update File: <WORKDIR>/src/export.mbt
@@
 pub fn parse_sql(
   dialect? : &Dialect = MySQL::{  },
   input : String,
-) -> Statements raise SqlParserError {
+) -> StatementsRenamed raise SqlParserError {
   let tokens = tokenize(dialect~, input) catch {
     e => raise SqlParserError::LexerError(e) (escaped)
   }
*** Update File: <WORKDIR>/src/show.mbt
@@
 }
 
 ///|
-pub impl Show for Statements with output(self, logger) {
+pub impl Show for StatementsRenamed with output(self, logger) {
   show_compact_debug(self, logger)
 }
 
*** Update File: <WORKDIR>/src/tests/tpch_test.mbt
@@
 ///|
-fn read_and_parse(path : String) -> @sqlparser.Statements {
+fn read_and_parse(path : String) -> @sqlparser.StatementsRenamed {
   let input = @fs.read_file_to_string(path) catch {
     e => { (escaped)
       println("Read file error: \{e.to_string()}")
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'Pretty::pretty for Statements' pretty_renamed
*** Begin Patch
*** Update File: <WORKDIR>/src/ast.mbt
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for Statements with pretty(self) {
+pub impl @pp.Pretty for Statements with pretty_renamed(self) {
   @pp.separate(@pp.hardline + @pp.hardline, self.stmts.map(@pp.pretty))
 }
 
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for Statement with pretty(self) {
+pub impl @pp.Pretty for Statement with pretty_renamed(self) {
   (match self {
-    Statement::Query(stmt) => stmt.pretty() (escaped)
+    Statement::Query(stmt) => stmt.pretty_renamed() (escaped)
-    CreateTable(stmt) => stmt.pretty() (escaped)
+    CreateTable(stmt) => stmt.pretty_renamed() (escaped)
-    CreateView(stmt) => stmt.pretty() (escaped)
+    CreateView(stmt) => stmt.pretty_renamed() (escaped)
-    CreateIndex(stmt) => stmt.pretty() (escaped)
+    CreateIndex(stmt) => stmt.pretty_renamed() (escaped)
-    CreateDatabase(stmt) => stmt.pretty() (escaped)
+    CreateDatabase(stmt) => stmt.pretty_renamed() (escaped)
-    CreateSchema(stmt) => stmt.pretty() (escaped)
+    CreateSchema(stmt) => stmt.pretty_renamed() (escaped)
-    CreateFunction(stmt) => stmt.pretty() (escaped)
+    CreateFunction(stmt) => stmt.pretty_renamed() (escaped)
-    CreateProcedure(stmt) => stmt.pretty() (escaped)
+    CreateProcedure(stmt) => stmt.pretty_renamed() (escaped)
-    CreateSequence(stmt) => stmt.pretty() (escaped)
+    CreateSequence(stmt) => stmt.pretty_renamed() (escaped)
-    DropView(stmt) => stmt.pretty() (escaped)
+    DropView(stmt) => stmt.pretty_renamed() (escaped)
-    DropTable(stmt) => stmt.pretty() (escaped)
+    DropTable(stmt) => stmt.pretty_renamed() (escaped)
-    DropIndex(stmt) => stmt.pretty() (escaped)
+    DropIndex(stmt) => stmt.pretty_renamed() (escaped)
-    Insert(stmt) => stmt.pretty() (escaped)
+    Insert(stmt) => stmt.pretty_renamed() (escaped)
-    Delete(stmt) => stmt.pretty() (escaped)
+    Delete(stmt) => stmt.pretty_renamed() (escaped)
-    Update(stmt) => stmt.pretty() (escaped)
+    Update(stmt) => stmt.pretty_renamed() (escaped)
-    Merge(stmt) => stmt.pretty() (escaped)
+    Merge(stmt) => stmt.pretty_renamed() (escaped)
-    Truncate(stmt) => stmt.pretty() (escaped)
+    Truncate(stmt) => stmt.pretty_renamed() (escaped)
-    AlterTable(stmt) => stmt.pretty() (escaped)
+    AlterTable(stmt) => stmt.pretty_renamed() (escaped)
-    AlterIndex(stmt) => stmt.pretty() (escaped)
+    AlterIndex(stmt) => stmt.pretty_renamed() (escaped)
-    Show(stmt) => stmt.pretty() (escaped)
+    Show(stmt) => stmt.pretty_renamed() (escaped)
-    Set(stmt) => stmt.pretty() (escaped)
+    Set(stmt) => stmt.pretty_renamed() (escaped)
-    Use(stmt) => stmt.pretty() (escaped)
+    Use(stmt) => stmt.pretty_renamed() (escaped)
-    Copy(stmt) => stmt.pretty() (escaped)
+    Copy(stmt) => stmt.pretty_renamed() (escaped)
-    LoadData(stmt) => stmt.pretty() (escaped)
+    LoadData(stmt) => stmt.pretty_renamed() (escaped)
-    Prepare(stmt) => stmt.pretty() (escaped)
+    Prepare(stmt) => stmt.pretty_renamed() (escaped)
-    Execute(stmt) => stmt.pretty() (escaped)
+    Execute(stmt) => stmt.pretty_renamed() (escaped)
-    Deallocate(stmt) => stmt.pretty() (escaped)
+    Deallocate(stmt) => stmt.pretty_renamed() (escaped)
     LockTables(tables) => (escaped)
       @pp.text("LOCK TABLES ") +
       @pp.separate(@pp.text(", "), tables.map(@pp.pretty))
@@
         Some(msg) => @pp.text(", '") + @pp.text(msg) + @pp.text("'") (escaped)
         None => @pp.empty (escaped)
       })
-    Begin(stmt) => stmt.pretty() (escaped)
+    Begin(stmt) => stmt.pretty_renamed() (escaped)
-    Commit(stmt) => stmt.pretty() (escaped)
+    Commit(stmt) => stmt.pretty_renamed() (escaped)
-    Rollback(stmt) => stmt.pretty() (escaped)
+    Rollback(stmt) => stmt.pretty_renamed() (escaped)
-    Savepoint(stmt) => stmt.pretty() (escaped)
+    Savepoint(stmt) => stmt.pretty_renamed() (escaped)
-    ReleaseSavepoint(stmt) => stmt.pretty() (escaped)
+    ReleaseSavepoint(stmt) => stmt.pretty_renamed() (escaped)
-    Grant(stmt) => stmt.pretty() (escaped)
+    Grant(stmt) => stmt.pretty_renamed() (escaped)
-    Revoke(stmt) => stmt.pretty() (escaped)
+    Revoke(stmt) => stmt.pretty_renamed() (escaped)
   }) +
   @pp.text(";")
 }
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for QueryStmt with pretty(self) {
+pub impl @pp.Pretty for QueryStmt with pretty_renamed(self) {
   (match self.with_clause {
     Some(ctes) => (escaped)
       @pp.text("WITH ") +
@@
       @pp.hardline
     None => @pp.empty (escaped)
   }) +
-  self.body.pretty() +
+  self.body.pretty_renamed() +
   (if self.order_by.length() > 0 {
     @pp.hardline +
     @pp.text("ORDER BY") +
@@
   }) +
   (match self.limit {
     Some(expr) => (escaped)
-      @pp.hardline + @pp.text("LIMIT") + @pp.nest(@pp.hardline + expr.pretty())
+      @pp.hardline + @pp.text("LIMIT") + @pp.nest(@pp.hardline + expr.pretty_renamed())
     None => @pp.empty (escaped)
   }) +
   (match self.offset {
     Some(expr) => (escaped)
-      @pp.hardline + @pp.text("OFFSET") + @pp.nest(@pp.hardline + expr.pretty())
+      @pp.hardline + @pp.text("OFFSET") + @pp.nest(@pp.hardline + expr.pretty_renamed())
     None => @pp.empty (escaped)
   })
 }
@@
 } derive(Eq, Debug)
 
 ///|
-impl @pp.Pretty for SetExpr with pretty(self) {
+impl @pp.Pretty for SetExpr with pretty_renamed(self) {
   match self {
-    Select(stmt) => stmt.pretty() (escaped)
+    Select(stmt) => stmt.pretty_renamed() (escaped)
     Query(stmt) => (escaped)
-      @pp.parens(@pp.nest(@pp.hardline + stmt.pretty()) + @pp.hardline)
+      @pp.parens(@pp.nest(@pp.hardline + stmt.pretty_renamed()) + @pp.hardline)
     SetOperation(op, left, right) => (escaped)
-      left.pretty() + @pp.hardline + op.pretty() + @pp.hardline + right.pretty()
+      left.pretty_renamed() + @pp.hardline + op.pretty_renamed() + @pp.hardline + right.pretty_renamed()
   }
 }
 
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for SelectStmt with pretty(self) {
+pub impl @pp.Pretty for SelectStmt with pretty_renamed(self) {
   @pp.text("SELECT") +
-  (if self.top is Some(top) { top.pretty() } else { @pp.empty }) +
+  (if self.top is Some(top) { top.pretty_renamed() } else { @pp.empty }) +
   (if self.distinct { @pp.text(" DISTINCT") } else { @pp.empty }) +
   (if self.projections.length() == 0 {
     @pp.nest(@pp.hardline + @pp.text("*"))
@@
     Some(selection) => (escaped)
       @pp.hardline +
       @pp.text("WHERE") +
-      @pp.nest(@pp.hardline + selection.pretty())
+      @pp.nest(@pp.hardline + selection.pretty_renamed())
     None => @pp.empty (escaped)
   }) +
   (if self.group_by.length() > 0 {
@@
   }) +
   (match self.having {
     Some(expr) => (escaped)
-      @pp.hardline + @pp.text("HAVING") + @pp.nest(@pp.hardline + expr.pretty())
+      @pp.hardline + @pp.text("HAVING") + @pp.nest(@pp.hardline + expr.pretty_renamed())
     None => @pp.empty (escaped)
   })
 }
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for SetOperator with pretty(self) {
+pub impl @pp.Pretty for SetOperator with pretty_renamed(self) {
   match self {
     SetOperator::Union => @pp.text("UNION") (escaped)
     SetOperator::Intersect => @pp.text("INTERSECT") (escaped)
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for Projection with pretty(self) {
+pub impl @pp.Pretty for Projection with pretty_renamed(self) {
   match self {
     Projection::Wildcard => @pp.char('*') (escaped)
-    Projection::UnamedExpr(expr) => expr.pretty() (escaped)
+    Projection::UnamedExpr(expr) => expr.pretty_renamed() (escaped)
     Projection::AliasedExpr(expr, alias_name) => (escaped)
-      expr.pretty() + @pp.text(" AS ") + @pp.text(alias_name)
+      expr.pretty_renamed() + @pp.text(" AS ") + @pp.text(alias_name)
   }
 }
 
@@
 fn wrap_parens(expr : Expr, current_op : BinaryOperator) -> @pp.Document {
   if current_op == BinaryOperator::Or &&
     expr is Expr::BinaryOperation(_, And, _) {
-    @pp.parens(@pp.nest(@pp.hardline + expr.pretty()) + @pp.hardline)
+    @pp.parens(@pp.nest(@pp.hardline + expr.pretty_renamed()) + @pp.hardline)
   } else if expr is Expr::BinaryOperation(_, op, _) &&
     op.get_precedence().value() < current_op.get_precedence().value() {
-    @pp.parens(expr.pretty())
+    @pp.parens(expr.pretty_renamed())
   } else {
-    expr.pretty()
+    expr.pretty_renamed()
   }
 }
 
 ///|
-pub impl @pp.Pretty for Expr with pretty(self) {
+pub impl @pp.Pretty for Expr with pretty_renamed(self) {
   match self {
     Expr::Identifier(name) => @pp.text(name) (escaped)
     Expr::CompoundIdentifier(parts) => (escaped)
       @pp.separate(@pp.text("."), parts.map(@pp.text))
-    Expr::Literal(lit) => lit.pretty() (escaped)
+    Expr::Literal(lit) => lit.pretty_renamed() (escaped)
     Expr::BinaryOperation(left, op, right) => (escaped)
       wrap_parens(left, op) +
       @pp.space +
-      op.pretty() +
+      op.pretty_renamed() +
       @pp.space +
       wrap_parens(right, op)
-    Expr::UnaryOperation(op, expr) => op.pretty() + expr.pretty() (escaped)
+    Expr::UnaryOperation(op, expr) => op.pretty_renamed() + expr.pretty_renamed() (escaped)
     Expr::FunctionCall(name, dup, args, filter) => (escaped)
       @pp.text(name) +
       @pp.parens(
-        (if dup is Some(dup) { dup.pretty() + @pp.space } else { @pp.empty }) +
+        (if dup is Some(dup) { dup.pretty_renamed() + @pp.space } else { @pp.empty }) +
         @pp.separate(@pp.text(", "), args.map(@pp.pretty)),
       ) +
       (if filter is Some(filter) {
-        @pp.text(" FILTER (WHERE ") + filter.pretty() + @pp.text(")")
+        @pp.text(" FILTER (WHERE ") + filter.pretty_renamed() + @pp.text(")")
       } else {
         @pp.empty
       })
@@
     Expr::Wildcard => @pp.char('*') (escaped)
     Datetime(s) => @pp.text("DATE '") + @pp.text(s) + @pp.char('\\'') (escaped)
     Interval(s, qualifier) => (escaped)
-      @pp.text("INTERVAL '") + @pp.text(s) + @pp.text("' ") + qualifier.pretty()
+      @pp.text("INTERVAL '") + @pp.text(s) + @pp.text("' ") + qualifier.pretty_renamed()
     Expr::Like(positive~, left, right) => (escaped)
-      left.pretty() +
+      left.pretty_renamed() +
       @pp.text(if positive { "" } else { " NOT" }) +
       @pp.text(" LIKE ") +
-      right.pretty()
+      right.pretty_renamed()
     Expr::ILike(positive~, left, right) => (escaped)
-      left.pretty() +
+      left.pretty_renamed() +
       @pp.text(if positive { "" } else { " NOT" }) +
       @pp.text(" ILIKE ") +
-      right.pretty()
+      right.pretty_renamed()
     Expr::SubQuery(stmt) => (escaped)
-      @pp.parens(@pp.nest(@pp.hardline + stmt.pretty()) + @pp.hardline)
+      @pp.parens(@pp.nest(@pp.hardline + stmt.pretty_renamed()) + @pp.hardline)
     Expr::Exists(positive~, stmt) => (escaped)
       (if positive { @pp.text("EXISTS (") } else { @pp.text("NOT EXISTS (") }) +
       @pp.hardline +
-      @pp.nest(stmt.pretty()) +
+      @pp.nest(stmt.pretty_renamed()) +
       @pp.hardline +
       @pp.char(')')
     Expr::Between(positive~, e, low, hi) => (escaped)
-      e.pretty() +
+      e.pretty_renamed() +
       @pp.text(if positive { " BETWEEN " } else { " NOT BETWEEN " }) +
-      low.pretty() +
+      low.pretty_renamed() +
       @pp.text(" AND ") +
-      hi.pretty()
+      hi.pretty_renamed()
     Expr::Extract(field, expr) => (escaped)
       @pp.text("EXTRACT(") +
-      field.pretty() +
+      field.pretty_renamed() +
       @pp.text(" FROM ") +
-      expr.pretty() +
+      expr.pretty_renamed() +
       @pp.char(')')
-    Expr::Case(case_expr) => case_expr.pretty() (escaped)
+    Expr::Case(case_expr) => case_expr.pretty_renamed() (escaped)
     Expr::InList(positive~, expr, items) => (escaped)
-      expr.pretty() +
+      expr.pretty_renamed() +
       @pp.text(if positive { " IN (" } else { " NOT IN (" }) +
       @pp.separate(@pp.text(", "), items.map(@pp.pretty)) +
       @pp.char(')')
     Expr::InSubQuery(positive~, expr, sub_query) => (escaped)
-      expr.pretty() +
+      expr.pretty_renamed() +
       @pp.text(if positive { " IN (" } else { " NOT IN (" }) +
-      @pp.nest(@pp.hardline + sub_query.pretty()) +
+      @pp.nest(@pp.hardline + sub_query.pretty_renamed()) +
       @pp.hardline +
       @pp.char(')')
     Expr::Substring(expr, from, for_expr) => (escaped)
       @pp.text("SUBSTRING(") +
-      expr.pretty() +
+      expr.pretty_renamed() +
       (match from {
-        Some(from_expr) => @pp.text(" FROM ") + from_expr.pretty() (escaped)
+        Some(from_expr) => @pp.text(" FROM ") + from_expr.pretty_renamed() (escaped)
         None => @pp.empty (escaped)
       }) +
       (match for_expr {
-        Some(for_expr) => @pp.text(" FOR ") + for_expr.pretty() (escaped)
+        Some(for_expr) => @pp.text(" FOR ") + for_expr.pretty_renamed() (escaped)
         None => @pp.empty (escaped)
       }) +
       @pp.char(')')
     Expr::Placeholder(s) => @pp.text(s) (escaped)
-    Expr::Array(arr) => arr.pretty() (escaped)
+    Expr::Array(arr) => arr.pretty_renamed() (escaped)
     Expr::CompoundFieldAccess(root, access_chain) => (escaped)
-      root.pretty() + @pp.separate(@pp.empty, access_chain.map(@pp.pretty))
+      root.pretty_renamed() + @pp.separate(@pp.empty, access_chain.map(@pp.pretty))
     Expr::WindowFunction(name, dup, args, window_spec) => (escaped)
       @pp.text(name) +
       @pp.parens(
-        (if dup is Some(dup) { dup.pretty() + @pp.space } else { @pp.empty }) +
+        (if dup is Some(dup) { dup.pretty_renamed() + @pp.space } else { @pp.empty }) +
         @pp.separate(@pp.text(", "), args.map(@pp.pretty)),
       ) +
       @pp.text(" OVER (") +
-      window_spec.pretty() +
+      window_spec.pretty_renamed() +
       @pp.text(")")
   }
 }
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for Literal with pretty(self) {
+pub impl @pp.Pretty for Literal with pretty_renamed(self) {
   match self {
     Literal::Integer(value) => @pp.text("\\{value}") (escaped)
     Literal::Double(value) => @pp.text("\\{value}") (escaped)
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for ArrayExpr with pretty(self) {
+pub impl @pp.Pretty for ArrayExpr with pretty_renamed(self) {
   (if self.named { @pp.text("ARRAY") } else { @pp.empty }) +
   @pp.text("[") +
   @pp.separate(@pp.text(", "), self.elem.map(@pp.pretty)) +
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for AccessExpr with pretty(self) {
+pub impl @pp.Pretty for AccessExpr with pretty_renamed(self) {
   match self {
-    AccessExpr::Dot(expr) => @pp.text(".") + expr.pretty() (escaped)
+    AccessExpr::Dot(expr) => @pp.text(".") + expr.pretty_renamed() (escaped)
-    AccessExpr::Subscript(subscript) => subscript.pretty() (escaped)
+    AccessExpr::Subscript(subscript) => subscript.pretty_renamed() (escaped)
   }
 }
 
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for Subscript with pretty(self) {
+pub impl @pp.Pretty for Subscript with pretty_renamed(self) {
   match self {
-    Subscript::Index(index) => @pp.text("[") + index.pretty() + @pp.text("]") (escaped)
+    Subscript::Index(index) => @pp.text("[") + index.pretty_renamed() + @pp.text("]") (escaped)
     Subscript::Slice(lower, upper, stride) => (escaped)
       @pp.text("[") +
       (match lower {
-        Some(l) => l.pretty() (escaped)
+        Some(l) => l.pretty_renamed() (escaped)
         None => @pp.empty (escaped)
       }) +
       @pp.text(":") +
       (match upper {
-        Some(u) => u.pretty() (escaped)
+        Some(u) => u.pretty_renamed() (escaped)
         None => @pp.empty (escaped)
       }) +
       (match stride {
-        Some(s) => @pp.text(":") + s.pretty() (escaped)
+        Some(s) => @pp.text(":") + s.pretty_renamed() (escaped)
         None => @pp.empty (escaped)
       }) +
       @pp.text("]")
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for Cte with pretty(self) {
+pub impl @pp.Pretty for Cte with pretty_renamed(self) {
   @pp.text(self.name) +
   (match self.columns {
     Some(cols) => (escaped)
@@
     None => @pp.empty (escaped)
   }) +
   @pp.text(" AS (") +
-  @pp.nest(@pp.hardline + self.query.pretty()) +
+  @pp.nest(@pp.hardline + self.query.pretty_renamed()) +
   @pp.hardline +
   @pp.text(")")
 }
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for BinaryOperator with pretty(self) {
+pub impl @pp.Pretty for BinaryOperator with pretty_renamed(self) {
   match self {
     BinaryOperator::Eq => @pp.text("=") (escaped)
     BinaryOperator::Neq => @pp.text("<>") (escaped)
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for UnaryOperator with pretty(self) {
+pub impl @pp.Pretty for UnaryOperator with pretty_renamed(self) {
   match self {
     UnaryOperator::Plus => @pp.text("+") (escaped)
     UnaryOperator::Minus => @pp.text("-") (escaped)
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for OrderByExpr with pretty(self) {
+pub impl @pp.Pretty for OrderByExpr with pretty_renamed(self) {
-  self.expr.pretty() +
+  self.expr.pretty_renamed() +
   (match self.asc {
     Some(true) => @pp.text(" ASC") (escaped)
     Some(false) => @pp.text(" DESC") (escaped)
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for TableRef with pretty(self) {
+pub impl @pp.Pretty for TableRef with pretty_renamed(self) {
-  self.factor.pretty() +
+  self.factor.pretty_renamed() +
-  @pp.separate_map(@pp.hardline, self.joins, fn(join) { join.pretty() })
+  @pp.separate_map(@pp.hardline, self.joins, fn(join) { join.pretty_renamed() })
 }
 
 ///|
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for TableFactor with pretty(self) {
+pub impl @pp.Pretty for TableFactor with pretty_renamed(self) {
   match self {
     TableFactor::Column(name, alias_name) => (escaped)
-      name.pretty() +
+      name.pretty_renamed() +
       (match alias_name {
-        Some(a) => a.pretty() (escaped)
+        Some(a) => a.pretty_renamed() (escaped)
         None => @pp.empty (escaped)
       })
     TableFactor::SubQuery(stmt, alias_name) => (escaped)
-      @pp.parens(@pp.nest(@pp.hardline + stmt.pretty()) + @pp.hardline) +
+      @pp.parens(@pp.nest(@pp.hardline + stmt.pretty_renamed()) + @pp.hardline) +
       (match alias_name {
-        Some(a) => a.pretty() (escaped)
+        Some(a) => a.pretty_renamed() (escaped)
         None => @pp.empty (escaped)
       })
   }
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for TableAlias with pretty(self) {
+pub impl @pp.Pretty for TableAlias with pretty_renamed(self) {
   @pp.text(" AS ") +
   @pp.text(self.name) +
   (if self.columns.length() > 0 {
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for Join with pretty(self) {
+pub impl @pp.Pretty for Join with pretty_renamed(self) {
   @pp.space +
-  self.join_operator.pretty() +
+  self.join_operator.pretty_renamed() +
   @pp.space +
-  self.table_ref.pretty() +
+  self.table_ref.pretty_renamed() +
   (match self.join_operator {
-    JoinOperator::Join(constraint) => constraint.pretty() (escaped)
+    JoinOperator::Join(constraint) => constraint.pretty_renamed() (escaped)
-    JoinOperator::Left(constraint) => constraint.pretty() (escaped)
+    JoinOperator::Left(constraint) => constraint.pretty_renamed() (escaped)
-    JoinOperator::Right(constraint) => constraint.pretty() (escaped)
+    JoinOperator::Right(constraint) => constraint.pretty_renamed() (escaped)
-    JoinOperator::Full(constraint) => constraint.pretty() (escaped)
+    JoinOperator::Full(constraint) => constraint.pretty_renamed() (escaped)
-    JoinOperator::Inner(constraint) => constraint.pretty() (escaped)
+    JoinOperator::Inner(constraint) => constraint.pretty_renamed() (escaped)
-    JoinOperator::LeftOuter(constraint) => constraint.pretty() (escaped)
+    JoinOperator::LeftOuter(constraint) => constraint.pretty_renamed() (escaped)
-    JoinOperator::RightOuter(constraint) => constraint.pretty() (escaped)
+    JoinOperator::RightOuter(constraint) => constraint.pretty_renamed() (escaped)
-    JoinOperator::FullOuter(constraint) => constraint.pretty() (escaped)
+    JoinOperator::FullOuter(constraint) => constraint.pretty_renamed() (escaped)
     JoinOperator::Cross => @pp.empty (escaped)
   })
 }
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for JoinOperator with pretty(self) {
+pub impl @pp.Pretty for JoinOperator with pretty_renamed(self) {
   match self {
     JoinOperator::Join(_) => @pp.text("JOIN") (escaped)
     JoinOperator::Left(_) => @pp.text("LEFT JOIN") (escaped)
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for JoinConstraint with pretty(self) {
+pub impl @pp.Pretty for JoinConstraint with pretty_renamed(self) {
   match self {
     JoinConstraint::On(expr) => (escaped)
-      @pp.nest(@pp.hardline + @pp.text("ON ") + expr.pretty())
+      @pp.nest(@pp.hardline + @pp.text("ON ") + expr.pretty_renamed())
     JoinConstraint::Using(cols) => (escaped)
       @pp.nest(
         @pp.hardline +
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for IntervalQualifier with pretty(self) {
+pub impl @pp.Pretty for IntervalQualifier with pretty_renamed(self) {
   match self {
-    IntervalQualifier::Single(field) => field.pretty() (escaped)
+    IntervalQualifier::Single(field) => field.pretty_renamed() (escaped)
     IntervalQualifier::Range(from, to) => (escaped)
-      @pp.group(from.pretty() + @pp.text(" TO ") + to.pretty())
+      @pp.group(from.pretty_renamed() + @pp.text(" TO ") + to.pretty_renamed())
   }
 }
 
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for PrimaryDatetimeField with pretty(self) {
+pub impl @pp.Pretty for PrimaryDatetimeField with pretty_renamed(self) {
-  self.field.pretty() +
+  self.field.pretty_renamed() +
   @pp.group(
     if self.precision is Some(p) {
       @pp.text(" (\{p})")
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for DatetimeUnit with pretty(self) {
+pub impl @pp.Pretty for DatetimeUnit with pretty_renamed(self) {
   match self {
     DatetimeUnit::Year => @pp.text("YEAR") (escaped)
     DatetimeUnit::Month => @pp.text("MONTH") (escaped)
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for CaseExpr with pretty(self) {
+pub impl @pp.Pretty for CaseExpr with pretty_renamed(self) {
   @pp.text("CASE") +
   (match self.operand {
-    Some(op) => @pp.space + op.pretty() (escaped)
+    Some(op) => @pp.space + op.pretty_renamed() (escaped)
     None => @pp.empty (escaped)
   }) +
   @pp.nest(
@@
         let condition = condition_result.0
         let result = condition_result.1
         @pp.text("WHEN ") +
-        condition.pretty() +
+        condition.pretty_renamed() +
         @pp.text(" THEN ") +
-        result.pretty()
+        result.pretty_renamed()
       }),
     ) +
     (match self.else_expr {
-      Some(else_expr) => @pp.hardline + @pp.text("ELSE ") + else_expr.pretty() (escaped)
+      Some(else_expr) => @pp.hardline + @pp.text("ELSE ") + else_expr.pretty_renamed() (escaped)
       None => @pp.empty (escaped)
     }),
   ) +
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for WindowSpec with pretty(self) {
+pub impl @pp.Pretty for WindowSpec with pretty_renamed(self) {
   let partition_clause = if self.partition_by.is_empty() {
     @pp.empty
   } else {
@@
     @pp.separate(@pp.text(", "), self.order_by.map(@pp.pretty))
   }
   let frame_clause = match self.frame_clause {
-    Some(frame) => @pp.space + frame.pretty() (escaped)
+    Some(frame) => @pp.space + frame.pretty_renamed() (escaped)
     None => @pp.empty (escaped)
   }
   let clauses = []
@@
 }
 
 ///|
-pub impl @pp.Pretty for WindowFrameClause with pretty(self) {
+pub impl @pp.Pretty for WindowFrameClause with pretty_renamed(self) {
   let units_text = match self.frame_units {
     WindowFrameUnits::Rows => "ROWS" (escaped)
     WindowFrameUnits::Range => "RANGE" (escaped)
@@
     Some(end_bound) => (escaped)
       @pp.text(units_text) +
       @pp.text(" BETWEEN ") +
-      self.frame_start.pretty() +
+      self.frame_start.pretty_renamed() +
       @pp.text(" AND ") +
-      end_bound.pretty()
+      end_bound.pretty_renamed()
-    None => @pp.text(units_text) + @pp.space + self.frame_start.pretty() (escaped)
+    None => @pp.text(units_text) + @pp.space + self.frame_start.pretty_renamed() (escaped)
   }
 }
 
 ///|
-pub impl @pp.Pretty for WindowFrameBound with pretty(self) {
+pub impl @pp.Pretty for WindowFrameBound with pretty_renamed(self) {
   match self {
     WindowFrameBound::UnboundedPreceding => @pp.text("UNBOUNDED PRECEDING") (escaped)
     WindowFrameBound::UnboundedFollowing => @pp.text("UNBOUNDED FOLLOWING") (escaped)
     WindowFrameBound::CurrentRow => @pp.text("CURRENT ROW") (escaped)
-    WindowFrameBound::Preceding(expr) => expr.pretty() + @pp.text(" PRECEDING") (escaped)
+    WindowFrameBound::Preceding(expr) => expr.pretty_renamed() + @pp.text(" PRECEDING") (escaped)
-    WindowFrameBound::Following(expr) => expr.pretty() + @pp.text(" FOLLOWING") (escaped)
+    WindowFrameBound::Following(expr) => expr.pretty_renamed() + @pp.text(" FOLLOWING") (escaped)
   }
 }
 
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for CreateTableStmt with pretty(self) {
+pub impl @pp.Pretty for CreateTableStmt with pretty_renamed(self) {
   @pp.text("CREATE TABLE ") +
   (if self.if_not_exists { @pp.text("IF NOT EXISTS ") } else { @pp.empty }) +
   @pp.text(self.name) +
   @pp.space +
-  self.definition.pretty()
+  self.definition.pretty_renamed()
 }
 
 ///|
-pub impl @pp.Pretty for CreateTableDefinition with pretty(self) {
+pub impl @pp.Pretty for CreateTableDefinition with pretty_renamed(self) {
   match self {
     CreateTableDefinition::Columns(columns, constraints) => (escaped)
       @pp.text("(") +
@@
       ) +
       @pp.hardline +
       @pp.text(")")
-    CreateTableDefinition::AsQuery(query) => @pp.text("AS ") + query.pretty() (escaped)
+    CreateTableDefinition::AsQuery(query) => @pp.text("AS ") + query.pretty_renamed() (escaped)
   }
 }
 
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for ColumnDef with pretty(self) {
+pub impl @pp.Pretty for ColumnDef with pretty_renamed(self) {
   @pp.text(self.name) +
   @pp.space +
-  self.data_type.pretty() +
+  self.data_type.pretty_renamed() +
   @pp.separate(@pp.empty, self.options.map(@pp.pretty))
 }
 
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for DataType with pretty(self) {
+pub impl @pp.Pretty for DataType with pretty_renamed(self) {
   match self {
     Integer => @pp.text("INTEGER") (escaped)
     Smallint => @pp.text("SMALLINT") (escaped)
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for ColumnDefOption with pretty(self) {
+pub impl @pp.Pretty for ColumnDefOption with pretty_renamed(self) {
   match self {
     NotNull => @pp.text(" NOT NULL") (escaped)
     Unique => @pp.text(" UNIQUE") (escaped)
-    Default(expr) => @pp.text(" DEFAULT ") + expr.pretty() (escaped)
+    Default(expr) => @pp.text(" DEFAULT ") + expr.pretty_renamed() (escaped)
     PrimaryKey => @pp.text(" PRIMARY KEY") (escaped)
   }
 }
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for CreateViewStmt with pretty(self) {
+pub impl @pp.Pretty for CreateViewStmt with pretty_renamed(self) {
   @pp.text("CREATE VIEW ") +
   @pp.text(self.name) +
   (if self.columns.length() > 0 {
@@
   @pp.space +
   @pp.text("AS") +
   @pp.hardline +
-  self.query.pretty()
+  self.query.pretty_renamed()
 }
 
 ///|
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for CreateIndexStmt with pretty(self) {
+pub impl @pp.Pretty for CreateIndexStmt with pretty_renamed(self) {
   @pp.text("CREATE") +
   (if self.unique { @pp.text(" UNIQUE") } else { @pp.empty }) +
   @pp.text(" INDEX") +
@@
   @pp.text(" ") +
   @pp.text(self.name) +
   @pp.text(" ON ") +
-  self.table_name.pretty() +
+  self.table_name.pretty_renamed() +
   (match self.index_method {
-    Some(index_method) => @pp.text(" USING ") + index_method.pretty() (escaped)
+    Some(index_method) => @pp.text(" USING ") + index_method.pretty_renamed() (escaped)
     None => @pp.empty (escaped)
   }) +
   @pp.text(" (") +
@@
   @pp.separate(@pp.text(", "), self.columns.map(@pp.pretty)) +
   @pp.text(")") +
   (match self.where_clause {
-    Some(expr) => @pp.text(" WHERE ") + expr.pretty() (escaped)
+    Some(expr) => @pp.text(" WHERE ") + expr.pretty_renamed() (escaped)
     None => @pp.empty (escaped)
   })
 }
 
 ///|
-pub impl @pp.Pretty for IndexMethod with pretty(self) {
+pub impl @pp.Pretty for IndexMethod with pretty_renamed(self) {
   match self {
     IndexMethod::Btree => @pp.text("BTREE") (escaped)
     IndexMethod::Hash => @pp.text("HASH") (escaped)
@@
 }
 
 ///|
-pub impl @pp.Pretty for IndexColumn with pretty(self) {
+pub impl @pp.Pretty for IndexColumn with pretty_renamed(self) {
-  self.name.pretty() +
+  self.name.pretty_renamed() +
   (match self.asc {
     Some(true) => @pp.text(" ASC") (escaped)
     Some(false) => @pp.text(" DESC") (escaped)
@@
 }
 
 ///|
-pub impl @pp.Pretty for ViewColumnDef with pretty(self) {
+pub impl @pp.Pretty for ViewColumnDef with pretty_renamed(self) {
   @pp.text(self.name)
 }
 
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for CreateDatabaseStmt with pretty(self) {
+pub impl @pp.Pretty for CreateDatabaseStmt with pretty_renamed(self) {
   @pp.text("CREATE DATABASE ") +
   (if self.if_not_exists { @pp.text("IF NOT EXISTS ") } else { @pp.empty }) +
   @pp.text(self.name) +
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for CreateSchemaStmt with pretty(self) {
+pub impl @pp.Pretty for CreateSchemaStmt with pretty_renamed(self) {
   @pp.text("CREATE SCHEMA ") +
   (if self.if_not_exists { @pp.text("IF NOT EXISTS ") } else { @pp.empty }) +
   @pp.text(self.name) +
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for CreateFunctionStmt with pretty(self) {
+pub impl @pp.Pretty for CreateFunctionStmt with pretty_renamed(self) {
   @pp.text("CREATE FUNCTION ") +
   (if self.if_not_exists { @pp.text("IF NOT EXISTS ") } else { @pp.empty }) +
   @pp.text(self.name) +
   @pp.parens(@pp.separate(@pp.text(", "), self.parameters.map(@pp.pretty))) +
   (match self.return_type {
-    Some(ret_type) => @pp.text(" RETURNS ") + ret_type.pretty() (escaped)
+    Some(ret_type) => @pp.text(" RETURNS ") + ret_type.pretty_renamed() (escaped)
     None => @pp.empty (escaped)
   }) +
   (match self.language {
@@
 }
 
 ///|
-pub impl @pp.Pretty for CreateProcedureStmt with pretty(self) {
+pub impl @pp.Pretty for CreateProcedureStmt with pretty_renamed(self) {
   @pp.text("CREATE PROCEDURE ") +
   (if self.if_not_exists { @pp.text("IF NOT EXISTS ") } else { @pp.empty }) +
   @pp.text(self.name) +
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for CreateSequenceStmt with pretty(self) {
+pub impl @pp.Pretty for CreateSequenceStmt with pretty_renamed(self) {
   @pp.text("CREATE ") +
   (if self.temporary { @pp.text("TEMPORARY ") } else { @pp.empty }) +
   @pp.text("SEQUENCE ") +
@@
   }) +
   (match self.owned_by {
     Some(SequenceOwnedBy::Column(table, column)) => (escaped)
-      @pp.text(" OWNED BY ") + table.pretty() + @pp.text(".") + @pp.text(column)
+      @pp.text(" OWNED BY ") + table.pretty_renamed() + @pp.text(".") + @pp.text(column)
     Some(SequenceOwnedBy::ByNone) => @pp.text(" OWNED BY NONE") (escaped)
     None => @pp.empty (escaped)
   })
@@
 }
 
 ///|
-pub impl @pp.Pretty for SequenceLimit with pretty(self) {
+pub impl @pp.Pretty for SequenceLimit with pretty_renamed(self) {
   match self {
     SequenceLimit::Value(val) => @pp.text(val.to_string()) (escaped)
     SequenceLimit::NoLimit => @pp.text("NO LIMIT") (escaped)
@@
 }
 
 ///|
-pub impl @pp.Pretty for SequenceOwnedBy with pretty(self) {
+pub impl @pp.Pretty for SequenceOwnedBy with pretty_renamed(self) {
   match self {
     SequenceOwnedBy::Column(table, column) => (escaped)
-      table.pretty() + @pp.text(".") + @pp.text(column)
+      table.pretty_renamed() + @pp.text(".") + @pp.text(column)
     SequenceOwnedBy::ByNone => @pp.text("NONE") (escaped)
   }
 }
 
 ///|
-pub impl @pp.Pretty for FunctionParameter with pretty(self) {
+pub impl @pp.Pretty for FunctionParameter with pretty_renamed(self) {
   (match self.mode {
     Some(ParameterMode::In) => @pp.text("IN ") (escaped)
     Some(ParameterMode::Out) => @pp.text("OUT ") (escaped)
@@
   }) +
   @pp.text(self.name) +
   @pp.space +
-  self.param_type.pretty()
+  self.param_type.pretty_renamed()
 }
 
 ///|
-pub impl @pp.Pretty for ParameterMode with pretty(self) {
+pub impl @pp.Pretty for ParameterMode with pretty_renamed(self) {
   match self {
     ParameterMode::In => @pp.text("IN") (escaped)
     ParameterMode::Out => @pp.text("OUT") (escaped)
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for DropViewStmt with pretty(self) {
+pub impl @pp.Pretty for DropViewStmt with pretty_renamed(self) {
   @pp.text("DROP VIEW ") + @pp.text(self.name)
 }
 
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for DuplicateTreatment with pretty(self) {
+pub impl @pp.Pretty for DuplicateTreatment with pretty_renamed(self) {
   match self {
     DuplicateTreatment::Distinct => @pp.text("DISTINCT") (escaped)
     DuplicateTreatment::All => @pp.text("ALL") (escaped)
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for TableConstraint with pretty(self) {
+pub impl @pp.Pretty for TableConstraint with pretty_renamed(self) {
   match self {
     Unique(cols) => (escaped)
       @pp.text("UNIQUE ") +
@@
       @pp.text("FOREIGN KEY ") +
       @pp.parens(@pp.separate(@pp.text(", "), columns.map(@pp.pretty))) +
       @pp.text(" REFERENCES ") +
-      foreign_table.pretty() +
+      foreign_table.pretty_renamed() +
       (if foreign_columns.length() == 0 {
         @pp.empty
       } else {
@@
         @pp.space +
         @pp.parens(@pp.separate(@pp.text(", "), foreign_columns.map(@pp.text)))
       })
-    Check(expr) => @pp.text("CHECK (") + expr.pretty() + @pp.char(')') (escaped)
+    Check(expr) => @pp.text("CHECK (") + expr.pretty_renamed() + @pp.char(')') (escaped)
   }
 }
 
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for ObjectName with pretty(self) {
+pub impl @pp.Pretty for ObjectName with pretty_renamed(self) {
   @pp.separate(
     @pp.text("."),
     self.parts.map(fn(part) {
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for Top with pretty(self) {
+pub impl @pp.Pretty for Top with pretty_renamed(self) {
   match self {
     Top::Constant(value) => @pp.text(" TOP \\{value}") (escaped)
-    Top::Expr(expr) => @pp.text(" TOP (") + expr.pretty() + @pp.text(")") (escaped)
+    Top::Expr(expr) => @pp.text(" TOP (") + expr.pretty_renamed() + @pp.text(")") (escaped)
   }
 }
 
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for InsertStmt with pretty(self) {
+pub impl @pp.Pretty for InsertStmt with pretty_renamed(self) {
   // Handle REPLACE vs INSERT OR REPLACE
   (match self.or {
     Some(SqliteOnConflict::Replace) => @pp.text("REPLACE INTO ") (escaped)
     Some(conflict) => (escaped)
-      @pp.text("INSERT ") + conflict.pretty() + @pp.text(" INTO ")
+      @pp.text("INSERT ") + conflict.pretty_renamed() + @pp.text(" INTO ")
     None => @pp.text("INSERT INTO ") (escaped)
   }) +
-  self.table_name.pretty() +
+  self.table_name.pretty_renamed() +
   (if self.columns.length() > 0 {
     @pp.space +
     @pp.parens(@pp.separate(@pp.text(", "), self.columns.map(@pp.text)))
@@
     @pp.empty
   }) +
   @pp.space +
-  self.source.pretty() +
+  self.source.pretty_renamed() +
   (match self.on {
-    Some(on_insert) => @pp.space + on_insert.pretty() (escaped)
+    Some(on_insert) => @pp.space + on_insert.pretty_renamed() (escaped)
     None => @pp.empty (escaped)
   })
 }
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for InsertSource with pretty(self) {
+pub impl @pp.Pretty for InsertSource with pretty_renamed(self) {
   match self {
     InsertSource::Values(rows) => (escaped)
       @pp.text("VALUES ") +
@@
           @pp.parens(@pp.separate(@pp.text(", "), row.map(@pp.pretty)))
         }),
       )
-    InsertSource::Query(query) => query.pretty() (escaped)
+    InsertSource::Query(query) => query.pretty_renamed() (escaped)
   }
 }
 
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for DeleteStmt with pretty(self) {
+pub impl @pp.Pretty for DeleteStmt with pretty_renamed(self) {
   @pp.text("DELETE FROM ") +
-  self.table_name.pretty() +
+  self.table_name.pretty_renamed() +
   (match self.where_clause {
-    Some(expr) => @pp.hardline + @pp.text("WHERE") + @pp.space + expr.pretty() (escaped)
+    Some(expr) => @pp.hardline + @pp.text("WHERE") + @pp.space + expr.pretty_renamed() (escaped)
     None => @pp.empty (escaped)
   })
 }
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for UpdateStmt with pretty(self) {
+pub impl @pp.Pretty for UpdateStmt with pretty_renamed(self) {
   @pp.text("UPDATE ") +
-  self.table_name.pretty() +
+  self.table_name.pretty_renamed() +
   @pp.hardline +
   @pp.text("SET ") +
   @pp.separate(@pp.text(", "), self.assignments.map(@pp.pretty)) +
   (match self.where_clause {
-    Some(expr) => @pp.hardline + @pp.text("WHERE") + @pp.space + expr.pretty() (escaped)
+    Some(expr) => @pp.hardline + @pp.text("WHERE") + @pp.space + expr.pretty_renamed() (escaped)
     None => @pp.empty (escaped)
   })
 }
 
 ///|
-pub impl @pp.Pretty for Assignment with pretty(self) {
+pub impl @pp.Pretty for Assignment with pretty_renamed(self) {
-  @pp.text(self.column) + @pp.text(" = ") + self.value.pretty()
+  @pp.text(self.column) + @pp.text(" = ") + self.value.pretty_renamed()
 }
 
 ///|
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for MergeStmt with pretty(self) {
+pub impl @pp.Pretty for MergeStmt with pretty_renamed(self) {
   @pp.text("MERGE INTO ") +
-  self.target_table.pretty() +
+  self.target_table.pretty_renamed() +
   (match self.target_alias {
     Some(target_alias) => @pp.text(" AS ") + @pp.text(target_alias) (escaped)
     None => @pp.empty (escaped)
@@
   }) +
   @pp.hardline +
   @pp.text("USING ") +
-  self.source.pretty() +
+  self.source.pretty_renamed() +
   (match self.source_alias {
     Some(source_alias) => @pp.text(" AS ") + @pp.text(source_alias) (escaped)
     None => @pp.empty (escaped)
@@
   }) +
   @pp.hardline +
   @pp.text("ON ") +
-  self.join_condition.pretty() +
+  self.join_condition.pretty_renamed() +
   (if self.when_clauses.is_empty() {
     @pp.empty
   } else {
@@
     @pp.hardline +
     @pp.separate(
       @pp.hardline,
-      self.when_clauses.map(fn(clause) { @pp.text("  ") + clause.pretty() }),
+      self.when_clauses.map(fn(clause) { @pp.text("  ") + clause.pretty_renamed() }),
     )
   })
 }
 
 ///|
-pub impl @pp.Pretty for MergeSource with pretty(self) {
+pub impl @pp.Pretty for MergeSource with pretty_renamed(self) {
   match self {
-    MergeSource::Table(table) => table.pretty() (escaped)
+    MergeSource::Table(table) => table.pretty_renamed() (escaped)
     MergeSource::Query(query) => (escaped)
-      @pp.parens(@pp.nest(@pp.hardline + query.pretty()) + @pp.hardline)
+      @pp.parens(@pp.nest(@pp.hardline + query.pretty_renamed()) + @pp.hardline)
   }
 }
 
 ///|
-pub impl @pp.Pretty for MergeWhenClause with pretty(self) {
+pub impl @pp.Pretty for MergeWhenClause with pretty_renamed(self) {
   @pp.text("WHEN ") +
-  self.match_type.pretty() +
+  self.match_type.pretty_renamed() +
   (match self.condition {
-    Some(cond) => @pp.text(" AND ") + cond.pretty() (escaped)
+    Some(cond) => @pp.text(" AND ") + cond.pretty_renamed() (escaped)
     None => @pp.empty (escaped)
   }) +
   @pp.text(" THEN ") +
-  self.action.pretty()
+  self.action.pretty_renamed()
 }
 
 ///|
-pub impl @pp.Pretty for MergeMatchType with pretty(self) {
+pub impl @pp.Pretty for MergeMatchType with pretty_renamed(self) {
   match self {
     MergeMatchType::Matched => @pp.text("MATCHED") (escaped)
     MergeMatchType::NotMatched => @pp.text("NOT MATCHED") (escaped)
@@
 }
 
 ///|
-pub impl @pp.Pretty for MergeAction with pretty(self) {
+pub impl @pp.Pretty for MergeAction with pretty_renamed(self) {
   match self {
     MergeAction::Insert(columns, values) => (escaped)
       @pp.text("INSERT ") +
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for TruncateStmt with pretty(self) {
+pub impl @pp.Pretty for TruncateStmt with pretty_renamed(self) {
-  @pp.text("TRUNCATE ") + self.table_name.pretty()
+  @pp.text("TRUNCATE ") + self.table_name.pretty_renamed()
 }
 
 ///|
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for DropTableStmt with pretty(self) {
+pub impl @pp.Pretty for DropTableStmt with pretty_renamed(self) {
   @pp.text("DROP TABLE ") +
   (if self.if_exists { @pp.text("IF EXISTS ") } else { @pp.empty }) +
-  self.table_name.pretty()
+  self.table_name.pretty_renamed()
 }
 
 ///|
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for DropIndexStmt with pretty(self) {
+pub impl @pp.Pretty for DropIndexStmt with pretty_renamed(self) {
   @pp.text("DROP INDEX ") +
   (if self.concurrently { @pp.text("CONCURRENTLY ") } else { @pp.empty }) +
   (if self.if_exists { @pp.text("IF EXISTS ") } else { @pp.empty }) +
   @pp.text(self.name) +
   (match self.table_name {
-    Some(table) => @pp.text(" ON ") + table.pretty() (escaped)
+    Some(table) => @pp.text(" ON ") + table.pretty_renamed() (escaped)
     None => @pp.empty (escaped)
   })
 }
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for AlterTableStmt with pretty(self) {
+pub impl @pp.Pretty for AlterTableStmt with pretty_renamed(self) {
   @pp.text("ALTER TABLE ") +
   (if self.if_exists { @pp.text("IF EXISTS ") } else { @pp.empty }) +
-  self.table_name.pretty() +
+  self.table_name.pretty_renamed() +
   @pp.space +
-  self.operation.pretty()
+  self.operation.pretty_renamed()
 }
 
 ///|
-pub impl @pp.Pretty for AlterTableOperation with pretty(self) {
+pub impl @pp.Pretty for AlterTableOperation with pretty_renamed(self) {
   match self {
     AlterTableOperation::DropColumn(column_name, if_exists) => (escaped)
       @pp.text("DROP COLUMN ") +
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for AlterIndexStmt with pretty(self) {
+pub impl @pp.Pretty for AlterIndexStmt with pretty_renamed(self) {
   @pp.text("ALTER INDEX ") +
   (if self.if_exists { @pp.text("IF EXISTS ") } else { @pp.empty }) +
   @pp.text(self.name) +
   @pp.space +
-  self.operation.pretty()
+  self.operation.pretty_renamed()
 }
 
 ///|
-pub impl @pp.Pretty for AlterIndexOperation with pretty(self) {
+pub impl @pp.Pretty for AlterIndexOperation with pretty_renamed(self) {
   match self {
     AlterIndexOperation::RenameTo(new_name) => (escaped)
       @pp.text("RENAME TO ") + @pp.text(new_name)
@@
 }
 
 ///|
-pub impl @pp.Pretty for IndexParameter with pretty(self) {
+pub impl @pp.Pretty for IndexParameter with pretty_renamed(self) {
   @pp.text(self.name) + @pp.text(" = ") + @pp.text(self.value)
 }
 
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for ShowStmt with pretty(self) {
+pub impl @pp.Pretty for ShowStmt with pretty_renamed(self) {
   @pp.text("SHOW ") +
   (if self.extended { @pp.text("EXTENDED ") } else { @pp.empty }) +
   (if self.full { @pp.text("FULL ") } else { @pp.empty }) +
   (if self.global_scope { @pp.text("GLOBAL ") } else { @pp.empty }) +
-  self.show_type.pretty() +
+  self.show_type.pretty_renamed() +
   (match self.object {
     Some(obj) => (escaped)
       // For CREATE statements, object comes directly after type (no FROM)
@@
         | ShowType::CreateFunction (escaped)
         | ShowType::CreateProcedure (escaped)
         | ShowType::CreateEvent (escaped)
-        | ShowType::CreateTrigger => @pp.space + obj.pretty() (escaped)
+        | ShowType::CreateTrigger => @pp.space + obj.pretty_renamed() (escaped)
-        _ => @pp.space + @pp.text("FROM ") + obj.pretty() (escaped)
+        _ => @pp.space + @pp.text("FROM ") + obj.pretty_renamed() (escaped)
       }
     None => @pp.empty (escaped)
   }) +
   (match self.filter {
-    Some(filter) => @pp.space + filter.pretty() (escaped)
+    Some(filter) => @pp.space + filter.pretty_renamed() (escaped)
     None => @pp.empty (escaped)
   })
 }
 
 ///|
-pub impl @pp.Pretty for ShowType with pretty(self) {
+pub impl @pp.Pretty for ShowType with pretty_renamed(self) {
   match self {
     ShowType::Tables => @pp.text("TABLES") (escaped)
     ShowType::Columns => @pp.text("COLUMNS") (escaped)
@@
 }
 
 ///|
-pub impl @pp.Pretty for ShowFilter with pretty(self) {
+pub impl @pp.Pretty for ShowFilter with pretty_renamed(self) {
   match self {
     ShowFilter::Like(pattern) => (escaped)
       @pp.text("LIKE '") + @pp.text(pattern) + @pp.text("'")
-    ShowFilter::Where(expr) => @pp.text("WHERE ") + expr.pretty() (escaped)
+    ShowFilter::Where(expr) => @pp.text("WHERE ") + expr.pretty_renamed() (escaped)
   }
 }
 
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for SetStmt with pretty(self) {
+pub impl @pp.Pretty for SetStmt with pretty_renamed(self) {
   @pp.text("SET ") +
   (match self.scope {
     SetScope::Global => @pp.text("GLOBAL ") (escaped)
@@
     SetScope::UserVar => @pp.empty (escaped)
     SetScope::Local => @pp.empty (escaped)
   }) +
-  @pp.separate(@pp.text(", "), self.assignments.map(fn(a) { a.pretty() }))
+  @pp.separate(@pp.text(", "), self.assignments.map(fn(a) { a.pretty_renamed() }))
 }
 
 ///|
-pub impl @pp.Pretty for SetAssignment with pretty(self) {
+pub impl @pp.Pretty for SetAssignment with pretty_renamed(self) {
   (match self.variable {
     variable if variable.strip_prefix("@") != None => @pp.text(variable) (escaped)
     variable => @pp.text(variable) (escaped)
   }) +
   @pp.text(" = ") +
-  self.value.pretty()
+  self.value.pretty_renamed()
 }
 
 ///|
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for UseStmt with pretty(self) {
+pub impl @pp.Pretty for UseStmt with pretty_renamed(self) {
-  @pp.text("USE ") + self.database_name.pretty()
+  @pp.text("USE ") + self.database_name.pretty_renamed()
 }
 
 ///|
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for CopyStmt with pretty(self) {
+pub impl @pp.Pretty for CopyStmt with pretty_renamed(self) {
   @pp.text("COPY ") +
-  self.source.pretty() +
+  self.source.pretty_renamed() +
   @pp.space +
-  self.direction.pretty() +
+  self.direction.pretty_renamed() +
   @pp.space +
-  self.target.pretty() +
+  self.target.pretty_renamed() +
   (if self.format_options.is_empty() {
     @pp.empty
   } else {
@@
 }
 
 ///|
-pub impl @pp.Pretty for CopySource with pretty(self) {
+pub impl @pp.Pretty for CopySource with pretty_renamed(self) {
   match self {
     CopySource::Table(table_name, columns) => (escaped)
-      table_name.pretty() +
+      table_name.pretty_renamed() +
       (match columns {
         Some(col_list) if col_list.length() > 0 => (escaped)
           @pp.space +
@@
         _ => @pp.empty (escaped)
       })
     CopySource::Query(query) => (escaped)
-      @pp.parens(@pp.nest(@pp.hardline + query.pretty()) + @pp.hardline)
+      @pp.parens(@pp.nest(@pp.hardline + query.pretty_renamed()) + @pp.hardline)
   }
 }
 
 ///|
-pub impl @pp.Pretty for CopyDirection with pretty(self) {
+pub impl @pp.Pretty for CopyDirection with pretty_renamed(self) {
   match self {
     CopyDirection::To => @pp.text("TO") (escaped)
     CopyDirection::From => @pp.text("FROM") (escaped)
@@
 }
 
 ///|
-pub impl @pp.Pretty for CopyTarget with pretty(self) {
+pub impl @pp.Pretty for CopyTarget with pretty_renamed(self) {
   match self {
     CopyTarget::File(filename) => (escaped)
       @pp.text("'") + @pp.text(filename) + @pp.text("'")
@@
 }
 
 ///|
-pub impl @pp.Pretty for CopyOption with pretty(self) {
+pub impl @pp.Pretty for CopyOption with pretty_renamed(self) {
   match self {
-    CopyOption::Format(format) => @pp.text("FORMAT ") + format.pretty() (escaped)
+    CopyOption::Format(format) => @pp.text("FORMAT ") + format.pretty_renamed() (escaped)
     CopyOption::Delimiter(delim) => (escaped)
       @pp.text("DELIMITER '") + @pp.text(delim) + @pp.text("'")
     CopyOption::Null(null_str) => (escaped)
@@
     CopyOption::Escape(escape_char) => (escaped)
       @pp.text("ESCAPE '") + @pp.text(escape_char) + @pp.text("'")
     CopyOption::ForceQuote(force_quote) => (escaped)
-      @pp.text("FORCE_QUOTE ") + force_quote.pretty()
+      @pp.text("FORCE_QUOTE ") + force_quote.pretty_renamed()
     CopyOption::ForceNotNull(columns) => (escaped)
       @pp.text("FORCE_NOT_NULL (") +
       @pp.separate(@pp.text(", "), columns.map(@pp.text)) +
@@
 }
 
 ///|
-pub impl @pp.Pretty for CopyFormat with pretty(self) {
+pub impl @pp.Pretty for CopyFormat with pretty_renamed(self) {
   match self {
     CopyFormat::Csv => @pp.text("CSV") (escaped)
     CopyFormat::Text => @pp.text("TEXT") (escaped)
@@
 }
 
 ///|
-pub impl @pp.Pretty for CopyForceQuote with pretty(self) {
+pub impl @pp.Pretty for CopyForceQuote with pretty_renamed(self) {
   match self {
     CopyForceQuote::All => @pp.text("*") (escaped)
     CopyForceQuote::Columns(columns) => (escaped)
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for OnInsert with pretty(self) {
+pub impl @pp.Pretty for OnInsert with pretty_renamed(self) {
   match self {
     OnInsert::DuplicateKeyUpdate(assignments) => (escaped)
       @pp.text("ON DUPLICATE KEY UPDATE ") +
       @pp.separate(@pp.text(", "), assignments.map(@pp.pretty))
     OnInsert::OnConflict(conflict_clause) => (escaped)
-      @pp.text("ON CONFLICT ") + conflict_clause.pretty()
+      @pp.text("ON CONFLICT ") + conflict_clause.pretty_renamed()
   }
 }
 
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for OnConflictClause with pretty(self) {
+pub impl @pp.Pretty for OnConflictClause with pretty_renamed(self) {
   (match self.conflict_target {
-    Some(target) => target.pretty() + @pp.space (escaped)
+    Some(target) => target.pretty_renamed() + @pp.space (escaped)
     None => @pp.empty (escaped)
   }) +
-  self.conflict_action.pretty()
+  self.conflict_action.pretty_renamed()
 }
 
 ///|
-pub impl @pp.Pretty for ConflictTarget with pretty(self) {
+pub impl @pp.Pretty for ConflictTarget with pretty_renamed(self) {
   match self {
     ConflictTarget::Columns(columns) => (escaped)
       @pp.parens(@pp.separate(@pp.text(", "), columns.map(@pp.text)))
@@
     ConflictTarget::OnConstraint(constraint_name) => (escaped)
       @pp.text("ON CONSTRAINT ") + @pp.text(constraint_name)
     ConflictTarget::OnExpression(expr, where_condition) => (escaped)
-      @pp.parens(expr.pretty()) +
+      @pp.parens(expr.pretty_renamed()) +
       (match where_condition {
-        Some(condition) => @pp.text(" WHERE ") + condition.pretty() (escaped)
+        Some(condition) => @pp.text(" WHERE ") + condition.pretty_renamed() (escaped)
         None => @pp.empty (escaped)
       })
   }
@@
 }
 
 ///|
-pub impl @pp.Pretty for ConflictAction with pretty(self) {
+pub impl @pp.Pretty for ConflictAction with pretty_renamed(self) {
   match self {
     ConflictAction::DoNothing => @pp.text("DO NOTHING") (escaped)
     ConflictAction::DoUpdate(assignments, where_condition) => (escaped)
@@
       @pp.text("DO UPDATE SET ") +
       @pp.separate(@pp.text(", "), assignments.map(@pp.pretty)) +
       (match where_condition {
-        Some(condition) => @pp.text(" WHERE ") + condition.pretty() (escaped)
+        Some(condition) => @pp.text(" WHERE ") + condition.pretty_renamed() (escaped)
         None => @pp.empty (escaped)
       })
   }
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for SqliteOnConflict with pretty(self) {
+pub impl @pp.Pretty for SqliteOnConflict with pretty_renamed(self) {
   match self {
     SqliteOnConflict::Rollback => @pp.text("OR ROLLBACK") (escaped)
     SqliteOnConflict::Abort => @pp.text("OR ABORT") (escaped)
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for BeginStmt with pretty(self) {
+pub impl @pp.Pretty for BeginStmt with pretty_renamed(self) {
   @pp.text("BEGIN") +
   (if self.work { @pp.text(" WORK") } else { @pp.empty }) +
   (if self.transaction { @pp.text(" TRANSACTION") } else { @pp.empty })
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for CommitStmt with pretty(self) {
+pub impl @pp.Pretty for CommitStmt with pretty_renamed(self) {
   @pp.text("COMMIT") +
   (if self.work { @pp.text(" WORK") } else { @pp.empty }) +
   (if self.transaction { @pp.text(" TRANSACTION") } else { @pp.empty })
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for RollbackStmt with pretty(self) {
+pub impl @pp.Pretty for RollbackStmt with pretty_renamed(self) {
   @pp.text("ROLLBACK") +
   (if self.work { @pp.text(" WORK") } else { @pp.empty }) +
   (if self.transaction { @pp.text(" TRANSACTION") } else { @pp.empty }) +
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for SavepointStmt with pretty(self) {
+pub impl @pp.Pretty for SavepointStmt with pretty_renamed(self) {
   @pp.text("SAVEPOINT ") + @pp.text(self.name)
 }
 
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for ReleaseSavepointStmt with pretty(self) {
+pub impl @pp.Pretty for ReleaseSavepointStmt with pretty_renamed(self) {
   @pp.text("RELEASE ") +
   (if self.savepoint_keyword { @pp.text("SAVEPOINT ") } else { @pp.empty }) +
   @pp.text(self.name)
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for GrantStmt with pretty(self) {
+pub impl @pp.Pretty for GrantStmt with pretty_renamed(self) {
   @pp.text("GRANT ") +
   @pp.separate(@pp.text(", "), self.privileges.map(@pp.pretty)) +
   @pp.text(" ON ") +
@@
 }
 
 ///|
-pub impl @pp.Pretty for Privilege with pretty(self) {
+pub impl @pp.Pretty for Privilege with pretty_renamed(self) {
   match self {
     Privilege::Select(cols) => (escaped)
       @pp.text("SELECT") +
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for RevokeStmt with pretty(self) {
+pub impl @pp.Pretty for RevokeStmt with pretty_renamed(self) {
   @pp.text("REVOKE ") +
   (if self.grant_option_for {
     @pp.text("GRANT OPTION FOR ")
@@
 }
 
 ///|
-pub impl @pp.Pretty for RevokeOption with pretty(self) {
+pub impl @pp.Pretty for RevokeOption with pretty_renamed(self) {
   match self {
     RevokeOption::Restrict => @pp.text("RESTRICT") (escaped)
     RevokeOption::Cascade => @pp.text("CASCADE") (escaped)
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for LoadDataStmt with pretty(self) {
+pub impl @pp.Pretty for LoadDataStmt with pretty_renamed(self) {
   @pp.text("LOAD DATA ") +
   (if self.is_local { @pp.text("LOCAL ") } else { @pp.empty }) +
   @pp.text("INFILE '") +
@@
   @pp.nest(
     @pp.hardline +
     (match self.duplicate_handling {
-      Some(handling) => handling.pretty() + @pp.space (escaped)
+      Some(handling) => handling.pretty_renamed() + @pp.space (escaped)
       None => @pp.empty (escaped)
     }) +
     @pp.text("INTO TABLE ") +
-    self.table_name.pretty() +
+    self.table_name.pretty_renamed() +
     (match self.character_set {
       Some(charset) => (escaped)
         @pp.hardline + @pp.text("CHARACTER SET ") + @pp.text(charset)
@@
       None => @pp.empty (escaped)
     }) +
     (match self.fields_options {
-      Some(fields) => @pp.hardline + fields.pretty() (escaped)
+      Some(fields) => @pp.hardline + fields.pretty_renamed() (escaped)
       None => @pp.empty (escaped)
     }) +
     (match self.lines_options {
-      Some(lines) => @pp.hardline + lines.pretty() (escaped)
+      Some(lines) => @pp.hardline + lines.pretty_renamed() (escaped)
       None => @pp.empty (escaped)
     }) +
     (match self.ignore_lines {
@@
 }
 
 ///|
-pub impl @pp.Pretty for LoadDataDuplicateHandling with pretty(self) {
+pub impl @pp.Pretty for LoadDataDuplicateHandling with pretty_renamed(self) {
   match self {
     LoadDataDuplicateHandling::Replace => @pp.text("REPLACE") (escaped)
     LoadDataDuplicateHandling::Ignore => @pp.text("IGNORE") (escaped)
@@
 }
 
 ///|
-pub impl @pp.Pretty for LoadDataFieldsOptions with pretty(self) {
+pub impl @pp.Pretty for LoadDataFieldsOptions with pretty_renamed(self) {
   let parts = []
   match self.terminated_by {
     Some(term) => (escaped)
@@
 }
 
 ///|
-pub impl @pp.Pretty for LoadDataLinesOptions with pretty(self) {
+pub impl @pp.Pretty for LoadDataLinesOptions with pretty_renamed(self) {
   let parts = []
   match self.starting_by {
     Some(start) => (escaped)
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for PrepareStmt with pretty(self) {
+pub impl @pp.Pretty for PrepareStmt with pretty_renamed(self) {
   @pp.text("PREPARE ") +
   @pp.text(self.name) +
   (if self.data_types.length() > 0 {
@@
   }) +
   @pp.text(" AS ") +
   (match self.statement {
-    Statement::Query(stmt) => stmt.pretty() (escaped)
+    Statement::Query(stmt) => stmt.pretty_renamed() (escaped)
-    CreateTable(stmt) => stmt.pretty() (escaped)
+    CreateTable(stmt) => stmt.pretty_renamed() (escaped)
-    CreateView(stmt) => stmt.pretty() (escaped)
+    CreateView(stmt) => stmt.pretty_renamed() (escaped)
-    CreateIndex(stmt) => stmt.pretty() (escaped)
+    CreateIndex(stmt) => stmt.pretty_renamed() (escaped)
-    CreateDatabase(stmt) => stmt.pretty() (escaped)
+    CreateDatabase(stmt) => stmt.pretty_renamed() (escaped)
-    CreateSchema(stmt) => stmt.pretty() (escaped)
+    CreateSchema(stmt) => stmt.pretty_renamed() (escaped)
-    CreateFunction(stmt) => stmt.pretty() (escaped)
+    CreateFunction(stmt) => stmt.pretty_renamed() (escaped)
-    CreateProcedure(stmt) => stmt.pretty() (escaped)
+    CreateProcedure(stmt) => stmt.pretty_renamed() (escaped)
-    CreateSequence(stmt) => stmt.pretty() (escaped)
+    CreateSequence(stmt) => stmt.pretty_renamed() (escaped)
-    DropView(stmt) => stmt.pretty() (escaped)
+    DropView(stmt) => stmt.pretty_renamed() (escaped)
-    DropTable(stmt) => stmt.pretty() (escaped)
+    DropTable(stmt) => stmt.pretty_renamed() (escaped)
-    DropIndex(stmt) => stmt.pretty() (escaped)
+    DropIndex(stmt) => stmt.pretty_renamed() (escaped)
-    Insert(stmt) => stmt.pretty() (escaped)
+    Insert(stmt) => stmt.pretty_renamed() (escaped)
-    Delete(stmt) => stmt.pretty() (escaped)
+    Delete(stmt) => stmt.pretty_renamed() (escaped)
-    Update(stmt) => stmt.pretty() (escaped)
+    Update(stmt) => stmt.pretty_renamed() (escaped)
-    Merge(stmt) => stmt.pretty() (escaped)
+    Merge(stmt) => stmt.pretty_renamed() (escaped)
-    Truncate(stmt) => stmt.pretty() (escaped)
+    Truncate(stmt) => stmt.pretty_renamed() (escaped)
-    AlterTable(stmt) => stmt.pretty() (escaped)
+    AlterTable(stmt) => stmt.pretty_renamed() (escaped)
-    AlterIndex(stmt) => stmt.pretty() (escaped)
+    AlterIndex(stmt) => stmt.pretty_renamed() (escaped)
-    Show(stmt) => stmt.pretty() (escaped)
+    Show(stmt) => stmt.pretty_renamed() (escaped)
-    Set(stmt) => stmt.pretty() (escaped)
+    Set(stmt) => stmt.pretty_renamed() (escaped)
-    Use(stmt) => stmt.pretty() (escaped)
+    Use(stmt) => stmt.pretty_renamed() (escaped)
-    Copy(stmt) => stmt.pretty() (escaped)
+    Copy(stmt) => stmt.pretty_renamed() (escaped)
-    LoadData(stmt) => stmt.pretty() (escaped)
+    LoadData(stmt) => stmt.pretty_renamed() (escaped)
-    Prepare(stmt) => stmt.pretty() (escaped)
+    Prepare(stmt) => stmt.pretty_renamed() (escaped)
-    Execute(stmt) => stmt.pretty() (escaped)
+    Execute(stmt) => stmt.pretty_renamed() (escaped)
-    Deallocate(stmt) => stmt.pretty() (escaped)
+    Deallocate(stmt) => stmt.pretty_renamed() (escaped)
     LockTables(tables) => (escaped)
       @pp.text("LOCK TABLES ") +
       @pp.separate(@pp.text(", "), tables.map(@pp.pretty))
@@
         Some(msg) => @pp.text(", '") + @pp.text(msg) + @pp.text("'") (escaped)
         None => @pp.empty (escaped)
       })
-    Begin(stmt) => stmt.pretty() (escaped)
+    Begin(stmt) => stmt.pretty_renamed() (escaped)
-    Commit(stmt) => stmt.pretty() (escaped)
+    Commit(stmt) => stmt.pretty_renamed() (escaped)
-    Rollback(stmt) => stmt.pretty() (escaped)
+    Rollback(stmt) => stmt.pretty_renamed() (escaped)
-    Savepoint(stmt) => stmt.pretty() (escaped)
+    Savepoint(stmt) => stmt.pretty_renamed() (escaped)
-    ReleaseSavepoint(stmt) => stmt.pretty() (escaped)
+    ReleaseSavepoint(stmt) => stmt.pretty_renamed() (escaped)
-    Grant(stmt) => stmt.pretty() (escaped)
+    Grant(stmt) => stmt.pretty_renamed() (escaped)
-    Revoke(stmt) => stmt.pretty() (escaped)
+    Revoke(stmt) => stmt.pretty_renamed() (escaped)
   })
 }
 
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for ExecuteStmt with pretty(self) {
+pub impl @pp.Pretty for ExecuteStmt with pretty_renamed(self) {
   @pp.text("EXECUTE ") +
   (match self.name {
     Some(name) => (escaped)
-      name.pretty() +
+      name.pretty_renamed() +
       (if self.has_parentheses && self.parameters.length() > 0 {
         @pp.text("(") +
         @pp.separate(@pp.text(", "), self.parameters.map(@pp.pretty)) +
@@
 } derive(Eq, Debug)
 
 ///|
-pub impl @pp.Pretty for DeallocateStmt with pretty(self) {
+pub impl @pp.Pretty for DeallocateStmt with pretty_renamed(self) {
   @pp.text("DEALLOCATE ") +
   (if self.prepare { @pp.text("PREPARE ") } else { @pp.empty }) +
   @pp.text(self.name)
*** End Patch

```
