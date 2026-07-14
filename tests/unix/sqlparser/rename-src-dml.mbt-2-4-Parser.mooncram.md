# sqlparser rename Parser src/dml.mbt:2:4

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
$ run_moon_ide moon ide rename 'Parser' 'ParserRenamed' --loc 'src/dml.mbt:2:4'
*** Begin Patch
*** Update File: <WORKDIR>/src/ansi.mbt
@@
 ///|
 pub impl Dialect for ANSI with parse_statement(
   _self : ANSI,
-  _parser : Parser,
+  _parser : ParserRenamed,
   _tokens : ArrayView[Token],
 ) -> ParserResult[Statement]? raise ParserError {
   None
*** Update File: <WORKDIR>/src/bigquery.mbt
@@
 ///|
 pub impl Dialect for BigQuery with parse_statement(
   _self : BigQuery,
-  _parser : Parser,
+  _parser : ParserRenamed,
   _tokens : ArrayView[Token],
 ) -> ParserResult[Statement]? raise ParserError {
   None
*** Update File: <WORKDIR>/src/clickhouse.mbt
@@
 ///|
 pub impl Dialect for ClickHouse with parse_statement(
   _self : ClickHouse,
-  _parser : Parser,
+  _parser : ParserRenamed,
   _tokens : ArrayView[Token],
 ) -> ParserResult[Statement]? raise ParserError {
   None
*** Update File: <WORKDIR>/src/dcl.mbt
@@
 // DCL (Data Control Language) parsing functions
 
 ///|
-fn Parser::parse_grant_statement(
+fn ParserRenamed::parse_grant_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[GrantStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Grant))
@@
 }
 
 ///|
-fn Parser::parse_revoke_statement(
+fn ParserRenamed::parse_revoke_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[RevokeStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Revoke))
@@
 }
 
 ///|
-fn Parser::parse_privilege_list(
+fn ParserRenamed::parse_privilege_list(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Array[Privilege]] raise ParserError {
   let privileges = []
@@
 }
 
 ///|
-fn Parser::parse_privilege(
+fn ParserRenamed::parse_privilege(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Privilege] raise ParserError {
   match tokens {
@@
 }
 
 ///|
-fn Parser::parse_optional_column_list(
+fn ParserRenamed::parse_optional_column_list(
-  _self : Parser,
+  _self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Array[String]?] raise ParserError {
   match tokens {
@@
 }
 
 ///|
-fn Parser::parse_object_name_list(
+fn ParserRenamed::parse_object_name_list(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Array[ObjectName]] raise ParserError {
   let objects = []
@@
 }
 
 ///|
-fn Parser::parse_grantee_list(
+fn ParserRenamed::parse_grantee_list(
-  _self : Parser,
+  _self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Array[String]] raise ParserError {
   let grantees = []
*** Update File: <WORKDIR>/src/ddl.mbt
@@
 ///|
-fn Parser::parse_create_table_statement(
+fn ParserRenamed::parse_create_table_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[CreateTableStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Create))
@@
 
 ///|
 /// Parse CREATE INDEX statement
-fn Parser::parse_create_index_statement(
+fn ParserRenamed::parse_create_index_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[CreateIndexStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Create))
@@
 }
 
 ///|
-fn Parser::parse_column_defs(
+fn ParserRenamed::parse_column_defs(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[(Array[ColumnDef], Array[TableConstraint])] raise ParserError {
   let columns = []
@@
 }
 
 ///|
-fn Parser::parse_data_type(
+fn ParserRenamed::parse_data_type(
-  _self : Parser,
+  _self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[DataType] raise ParserError {
   match tokens {
@@
 }
 
 ///|
-fn Parser::parse_column_def_option(
+fn ParserRenamed::parse_column_def_option(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Array[ColumnDefOption]] raise ParserError {
   let options = []
@@
 }
 
 ///|
-fn Parser::parse_create_view_statement(
+fn ParserRenamed::parse_create_view_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[CreateViewStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Create))
@@
 }
 
 ///|
-fn Parser::parse_view_column_def(
+fn ParserRenamed::parse_view_column_def(
-  _self : Parser,
+  _self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[ViewColumnDef] raise ParserError {
   match tokens {
@@
 }
 
 ///|
-fn Parser::parse_drop_view_statement(
+fn ParserRenamed::parse_drop_view_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[DropViewStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Drop))
@@
 }
 
 ///|
-fn Parser::parse_table_constraint(
+fn ParserRenamed::parse_table_constraint(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[TableConstraint] raise ParserError {
   match tokens {
@@
 }
 
 ///|
-fn Parser::parse_foreign_key_constraint(
+fn ParserRenamed::parse_foreign_key_constraint(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[TableConstraint] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Foreign))
@@
 }
 
 ///|
-fn Parser::parse_drop_table_statement(
+fn ParserRenamed::parse_drop_table_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[DropTableStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Drop))
@@
 }
 
 ///|
-fn Parser::parse_drop_index_statement(
+fn ParserRenamed::parse_drop_index_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[DropIndexStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Drop))
@@
 }
 
 ///|
-fn Parser::parse_alter_table_statement(
+fn ParserRenamed::parse_alter_table_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[AlterTableStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Alter))
@@
 
 ///|
 /// ALTER INDEX statement
-fn Parser::parse_alter_index_statement(
+fn ParserRenamed::parse_alter_index_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[AlterIndexStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Alter))
@@
 }
 
 ///|
-fn Parser::parse_create_database_statement(
+fn ParserRenamed::parse_create_database_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[CreateDatabaseStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Create))
@@
 }
 
 ///|
-fn Parser::parse_create_schema_statement(
+fn ParserRenamed::parse_create_schema_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[CreateSchemaStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Create))
@@
 }
 
 ///|
-fn Parser::parse_create_function_statement(
+fn ParserRenamed::parse_create_function_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[CreateFunctionStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Create))
@@
 }
 
 ///|
-fn Parser::parse_create_procedure_statement(
+fn ParserRenamed::parse_create_procedure_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[CreateProcedureStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Create))
@@
 }
 
 ///|
-fn Parser::parse_function_parameter(
+fn ParserRenamed::parse_function_parameter(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[FunctionParameter] raise ParserError {
   // Parse optional parameter mode (IN, OUT, INOUT)
@@
 }
 
 ///|
-fn Parser::parse_create_sequence_statement(
+fn ParserRenamed::parse_create_sequence_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[CreateSequenceStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Create))
*** Update File: <WORKDIR>/src/dialect.mbt
@@
   parse_expr(Self, tokens : ArrayView[Token]) -> ParserResult[Expr]? raise ParserError = _
 
   /// Custom statement parsing for dialect-specific syntax
-  parse_statement(Self, parser : Parser, tokens : ArrayView[Token]) -> ParserResult[
+  parse_statement(Self, parser : ParserRenamed, tokens : ArrayView[Token]) -> ParserResult[
     Statement,
   ]? raise ParserError = _
 
@@
 ///|
 impl Dialect with parse_statement(
   _self : Self,
-  _parser : Parser,
+  _parser : ParserRenamed,
   _tokens : ArrayView[Token],
 ) -> ParserResult[Statement]? raise ParserError {
   // Debug: If this is being called instead of dialect-specific implementation,
*** Update File: <WORKDIR>/src/dml.mbt
@@
 ///|
-fn Parser::parse_set_expr(
+fn ParserRenamed::parse_set_expr(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
   min_bp : Int,
 ) -> ParserResult[SetExpr] raise ParserError {
@@
 }
 
 ///|
-fn Parser::parse_select(
+fn ParserRenamed::parse_select(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[SelectStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Select))
@@
 }
 
 ///|
-fn Parser::parse_query(
+fn ParserRenamed::parse_query(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[QueryStmt] raise ParserError {
   let (with_clause, tokens) = match tokens {
@@
 }
 
 ///|
-fn Parser::parse_aliasing(
+fn ParserRenamed::parse_aliasing(
-  _self : Parser,
+  _self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[TableAlias?] raise ParserError {
   let tokens = match tokens {
@@
 }
 
 ///|
-fn Parser::parse_projections(
+fn ParserRenamed::parse_projections(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Array[Projection]] raise ParserError {
   let projections = []
@@
 }
 
 ///|
-fn Parser::parse_expr(
+fn ParserRenamed::parse_expr(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Expr] raise ParserError {
   if self.dialect.parse_expr(tokens) is Some(res) {
@@
 }
 
 ///|
-fn Parser::parse_binary_expr(
+fn ParserRenamed::parse_binary_expr(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
   min_bp : Int,
 ) -> ParserResult[Expr] raise ParserError {
@@
 }
 
 ///|
-fn Parser::parse_infix(
+fn ParserRenamed::parse_infix(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
   left : Expr,
   min_bp : Int,
@@
 }
 
 ///|
-fn Parser::parse_primary_expr(
+fn ParserRenamed::parse_primary_expr(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Expr] raise ParserError {
   match tokens {
@@
 }
 
 ///|
-fn Parser::parse_postfix_expr(
+fn ParserRenamed::parse_postfix_expr(
-  self : Parser,
+  self : ParserRenamed,
   expr : Expr,
   tokens : ArrayView[Token],
 ) -> ParserResult[Expr] raise ParserError {
@@
 }
 
 ///|
-fn Parser::parse_subscript(
+fn ParserRenamed::parse_subscript(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Subscript] raise ParserError {
   // tokens start right after the '['
@@
 }
 
 ///|
-fn Parser::parse_table_refs(
+fn ParserRenamed::parse_table_refs(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Array[TableRef]] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(From))
@@
 }
 
 ///|
-fn Parser::parse_table_ref(
+fn ParserRenamed::parse_table_ref(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[TableRef] raise ParserError {
   let (factor, tokens) = self.parse_table_factor(tokens)
@@
 }
 
 ///|
-fn Parser::parse_table_factor(
+fn ParserRenamed::parse_table_factor(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[TableFactor] raise ParserError {
   match tokens {
@@
 }
 
 ///|
-fn Parser::parse_group_by(
+fn ParserRenamed::parse_group_by(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Array[Expr]] raise ParserError {
   let group_by = []
@@
 }
 
 ///|
-fn Parser::parse_order_by(
+fn ParserRenamed::parse_order_by(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Array[OrderByExpr]] raise ParserError {
   let order_by = []
@@
 }
 
 ///|
-fn Parser::parse_order_by_expr(
+fn ParserRenamed::parse_order_by_expr(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[OrderByExpr] raise ParserError {
   let (expr, tokens) = self.parse_expr(tokens)
@@
 }
 
 ///|
-fn Parser::parse_date_expr(
+fn ParserRenamed::parse_date_expr(
-  _self : Parser,
+  _self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Expr] raise ParserError {
   match tokens {
@@
 }
 
 ///|
-fn Parser::parse_interval_expr(
+fn ParserRenamed::parse_interval_expr(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Expr] raise ParserError {
   match tokens {
@@
 }
 
 ///|
-fn Parser::parse_extract_expr(
+fn ParserRenamed::parse_extract_expr(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Expr] raise ParserError {
   match tokens {
@@
 }
 
 ///|
-fn Parser::parse_case_expr(
+fn ParserRenamed::parse_case_expr(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Expr] raise ParserError {
   let when_then_clauses = []
@@
 }
 
 ///|
-fn Parser::parse_interval_qualifier(
+fn ParserRenamed::parse_interval_qualifier(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[IntervalQualifier] raise ParserError {
   let (field1, tokens) = self.parse_primary_datetime_field(tokens)
@@
 }
 
 ///|
-fn Parser::parse_primary_datetime_field(
+fn ParserRenamed::parse_primary_datetime_field(
-  _self : Parser,
+  _self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[PrimaryDatetimeField] raise ParserError {
   match tokens {
@@
 }
 
 ///|
-fn Parser::parse_between_expr(
+fn ParserRenamed::parse_between_expr(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
   left : Expr,
   positive : Bool,
@@
 }
 
 ///|
-fn Parser::parse_in_expr(
+fn ParserRenamed::parse_in_expr(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
   left : Expr,
   positive : Bool,
@@
 }
 
 ///|
-fn Parser::parse_substring_expr(
+fn ParserRenamed::parse_substring_expr(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Expr] raise ParserError {
   let tokens = self.expect_token(tokens, LParen)
@@
 }
 
 ///|
-fn Parser::parse_array_expr(
+fn ParserRenamed::parse_array_expr(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
   named : Bool,
 ) -> ParserResult[Expr] raise ParserError {
@@
 }
 
 ///|
-fn Parser::parse_object_name(
+fn ParserRenamed::parse_object_name(
-  _self : Parser,
+  _self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[ObjectName] raise ParserError {
   let parts = []
@@
 }
 
 ///|
-fn Parser::parse_top(
+fn ParserRenamed::parse_top(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Top?] raise ParserError {
   match tokens {
@@
 }
 
 ///|
-fn Parser::parse_insert_statement(
+fn ParserRenamed::parse_insert_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[InsertStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Insert))
@@
 }
 
 ///|
-fn Parser::parse_delete_statement(
+fn ParserRenamed::parse_delete_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[DeleteStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Delete))
@@
 }
 
 ///|
-fn Parser::parse_update_statement(
+fn ParserRenamed::parse_update_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[UpdateStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Update))
@@
 }
 
 ///|
-fn Parser::parse_truncate_statement(
+fn ParserRenamed::parse_truncate_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[TruncateStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Truncate))
@@
 }
 
 ///|
-fn Parser::parse_cte_list(
+fn ParserRenamed::parse_cte_list(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Array[Cte]] raise ParserError {
   let ctes = []
@@
 }
 
 ///|
-fn Parser::parse_cte(
+fn ParserRenamed::parse_cte(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Cte] raise ParserError {
   // Parse CTE name
@@
 
 ///|
 /// Parse window specification: [PARTITION BY ...] [ORDER BY ...] [frame_clause]
-fn Parser::parse_window_spec(
+fn ParserRenamed::parse_window_spec(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[WindowSpec] raise ParserError {
   // Parse optional PARTITION BY clause
@@
 
 ///|
 /// Parse window frame clause: ROWS/RANGE [BETWEEN ... AND ...] or ROWS/RANGE ...
-fn Parser::parse_window_frame_clause(
+fn ParserRenamed::parse_window_frame_clause(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[WindowFrameClause?] raise ParserError {
   match tokens {
@@
 
 ///|
 /// Parse frame bounds: [BETWEEN ... AND ...] or single bound
-fn Parser::parse_frame_bounds(
+fn ParserRenamed::parse_frame_bounds(
-  self : Parser,
+  self : ParserRenamed,
   frame_units : WindowFrameUnits,
   tokens : ArrayView[Token],
 ) -> ParserResult[WindowFrameClause?] raise ParserError {
@@
 
 ///|
 /// Parse individual frame bound
-fn Parser::parse_frame_bound(
+fn ParserRenamed::parse_frame_bound(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[WindowFrameBound] raise ParserError {
   match tokens {
@@
 }
 
 ///|
-fn Parser::parse_merge_statement(
+fn ParserRenamed::parse_merge_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[MergeStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Merge))
@@
 }
 
 ///|
-fn Parser::parse_merge_when_clause(
+fn ParserRenamed::parse_merge_when_clause(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[MergeWhenClause] raise ParserError {
   // Parse MATCHED or NOT MATCHED
@@
 }
 
 ///|
-fn Parser::parse_merge_action(
+fn ParserRenamed::parse_merge_action(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[MergeAction] raise ParserError {
   match tokens {
*** Update File: <WORKDIR>/src/duckdb.mbt
@@
 ///|
 pub impl Dialect for DuckDB with parse_statement(
   _self : DuckDB,
-  _parser : Parser,
+  _parser : ParserRenamed,
   _tokens : ArrayView[Token],
 ) -> ParserResult[Statement]? raise ParserError {
   None
*** Update File: <WORKDIR>/src/generic.mbt
@@
 ///|
 pub impl Dialect for Generic with parse_statement(
   _self : Generic,
-  _parser : Parser,
+  _parser : ParserRenamed,
   _tokens : ArrayView[Token],
 ) -> ParserResult[Statement]? raise ParserError {
   None
*** Update File: <WORKDIR>/src/mysql.mbt
@@
 ///|
 pub impl Dialect for MySQL with parse_statement(
   _self : MySQL,
-  parser : Parser,
+  parser : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Statement]? raise ParserError {
   match tokens {
*** Update File: <WORKDIR>/src/parser.mbt
@@
 type ParserResult[T] = (T, ArrayView[Token])
 
 ///|
-pub struct Parser {
+pub struct ParserRenamed {
   dialect : &Dialect
   // recursion counter
 }
@@
 }
 
 ///|
-fn Parser::expect_token(
+fn ParserRenamed::expect_token(
-  _self : Parser,
+  _self : ParserRenamed,
   tokens : ArrayView[Token],
   expected : Token,
 ) -> ArrayView[Token] raise ParserError {
@@
   tokens : ArrayView[Token],
   dialect? : &Dialect = MySQL::{  },
 ) -> Array[Statement] raise ParserError {
-  let parser = Parser::{ dialect, }
+  let parser = ParserRenamed::{ dialect, }
   let statements = []
   for tokens = tokens {
     match tokens {
@@
 }
 
 ///|
-fn Parser::parse_statement(
+fn ParserRenamed::parse_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Statement] raise ParserError {
   // Try dialect-specific parsing first
@@
 ///|
 
 ///|
-fn Parser::parse_show_statement(
+fn ParserRenamed::parse_show_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[ShowStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Show))
@@
 }
 
 ///|
-fn Parser::parse_set_statement(
+fn ParserRenamed::parse_set_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[SetStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Set))
@@
 }
 
 ///|
-fn Parser::parse_set_assignments(
+fn ParserRenamed::parse_set_assignments(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Array[SetAssignment]] raise ParserError {
   let assignments : Array[SetAssignment] = []
@@
 }
 
 ///|
-fn Parser::parse_replace_statement(
+fn ParserRenamed::parse_replace_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[InsertStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Replace))
@@
 }
 
 ///|
-fn Parser::parse_copy_statement(
+fn ParserRenamed::parse_copy_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[CopyStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Copy))
@@
 }
 
 ///|
-fn Parser::parse_copy_options(
+fn ParserRenamed::parse_copy_options(
-  _self : Parser,
+  _self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Array[CopyOption]] raise ParserError {
   let options = []
@@
 }
 
 ///|
-fn Parser::parse_use_statement(
+fn ParserRenamed::parse_use_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[UseStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Use))
@@
 }
 
 ///|
-fn Parser::parse_comma_separated_exprs(
+fn ParserRenamed::parse_comma_separated_exprs(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Array[Expr]] raise ParserError {
   let exprs = []
@@
 }
 
 ///|
-fn Parser::parse_duplicate_key_assignments(
+fn ParserRenamed::parse_duplicate_key_assignments(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Array[Assignment]] raise ParserError {
   let assignments = []
@@
 }
 
 ///|
-fn Parser::parse_on_conflict_clause(
+fn ParserRenamed::parse_on_conflict_clause(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[OnConflictClause] raise ParserError {
   // Parse optional conflict target
@@
 }
 
 ///|
-fn Parser::parse_load_data_statement(
+fn ParserRenamed::parse_load_data_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[LoadDataStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Load))
@@
 }
 
 ///|
-fn Parser::parse_load_data_fields_options(
+fn ParserRenamed::parse_load_data_fields_options(
-  _self : Parser,
+  _self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[LoadDataFieldsOptions] {
   let mut terminated_by = None
@@
 }
 
 ///|
-fn Parser::parse_load_data_lines_options(
+fn ParserRenamed::parse_load_data_lines_options(
-  _self : Parser,
+  _self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[LoadDataLinesOptions] {
   let mut starting_by = None
@@
 ///|
 /// Parse PREPARE statement
 /// Syntax: PREPARE name [(data_type [, ...])] AS statement
-fn Parser::parse_prepare_statement(
+fn ParserRenamed::parse_prepare_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[PrepareStmt] raise ParserError {
   // PREPARE
@@
 ///   EXECUTE name [(param [, ...])]
 ///   EXECUTE name USING expr [, ...]
 ///   EXECUTE IMMEDIATE 'sql_string' [INTO var [, ...]] [USING expr [, ...]]
-fn Parser::parse_execute_statement(
+fn ParserRenamed::parse_execute_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[ExecuteStmt] raise ParserError {
   // EXECUTE
@@
 ///|
 /// Parse DEALLOCATE statement
 /// Syntax: DEALLOCATE [PREPARE] name
-fn Parser::parse_deallocate_statement(
+fn ParserRenamed::parse_deallocate_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[DeallocateStmt] raise ParserError {
   // DEALLOCATE
*** Update File: <WORKDIR>/src/postgres.mbt
@@
 ///|
 pub impl Dialect for Postgres with parse_statement(
   _self : Postgres,
-  _parser : Parser,
+  _parser : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[Statement]? raise ParserError {
   match tokens {
*** Update File: <WORKDIR>/src/redshift.mbt
@@
 ///|
 pub impl Dialect for Redshift with parse_statement(
   _self : Redshift,
-  _parser : Parser,
+  _parser : ParserRenamed,
   _tokens : ArrayView[Token],
 ) -> ParserResult[Statement]? raise ParserError {
   None
*** Update File: <WORKDIR>/src/snowflake.mbt
@@
 ///|
 pub impl Dialect for Snowflake with parse_statement(
   _self : Snowflake,
-  _parser : Parser,
+  _parser : ParserRenamed,
   _tokens : ArrayView[Token],
 ) -> ParserResult[Statement]? raise ParserError {
   None
*** Update File: <WORKDIR>/src/sqlite.mbt
@@
 ///|
 pub impl Dialect for SQLite with parse_statement(
   _self : SQLite,
-  _parser : Parser,
+  _parser : ParserRenamed,
   _tokens : ArrayView[Token],
 ) -> ParserResult[Statement]? raise ParserError {
   None
*** Update File: <WORKDIR>/src/tcl.mbt
@@
 // TCL (Transaction Control Language) parsing functions
 
 ///|
-fn Parser::parse_begin_statement(
+fn ParserRenamed::parse_begin_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[BeginStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Begin))
@@
 }
 
 ///|
-fn Parser::parse_start_transaction_statement(
+fn ParserRenamed::parse_start_transaction_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[BeginStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Start))
@@
 }
 
 ///|
-fn Parser::parse_commit_statement(
+fn ParserRenamed::parse_commit_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[CommitStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Commit))
@@
 }
 
 ///|
-fn Parser::parse_rollback_statement(
+fn ParserRenamed::parse_rollback_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[RollbackStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Rollback))
@@
 }
 
 ///|
-fn Parser::parse_savepoint_statement(
+fn ParserRenamed::parse_savepoint_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[SavepointStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Savepoint))
@@
 }
 
 ///|
-fn Parser::parse_release_savepoint_statement(
+fn ParserRenamed::parse_release_savepoint_statement(
-  self : Parser,
+  self : ParserRenamed,
   tokens : ArrayView[Token],
 ) -> ParserResult[ReleaseSavepointStmt] raise ParserError {
   let tokens = self.expect_token(tokens, Keyword(Release))
*** End Patch

```
