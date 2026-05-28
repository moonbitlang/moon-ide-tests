# sqlparser peek-def

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$PWD"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
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

```mooncram
$ run_moon_ide moon ide peek-def 'sql' --loc 'src/tests/dialect_test.mbt:9:7'
Definition found at file <WORKDIR>/src/tests/dialect_test.mbt
  |  (escaped)
  | // ===== MySQL SHOW Statement Tests (ported from datafusion) ===== (escaped)
  |  (escaped)
  | ///| (escaped)
  | test "MySQL SHOW TABLES statement" { (escaped)
9 |   let sql = @sqlparser.parse_sql("SHOW TABLES;") (escaped)
  |       ^^^ (escaped)
  |   inspect(sql.stmts.length(), content="1") (escaped)
  |   let pretty = sql.stmts[0] |> @sqlparser.pretty_print (escaped)
  |   inspect(pretty, content="SHOW TABLES;") (escaped)
  | } (escaped)
  |  (escaped)
  | ///| (escaped)
  | test "MySQL SHOW COLUMNS with FROM" { (escaped)
  |   let sql = @sqlparser.parse_sql("SHOW COLUMNS FROM users;") (escaped)
  |   inspect(sql.stmts.length(), content="1") (escaped)
  |   let pretty = sql.stmts[0] |> @sqlparser.pretty_print (escaped)
  |   inspect(pretty, content="SHOW COLUMNS FROM users;") (escaped)
  | } (escaped)
  |  (escaped)
  | ///| (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'parse_sql' --loc 'src/tests/dialect_test.mbt:9:24'
Definition found at file <WORKDIR>/src/export.mbt
  |   LexerError(LexerError) (escaped)
  |   ParserError(ParserError) (escaped)
  | } derive(Debug) (escaped)
  |  (escaped)
  | ///| (escaped)
8 | pub fn parse_sql( (escaped)
  |        ^^^^^^^^^ (escaped)
  |   dialect? : &Dialect = MySQL::{  }, (escaped)
  |   input : String, (escaped)
  | ) -> Statements raise SqlParserError { (escaped)
  |   let tokens = tokenize(dialect~, input) catch { (escaped)
  |     e => raise SqlParserError::LexerError(e) (escaped)
  |   } (escaped)
  |   let stmts = parse(dialect~, tokens) catch { (escaped)
  |     e => raise SqlParserError::ParserError(e) (escaped)
  |   } (escaped)
  |   { stmts, } (escaped)
  | } (escaped)
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
$ run_moon_ide moon ide peek-def 'Parser' --loc 'src/dcl.mbt:5:4'
Definition found at file <WORKDIR>/src/parser.mbt
   |  (escaped)
   | ///| (escaped)
   | type ParserResult[T] = (T, ArrayView[Token]) (escaped)
   |  (escaped)
   | ///| (escaped)
15 | pub struct Parser { (escaped)
   |            ^^^^^^ (escaped)
   |   dialect : &Dialect (escaped)
   |   // recursion counter (escaped)
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
   | fn[T, U] ParserResult::map( (escaped)
   |   self : ParserResult[T], (escaped)
   |   f : (T) -> U, (escaped)
   | ) -> ParserResult[U] { (escaped)
   |   let (result, tokens) = self (escaped)
   |   (f(result), tokens) (escaped)
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'parse_grant_statement' --loc 'src/dcl.mbt:5:12'
Definition found at file <WORKDIR>/src/dcl.mbt
  | ///| (escaped)
  | // DCL (Data Control Language) parsing functions (escaped)
  |  (escaped)
  | ///| (escaped)
5 | fn Parser::parse_grant_statement( (escaped)
  |            ^^^^^^^^^^^^^^^^^^^^^ (escaped)
  |   self : Parser, (escaped)
  |   tokens : ArrayView[Token], (escaped)
  | ) -> ParserResult[GrantStmt] raise ParserError { (escaped)
  |   let tokens = self.expect_token(tokens, Keyword(Grant)) (escaped)
  |  (escaped)
  |   // Parse privileges (escaped)
  |   let (privileges, tokens) = self.parse_privilege_list(tokens) (escaped)
  |  (escaped)
  |   // Parse ON (escaped)
  |   let tokens = self.expect_token(tokens, Keyword(On)) (escaped)
  |  (escaped)
  |   // Parse objects (tables, views, etc.) (escaped)
  |   let (objects, tokens) = self.parse_object_name_list(tokens) (escaped)
  |  (escaped)
```
