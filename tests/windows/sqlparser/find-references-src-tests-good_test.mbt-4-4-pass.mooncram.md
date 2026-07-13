# sqlparser find-references pass src\tests\good_test.mbt:4:4

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide find-references 'pass' --loc 'src\tests\good_test.mbt:4:4'
Found 39 references for symbol 'pass':
<WORKDIR>/src\tests\good_test.mbt:4:4-4:8:
  | // These tests are copied from https://github.com/hyrise/sql-parser/blob/main/test/queries/queries-good.sql
  | 
  | ///|
4 | fn pass(input : String) -> Unit {
  |    ^^^^
  |   (@sqlparser.parse_sql(input) catch {
  |     e => {

<WORKDIR>/src\tests\good_test.mbt:16:30-16:34:
   | 
   | ///|
   | test {
16 |   "SELECT * FROM orders;" |> pass
   |                              ^^^^
   | }
   | 

<WORKDIR>/src\tests\good_test.mbt:21:68-21:72:
   | 
   | ///|
   | test {
21 |   "SELECT a FROM foo WHERE a > 12 OR b > 3 AND NOT c LIMIT 10;" |> pass
   |                                                                    ^^^^
   | }
   | 

<WORKDIR>/src\tests\good_test.mbt:27:6-27:10:
   | ///|
   | test {
   |   "SELECT a FROM some_schema.foo WHERE a > 12 OR b > 3 AND NOT c LIMIT 10;"
27 |   |> pass
   |      ^^^^
   | }
   | 

<WORKDIR>/src\tests\good_test.mbt:35:6-35:10:
   |   (
   |     #|SELECT col1 AS myname, col2, 'test' FROM "table", foo AS t WHERE age > 12 AND zipcode = 12345 GROUP BY col1;
   |   )
35 |   |> pass
   |      ^^^^
   | }
   | 

<WORKDIR>/src\tests\good_test.mbt:43:6-43:10:
   |   (
   |     #|SELECT * from "table" JOIN table2 ON a = b WHERE (b OR NOT a) AND a = 12.5
   |   )
43 |   |> pass
   |      ^^^^
   | }
   | 

<WORKDIR>/src\tests\good_test.mbt:49:6-49:10:
   | ///|
   | test {
   |   "(SELECT a FROM foo WHERE a > 12 OR b > 3 AND c NOT LIKE 's%' LIMIT 10);"
49 |   |> pass
   |      ^^^^
   | }
   | 

<WORKDIR>/src\tests\good_test.mbt:57:6-57:10:
   |   (
   |     #|SELECT * FROM "table" LIMIT 10 OFFSET 10; SELECT * FROM another;
   |   )
57 |   |> pass
   |      ^^^^
   | }
   | 

<WORKDIR>/src\tests\good_test.mbt:62:63-62:67:
   | 
   | ///|
   | test {
62 |   "SELECT * FROM t1 UNION SELECT * FROM t2 ORDER BY col1;" |> pass
   |                                                               ^^^^
   | }
   | 

<WORKDIR>/src\tests\good_test.mbt:67:42-67:46:
   | 
   | ///|
   | test {
67 |   "SELECT * FROM (SELECT * FROM t1);" |> pass
   |                                          ^^^^
   | }
   | 

<WORKDIR>/src\tests\good_test.mbt:73:6-73:10:
   | ///|
   | test {
   |   "SELECT * FROM t1 UNION (SELECT * FROM t2 UNION SELECT * FROM t3) ORDER BY col1;"
73 |   |> pass
   |      ^^^^
   | }
   | 

<WORKDIR>/src\tests\good_test.mbt:78:53-78:57:
   | 
   | ///|
   | test {
78 |   "SELECT TOP 10 * FROM t1 ORDER BY col1, col2;" |> pass
   |                                                     ^^^^
   | }
   | 

<WORKDIR>/src\tests\good_test.mbt:83:68-83:72:
   | 
   | ///|
   | test {
83 |   "SELECT a, MAX(b), MAX(c, d), CUSTOM(q, UP(r)) AS f FROM t1;" |> pass
   |                                                                    ^^^^
   | }
   | 

<WORKDIR>/src\tests\good_test.mbt:88:49-88:53:
   | 
   | ///|
   | test {
88 |   "SELECT * FROM t WHERE a BETWEEN 1 and c;" |> pass
   |                                                 ^^^^
   | }
   | 

<WORKDIR>/src\tests\good_test.mbt:93:47-93:51:
   | 
   | ///|
   | test {
93 |   "SELECT * FROM t WHERE a = ? AND b = ?;" |> pass
   |                                               ^^^^
   | }
   | 

<WORKDIR>/src\tests\good_test.mbt:99:6-99:10:
   | ///|
   | test {
   |   "SELECT City.name, Product.category, SUM(price) FROM fact INNER JOIN City ON fact.city_id = City.id INNER JOIN Product ON fact.product_id = Product.id GROUP BY City.name, Product.category;"
99 |   |> pass
   |      ^^^^
   | }
   | 

<WORKDIR>/src\tests\good_test.mbt:104:39-104:43:
    | 
    | ///|
    | test {
104 |   "SELECT SUBSTR(a, 3, 5) FROM t;" |> pass
    |                                       ^^^^
    | }
    | 

<WORKDIR>/src\tests\good_test.mbt:109:53-109:57:
    | 
    | ///|
    | test {
109 |   "SELECT * FROM t WHERE a = DATE '1996-12-31';" |> pass
    |                                                     ^^^^
    | }
    | 

<WORKDIR>/src\tests\good_test.mbt:117:6-117:10:
    |   (
    |     #| SELECT t1.a, t1.b, t2.c FROM "table" AS t1 JOIN (SELECT * FROM foo JOIN bar ON foo.id = bar.id) t2 ON t1.a = t2.b WHERE (t1.b OR NOT t1.a) AND t2.c = 12.5
    |   )
117 |   |> pass
    |      ^^^^
    | }
    | 

