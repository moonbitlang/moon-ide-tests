# sqlparser find-references pretty_print src/ast.mbt:2:24

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
$ run_moon_ide moon ide find-references 'pretty_print' --loc 'src/ast.mbt:2:24'
Found 297 references for symbol 'pretty_print':
<WORKDIR>/src/bigquery.mbt:73:67-73:79:
   | 
   | test "BigQuery named parameter" {
   |   let tokens = "SELECT * FROM users WHERE id = @user_id;"
73 |   let stmt = parse_sql(dialect=BigQuery::{ }, tokens).stmts[0] |> pretty_print
   |                                                                   ^^^^^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src/bigquery.mbt:90:67-90:79:
   | ///|
   | test "BigQuery positional parameter" {
   |   let tokens = "SELECT * FROM users WHERE id = ?;"
90 |   let stmt = parse_sql(dialect=BigQuery::{ }, tokens).stmts[0] |> pretty_print
   |                                                                   ^^^^^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src/bigquery.mbt:107:67-107:79:
    | ///|
    | test "BigQuery mixed parameters" {
    |   let tokens = "SELECT * FROM users WHERE id = @user_id AND age > ?;"
107 |   let stmt = parse_sql(dialect=BigQuery::{ }, tokens).stmts[0] |> pretty_print
    |                                                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/bigquery.mbt:125:67-125:79:
    | ///|
    | test "BigQuery multiple named parameters" {
    |   let tokens = "SELECT @field FROM @table WHERE @condition = @value;"
125 |   let stmt = parse_sql(dialect=BigQuery::{ }, tokens).stmts[0] |> pretty_print
    |                                                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/bigquery.mbt:144:64-144:76:
    | 
    | test "Named parameters treated as identifiers in MySQL" {
    |   let tokens = "SELECT @user_id FROM users;"
144 |   let stmt = parse_sql(dialect=MySQL::{ }, tokens).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/dcl.mbt:247:38-247:50:
    | 
    | test "GRANT SELECT statement" {
    |   let tokens = "GRANT SELECT ON users TO alice;"
247 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/dcl.mbt:259:38-259:50:
    | ///|
    | test "GRANT multiple privileges statement" {
    |   let tokens = "GRANT SELECT, INSERT, UPDATE ON users TO alice, bob;"
259 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/dcl.mbt:271:38-271:50:
    | ///|
    | test "GRANT with column specification" {
    |   let tokens = "GRANT SELECT (name, email), UPDATE (email) ON users TO alice;"
271 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/dcl.mbt:283:38-283:50:
    | ///|
    | test "GRANT ALL PRIVILEGES statement" {
    |   let tokens = "GRANT ALL PRIVILEGES ON users TO alice WITH GRANT OPTION;"
283 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/dcl.mbt:295:38-295:50:
    | ///|
    | test "REVOKE SELECT statement" {
    |   let tokens = "REVOKE SELECT ON users FROM alice;"
295 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/dcl.mbt:307:38-307:50:
    | ///|
    | test "REVOKE with CASCADE" {
    |   let tokens = "REVOKE ALL PRIVILEGES ON users FROM alice CASCADE;"
307 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/dcl.mbt:319:38-319:50:
    | ///|
    | test "REVOKE GRANT OPTION FOR" {
    |   let tokens = "REVOKE GRANT OPTION FOR SELECT ON users FROM alice RESTRICT;"
319 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:166:38-166:50:
    | /// CREATE INDEX Tests
    | test "CREATE INDEX - Simple" {
    |   let tokens = "CREATE INDEX idx_name ON users (email);"
166 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:178:38-178:50:
    | ///|
    | test "CREATE UNIQUE INDEX" {
    |   let tokens = "CREATE UNIQUE INDEX idx_unique_email ON users (email);"
178 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:190:38-190:50:
    | ///|
    | test "CREATE INDEX with multiple columns" {
    |   let tokens = "CREATE INDEX idx_name_age ON users (name, age DESC);"
190 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:202:38-202:50:
    | ///|
    | test "CREATE INDEX with USING method" {
    |   let tokens = "CREATE INDEX idx_hash ON users USING HASH (id);"
202 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:214:38-214:50:
    | ///|
    | test "CREATE INDEX with WHERE clause" {
    |   let tokens = "CREATE INDEX idx_active_users ON users (created_at) WHERE active = true;"
214 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:226:38-226:50:
    | ///|
    | test "CREATE INDEX CONCURRENTLY" {
    |   let tokens = "CREATE INDEX CONCURRENTLY idx_concurrent ON users (email);"
226 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:238:38-238:50:
    | ///|
    | test "CREATE INDEX IF NOT EXISTS" {
    |   let tokens = "CREATE INDEX IF NOT EXISTS idx_exists ON users (email);"
238 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:250:38-250:50:
    | ///|
    | test "CREATE INDEX with NULLS ordering" {
    |   let tokens = "CREATE INDEX idx_ordered ON users (name ASC NULLS FIRST, age DESC NULLS LAST);"
250 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:262:38-262:50:
    | ///|
    | test "CREATE INDEX with expression" {
    |   let tokens = "CREATE INDEX idx_lower_email ON users (LOWER(email));"
262 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:274:38-274:50:
    | ///|
    | test "CREATE UNIQUE INDEX with all options" {
    |   let tokens = "CREATE UNIQUE INDEX CONCURRENTLY IF NOT EXISTS idx_complex ON users USING BTREE (email ASC NULLS FIRST, created_at DESC) WHERE active = true;"
274 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:286:38-286:50:
    | ///|
    | test "Create table" {
    |   let tokens = "CREATE TABLE users;"
286 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:300:38-300:50:
    | ///|
    | test "Create table IF NOT EXISTS" {
    |   let tokens = "CREATE TABLE IF NOT EXISTS users (id INTEGER);"
300 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:314:38-314:50:
    | ///|
    | test "Create table AS SELECT" {
    |   let tokens = "CREATE TABLE students_2 AS SELECT * FROM students;"
314 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:329:38-329:50:
    | ///|
    | test "Create table AS SELECT with WHERE" {
    |   let tokens = "CREATE TABLE students_3 AS SELECT city, grade FROM students WHERE grade > 3.0;"
329 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:435:38-435:50:
    | ///|
    | test "Create table with two columns" {
    |   let tokens = "CREATE TABLE users (id INTEGER, name INTEGER);"
435 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:461:38-461:50:
    |     #|  description TEXT,
    |     #|  profile_picture BLOB
    |     #|);
461 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:514:38-514:50:
    | ///|
    | test "With options" {
    |   let tokens = "CREATE TABLE users (id INTEGER NOT NULL UNIQUE, name INTEGER DEFAULT 18);"
514 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:585:38-585:50:
    | ///|
    | test "Create view with columns" {
    |   let tokens = "CREATE VIEW user_view (id, name) AS SELECT id, name FROM users;"
585 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:618:38-618:50:
    | ///|
    | test "Drop view statement" {
    |   let tokens = "DROP VIEW user_view;"
618 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:666:38-666:50:
    |     #|  PRIMARY KEY (id, name),
    |     #|  UNIQUE (name)
    |     #|);
666 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:731:38-731:50:
    |     #|  name VARCHAR(100) UNIQUE,
    |     #|  FOREIGN KEY (id) REFERENCES other_table (other_id)
    |     #|);
731 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:752:38-752:50:
    |     #|  name VARCHAR(100) UNIQUE,
    |     #|  FOREIGN KEY (name) REFERENCES other_table
    |     #|);
752 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:773:38-773:50:
    |     #|  name VARCHAR(100) UNIQUE,
    |     #|  CHECK (id > 0)
    |     #|);
773 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:806:38-806:50:
    | ///|
    | test "Drop table" {
    |   let tokens = "DROP TABLE students;"
806 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:818:38-818:50:
    | ///|
    | test "Drop table IF EXISTS" {
    |   let tokens = "DROP TABLE IF EXISTS students;"
818 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:876:38-876:50:
    | ///|
    | test "DROP INDEX - Simple" {
    |   let tokens = "DROP INDEX idx_name;"
876 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:888:38-888:50:
    | ///|
    | test "DROP INDEX IF EXISTS" {
    |   let tokens = "DROP INDEX IF EXISTS idx_name;"
888 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:900:38-900:50:
    | ///|
    | test "DROP INDEX CONCURRENTLY" {
    |   let tokens = "DROP INDEX CONCURRENTLY idx_name;"
900 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:912:38-912:50:
    | ///|
    | test "DROP INDEX CONCURRENTLY IF EXISTS" {
    |   let tokens = "DROP INDEX CONCURRENTLY IF EXISTS idx_name;"
912 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:924:38-924:50:
    | ///|
    | test "DROP INDEX with table name" {
    |   let tokens = "DROP INDEX idx_name ON users;"
924 |   let stmt = parse_sql(tokens)[0] |> pretty_print
    |                                      ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/ddl.mbt:1125:38-1125:50:
     | ///|
     | test "Alter table drop column" {
     |   let tokens = "ALTER TABLE mytable DROP COLUMN mycolumn;"
1125 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1137:38-1137:50:
     | ///|
     | test "Alter table drop column IF EXISTS" {
     |   let tokens = "ALTER TABLE mytable DROP COLUMN IF EXISTS mycolumn;"
1137 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1149:38-1149:50:
     | ///|
     | test "Alter table IF EXISTS drop column IF EXISTS" {
     |   let tokens = "ALTER TABLE IF EXISTS mytable DROP COLUMN IF EXISTS mycolumn;"
1149 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1163:38-1163:50:
     | ///|
     | test "ALTER INDEX - RENAME TO" {
     |   let tokens = "ALTER INDEX idx_old RENAME TO idx_new;"
1163 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1175:38-1175:50:
     | ///|
     | test "ALTER INDEX IF EXISTS RENAME TO" {
     |   let tokens = "ALTER INDEX IF EXISTS idx_old RENAME TO idx_new;"
1175 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1187:38-1187:50:
     | ///|
     | test "ALTER INDEX - SET TABLESPACE" {
     |   let tokens = "ALTER INDEX idx_name SET TABLESPACE fast_ssd;"
1187 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1199:38-1199:50:
     | ///|
     | test "ALTER INDEX - RESET parameters" {
     |   let tokens = "ALTER INDEX idx_name RESET (fillfactor, fastupdate);"
1199 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1211:38-1211:50:
     | ///|
     | test "ALTER INDEX - SET parameters" {
     |   let tokens = "ALTER INDEX idx_name SET (fillfactor = 70, fastupdate = off);"
1211 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1223:38-1223:50:
     | ///|
     | test "ALTER INDEX - Simple RENAME test" {
     |   let tokens = "ALTER INDEX idx_old RENAME TO idx_new;"
1223 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1235:38-1235:50:
     | ///|
     | test "ALTER INDEX - Complex RENAME with quoted names" {
     |   let tokens = "ALTER INDEX \"old-index-name\" RENAME TO \"new-index-name\";"
1235 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(stmt, content="ALTER INDEX old-index-name RENAME TO new-index-name;")
     | }

<WORKDIR>/src/ddl.mbt:1331:38-1331:50:
     | ///|
     | test "CREATE DATABASE - Simple" {
     |   let tokens = "CREATE DATABASE mydb;"
1331 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1343:38-1343:50:
     | ///|
     | test "CREATE DATABASE IF NOT EXISTS" {
     |   let tokens = "CREATE DATABASE IF NOT EXISTS mydb;"
1343 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1355:38-1355:50:
     | ///|
     | test "CREATE DATABASE with CHARACTER SET" {
     |   let tokens = "CREATE DATABASE mydb CHARACTER SET utf8;"
1355 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1367:38-1367:50:
     | ///|
     | test "CREATE DATABASE with CHARACTER SET and COLLATE" {
     |   let tokens = "CREATE DATABASE mydb CHARACTER SET utf8 COLLATE utf8_general_ci;"
1367 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1379:38-1379:50:
     | ///|
     | test "CREATE SCHEMA - Simple" {
     |   let tokens = "CREATE SCHEMA myschema;"
1379 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1391:38-1391:50:
     | ///|
     | test "CREATE SCHEMA IF NOT EXISTS" {
     |   let tokens = "CREATE SCHEMA IF NOT EXISTS myschema;"
1391 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1403:38-1403:50:
     | ///|
     | test "CREATE SCHEMA with AUTHORIZATION" {
     |   let tokens = "CREATE SCHEMA myschema AUTHORIZATION myuser;"
1403 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1612:38-1612:50:
     | ///|
     | test "CREATE FUNCTION - Simple" {
     |   let tokens = "CREATE FUNCTION my_func() RETURNS INTEGER AS 'SELECT 1';"
1612 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1624:38-1624:50:
     | ///|
     | test "CREATE FUNCTION IF NOT EXISTS" {
     |   let tokens = "CREATE FUNCTION IF NOT EXISTS my_func() RETURNS INTEGER AS 'SELECT 1';"
1624 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1636:38-1636:50:
     | ///|
     | test "CREATE FUNCTION with parameters" {
     |   let tokens = "CREATE FUNCTION add_nums(IN a INTEGER, IN b INTEGER) RETURNS INTEGER LANGUAGE sql AS 'SELECT a + b';"
1636 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1648:38-1648:50:
     | ///|
     | test "CREATE FUNCTION DETERMINISTIC" {
     |   let tokens = "CREATE FUNCTION my_func() RETURNS INTEGER DETERMINISTIC AS 'SELECT 1';"
1648 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1660:38-1660:50:
     | ///|
     | test "CREATE PROCEDURE - Simple" {
     |   let tokens = "CREATE PROCEDURE my_proc() AS 'BEGIN SELECT 1; END';"
1660 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1672:38-1672:50:
     | ///|
     | test "CREATE PROCEDURE with parameters" {
     |   let tokens = "CREATE PROCEDURE update_user(IN user_id INTEGER, IN new_name VARCHAR(100)) LANGUAGE plpgsql AS 'BEGIN UPDATE users SET name = new_name WHERE id = user_id; END';"
1672 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1684:38-1684:50:
     | ///|
     | test "CREATE FUNCTION with OUT parameter" {
     |   let tokens = "CREATE FUNCTION get_user_info(IN user_id INTEGER, OUT user_name VARCHAR(100), OUT user_age INTEGER) AS 'SELECT name, age FROM users WHERE id = user_id';"
1684 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1696:38-1696:50:
     | ///|
     | test "CREATE FUNCTION with INOUT parameter" {
     |   let tokens = "CREATE FUNCTION modify_value(INOUT value INTEGER) RETURNS INTEGER AS 'SELECT value * 2';"
1696 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1861:38-1861:50:
     | ///|
     | test "CREATE SEQUENCE - Simple" {
     |   let tokens = "CREATE SEQUENCE my_seq;"
1861 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1873:38-1873:50:
     | ///|
     | test "CREATE SEQUENCE IF NOT EXISTS" {
     |   let tokens = "CREATE SEQUENCE IF NOT EXISTS my_seq;"
1873 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1885:38-1885:50:
     | ///|
     | test "CREATE TEMPORARY SEQUENCE" {
     |   let tokens = "CREATE TEMPORARY SEQUENCE temp_seq;"
1885 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1897:38-1897:50:
     | ///|
     | test "CREATE SEQUENCE with INCREMENT BY" {
     |   let tokens = "CREATE SEQUENCE my_seq INCREMENT BY 5;"
1897 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1909:38-1909:50:
     | ///|
     | test "CREATE SEQUENCE with MINVALUE and MAXVALUE" {
     |   let tokens = "CREATE SEQUENCE my_seq MINVALUE 1 MAXVALUE 1000;"
1909 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1921:38-1921:50:
     | ///|
     | test "CREATE SEQUENCE with NO MINVALUE NO MAXVALUE" {
     |   let tokens = "CREATE SEQUENCE my_seq NO MINVALUE NO MAXVALUE;"
1921 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1933:38-1933:50:
     | ///|
     | test "CREATE SEQUENCE with START WITH and CACHE" {
     |   let tokens = "CREATE SEQUENCE my_seq START WITH 10 CACHE 20;"
1933 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1945:38-1945:50:
     | ///|
     | test "CREATE SEQUENCE with CYCLE" {
     |   let tokens = "CREATE SEQUENCE my_seq CYCLE;"
1945 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1957:38-1957:50:
     | ///|
     | test "CREATE SEQUENCE with NO CYCLE" {
     |   let tokens = "CREATE SEQUENCE my_seq NO CYCLE;"
1957 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1969:38-1969:50:
     | ///|
     | test "CREATE SEQUENCE with OWNED BY" {
     |   let tokens = "CREATE SEQUENCE user_id_seq OWNED BY users.id;"
1969 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1981:38-1981:50:
     | ///|
     | test "CREATE SEQUENCE with OWNED BY NONE" {
     |   let tokens = "CREATE SEQUENCE my_seq OWNED BY NONE;"
1981 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/ddl.mbt:1993:38-1993:50:
     | ///|
     | test "CREATE SEQUENCE with all options" {
     |   let tokens = "CREATE TEMPORARY SEQUENCE IF NOT EXISTS user_seq INCREMENT BY 2 MINVALUE 1 MAXVALUE 9999 START WITH 100 CACHE 10 CYCLE OWNED BY users.id;"
1993 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1147:38-1147:50:
     | ///|
     | test "Parse select with two columns" {
     |   let tokens = "SELECT col1, col2 FROM t;"
1147 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1163:38-1163:50:
     | ///|
     | test "Parse select with function call" {
     |   let tokens = "SELECT MAX(arg1, arg2), MIN() as m FROM t;"
1163 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1179:38-1179:50:
     | ///|
     | test "Nested expression" {
     |   let tokens = "SELECT sum(l_extendedprice * (1 - l_discount)) FROM lineitem;"
1179 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1194:38-1194:50:
     | ///|
     | test "Binary expression" {
     |   let tokens = "SELECT 1 + 2 * 3 FROM t;"
1194 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1209:38-1209:50:
     | ///|
     | test "Complecated binary expression" {
     |   let tokens = "SELECT sum(a * (1 - b) * (2 + b)) AS c FROM t;"
1209 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1224:38-1224:50:
     | ///|
     | test "Selection clause" {
     |   let tokens = "SELECT * FROM t WHERE id = 1;"
1224 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1250:38-1250:50:
     |     #|  AND name ILIKE 'TEST' 
     |     #|  AND name NOT LIKE 'test2' 
     |     #|  AND name NOT ILIKE 'TEST2';
1250 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1270:38-1270:50:
     | ///|
     | test "From multiple table refs" {
     |   let tokens = "SELECT * FROM t1, t2;"
1270 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1286:61-1286:73:
     | ///|
     | test "SubQuery" {
     |   let tokens = "SELECT sub FROM (SELECT name FROM users WHERE active = true) AS sub;"
1286 |   let stmt = parse_sql(tokens, dialect=Postgres::{ })[0] |> pretty_print
     |                                                             ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1308:38-1308:50:
     | ///|
     | test "Exists, not exists" {
     |   let tokens = "SELECT * FROM t WHERE EXISTS (SELECT 1 FROM t2) AND NOT EXISTS (SELECT 1 FROM t3);"
1308 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1336:38-1336:50:
     | ///|
     | test "Between and" {
     |   let tokens = "SELECT * FROM t WHERE id BETWEEN 1 AND 10;"
1336 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1353:38-1353:50:
     | ///|
     | test "Compound identifiers" {
     |   let tokens = "SELECT t1.col1, t2.col2 FROM t1, t2;"
1353 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1370:38-1370:50:
     | ///|
     | test "Extract function" {
     |   let tokens = "SELECT EXTRACT(YEAR FROM date_col) FROM t;"
1370 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1385:38-1385:50:
     | ///|
     | test "Aliasing omits AS" {
     |   let tokens = "SELECT col1 c1, col2 FROM t;"
1385 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1401:38-1401:50:
     | ///|
     | test "Case when" {
     |   let tokens = "SELECT CASE WHEN a > 0 THEN 'positive' WHEN a < 0 THEN 'negative' ELSE 'zero' END AS result FROM t;"
1401 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1420:38-1420:50:
     | ///|
     | test "Having" {
     |   let tokens = "SELECT col1, COUNT(*) FROM t GROUP BY col1 HAVING COUNT(*) > 1;"
1420 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1440:38-1440:50:
     | ///|
     | test "In list" {
     |   let tokens = "SELECT * FROM t WHERE col1 IN (1, 2, 3);"
1440 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1457:38-1457:50:
     | ///|
     | test "In subquery" {
     |   let tokens = "SELECT * FROM t WHERE col1 IN (SELECT col2 FROM t2);"
1457 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1479:38-1479:50:
     | ///|
     | test "Join with ON condition" {
     |   let tokens = "SELECT * FROM t1 JOIN t2 ON t1.id = t2.id;"
1479 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1495:38-1495:50:
     | ///|
     | test "Cross join" {
     |   let tokens = "SELECT * FROM t1 CROSS JOIN t2;"
1495 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1510:38-1510:50:
     | ///|
     | test "Left join" {
     |   let tokens = "SELECT * FROM t1 LEFT JOIN t2 ON t1.id = t2.id GROUP BY x;"
1510 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1528:38-1528:50:
     | ///|
     | test "Right join" {
     |   let tokens = "SELECT * FROM t1 RIGHT JOIN t2 ON t1.id = t2.id;"
1528 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1544:38-1544:50:
     | ///|
     | test "Full outer join" {
     |   let tokens = "SELECT * FROM t1 LEFT OUTER JOIN t2 ON t1.id = t2.id;"
1544 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1560:61-1560:73:
     | ///|
     | test "Null, true and false" {
     |   let tokens = "SELECT NULL, true, false FROM t1;"
1560 |   let stmt = parse_sql(dialect=Postgres::{ }, tokens)[0] |> pretty_print
     |                                                             ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1577:38-1577:50:
     | ///|
     | test "Unary plus and minus" {
     |   let tokens = "SELECT +1, -2 FROM t;"
1577 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1593:38-1593:50:
     | ///|
     | test "Unary not expression" {
     |   let tokens = "SELECT NOT a FROM t;"
1593 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1608:38-1608:50:
     | ///|
     | test "Using clause in join" {
     |   let tokens = "SELECT * FROM t1 JOIN t2 USING (id);"
1608 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1624:36-1624:48:
     | ///|
     | test "Multiple statements" {
     |   let tokens = "SELECT * FROM t1; SELECT * FROM t2;"
1624 |   let stmts = parse_sql(tokens) |> pretty_print
     |                                    ^^^^^^^^^^^^
     |   inspect(
     |     stmts,

<WORKDIR>/src/dml.mbt:1644:38-1644:50:
     | ///|
     | test "String literal as column" {
     |   let tokens = "SELECT test FROM 't';"
1644 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1659:38-1659:50:
     | ///|
     | test "Limit and offset" {
     |   let tokens = "SELECT * FROM t LIMIT 10 OFFSET 5;"
1659 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1678:38-1678:50:
     | ///|
     | test "Limit without offset" {
     |   let tokens = "SELECT * FROM t LIMIT N;"
1678 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1695:38-1695:50:
     | ///|
     | test "Offset without limit" {
     |   let tokens = "SELECT * FROM t OFFSET N;"
1695 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1712:38-1712:50:
     | ///|
     | test "Duplicate treatment" {
     |   let tokens = "SELECT COUNT(DISTINCT *) FROM t;"
1712 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1727:38-1727:50:
     | ///|
     | test "Substring" {
     |   let tokens = "SELECT SUBSTRING(col FROM 1 FOR 5) FROM t;"
1727 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1742:38-1742:50:
     | ///|
     | test "Substring with start only" {
     |   let tokens = "SELECT SUBSTRING(col FROM 1) FROM t;"
1742 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1757:38-1757:50:
     | ///|
     | test "Substring another way" {
     |   let tokens = "SELECT SUBSTRING(col, 1, 5) FROM t;"
1757 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1800:38-1800:50:
     | ///|
     | test {
     |   let tokens = "SELECT * FROM t1 UNION (SELECT * FROM t2 UNION SELECT * FROM t3) ORDER BY col1;"
1800 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1829:38-1829:50:
     | ///|
     | test "Non projections" {
     |   let tokens = "SELECT FROM t1;"
1829 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:1865:38-1865:50:
     | ///|
     | test "Top 10" {
     |   let tokens = "SELECT TOP 10 * FROM t;"
1865 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2011:38-2011:50:
     | ///|
     | test "Insert with values - simple" {
     |   let tokens = "INSERT INTO test_table VALUES (1, 2, 'test');"
2011 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2023:38-2023:50:
     | ///|
     | test "Insert with columns and values" {
     |   let tokens = "INSERT INTO test_table (id, value, name) VALUES (1, 2, 'test');"
2023 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2035:38-2035:50:
     | ///|
     | test "Insert with SELECT" {
     |   let tokens = "INSERT INTO test_table SELECT * FROM students;"
2035 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2050:38-2050:50:
     | ///|
     | test "Insert with schema" {
     |   let tokens = "INSERT INTO some_schema.test_table SELECT * FROM another_schema.students;"
2050 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2066:38-2066:50:
     | /// PostgreSQL ON CONFLICT Tests
     | test "INSERT with ON CONFLICT DO NOTHING" {
     |   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT DO NOTHING;"
2066 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2078:38-2078:50:
     | ///|
     | test "INSERT with ON CONFLICT (column) DO NOTHING" {
     |   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT (email) DO NOTHING;"
2078 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2090:38-2090:50:
     | ///|
     | test "INSERT with ON CONFLICT (multiple columns) DO UPDATE" {
     |   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT (id, email) DO UPDATE SET name = EXCLUDED.name;"
2090 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2102:38-2102:50:
     | ///|
     | test "INSERT with ON CONFLICT ON CONSTRAINT" {
     |   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT ON CONSTRAINT users_email_key DO UPDATE SET name = EXCLUDED.name;"
2102 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2114:38-2114:50:
     | ///|
     | test "INSERT with ON CONFLICT DO UPDATE with WHERE" {
     |   let tokens = "INSERT INTO users (id, name, email, active) VALUES (1, 'John', 'john@example.com', true) ON CONFLICT (email) DO UPDATE SET name = EXCLUDED.name, active = EXCLUDED.active WHERE users.created_at < NOW();"
2114 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2126:38-2126:50:
     | ///|
     | test "INSERT with ON CONFLICT (expression) WHERE condition" {
     |   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT (LOWER(email)) WHERE active = true DO UPDATE SET name = EXCLUDED.name;"
2126 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2158:38-2158:50:
     | ///|
     | test "Delete with WHERE" {
     |   let tokens = "DELETE FROM students WHERE grade > 3.0;"
2158 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2171:38-2171:50:
     | ///|
     | test "Delete without WHERE" {
     |   let tokens = "DELETE FROM students;"
2171 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2222:38-2222:50:
     | ///|
     | test "Update with single assignment and WHERE" {
     |   let tokens = "UPDATE students SET grade = 1.3 WHERE name = 'Max Mustermann';"
2222 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2236:38-2236:50:
     | ///|
     | test "Update with multiple assignments and WHERE" {
     |   let tokens = "UPDATE students SET grade = 1.3, name='Felix Fürstenberg' WHERE name = 'Max Mustermann';"
2236 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2250:38-2250:50:
     | ///|
     | test "Update without WHERE" {
     |   let tokens = "UPDATE students SET grade = 1.0;"
2250 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2505:38-2505:50:
     | ///|
     | test "Truncate table" {
     |   let tokens = "TRUNCATE students;"
2505 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2519:38-2519:50:
     | 
     | test "Simple CTE with WITH clause" {
     |   let tokens = "WITH sales AS (SELECT * FROM orders) SELECT * FROM sales;"
2519 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2540:38-2540:50:
     | ///|
     | test "CTE with column specification" {
     |   let tokens = "WITH sales(id, total) AS (SELECT order_id, amount FROM orders) SELECT * FROM sales;"
2540 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2562:38-2562:50:
     | ///|
     | test "Multiple CTEs" {
     |   let tokens = "WITH sales AS (SELECT * FROM orders), customers AS (SELECT * FROM users) SELECT * FROM sales JOIN customers ON sales.user_id = customers.id;"
2562 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2590:38-2590:50:
     | ///|
     | test "CTE with ORDER BY and LIMIT" {
     |   let tokens = "WITH top_sales AS (SELECT * FROM orders ORDER BY amount DESC LIMIT 10) SELECT * FROM top_sales;"
2590 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2615:38-2615:50:
     | ///|
     | test "Nested CTE (CTE referencing another CTE)" {
     |   let tokens = "WITH sales AS (SELECT * FROM orders), big_sales AS (SELECT * FROM sales WHERE amount > 1000) SELECT * FROM big_sales;"
2615 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2644:38-2644:50:
     | ///|
     | test "CTE with aggregation" {
     |   let tokens = "WITH monthly_sales AS (SELECT date_month, SUM(amount) as total FROM orders GROUP BY date_month) SELECT * FROM monthly_sales;"
2644 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2669:38-2669:50:
     | /// Window Functions Tests
     | test "Simple window function with empty OVER clause" {
     |   let tokens = "SELECT rank() OVER () FROM test;"
2669 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2684:38-2684:50:
     | ///|
     | test "Window function with ORDER BY" {
     |   let tokens = "SELECT rank() OVER (ORDER BY salary DESC) FROM employees;"
2684 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2699:38-2699:50:
     | ///|
     | test "Window function with PARTITION BY" {
     |   let tokens = "SELECT count(*) OVER (PARTITION BY department) FROM employees;"
2699 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2714:38-2714:50:
     | ///|
     | test "Window function with PARTITION BY and ORDER BY" {
     |   let tokens = "SELECT row_number() OVER (PARTITION BY department ORDER BY salary DESC) FROM employees;"
2714 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2729:38-2729:50:
     | ///|
     | test "Window function with ROWS frame - UNBOUNDED PRECEDING" {
     |   let tokens = "SELECT sum(salary) OVER (ORDER BY hire_date ROWS UNBOUNDED PRECEDING) FROM employees;"
2729 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2744:38-2744:50:
     | ///|
     | test "Window function with ROWS frame - BETWEEN" {
     |   let tokens = "SELECT avg(salary) OVER (ORDER BY hire_date ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) FROM employees;"
2744 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2949:38-2949:50:
     | ///|
     | test "MERGE - Simple" {
     |   let tokens = "MERGE INTO target_table USING source_table ON target_table.id = source_table.id WHEN MATCHED THEN UPDATE SET name = source_table.name WHEN NOT MATCHED THEN INSERT VALUES (source_table.id, source_table.name);"
2949 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2965:38-2965:50:
     | ///|
     | test "MERGE with table aliases" {
     |   let tokens = "MERGE INTO customers c USING customer_updates cu ON c.id = cu.id WHEN MATCHED THEN UPDATE SET name = cu.name;"
2965 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:2980:38-2980:50:
     | ///|
     | test "MERGE with subquery source" {
     |   let tokens = "MERGE INTO dest_table t USING (SELECT id, name FROM source) s ON t.id = s.id WHEN NOT MATCHED THEN INSERT (id, name) VALUES (s.id, s.name);"
2980 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:3001:38-3001:50:
     | ///|
     | test "MERGE with conditional WHEN" {
     |   let tokens = "MERGE INTO products p USING updates u ON p.id = u.id WHEN MATCHED AND u.price > p.price THEN UPDATE SET price = u.price WHEN NOT MATCHED THEN INSERT VALUES (u.id, u.name, u.price);"
3001 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/dml.mbt:3017:38-3017:50:
     | ///|
     | test "MERGE with DELETE action" {
     |   let tokens = "MERGE INTO inventory i USING changes c ON i.id = c.id WHEN MATCHED AND c.quantity = 0 THEN DELETE WHEN MATCHED THEN UPDATE SET quantity = c.quantity;"
3017 |   let stmt = parse_sql(tokens)[0] |> pretty_print
     |                                      ^^^^^^^^^^^^
     |   inspect(
     |     stmt,

<WORKDIR>/src/mysql.mbt:104:64-104:76:
    | ///|
    | test "MySQL SHOW TABLES" {
    |   let tokens = "SHOW TABLES;"
104 |   let stmt = parse_sql(dialect=MySQL::{ }, tokens).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/mysql.mbt:116:64-116:76:
    | ///|
    | test "MySQL SHOW COLUMNS FROM table" {
    |   let tokens = "SHOW COLUMNS FROM users;"
116 |   let stmt = parse_sql(dialect=MySQL::{ }, tokens).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/mysql.mbt:128:64-128:76:
    | ///|
    | test "MySQL SHOW TABLES LIKE pattern" {
    |   let tokens = "SHOW TABLES LIKE 'user%';"
128 |   let stmt = parse_sql(dialect=MySQL::{ }, tokens).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/mysql.mbt:140:64-140:76:
    | ///|
    | test "MySQL with backticks in SHOW" {
    |   let tokens = "SHOW COLUMNS FROM `table name`;"
140 |   let stmt = parse_sql(dialect=MySQL::{ }, tokens).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/mysql.mbt:152:64-152:76:
    | ///|
    | test "MySQL LOCK TABLES" {
    |   let tokens = "LOCK TABLES users;"
152 |   let stmt = parse_sql(dialect=MySQL::{ }, tokens).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/mysql.mbt:164:64-164:76:
    | ///|
    | test "MySQL UNLOCK TABLES" {
    |   let tokens = "UNLOCK TABLES;"
164 |   let stmt = parse_sql(dialect=MySQL::{ }, tokens).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/mysql.mbt:176:64-176:76:
    | ///|
    | test "MySQL DIV operator" {
    |   let tokens = "SELECT 10 DIV 3 FROM test;"
176 |   let stmt = parse_sql(dialect=MySQL::{ }, tokens).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/mysql.mbt:191:64-191:76:
    | ///|
    | test "MySQL SHOW VARIABLES" {
    |   let tokens = "SHOW VARIABLES;"
191 |   let stmt = parse_sql(dialect=MySQL::{ }, tokens).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/mysql.mbt:203:64-203:76:
    | ///|
    | test "MySQL SHOW GLOBAL STATUS" {
    |   let tokens = "SHOW GLOBAL STATUS;"
203 |   let stmt = parse_sql(dialect=MySQL::{ }, tokens).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/mysql.mbt:215:64-215:76:
    | ///|
    | test "MySQL SHOW FULL PROCESSLIST" {
    |   let tokens = "SHOW FULL PROCESSLIST;"
215 |   let stmt = parse_sql(dialect=MySQL::{ }, tokens).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/mysql.mbt:227:64-227:76:
    | ///|
    | test "MySQL SHOW CREATE TABLE" {
    |   let tokens = "SHOW CREATE TABLE users;"
227 |   let stmt = parse_sql(dialect=MySQL::{ }, tokens).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/mysql.mbt:239:64-239:76:
    | ///|
    | test "MySQL SHOW EXTENDED COLUMNS" {
    |   let tokens = "SHOW EXTENDED COLUMNS FROM users LIKE 'name%';"
239 |   let stmt = parse_sql(dialect=MySQL::{ }, tokens).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/mysql.mbt:251:64-251:76:
    | ///|
    | test "MySQL SET session variable" {
    |   let tokens = "SET SESSION sql_mode = 'STRICT_TRANS_TABLES';"
251 |   let stmt = parse_sql(dialect=MySQL::{ }, tokens).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/mysql.mbt:263:64-263:76:
    | ///|
    | test "MySQL SET global variable" {
    |   let tokens = "SET GLOBAL max_connections = 200;"
263 |   let stmt = parse_sql(dialect=MySQL::{ }, tokens).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/mysql.mbt:275:64-275:76:
    | ///|
    | test "MySQL SET user variable" {
    |   let tokens = "SET @counter = 1;"
275 |   let stmt = parse_sql(dialect=MySQL::{ }, tokens).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/mysql.mbt:287:64-287:76:
    | ///|
    | test "MySQL SET multiple variables" {
    |   let tokens = "SET @name = 'John', @age = 30, @salary = 50000.50;"
287 |   let stmt = parse_sql(dialect=MySQL::{ }, tokens).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/mysql.mbt:299:64-299:76:
    | ///|
    | test "MySQL SET local variable" {
    |   let tokens = "SET autocommit = 0;"
299 |   let stmt = parse_sql(dialect=MySQL::{ }, tokens).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/mysql.mbt:311:64-311:76:
    | ///|
    | test "MySQL REPLACE INTO statement" {
    |   let tokens = "REPLACE INTO users (id, name) VALUES (1, 'John');"
311 |   let stmt = parse_sql(dialect=MySQL::{ }, tokens).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/mysql.mbt:323:64-323:76:
    | ///|
    | test "MySQL REPLACE INTO with multiple values" {
    |   let tokens = "REPLACE INTO products (id, name, price) VALUES (1, 'Widget', 10.50), (2, 'Gadget', 15.00);"
323 |   let stmt = parse_sql(dialect=MySQL::{ }, tokens).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/mysql.mbt:335:64-335:76:
    | ///|
    | test "MySQL INSERT OR REPLACE statement" {
    |   let tokens = "INSERT OR REPLACE INTO settings (key, value) VALUES ('theme', 'dark');"
335 |   let stmt = parse_sql(dialect=MySQL::{ }, tokens).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/mysql.mbt:347:64-347:76:
    | ///|
    | test "MySQL INSERT with ON DUPLICATE KEY UPDATE" {
    |   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON DUPLICATE KEY UPDATE name = 'John Updated', email = 'john.new@example.com';"
347 |   let stmt = parse_sql(dialect=MySQL::{ }, tokens).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/mysql.mbt:359:64-359:76:
    | ///|
    | test "MySQL INSERT single assignment ON DUPLICATE KEY UPDATE" {
    |   let tokens = "INSERT INTO counters (id, count) VALUES (1, 1) ON DUPLICATE KEY UPDATE count = count + 1;"
359 |   let stmt = parse_sql(dialect=MySQL::{ }, tokens).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/mysql.mbt:371:64-371:76:
    | ///|
    | test "MySQL REPLACE with ON DUPLICATE KEY UPDATE" {
    |   let tokens = "REPLACE INTO settings (setting_key, setting_value) VALUES ('theme', 'dark') ON DUPLICATE KEY UPDATE setting_value = 'light';"
371 |   let stmt = parse_sql(dialect=MySQL::{ }, tokens).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/mysql.mbt:383:64-383:76:
    | ///|
    | test "MySQL basic LOAD DATA statement" {
    |   let tokens = "LOAD DATA INFILE '/tmp/data.csv' INTO TABLE users;"
383 |   let stmt = parse_sql(dialect=MySQL::{ }, tokens).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/mysql.mbt:396:64-396:76:
    | ///|
    | test "MySQL LOAD DATA with LOCAL and REPLACE" {
    |   let tokens = "LOAD DATA LOCAL INFILE '/tmp/users.txt' REPLACE INTO TABLE employees;"
396 |   let stmt = parse_sql(dialect=MySQL::{ }, tokens).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/mysql.mbt:409:64-409:76:
    | ///|
    | test "MySQL LOAD DATA with FIELDS options" {
    |   let tokens = "LOAD DATA INFILE '/data/products.csv' INTO TABLE products CHARACTER SET utf8 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';"
409 |   let stmt = parse_sql(dialect=MySQL::{ }, tokens).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/mysql.mbt:424:64-424:76:
    | ///|
    | test "MySQL LOAD DATA with LINES options" {
    |   let tokens = "LOAD DATA INFILE '/tmp/logs.txt' INTO TABLE logs LINES STARTING BY '>>>' TERMINATED BY '\n' IGNORE 5 LINES;"
424 |   let stmt = parse_sql(dialect=MySQL::{ }, tokens).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/mysql.mbt:440:64-440:76:
    | ///|
    | test "MySQL LOAD DATA with column list and SET" {
    |   let tokens = "LOAD DATA INFILE '/data/sales.csv' IGNORE INTO TABLE sales FIELDS TERMINATED BY ',' (date, amount, customer) SET created_at = now();"
440 |   let stmt = parse_sql(dialect=MySQL::{ }, tokens).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/parameterized.mbt:20:61-20:73:
   | ///|
   | test "Question mark placeholder in WHERE clause" {
   |   let sql = "SELECT * FROM users WHERE id = ?;"
20 |   let stmt = parse_sql(dialect=MySQL::{ }, sql).stmts[0] |> pretty_print
   |                                                             ^^^^^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src/parameterized.mbt:37:61-37:73:
   | ///|
   | test "Multiple question mark placeholders" {
   |   let sql = "SELECT * FROM users WHERE age > ? AND name = ?;"
37 |   let stmt = parse_sql(dialect=MySQL::{ }, sql).stmts[0] |> pretty_print
   |                                                             ^^^^^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src/parameterized.mbt:55:61-55:73:
   | ///|
   | test "Question mark placeholder in INSERT" {
   |   let sql = "INSERT INTO users (name, age) VALUES (?, ?);"
55 |   let stmt = parse_sql(dialect=MySQL::{ }, sql).stmts[0] |> pretty_print
   |                                                             ^^^^^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src/parameterized.mbt:67:61-67:73:
   | ///|
   | test "Question mark placeholder in UPDATE" {
   |   let sql = "UPDATE users SET name = ?, age = ? WHERE id = ?;"
67 |   let stmt = parse_sql(dialect=MySQL::{ }, sql).stmts[0] |> pretty_print
   |                                                             ^^^^^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src/parameterized.mbt:81:61-81:73:
   | ///|
   | test "Question mark placeholder in LIMIT" {
   |   let sql = "SELECT * FROM users LIMIT ?;"
81 |   let stmt = parse_sql(dialect=MySQL::{ }, sql).stmts[0] |> pretty_print
   |                                                             ^^^^^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src/parameterized.mbt:98:61-98:73:
   | ///|
   | test "Question mark placeholder in LIMIT and OFFSET" {
   |   let sql = "SELECT * FROM users LIMIT ? OFFSET ?;"
98 |   let stmt = parse_sql(dialect=MySQL::{ }, sql).stmts[0] |> pretty_print
   |                                                             ^^^^^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src/parameterized.mbt:117:64-117:76:
    | ///|
    | test "PostgreSQL $1 numbered placeholder" {
    |   let sql = "SELECT * FROM users WHERE id = $1;"
117 |   let stmt = parse_sql(dialect=Postgres::{ }, sql).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/parameterized.mbt:134:64-134:76:
    | ///|
    | test "PostgreSQL multiple numbered placeholders" {
    |   let sql = "SELECT * FROM users WHERE age > $1 AND name = $2;"
134 |   let stmt = parse_sql(dialect=Postgres::{ }, sql).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/parameterized.mbt:152:64-152:76:
    | ///|
    | test "PostgreSQL numbered placeholders in INSERT" {
    |   let sql = "INSERT INTO users (name, age, email) VALUES ($1, $2, $3);"
152 |   let stmt = parse_sql(dialect=Postgres::{ }, sql).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/parameterized.mbt:162:64-162:76:
    | ///|
    | test "PostgreSQL numbered placeholders in LIMIT OFFSET" {
    |   let sql = "SELECT * FROM users LIMIT $1 OFFSET $2;"
162 |   let stmt = parse_sql(dialect=Postgres::{ }, sql).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/parameterized.mbt:181:64-181:76:
    | ///|
    | test "PostgreSQL numbered placeholders out of order" {
    |   let sql = "SELECT * FROM users WHERE id = $2 AND name = $1;"
181 |   let stmt = parse_sql(dialect=Postgres::{ }, sql).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/parameterized.mbt:199:64-199:76:
    | ///|
    | test "Colon named parameter" {
    |   let sql = "SELECT * FROM users WHERE name = :username;"
199 |   let stmt = parse_sql(dialect=Postgres::{ }, sql).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/parameterized.mbt:216:64-216:76:
    | ///|
    | test "Multiple colon named parameters" {
    |   let sql = "SELECT * FROM users WHERE age > :min_age AND city = :city_name;"
216 |   let stmt = parse_sql(dialect=Postgres::{ }, sql).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/parameterized.mbt:234:64-234:76:
    | ///|
    | test "Colon named parameters in INSERT" {
    |   let sql = "INSERT INTO users (name, age) VALUES (:name, :age);"
234 |   let stmt = parse_sql(dialect=Postgres::{ }, sql).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(stmt, content="INSERT INTO users (name, age) VALUES (:name, :age);")
    | }

<WORKDIR>/src/parameterized.mbt:241:61-241:73:
    | ///|
    | test "At-sign named parameter" {
    |   let sql = "SELECT * FROM users WHERE name = @username;"
241 |   let stmt = parse_sql(dialect=MySQL::{ }, sql).stmts[0] |> pretty_print
    |                                                             ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/parameterized.mbt:258:61-258:73:
    | ///|
    | test "Multiple at-sign named parameters" {
    |   let sql = "SELECT * FROM users WHERE age > @min_age AND city = @city_name;"
258 |   let stmt = parse_sql(dialect=MySQL::{ }, sql).stmts[0] |> pretty_print
    |                                                             ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/parameterized.mbt:276:61-276:73:
    | ///|
    | test "Placeholder in function call" {
    |   let sql = "SELECT UPPER(?) FROM users;"
276 |   let stmt = parse_sql(dialect=MySQL::{ }, sql).stmts[0] |> pretty_print
    |                                                             ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/parameterized.mbt:291:61-291:73:
    | ///|
    | test "Placeholder in expression" {
    |   let sql = "SELECT * FROM users WHERE age + ? > 100;"
291 |   let stmt = parse_sql(dialect=MySQL::{ }, sql).stmts[0] |> pretty_print
    |                                                             ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/parameterized.mbt:308:61-308:73:
    | ///|
    | test "Placeholder in BETWEEN clause" {
    |   let sql = "SELECT * FROM users WHERE age BETWEEN ? AND ?;"
308 |   let stmt = parse_sql(dialect=MySQL::{ }, sql).stmts[0] |> pretty_print
    |                                                             ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/parameterized.mbt:325:61-325:73:
    | ///|
    | test "Placeholder in IN list" {
    |   let sql = "SELECT * FROM users WHERE id IN (?, ?, ?);"
325 |   let stmt = parse_sql(dialect=MySQL::{ }, sql).stmts[0] |> pretty_print
    |                                                             ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/parameterized.mbt:342:64-342:76:
    | ///|
    | test "PostgreSQL numbered placeholder in CASE expression" {
    |   let sql = "SELECT CASE WHEN age > $1 THEN 'old' ELSE 'young' END FROM users;"
342 |   let stmt = parse_sql(dialect=Postgres::{ }, sql).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/parameterized.mbt:360:64-360:76:
    | ///|
    | test "Named parameter in JOIN condition" {
    |   let sql = "SELECT * FROM users u JOIN orders o ON u.id = o.user_id WHERE o.total > :min_total;"
360 |   let stmt = parse_sql(dialect=Postgres::{ }, sql).stmts[0] |> pretty_print
    |                                                                ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/parameterized.mbt:382:63-382:75:
    |   let sql1 = "SELECT * FROM users WHERE id = ?;"
    |   let sql2 = "SELECT * FROM users WHERE id = $1;"
    |   let sql3 = "SELECT * FROM users WHERE id = :user_id;"
382 |   let stmt1 = parse_sql(dialect=MySQL::{ }, sql1).stmts[0] |> pretty_print
    |                                                               ^^^^^^^^^^^^
    |   let stmt2 = parse_sql(dialect=Postgres::{ }, sql2).stmts[0] |> pretty_print
    |   let stmt3 = parse_sql(dialect=Postgres::{ }, sql3).stmts[0] |> pretty_print

<WORKDIR>/src/parameterized.mbt:383:66-383:78:
    |   let sql2 = "SELECT * FROM users WHERE id = $1;"
    |   let sql3 = "SELECT * FROM users WHERE id = :user_id;"
    |   let stmt1 = parse_sql(dialect=MySQL::{ }, sql1).stmts[0] |> pretty_print
383 |   let stmt2 = parse_sql(dialect=Postgres::{ }, sql2).stmts[0] |> pretty_print
    |                                                                  ^^^^^^^^^^^^
    |   let stmt3 = parse_sql(dialect=Postgres::{ }, sql3).stmts[0] |> pretty_print
    |   inspect(

<WORKDIR>/src/parameterized.mbt:384:66-384:78:
    |   let sql3 = "SELECT * FROM users WHERE id = :user_id;"
    |   let stmt1 = parse_sql(dialect=MySQL::{ }, sql1).stmts[0] |> pretty_print
    |   let stmt2 = parse_sql(dialect=Postgres::{ }, sql2).stmts[0] |> pretty_print
384 |   let stmt3 = parse_sql(dialect=Postgres::{ }, sql3).stmts[0] |> pretty_print
    |                                                                  ^^^^^^^^^^^^
    |   inspect(
    |     stmt1,

<WORKDIR>/src/parameterized.mbt:423:61-423:73:
    | ///|
    | test "Placeholder in DELETE statement" {
    |   let sql = "DELETE FROM users WHERE id = ?;"
423 |   let stmt = parse_sql(dialect=MySQL::{ }, sql).stmts[0] |> pretty_print
    |                                                             ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/parser.mbt:789:34-789:46:
    |     Token::Identifier("t"),
    |     Token::Semicolon,
    |   ]
789 |   let stmt = parse(tokens)[0] |> pretty_print
    |                                  ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/parser.mbt:804:34-804:46:
    | ///|
    | test "Parse USE database statement" {
    |   let tokens = [Keyword(Use), Token::Identifier("mydb"), Token::Semicolon]
804 |   let stmt = parse(tokens)[0] |> pretty_print
    |                                  ^^^^^^^^^^^^
    |   inspect(stmt, content="USE mydb;")
    | }

<WORKDIR>/src/parser.mbt:817:34-817:46:
    |     Token::Identifier("production"),
    |     Token::Semicolon,
    |   ]
817 |   let stmt = parse(tokens)[0] |> pretty_print
    |                                  ^^^^^^^^^^^^
    |   inspect(stmt, content="USE company.production;")
    | }

<WORKDIR>/src/parser.mbt:828:34-828:46:
    |     Token::Identifier("my database"),
    |     Token::Semicolon,
    |   ]
828 |   let stmt = parse(tokens)[0] |> pretty_print
    |                                  ^^^^^^^^^^^^
    |   inspect(stmt, content="USE `my database`;")
    | }

<WORKDIR>/src/parser.mbt:841:34-841:46:
    |     Token::StringLiteral("/tmp/users.csv"),
    |     Token::Semicolon,
    |   ]
841 |   let stmt = parse(tokens)[0] |> pretty_print
    |                                  ^^^^^^^^^^^^
    |   inspect(stmt, content="COPY users TO '/tmp/users.csv';")
    | }

<WORKDIR>/src/parser.mbt:860:34-860:46:
    |     Token::RParen,
    |     Token::Semicolon,
    |   ]
860 |   let stmt = parse(tokens)[0] |> pretty_print
    |                                  ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/parser.mbt:881:34-881:46:
    |     Keyword(Stdout),
    |     Token::Semicolon,
    |   ]
881 |   let stmt = parse(tokens)[0] |> pretty_print
    |                                  ^^^^^^^^^^^^
    |   inspect(stmt, content="COPY orders (id, amount) TO STDOUT;")
    | }

<WORKDIR>/src/parser.mbt:909:34-909:46:
    |     Token::RParen,
    |     Token::Semicolon,
    |   ]
909 |   let stmt = parse(tokens)[0] |> pretty_print
    |                                  ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/parser.mbt:938:34-938:46:
    |     Token::RParen,
    |     Token::Semicolon,
    |   ]
938 |   let stmt = parse(tokens)[0] |> pretty_print
    |                                  ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/postgres.mbt:96:67-96:79:
   | ///|
   | test "PostgreSQL LISTEN" {
   |   let tokens = "LISTEN my_channel;"
96 |   let stmt = parse_sql(dialect=Postgres::{ }, tokens).stmts[0] |> pretty_print
   |                                                                   ^^^^^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src/postgres.mbt:108:67-108:79:
    | ///|
    | test "PostgreSQL NOTIFY without payload" {
    |   let tokens = "NOTIFY my_channel;"
108 |   let stmt = parse_sql(dialect=Postgres::{ }, tokens).stmts[0] |> pretty_print
    |                                                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/postgres.mbt:120:67-120:79:
    | ///|
    | test "PostgreSQL NOTIFY with payload" {
    |   let tokens = "NOTIFY my_channel, 'hello world';"
120 |   let stmt = parse_sql(dialect=Postgres::{ }, tokens).stmts[0] |> pretty_print
    |                                                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/postgres.mbt:134:67-134:79:
    | 
    | test "PostgreSQL ARRAY syntax with integers" {
    |   let tokens = "SELECT ARRAY[1, 2, 3, 4] FROM test;"
134 |   let stmt = parse_sql(dialect=Postgres::{ }, tokens).stmts[0] |> pretty_print
    |                                                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/postgres.mbt:149:67-149:79:
    | ///|
    | test "PostgreSQL bracket array syntax" {
    |   let tokens = "SELECT [1, 2, 3] FROM test;"
149 |   let stmt = parse_sql(dialect=Postgres::{ }, tokens).stmts[0] |> pretty_print
    |                                                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/postgres.mbt:164:67-164:79:
    | ///|
    | test "PostgreSQL empty ARRAY" {
    |   let tokens = "SELECT ARRAY[] FROM test;"
164 |   let stmt = parse_sql(dialect=Postgres::{ }, tokens).stmts[0] |> pretty_print
    |                                                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/postgres.mbt:179:67-179:79:
    | ///|
    | test "PostgreSQL ARRAY with strings" {
    |   let tokens = "SELECT ARRAY['hello', 'world'] FROM test;"
179 |   let stmt = parse_sql(dialect=Postgres::{ }, tokens).stmts[0] |> pretty_print
    |                                                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/postgres.mbt:194:67-194:79:
    | ///|
    | test "PostgreSQL nested arrays" {
    |   let tokens = "SELECT ARRAY[ARRAY[1, 2], ARRAY[3, 4]] FROM test;"
194 |   let stmt = parse_sql(dialect=Postgres::{ }, tokens).stmts[0] |> pretty_print
    |                                                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/postgres.mbt:209:67-209:79:
    | ///|
    | test "PostgreSQL mixed bracket and ARRAY syntax" {
    |   let tokens = "SELECT ARRAY[[1, 2], [3, 4]] FROM test;"
209 |   let stmt = parse_sql(dialect=Postgres::{ }, tokens).stmts[0] |> pretty_print
    |                                                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/postgres.mbt:305:67-305:79:
    | 
    | test "PostgreSQL JSON extract operator" {
    |   let tokens = "SELECT data -> 'key' FROM json_table;"
305 |   let stmt = parse_sql(dialect=Postgres::{ }, tokens).stmts[0] |> pretty_print
    |                                                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/postgres.mbt:320:67-320:79:
    | ///|
    | test "PostgreSQL JSON extract text operator" {
    |   let tokens = "SELECT data ->> 'key' FROM json_table;"
320 |   let stmt = parse_sql(dialect=Postgres::{ }, tokens).stmts[0] |> pretty_print
    |                                                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/postgres.mbt:335:67-335:79:
    | ///|
    | test "PostgreSQL JSON path extract operator" {
    |   let tokens = "SELECT data #> ARRAY['key', 'subkey'] FROM json_table;"
335 |   let stmt = parse_sql(dialect=Postgres::{ }, tokens).stmts[0] |> pretty_print
    |                                                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/postgres.mbt:350:67-350:79:
    | ///|
    | test "PostgreSQL JSON contains operator" {
    |   let tokens = "SELECT data @> '{\"key\":\"value\"}' FROM json_table;"
350 |   let stmt = parse_sql(dialect=Postgres::{ }, tokens).stmts[0] |> pretty_print
    |                                                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/postgres.mbt:365:67-365:79:
    | ///|
    | test "PostgreSQL JSON contained in operator" {
    |   let tokens = "SELECT '{\"a\":1}' <@ data FROM json_table;"
365 |   let stmt = parse_sql(dialect=Postgres::{ }, tokens).stmts[0] |> pretty_print
    |                                                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/postgres.mbt:382:67-382:79:
    | 
    | test "PostgreSQL COUNT with FILTER" {
    |   let tokens = "SELECT count(*) FILTER (WHERE active) FROM users;"
382 |   let stmt = parse_sql(dialect=Postgres::{ }, tokens).stmts[0] |> pretty_print
    |                                                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/postgres.mbt:397:67-397:79:
    | ///|
    | test "PostgreSQL COUNT without FILTER" {
    |   let tokens = "SELECT count(*) FROM users;"
397 |   let stmt = parse_sql(dialect=Postgres::{ }, tokens).stmts[0] |> pretty_print
    |                                                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/postgres.mbt:412:67-412:79:
    | ///|
    | test "PostgreSQL SUM with FILTER" {
    |   let tokens = "SELECT sum(amount) FILTER (WHERE status = 'completed') FROM orders;"
412 |   let stmt = parse_sql(dialect=Postgres::{ }, tokens).stmts[0] |> pretty_print
    |                                                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/postgres.mbt:427:67-427:79:
    | ///|
    | test "PostgreSQL multiple aggregations with FILTER" {
    |   let tokens = "SELECT count(*) FILTER (WHERE active), avg(age) FILTER (WHERE age > 18) FROM users;"
427 |   let stmt = parse_sql(dialect=Postgres::{ }, tokens).stmts[0] |> pretty_print
    |                                                                   ^^^^^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/prepare.mbt:7:35-7:47:
  | ///| (escaped)
  | test "PREPARE simple SELECT" { (escaped)
  |   let sql = "PREPARE stmt AS SELECT * FROM users WHERE id = ?" (escaped)
7 |   let stmt = parse_sql(sql)[0] |> pretty_print (escaped)
  |                                   ^^^^^^^^^^^^ (escaped)
  |   inspect( (escaped)
  |     stmt, (escaped)

<WORKDIR>/src/prepare.mbt:24:35-24:47:
   | ///| (escaped)
   | test "PREPARE with data types" { (escaped)
   |   let sql = "PREPARE stmt (INTEGER, VARCHAR(50)) AS SELECT * FROM users WHERE id = ? AND name = ?" (escaped)
24 |   let stmt = parse_sql(sql)[0] |> pretty_print (escaped)
   |                                   ^^^^^^^^^^^^ (escaped)
   |   inspect( (escaped)
   |     stmt, (escaped)

<WORKDIR>/src/prepare.mbt:42:35-42:47:
   | ///| (escaped)
   | test "PREPARE INSERT statement" { (escaped)
   |   let sql = "PREPARE insert_user AS INSERT INTO users (name, email) VALUES (?, ?)" (escaped)
42 |   let stmt = parse_sql(sql)[0] |> pretty_print (escaped)
   |                                   ^^^^^^^^^^^^ (escaped)
   |   inspect( (escaped)
   |     stmt, (escaped)

<WORKDIR>/src/prepare.mbt:52:35-52:47:
   | ///| (escaped)
   | test "PREPARE UPDATE statement" { (escaped)
   |   let sql = "PREPARE update_user AS UPDATE users SET name = ? WHERE id = ?" (escaped)
52 |   let stmt = parse_sql(sql)[0] |> pretty_print (escaped)
   |                                   ^^^^^^^^^^^^ (escaped)
   |   inspect( (escaped)
   |     stmt, (escaped)

<WORKDIR>/src/prepare.mbt:66:35-66:47:
   | ///| (escaped)
   | test "PREPARE DELETE statement" { (escaped)
   |   let sql = "PREPARE delete_user AS DELETE FROM users WHERE id = ?" (escaped)
66 |   let stmt = parse_sql(sql)[0] |> pretty_print (escaped)
   |                                   ^^^^^^^^^^^^ (escaped)
   |   inspect( (escaped)
   |     stmt, (escaped)

<WORKDIR>/src/prepare.mbt:79:35-79:47:
   | ///| (escaped)
   | test "PREPARE with PostgreSQL numbered placeholders" { (escaped)
   |   let sql = "PREPARE stmt (INTEGER, TEXT) AS SELECT * FROM users WHERE id = $1 AND name = $2" (escaped)
79 |   let stmt = parse_sql(sql)[0] |> pretty_print (escaped)
   |                                   ^^^^^^^^^^^^ (escaped)
   |   inspect( (escaped)
   |     stmt, (escaped)

<WORKDIR>/src/prepare.mbt:97:35-97:47:
   | ///| (escaped)
   | test "PREPARE with named parameters" { (escaped)
   |   let sql = "PREPARE stmt AS SELECT * FROM users WHERE id = :id AND name = :name" (escaped)
97 |   let stmt = parse_sql(sql)[0] |> pretty_print (escaped)
   |                                   ^^^^^^^^^^^^ (escaped)
   |   inspect( (escaped)
   |     stmt, (escaped)

<WORKDIR>/src/prepare.mbt:115:35-115:47:
    | ///| (escaped)
    | test "PREPARE with complex query" { (escaped)
    |   let sql = "PREPARE complex_query AS SELECT u.id, u.name, COUNT(o.id) as order_count FROM users u LEFT JOIN orders o ON u.id = o.user_id WHERE u.is_active = ? GROUP BY u.id, u.name HAVING COUNT(o.id) > ?" (escaped)
115 |   let stmt = parse_sql(sql)[0] |> pretty_print (escaped)
    |                                   ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/prepare.mbt:140:35-140:47:
    | ///| (escaped)
    | test "PREPARE with subquery" { (escaped)
    |   let sql = "PREPARE subquery_stmt AS SELECT * FROM users WHERE id IN (SELECT user_id FROM orders WHERE amount > ?)" (escaped)
140 |   let stmt = parse_sql(sql)[0] |> pretty_print (escaped)
    |                                   ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/prepare.mbt:164:35-164:47:
    | ///| (escaped)
    | test "PREPARE with window function" { (escaped)
    |   let sql = "PREPARE window_stmt AS SELECT name, salary, RANK() OVER (ORDER BY salary DESC) as rank FROM employees WHERE department = ?" (escaped)
164 |   let stmt = parse_sql(sql)[0] |> pretty_print (escaped)
    |                                   ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/prepare.mbt:183:35-183:47:
    | ///| (escaped)
    | test "PREPARE with CTE" { (escaped)
    |   let sql = "PREPARE cte_stmt AS WITH recent_orders AS (SELECT * FROM orders WHERE created_at > ?) SELECT * FROM recent_orders WHERE status = ?" (escaped)
183 |   let stmt = parse_sql(sql)[0] |> pretty_print (escaped)
    |                                   ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/prepare.mbt:208:35-208:47:
    | ///| (escaped)
    | test "EXECUTE simple" { (escaped)
    |   let sql = "EXECUTE stmt" (escaped)
208 |   let stmt = parse_sql(sql)[0] |> pretty_print (escaped)
    |                                   ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/prepare.mbt:220:35-220:47:
    | ///| (escaped)
    | test "EXECUTE with parenthesized parameters" { (escaped)
    |   let sql = "EXECUTE stmt(1, 'John')" (escaped)
220 |   let stmt = parse_sql(sql)[0] |> pretty_print (escaped)
    |                                   ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/prepare.mbt:232:35-232:47:
    | ///| (escaped)
    | test "EXECUTE with USING clause" { (escaped)
    |   let sql = "EXECUTE stmt USING 1, 'John'" (escaped)
232 |   let stmt = parse_sql(sql)[0] |> pretty_print (escaped)
    |                                   ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/prepare.mbt:244:35-244:47:
    | ///| (escaped)
    | test "EXECUTE with complex expressions" { (escaped)
    |   let sql = "EXECUTE stmt USING 1 + 2, CONCAT('Hello', ' World')" (escaped)
244 |   let stmt = parse_sql(sql)[0] |> pretty_print (escaped)
    |                                   ^^^^^^^^^^^^ (escaped)
    |   inspect(stmt, content="EXECUTE stmt USING 1 + 2, concat('Hello', ' World');") (escaped)
    | } (escaped)

<WORKDIR>/src/prepare.mbt:251:35-251:47:
    | ///| (escaped)
    | test "EXECUTE IMMEDIATE" { (escaped)
    |   let sql = "EXECUTE IMMEDIATE" (escaped)
251 |   let stmt = parse_sql(sql)[0] |> pretty_print (escaped)
    |                                   ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/prepare.mbt:263:35-263:47:
    | ///| (escaped)
    | test "EXECUTE IMMEDIATE with INTO" { (escaped)
    |   let sql = "EXECUTE IMMEDIATE INTO v_result" (escaped)
263 |   let stmt = parse_sql(sql)[0] |> pretty_print (escaped)
    |                                   ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/prepare.mbt:275:35-275:47:
    | ///| (escaped)
    | test "EXECUTE IMMEDIATE with INTO and USING" { (escaped)
    |   let sql = "EXECUTE IMMEDIATE INTO v_result USING 1, 'test'" (escaped)
275 |   let stmt = parse_sql(sql)[0] |> pretty_print (escaped)
    |                                   ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/prepare.mbt:287:35-287:47:
    | ///| (escaped)
    | test "EXECUTE with multiple INTO variables" { (escaped)
    |   let sql = "EXECUTE IMMEDIATE INTO v_name, v_email, v_age" (escaped)
287 |   let stmt = parse_sql(sql)[0] |> pretty_print (escaped)
    |                                   ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/prepare.mbt:299:35-299:47:
    | ///| (escaped)
    | test "DEALLOCATE simple" { (escaped)
    |   let sql = "DEALLOCATE stmt" (escaped)
299 |   let stmt = parse_sql(sql)[0] |> pretty_print (escaped)
    |                                   ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/prepare.mbt:311:35-311:47:
    | ///| (escaped)
    | test "DEALLOCATE with PREPARE keyword" { (escaped)
    |   let sql = "DEALLOCATE PREPARE stmt" (escaped)
311 |   let stmt = parse_sql(sql)[0] |> pretty_print (escaped)
    |                                   ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/prepare.mbt:324:37-324:49:
    | test "PREPARE and EXECUTE separately" { (escaped)
    |   let sql1 = "PREPARE user_query AS SELECT * FROM users WHERE id = ?" (escaped)
    |   let sql2 = "EXECUTE user_query(123)" (escaped)
324 |   let stmt1 = parse_sql(sql1)[0] |> pretty_print (escaped)
    |                                     ^^^^^^^^^^^^ (escaped)
    |   let stmt2 = parse_sql(sql2)[0] |> pretty_print (escaped)
    |   inspect( (escaped)

<WORKDIR>/src/prepare.mbt:325:37-325:49:
    |   let sql1 = "PREPARE user_query AS SELECT * FROM users WHERE id = ?" (escaped)
    |   let sql2 = "EXECUTE user_query(123)" (escaped)
    |   let stmt1 = parse_sql(sql1)[0] |> pretty_print (escaped)
325 |   let stmt2 = parse_sql(sql2)[0] |> pretty_print (escaped)
    |                                     ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt1, (escaped)

<WORKDIR>/src/prepare.mbt:348:35-348:47:
    | ///| (escaped)
    | test "PREPARE with multiple data types" { (escaped)
    |   let sql = "PREPARE stmt (INTEGER, VARCHAR(100), DOUBLE) AS SELECT * FROM users WHERE id = ?" (escaped)
348 |   let stmt = parse_sql(sql)[0] |> pretty_print (escaped)
    |                                   ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tcl.mbt:172:38-172:50:
    |  (escaped)
    | test "BEGIN statement" { (escaped)
    |   let tokens = "BEGIN;" (escaped)
172 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tcl.mbt:184:38-184:50:
    | ///| (escaped)
    | test "BEGIN WORK statement" { (escaped)
    |   let tokens = "BEGIN WORK;" (escaped)
184 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tcl.mbt:196:38-196:50:
    | ///| (escaped)
    | test "BEGIN TRANSACTION statement" { (escaped)
    |   let tokens = "BEGIN TRANSACTION;" (escaped)
196 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tcl.mbt:208:38-208:50:
    | ///| (escaped)
    | test "START TRANSACTION statement" { (escaped)
    |   let tokens = "START TRANSACTION;" (escaped)
208 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tcl.mbt:220:38-220:50:
    | ///| (escaped)
    | test "COMMIT statement" { (escaped)
    |   let tokens = "COMMIT;" (escaped)
220 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tcl.mbt:232:38-232:50:
    | ///| (escaped)
    | test "COMMIT WORK statement" { (escaped)
    |   let tokens = "COMMIT WORK;" (escaped)
232 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tcl.mbt:244:38-244:50:
    | ///| (escaped)
    | test "ROLLBACK statement" { (escaped)
    |   let tokens = "ROLLBACK;" (escaped)
244 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tcl.mbt:256:38-256:50:
    | ///| (escaped)
    | test "ROLLBACK TO SAVEPOINT statement" { (escaped)
    |   let tokens = "ROLLBACK TO SAVEPOINT sp1;" (escaped)
256 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tcl.mbt:268:38-268:50:
    | ///| (escaped)
    | test "SAVEPOINT statement" { (escaped)
    |   let tokens = "SAVEPOINT sp1;" (escaped)
268 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tcl.mbt:280:38-280:50:
    | ///| (escaped)
    | test "RELEASE SAVEPOINT statement" { (escaped)
    |   let tokens = "RELEASE SAVEPOINT sp1;" (escaped)
280 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/dialect_test.mbt:11:43-11:55:
   | test "MySQL SHOW TABLES statement" { (escaped)
   |   let sql = @sqlparser.parse_sql("SHOW TABLES;") (escaped)
   |   inspect(sql.stmts.length(), content="1") (escaped)
11 |   let pretty = sql.stmts[0] |> @sqlparser.pretty_print (escaped)
   |                                           ^^^^^^^^^^^^ (escaped)
   |   inspect(pretty, content="SHOW TABLES;") (escaped)
   | } (escaped)

<WORKDIR>/src/tests/dialect_test.mbt:19:43-19:55:
   | test "MySQL SHOW COLUMNS with FROM" { (escaped)
   |   let sql = @sqlparser.parse_sql("SHOW COLUMNS FROM users;") (escaped)
   |   inspect(sql.stmts.length(), content="1") (escaped)
19 |   let pretty = sql.stmts[0] |> @sqlparser.pretty_print (escaped)
   |                                           ^^^^^^^^^^^^ (escaped)
   |   inspect(pretty, content="SHOW COLUMNS FROM users;") (escaped)
   | } (escaped)

<WORKDIR>/src/tests/dialect_test.mbt:27:43-27:55:
   | test "MySQL SHOW TABLES with LIKE filter" { (escaped)
   |   let sql = @sqlparser.parse_sql("SHOW TABLES LIKE 'user%';") (escaped)
   |   inspect(sql.stmts.length(), content="1") (escaped)
27 |   let pretty = sql.stmts[0] |> @sqlparser.pretty_print (escaped)
   |                                           ^^^^^^^^^^^^ (escaped)
   |   inspect(pretty, content="SHOW TABLES LIKE 'user%';") (escaped)
   | } (escaped)

<WORKDIR>/src/tests/dialect_test.mbt:35:43-35:55:
   | test "MySQL SHOW STATUS statement" { (escaped)
   |   let sql = @sqlparser.parse_sql("SHOW STATUS;") (escaped)
   |   inspect(sql.stmts.length(), content="1") (escaped)
35 |   let pretty = sql.stmts[0] |> @sqlparser.pretty_print (escaped)
   |                                           ^^^^^^^^^^^^ (escaped)
   |   inspect(pretty, content="SHOW STATUS;") (escaped)
   | } (escaped)

<WORKDIR>/src/tests/dialect_test.mbt:43:43-43:55:
   | test "MySQL SHOW DATABASES statement" { (escaped)
   |   let sql = @sqlparser.parse_sql("SHOW DATABASES;") (escaped)
   |   inspect(sql.stmts.length(), content="1") (escaped)
43 |   let pretty = sql.stmts[0] |> @sqlparser.pretty_print (escaped)
   |                                           ^^^^^^^^^^^^ (escaped)
   |   inspect(pretty, content="SHOW DATABASES;") (escaped)
   | } (escaped)

<WORKDIR>/src/tests/dialect_test.mbt:53:43-53:55:
   | test "MySQL backtick quoted table names" { (escaped)
   |   let sql = @sqlparser.parse_sql("SELECT * FROM `table name`;") (escaped)
   |   inspect(sql.stmts.length(), content="1") (escaped)
53 |   let pretty = sql.stmts[0] |> @sqlparser.pretty_print (escaped)
   |                                           ^^^^^^^^^^^^ (escaped)
   |   inspect(pretty, content="SELECT\\n  *\\nFROM\\n  `table name`;") (escaped)
   | } (escaped)

<WORKDIR>/src/tests/dialect_test.mbt:69:43-69:55:
   | test "MySQL backtick quoted database.table" { (escaped)
   |   let sql = @sqlparser.parse_sql("SELECT * FROM `my db`.`my table`;") (escaped)
   |   inspect(sql.stmts.length(), content="1") (escaped)
69 |   let pretty = sql.stmts[0] |> @sqlparser.pretty_print (escaped)
   |                                           ^^^^^^^^^^^^ (escaped)
   |   inspect(pretty, content="SELECT\\n  *\\nFROM\\n  `my db`.`my table`;") (escaped)
   | } (escaped)

<WORKDIR>/src/tests/dialect_test.mbt:123:43-123:55:
    | test "MySQL SHOW COLUMNS with complex table name" { (escaped)
    |   let sql = @sqlparser.parse_sql("SHOW COLUMNS FROM `user data`;") (escaped)
    |   inspect(sql.stmts.length(), content="1") (escaped)
123 |   let pretty = sql.stmts[0] |> @sqlparser.pretty_print (escaped)
    |                                           ^^^^^^^^^^^^ (escaped)
    |   inspect(pretty, content="SHOW COLUMNS FROM `user data`;") (escaped)
    | } (escaped)

<WORKDIR>/src/tests/dialect_test.mbt:131:43-131:55:
    | test "MySQL SHOW TABLES with complex pattern" { (escaped)
    |   let sql = @sqlparser.parse_sql("SHOW TABLES LIKE 'test_%_data';") (escaped)
    |   inspect(sql.stmts.length(), content="1") (escaped)
131 |   let pretty = sql.stmts[0] |> @sqlparser.pretty_print (escaped)
    |                                           ^^^^^^^^^^^^ (escaped)
    |   inspect(pretty, content="SHOW TABLES LIKE 'test_%_data';") (escaped)
    | } (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:23:67-23:79:
   |  (escaped)
   | ///| (escaped)
   | test "TPCH 1" { (escaped)
23 |   let stmt = read_and_parse("src/tests/tpch/1.sql") |> @sqlparser.pretty_print (escaped)
   |                                                                   ^^^^^^^^^^^^ (escaped)
   |   inspect( (escaped)
   |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:54:67-54:79:
   |  (escaped)
   | ///| (escaped)
   | test "TPCH 2" { (escaped)
54 |   let stmt = read_and_parse("src/tests/tpch/2.sql") |> @sqlparser.pretty_print (escaped)
   |                                                                   ^^^^^^^^^^^^ (escaped)
   |   inspect( (escaped)
   |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:107:67-107:79:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 3" { (escaped)
107 |   let stmt = read_and_parse("src/tests/tpch/3.sql") |> @sqlparser.pretty_print (escaped)
    |                                                                   ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:139:67-139:79:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 4" { (escaped)
139 |   let stmt = read_and_parse("src/tests/tpch/4.sql") |> @sqlparser.pretty_print (escaped)
    |                                                                   ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:170:67-170:79:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 5" { (escaped)
170 |   let stmt = read_and_parse("src/tests/tpch/5.sql") |> @sqlparser.pretty_print (escaped)
    |                                                                   ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:204:67-204:79:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 6" { (escaped)
204 |   let stmt = read_and_parse("src/tests/tpch/6.sql") |> @sqlparser.pretty_print (escaped)
    |                                                                   ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:223:67-223:79:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 7" { (escaped)
223 |   let stmt = read_and_parse("src/tests/tpch/7.sql") |> @sqlparser.pretty_print (escaped)
    |                                                                   ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:276:67-276:79:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 8" { (escaped)
276 |   let stmt = read_and_parse("src/tests/tpch/8.sql") |> @sqlparser.pretty_print (escaped)
    |                                                                   ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:323:67-323:79:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 9" { (escaped)
323 |   let stmt = read_and_parse("src/tests/tpch/9.sql") |> @sqlparser.pretty_print (escaped)
    |                                                                   ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:365:68-365:80:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 10" { (escaped)
365 |   let stmt = read_and_parse("src/tests/tpch/10.sql") |> @sqlparser.pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:406:68-406:80:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 11" { (escaped)
406 |   let stmt = read_and_parse("src/tests/tpch/11.sql") |> @sqlparser.pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:444:68-444:80:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 12" { (escaped)
444 |   let stmt = read_and_parse("src/tests/tpch/12.sql") |> @sqlparser.pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:480:68-480:80:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 13" { (escaped)
480 |   let stmt = read_and_parse("src/tests/tpch/13.sql") |> @sqlparser.pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:510:68-510:80:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 14" { (escaped)
510 |   let stmt = read_and_parse("src/tests/tpch/14.sql") |> @sqlparser.pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:532:68-532:80:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 15" { (escaped)
532 |   let stmt = read_and_parse("src/tests/tpch/15.sql") |> @sqlparser.pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:575:68-575:80:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 16" { (escaped)
575 |   let stmt = read_and_parse("src/tests/tpch/16.sql") |> @sqlparser.pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:615:68-615:80:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 17" { (escaped)
615 |   let stmt = read_and_parse("src/tests/tpch/17.sql") |> @sqlparser.pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:642:68-642:80:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 18" { (escaped)
642 |   let stmt = read_and_parse("src/tests/tpch/18.sql") |> @sqlparser.pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:685:68-685:80:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 19" { (escaped)
685 |   let stmt = read_and_parse("src/tests/tpch/19.sql") |> @sqlparser.pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:731:68-731:80:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 20" { (escaped)
731 |   let stmt = read_and_parse("src/tests/tpch/20.sql") |> @sqlparser.pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:778:68-778:80:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 21" { (escaped)
778 |   let stmt = read_and_parse("src/tests/tpch/21.sql") |> @sqlparser.pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:827:68-827:80:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 22" { (escaped)
827 |   let stmt = read_and_parse("src/tests/tpch/22.sql") |> @sqlparser.pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

```
