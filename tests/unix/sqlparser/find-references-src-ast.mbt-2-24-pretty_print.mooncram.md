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
Found 298 references for symbol 'pretty_print':
<WORKDIR>/src/ast.mbt:2:24-2:36:
  | ///| (escaped)
2 | pub fn[T : @pp.Pretty] pretty_print(obj : T) -> String { (escaped)
  |                        ^^^^^^^^^^^^ (escaped)
  |   @pp.pretty(obj).to_string() (escaped)
  | } (escaped)

<WORKDIR>/src/bigquery.mbt:71:68-71:80:
   |  (escaped)
   | test "BigQuery named parameter" { (escaped)
   |   let tokens = "SELECT * FROM users WHERE id = @user_id;" (escaped)
71 |   let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print (escaped)
   |                                                                    ^^^^^^^^^^^^ (escaped)
   |   inspect( (escaped)
   |     stmt, (escaped)

<WORKDIR>/src/bigquery.mbt:88:68-88:80:
   | ///| (escaped)
   | test "BigQuery positional parameter" { (escaped)
   |   let tokens = "SELECT * FROM users WHERE id = ?;" (escaped)
88 |   let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print (escaped)
   |                                                                    ^^^^^^^^^^^^ (escaped)
   |   inspect( (escaped)
   |     stmt, (escaped)

<WORKDIR>/src/bigquery.mbt:105:68-105:80:
    | ///| (escaped)
    | test "BigQuery mixed parameters" { (escaped)
    |   let tokens = "SELECT * FROM users WHERE id = @user_id AND age > ?;" (escaped)
105 |   let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/bigquery.mbt:123:68-123:80:
    | ///| (escaped)
    | test "BigQuery multiple named parameters" { (escaped)
    |   let tokens = "SELECT @field FROM @table WHERE @condition = @value;" (escaped)
123 |   let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/bigquery.mbt:142:65-142:77:
    |  (escaped)
    | test "Named parameters treated as identifiers in MySQL" { (escaped)
    |   let tokens = "SELECT @user_id FROM users;" (escaped)
142 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/dcl.mbt:247:38-247:50:
    |  (escaped)
    | test "GRANT SELECT statement" { (escaped)
    |   let tokens = "GRANT SELECT ON users TO alice;" (escaped)
247 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/dcl.mbt:259:38-259:50:
    | ///| (escaped)
    | test "GRANT multiple privileges statement" { (escaped)
    |   let tokens = "GRANT SELECT, INSERT, UPDATE ON users TO alice, bob;" (escaped)
259 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/dcl.mbt:271:38-271:50:
    | ///| (escaped)
    | test "GRANT with column specification" { (escaped)
    |   let tokens = "GRANT SELECT (name, email), UPDATE (email) ON users TO alice;" (escaped)
271 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/dcl.mbt:283:38-283:50:
    | ///| (escaped)
    | test "GRANT ALL PRIVILEGES statement" { (escaped)
    |   let tokens = "GRANT ALL PRIVILEGES ON users TO alice WITH GRANT OPTION;" (escaped)
283 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/dcl.mbt:295:38-295:50:
    | ///| (escaped)
    | test "REVOKE SELECT statement" { (escaped)
    |   let tokens = "REVOKE SELECT ON users FROM alice;" (escaped)
295 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/dcl.mbt:307:38-307:50:
    | ///| (escaped)
    | test "REVOKE with CASCADE" { (escaped)
    |   let tokens = "REVOKE ALL PRIVILEGES ON users FROM alice CASCADE;" (escaped)
307 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/dcl.mbt:319:38-319:50:
    | ///| (escaped)
    | test "REVOKE GRANT OPTION FOR" { (escaped)
    |   let tokens = "REVOKE GRANT OPTION FOR SELECT ON users FROM alice RESTRICT;" (escaped)
319 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:166:38-166:50:
    | /// CREATE INDEX Tests (escaped)
    | test "CREATE INDEX - Simple" { (escaped)
    |   let tokens = "CREATE INDEX idx_name ON users (email);" (escaped)
166 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:178:38-178:50:
    | ///| (escaped)
    | test "CREATE UNIQUE INDEX" { (escaped)
    |   let tokens = "CREATE UNIQUE INDEX idx_unique_email ON users (email);" (escaped)
178 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:190:38-190:50:
    | ///| (escaped)
    | test "CREATE INDEX with multiple columns" { (escaped)
    |   let tokens = "CREATE INDEX idx_name_age ON users (name, age DESC);" (escaped)
190 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:202:38-202:50:
    | ///| (escaped)
    | test "CREATE INDEX with USING method" { (escaped)
    |   let tokens = "CREATE INDEX idx_hash ON users USING HASH (id);" (escaped)
202 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:214:38-214:50:
    | ///| (escaped)
    | test "CREATE INDEX with WHERE clause" { (escaped)
    |   let tokens = "CREATE INDEX idx_active_users ON users (created_at) WHERE active = true;" (escaped)
214 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:226:38-226:50:
    | ///| (escaped)
    | test "CREATE INDEX CONCURRENTLY" { (escaped)
    |   let tokens = "CREATE INDEX CONCURRENTLY idx_concurrent ON users (email);" (escaped)
226 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:238:38-238:50:
    | ///| (escaped)
    | test "CREATE INDEX IF NOT EXISTS" { (escaped)
    |   let tokens = "CREATE INDEX IF NOT EXISTS idx_exists ON users (email);" (escaped)
238 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:250:38-250:50:
    | ///| (escaped)
    | test "CREATE INDEX with NULLS ordering" { (escaped)
    |   let tokens = "CREATE INDEX idx_ordered ON users (name ASC NULLS FIRST, age DESC NULLS LAST);" (escaped)
250 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:262:38-262:50:
    | ///| (escaped)
    | test "CREATE INDEX with expression" { (escaped)
    |   let tokens = "CREATE INDEX idx_lower_email ON users (LOWER(email));" (escaped)
262 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:274:38-274:50:
    | ///| (escaped)
    | test "CREATE UNIQUE INDEX with all options" { (escaped)
    |   let tokens = "CREATE UNIQUE INDEX CONCURRENTLY IF NOT EXISTS idx_complex ON users USING BTREE (email ASC NULLS FIRST, created_at DESC) WHERE active = true;" (escaped)
274 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:286:38-286:50:
    | ///| (escaped)
    | test "Create table" { (escaped)
    |   let tokens = "CREATE TABLE users;" (escaped)
286 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:300:38-300:50:
    | ///| (escaped)
    | test "Create table IF NOT EXISTS" { (escaped)
    |   let tokens = "CREATE TABLE IF NOT EXISTS users (id INTEGER);" (escaped)
300 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:314:38-314:50:
    | ///| (escaped)
    | test "Create table AS SELECT" { (escaped)
    |   let tokens = "CREATE TABLE students_2 AS SELECT * FROM students;" (escaped)
314 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:329:38-329:50:
    | ///| (escaped)
    | test "Create table AS SELECT with WHERE" { (escaped)
    |   let tokens = "CREATE TABLE students_3 AS SELECT city, grade FROM students WHERE grade > 3.0;" (escaped)
329 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:435:38-435:50:
    | ///| (escaped)
    | test "Create table with two columns" { (escaped)
    |   let tokens = "CREATE TABLE users (id INTEGER, name INTEGER);" (escaped)
435 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:461:38-461:50:
    |     #|  description TEXT, (escaped)
    |     #|  profile_picture BLOB (escaped)
    |     #|); (escaped)
461 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:514:38-514:50:
    | ///| (escaped)
    | test "With options" { (escaped)
    |   let tokens = "CREATE TABLE users (id INTEGER NOT NULL UNIQUE, name INTEGER DEFAULT 18);" (escaped)
514 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:585:38-585:50:
    | ///| (escaped)
    | test "Create view with columns" { (escaped)
    |   let tokens = "CREATE VIEW user_view (id, name) AS SELECT id, name FROM users;" (escaped)
585 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:618:38-618:50:
    | ///| (escaped)
    | test "Drop view statement" { (escaped)
    |   let tokens = "DROP VIEW user_view;" (escaped)
618 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:666:38-666:50:
    |     #|  PRIMARY KEY (id, name), (escaped)
    |     #|  UNIQUE (name) (escaped)
    |     #|); (escaped)
666 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:731:38-731:50:
    |     #|  name VARCHAR(100) UNIQUE, (escaped)
    |     #|  FOREIGN KEY (id) REFERENCES other_table (other_id) (escaped)
    |     #|); (escaped)
731 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:752:38-752:50:
    |     #|  name VARCHAR(100) UNIQUE, (escaped)
    |     #|  FOREIGN KEY (name) REFERENCES other_table (escaped)
    |     #|); (escaped)
752 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:773:38-773:50:
    |     #|  name VARCHAR(100) UNIQUE, (escaped)
    |     #|  CHECK (id > 0) (escaped)
    |     #|); (escaped)
773 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:806:38-806:50:
    | ///| (escaped)
    | test "Drop table" { (escaped)
    |   let tokens = "DROP TABLE students;" (escaped)
806 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:818:38-818:50:
    | ///| (escaped)
    | test "Drop table IF EXISTS" { (escaped)
    |   let tokens = "DROP TABLE IF EXISTS students;" (escaped)
818 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:876:38-876:50:
    | ///| (escaped)
    | test "DROP INDEX - Simple" { (escaped)
    |   let tokens = "DROP INDEX idx_name;" (escaped)
876 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:888:38-888:50:
    | ///| (escaped)
    | test "DROP INDEX IF EXISTS" { (escaped)
    |   let tokens = "DROP INDEX IF EXISTS idx_name;" (escaped)
888 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:900:38-900:50:
    | ///| (escaped)
    | test "DROP INDEX CONCURRENTLY" { (escaped)
    |   let tokens = "DROP INDEX CONCURRENTLY idx_name;" (escaped)
900 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:912:38-912:50:
    | ///| (escaped)
    | test "DROP INDEX CONCURRENTLY IF EXISTS" { (escaped)
    |   let tokens = "DROP INDEX CONCURRENTLY IF EXISTS idx_name;" (escaped)
912 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:924:38-924:50:
    | ///| (escaped)
    | test "DROP INDEX with table name" { (escaped)
    |   let tokens = "DROP INDEX idx_name ON users;" (escaped)
924 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
    |                                      ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1125:38-1125:50:
     | ///| (escaped)
     | test "Alter table drop column" { (escaped)
     |   let tokens = "ALTER TABLE mytable DROP COLUMN mycolumn;" (escaped)
1125 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1137:38-1137:50:
     | ///| (escaped)
     | test "Alter table drop column IF EXISTS" { (escaped)
     |   let tokens = "ALTER TABLE mytable DROP COLUMN IF EXISTS mycolumn;" (escaped)
1137 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1149:38-1149:50:
     | ///| (escaped)
     | test "Alter table IF EXISTS drop column IF EXISTS" { (escaped)
     |   let tokens = "ALTER TABLE IF EXISTS mytable DROP COLUMN IF EXISTS mycolumn;" (escaped)
1149 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1163:38-1163:50:
     | ///| (escaped)
     | test "ALTER INDEX - RENAME TO" { (escaped)
     |   let tokens = "ALTER INDEX idx_old RENAME TO idx_new;" (escaped)
1163 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1175:38-1175:50:
     | ///| (escaped)
     | test "ALTER INDEX IF EXISTS RENAME TO" { (escaped)
     |   let tokens = "ALTER INDEX IF EXISTS idx_old RENAME TO idx_new;" (escaped)
1175 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1187:38-1187:50:
     | ///| (escaped)
     | test "ALTER INDEX - SET TABLESPACE" { (escaped)
     |   let tokens = "ALTER INDEX idx_name SET TABLESPACE fast_ssd;" (escaped)
1187 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1199:38-1199:50:
     | ///| (escaped)
     | test "ALTER INDEX - RESET parameters" { (escaped)
     |   let tokens = "ALTER INDEX idx_name RESET (fillfactor, fastupdate);" (escaped)
1199 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1211:38-1211:50:
     | ///| (escaped)
     | test "ALTER INDEX - SET parameters" { (escaped)
     |   let tokens = "ALTER INDEX idx_name SET (fillfactor = 70, fastupdate = off);" (escaped)
1211 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1223:38-1223:50:
     | ///| (escaped)
     | test "ALTER INDEX - Simple RENAME test" { (escaped)
     |   let tokens = "ALTER INDEX idx_old RENAME TO idx_new;" (escaped)
1223 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1235:38-1235:50:
     | ///| (escaped)
     | test "ALTER INDEX - Complex RENAME with quoted names" { (escaped)
     |   let tokens = "ALTER INDEX \\"old-index-name\\" RENAME TO \\"new-index-name\\";" (escaped)
1235 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect(stmt, content="ALTER INDEX old-index-name RENAME TO new-index-name;") (escaped)
     | } (escaped)

<WORKDIR>/src/ddl.mbt:1331:38-1331:50:
     | ///| (escaped)
     | test "CREATE DATABASE - Simple" { (escaped)
     |   let tokens = "CREATE DATABASE mydb;" (escaped)
1331 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1343:38-1343:50:
     | ///| (escaped)
     | test "CREATE DATABASE IF NOT EXISTS" { (escaped)
     |   let tokens = "CREATE DATABASE IF NOT EXISTS mydb;" (escaped)
1343 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1355:38-1355:50:
     | ///| (escaped)
     | test "CREATE DATABASE with CHARACTER SET" { (escaped)
     |   let tokens = "CREATE DATABASE mydb CHARACTER SET utf8;" (escaped)
1355 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1367:38-1367:50:
     | ///| (escaped)
     | test "CREATE DATABASE with CHARACTER SET and COLLATE" { (escaped)
     |   let tokens = "CREATE DATABASE mydb CHARACTER SET utf8 COLLATE utf8_general_ci;" (escaped)
1367 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1379:38-1379:50:
     | ///| (escaped)
     | test "CREATE SCHEMA - Simple" { (escaped)
     |   let tokens = "CREATE SCHEMA myschema;" (escaped)
1379 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1391:38-1391:50:
     | ///| (escaped)
     | test "CREATE SCHEMA IF NOT EXISTS" { (escaped)
     |   let tokens = "CREATE SCHEMA IF NOT EXISTS myschema;" (escaped)
1391 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1403:38-1403:50:
     | ///| (escaped)
     | test "CREATE SCHEMA with AUTHORIZATION" { (escaped)
     |   let tokens = "CREATE SCHEMA myschema AUTHORIZATION myuser;" (escaped)
1403 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1612:38-1612:50:
     | ///| (escaped)
     | test "CREATE FUNCTION - Simple" { (escaped)
     |   let tokens = "CREATE FUNCTION my_func() RETURNS INTEGER AS 'SELECT 1';" (escaped)
1612 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1624:38-1624:50:
     | ///| (escaped)
     | test "CREATE FUNCTION IF NOT EXISTS" { (escaped)
     |   let tokens = "CREATE FUNCTION IF NOT EXISTS my_func() RETURNS INTEGER AS 'SELECT 1';" (escaped)
1624 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1636:38-1636:50:
     | ///| (escaped)
     | test "CREATE FUNCTION with parameters" { (escaped)
     |   let tokens = "CREATE FUNCTION add_nums(IN a INTEGER, IN b INTEGER) RETURNS INTEGER LANGUAGE sql AS 'SELECT a + b';" (escaped)
1636 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1648:38-1648:50:
     | ///| (escaped)
     | test "CREATE FUNCTION DETERMINISTIC" { (escaped)
     |   let tokens = "CREATE FUNCTION my_func() RETURNS INTEGER DETERMINISTIC AS 'SELECT 1';" (escaped)
1648 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1660:38-1660:50:
     | ///| (escaped)
     | test "CREATE PROCEDURE - Simple" { (escaped)
     |   let tokens = "CREATE PROCEDURE my_proc() AS 'BEGIN SELECT 1; END';" (escaped)
1660 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1672:38-1672:50:
     | ///| (escaped)
     | test "CREATE PROCEDURE with parameters" { (escaped)
     |   let tokens = "CREATE PROCEDURE update_user(IN user_id INTEGER, IN new_name VARCHAR(100)) LANGUAGE plpgsql AS 'BEGIN UPDATE users SET name = new_name WHERE id = user_id; END';" (escaped)
1672 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1684:38-1684:50:
     | ///| (escaped)
     | test "CREATE FUNCTION with OUT parameter" { (escaped)
     |   let tokens = "CREATE FUNCTION get_user_info(IN user_id INTEGER, OUT user_name VARCHAR(100), OUT user_age INTEGER) AS 'SELECT name, age FROM users WHERE id = user_id';" (escaped)
1684 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1696:38-1696:50:
     | ///| (escaped)
     | test "CREATE FUNCTION with INOUT parameter" { (escaped)
     |   let tokens = "CREATE FUNCTION modify_value(INOUT value INTEGER) RETURNS INTEGER AS 'SELECT value * 2';" (escaped)
1696 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1861:38-1861:50:
     | ///| (escaped)
     | test "CREATE SEQUENCE - Simple" { (escaped)
     |   let tokens = "CREATE SEQUENCE my_seq;" (escaped)
1861 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1873:38-1873:50:
     | ///| (escaped)
     | test "CREATE SEQUENCE IF NOT EXISTS" { (escaped)
     |   let tokens = "CREATE SEQUENCE IF NOT EXISTS my_seq;" (escaped)
1873 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1885:38-1885:50:
     | ///| (escaped)
     | test "CREATE TEMPORARY SEQUENCE" { (escaped)
     |   let tokens = "CREATE TEMPORARY SEQUENCE temp_seq;" (escaped)
1885 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1897:38-1897:50:
     | ///| (escaped)
     | test "CREATE SEQUENCE with INCREMENT BY" { (escaped)
     |   let tokens = "CREATE SEQUENCE my_seq INCREMENT BY 5;" (escaped)
1897 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1909:38-1909:50:
     | ///| (escaped)
     | test "CREATE SEQUENCE with MINVALUE and MAXVALUE" { (escaped)
     |   let tokens = "CREATE SEQUENCE my_seq MINVALUE 1 MAXVALUE 1000;" (escaped)
1909 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1921:38-1921:50:
     | ///| (escaped)
     | test "CREATE SEQUENCE with NO MINVALUE NO MAXVALUE" { (escaped)
     |   let tokens = "CREATE SEQUENCE my_seq NO MINVALUE NO MAXVALUE;" (escaped)
1921 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1933:38-1933:50:
     | ///| (escaped)
     | test "CREATE SEQUENCE with START WITH and CACHE" { (escaped)
     |   let tokens = "CREATE SEQUENCE my_seq START WITH 10 CACHE 20;" (escaped)
1933 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1945:38-1945:50:
     | ///| (escaped)
     | test "CREATE SEQUENCE with CYCLE" { (escaped)
     |   let tokens = "CREATE SEQUENCE my_seq CYCLE;" (escaped)
1945 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1957:38-1957:50:
     | ///| (escaped)
     | test "CREATE SEQUENCE with NO CYCLE" { (escaped)
     |   let tokens = "CREATE SEQUENCE my_seq NO CYCLE;" (escaped)
1957 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1969:38-1969:50:
     | ///| (escaped)
     | test "CREATE SEQUENCE with OWNED BY" { (escaped)
     |   let tokens = "CREATE SEQUENCE user_id_seq OWNED BY users.id;" (escaped)
1969 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1981:38-1981:50:
     | ///| (escaped)
     | test "CREATE SEQUENCE with OWNED BY NONE" { (escaped)
     |   let tokens = "CREATE SEQUENCE my_seq OWNED BY NONE;" (escaped)
1981 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/ddl.mbt:1993:38-1993:50:
     | ///| (escaped)
     | test "CREATE SEQUENCE with all options" { (escaped)
     |   let tokens = "CREATE TEMPORARY SEQUENCE IF NOT EXISTS user_seq INCREMENT BY 2 MINVALUE 1 MAXVALUE 9999 START WITH 100 CACHE 10 CYCLE OWNED BY users.id;" (escaped)
1993 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1144:38-1144:50:
     | ///| (escaped)
     | test "Parse select with two columns" { (escaped)
     |   let tokens = "SELECT col1, col2 FROM t;" (escaped)
1144 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1160:38-1160:50:
     | ///| (escaped)
     | test "Parse select with function call" { (escaped)
     |   let tokens = "SELECT MAX(arg1, arg2), MIN() as m FROM t;" (escaped)
1160 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1176:38-1176:50:
     | ///| (escaped)
     | test "Nested expression" { (escaped)
     |   let tokens = "SELECT sum(l_extendedprice * (1 - l_discount)) FROM lineitem;" (escaped)
1176 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1191:38-1191:50:
     | ///| (escaped)
     | test "Binary expression" { (escaped)
     |   let tokens = "SELECT 1 + 2 * 3 FROM t;" (escaped)
1191 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1206:38-1206:50:
     | ///| (escaped)
     | test "Complecated binary expression" { (escaped)
     |   let tokens = "SELECT sum(a * (1 - b) * (2 + b)) AS c FROM t;" (escaped)
1206 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1221:38-1221:50:
     | ///| (escaped)
     | test "Selection clause" { (escaped)
     |   let tokens = "SELECT * FROM t WHERE id = 1;" (escaped)
1221 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1247:38-1247:50:
     |     #|  AND name ILIKE 'TEST'  (escaped)
     |     #|  AND name NOT LIKE 'test2'  (escaped)
     |     #|  AND name NOT ILIKE 'TEST2'; (escaped)
1247 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1267:38-1267:50:
     | ///| (escaped)
     | test "From multiple table refs" { (escaped)
     |   let tokens = "SELECT * FROM t1, t2;" (escaped)
1267 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1283:62-1283:74:
     | ///| (escaped)
     | test "SubQuery" { (escaped)
     |   let tokens = "SELECT sub FROM (SELECT name FROM users WHERE active = true) AS sub;" (escaped)
1283 |   let stmt = parse_sql(tokens, dialect=Postgres::{  })[0] |> pretty_print (escaped)
     |                                                              ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1305:38-1305:50:
     | ///| (escaped)
     | test "Exists, not exists" { (escaped)
     |   let tokens = "SELECT * FROM t WHERE EXISTS (SELECT 1 FROM t2) AND NOT EXISTS (SELECT 1 FROM t3);" (escaped)
1305 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1333:38-1333:50:
     | ///| (escaped)
     | test "Between and" { (escaped)
     |   let tokens = "SELECT * FROM t WHERE id BETWEEN 1 AND 10;" (escaped)
1333 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1350:38-1350:50:
     | ///| (escaped)
     | test "Compound identifiers" { (escaped)
     |   let tokens = "SELECT t1.col1, t2.col2 FROM t1, t2;" (escaped)
1350 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1367:38-1367:50:
     | ///| (escaped)
     | test "Extract function" { (escaped)
     |   let tokens = "SELECT EXTRACT(YEAR FROM date_col) FROM t;" (escaped)
1367 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1382:38-1382:50:
     | ///| (escaped)
     | test "Aliasing omits AS" { (escaped)
     |   let tokens = "SELECT col1 c1, col2 FROM t;" (escaped)
1382 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1398:38-1398:50:
     | ///| (escaped)
     | test "Case when" { (escaped)
     |   let tokens = "SELECT CASE WHEN a > 0 THEN 'positive' WHEN a < 0 THEN 'negative' ELSE 'zero' END AS result FROM t;" (escaped)
1398 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1417:38-1417:50:
     | ///| (escaped)
     | test "Having" { (escaped)
     |   let tokens = "SELECT col1, COUNT(*) FROM t GROUP BY col1 HAVING COUNT(*) > 1;" (escaped)
1417 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1437:38-1437:50:
     | ///| (escaped)
     | test "In list" { (escaped)
     |   let tokens = "SELECT * FROM t WHERE col1 IN (1, 2, 3);" (escaped)
1437 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1454:38-1454:50:
     | ///| (escaped)
     | test "In subquery" { (escaped)
     |   let tokens = "SELECT * FROM t WHERE col1 IN (SELECT col2 FROM t2);" (escaped)
1454 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1476:38-1476:50:
     | ///| (escaped)
     | test "Join with ON condition" { (escaped)
     |   let tokens = "SELECT * FROM t1 JOIN t2 ON t1.id = t2.id;" (escaped)
1476 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1492:38-1492:50:
     | ///| (escaped)
     | test "Cross join" { (escaped)
     |   let tokens = "SELECT * FROM t1 CROSS JOIN t2;" (escaped)
1492 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1507:38-1507:50:
     | ///| (escaped)
     | test "Left join" { (escaped)
     |   let tokens = "SELECT * FROM t1 LEFT JOIN t2 ON t1.id = t2.id GROUP BY x;" (escaped)
1507 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1525:38-1525:50:
     | ///| (escaped)
     | test "Right join" { (escaped)
     |   let tokens = "SELECT * FROM t1 RIGHT JOIN t2 ON t1.id = t2.id;" (escaped)
1525 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1541:38-1541:50:
     | ///| (escaped)
     | test "Full outer join" { (escaped)
     |   let tokens = "SELECT * FROM t1 LEFT OUTER JOIN t2 ON t1.id = t2.id;" (escaped)
1541 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1557:62-1557:74:
     | ///| (escaped)
     | test "Null, true and false" { (escaped)
     |   let tokens = "SELECT NULL, true, false FROM t1;" (escaped)
1557 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens)[0] |> pretty_print (escaped)
     |                                                              ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1574:38-1574:50:
     | ///| (escaped)
     | test "Unary plus and minus" { (escaped)
     |   let tokens = "SELECT +1, -2 FROM t;" (escaped)
1574 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1590:38-1590:50:
     | ///| (escaped)
     | test "Unary not expression" { (escaped)
     |   let tokens = "SELECT NOT a FROM t;" (escaped)
1590 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1605:38-1605:50:
     | ///| (escaped)
     | test "Using clause in join" { (escaped)
     |   let tokens = "SELECT * FROM t1 JOIN t2 USING (id);" (escaped)
1605 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1621:36-1621:48:
     | ///| (escaped)
     | test "Multiple statements" { (escaped)
     |   let tokens = "SELECT * FROM t1; SELECT * FROM t2;" (escaped)
1621 |   let stmts = parse_sql(tokens) |> pretty_print (escaped)
     |                                    ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmts, (escaped)

<WORKDIR>/src/dml.mbt:1641:38-1641:50:
     | ///| (escaped)
     | test "String literal as column" { (escaped)
     |   let tokens = "SELECT test FROM 't';" (escaped)
1641 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1656:38-1656:50:
     | ///| (escaped)
     | test "Limit and offset" { (escaped)
     |   let tokens = "SELECT * FROM t LIMIT 10 OFFSET 5;" (escaped)
1656 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1675:38-1675:50:
     | ///| (escaped)
     | test "Limit without offset" { (escaped)
     |   let tokens = "SELECT * FROM t LIMIT N;" (escaped)
1675 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1692:38-1692:50:
     | ///| (escaped)
     | test "Offset without limit" { (escaped)
     |   let tokens = "SELECT * FROM t OFFSET N;" (escaped)
1692 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1709:38-1709:50:
     | ///| (escaped)
     | test "Duplicate treatment" { (escaped)
     |   let tokens = "SELECT COUNT(DISTINCT *) FROM t;" (escaped)
1709 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1724:38-1724:50:
     | ///| (escaped)
     | test "Substring" { (escaped)
     |   let tokens = "SELECT SUBSTRING(col FROM 1 FOR 5) FROM t;" (escaped)
1724 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1739:38-1739:50:
     | ///| (escaped)
     | test "Substring with start only" { (escaped)
     |   let tokens = "SELECT SUBSTRING(col FROM 1) FROM t;" (escaped)
1739 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1754:38-1754:50:
     | ///| (escaped)
     | test "Substring another way" { (escaped)
     |   let tokens = "SELECT SUBSTRING(col, 1, 5) FROM t;" (escaped)
1754 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1797:38-1797:50:
     | ///| (escaped)
     | test { (escaped)
     |   let tokens = "SELECT * FROM t1 UNION (SELECT * FROM t2 UNION SELECT * FROM t3) ORDER BY col1;" (escaped)
1797 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1826:38-1826:50:
     | ///| (escaped)
     | test "Non projections" { (escaped)
     |   let tokens = "SELECT FROM t1;" (escaped)
1826 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:1862:38-1862:50:
     | ///| (escaped)
     | test "Top 10" { (escaped)
     |   let tokens = "SELECT TOP 10 * FROM t;" (escaped)
1862 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2008:38-2008:50:
     | ///| (escaped)
     | test "Insert with values - simple" { (escaped)
     |   let tokens = "INSERT INTO test_table VALUES (1, 2, 'test');" (escaped)
2008 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2020:38-2020:50:
     | ///| (escaped)
     | test "Insert with columns and values" { (escaped)
     |   let tokens = "INSERT INTO test_table (id, value, name) VALUES (1, 2, 'test');" (escaped)
2020 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2032:38-2032:50:
     | ///| (escaped)
     | test "Insert with SELECT" { (escaped)
     |   let tokens = "INSERT INTO test_table SELECT * FROM students;" (escaped)
2032 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2047:38-2047:50:
     | ///| (escaped)
     | test "Insert with schema" { (escaped)
     |   let tokens = "INSERT INTO some_schema.test_table SELECT * FROM another_schema.students;" (escaped)
2047 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2063:38-2063:50:
     | /// PostgreSQL ON CONFLICT Tests (escaped)
     | test "INSERT with ON CONFLICT DO NOTHING" { (escaped)
     |   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT DO NOTHING;" (escaped)
2063 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2075:38-2075:50:
     | ///| (escaped)
     | test "INSERT with ON CONFLICT (column) DO NOTHING" { (escaped)
     |   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT (email) DO NOTHING;" (escaped)
2075 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2087:38-2087:50:
     | ///| (escaped)
     | test "INSERT with ON CONFLICT (multiple columns) DO UPDATE" { (escaped)
     |   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT (id, email) DO UPDATE SET name = EXCLUDED.name;" (escaped)
2087 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2099:38-2099:50:
     | ///| (escaped)
     | test "INSERT with ON CONFLICT ON CONSTRAINT" { (escaped)
     |   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT ON CONSTRAINT users_email_key DO UPDATE SET name = EXCLUDED.name;" (escaped)
2099 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2111:38-2111:50:
     | ///| (escaped)
     | test "INSERT with ON CONFLICT DO UPDATE with WHERE" { (escaped)
     |   let tokens = "INSERT INTO users (id, name, email, active) VALUES (1, 'John', 'john@example.com', true) ON CONFLICT (email) DO UPDATE SET name = EXCLUDED.name, active = EXCLUDED.active WHERE users.created_at < NOW();" (escaped)
2111 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2123:38-2123:50:
     | ///| (escaped)
     | test "INSERT with ON CONFLICT (expression) WHERE condition" { (escaped)
     |   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON CONFLICT (LOWER(email)) WHERE active = true DO UPDATE SET name = EXCLUDED.name;" (escaped)
2123 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2155:38-2155:50:
     | ///| (escaped)
     | test "Delete with WHERE" { (escaped)
     |   let tokens = "DELETE FROM students WHERE grade > 3.0;" (escaped)
2155 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2168:38-2168:50:
     | ///| (escaped)
     | test "Delete without WHERE" { (escaped)
     |   let tokens = "DELETE FROM students;" (escaped)
2168 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2219:38-2219:50:
     | ///| (escaped)
     | test "Update with single assignment and WHERE" { (escaped)
     |   let tokens = "UPDATE students SET grade = 1.3 WHERE name = 'Max Mustermann';" (escaped)
2219 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2233:38-2233:50:
     | ///| (escaped)
     | test "Update with multiple assignments and WHERE" { (escaped)
     |   let tokens = "UPDATE students SET grade = 1.3, name='Felix Fürstenberg' WHERE name = 'Max Mustermann';" (escaped)
2233 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2247:38-2247:50:
     | ///| (escaped)
     | test "Update without WHERE" { (escaped)
     |   let tokens = "UPDATE students SET grade = 1.0;" (escaped)
2247 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2502:38-2502:50:
     | ///| (escaped)
     | test "Truncate table" { (escaped)
     |   let tokens = "TRUNCATE students;" (escaped)
2502 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2516:38-2516:50:
     |  (escaped)
     | test "Simple CTE with WITH clause" { (escaped)
     |   let tokens = "WITH sales AS (SELECT * FROM orders) SELECT * FROM sales;" (escaped)
2516 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2537:38-2537:50:
     | ///| (escaped)
     | test "CTE with column specification" { (escaped)
     |   let tokens = "WITH sales(id, total) AS (SELECT order_id, amount FROM orders) SELECT * FROM sales;" (escaped)
2537 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2559:38-2559:50:
     | ///| (escaped)
     | test "Multiple CTEs" { (escaped)
     |   let tokens = "WITH sales AS (SELECT * FROM orders), customers AS (SELECT * FROM users) SELECT * FROM sales JOIN customers ON sales.user_id = customers.id;" (escaped)
2559 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2587:38-2587:50:
     | ///| (escaped)
     | test "CTE with ORDER BY and LIMIT" { (escaped)
     |   let tokens = "WITH top_sales AS (SELECT * FROM orders ORDER BY amount DESC LIMIT 10) SELECT * FROM top_sales;" (escaped)
2587 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2612:38-2612:50:
     | ///| (escaped)
     | test "Nested CTE (CTE referencing another CTE)" { (escaped)
     |   let tokens = "WITH sales AS (SELECT * FROM orders), big_sales AS (SELECT * FROM sales WHERE amount > 1000) SELECT * FROM big_sales;" (escaped)
2612 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2641:38-2641:50:
     | ///| (escaped)
     | test "CTE with aggregation" { (escaped)
     |   let tokens = "WITH monthly_sales AS (SELECT date_month, SUM(amount) as total FROM orders GROUP BY date_month) SELECT * FROM monthly_sales;" (escaped)
2641 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2666:38-2666:50:
     | /// Window Functions Tests (escaped)
     | test "Simple window function with empty OVER clause" { (escaped)
     |   let tokens = "SELECT rank() OVER () FROM test;" (escaped)
2666 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2681:38-2681:50:
     | ///| (escaped)
     | test "Window function with ORDER BY" { (escaped)
     |   let tokens = "SELECT rank() OVER (ORDER BY salary DESC) FROM employees;" (escaped)
2681 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2696:38-2696:50:
     | ///| (escaped)
     | test "Window function with PARTITION BY" { (escaped)
     |   let tokens = "SELECT count(*) OVER (PARTITION BY department) FROM employees;" (escaped)
2696 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2711:38-2711:50:
     | ///| (escaped)
     | test "Window function with PARTITION BY and ORDER BY" { (escaped)
     |   let tokens = "SELECT row_number() OVER (PARTITION BY department ORDER BY salary DESC) FROM employees;" (escaped)
2711 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2726:38-2726:50:
     | ///| (escaped)
     | test "Window function with ROWS frame - UNBOUNDED PRECEDING" { (escaped)
     |   let tokens = "SELECT sum(salary) OVER (ORDER BY hire_date ROWS UNBOUNDED PRECEDING) FROM employees;" (escaped)
2726 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2741:38-2741:50:
     | ///| (escaped)
     | test "Window function with ROWS frame - BETWEEN" { (escaped)
     |   let tokens = "SELECT avg(salary) OVER (ORDER BY hire_date ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) FROM employees;" (escaped)
2741 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2946:38-2946:50:
     | ///| (escaped)
     | test "MERGE - Simple" { (escaped)
     |   let tokens = "MERGE INTO target_table USING source_table ON target_table.id = source_table.id WHEN MATCHED THEN UPDATE SET name = source_table.name WHEN NOT MATCHED THEN INSERT VALUES (source_table.id, source_table.name);" (escaped)
2946 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2962:38-2962:50:
     | ///| (escaped)
     | test "MERGE with table aliases" { (escaped)
     |   let tokens = "MERGE INTO customers c USING customer_updates cu ON c.id = cu.id WHEN MATCHED THEN UPDATE SET name = cu.name;" (escaped)
2962 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2977:38-2977:50:
     | ///| (escaped)
     | test "MERGE with subquery source" { (escaped)
     |   let tokens = "MERGE INTO dest_table t USING (SELECT id, name FROM source) s ON t.id = s.id WHEN NOT MATCHED THEN INSERT (id, name) VALUES (s.id, s.name);" (escaped)
2977 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:2998:38-2998:50:
     | ///| (escaped)
     | test "MERGE with conditional WHEN" { (escaped)
     |   let tokens = "MERGE INTO products p USING updates u ON p.id = u.id WHEN MATCHED AND u.price > p.price THEN UPDATE SET price = u.price WHEN NOT MATCHED THEN INSERT VALUES (u.id, u.name, u.price);" (escaped)
2998 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/dml.mbt:3014:38-3014:50:
     | ///| (escaped)
     | test "MERGE with DELETE action" { (escaped)
     |   let tokens = "MERGE INTO inventory i USING changes c ON i.id = c.id WHEN MATCHED AND c.quantity = 0 THEN DELETE WHEN MATCHED THEN UPDATE SET quantity = c.quantity;" (escaped)
3014 |   let stmt = parse_sql(tokens)[0] |> pretty_print (escaped)
     |                                      ^^^^^^^^^^^^ (escaped)
     |   inspect( (escaped)
     |     stmt, (escaped)

<WORKDIR>/src/mysql.mbt:100:65-100:77:
    | ///| (escaped)
    | test "MySQL SHOW TABLES" { (escaped)
    |   let tokens = "SHOW TABLES;" (escaped)
100 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/mysql.mbt:112:65-112:77:
    | ///| (escaped)
    | test "MySQL SHOW COLUMNS FROM table" { (escaped)
    |   let tokens = "SHOW COLUMNS FROM users;" (escaped)
112 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/mysql.mbt:124:65-124:77:
    | ///| (escaped)
    | test "MySQL SHOW TABLES LIKE pattern" { (escaped)
    |   let tokens = "SHOW TABLES LIKE 'user%';" (escaped)
124 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/mysql.mbt:136:65-136:77:
    | ///| (escaped)
    | test "MySQL with backticks in SHOW" { (escaped)
    |   let tokens = "SHOW COLUMNS FROM `table name`;" (escaped)
136 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/mysql.mbt:148:65-148:77:
    | ///| (escaped)
    | test "MySQL LOCK TABLES" { (escaped)
    |   let tokens = "LOCK TABLES users;" (escaped)
148 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/mysql.mbt:160:65-160:77:
    | ///| (escaped)
    | test "MySQL UNLOCK TABLES" { (escaped)
    |   let tokens = "UNLOCK TABLES;" (escaped)
160 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/mysql.mbt:172:65-172:77:
    | ///| (escaped)
    | test "MySQL DIV operator" { (escaped)
    |   let tokens = "SELECT 10 DIV 3 FROM test;" (escaped)
172 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/mysql.mbt:187:65-187:77:
    | ///| (escaped)
    | test "MySQL SHOW VARIABLES" { (escaped)
    |   let tokens = "SHOW VARIABLES;" (escaped)
187 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/mysql.mbt:199:65-199:77:
    | ///| (escaped)
    | test "MySQL SHOW GLOBAL STATUS" { (escaped)
    |   let tokens = "SHOW GLOBAL STATUS;" (escaped)
199 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/mysql.mbt:211:65-211:77:
    | ///| (escaped)
    | test "MySQL SHOW FULL PROCESSLIST" { (escaped)
    |   let tokens = "SHOW FULL PROCESSLIST;" (escaped)
211 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/mysql.mbt:223:65-223:77:
    | ///| (escaped)
    | test "MySQL SHOW CREATE TABLE" { (escaped)
    |   let tokens = "SHOW CREATE TABLE users;" (escaped)
223 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/mysql.mbt:235:65-235:77:
    | ///| (escaped)
    | test "MySQL SHOW EXTENDED COLUMNS" { (escaped)
    |   let tokens = "SHOW EXTENDED COLUMNS FROM users LIKE 'name%';" (escaped)
235 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/mysql.mbt:247:65-247:77:
    | ///| (escaped)
    | test "MySQL SET session variable" { (escaped)
    |   let tokens = "SET SESSION sql_mode = 'STRICT_TRANS_TABLES';" (escaped)
247 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/mysql.mbt:259:65-259:77:
    | ///| (escaped)
    | test "MySQL SET global variable" { (escaped)
    |   let tokens = "SET GLOBAL max_connections = 200;" (escaped)
259 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/mysql.mbt:271:65-271:77:
    | ///| (escaped)
    | test "MySQL SET user variable" { (escaped)
    |   let tokens = "SET @counter = 1;" (escaped)
271 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/mysql.mbt:283:65-283:77:
    | ///| (escaped)
    | test "MySQL SET multiple variables" { (escaped)
    |   let tokens = "SET @name = 'John', @age = 30, @salary = 50000.50;" (escaped)
283 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/mysql.mbt:295:65-295:77:
    | ///| (escaped)
    | test "MySQL SET local variable" { (escaped)
    |   let tokens = "SET autocommit = 0;" (escaped)
295 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/mysql.mbt:307:65-307:77:
    | ///| (escaped)
    | test "MySQL REPLACE INTO statement" { (escaped)
    |   let tokens = "REPLACE INTO users (id, name) VALUES (1, 'John');" (escaped)
307 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/mysql.mbt:319:65-319:77:
    | ///| (escaped)
    | test "MySQL REPLACE INTO with multiple values" { (escaped)
    |   let tokens = "REPLACE INTO products (id, name, price) VALUES (1, 'Widget', 10.50), (2, 'Gadget', 15.00);" (escaped)
319 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/mysql.mbt:331:65-331:77:
    | ///| (escaped)
    | test "MySQL INSERT OR REPLACE statement" { (escaped)
    |   let tokens = "INSERT OR REPLACE INTO settings (key, value) VALUES ('theme', 'dark');" (escaped)
331 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/mysql.mbt:343:65-343:77:
    | ///| (escaped)
    | test "MySQL INSERT with ON DUPLICATE KEY UPDATE" { (escaped)
    |   let tokens = "INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com') ON DUPLICATE KEY UPDATE name = 'John Updated', email = 'john.new@example.com';" (escaped)
343 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/mysql.mbt:355:65-355:77:
    | ///| (escaped)
    | test "MySQL INSERT single assignment ON DUPLICATE KEY UPDATE" { (escaped)
    |   let tokens = "INSERT INTO counters (id, count) VALUES (1, 1) ON DUPLICATE KEY UPDATE count = count + 1;" (escaped)
355 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/mysql.mbt:367:65-367:77:
    | ///| (escaped)
    | test "MySQL REPLACE with ON DUPLICATE KEY UPDATE" { (escaped)
    |   let tokens = "REPLACE INTO settings (setting_key, setting_value) VALUES ('theme', 'dark') ON DUPLICATE KEY UPDATE setting_value = 'light';" (escaped)
367 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/mysql.mbt:379:65-379:77:
    | ///| (escaped)
    | test "MySQL basic LOAD DATA statement" { (escaped)
    |   let tokens = "LOAD DATA INFILE '/tmp/data.csv' INTO TABLE users;" (escaped)
379 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/mysql.mbt:392:65-392:77:
    | ///| (escaped)
    | test "MySQL LOAD DATA with LOCAL and REPLACE" { (escaped)
    |   let tokens = "LOAD DATA LOCAL INFILE '/tmp/users.txt' REPLACE INTO TABLE employees;" (escaped)
392 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/mysql.mbt:405:65-405:77:
    | ///| (escaped)
    | test "MySQL LOAD DATA with FIELDS options" { (escaped)
    |   let tokens = "LOAD DATA INFILE '/data/products.csv' INTO TABLE products CHARACTER SET utf8 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\\"';" (escaped)
405 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/mysql.mbt:420:65-420:77:
    | ///| (escaped)
    | test "MySQL LOAD DATA with LINES options" { (escaped)
    |   let tokens = "LOAD DATA INFILE '/tmp/logs.txt' INTO TABLE logs LINES STARTING BY '>>>' TERMINATED BY '\\n' IGNORE 5 LINES;" (escaped)
420 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/mysql.mbt:436:65-436:77:
    | ///| (escaped)
    | test "MySQL LOAD DATA with column list and SET" { (escaped)
    |   let tokens = "LOAD DATA INFILE '/data/sales.csv' IGNORE INTO TABLE sales FIELDS TERMINATED BY ',' (date, amount, customer) SET created_at = now();" (escaped)
436 |   let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/parameterized.mbt:20:62-20:74:
   | ///| (escaped)
   | test "Question mark placeholder in WHERE clause" { (escaped)
   |   let sql = "SELECT * FROM users WHERE id = ?;" (escaped)
20 |   let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print (escaped)
   |                                                              ^^^^^^^^^^^^ (escaped)
   |   inspect( (escaped)
   |     stmt, (escaped)

<WORKDIR>/src/parameterized.mbt:37:62-37:74:
   | ///| (escaped)
   | test "Multiple question mark placeholders" { (escaped)
   |   let sql = "SELECT * FROM users WHERE age > ? AND name = ?;" (escaped)
37 |   let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print (escaped)
   |                                                              ^^^^^^^^^^^^ (escaped)
   |   inspect( (escaped)
   |     stmt, (escaped)

<WORKDIR>/src/parameterized.mbt:55:62-55:74:
   | ///| (escaped)
   | test "Question mark placeholder in INSERT" { (escaped)
   |   let sql = "INSERT INTO users (name, age) VALUES (?, ?);" (escaped)
55 |   let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print (escaped)
   |                                                              ^^^^^^^^^^^^ (escaped)
   |   inspect( (escaped)
   |     stmt, (escaped)

<WORKDIR>/src/parameterized.mbt:67:62-67:74:
   | ///| (escaped)
   | test "Question mark placeholder in UPDATE" { (escaped)
   |   let sql = "UPDATE users SET name = ?, age = ? WHERE id = ?;" (escaped)
67 |   let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print (escaped)
   |                                                              ^^^^^^^^^^^^ (escaped)
   |   inspect( (escaped)
   |     stmt, (escaped)

<WORKDIR>/src/parameterized.mbt:81:62-81:74:
   | ///| (escaped)
   | test "Question mark placeholder in LIMIT" { (escaped)
   |   let sql = "SELECT * FROM users LIMIT ?;" (escaped)
81 |   let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print (escaped)
   |                                                              ^^^^^^^^^^^^ (escaped)
   |   inspect( (escaped)
   |     stmt, (escaped)

<WORKDIR>/src/parameterized.mbt:98:62-98:74:
   | ///| (escaped)
   | test "Question mark placeholder in LIMIT and OFFSET" { (escaped)
   |   let sql = "SELECT * FROM users LIMIT ? OFFSET ?;" (escaped)
98 |   let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print (escaped)
   |                                                              ^^^^^^^^^^^^ (escaped)
   |   inspect( (escaped)
   |     stmt, (escaped)

<WORKDIR>/src/parameterized.mbt:117:65-117:77:
    | ///| (escaped)
    | test "PostgreSQL $1 numbered placeholder" { (escaped)
    |   let sql = "SELECT * FROM users WHERE id = $1;" (escaped)
117 |   let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/parameterized.mbt:134:65-134:77:
    | ///| (escaped)
    | test "PostgreSQL multiple numbered placeholders" { (escaped)
    |   let sql = "SELECT * FROM users WHERE age > $1 AND name = $2;" (escaped)
134 |   let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/parameterized.mbt:152:65-152:77:
    | ///| (escaped)
    | test "PostgreSQL numbered placeholders in INSERT" { (escaped)
    |   let sql = "INSERT INTO users (name, age, email) VALUES ($1, $2, $3);" (escaped)
152 |   let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/parameterized.mbt:162:65-162:77:
    | ///| (escaped)
    | test "PostgreSQL numbered placeholders in LIMIT OFFSET" { (escaped)
    |   let sql = "SELECT * FROM users LIMIT $1 OFFSET $2;" (escaped)
162 |   let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/parameterized.mbt:181:65-181:77:
    | ///| (escaped)
    | test "PostgreSQL numbered placeholders out of order" { (escaped)
    |   let sql = "SELECT * FROM users WHERE id = $2 AND name = $1;" (escaped)
181 |   let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/parameterized.mbt:199:65-199:77:
    | ///| (escaped)
    | test "Colon named parameter" { (escaped)
    |   let sql = "SELECT * FROM users WHERE name = :username;" (escaped)
199 |   let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/parameterized.mbt:216:65-216:77:
    | ///| (escaped)
    | test "Multiple colon named parameters" { (escaped)
    |   let sql = "SELECT * FROM users WHERE age > :min_age AND city = :city_name;" (escaped)
216 |   let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/parameterized.mbt:234:65-234:77:
    | ///| (escaped)
    | test "Colon named parameters in INSERT" { (escaped)
    |   let sql = "INSERT INTO users (name, age) VALUES (:name, :age);" (escaped)
234 |   let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect(stmt, content="INSERT INTO users (name, age) VALUES (:name, :age);") (escaped)
    | } (escaped)

<WORKDIR>/src/parameterized.mbt:241:62-241:74:
    | ///| (escaped)
    | test "At-sign named parameter" { (escaped)
    |   let sql = "SELECT * FROM users WHERE name = @username;" (escaped)
241 |   let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print (escaped)
    |                                                              ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/parameterized.mbt:258:62-258:74:
    | ///| (escaped)
    | test "Multiple at-sign named parameters" { (escaped)
    |   let sql = "SELECT * FROM users WHERE age > @min_age AND city = @city_name;" (escaped)
258 |   let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print (escaped)
    |                                                              ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/parameterized.mbt:276:62-276:74:
    | ///| (escaped)
    | test "Placeholder in function call" { (escaped)
    |   let sql = "SELECT UPPER(?) FROM users;" (escaped)
276 |   let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print (escaped)
    |                                                              ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/parameterized.mbt:291:62-291:74:
    | ///| (escaped)
    | test "Placeholder in expression" { (escaped)
    |   let sql = "SELECT * FROM users WHERE age + ? > 100;" (escaped)
291 |   let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print (escaped)
    |                                                              ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/parameterized.mbt:308:62-308:74:
    | ///| (escaped)
    | test "Placeholder in BETWEEN clause" { (escaped)
    |   let sql = "SELECT * FROM users WHERE age BETWEEN ? AND ?;" (escaped)
308 |   let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print (escaped)
    |                                                              ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/parameterized.mbt:325:62-325:74:
    | ///| (escaped)
    | test "Placeholder in IN list" { (escaped)
    |   let sql = "SELECT * FROM users WHERE id IN (?, ?, ?);" (escaped)
325 |   let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print (escaped)
    |                                                              ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/parameterized.mbt:342:65-342:77:
    | ///| (escaped)
    | test "PostgreSQL numbered placeholder in CASE expression" { (escaped)
    |   let sql = "SELECT CASE WHEN age > $1 THEN 'old' ELSE 'young' END FROM users;" (escaped)
342 |   let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/parameterized.mbt:360:65-360:77:
    | ///| (escaped)
    | test "Named parameter in JOIN condition" { (escaped)
    |   let sql = "SELECT * FROM users u JOIN orders o ON u.id = o.user_id WHERE o.total > :min_total;" (escaped)
360 |   let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print (escaped)
    |                                                                 ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/parameterized.mbt:382:64-382:76:
    |   let sql1 = "SELECT * FROM users WHERE id = ?;" (escaped)
    |   let sql2 = "SELECT * FROM users WHERE id = $1;" (escaped)
    |   let sql3 = "SELECT * FROM users WHERE id = :user_id;" (escaped)
382 |   let stmt1 = parse_sql(dialect=MySQL::{  }, sql1).stmts[0] |> pretty_print (escaped)
    |                                                                ^^^^^^^^^^^^ (escaped)
    |   let stmt2 = parse_sql(dialect=Postgres::{  }, sql2).stmts[0] |> pretty_print (escaped)
    |   let stmt3 = parse_sql(dialect=Postgres::{  }, sql3).stmts[0] |> pretty_print (escaped)

<WORKDIR>/src/parameterized.mbt:383:67-383:79:
    |   let sql2 = "SELECT * FROM users WHERE id = $1;" (escaped)
    |   let sql3 = "SELECT * FROM users WHERE id = :user_id;" (escaped)
    |   let stmt1 = parse_sql(dialect=MySQL::{  }, sql1).stmts[0] |> pretty_print (escaped)
383 |   let stmt2 = parse_sql(dialect=Postgres::{  }, sql2).stmts[0] |> pretty_print (escaped)
    |                                                                   ^^^^^^^^^^^^ (escaped)
    |   let stmt3 = parse_sql(dialect=Postgres::{  }, sql3).stmts[0] |> pretty_print (escaped)
    |   inspect( (escaped)

<WORKDIR>/src/parameterized.mbt:384:67-384:79:
    |   let sql3 = "SELECT * FROM users WHERE id = :user_id;" (escaped)
    |   let stmt1 = parse_sql(dialect=MySQL::{  }, sql1).stmts[0] |> pretty_print (escaped)
    |   let stmt2 = parse_sql(dialect=Postgres::{  }, sql2).stmts[0] |> pretty_print (escaped)
384 |   let stmt3 = parse_sql(dialect=Postgres::{  }, sql3).stmts[0] |> pretty_print (escaped)
    |                                                                   ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt1, (escaped)

<WORKDIR>/src/parameterized.mbt:423:62-423:74:
    | ///| (escaped)
    | test "Placeholder in DELETE statement" { (escaped)
    |   let sql = "DELETE FROM users WHERE id = ?;" (escaped)
423 |   let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print (escaped)
    |                                                              ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/parser.mbt:789:34-789:46:
    |     Token::Identifier("t"), (escaped)
    |     Token::Semicolon, (escaped)
    |   ] (escaped)
789 |   let stmt = parse(tokens)[0] |> pretty_print (escaped)
    |                                  ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/parser.mbt:804:34-804:46:
    | ///| (escaped)
    | test "Parse USE database statement" { (escaped)
    |   let tokens = [Keyword(Use), Token::Identifier("mydb"), Token::Semicolon] (escaped)
804 |   let stmt = parse(tokens)[0] |> pretty_print (escaped)
    |                                  ^^^^^^^^^^^^ (escaped)
    |   inspect(stmt, content="USE mydb;") (escaped)
    | } (escaped)

<WORKDIR>/src/parser.mbt:817:34-817:46:
    |     Token::Identifier("production"), (escaped)
    |     Token::Semicolon, (escaped)
    |   ] (escaped)
817 |   let stmt = parse(tokens)[0] |> pretty_print (escaped)
    |                                  ^^^^^^^^^^^^ (escaped)
    |   inspect(stmt, content="USE company.production;") (escaped)
    | } (escaped)

<WORKDIR>/src/parser.mbt:828:34-828:46:
    |     Token::Identifier("my database"), (escaped)
    |     Token::Semicolon, (escaped)
    |   ] (escaped)
828 |   let stmt = parse(tokens)[0] |> pretty_print (escaped)
    |                                  ^^^^^^^^^^^^ (escaped)
    |   inspect(stmt, content="USE `my database`;") (escaped)
    | } (escaped)

<WORKDIR>/src/parser.mbt:841:34-841:46:
    |     Token::StringLiteral("/tmp/users.csv"), (escaped)
    |     Token::Semicolon, (escaped)
    |   ] (escaped)
841 |   let stmt = parse(tokens)[0] |> pretty_print (escaped)
    |                                  ^^^^^^^^^^^^ (escaped)
    |   inspect(stmt, content="COPY users TO '/tmp/users.csv';") (escaped)
    | } (escaped)

<WORKDIR>/src/parser.mbt:860:34-860:46:
    |     Token::RParen, (escaped)
    |     Token::Semicolon, (escaped)
    |   ] (escaped)
860 |   let stmt = parse(tokens)[0] |> pretty_print (escaped)
    |                                  ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/parser.mbt:881:34-881:46:
    |     Keyword(Stdout), (escaped)
    |     Token::Semicolon, (escaped)
    |   ] (escaped)
881 |   let stmt = parse(tokens)[0] |> pretty_print (escaped)
    |                                  ^^^^^^^^^^^^ (escaped)
    |   inspect(stmt, content="COPY orders (id, amount) TO STDOUT;") (escaped)
    | } (escaped)

<WORKDIR>/src/parser.mbt:909:34-909:46:
    |     Token::RParen, (escaped)
    |     Token::Semicolon, (escaped)
    |   ] (escaped)
909 |   let stmt = parse(tokens)[0] |> pretty_print (escaped)
    |                                  ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/parser.mbt:938:34-938:46:
    |     Token::RParen, (escaped)
    |     Token::Semicolon, (escaped)
    |   ] (escaped)
938 |   let stmt = parse(tokens)[0] |> pretty_print (escaped)
    |                                  ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/postgres.mbt:94:68-94:80:
   | ///| (escaped)
   | test "PostgreSQL LISTEN" { (escaped)
   |   let tokens = "LISTEN my_channel;" (escaped)
94 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print (escaped)
   |                                                                    ^^^^^^^^^^^^ (escaped)
   |   inspect( (escaped)
   |     stmt, (escaped)

<WORKDIR>/src/postgres.mbt:106:68-106:80:
    | ///| (escaped)
    | test "PostgreSQL NOTIFY without payload" { (escaped)
    |   let tokens = "NOTIFY my_channel;" (escaped)
106 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/postgres.mbt:118:68-118:80:
    | ///| (escaped)
    | test "PostgreSQL NOTIFY with payload" { (escaped)
    |   let tokens = "NOTIFY my_channel, 'hello world';" (escaped)
118 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/postgres.mbt:132:68-132:80:
    |  (escaped)
    | test "PostgreSQL ARRAY syntax with integers" { (escaped)
    |   let tokens = "SELECT ARRAY[1, 2, 3, 4] FROM test;" (escaped)
132 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/postgres.mbt:147:68-147:80:
    | ///| (escaped)
    | test "PostgreSQL bracket array syntax" { (escaped)
    |   let tokens = "SELECT [1, 2, 3] FROM test;" (escaped)
147 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/postgres.mbt:162:68-162:80:
    | ///| (escaped)
    | test "PostgreSQL empty ARRAY" { (escaped)
    |   let tokens = "SELECT ARRAY[] FROM test;" (escaped)
162 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/postgres.mbt:177:68-177:80:
    | ///| (escaped)
    | test "PostgreSQL ARRAY with strings" { (escaped)
    |   let tokens = "SELECT ARRAY['hello', 'world'] FROM test;" (escaped)
177 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/postgres.mbt:192:68-192:80:
    | ///| (escaped)
    | test "PostgreSQL nested arrays" { (escaped)
    |   let tokens = "SELECT ARRAY[ARRAY[1, 2], ARRAY[3, 4]] FROM test;" (escaped)
192 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/postgres.mbt:207:68-207:80:
    | ///| (escaped)
    | test "PostgreSQL mixed bracket and ARRAY syntax" { (escaped)
    |   let tokens = "SELECT ARRAY[[1, 2], [3, 4]] FROM test;" (escaped)
207 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/postgres.mbt:303:68-303:80:
    |  (escaped)
    | test "PostgreSQL JSON extract operator" { (escaped)
    |   let tokens = "SELECT data -> 'key' FROM json_table;" (escaped)
303 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/postgres.mbt:318:68-318:80:
    | ///| (escaped)
    | test "PostgreSQL JSON extract text operator" { (escaped)
    |   let tokens = "SELECT data ->> 'key' FROM json_table;" (escaped)
318 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/postgres.mbt:333:68-333:80:
    | ///| (escaped)
    | test "PostgreSQL JSON path extract operator" { (escaped)
    |   let tokens = "SELECT data #> ARRAY['key', 'subkey'] FROM json_table;" (escaped)
333 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/postgres.mbt:348:68-348:80:
    | ///| (escaped)
    | test "PostgreSQL JSON contains operator" { (escaped)
    |   let tokens = "SELECT data @> '{\\"key\\":\\"value\\"}' FROM json_table;" (escaped)
348 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/postgres.mbt:363:68-363:80:
    | ///| (escaped)
    | test "PostgreSQL JSON contained in operator" { (escaped)
    |   let tokens = "SELECT '{\\"a\\":1}' <@ data FROM json_table;" (escaped)
363 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/postgres.mbt:380:68-380:80:
    |  (escaped)
    | test "PostgreSQL COUNT with FILTER" { (escaped)
    |   let tokens = "SELECT count(*) FILTER (WHERE active) FROM users;" (escaped)
380 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/postgres.mbt:395:68-395:80:
    | ///| (escaped)
    | test "PostgreSQL COUNT without FILTER" { (escaped)
    |   let tokens = "SELECT count(*) FROM users;" (escaped)
395 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/postgres.mbt:410:68-410:80:
    | ///| (escaped)
    | test "PostgreSQL SUM with FILTER" { (escaped)
    |   let tokens = "SELECT sum(amount) FILTER (WHERE status = 'completed') FROM orders;" (escaped)
410 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/postgres.mbt:425:68-425:80:
    | ///| (escaped)
    | test "PostgreSQL multiple aggregations with FILTER" { (escaped)
    |   let tokens = "SELECT count(*) FILTER (WHERE active), avg(age) FILTER (WHERE age > 18) FROM users;" (escaped)
425 |   let stmt = parse_sql(dialect=Postgres::{  }, tokens).stmts[0] |> pretty_print (escaped)
    |                                                                    ^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

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