<WORKDIR>/src\tests\good_test.mbt:122:45-122:49:
    | 
    | ///|
    | test {
122 |   "SELECT * FROM t1 JOIN t2 ON c1 = c2;" |> pass
    |                                             ^^^^
    | }
    | 

<WORKDIR>/src\tests\good_test.mbt:127:65-127:69:
    | 
    | ///|
    | test {
127 |   "SELECT a, SUM(b) FROM t2 GROUP BY a HAVING SUM(b) > 100;" |> pass
    |                                                                 ^^^^
    | }
    | 

<WORKDIR>/src\tests\good_test.mbt:132:54-132:58:
    | 
    | ///|
    | test {
132 |   "INSERT INTO test_table VALUES (1, 2, 'test');" |> pass
    |                                                      ^^^^
    | }
    | 

<WORKDIR>/src\tests\good_test.mbt:137:72-137:76:
    | 
    | ///|
    | test {
137 |   "INSERT INTO test_table (id, value, name) VALUES (1, 2, 'test');" |> pass
    |                                                                        ^^^^
    | }
    | 

<WORKDIR>/src\tests\good_test.mbt:142:55-142:59:
    | 
    | ///|
    | test {
142 |   "INSERT INTO test_table SELECT * FROM students;" |> pass
    |                                                       ^^^^
    | }
    | 

<WORKDIR>/src\tests\good_test.mbt:148:6-148:10:
    | ///|
    | test {
    |   "INSERT INTO some_schema.test_table SELECT * FROM another_schema.students;"
148 |   |> pass
    |      ^^^^
    | }
    | 

<WORKDIR>/src\tests\good_test.mbt:153:59-153:63:
    | 
    | ///|
    | test {
153 |   "CREATE TABLE IF NOT EXISTS \"table\" (id INTEGER);" |> pass
    |                                                           ^^^^
    | }
    | 

<WORKDIR>/src\tests\good_test.mbt:158:59-158:63:
    | 
    | ///|
    | test {
158 |   "CREATE TABLE students_2 AS SELECT * FROM students;" |> pass
    |                                                           ^^^^
    | }
    | 

<WORKDIR>/src\tests\good_test.mbt:164:6-164:10:
    | ///|
    | test {
    |   "CREATE TABLE students_3 AS SELECT city, grade FROM students WHERE grade > 3.0;"
164 |   |> pass
    |      ^^^^
    | }
    | 

<WORKDIR>/src\tests\good_test.mbt:169:47-169:51:
    | 
    | ///|
    | test {
169 |   "DELETE FROM students WHERE grade > 3.0" |> pass
    |                                               ^^^^
    | }
    | 

<WORKDIR>/src\tests\good_test.mbt:174:29-174:33:
    | 
    | ///|
    | test {
174 |   "DELETE FROM students" |> pass
    |                             ^^^^
    | }
    | 

<WORKDIR>/src\tests\good_test.mbt:179:71-179:75:
    | 
    | ///|
    | test {
179 |   "UPDATE students SET grade = 1.3 WHERE name = 'Max Mustermann';" |> pass
    |                                                                       ^^^^
    | }
    | 

<WORKDIR>/src\tests\good_test.mbt:185:6-185:10:
    | ///|
    | test {
    |   "UPDATE students SET grade = 1.3, name='Felix Fürstenberg' WHERE name = 'Max Mustermann';"
185 |   |> pass
    |      ^^^^
    | }
    | 

<WORKDIR>/src\tests\good_test.mbt:190:41-190:45:
    | 
    | ///|
    | test {
190 |   "UPDATE students SET grade = 1.0;" |> pass
    |                                         ^^^^
    | }
    | 

<WORKDIR>/src\tests\good_test.mbt:195:53-195:57:
    | 
    | ///|
    | test {
195 |   "UPDATE some_schema.students SET grade = 1.0;" |> pass
    |                                                     ^^^^
    | }
    | 

<WORKDIR>/src\tests\good_test.mbt:200:26-200:30:
    | 
    | ///|
    | test {
200 |   "TRUNCATE students" |> pass
    |                          ^^^^
    | }
    | 

<WORKDIR>/src\tests\good_test.mbt:205:29-205:33:
    | 
    | ///|
    | test {
205 |   "DROP TABLE students;" |> pass
    |                             ^^^^
    | }
    | 

<WORKDIR>/src\tests\good_test.mbt:210:39-210:43:
    | 
    | ///|
    | test {
210 |   "DROP TABLE IF EXISTS students;" |> pass
    |                                       ^^^^
    | }
    | 

<WORKDIR>/src\tests\good_test.mbt:215:60-215:64:
    | 
    | ///|
    | test {
215 |   "ALTER TABLE mytable DROP COLUMN IF EXISTS mycolumn;" |> pass
    |                                                            ^^^^
    | }
    | 

<WORKDIR>/src\tests\good_test.mbt:220:70-220:74:
    | 
    | ///|
    | test {
220 |   "ALTER TABLE IF EXISTS mytable DROP COLUMN IF EXISTS mycolumn;" |> pass
    |                                                                      ^^^^
    | }

```
