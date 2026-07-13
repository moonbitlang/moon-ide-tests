# sqlparser rename pretty_print src/ast.mbt:2:24

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
$ run_moon_ide moon ide rename 'pretty_print' 'pretty_print_renamed' --loc 'src/ast.mbt:2:24'
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
