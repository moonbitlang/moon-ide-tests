# sqlparser rename pass src/tests/good_test.mbt:4:4

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/sqlparser" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide rename 'pass' 'pass_renamed' --loc 'src/tests/good_test.mbt:4:4'
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
