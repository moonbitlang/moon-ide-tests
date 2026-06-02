# sqlparser hover

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
$ run_moon_ide moon ide hover 'pass' --loc 'src/tests/good_test.mbt:4:4'
// These tests are copied from https://github.com/hyrise/sql-parser/blob/main/test/queries/queries-good.sql

///|
fn pass(input : String) -> Unit {
   ^^^^
   ```moonbit
   fn pass(input : String) -> Unit
   ```
  (@sqlparser.parse_sql(input) catch {
    e => { (escaped)
```

```mooncram
$ run_moon_ide moon ide hover 'input' --loc 'src/tests/good_test.mbt:4:9'
// These tests are copied from https://github.com/hyrise/sql-parser/blob/main/test/queries/queries-good.sql

///|
fn pass(input : String) -> Unit {
        ^^^^^
        ```moonbit
        String
        ```
  (@sqlparser.parse_sql(input) catch {
    e => { (escaped)
```

```mooncram
$ run_moon_ide moon ide hover 'read_and_parse' --loc 'src/tests/tpch_test.mbt:2:4'
///|
fn read_and_parse(path : String) -> @sqlparser.Statements {
   ^^^^^^^^^^^^^^
   ```moonbit
   fn read_and_parse(path : String) -> @sqlparser.Statements
   ```
  let input = @fs.read_file_to_string(path) catch {
    e => { (escaped)
```

```mooncram
$ run_moon_ide moon ide hover 'path' --loc 'src/tests/tpch_test.mbt:2:19'
///|
fn read_and_parse(path : String) -> @sqlparser.Statements {
                  ^^^^
                  ```moonbit
                  String
                  ```
  let input = @fs.read_file_to_string(path) catch {
    e => { (escaped)
```

```mooncram
$ run_moon_ide moon ide hover 'sql' --loc 'src/tests/dialect_test.mbt:9:7'
///|
test "MySQL SHOW TABLES statement" {
  let sql = @sqlparser.parse_sql("SHOW TABLES;")
      ^^^
      ```moonbit
      @sqlparser.Statements
      ```
  inspect(sql.stmts.length(), content="1")
  let pretty = sql.stmts[0] |> @sqlparser.pretty_print
```

```mooncram
$ run_moon_ide moon ide hover 'parse_sql' --loc 'src/tests/dialect_test.mbt:9:24'
///|
test "MySQL SHOW TABLES statement" {
  let sql = @sqlparser.parse_sql("SHOW TABLES;")
            ^^^^^^^^^^^^^^^^^^^^
            ```moonbit
            fn @moonbit-community/sqlparser.parse_sql(input : String, dialect? : &@sqlparser.Dialect) -> @sqlparser.Statements raise @sqlparser.SqlParserError
            ```
  inspect(sql.stmts.length(), content="1")
  let pretty = sql.stmts[0] |> @sqlparser.pretty_print
```

```mooncram
$ run_moon_ide moon ide hover 'pretty_print' --loc 'src/ast.mbt:2:24'
///|
pub fn[T : @pp.Pretty] pretty_print(obj : T) -> String {
                       ^^^^^^^^^^^^
                       ```moonbit
                       fn[T : @pp.Pretty] pretty_print(obj : T) -> String
                       ```
  @pp.pretty(obj).to_string()
}
```

```mooncram
$ run_moon_ide moon ide hover 'obj' --loc 'src/ast.mbt:2:37'
///|
pub fn[T : @pp.Pretty] pretty_print(obj : T) -> String {
                                    ^^^
                                    ```moonbit
                                    T
                                    ```
  @pp.pretty(obj).to_string()
}
```

```mooncram
$ run_moon_ide moon ide hover 'Parser' --loc 'src/dcl.mbt:5:4'
// DCL (Data Control Language) parsing functions

///|
fn Parser::parse_grant_statement(
   ^^^^^^
   ```moonbit
   struct Parser {
     dialect: &Dialect
   }
   ```
  self : Parser,
  tokens : ArrayView[Token],
```

```mooncram
$ run_moon_ide moon ide hover 'parse_grant_statement' --loc 'src/dcl.mbt:5:12'
// DCL (Data Control Language) parsing functions

///|
fn Parser::parse_grant_statement(
           ^^^^^^^^^^^^^^^^^^^^^
           ```moonbit
           fn Parser::parse_grant_statement(self : Parser, tokens : ArrayView[Token]) -> (GrantStmt, ArrayView[Token]) raise ParserError
           ```
  self : Parser,
  tokens : ArrayView[Token],
```
