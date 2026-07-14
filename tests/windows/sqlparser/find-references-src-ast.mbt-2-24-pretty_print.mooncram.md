# sqlparser find-references pretty_print src\ast.mbt:2:24

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide find-references 'pretty_print' --loc 'src\ast.mbt:2:24'
Found 298 references for symbol 'pretty_print':
<WORKDIR>/src\ast.mbt:2:24-2:36:
  | ///|
2 | pub fn[T : @pp.Pretty] pretty_print(obj : T) -> String {
  |                        ^^^^^^^^^^^^
  |   @pp.pretty(obj).to_string()
  | }

<WORKDIR>/src\bigquery.mbt:71:68-71:80:
   | 
   | test "BigQuery named parameter" {
   |   let tokens = "SELECT * FROM users WHERE id = @user_id;"
71 |   let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
   |                                                                    ^^^^^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src\bigquery.mbt:88:68-88:80:
   | ///|
   | test "BigQuery positional parameter" {
   |   let tokens = "SELECT * FROM users WHERE id = ?;"
88 |   let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
   |                                                                    ^^^^^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src\bigquery.mbt:105:68-105:80:
    | ///|
    | test "BigQuery mixed parameters" {
    |   let tokens = "SELECT * FROM users WHERE id = @user_id AND age > ?;"
105 |   let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\bigquery.mbt:123:68-123:80:
    | ///|
    | test "BigQuery multiple named parameters" {
    |   let tokens = "SELECT @field FROM @table WHERE @condition = @value;"
123 |   let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\bigquery.mbt:142:65-142:77:
    | 
    | test "Named parameters treated as identifiers in MySQL" {
    |   let tokens = "SELECT @user_id FROM users;"
142 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\dcl.mbt:247:38-247:50:
    | 
    | test "GRANT SELECT statement" {
    |   let tokens = "GRANT SELECT ON users TO alice;"
247 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\dcl.mbt:259:38-259:50:
    | ///|
    | test "GRANT multiple privileges statement" {
    |   let tokens = "GRANT SELECT, INSERT, UPDATE ON users TO alice, bob;"
259 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\dcl.mbt:271:38-271:50:
    | ///|
    | test "GRANT with column specification" {
    |   let tokens = "GRANT SELECT (name, email), UPDATE (email) ON users TO alice;"
271 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\dcl.mbt:283:38-283:50:
    | ///|
    | test "GRANT ALL PRIVILEGES statement" {
    |   let tokens = "GRANT ALL PRIVILEGES ON users TO alice WITH GRANT OPTION;"
283 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\dcl.mbt:295:38-295:50:
    | ///|
    | test "REVOKE SELECT statement" {
    |   let tokens = "REVOKE SELECT ON users FROM alice;"
295 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\dcl.mbt:307:38-307:50:
    | ///|
    | test "REVOKE with CASCADE" {
    |   let tokens = "REVOKE ALL PRIVILEGES ON users FROM alice CASCADE;"
307 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\dcl.mbt:319:38-319:50:
    | ///|
    | test "REVOKE GRANT OPTION FOR" {
    |   let tokens = "REVOKE GRANT OPTION FOR SELECT ON users FROM alice RESTRICT;"
319 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:166:38-166:50:
    | /// CREATE INDEX Tests
    | test "CREATE INDEX - Simple" {
    |   let tokens = "CREATE INDEX idx_name ON users (email);"
166 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:178:38-178:50:
    | ///|
    | test "CREATE UNIQUE INDEX" {
    |   let tokens = "CREATE UNIQUE INDEX idx_unique_email ON users (email);"
178 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:190:38-190:50:
    | ///|
    | test "CREATE INDEX with multiple columns" {
    |   let tokens = "CREATE INDEX idx_name_age ON users (name, age DESC);"
190 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:202:38-202:50:
    | ///|
    | test "CREATE INDEX with USING method" {
    |   let tokens = "CREATE INDEX idx_hash ON users USING HASH (id);"
202 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:214:38-214:50:
    | ///|
    | test "CREATE INDEX with WHERE clause" {
    |   let tokens = "CREATE INDEX idx_active_users ON users (created_at) WHERE active = true;"
214 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:226:38-226:50:
    | ///|
    | test "CREATE INDEX CONCURRENTLY" {
    |   let tokens = "CREATE INDEX CONCURRENTLY idx_concurrent ON users (email);"
226 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:238:38-238:50:
    | ///|
    | test "CREATE INDEX IF NOT EXISTS" {
    |   let tokens = "CREATE INDEX IF NOT EXISTS idx_exists ON users (email);"
238 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:250:38-250:50:
    | ///|
    | test "CREATE INDEX with NULLS ordering" {
    |   let tokens = "CREATE INDEX idx_ordered ON users (name ASC NULLS FIRST, age DESC NULLS LAST);"
250 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:262:38-262:50:
    | ///|
    | test "CREATE INDEX with expression" {
    |   let tokens = "CREATE INDEX idx_lower_email ON users (LOWER(email));"
262 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:274:38-274:50:
    | ///|
    | test "CREATE UNIQUE INDEX with all options" {
    |   let tokens = "CREATE UNIQUE INDEX CONCURRENTLY IF NOT EXISTS idx_complex ON users USING BTREE (email ASC NULLS FIRST, created_at DESC) WHERE active = true;"
274 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:286:38-286:50:
    | ///|
    | test "Create table" {
    |   let tokens = "CREATE TABLE users;"
286 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:300:38-300:50:
    | ///|
    | test "Create table IF NOT EXISTS" {
    |   let tokens = "CREATE TABLE IF NOT EXISTS users (id INTEGER);"
300 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:314:38-314:50:
    | ///|
    | test "Create table AS SELECT" {
    |   let tokens = "CREATE TABLE students_2 AS SELECT * FROM students;"
314 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:329:38-329:50:
    | ///|
    | test "Create table AS SELECT with WHERE" {
    |   let tokens = "CREATE TABLE students_3 AS SELECT city, grade FROM students WHERE grade > 3.0;"
329 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:435:38-435:50:
    | ///|
    | test "Create table with two columns" {
    |   let tokens = "CREATE TABLE users (id INTEGER, name INTEGER);"
435 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:461:38-461:50:
    |     #|  description TEXT,
    |     #|  profile_picture BLOB
    |     #|);
461 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:514:38-514:50:
    | ///|
    | test "With options" {
    |   let tokens = "CREATE TABLE users (id INTEGER NOT NULL UNIQUE, name INTEGER DEFAULT 18);"
514 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:585:38-585:50:
    | ///|
    | test "Create view with columns" {
    |   let tokens = "CREATE VIEW user_view (id, name) AS SELECT id, name FROM users;"
585 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:618:38-618:50:
    | ///|
    | test "Drop view statement" {
    |   let tokens = "DROP VIEW user_view;"
618 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:666:38-666:50:
    |     #|  PRIMARY KEY (id, name),
    |     #|  UNIQUE (name)
    |     #|);
666 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:731:38-731:50:
    |     #|  name VARCHAR(100) UNIQUE,
    |     #|  FOREIGN KEY (id) REFERENCES other_table (other_id)
    |     #|);
731 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:752:38-752:50:
    |     #|  name VARCHAR(100) UNIQUE,
    |     #|  FOREIGN KEY (name) REFERENCES other_table
    |     #|);
752 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:773:38-773:50:
    |     #|  name VARCHAR(100) UNIQUE,
    |     #|  CHECK (id > 0)
    |     #|);
773 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:806:38-806:50:
    | ///|
    | test "Drop table" {
    |   let tokens = "DROP TABLE students;"
806 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:818:38-818:50:
    | ///|
    | test "Drop table IF EXISTS" {
    |   let tokens = "DROP TABLE IF EXISTS students;"
818 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:876:38-876:50:
    | ///|
    | test "DROP INDEX - Simple" {
    |   let tokens = "DROP INDEX idx_name;"
876 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:888:38-888:50:
    | ///|
    | test "DROP INDEX IF EXISTS" {
    |   let tokens = "DROP INDEX IF EXISTS idx_name;"
888 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:900:38-900:50:
    | ///|
    | test "DROP INDEX CONCURRENTLY" {
    |   let tokens = "DROP INDEX CONCURRENTLY idx_name;"
900 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:912:38-912:50:
    | ///|
    | test "DROP INDEX CONCURRENTLY IF EXISTS" {
    |   let tokens = "DROP INDEX CONCURRENTLY IF EXISTS idx_name;"
912 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:924:38-924:50:
    | ///|
    | test "DROP INDEX with table name" {
    |   let tokens = "DROP INDEX idx_name ON users;"
924 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\ddl.mbt:1125:38-1125:50:
     | ///|
     | test "Alter table drop column" {
     |   let tokens = "ALTER TABLE mytable DROP COLUMN mycolumn;"
1125 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1137:38-1137:50:
     | ///|
     | test "Alter table drop column IF EXISTS" {
     |   let tokens = "ALTER TABLE mytable DROP COLUMN IF EXISTS mycolumn;"
1137 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1149:38-1149:50:
     | ///|
     | test "Alter table IF EXISTS drop column IF EXISTS" {
     |   let tokens = "ALTER TABLE IF EXISTS mytable DROP COLUMN IF EXISTS mycolumn;"
1149 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1163:38-1163:50:
     | ///|
     | test "ALTER INDEX - RENAME TO" {
     |   let tokens = "ALTER INDEX idx_old RENAME TO idx_new;"
1163 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1175:38-1175:50:
     | ///|
     | test "ALTER INDEX IF EXISTS RENAME TO" {
     |   let tokens = "ALTER INDEX IF EXISTS idx_old RENAME TO idx_new;"
1175 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1187:38-1187:50:
     | ///|
     | test "ALTER INDEX - SET TABLESPACE" {
     |   let tokens = "ALTER INDEX idx_name SET TABLESPACE fast_ssd;"
1187 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1199:38-1199:50:
     | ///|
     | test "ALTER INDEX - RESET parameters" {
     |   let tokens = "ALTER INDEX idx_name RESET (fillfactor, fastupdate);"
1199 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1211:38-1211:50:
     | ///|
     | test "ALTER INDEX - SET parameters" {
     |   let tokens = "ALTER INDEX idx_name SET (fillfactor = 70, fastupdate = off);"
1211 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1223:38-1223:50:
     | ///|
     | test "ALTER INDEX - Simple RENAME test" {
     |   let tokens = "ALTER INDEX idx_old RENAME TO idx_new;"
1223 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1235:38-1235:50:
     | ///|
     | test "ALTER INDEX - Complex RENAME with quoted names" {
     |   let tokens = "ALTER INDEX \"old-index-name\" RENAME TO \"new-index-name\";"
1235 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(stmt, content="ALTER INDEX old-index-name RENAME TO new-index-name;")
     | }

<WORKDIR>/src\ddl.mbt:1331:38-1331:50:
     | ///|
     | test "CREATE DATABASE - Simple" {
     |   let tokens = "CREATE DATABASE mydb;"
1331 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1343:38-1343:50:
     | ///|
     | test "CREATE DATABASE IF NOT EXISTS" {
     |   let tokens = "CREATE DATABASE IF NOT EXISTS mydb;"
1343 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1355:38-1355:50:
     | ///|
     | test "CREATE DATABASE with CHARACTER SET" {
     |   let tokens = "CREATE DATABASE mydb CHARACTER SET utf8;"
1355 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1367:38-1367:50:
     | ///|
     | test "CREATE DATABASE with CHARACTER SET and COLLATE" {
     |   let tokens = "CREATE DATABASE mydb CHARACTER SET utf8 COLLATE utf8_general_ci;"
1367 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1379:38-1379:50:
     | ///|
     | test "CREATE SCHEMA - Simple" {
     |   let tokens = "CREATE SCHEMA myschema;"
1379 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1391:38-1391:50:
     | ///|
     | test "CREATE SCHEMA IF NOT EXISTS" {
     |   let tokens = "CREATE SCHEMA IF NOT EXISTS myschema;"
1391 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1403:38-1403:50:
     | ///|
     | test "CREATE SCHEMA with AUTHORIZATION" {
     |   let tokens = "CREATE SCHEMA myschema AUTHORIZATION myuser;"
1403 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1612:38-1612:50:
     | ///|
     | test "CREATE FUNCTION - Simple" {
     |   let tokens = "CREATE FUNCTION my_func() RETURNS INTEGER AS 'SELECT 1';"
1612 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1624:38-1624:50:
     | ///|
     | test "CREATE FUNCTION IF NOT EXISTS" {
     |   let tokens = "CREATE FUNCTION IF NOT EXISTS my_func() RETURNS INTEGER AS 'SELECT 1';"
1624 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1636:38-1636:50:
     | ///|
     | test "CREATE FUNCTION with parameters" {
     |   let tokens = "CREATE FUNCTION add_nums(IN a INTEGER, IN b INTEGER) RETURNS INTEGER LANGUAGE sql AS 'SELECT a + b';"
1636 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1648:38-1648:50:
     | ///|
     | test "CREATE FUNCTION DETERMINISTIC" {
     |   let tokens = "CREATE FUNCTION my_func() RETURNS INTEGER DETERMINISTIC AS 'SELECT 1';"
1648 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1660:38-1660:50:
     | ///|
     | test "CREATE PROCEDURE - Simple" {
     |   let tokens = "CREATE PROCEDURE my_proc() AS 'BEGIN SELECT 1; END';"
1660 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1672:38-1672:50:
     | ///|
     | test "CREATE PROCEDURE with parameters" {
     |   let tokens = "CREATE PROCEDURE update_user(IN user_id INTEGER, IN new_name VARCHAR(100)) LANGUAGE plpgsql AS 'BEGIN UPDATE users SET name = new_name WHERE id = user_id; END';"
1672 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1684:38-1684:50:
     | ///|
     | test "CREATE FUNCTION with OUT parameter" {
     |   let tokens = "CREATE FUNCTION get_user_info(IN user_id INTEGER, OUT user_name VARCHAR(100), OUT user_age INTEGER) AS 'SELECT name, age FROM users WHERE id = user_id';"
1684 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1696:38-1696:50:
     | ///|
     | test "CREATE FUNCTION with INOUT parameter" {
     |   let tokens = "CREATE FUNCTION modify_value(INOUT value INTEGER) RETURNS INTEGER AS 'SELECT value * 2';"
1696 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1861:38-1861:50:
     | ///|
     | test "CREATE SEQUENCE - Simple" {
     |   let tokens = "CREATE SEQUENCE my_seq;"
1861 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1873:38-1873:50:
     | ///|
     | test "CREATE SEQUENCE IF NOT EXISTS" {
     |   let tokens = "CREATE SEQUENCE IF NOT EXISTS my_seq;"
1873 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1885:38-1885:50:
     | ///|
     | test "CREATE TEMPORARY SEQUENCE" {
     |   let tokens = "CREATE TEMPORARY SEQUENCE temp_seq;"
1885 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1897:38-1897:50:
     | ///|
     | test "CREATE SEQUENCE with INCREMENT BY" {
     |   let tokens = "CREATE SEQUENCE my_seq INCREMENT BY 5;"
1897 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1909:38-1909:50:
     | ///|
     | test "CREATE SEQUENCE with MINVALUE and MAXVALUE" {
     |   let tokens = "CREATE SEQUENCE my_seq MINVALUE 1 MAXVALUE 1000;"
1909 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1921:38-1921:50:
     | ///|
     | test "CREATE SEQUENCE with NO MINVALUE NO MAXVALUE" {
     |   let tokens = "CREATE SEQUENCE my_seq NO MINVALUE NO MAXVALUE;"
1921 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1933:38-1933:50:
     | ///|
     | test "CREATE SEQUENCE with START WITH and CACHE" {
     |   let tokens = "CREATE SEQUENCE my_seq START WITH 10 CACHE 20;"
1933 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1945:38-1945:50:
     | ///|
     | test "CREATE SEQUENCE with CYCLE" {
     |   let tokens = "CREATE SEQUENCE my_seq CYCLE;"
1945 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1957:38-1957:50:
     | ///|
     | test "CREATE SEQUENCE with NO CYCLE" {
     |   let tokens = "CREATE SEQUENCE my_seq NO CYCLE;"
1957 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1969:38-1969:50:
     | ///|
     | test "CREATE SEQUENCE with OWNED BY" {
     |   let tokens = "CREATE SEQUENCE user_id_seq OWNED BY users.id;"
1969 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1981:38-1981:50:
     | ///|
     | test "CREATE SEQUENCE with OWNED BY NONE" {
     |   let tokens = "CREATE SEQUENCE my_seq OWNED BY NONE;"
1981 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\ddl.mbt:1993:38-1993:50:
     | ///|
     | test "CREATE SEQUENCE with all options" {
     |   let tokens = "CREATE TEMPORARY SEQUENCE IF NOT EXISTS user_seq INCREMENT BY 2 MINVALUE 1 MAXVALUE 9999 START WITH 100 CACHE 10 CYCLE OWNED BY users.id;"
1993 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1144:38-1144:50:
     | ///|
     | test "Parse select with two columns" {
     |   let tokens = "SELECT col1, col2 FROM t;"
1144 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1160:38-1160:50:
     | ///|
     | test "Parse select with function call" {
     |   let tokens = "SELECT MAX(arg1, arg2), MIN() as m FROM t;"
1160 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1176:38-1176:50:
     | ///|
     | test "Nested expression" {
     |   let tokens = "SELECT sum(l_extendedprice * (1 - l_discount)) FROM lineitem;"
1176 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1191:38-1191:50:
     | ///|
     | test "Binary expression" {
     |   let tokens = "SELECT 1 + 2 * 3 FROM t;"
1191 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1206:38-1206:50:
     | ///|
     | test "Complecated binary expression" {
     |   let tokens = "SELECT sum(a * (1 - b) * (2 + b)) AS c FROM t;"
1206 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1221:38-1221:50:
     | ///|
     | test "Selection clause" {
     |   let tokens = "SELECT * FROM t WHERE id = 1;"
1221 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1247:38-1247:50:
     |     #|  AND name ILIKE 'TEST' 
     |     #|  AND name NOT LIKE 'test2' 
     |     #|  AND name NOT ILIKE 'TEST2';
1247 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1267:38-1267:50:
     | ///|
     | test "From multiple table refs" {
     |   let tokens = "SELECT * FROM t1, t2;"
1267 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1283:62-1283:74:
     | ///|
     | test "SubQuery" {
     |   let tokens = "SELECT sub FROM (SELECT name FROM users WHERE active = true) AS sub;"
1283 |   let stmt = parse_sql(tokens, dialect=Postgres::{  })[0] |> pretty_print
     |                                                              ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1305:38-1305:50:
     | ///|
     | test "Exists, not exists" {
     |   let tokens = "SELECT * FROM t WHERE EXISTS (SELECT 1 FROM t2) AND NOT EXISTS (SELECT 1 FROM t3);"
1305 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1333:38-1333:50:
     | ///|
     | test "Between and" {
     |   let tokens = "SELECT * FROM t WHERE id BETWEEN 1 AND 10;"
1333 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1350:38-1350:50:
     | ///|
     | test "Compound identifiers" {
     |   let tokens = "SELECT t1.col1, t2.col2 FROM t1, t2;"
1350 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1367:38-1367:50:
     | ///|
     | test "Extract function" {
     |   let tokens = "SELECT EXTRACT(YEAR FROM date_col) FROM t;"
1367 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1382:38-1382:50:
     | ///|
     | test "Aliasing omits AS" {
     |   let tokens = "SELECT col1 c1, col2 FROM t;"
1382 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1398:38-1398:50:
     | ///|
     | test "Case when" {
     |   let tokens = "SELECT CASE WHEN a > 0 THEN 'positive' WHEN a < 0 THEN 'negative' ELSE 'zero' END AS result FROM t;"
1398 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1417:38-1417:50:
     | ///|
     | test "Having" {
     |   let tokens = "SELECT col1, COUNT(*) FROM t GROUP BY col1 HAVING COUNT(*) > 1;"
1417 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1437:38-1437:50:
     | ///|
     | test "In list" {
     |   let tokens = "SELECT * FROM t WHERE col1 IN (1, 2, 3);"
1437 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1454:38-1454:50:
     | ///|
     | test "In subquery" {
     |   let tokens = "SELECT * FROM t WHERE col1 IN (SELECT col2 FROM t2);"
1454 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1476:38-1476:50:
     | ///|
     | test "Join with ON condition" {
     |   let tokens = "SELECT * FROM t1 JOIN t2 ON t1.id = t2.id;"
1476 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1492:38-1492:50:
     | ///|
     | test "Cross join" {
     |   let tokens = "SELECT * FROM t1 CROSS JOIN t2;"
1492 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1507:38-1507:50:
     | ///|
     | test "Left join" {
     |   let tokens = "SELECT * FROM t1 LEFT JOIN t2 ON t1.id = t2.id GROUP BY x;"
1507 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1525:38-1525:50:
     | ///|
     | test "Right join" {
     |   let tokens = "SELECT * FROM t1 RIGHT JOIN t2 ON t1.id = t2.id;"
1525 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1541:38-1541:50:
     | ///|
     | test "Full outer join" {
     |   let tokens = "SELECT * FROM t1 LEFT OUTER JOIN t2 ON t1.id = t2.id;"
1541 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1557:62-1557:74:
     | ///|
     | test "Null, true and false" {
     |   let tokens = "SELECT NULL, true, false FROM t1;"
1557 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens)[0] |> pretty_print
     |                                                              ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1574:38-1574:50:
     | ///|
     | test "Unary plus and minus" {
     |   let tokens = "SELECT +1, -2 FROM t;"
1574 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1590:38-1590:50:
     | ///|
     | test "Unary not expression" {
     |   let tokens = "SELECT NOT a FROM t;"
1590 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1605:38-1605:50:
     | ///|
     | test "Using clause in join" {
     |   let tokens = "SELECT * FROM t1 JOIN t2 USING (id);"
1605 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1621:36-1621:48:
     | ///|
     | test "Multiple statements" {
     |   let tokens = "SELECT * FROM t1; SELECT * FROM t2;"
1621 |   let stmts = parse_sql(tokens) |> pretty_print
     |                                    ^^^^^^^^^^^^
     |   inspect(
     |     stmts,

<WORKDIR>/src\dml.mbt:1641:38-1641:50:
     | ///|
     | test "String literal as column" {
     |   let tokens = "SELECT test FROM 't';"
1641 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1656:38-1656:50:
     | ///|
     | test "Limit and offset" {
     |   let tokens = "SELECT * FROM t LIMIT 10 OFFSET 5;"
1656 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1675:38-1675:50:
     | ///|
     | test "Limit without offset" {
     |   let tokens = "SELECT * FROM t LIMIT N;"
1675 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1692:38-1692:50:
     | ///|
     | test "Offset without limit" {
     |   let tokens = "SELECT * FROM t OFFSET N;"
1692 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1709:38-1709:50:
     | ///|
     | test "Duplicate treatment" {
     |   let tokens = "SELECT COUNT(DISTINCT *) FROM t;"
1709 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1724:38-1724:50:
     | ///|
     | test "Substring" {
     |   let tokens = "SELECT SUBSTRING(col FROM 1 FOR 5) FROM t;"
1724 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1739:38-1739:50:
     | ///|
     | test "Substring with start only" {
     |   let tokens = "SELECT SUBSTRING(col FROM 1) FROM t;"
1739 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1754:38-1754:50:
     | ///|
     | test "Substring another way" {
     |   let tokens = "SELECT SUBSTRING(col, 1, 5) FROM t;"
1754 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1797:38-1797:50:
     | ///|
     | test {
     |   let tokens = "SELECT * FROM t1 UNION (SELECT * FROM t2 UNION SELECT * FROM t3) ORDER BY col1;"
1797 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1826:38-1826:50:
     | ///|
     | test "Non projections" {
     |   let tokens = "SELECT FROM t1;"
1826 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:1862:38-1862:50:
     | ///|
     | test "Top 10" {
     |   let tokens = "SELECT TOP 10 * FROM t;"
1862 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2008:38-2008:50:
     | ///|
     | test "Insert with values - simple" {
     |   let tokens = "INSERT INTO test_table VALUES (1, 2, 'test');"
2008 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2020:38-2020:50:
     | ///|
     | test "Insert with columns and values" {
     |   let tokens = "INSERT INTO test_table (id, value, name) VALUES (1, 2, 'test');"
2020 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2032:38-2032:50:
     | ///|
     | test "Insert with SELECT" {
     |   let tokens = "INSERT INTO test_table SELECT * FROM students;"
2032 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2047:38-2047:50:
     | ///|
     | test "Insert with schema" {
     |   let tokens = "INSERT INTO some_schema.test_table SELECT * FROM another_schema.students;"
2047 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2063:38-2063:50:
     | /// PostgreSQL ON CONFLICT Tests
     | test "INSERT with ON CONFLICT DO NOTHING" {
     |   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT DO NOTHING;"
2063 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2075:38-2075:50:
     | ///|
     | test "INSERT with ON CONFLICT (column) DO NOTHING" {
     |   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT (email) DO NOTHING;"
2075 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2087:38-2087:50:
     | ///|
     | test "INSERT with ON CONFLICT (multiple columns) DO UPDATE" {
     |   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT (id, email) DO UPDATE SET name = EXCLUDED.name;"
2087 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2099:38-2099:50:
     | ///|
     | test "INSERT with ON CONFLICT ON CONSTRAINT" {
     |   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT ON CONSTRAINT users_email_key DO UPDATE SET name = EXCLUDED.name;"
2099 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2111:38-2111:50:
     | ///|
     | test "INSERT with ON CONFLICT DO UPDATE with WHERE" {
     |   let tokens = "INSERT INTO users (id, name, email, active) VALUES (1, 'John', 'john@example.com', true) ON CONFLICT (email) DO UPDATE SET name = EXCLUDED.name, active = EXCLUDED.active WHERE users.created_at < NOW();"
2111 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2123:38-2123:50:
     | ///|
     | test "INSERT with ON CONFLICT (expression) WHERE condition" {
     |   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT (LOWER(email)) WHERE active = true DO UPDATE SET name = EXCLUDED.name;"
2123 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2155:38-2155:50:
     | ///|
     | test "Delete with WHERE" {
     |   let tokens = "DELETE FROM students WHERE grade > 3.0;"
2155 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2168:38-2168:50:
     | ///|
     | test "Delete without WHERE" {
     |   let tokens = "DELETE FROM students;"
2168 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2219:38-2219:50:
     | ///|
     | test "Update with single assignment and WHERE" {
     |   let tokens = "UPDATE students SET grade = 1.3 WHERE name = 'Max Mustermann';"
2219 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2233:38-2233:50:
     | ///|
     | test "Update with multiple assignments and WHERE" {
     |   let tokens = "UPDATE students SET grade = 1.3, name='Felix Fürstenberg' WHERE name = 'Max Mustermann';"
2233 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2247:38-2247:50:
     | ///|
     | test "Update without WHERE" {
     |   let tokens = "UPDATE students SET grade = 1.0;"
2247 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2502:38-2502:50:
     | ///|
     | test "Truncate table" {
     |   let tokens = "TRUNCATE students;"
2502 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2516:38-2516:50:
     | 
     | test "Simple CTE with WITH clause" {
     |   let tokens = "WITH sales AS (SELECT * FROM orders) SELECT * FROM sales;"
2516 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2537:38-2537:50:
     | ///|
     | test "CTE with column specification" {
     |   let tokens = "WITH sales(id, total) AS (SELECT order_id, amount FROM orders) SELECT * FROM sales;"
2537 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2559:38-2559:50:
     | ///|
     | test "Multiple CTEs" {
     |   let tokens = "WITH sales AS (SELECT * FROM orders), customers AS (SELECT * FROM users) SELECT * FROM sales JOIN customers ON sales.user_id = customers.id;"
2559 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2587:38-2587:50:
     | ///|
     | test "CTE with ORDER BY and LIMIT" {
     |   let tokens = "WITH top_sales AS (SELECT * FROM orders ORDER BY amount DESC LIMIT 10) SELECT * FROM top_sales;"
2587 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2612:38-2612:50:
     | ///|
     | test "Nested CTE (CTE referencing another CTE)" {
     |   let tokens = "WITH sales AS (SELECT * FROM orders), big_sales AS (SELECT * FROM sales WHERE amount > 1000) SELECT * FROM big_sales;"
2612 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2641:38-2641:50:
     | ///|
     | test "CTE with aggregation" {
     |   let tokens = "WITH monthly_sales AS (SELECT date_month, SUM(amount) as total FROM orders GROUP BY date_month) SELECT * FROM monthly_sales;"
2641 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2666:38-2666:50:
     | /// Window Functions Tests
     | test "Simple window function with empty OVER clause" {
     |   let tokens = "SELECT rank() OVER () FROM test;"
2666 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2681:38-2681:50:
     | ///|
     | test "Window function with ORDER BY" {
     |   let tokens = "SELECT rank() OVER (ORDER BY salary DESC) FROM employees;"
2681 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2696:38-2696:50:
     | ///|
     | test "Window function with PARTITION BY" {
     |   let tokens = "SELECT count(*) OVER (PARTITION BY department) FROM employees;"
2696 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2711:38-2711:50:
     | ///|
     | test "Window function with PARTITION BY and ORDER BY" {
     |   let tokens = "SELECT row_number() OVER (PARTITION BY department ORDER BY salary DESC) FROM employees;"
2711 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2726:38-2726:50:
     | ///|
     | test "Window function with ROWS frame - UNBOUNDED PRECEDING" {
     |   let tokens = "SELECT sum(salary) OVER (ORDER BY hire_date ROWS UNBOUNDED PRECEDING) FROM employees;"
2726 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2741:38-2741:50:
     | ///|
     | test "Window function with ROWS frame - BETWEEN" {
     |   let tokens = "SELECT avg(salary) OVER (ORDER BY hire_date ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) FROM employees;"
2741 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2946:38-2946:50:
     | ///|
     | test "MERGE - Simple" {
     |   let tokens = "MERGE INTO target_table USING source_table ON target_table.id = source_table.id WHEN MATCHED THEN UPDATE SET name = source_table.name WHEN NOT MATCHED THEN INSERT VALUES (source_table.id, source_table.name);"
2946 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2962:38-2962:50:
     | ///|
     | test "MERGE with table aliases" {
     |   let tokens = "MERGE INTO customers c USING customer_updates cu ON c.id = cu.id WHEN MATCHED THEN UPDATE SET name = cu.name;"
2962 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2977:38-2977:50:
     | ///|
     | test "MERGE with subquery source" {
     |   let tokens = "MERGE INTO dest_table t USING (SELECT id, name FROM source) s ON t.id = s.id WHEN NOT MATCHED THEN INSERT (id, name) VALUES (s.id, s.name);"
2977 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:2998:38-2998:50:
     | ///|
     | test "MERGE with conditional WHEN" {
     |   let tokens = "MERGE INTO products p USING updates u ON p.id = u.id WHEN MATCHED AND u.price > p.price THEN UPDATE SET price = u.price WHEN NOT MATCHED THEN INSERT VALUES (u.id, u.name, u.price);"
2998 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\dml.mbt:3014:38-3014:50:
     | ///|
     | test "MERGE with DELETE action" {
     |   let tokens = "MERGE INTO inventory i USING changes c ON i.id = c.id WHEN MATCHED AND c.quantity = 0 THEN DELETE WHEN MATCHED THEN UPDATE SET quantity = c.quantity;"
3014 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src\mysql.mbt:100:65-100:77:
    | ///|
    | test "MySQL SHOW TABLES" {
    |   let tokens = "SHOW TABLES;"
100 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\mysql.mbt:112:65-112:77:
    | ///|
    | test "MySQL SHOW COLUMNS FROM table" {
    |   let tokens = "SHOW COLUMNS FROM users;"
112 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\mysql.mbt:124:65-124:77:
    | ///|
    | test "MySQL SHOW TABLES LIKE pattern" {
    |   let tokens = "SHOW TABLES LIKE 'user%';"
124 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\mysql.mbt:136:65-136:77:
    | ///|
    | test "MySQL with backticks in SHOW" {
    |   let tokens = "SHOW COLUMNS FROM `table name`;"
136 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\mysql.mbt:148:65-148:77:
    | ///|
    | test "MySQL LOCK TABLES" {
    |   let tokens = "LOCK TABLES users;"
148 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\mysql.mbt:160:65-160:77:
    | ///|
    | test "MySQL UNLOCK TABLES" {
    |   let tokens = "UNLOCK TABLES;"
160 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\mysql.mbt:172:65-172:77:
    | ///|
    | test "MySQL DIV operator" {
    |   let tokens = "SELECT 10 DIV 3 FROM test;"
172 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\mysql.mbt:187:65-187:77:
    | ///|
    | test "MySQL SHOW VARIABLES" {
    |   let tokens = "SHOW VARIABLES;"
187 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\mysql.mbt:199:65-199:77:
    | ///|
    | test "MySQL SHOW GLOBAL STATUS" {
    |   let tokens = "SHOW GLOBAL STATUS;"
199 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\mysql.mbt:211:65-211:77:
    | ///|
    | test "MySQL SHOW FULL PROCESSLIST" {
    |   let tokens = "SHOW FULL PROCESSLIST;"
211 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\mysql.mbt:223:65-223:77:
    | ///|
    | test "MySQL SHOW CREATE TABLE" {
    |   let tokens = "SHOW CREATE TABLE users;"
223 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\mysql.mbt:235:65-235:77:
    | ///|
    | test "MySQL SHOW EXTENDED COLUMNS" {
    |   let tokens = "SHOW EXTENDED COLUMNS FROM users LIKE 'name%';"
235 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\mysql.mbt:247:65-247:77:
    | ///|
    | test "MySQL SET session variable" {
    |   let tokens = "SET SESSION sql_mode = 'STRICT_TRANS_TABLES';"
247 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\mysql.mbt:259:65-259:77:
    | ///|
    | test "MySQL SET global variable" {
    |   let tokens = "SET GLOBAL max_connections = 200;"
259 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\mysql.mbt:271:65-271:77:
    | ///|
    | test "MySQL SET user variable" {
    |   let tokens = "SET @counter = 1;"
271 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\mysql.mbt:283:65-283:77:
    | ///|
    | test "MySQL SET multiple variables" {
    |   let tokens = "SET @name = 'John', @age = 30, @salary = 50000.50;"
283 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\mysql.mbt:295:65-295:77:
    | ///|
    | test "MySQL SET local variable" {
    |   let tokens = "SET autocommit = 0;"
295 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\mysql.mbt:307:65-307:77:
    | ///|
    | test "MySQL REPLACE INTO statement" {
    |   let tokens = "REPLACE INTO users (id, name) VALUES (1, 'John');"
307 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\mysql.mbt:319:65-319:77:
    | ///|
    | test "MySQL REPLACE INTO with multiple values" {
    |   let tokens = "REPLACE INTO products (id, name, price) VALUES (1, 'Widget', 10.50), (2, 'Gadget', 15.00);"
319 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\mysql.mbt:331:65-331:77:
    | ///|
    | test "MySQL INSERT OR REPLACE statement" {
    |   let tokens = "INSERT OR REPLACE INTO settings (key, value) VALUES ('theme', 'dark');"
331 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\mysql.mbt:343:65-343:77:
    | ///|
    | test "MySQL INSERT with ON DUPLICATE KEY UPDATE" {
    |   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON DUPLICATE KEY UPDATE name = 'John Updated', email = 'john.new@example.com';"
343 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\mysql.mbt:355:65-355:77:
    | ///|
    | test "MySQL INSERT single assignment ON DUPLICATE KEY UPDATE" {
    |   let tokens = "INSERT INTO counters (id, count) VALUES (1, 1) ON DUPLICATE KEY UPDATE count = count + 1;"
355 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\mysql.mbt:367:65-367:77:
    | ///|
    | test "MySQL REPLACE with ON DUPLICATE KEY UPDATE" {
    |   let tokens = "REPLACE INTO settings (setting_key, setting_value) VALUES ('theme', 'dark') ON DUPLICATE KEY UPDATE setting_value = 'light';"
367 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\mysql.mbt:379:65-379:77:
    | ///|
    | test "MySQL basic LOAD DATA statement" {
    |   let tokens = "LOAD DATA INFILE '/tmp/data.csv' INTO TABLE users;"
379 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\mysql.mbt:392:65-392:77:
    | ///|
    | test "MySQL LOAD DATA with LOCAL and REPLACE" {
    |   let tokens = "LOAD DATA LOCAL INFILE '/tmp/users.txt' REPLACE INTO TABLE employees;"
392 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\mysql.mbt:405:65-405:77:
    | ///|
    | test "MySQL LOAD DATA with FIELDS options" {
    |   let tokens = "LOAD DATA INFILE '/data/products.csv' INTO TABLE products CHARACTER SET utf8 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';"
405 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\mysql.mbt:420:65-420:77:
    | ///|
    | test "MySQL LOAD DATA with LINES options" {
    |   let tokens = "LOAD DATA INFILE '/tmp/logs.txt' INTO TABLE logs LINES STARTING BY '>>>' TERMINATED BY '\n' IGNORE 5 LINES;"
420 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\mysql.mbt:436:65-436:77:
    | ///|
    | test "MySQL LOAD DATA with column list and SET" {
    |   let tokens = "LOAD DATA INFILE '/data/sales.csv' IGNORE INTO TABLE sales FIELDS TERMINATED BY ',' (date, amount, customer) SET created_at = now();"
436 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\parameterized.mbt:20:62-20:74:
   | ///|
   | test "Question mark placeholder in WHERE clause" {
   |   let sql = "SELECT * FROM users WHERE id = ?;"
20 |   let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
   |                                                              ^^^^^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src\parameterized.mbt:37:62-37:74:
   | ///|
   | test "Multiple question mark placeholders" {
   |   let sql = "SELECT * FROM users WHERE age > ? AND name = ?;"
37 |   let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
   |                                                              ^^^^^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src\parameterized.mbt:55:62-55:74:
   | ///|
   | test "Question mark placeholder in INSERT" {
   |   let sql = "INSERT INTO users (name, age) VALUES (?, ?);"
55 |   let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
   |                                                              ^^^^^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src\parameterized.mbt:67:62-67:74:
   | ///|
   | test "Question mark placeholder in UPDATE" {
   |   let sql = "UPDATE users SET name = ?, age = ? WHERE id = ?;"
67 |   let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
   |                                                              ^^^^^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src\parameterized.mbt:81:62-81:74:
   | ///|
   | test "Question mark placeholder in LIMIT" {
   |   let sql = "SELECT * FROM users LIMIT ?;"
81 |   let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
   |                                                              ^^^^^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src\parameterized.mbt:98:62-98:74:
   | ///|
   | test "Question mark placeholder in LIMIT and OFFSET" {
   |   let sql = "SELECT * FROM users LIMIT ? OFFSET ?;"
98 |   let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
   |                                                              ^^^^^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src\parameterized.mbt:117:65-117:77:
    | ///|
    | test "PostgreSQL $1 numbered placeholder" {
    |   let sql = "SELECT * FROM users WHERE id = $1;"
117 |   let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\parameterized.mbt:134:65-134:77:
    | ///|
    | test "PostgreSQL multiple numbered placeholders" {
    |   let sql = "SELECT * FROM users WHERE age > $1 AND name = $2;"
134 |   let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\parameterized.mbt:152:65-152:77:
    | ///|
    | test "PostgreSQL numbered placeholders in INSERT" {
    |   let sql = "INSERT INTO users (name, age, email) VALUES ($1, $2, $3);"
152 |   let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\parameterized.mbt:162:65-162:77:
    | ///|
    | test "PostgreSQL numbered placeholders in LIMIT OFFSET" {
    |   let sql = "SELECT * FROM users LIMIT $1 OFFSET $2;"
162 |   let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\parameterized.mbt:181:65-181:77:
    | ///|
    | test "PostgreSQL numbered placeholders out of order" {
    |   let sql = "SELECT * FROM users WHERE id = $2 AND name = $1;"
181 |   let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\parameterized.mbt:199:65-199:77:
    | ///|
    | test "Colon named parameter" {
    |   let sql = "SELECT * FROM users WHERE name = :username;"
199 |   let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\parameterized.mbt:216:65-216:77:
    | ///|
    | test "Multiple colon named parameters" {
    |   let sql = "SELECT * FROM users WHERE age > :min_age AND city = :city_name;"
216 |   let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\parameterized.mbt:234:65-234:77:
    | ///|
    | test "Colon named parameters in INSERT" {
    |   let sql = "INSERT INTO users (name, age) VALUES (:name, :age);"
234 |   let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(stmt, content="INSERT INTO users (name, age) VALUES (:name, :age);")
    | }

<WORKDIR>/src\parameterized.mbt:241:62-241:74:
    | ///|
    | test "At-sign named parameter" {
    |   let sql = "SELECT * FROM users WHERE name = @username;"
241 |   let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
    |                                                              ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\parameterized.mbt:258:62-258:74:
    | ///|
    | test "Multiple at-sign named parameters" {
    |   let sql = "SELECT * FROM users WHERE age > @min_age AND city = @city_name;"
258 |   let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
    |                                                              ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\parameterized.mbt:276:62-276:74:
    | ///|
    | test "Placeholder in function call" {
    |   let sql = "SELECT UPPER(?) FROM users;"
276 |   let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
    |                                                              ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\parameterized.mbt:291:62-291:74:
    | ///|
    | test "Placeholder in expression" {
    |   let sql = "SELECT * FROM users WHERE age + ? > 100;"
291 |   let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
    |                                                              ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\parameterized.mbt:308:62-308:74:
    | ///|
    | test "Placeholder in BETWEEN clause" {
    |   let sql = "SELECT * FROM users WHERE age BETWEEN ? AND ?;"
308 |   let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
    |                                                              ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\parameterized.mbt:325:62-325:74:
    | ///|
    | test "Placeholder in IN list" {
    |   let sql = "SELECT * FROM users WHERE id IN (?, ?, ?);"
325 |   let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
    |                                                              ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\parameterized.mbt:342:65-342:77:
    | ///|
    | test "PostgreSQL numbered placeholder in CASE expression" {
    |   let sql = "SELECT CASE WHEN age > $1 THEN 'old' ELSE 'young' END FROM users;"
342 |   let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\parameterized.mbt:360:65-360:77:
    | ///|
    | test "Named parameter in JOIN condition" {
    |   let sql = "SELECT * FROM users u JOIN orders o ON u.id = o.user_id WHERE o.total > :min_total;"
360 |   let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
    |                                                                 ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\parameterized.mbt:382:64-382:76:
    |   let sql1 = "SELECT * FROM users WHERE id = ?;"
    |   let sql2 = "SELECT * FROM users WHERE id = $1;"
    |   let sql3 = "SELECT * FROM users WHERE id = :user_id;"
382 |   let stmt1 = parse_sql(dialect=MySQL::{  }, sql1).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   let stmt2 = parse_sql(dialect=Postgres::{  }, sql2).stmts[0] |> pretty_print
    |   let stmt3 = parse_sql(dialect=Postgres::{  }, sql3).stmts[0] |> pretty_print

<WORKDIR>/src\parameterized.mbt:383:67-383:79:
    |   let sql2 = "SELECT * FROM users WHERE id = $1;"
    |   let sql3 = "SELECT * FROM users WHERE id = :user_id;"
    |   let stmt1 = parse_sql(dialect=MySQL::{  }, sql1).stmts[0] |> pretty_print
383 |   let stmt2 = parse_sql(dialect=Postgres::{  }, sql2).stmts[0] |> pretty_print
    |                                                                   ^^^^^^^^^^^^
    |   let stmt3 = parse_sql(dialect=Postgres::{  }, sql3).stmts[0] |> pretty_print
    |   inspect(

<WORKDIR>/src\parameterized.mbt:384:67-384:79:
    |   let sql3 = "SELECT * FROM users WHERE id = :user_id;"
    |   let stmt1 = parse_sql(dialect=MySQL::{  }, sql1).stmts[0] |> pretty_print
    |   let stmt2 = parse_sql(dialect=Postgres::{  }, sql2).stmts[0] |> pretty_print
384 |   let stmt3 = parse_sql(dialect=Postgres::{  }, sql3).stmts[0] |> pretty_print
    |                                                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt1,

<WORKDIR>/src\parameterized.mbt:423:62-423:74:
    | ///|
    | test "Placeholder in DELETE statement" {
    |   let sql = "DELETE FROM users WHERE id = ?;"
423 |   let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
    |                                                              ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\parser.mbt:789:34-789:46:
    |     Token::Identifier("t"),
    |     Token::Semicolon,
    |   ]
789 |   let stmt = parse(tokens)[0] |> pretty_print
    |                                  ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\parser.mbt:804:34-804:46:
    | ///|
    | test "Parse USE database statement" {
    |   let tokens = [Keyword(Use), Token::Identifier("mydb"), Token::Semicolon]
804 |   let stmt = parse(tokens)[0] |> pretty_print
    |                                  ^^^^^^^^^^^^
    |   inspect(stmt, content="USE mydb;")
    | }

<WORKDIR>/src\parser.mbt:817:34-817:46:
    |     Token::Identifier("production"),
    |     Token::Semicolon,
    |   ]
817 |   let stmt = parse(tokens)[0] |> pretty_print
    |                                  ^^^^^^^^^^^^
    |   inspect(stmt, content="USE company.production;")
    | }

<WORKDIR>/src\parser.mbt:828:34-828:46:
    |     Token::Identifier("my database"),
    |     Token::Semicolon,
    |   ]
828 |   let stmt = parse(tokens)[0] |> pretty_print
    |                                  ^^^^^^^^^^^^
    |   inspect(stmt, content="USE `my database`;")
    | }

<WORKDIR>/src\parser.mbt:841:34-841:46:
    |     Token::StringLiteral("/tmp/users.csv"),
    |     Token::Semicolon,
    |   ]
841 |   let stmt = parse(tokens)[0] |> pretty_print
    |                                  ^^^^^^^^^^^^
    |   inspect(stmt, content="COPY users TO '/tmp/users.csv';")
    | }

<WORKDIR>/src\parser.mbt:860:34-860:46:
    |     Token::RParen,
    |     Token::Semicolon,
    |   ]
860 |   let stmt = parse(tokens)[0] |> pretty_print
    |                                  ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\parser.mbt:881:34-881:46:
    |     Keyword(Stdout),
    |     Token::Semicolon,
    |   ]
881 |   let stmt = parse(tokens)[0] |> pretty_print
    |                                  ^^^^^^^^^^^^
    |   inspect(stmt, content="COPY orders (id, amount) TO STDOUT;")
    | }

<WORKDIR>/src\parser.mbt:909:34-909:46:
    |     Token::RParen,
    |     Token::Semicolon,
    |   ]
909 |   let stmt = parse(tokens)[0] |> pretty_print
    |                                  ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\parser.mbt:938:34-938:46:
    |     Token::RParen,
    |     Token::Semicolon,
    |   ]
938 |   let stmt = parse(tokens)[0] |> pretty_print
    |                                  ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\postgres.mbt:94:68-94:80:
   | ///|
   | test "PostgreSQL LISTEN" {
   |   let tokens = "LISTEN my_channel;"
94 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
   |                                                                    ^^^^^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src\postgres.mbt:106:68-106:80:
    | ///|
    | test "PostgreSQL NOTIFY without payload" {
    |   let tokens = "NOTIFY my_channel;"
106 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\postgres.mbt:118:68-118:80:
    | ///|
    | test "PostgreSQL NOTIFY with payload" {
    |   let tokens = "NOTIFY my_channel, 'hello world';"
118 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\postgres.mbt:132:68-132:80:
    | 
    | test "PostgreSQL ARRAY syntax with integers" {
    |   let tokens = "SELECT ARRAY[1, 2, 3, 4] FROM test;"
132 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\postgres.mbt:147:68-147:80:
    | ///|
    | test "PostgreSQL bracket array syntax" {
    |   let tokens = "SELECT [1, 2, 3] FROM test;"
147 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\postgres.mbt:162:68-162:80:
    | ///|
    | test "PostgreSQL empty ARRAY" {
    |   let tokens = "SELECT ARRAY[] FROM test;"
162 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\postgres.mbt:177:68-177:80:
    | ///|
    | test "PostgreSQL ARRAY with strings" {
    |   let tokens = "SELECT ARRAY['hello', 'world'] FROM test;"
177 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\postgres.mbt:192:68-192:80:
    | ///|
    | test "PostgreSQL nested arrays" {
    |   let tokens = "SELECT ARRAY[ARRAY[1, 2], ARRAY[3, 4]] FROM test;"
192 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\postgres.mbt:207:68-207:80:
    | ///|
    | test "PostgreSQL mixed bracket and ARRAY syntax" {
    |   let tokens = "SELECT ARRAY[[1, 2], [3, 4]] FROM test;"
207 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\postgres.mbt:303:68-303:80:
    | 
    | test "PostgreSQL JSON extract operator" {
    |   let tokens = "SELECT data -> 'key' FROM json_table;"
303 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\postgres.mbt:318:68-318:80:
    | ///|
    | test "PostgreSQL JSON extract text operator" {
    |   let tokens = "SELECT data ->> 'key' FROM json_table;"
318 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\postgres.mbt:333:68-333:80:
    | ///|
    | test "PostgreSQL JSON path extract operator" {
    |   let tokens = "SELECT data #> ARRAY['key', 'subkey'] FROM json_table;"
333 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\postgres.mbt:348:68-348:80:
    | ///|
    | test "PostgreSQL JSON contains operator" {
    |   let tokens = "SELECT data @> '{\"key\":\"value\"}' FROM json_table;"
348 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\postgres.mbt:363:68-363:80:
    | ///|
    | test "PostgreSQL JSON contained in operator" {
    |   let tokens = "SELECT '{\"a\":1}' <@ data FROM json_table;"
363 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\postgres.mbt:380:68-380:80:
    | 
    | test "PostgreSQL COUNT with FILTER" {
    |   let tokens = "SELECT count(*) FILTER (WHERE active) FROM users;"
380 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\postgres.mbt:395:68-395:80:
    | ///|
    | test "PostgreSQL COUNT without FILTER" {
    |   let tokens = "SELECT count(*) FROM users;"
395 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\postgres.mbt:410:68-410:80:
    | ///|
    | test "PostgreSQL SUM with FILTER" {
    |   let tokens = "SELECT sum(amount) FILTER (WHERE status = 'completed') FROM orders;"
410 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\postgres.mbt:425:68-425:80:
    | ///|
    | test "PostgreSQL multiple aggregations with FILTER" {
    |   let tokens = "SELECT count(*) FILTER (WHERE active), avg(age) FILTER (WHERE age > 18) FROM users;"
425 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\prepare.mbt:7:35-7:47:
  | ///|
  | test "PREPARE simple SELECT" {
  |   let sql = "PREPARE stmt AS SELECT * FROM users WHERE id = ?"
7 |   let stmt = parse_sql(sql)[0] |> pretty_print
  |                                   ^^^^^^^^^^^^
  |   inspect(
  |     stmt,

<WORKDIR>/src\prepare.mbt:24:35-24:47:
   | ///|
   | test "PREPARE with data types" {
   |   let sql = "PREPARE stmt (INTEGER, VARCHAR(50)) AS SELECT * FROM users WHERE id = ? AND name = ?"
24 |   let stmt = parse_sql(sql)[0] |> pretty_print
   |                                   ^^^^^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src\prepare.mbt:42:35-42:47:
   | ///|
   | test "PREPARE INSERT statement" {
   |   let sql = "PREPARE insert_user AS INSERT INTO users (name, email) VALUES (?, ?)"
42 |   let stmt = parse_sql(sql)[0] |> pretty_print
   |                                   ^^^^^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src\prepare.mbt:52:35-52:47:
   | ///|
   | test "PREPARE UPDATE statement" {
   |   let sql = "PREPARE update_user AS UPDATE users SET name = ? WHERE id = ?"
52 |   let stmt = parse_sql(sql)[0] |> pretty_print
   |                                   ^^^^^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src\prepare.mbt:66:35-66:47:
   | ///|
   | test "PREPARE DELETE statement" {
   |   let sql = "PREPARE delete_user AS DELETE FROM users WHERE id = ?"
66 |   let stmt = parse_sql(sql)[0] |> pretty_print
   |                                   ^^^^^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src\prepare.mbt:79:35-79:47:
   | ///|
   | test "PREPARE with PostgreSQL numbered placeholders" {
   |   let sql = "PREPARE stmt (INTEGER, TEXT) AS SELECT * FROM users WHERE id = $1 AND name = $2"
79 |   let stmt = parse_sql(sql)[0] |> pretty_print
   |                                   ^^^^^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src\prepare.mbt:97:35-97:47:
   | ///|
   | test "PREPARE with named parameters" {
   |   let sql = "PREPARE stmt AS SELECT * FROM users WHERE id = :id AND name = :name"
97 |   let stmt = parse_sql(sql)[0] |> pretty_print
   |                                   ^^^^^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src\prepare.mbt:115:35-115:47:
    | ///|
    | test "PREPARE with complex query" {
    |   let sql = "PREPARE complex_query AS SELECT u.id, u.name, COUNT(o.id) as order_count FROM users u LEFT JOIN orders o ON u.id = o.user_id WHERE u.is_active = ? GROUP BY u.id, u.name HAVING COUNT(o.id) > ?"
115 |   let stmt = parse_sql(sql)[0] |> pretty_print
    |                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\prepare.mbt:140:35-140:47:
    | ///|
    | test "PREPARE with subquery" {
    |   let sql = "PREPARE subquery_stmt AS SELECT * FROM users WHERE id IN (SELECT user_id FROM orders WHERE amount > ?)"
140 |   let stmt = parse_sql(sql)[0] |> pretty_print
    |                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\prepare.mbt:164:35-164:47:
    | ///|
    | test "PREPARE with window function" {
    |   let sql = "PREPARE window_stmt AS SELECT name, salary, RANK() OVER (ORDER BY salary DESC) as rank FROM employees WHERE department = ?"
164 |   let stmt = parse_sql(sql)[0] |> pretty_print
    |                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\prepare.mbt:183:35-183:47:
    | ///|
    | test "PREPARE with CTE" {
    |   let sql = "PREPARE cte_stmt AS WITH recent_orders AS (SELECT * FROM orders WHERE created_at > ?) SELECT * FROM recent_orders WHERE status = ?"
183 |   let stmt = parse_sql(sql)[0] |> pretty_print
    |                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\prepare.mbt:208:35-208:47:
    | ///|
    | test "EXECUTE simple" {
    |   let sql = "EXECUTE stmt"
208 |   let stmt = parse_sql(sql)[0] |> pretty_print
    |                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\prepare.mbt:220:35-220:47:
    | ///|
    | test "EXECUTE with parenthesized parameters" {
    |   let sql = "EXECUTE stmt(1, 'John')"
220 |   let stmt = parse_sql(sql)[0] |> pretty_print
    |                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\prepare.mbt:232:35-232:47:
    | ///|
    | test "EXECUTE with USING clause" {
    |   let sql = "EXECUTE stmt USING 1, 'John'"
232 |   let stmt = parse_sql(sql)[0] |> pretty_print
    |                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\prepare.mbt:244:35-244:47:
    | ///|
    | test "EXECUTE with complex expressions" {
    |   let sql = "EXECUTE stmt USING 1 + 2, CONCAT('Hello', ' World')"
244 |   let stmt = parse_sql(sql)[0] |> pretty_print
    |                                   ^^^^^^^^^^^^
    |   inspect(stmt, content="EXECUTE stmt USING 1 + 2, concat('Hello', ' World');")
    | }

<WORKDIR>/src\prepare.mbt:251:35-251:47:
    | ///|
    | test "EXECUTE IMMEDIATE" {
    |   let sql = "EXECUTE IMMEDIATE"
251 |   let stmt = parse_sql(sql)[0] |> pretty_print
    |                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\prepare.mbt:263:35-263:47:
    | ///|
    | test "EXECUTE IMMEDIATE with INTO" {
    |   let sql = "EXECUTE IMMEDIATE INTO v_result"
263 |   let stmt = parse_sql(sql)[0] |> pretty_print
    |                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\prepare.mbt:275:35-275:47:
    | ///|
    | test "EXECUTE IMMEDIATE with INTO and USING" {
    |   let sql = "EXECUTE IMMEDIATE INTO v_result USING 1, 'test'"
275 |   let stmt = parse_sql(sql)[0] |> pretty_print
    |                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\prepare.mbt:287:35-287:47:
    | ///|
    | test "EXECUTE with multiple INTO variables" {
    |   let sql = "EXECUTE IMMEDIATE INTO v_name, v_email, v_age"
287 |   let stmt = parse_sql(sql)[0] |> pretty_print
    |                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\prepare.mbt:299:35-299:47:
    | ///|
    | test "DEALLOCATE simple" {
    |   let sql = "DEALLOCATE stmt"
299 |   let stmt = parse_sql(sql)[0] |> pretty_print
    |                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\prepare.mbt:311:35-311:47:
    | ///|
    | test "DEALLOCATE with PREPARE keyword" {
    |   let sql = "DEALLOCATE PREPARE stmt"
311 |   let stmt = parse_sql(sql)[0] |> pretty_print
    |                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\prepare.mbt:324:37-324:49:
    | test "PREPARE and EXECUTE separately" {
    |   let sql1 = "PREPARE user_query AS SELECT * FROM users WHERE id = ?"
    |   let sql2 = "EXECUTE user_query(123)"
324 |   let stmt1 = parse_sql(sql1)[0] |> pretty_print
    |                                     ^^^^^^^^^^^^
    |   let stmt2 = parse_sql(sql2)[0] |> pretty_print
    |   inspect(

<WORKDIR>/src\prepare.mbt:325:37-325:49:
    |   let sql1 = "PREPARE user_query AS SELECT * FROM users WHERE id = ?"
    |   let sql2 = "EXECUTE user_query(123)"
    |   let stmt1 = parse_sql(sql1)[0] |> pretty_print
325 |   let stmt2 = parse_sql(sql2)[0] |> pretty_print
    |                                     ^^^^^^^^^^^^
    |   inspect(
    |     stmt1,

<WORKDIR>/src\prepare.mbt:348:35-348:47:
    | ///|
    | test "PREPARE with multiple data types" {
    |   let sql = "PREPARE stmt (INTEGER, VARCHAR(100), DOUBLE) AS SELECT * FROM users WHERE id = ?"
348 |   let stmt = parse_sql(sql)[0] |> pretty_print
    |                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tcl.mbt:172:38-172:50:
    | 
    | test "BEGIN statement" {
    |   let tokens = "BEGIN;"
172 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tcl.mbt:184:38-184:50:
    | ///|
    | test "BEGIN WORK statement" {
    |   let tokens = "BEGIN WORK;"
184 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tcl.mbt:196:38-196:50:
    | ///|
    | test "BEGIN TRANSACTION statement" {
    |   let tokens = "BEGIN TRANSACTION;"
196 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tcl.mbt:208:38-208:50:
    | ///|
    | test "START TRANSACTION statement" {
    |   let tokens = "START TRANSACTION;"
208 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tcl.mbt:220:38-220:50:
    | ///|
    | test "COMMIT statement" {
    |   let tokens = "COMMIT;"
220 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tcl.mbt:232:38-232:50:
    | ///|
    | test "COMMIT WORK statement" {
    |   let tokens = "COMMIT WORK;"
232 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tcl.mbt:244:38-244:50:
    | ///|
    | test "ROLLBACK statement" {
    |   let tokens = "ROLLBACK;"
244 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tcl.mbt:256:38-256:50:
    | ///|
    | test "ROLLBACK TO SAVEPOINT statement" {
    |   let tokens = "ROLLBACK TO SAVEPOINT sp1;"
256 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tcl.mbt:268:38-268:50:
    | ///|
    | test "SAVEPOINT statement" {
    |   let tokens = "SAVEPOINT sp1;"
268 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tcl.mbt:280:38-280:50:
    | ///|
    | test "RELEASE SAVEPOINT statement" {
    |   let tokens = "RELEASE SAVEPOINT sp1;"
280 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\dialect_test.mbt:11:43-11:55:
   | test "MySQL SHOW TABLES statement" {
   |   let sql = @sqlparser.parse_sql("SHOW TABLES;")
   |   inspect(sql.stmts.length(), content="1")
11 |   let pretty = sql.stmts[0] |> @sqlparser.pretty_print
   |                                           ^^^^^^^^^^^^
   |   inspect(pretty, content="SHOW TABLES;")
   | }

<WORKDIR>/src\tests\dialect_test.mbt:19:43-19:55:
   | test "MySQL SHOW COLUMNS with FROM" {
   |   let sql = @sqlparser.parse_sql("SHOW COLUMNS FROM users;")
   |   inspect(sql.stmts.length(), content="1")
19 |   let pretty = sql.stmts[0] |> @sqlparser.pretty_print
   |                                           ^^^^^^^^^^^^
   |   inspect(pretty, content="SHOW COLUMNS FROM users;")
   | }

<WORKDIR>/src\tests\dialect_test.mbt:27:43-27:55:
   | test "MySQL SHOW TABLES with LIKE filter" {
   |   let sql = @sqlparser.parse_sql("SHOW TABLES LIKE 'user%';")
   |   inspect(sql.stmts.length(), content="1")
27 |   let pretty = sql.stmts[0] |> @sqlparser.pretty_print
   |                                           ^^^^^^^^^^^^
   |   inspect(pretty, content="SHOW TABLES LIKE 'user%';")
   | }

<WORKDIR>/src\tests\dialect_test.mbt:35:43-35:55:
   | test "MySQL SHOW STATUS statement" {
   |   let sql = @sqlparser.parse_sql("SHOW STATUS;")
   |   inspect(sql.stmts.length(), content="1")
35 |   let pretty = sql.stmts[0] |> @sqlparser.pretty_print
   |                                           ^^^^^^^^^^^^
   |   inspect(pretty, content="SHOW STATUS;")
   | }

<WORKDIR>/src\tests\dialect_test.mbt:43:43-43:55:
   | test "MySQL SHOW DATABASES statement" {
   |   let sql = @sqlparser.parse_sql("SHOW DATABASES;")
   |   inspect(sql.stmts.length(), content="1")
43 |   let pretty = sql.stmts[0] |> @sqlparser.pretty_print
   |                                           ^^^^^^^^^^^^
   |   inspect(pretty, content="SHOW DATABASES;")
   | }

<WORKDIR>/src\tests\dialect_test.mbt:53:43-53:55:
   | test "MySQL backtick quoted table names" {
   |   let sql = @sqlparser.parse_sql("SELECT * FROM `table name`;")
   |   inspect(sql.stmts.length(), content="1")
53 |   let pretty = sql.stmts[0] |> @sqlparser.pretty_print
   |                                           ^^^^^^^^^^^^
   |   inspect(pretty, content="SELECT\n  *\nFROM\n  `table name`;")
   | }

<WORKDIR>/src\tests\dialect_test.mbt:69:43-69:55:
   | test "MySQL backtick quoted database.table" {
   |   let sql = @sqlparser.parse_sql("SELECT * FROM `my db`.`my table`;")
   |   inspect(sql.stmts.length(), content="1")
69 |   let pretty = sql.stmts[0] |> @sqlparser.pretty_print
   |                                           ^^^^^^^^^^^^
   |   inspect(pretty, content="SELECT\n  *\nFROM\n  `my db`.`my table`;")
   | }

<WORKDIR>/src\tests\dialect_test.mbt:123:43-123:55:
    | test "MySQL SHOW COLUMNS with complex table name" {
    |   let sql = @sqlparser.parse_sql("SHOW COLUMNS FROM `user data`;")
    |   inspect(sql.stmts.length(), content="1")
123 |   let pretty = sql.stmts[0] |> @sqlparser.pretty_print
    |                                           ^^^^^^^^^^^^
    |   inspect(pretty, content="SHOW COLUMNS FROM `user data`;")
    | }

<WORKDIR>/src\tests\dialect_test.mbt:131:43-131:55:
    | test "MySQL SHOW TABLES with complex pattern" {
    |   let sql = @sqlparser.parse_sql("SHOW TABLES LIKE 'test_%_data';")
    |   inspect(sql.stmts.length(), content="1")
131 |   let pretty = sql.stmts[0] |> @sqlparser.pretty_print
    |                                           ^^^^^^^^^^^^
    |   inspect(pretty, content="SHOW TABLES LIKE 'test_%_data';")
    | }

<WORKDIR>/src\tests\tpch_test.mbt:23:67-23:79:
   | 
   | ///|
   | test "TPCH 1" {
23 |   let stmt = read_and_parse("src/tests/tpch/1.sql") |> @sqlparser.pretty_print
   |                                                                   ^^^^^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:54:67-54:79:
   | 
   | ///|
   | test "TPCH 2" {
54 |   let stmt = read_and_parse("src/tests/tpch/2.sql") |> @sqlparser.pretty_print
   |                                                                   ^^^^^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:107:67-107:79:
    | 
    | ///|
    | test "TPCH 3" {
107 |   let stmt = read_and_parse("src/tests/tpch/3.sql") |> @sqlparser.pretty_print
    |                                                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:139:67-139:79:
    | 
    | ///|
    | test "TPCH 4" {
139 |   let stmt = read_and_parse("src/tests/tpch/4.sql") |> @sqlparser.pretty_print
    |                                                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:170:67-170:79:
    | 
    | ///|
    | test "TPCH 5" {
170 |   let stmt = read_and_parse("src/tests/tpch/5.sql") |> @sqlparser.pretty_print
    |                                                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:204:67-204:79:
    | 
    | ///|
    | test "TPCH 6" {
204 |   let stmt = read_and_parse("src/tests/tpch/6.sql") |> @sqlparser.pretty_print
    |                                                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:223:67-223:79:
    | 
    | ///|
    | test "TPCH 7" {
223 |   let stmt = read_and_parse("src/tests/tpch/7.sql") |> @sqlparser.pretty_print
    |                                                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:276:67-276:79:
    | 
    | ///|
    | test "TPCH 8" {
276 |   let stmt = read_and_parse("src/tests/tpch/8.sql") |> @sqlparser.pretty_print
    |                                                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:323:67-323:79:
    | 
    | ///|
    | test "TPCH 9" {
323 |   let stmt = read_and_parse("src/tests/tpch/9.sql") |> @sqlparser.pretty_print
    |                                                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:365:68-365:80:
    | 
    | ///|
    | test "TPCH 10" {
365 |   let stmt = read_and_parse("src/tests/tpch/10.sql") |> @sqlparser.pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:406:68-406:80:
    | 
    | ///|
    | test "TPCH 11" {
406 |   let stmt = read_and_parse("src/tests/tpch/11.sql") |> @sqlparser.pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:444:68-444:80:
    | 
    | ///|
    | test "TPCH 12" {
444 |   let stmt = read_and_parse("src/tests/tpch/12.sql") |> @sqlparser.pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:480:68-480:80:
    | 
    | ///|
    | test "TPCH 13" {
480 |   let stmt = read_and_parse("src/tests/tpch/13.sql") |> @sqlparser.pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:510:68-510:80:
    | 
    | ///|
    | test "TPCH 14" {
510 |   let stmt = read_and_parse("src/tests/tpch/14.sql") |> @sqlparser.pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:532:68-532:80:
    | 
    | ///|
    | test "TPCH 15" {
532 |   let stmt = read_and_parse("src/tests/tpch/15.sql") |> @sqlparser.pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:575:68-575:80:
    | 
    | ///|
    | test "TPCH 16" {
575 |   let stmt = read_and_parse("src/tests/tpch/16.sql") |> @sqlparser.pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:615:68-615:80:
    | 
    | ///|
    | test "TPCH 17" {
615 |   let stmt = read_and_parse("src/tests/tpch/17.sql") |> @sqlparser.pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:642:68-642:80:
    | 
    | ///|
    | test "TPCH 18" {
642 |   let stmt = read_and_parse("src/tests/tpch/18.sql") |> @sqlparser.pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:685:68-685:80:
    | 
    | ///|
    | test "TPCH 19" {
685 |   let stmt = read_and_parse("src/tests/tpch/19.sql") |> @sqlparser.pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:731:68-731:80:
    | 
    | ///|
    | test "TPCH 20" {
731 |   let stmt = read_and_parse("src/tests/tpch/20.sql") |> @sqlparser.pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:778:68-778:80:
    | 
    | ///|
    | test "TPCH 21" {
778 |   let stmt = read_and_parse("src/tests/tpch/21.sql") |> @sqlparser.pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\tests\tpch_test.mbt:827:68-827:80:
    | 
    | ///|
    | test "TPCH 22" {
827 |   let stmt = read_and_parse("src/tests/tpch/22.sql") |> @sqlparser.pretty_print
    |                                                                    ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

```
