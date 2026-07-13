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
$ run_moon_ide moon ide hover 'BigQuery' --loc 'src/bigquery.mbt:3:17'
///|
/// BigQuery dialect - supports Google BigQuery specific syntax
pub(all) struct BigQuery {}
                ^^^^^^^^
                ```moonbit
                struct BigQuery {
                }
                ```
                ---
                
                 BigQuery dialect - supports Google BigQuery specific syntax

///|
```

```mooncram
$ run_moon_ide moon ide hover 'BigQuery' --loc 'src/bigquery.mbt:6:22'
pub(all) struct BigQuery {}

///|
pub impl Dialect for BigQuery with supports_string_literal_backslash_escape(
                     ^^^^^^^^
                     ```moonbit
                     struct BigQuery {
                     }
                     ```
                     ---
                     
                      BigQuery dialect - supports Google BigQuery specific syntax
  _self,
) {
```

```mooncram
$ run_moon_ide moon ide hover 'Parser' --loc 'src/dml.mbt:2:4'
///|
fn Parser::parse_set_expr(
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
$ run_moon_ide moon ide hover 'parse_set_expr' --loc 'src/dml.mbt:2:12'
///|
fn Parser::parse_set_expr(
           ^^^^^^^^^^^^^^
           ```moonbit
           fn Parser::parse_set_expr(self : Parser, tokens : ArrayView[Token], min_bp : Int) -> (SetExpr, ArrayView[Token]) raise ParserError
           ```
  self : Parser,
  tokens : ArrayView[Token],
```

```mooncram
$ run_moon_ide moon ide hover 'Generic' --loc 'src/generic.mbt:5:17'
/// Generic SQL dialect that supports the union of all other dialects
/// This is the most permissive dialect, useful for parsing various SQL statements
/// from different sources without strict dialect requirements
pub(all) struct Generic {}
                ^^^^^^^
                ```moonbit
                struct Generic {
                }
                ```
                ---
                
                 Generic SQL dialect that supports the union of all other dialects
                 This is the most permissive dialect, useful for parsing various SQL statements
                 from different sources without strict dialect requirements

///|
```

```mooncram
$ run_moon_ide moon ide hover 'Generic' --loc 'src/generic.mbt:8:22'
pub(all) struct Generic {}

///|
pub impl Dialect for Generic with supports_string_literal_backslash_escape(
                     ^^^^^^^
                     ```moonbit
                     struct Generic {
                     }
                     ```
                     ---
                     
                      Generic SQL dialect that supports the union of all other dialects
                      This is the most permissive dialect, useful for parsing various SQL statements
                      from different sources without strict dialect requirements
  _self,
) {
```

```mooncram
$ run_moon_ide moon ide hover 'LexerError' --loc 'src/lexer.mbt:2:10'
///|
suberror LexerError {
         ^^^^^^^^^^
         ```moonbit
         suberror LexerError {
           UnterminatedString
           UnknownCharacter(Char)
         } derive(@debug.Debug)
         ```
  UnterminatedString
  UnknownCharacter(Char)
```

```mooncram
$ run_moon_ide moon ide hover 'UnterminatedString' --loc 'src/lexer.mbt:3:3'
///|
suberror LexerError {
  UnterminatedString
  ^^^^^^^^^^^^^^^^^^
  ```moonbit
  LexerError
  ```
  UnknownCharacter(Char)
} derive(Debug)
```

```mooncram
$ run_moon_ide moon ide hover 'sql' --loc 'src/prepare.mbt:6:7'
///|
test "PREPARE simple SELECT" {
  let sql = "PREPARE stmt AS SELECT * FROM users WHERE id = ?"
      ^^^
      ```moonbit
      String
      ```
  let stmt = parse_sql(sql)[0] |> pretty_print
  inspect(
```

```mooncram
$ run_moon_ide moon ide hover 'stmt' --loc 'src/prepare.mbt:7:7'
///|
test "PREPARE simple SELECT" {
  let sql = "PREPARE stmt AS SELECT * FROM users WHERE id = ?"
  let stmt = parse_sql(sql)[0] |> pretty_print
      ^^^^
      ```moonbit
      String
      ```
  inspect(
    stmt,
```

```mooncram
$ run_moon_ide moon ide hover 'Redshift' --loc 'src/redshift.mbt:3:17'
///|
/// Redshift dialect - supports Amazon Redshift specific syntax
pub(all) struct Redshift {}
                ^^^^^^^^
                ```moonbit
                struct Redshift {
                }
                ```
                ---
                
                 Redshift dialect - supports Amazon Redshift specific syntax

///|
```

```mooncram
$ run_moon_ide moon ide hover 'Redshift' --loc 'src/redshift.mbt:6:22'
pub(all) struct Redshift {}

///|
pub impl Dialect for Redshift with supports_string_literal_backslash_escape(
                     ^^^^^^^^
                     ```moonbit
                     struct Redshift {
                     }
                     ```
                     ---
                     
                      Redshift dialect - supports Amazon Redshift specific syntax
  _self,
) {
```

```mooncram
$ run_moon_ide moon ide hover 'show_compact_debug' --loc 'src/show.mbt:2:15'
///|
fn[T : Debug] show_compact_debug(obj : T, logger : &Logger) -> Unit {
              ^^^^^^^^^^^^^^^^^^
              ```moonbit
              fn[T : @debug.Debug] show_compact_debug(obj : T, logger : &Logger) -> Unit
              ```
  let input = @debug.to_string(obj)
  let buffer = StringBuilder::new()
```

```mooncram
$ run_moon_ide moon ide hover 'obj' --loc 'src/show.mbt:2:34'
///|
fn[T : Debug] show_compact_debug(obj : T, logger : &Logger) -> Unit {
                                 ^^^
                                 ```moonbit
                                 T
                                 ```
  let input = @debug.to_string(obj)
  let buffer = StringBuilder::new()
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
