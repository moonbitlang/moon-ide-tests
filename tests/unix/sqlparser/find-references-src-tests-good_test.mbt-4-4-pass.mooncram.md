# sqlparser find-references pass src/tests/good_test.mbt:4:4

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
$ run_moon_ide moon ide find-references 'pass' --loc 'src/tests/good_test.mbt:4:4'
Found 39 references for symbol 'pass':
<WORKDIR>/src/tests/good_test.mbt:4:4-4:8:
  | // These tests are copied from https://github.com/hyrise/sql-parser/blob/main/test/queries/queries-good.sql (escaped)
  |  (escaped)
  | ///| (escaped)
4 | fn pass(input : String) -> Unit { (escaped)
  |    ^^^^ (escaped)
  |   (@sqlparser.parse_sql(input) catch { (escaped)
  |     e => { (escaped)

<WORKDIR>/src/tests/good_test.mbt:16:30-16:34:
   |  (escaped)
   | ///| (escaped)
   | test { (escaped)
16 |   "SELECT * FROM orders;" |> pass (escaped)
   |                              ^^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:21:68-21:72:
   |  (escaped)
   | ///| (escaped)
   | test { (escaped)
21 |   "SELECT a FROM foo WHERE a > 12 OR b > 3 AND NOT c LIMIT 10;" |> pass (escaped)
   |                                                                    ^^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:27:6-27:10:
   | ///| (escaped)
   | test { (escaped)
   |   "SELECT a FROM some_schema.foo WHERE a > 12 OR b > 3 AND NOT c LIMIT 10;" (escaped)
27 |   |> pass (escaped)
   |      ^^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:35:6-35:10:
   |   ( (escaped)
   |     #|SELECT col1 AS myname, col2, 'test' FROM "table", foo AS t WHERE age > 12 AND zipcode = 12345 GROUP BY col1; (escaped)
   |   ) (escaped)
35 |   |> pass (escaped)
   |      ^^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:43:6-43:10:
   |   ( (escaped)
   |     #|SELECT * from "table" JOIN table2 ON a = b WHERE (b OR NOT a) AND a = 12.5 (escaped)
   |   ) (escaped)
43 |   |> pass (escaped)
   |      ^^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:49:6-49:10:
   | ///| (escaped)
   | test { (escaped)
   |   "(SELECT a FROM foo WHERE a > 12 OR b > 3 AND c NOT LIKE 's%' LIMIT 10);" (escaped)
49 |   |> pass (escaped)
   |      ^^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:57:6-57:10:
   |   ( (escaped)
   |     #|SELECT * FROM "table" LIMIT 10 OFFSET 10; SELECT * FROM another; (escaped)
   |   ) (escaped)
57 |   |> pass (escaped)
   |      ^^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:62:63-62:67:
   |  (escaped)
   | ///| (escaped)
   | test { (escaped)
62 |   "SELECT * FROM t1 UNION SELECT * FROM t2 ORDER BY col1;" |> pass (escaped)
   |                                                               ^^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:67:42-67:46:
   |  (escaped)
   | ///| (escaped)
   | test { (escaped)
67 |   "SELECT * FROM (SELECT * FROM t1);" |> pass (escaped)
   |                                          ^^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:73:6-73:10:
   | ///| (escaped)
   | test { (escaped)
   |   "SELECT * FROM t1 UNION (SELECT * FROM t2 UNION SELECT * FROM t3) ORDER BY col1;" (escaped)
73 |   |> pass (escaped)
   |      ^^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:78:53-78:57:
   |  (escaped)
   | ///| (escaped)
   | test { (escaped)
78 |   "SELECT TOP 10 * FROM t1 ORDER BY col1, col2;" |> pass (escaped)
   |                                                     ^^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:83:68-83:72:
   |  (escaped)
   | ///| (escaped)
   | test { (escaped)
83 |   "SELECT a, MAX(b), MAX(c, d), CUSTOM(q, UP(r)) AS f FROM t1;" |> pass (escaped)
   |                                                                    ^^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:88:49-88:53:
   |  (escaped)
   | ///| (escaped)
   | test { (escaped)
88 |   "SELECT * FROM t WHERE a BETWEEN 1 and c;" |> pass (escaped)
   |                                                 ^^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:93:47-93:51:
   |  (escaped)
   | ///| (escaped)
   | test { (escaped)
93 |   "SELECT * FROM t WHERE a = ? AND b = ?;" |> pass (escaped)
   |                                               ^^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:99:6-99:10:
   | ///| (escaped)
   | test { (escaped)
   |   "SELECT City.name, Product.category, SUM(price) FROM fact INNER JOIN City ON fact.city_id = City.id INNER JOIN Product ON fact.product_id = Product.id GROUP BY City.name, Product.category;" (escaped)
99 |   |> pass (escaped)
   |      ^^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:104:39-104:43:
    |  (escaped)
    | ///| (escaped)
    | test { (escaped)
104 |   "SELECT SUBSTR(a, 3, 5) FROM t;" |> pass (escaped)
    |                                       ^^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:109:53-109:57:
    |  (escaped)
    | ///| (escaped)
    | test { (escaped)
109 |   "SELECT * FROM t WHERE a = DATE '1996-12-31';" |> pass (escaped)
    |                                                     ^^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:117:6-117:10:
    |   ( (escaped)
    |     #| SELECT t1.a, t1.b, t2.c FROM "table" AS t1 JOIN (SELECT * FROM foo JOIN bar ON foo.id = bar.id) t2 ON t1.a = t2.b WHERE (t1.b OR NOT t1.a) AND t2.c = 12.5 (escaped)
    |   ) (escaped)
117 |   |> pass (escaped)
    |      ^^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:122:45-122:49:
    |  (escaped)
    | ///| (escaped)
    | test { (escaped)
122 |   "SELECT * FROM t1 JOIN t2 ON c1 = c2;" |> pass (escaped)
    |                                             ^^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:127:65-127:69:
    |  (escaped)
    | ///| (escaped)
    | test { (escaped)
127 |   "SELECT a, SUM(b) FROM t2 GROUP BY a HAVING SUM(b) > 100;" |> pass (escaped)
    |                                                                 ^^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:132:54-132:58:
    |  (escaped)
    | ///| (escaped)
    | test { (escaped)
132 |   "INSERT INTO test_table VALUES (1, 2, 'test');" |> pass (escaped)
    |                                                      ^^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:137:72-137:76:
    |  (escaped)
    | ///| (escaped)
    | test { (escaped)
137 |   "INSERT INTO test_table (id, value, name) VALUES (1, 2, 'test');" |> pass (escaped)
    |                                                                        ^^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:142:55-142:59:
    |  (escaped)
    | ///| (escaped)
    | test { (escaped)
142 |   "INSERT INTO test_table SELECT * FROM students;" |> pass (escaped)
    |                                                       ^^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:148:6-148:10:
    | ///| (escaped)
    | test { (escaped)
    |   "INSERT INTO some_schema.test_table SELECT * FROM another_schema.students;" (escaped)
148 |   |> pass (escaped)
    |      ^^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:153:59-153:63:
    |  (escaped)
    | ///| (escaped)
    | test { (escaped)
153 |   "CREATE TABLE IF NOT EXISTS \\"table\\" (id INTEGER);" |> pass (escaped)
    |                                                           ^^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:158:59-158:63:
    |  (escaped)
    | ///| (escaped)
    | test { (escaped)
158 |   "CREATE TABLE students_2 AS SELECT * FROM students;" |> pass (escaped)
    |                                                           ^^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:164:6-164:10:
    | ///| (escaped)
    | test { (escaped)
    |   "CREATE TABLE students_3 AS SELECT city, grade FROM students WHERE grade > 3.0;" (escaped)
164 |   |> pass (escaped)
    |      ^^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:169:47-169:51:
    |  (escaped)
    | ///| (escaped)
    | test { (escaped)
169 |   "DELETE FROM students WHERE grade > 3.0" |> pass (escaped)
    |                                               ^^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:174:29-174:33:
    |  (escaped)
    | ///| (escaped)
    | test { (escaped)
174 |   "DELETE FROM students" |> pass (escaped)
    |                             ^^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:179:71-179:75:
    |  (escaped)
    | ///| (escaped)
    | test { (escaped)
179 |   "UPDATE students SET grade = 1.3 WHERE name = 'Max Mustermann';" |> pass (escaped)
    |                                                                       ^^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:185:6-185:10:
    | ///| (escaped)
    | test { (escaped)
    |   "UPDATE students SET grade = 1.3, name='Felix Fürstenberg' WHERE name = 'Max Mustermann';" (escaped)
185 |   |> pass (escaped)
    |      ^^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:190:41-190:45:
    |  (escaped)
    | ///| (escaped)
    | test { (escaped)
190 |   "UPDATE students SET grade = 1.0;" |> pass (escaped)
    |                                         ^^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:195:53-195:57:
    |  (escaped)
    | ///| (escaped)
    | test { (escaped)
195 |   "UPDATE some_schema.students SET grade = 1.0;" |> pass (escaped)
    |                                                     ^^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:200:26-200:30:
    |  (escaped)
    | ///| (escaped)
    | test { (escaped)
200 |   "TRUNCATE students" |> pass (escaped)
    |                          ^^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:205:29-205:33:
    |  (escaped)
    | ///| (escaped)
    | test { (escaped)
205 |   "DROP TABLE students;" |> pass (escaped)
    |                             ^^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:210:39-210:43:
    |  (escaped)
    | ///| (escaped)
    | test { (escaped)
210 |   "DROP TABLE IF EXISTS students;" |> pass (escaped)
    |                                       ^^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:215:60-215:64:
    |  (escaped)
    | ///| (escaped)
    | test { (escaped)
215 |   "ALTER TABLE mytable DROP COLUMN IF EXISTS mycolumn;" |> pass (escaped)
    |                                                            ^^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/src/tests/good_test.mbt:220:70-220:74:
    |  (escaped)
    | ///| (escaped)
    | test { (escaped)
220 |   "ALTER TABLE IF EXISTS mytable DROP COLUMN IF EXISTS mycolumn;" |> pass (escaped)
    |                                                                      ^^^^ (escaped)
    | } (escaped)

```
