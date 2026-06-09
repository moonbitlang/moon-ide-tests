# sqlparser peek-def

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide peek-def 'pass' --loc 'src\tests\good_test.mbt:4:4'
Definition found at file <WORKDIR>/src\tests\good_test.mbt
  | // These tests are copied from https://github.com/hyrise/sql-parser/blob/main/test/queries/queries-good.sql
  | 
  | ///|
4 | fn pass(input : String) -> Unit {
  |    ^^^^
  |   (@sqlparser.parse_sql(input) catch {
  |     e => {
  |       println(e)
  |       panic()
  |     }
  |   })
  |   |> ignore
  | }
  | 
  | ///|
  | test {
  |   "SELECT * FROM orders;" |> pass
  | }
  | 
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide peek-def 'input' --loc 'src\tests\good_test.mbt:4:9'
Definition found at file <WORKDIR>/src\tests\good_test.mbt
  | // These tests are copied from https://github.com/hyrise/sql-parser/blob/main/test/queries/queries-good.sql
  | 
  | ///|
4 | fn pass(input : String) -> Unit {
  |         ^^^^^
  |   (@sqlparser.parse_sql(input) catch {
  |     e => {
  |       println(e)
  |       panic()
  |     }
  |   })
  |   |> ignore
  | }
  | 
  | ///|
  | test {
  |   "SELECT * FROM orders;" |> pass
  | }
  | 
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide peek-def 'read_and_parse' --loc 'src\tests\tpch_test.mbt:2:4'
Definition found at file <WORKDIR>/src\tests\tpch_test.mbt
  | ///|
2 | fn read_and_parse(path : String) -> @sqlparser.Statements {
  |    ^^^^^^^^^^^^^^
  |   let input = @fs.read_file_to_string(path) catch {
  |     e => {
  |       println("Read file error: \{e.to_string()}")
  |       panic()
  |     }
  |   }
  |   @sqlparser.parse_sql(input) catch {
  |     LexerError(e) => {
  |       println(e)
  |       panic()
  |     }
  |     ParserError(e) => {
  |       println(e)
  |       panic()
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide peek-def 'path' --loc 'src\tests\tpch_test.mbt:2:19'
Definition found at file <WORKDIR>/src\tests\tpch_test.mbt
  | ///|
2 | fn read_and_parse(path : String) -> @sqlparser.Statements {
  |                   ^^^^
  |   let input = @fs.read_file_to_string(path) catch {
  |     e => {
  |       println("Read file error: \{e.to_string()}")
  |       panic()
  |     }
  |   }
  |   @sqlparser.parse_sql(input) catch {
  |     LexerError(e) => {
  |       println(e)
  |       panic()
  |     }
  |     ParserError(e) => {
  |       println(e)
  |       panic()
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide peek-def 'sql' --loc 'src\tests\dialect_test.mbt:9:7'
Definition found at file <WORKDIR>/src\tests\dialect_test.mbt
  | 
  | // ===== MySQL SHOW Statement Tests (ported from datafusion) =====
  | 
  | ///|
  | test "MySQL SHOW TABLES statement" {
9 |   let sql = @sqlparser.parse_sql("SHOW TABLES;")
  |       ^^^
  |   inspect(sql.stmts.length(), content="1")
  |   let pretty = sql.stmts[0] |> @sqlparser.pretty_print
  |   inspect(pretty, content="SHOW TABLES;")
  | }
  | 
  | ///|
  | test "MySQL SHOW COLUMNS with FROM" {
  |   let sql = @sqlparser.parse_sql("SHOW COLUMNS FROM users;")
  |   inspect(sql.stmts.length(), content="1")
  |   let pretty = sql.stmts[0] |> @sqlparser.pretty_print
  |   inspect(pretty, content="SHOW COLUMNS FROM users;")
  | }
  | 
  | ///|
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide peek-def 'parse_sql' --loc 'src\tests\dialect_test.mbt:9:24'
Definition found at file <WORKDIR>/src\export.mbt
  |   LexerError(LexerError)
  |   ParserError(ParserError)
  | } derive(Debug)
  | 
  | ///|
8 | pub fn parse_sql(
  |        ^^^^^^^^^
  |   dialect? : &Dialect = MySQL::{  },
  |   input : String,
  | ) -> Statements raise SqlParserError {
  |   let tokens = tokenize(dialect~, input) catch {
  |     e => raise SqlParserError::LexerError(e)
  |   }
  |   let stmts = parse(dialect~, tokens) catch {
  |     e => raise SqlParserError::ParserError(e)
  |   }
  |   { stmts, }
  | }
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide peek-def 'pretty_print' --loc 'src\ast.mbt:2:24'
Definition found at file <WORKDIR>/src\ast.mbt
  | ///|
2 | pub fn[T : @pp.Pretty] pretty_print(obj : T) -> String {
  |                        ^^^^^^^^^^^^
  |   @pp.pretty(obj).to_string()
  | }
  | 
  | ///|
  | pub fn[T : Show] structural_print(obj : T) -> String {
  |   obj.to_string()
  | }
  | 
  | ///|
  | pub(all) struct Statements {
  |   /// The list of SQL statements parsed from the input.
  |   stmts : Array[Statement]
  | } derive(Eq, Debug)
  | 
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide peek-def 'obj' --loc 'src\ast.mbt:2:37'
Definition found at file <WORKDIR>/src\ast.mbt
  | ///|
2 | pub fn[T : @pp.Pretty] pretty_print(obj : T) -> String {
  |                                     ^^^
  |   @pp.pretty(obj).to_string()
  | }
  | 
  | ///|
  | pub fn[T : Show] structural_print(obj : T) -> String {
  |   obj.to_string()
  | }
  | 
  | ///|
  | pub(all) struct Statements {
  |   /// The list of SQL statements parsed from the input.
  |   stmts : Array[Statement]
  | } derive(Eq, Debug)
  | 
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide peek-def 'Parser' --loc 'src\dcl.mbt:5:4'
Definition found at file <WORKDIR>/src\parser.mbt
   | 
   | ///|
   | type ParserResult[T] = (T, ArrayView[Token]) (escaped)
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
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide peek-def 'parse_grant_statement' --loc 'src\dcl.mbt:5:12'
Definition found at file <WORKDIR>/src\dcl.mbt
  | ///|
  | // DCL (Data Control Language) parsing functions
  | 
  | ///|
5 | fn Parser::parse_grant_statement(
  |            ^^^^^^^^^^^^^^^^^^^^^
  |   self : Parser,
  |   tokens : ArrayView[Token],
  | ) -> ParserResult[GrantStmt] raise ParserError {
  |   let tokens = self.expect_token(tokens, Keyword(Grant))
  | 
  |   // Parse privileges
  |   let (privileges, tokens) = self.parse_privilege_list(tokens)
  | 
  |   // Parse ON
  |   let tokens = self.expect_token(tokens, Keyword(On))
  | 
  |   // Parse objects (tables, views, etc.) (escaped)
  |   let (objects, tokens) = self.parse_object_name_list(tokens)
  | 
```
