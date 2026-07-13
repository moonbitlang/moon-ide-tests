# sqlparser peek-def

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
$ run_moon_ide moon ide peek-def 'pretty_print' --loc 'src/ast.mbt:2:24'
Definition found at file <WORKDIR>/src/ast.mbt
  | ///| (escaped)
2 | pub fn[T : @pp.Pretty] pretty_print(obj : T) -> String { (escaped)
  |                        ^^^^^^^^^^^^ (escaped)
  |   @pp.pretty(obj).to_string() (escaped)
  | } (escaped)
  |  (escaped)
  | ///| (escaped)
  | pub fn[T : Show] structural_print(obj : T) -> String { (escaped)
  |   obj.to_string() (escaped)
  | } (escaped)
  |  (escaped)
  | ///| (escaped)
  | pub(all) struct Statements { (escaped)
  |   /// The list of SQL statements parsed from the input. (escaped)
  |   stmts : Array[Statement] (escaped)
  | } derive(Eq, Debug) (escaped)
  |  (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'obj' --loc 'src/ast.mbt:2:37'
Definition found at file <WORKDIR>/src/ast.mbt
  | ///| (escaped)
2 | pub fn[T : @pp.Pretty] pretty_print(obj : T) -> String { (escaped)
  |                                     ^^^ (escaped)
  |   @pp.pretty(obj).to_string() (escaped)
  | } (escaped)
  |  (escaped)
  | ///| (escaped)
  | pub fn[T : Show] structural_print(obj : T) -> String { (escaped)
  |   obj.to_string() (escaped)
  | } (escaped)
  |  (escaped)
  | ///| (escaped)
  | pub(all) struct Statements { (escaped)
  |   /// The list of SQL statements parsed from the input. (escaped)
  |   stmts : Array[Statement] (escaped)
  | } derive(Eq, Debug) (escaped)
  |  (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'BigQuery' --loc 'src/bigquery.mbt:3:17'
Definition found at file <WORKDIR>/src/bigquery.mbt
  | ///|
  | /// BigQuery dialect - supports Google BigQuery specific syntax
3 | pub(all) struct BigQuery {}
  |                 ^^^^^^^^
  | 
  | ///|
  | pub impl Dialect for BigQuery with supports_string_literal_backslash_escape(
  |   _self,
  | ) {
  |   true
  | }
  | 
  | ///|
  | pub impl Dialect for BigQuery with supports_boolean_literals(_self) {
  |   true
  | }
  | 
  | ///|
```

```mooncram
$ run_moon_ide moon ide peek-def 'BigQuery' --loc 'src/bigquery.mbt:6:22'
Definition found at file <WORKDIR>/src/bigquery.mbt
  | ///|
  | /// BigQuery dialect - supports Google BigQuery specific syntax
3 | pub(all) struct BigQuery {}
  |                 ^^^^^^^^
  | 
  | ///|
  | pub impl Dialect for BigQuery with supports_string_literal_backslash_escape(
  |   _self,
  | ) {
  |   true
  | }
  | 
  | ///|
  | pub impl Dialect for BigQuery with supports_boolean_literals(_self) {
  |   true
  | }
  | 
  | ///|
```

```mooncram
$ run_moon_ide moon ide peek-def 'Parser' --loc 'src/dml.mbt:2:4'
Definition found at file <WORKDIR>/src/parser.mbt
   | 
   | ///|
   | type ParserResult[T] = (T, ArrayView[Token])
   | 
   | ///|
15 | pub struct Parser {
   |            ^^^^^^
   |   dialect : &Dialect
   |   // recursion counter
   | }
   | 
   | ///|
   | fn[T, U] ParserResult::map(
   |   self : ParserResult[T],
   |   f : (T) -> U,
   | ) -> ParserResult[U] {
   |   let (result, tokens) = self
   |   (f(result), tokens)
   | }
   | 
   | ///|
```

```mooncram
$ run_moon_ide moon ide peek-def 'parse_set_expr' --loc 'src/dml.mbt:2:12'
Definition found at file <WORKDIR>/src/dml.mbt
  | ///|
2 | fn Parser::parse_set_expr(
  |            ^^^^^^^^^^^^^^
  |   self : Parser,
  |   tokens : ArrayView[Token],
  |   min_bp : Int,
  | ) -> ParserResult[SetExpr] raise ParserError {
  |   let mut left_tokens = match tokens {
  |     [LParen, .. tokens] => {
  |       let (query, tokens) = self.parse_query(tokens)
  |       let tokens = self.expect_token(tokens, RParen)
  |       (SetExpr::Query(query), tokens)
  |     }
  |     [Keyword(Select), ..] as tokens => {
  |       let (select_stmt, tokens) = self.parse_select(tokens)
  |       (SetExpr::Select(select_stmt), tokens)
  |     }
```

```mooncram
$ run_moon_ide moon ide peek-def 'Generic' --loc 'src/generic.mbt:5:17'
Definition found at file <WORKDIR>/src/generic.mbt
  | ///|
  | /// Generic SQL dialect that supports the union of all other dialects
  | /// This is the most permissive dialect, useful for parsing various SQL statements
  | /// from different sources without strict dialect requirements
5 | pub(all) struct Generic {}
  |                 ^^^^^^^
  | 
  | ///|
  | pub impl Dialect for Generic with supports_string_literal_backslash_escape(
  |   _self,
  | ) {
  |   true
  | }
  | 
  | ///|
  | pub impl Dialect for Generic with supports_boolean_literals(_self) {
  |   true
  | }
  | 
  | ///|
```

```mooncram
$ run_moon_ide moon ide peek-def 'Generic' --loc 'src/generic.mbt:8:22'
Definition found at file <WORKDIR>/src/generic.mbt
  | ///|
  | /// Generic SQL dialect that supports the union of all other dialects
  | /// This is the most permissive dialect, useful for parsing various SQL statements
  | /// from different sources without strict dialect requirements
5 | pub(all) struct Generic {}
  |                 ^^^^^^^
  | 
  | ///|
  | pub impl Dialect for Generic with supports_string_literal_backslash_escape(
  |   _self,
  | ) {
  |   true
  | }
  | 
  | ///|
  | pub impl Dialect for Generic with supports_boolean_literals(_self) {
  |   true
  | }
  | 
  | ///|
```

```mooncram
$ run_moon_ide moon ide peek-def 'LexerError' --loc 'src/lexer.mbt:2:10'
Definition found at file <WORKDIR>/src/lexer.mbt
  | ///|
2 | suberror LexerError {
  |          ^^^^^^^^^^
  |   UnterminatedString
  |   UnknownCharacter(Char)
  | } derive(Debug)
  | 
  | ///|
  | pub(all) enum Token {
  |   Keyword(Keyword)
  |   Identifier(String)
  |   Number(String)
  |   StringLiteral(String)
  |   Boolean(Bool)
  |   Comma
  |   Semicolon
  |   Colon
```

```mooncram
$ run_moon_ide moon ide peek-def 'UnterminatedString' --loc 'src/lexer.mbt:3:3'
Definition found at file <WORKDIR>/src/lexer.mbt
  | ///|
  | suberror LexerError {
3 |   UnterminatedString
  |   ^^^^^^^^^^^^^^^^^^
  |   UnknownCharacter(Char)
  | } derive(Debug)
  | 
  | ///|
  | pub(all) enum Token {
  |   Keyword(Keyword)
  |   Identifier(String)
  |   Number(String)
  |   StringLiteral(String)
  |   Boolean(Bool)
  |   Comma
  |   Semicolon
  |   Colon
  |   Eq
```

```mooncram
$ run_moon_ide moon ide peek-def 'sql' --loc 'src/prepare.mbt:6:7'
Definition found at file <WORKDIR>/src/prepare.mbt
  | ///|
  | /// Test cases for PREPARE/EXECUTE/DEALLOCATE statements
  | 
  | ///|
  | test "PREPARE simple SELECT" {
6 |   let sql = "PREPARE stmt AS SELECT * FROM users WHERE id = ?"
  |       ^^^
  |   let stmt = parse_sql(sql)[0] |> pretty_print
  |   inspect(
  |     stmt,
  |     content=(
  |       #|PREPARE stmt AS SELECT
  |       #|  *
  |       #|FROM
  |       #|  users
  |       #|WHERE
  |       #|  id = ?;
  |     ),
  |   )
  | }
  | 
```

```mooncram
$ run_moon_ide moon ide peek-def 'stmt' --loc 'src/prepare.mbt:7:7'
Definition found at file <WORKDIR>/src/prepare.mbt
  | /// Test cases for PREPARE/EXECUTE/DEALLOCATE statements
  | 
  | ///|
  | test "PREPARE simple SELECT" {
  |   let sql = "PREPARE stmt AS SELECT * FROM users WHERE id = ?"
7 |   let stmt = parse_sql(sql)[0] |> pretty_print
  |       ^^^^
  |   inspect(
  |     stmt,
  |     content=(
  |       #|PREPARE stmt AS SELECT
  |       #|  *
  |       #|FROM
  |       #|  users
  |       #|WHERE
  |       #|  id = ?;
  |     ),
  |   )
  | }
  | 
  | ///|
```

```mooncram
$ run_moon_ide moon ide peek-def 'Redshift' --loc 'src/redshift.mbt:3:17'
Definition found at file <WORKDIR>/src/redshift.mbt
  | ///|
  | /// Redshift dialect - supports Amazon Redshift specific syntax
3 | pub(all) struct Redshift {}
  |                 ^^^^^^^^
  | 
  | ///|
  | pub impl Dialect for Redshift with supports_string_literal_backslash_escape(
  |   _self,
  | ) {
  |   true
  | }
  | 
  | ///|
  | pub impl Dialect for Redshift with supports_boolean_literals(_self) {
  |   true
  | }
  | 
  | ///|
```

```mooncram
$ run_moon_ide moon ide peek-def 'Redshift' --loc 'src/redshift.mbt:6:22'
Definition found at file <WORKDIR>/src/redshift.mbt
  | ///|
  | /// Redshift dialect - supports Amazon Redshift specific syntax
3 | pub(all) struct Redshift {}
  |                 ^^^^^^^^
  | 
  | ///|
  | pub impl Dialect for Redshift with supports_string_literal_backslash_escape(
  |   _self,
  | ) {
  |   true
  | }
  | 
  | ///|
  | pub impl Dialect for Redshift with supports_boolean_literals(_self) {
  |   true
  | }
  | 
  | ///|
```

```mooncram
$ run_moon_ide moon ide peek-def 'show_compact_debug' --loc 'src/show.mbt:2:15'
Definition found at file <WORKDIR>/src/show.mbt
  | ///|
2 | fn[T : Debug] show_compact_debug(obj : T, logger : &Logger) -> Unit {
  |               ^^^^^^^^^^^^^^^^^^
  |   let input = @debug.to_string(obj)
  |   let buffer = StringBuilder::new()
  |   let mut in_string = false
  |   let mut escaped = false
  |   for rest = input[:] {
  |     match rest {
  |       [] => break
  |       ['{', ' ', .. next] if !in_string => {
  |         buffer.write_char('{')
  |         continue next
  |       }
  |       [' ', '}', .. next] if !in_string => {
  |         buffer.write_char('}')
  |         continue next
```

```mooncram
$ run_moon_ide moon ide peek-def 'obj' --loc 'src/show.mbt:2:34'
Definition found at file <WORKDIR>/src/show.mbt
  | ///|
2 | fn[T : Debug] show_compact_debug(obj : T, logger : &Logger) -> Unit {
  |                                  ^^^
  |   let input = @debug.to_string(obj)
  |   let buffer = StringBuilder::new()
  |   let mut in_string = false
  |   let mut escaped = false
  |   for rest = input[:] {
  |     match rest {
  |       [] => break
  |       ['{', ' ', .. next] if !in_string => {
  |         buffer.write_char('{')
  |         continue next
  |       }
  |       [' ', '}', .. next] if !in_string => {
  |         buffer.write_char('}')
  |         continue next
```

```mooncram
$ run_moon_ide moon ide peek-def 'pass' --loc 'src/tests/good_test.mbt:4:4'
Definition found at file <WORKDIR>/src/tests/good_test.mbt
  | // These tests are copied from https://github.com/hyrise/sql-parser/blob/main/test/queries/queries-good.sql (escaped)
  |  (escaped)
  | ///| (escaped)
4 | fn pass(input : String) -> Unit { (escaped)
  |    ^^^^ (escaped)
  |   (@sqlparser.parse_sql(input) catch { (escaped)
  |     e => { (escaped)
  |       println(e) (escaped)
  |       panic() (escaped)
  |     } (escaped)
  |   }) (escaped)
  |   |> ignore (escaped)
  | } (escaped)
  |  (escaped)
  | ///| (escaped)
  | test { (escaped)
  |   "SELECT * FROM orders;" |> pass (escaped)
  | } (escaped)
  |  (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'input' --loc 'src/tests/good_test.mbt:4:9'
Definition found at file <WORKDIR>/src/tests/good_test.mbt
  | // These tests are copied from https://github.com/hyrise/sql-parser/blob/main/test/queries/queries-good.sql (escaped)
  |  (escaped)
  | ///| (escaped)
4 | fn pass(input : String) -> Unit { (escaped)
  |         ^^^^^ (escaped)
  |   (@sqlparser.parse_sql(input) catch { (escaped)
  |     e => { (escaped)
  |       println(e) (escaped)
  |       panic() (escaped)
  |     } (escaped)
  |   }) (escaped)
  |   |> ignore (escaped)
  | } (escaped)
  |  (escaped)
  | ///| (escaped)
  | test { (escaped)
  |   "SELECT * FROM orders;" |> pass (escaped)
  | } (escaped)
  |  (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'read_and_parse' --loc 'src/tests/tpch_test.mbt:2:4'
Definition found at file <WORKDIR>/src/tests/tpch_test.mbt
  | ///| (escaped)
2 | fn read_and_parse(path : String) -> @sqlparser.Statements { (escaped)
  |    ^^^^^^^^^^^^^^ (escaped)
  |   let input = @fs.read_file_to_string(path) catch { (escaped)
  |     e => { (escaped)
  |       println("Read file error: \\{e.to_string()}") (escaped)
  |       panic() (escaped)
  |     } (escaped)
  |   } (escaped)
  |   @sqlparser.parse_sql(input) catch { (escaped)
  |     LexerError(e) => { (escaped)
  |       println(e) (escaped)
  |       panic() (escaped)
  |     } (escaped)
  |     ParserError(e) => { (escaped)
  |       println(e) (escaped)
  |       panic() (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'path' --loc 'src/tests/tpch_test.mbt:2:19'
Definition found at file <WORKDIR>/src/tests/tpch_test.mbt
  | ///| (escaped)
2 | fn read_and_parse(path : String) -> @sqlparser.Statements { (escaped)
  |                   ^^^^ (escaped)
  |   let input = @fs.read_file_to_string(path) catch { (escaped)
  |     e => { (escaped)
  |       println("Read file error: \\{e.to_string()}") (escaped)
  |       panic() (escaped)
  |     } (escaped)
  |   } (escaped)
  |   @sqlparser.parse_sql(input) catch { (escaped)
  |     LexerError(e) => { (escaped)
  |       println(e) (escaped)
  |       panic() (escaped)
  |     } (escaped)
  |     ParserError(e) => { (escaped)
  |       println(e) (escaped)
  |       panic() (escaped)
```
