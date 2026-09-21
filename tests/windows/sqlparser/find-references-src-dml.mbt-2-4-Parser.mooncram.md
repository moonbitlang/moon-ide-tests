# sqlparser find-references Parser src\dml.mbt:2:4

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide find-references 'Parser' --loc 'src\dml.mbt:2:4'
Found 199 references for symbol 'Parser':
<WORKDIR>/src\ansi.mbt:45:13-45:19:
   | ///|
   | pub impl Dialect for ANSI with fn parse_statement(
   |   _self : ANSI,
45 |   _parser : Parser,
   |             ^^^^^^
   |   _tokens : ArrayView[Token],
   | ) -> ParserResult[Statement]? raise ParserError {

<WORKDIR>/src\bigquery.mbt:54:13-54:19:
   | ///|
   | pub impl Dialect for BigQuery with fn parse_statement(
   |   _self : BigQuery,
54 |   _parser : Parser,
   |             ^^^^^^
   |   _tokens : ArrayView[Token],
   | ) -> ParserResult[Statement]? raise ParserError {

<WORKDIR>/src\clickhouse.mbt:53:13-53:19:
   | ///|
   | pub impl Dialect for ClickHouse with fn parse_statement(
   |   _self : ClickHouse,
53 |   _parser : Parser,
   |             ^^^^^^
   |   _tokens : ArrayView[Token],
   | ) -> ParserResult[Statement]? raise ParserError {

<WORKDIR>/src\dcl.mbt:5:4-5:10:
  | // DCL (Data Control Language) parsing functions
  | 
  | ///|
5 | fn Parser::parse_grant_statement(
  |    ^^^^^^
  |   self : Parser,
  |   tokens : ArrayView[Token],

<WORKDIR>/src\dcl.mbt:6:10-6:16:
  | 
  | ///|
  | fn Parser::parse_grant_statement(
6 |   self : Parser,
  |          ^^^^^^
  |   tokens : ArrayView[Token],
  | ) -> ParserResult[GrantStmt] raise ParserError {

<WORKDIR>/src\dcl.mbt:36:4-36:10:
   | }
   | 
   | ///|
36 | fn Parser::parse_revoke_statement(
   |    ^^^^^^
   |   self : Parser,
   |   tokens : ArrayView[Token],

<WORKDIR>/src\dcl.mbt:37:10-37:16:
   | 
   | ///|
   | fn Parser::parse_revoke_statement(
37 |   self : Parser,
   |          ^^^^^^
   |   tokens : ArrayView[Token],
   | ) -> ParserResult[RevokeStmt] raise ParserError {

<WORKDIR>/src\dcl.mbt:73:4-73:10:
   | }
   | 
   | ///|
73 | fn Parser::parse_privilege_list(
   |    ^^^^^^
   |   self : Parser,
   |   tokens : ArrayView[Token],

<WORKDIR>/src\dcl.mbt:74:10-74:16:
   | 
   | ///|
   | fn Parser::parse_privilege_list(
74 |   self : Parser,
   |          ^^^^^^
   |   tokens : ArrayView[Token],
   | ) -> ParserResult[Array[Privilege]] raise ParserError {

<WORKDIR>/src\dcl.mbt:98:4-98:10:
   | }
   | 
   | ///|
98 | fn Parser::parse_privilege(
   |    ^^^^^^
   |   self : Parser,
   |   tokens : ArrayView[Token],

<WORKDIR>/src\dcl.mbt:99:10-99:16:
   | 
   | ///|
   | fn Parser::parse_privilege(
99 |   self : Parser,
   |          ^^^^^^
   |   tokens : ArrayView[Token],
   | ) -> ParserResult[Privilege] raise ParserError {

<WORKDIR>/src\dcl.mbt:144:4-144:10:
    | }
    | 
    | ///|
144 | fn Parser::parse_optional_column_list(
    |    ^^^^^^
    |   _self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dcl.mbt:145:11-145:17:
    | 
    | ///|
    | fn Parser::parse_optional_column_list(
145 |   _self : Parser,
    |           ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Array[String]?] raise ParserError {

<WORKDIR>/src\dcl.mbt:176:4-176:10:
    | }
    | 
    | ///|
176 | fn Parser::parse_object_name_list(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dcl.mbt:177:10-177:16:
    | 
    | ///|
    | fn Parser::parse_object_name_list(
177 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Array[ObjectName]] raise ParserError {

<WORKDIR>/src\dcl.mbt:201:4-201:10:
    | }
    | 
    | ///|
201 | fn Parser::parse_grantee_list(
    |    ^^^^^^
    |   _self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dcl.mbt:202:11-202:17:
    | 
    | ///|
    | fn Parser::parse_grantee_list(
202 |   _self : Parser,
    |           ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Array[String]] raise ParserError {

<WORKDIR>/src\ddl.mbt:2:4-2:10:
  | ///|
2 | fn Parser::parse_create_table_statement(
  |    ^^^^^^
  |   self : Parser,
  |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:3:10-3:16:
  | ///|
  | fn Parser::parse_create_table_statement(
3 |   self : Parser,
  |          ^^^^^^
  |   tokens : ArrayView[Token],
  | ) -> ParserResult[CreateTableStmt] raise ParserError {

<WORKDIR>/src\ddl.mbt:40:4-40:10:
   | 
   | ///|
   | /// Parse CREATE INDEX statement
40 | fn Parser::parse_create_index_statement(
   |    ^^^^^^
   |   self : Parser,
   |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:41:10-41:16:
   | ///|
   | /// Parse CREATE INDEX statement
   | fn Parser::parse_create_index_statement(
41 |   self : Parser,
   |          ^^^^^^
   |   tokens : ArrayView[Token],
   | ) -> ParserResult[CreateIndexStmt] raise ParserError {

<WORKDIR>/src\ddl.mbt:345:4-345:10:
    | }
    | 
    | ///|
345 | fn Parser::parse_column_defs(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:346:10-346:16:
    | 
    | ///|
    | fn Parser::parse_column_defs(
346 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[(Array[ColumnDef], Array[TableConstraint])] raise ParserError {

<WORKDIR>/src\ddl.mbt:393:4-393:10:
    | }
    | 
    | ///|
393 | fn Parser::parse_data_type(
    |    ^^^^^^
    |   _self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:394:11-394:17:
    | 
    | ///|
    | fn Parser::parse_data_type(
394 |   _self : Parser,
    |           ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[DataType] raise ParserError {

<WORKDIR>/src\ddl.mbt:481:4-481:10:
    | }
    | 
    | ///|
481 | fn Parser::parse_column_def_option(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:482:10-482:16:
    | 
    | ///|
    | fn Parser::parse_column_def_option(
482 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Array[ColumnDefOption]] raise ParserError {

<WORKDIR>/src\ddl.mbt:527:4-527:10:
    | }
    | 
    | ///|
527 | fn Parser::parse_create_view_statement(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:528:10-528:16:
    | 
    | ///|
    | fn Parser::parse_create_view_statement(
528 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[CreateViewStmt] raise ParserError {

<WORKDIR>/src\ddl.mbt:570:4-570:10:
    | }
    | 
    | ///|
570 | fn Parser::parse_view_column_def(
    |    ^^^^^^
    |   _self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:571:11-571:17:
    | 
    | ///|
    | fn Parser::parse_view_column_def(
571 |   _self : Parser,
    |           ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[ViewColumnDef] raise ParserError {

<WORKDIR>/src\ddl.mbt:600:4-600:10:
    | }
    | 
    | ///|
600 | fn Parser::parse_drop_view_statement(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:601:10-601:16:
    | 
    | ///|
    | fn Parser::parse_drop_view_statement(
601 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[DropViewStmt] raise ParserError {

<WORKDIR>/src\ddl.mbt:628:4-628:10:
    | }
    | 
    | ///|
628 | fn Parser::parse_table_constraint(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:629:10-629:16:
    | 
    | ///|
    | fn Parser::parse_table_constraint(
629 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[TableConstraint] raise ParserError {

<WORKDIR>/src\ddl.mbt:682:4-682:10:
    | }
    | 
    | ///|
682 | fn Parser::parse_foreign_key_constraint(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:683:10-683:16:
    | 
    | ///|
    | fn Parser::parse_foreign_key_constraint(
683 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[TableConstraint] raise ParserError {

<WORKDIR>/src\ddl.mbt:787:4-787:10:
    | }
    | 
    | ///|
787 | fn Parser::parse_drop_table_statement(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:788:10-788:16:
    | 
    | ///|
    | fn Parser::parse_drop_table_statement(
788 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[DropTableStmt] raise ParserError {

<WORKDIR>/src\ddl.mbt:828:4-828:10:
    | }
    | 
    | ///|
828 | fn Parser::parse_drop_index_statement(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:829:10-829:16:
    | 
    | ///|
    | fn Parser::parse_drop_index_statement(
829 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[DropIndexStmt] raise ParserError {

<WORKDIR>/src\ddl.mbt:934:4-934:10:
    | }
    | 
    | ///|
934 | fn Parser::parse_alter_table_statement(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:935:10-935:16:
    | 
    | ///|
    | fn Parser::parse_alter_table_statement(
935 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[AlterTableStmt] raise ParserError {

<WORKDIR>/src\ddl.mbt:980:4-980:10:
    | 
    | ///|
    | /// ALTER INDEX statement
980 | fn Parser::parse_alter_index_statement(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:981:10-981:16:
    | ///|
    | /// ALTER INDEX statement
    | fn Parser::parse_alter_index_statement(
981 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[AlterIndexStmt] raise ParserError {

<WORKDIR>/src\ddl.mbt:1240:4-1240:10:
     | }
     | 
     | ///|
1240 | fn Parser::parse_create_database_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:1241:10-1241:16:
     | 
     | ///|
     | fn Parser::parse_create_database_statement(
1241 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[CreateDatabaseStmt] raise ParserError {

<WORKDIR>/src\ddl.mbt:1289:4-1289:10:
     | }
     | 
     | ///|
1289 | fn Parser::parse_create_schema_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:1290:10-1290:16:
     | 
     | ///|
     | fn Parser::parse_create_schema_statement(
1290 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[CreateSchemaStmt] raise ParserError {

<WORKDIR>/src\ddl.mbt:1413:4-1413:10:
     | }
     | 
     | ///|
1413 | fn Parser::parse_create_function_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:1414:10-1414:16:
     | 
     | ///|
     | fn Parser::parse_create_function_statement(
1414 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[CreateFunctionStmt] raise ParserError {

<WORKDIR>/src\ddl.mbt:1508:4-1508:10:
     | }
     | 
     | ///|
1508 | fn Parser::parse_create_procedure_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:1509:10-1509:16:
     | 
     | ///|
     | fn Parser::parse_create_procedure_statement(
1509 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[CreateProcedureStmt] raise ParserError {

<WORKDIR>/src\ddl.mbt:1577:4-1577:10:
     | }
     | 
     | ///|
1577 | fn Parser::parse_function_parameter(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:1578:10-1578:16:
     | 
     | ///|
     | fn Parser::parse_function_parameter(
1578 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[FunctionParameter] raise ParserError {

<WORKDIR>/src\ddl.mbt:1706:4-1706:10:
     | }
     | 
     | ///|
1706 | fn Parser::parse_create_sequence_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:1707:10-1707:16:
     | 
     | ///|
     | fn Parser::parse_create_sequence_statement(
1707 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[CreateSequenceStmt] raise ParserError {

<WORKDIR>/src\dialect.mbt:34:37-34:43:
   |   fn parse_expr(Self, tokens : ArrayView[Token]) -> ParserResult[Expr]? raise ParserError = _
   | 
   |   /// Custom statement parsing for dialect-specific syntax
34 |   fn parse_statement(Self, parser : Parser, tokens : ArrayView[Token]) -> ParserResult[
   |                                     ^^^^^^
   |     Statement,
   |   ]? raise ParserError = _

<WORKDIR>/src\dialect.mbt:97:13-97:19:
   | ///|
   | impl Dialect with fn parse_statement(
   |   _self : Self,
97 |   _parser : Parser,
   |             ^^^^^^
   |   _tokens : ArrayView[Token],
   | ) -> ParserResult[Statement]? raise ParserError {

<WORKDIR>/src\dml.mbt:2:4-2:10:
  | ///|
2 | fn Parser::parse_set_expr(
  |    ^^^^^^
  |   self : Parser,
  |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:3:10-3:16:
  | ///|
  | fn Parser::parse_set_expr(
3 |   self : Parser,
  |          ^^^^^^
  |   tokens : ArrayView[Token],
  |   min_bp : Int,

<WORKDIR>/src\dml.mbt:48:4-48:10:
   | }
   | 
   | ///|
48 | fn Parser::parse_select(
   |    ^^^^^^
   |   self : Parser,
   |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:49:10-49:16:
   | 
   | ///|
   | fn Parser::parse_select(
49 |   self : Parser,
   |          ^^^^^^
   |   tokens : ArrayView[Token],
   | ) -> ParserResult[SelectStmt] raise ParserError {

<WORKDIR>/src\dml.mbt:85:4-85:10:
   | }
   | 
   | ///|
85 | fn Parser::parse_query(
   |    ^^^^^^
   |   self : Parser,
   |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:86:10-86:16:
   | 
   | ///|
   | fn Parser::parse_query(
86 |   self : Parser,
   |          ^^^^^^
   |   tokens : ArrayView[Token],
   | ) -> ParserResult[QueryStmt] raise ParserError {

<WORKDIR>/src\dml.mbt:119:4-119:10:
    | }
    | 
    | ///|
119 | fn Parser::parse_aliasing(
    |    ^^^^^^
    |   _self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:120:11-120:17:
    | 
    | ///|
    | fn Parser::parse_aliasing(
120 |   _self : Parser,
    |           ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[TableAlias?] raise ParserError {

<WORKDIR>/src\dml.mbt:161:4-161:10:
    | }
    | 
    | ///|
161 | fn Parser::parse_projections(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:162:10-162:16:
    | 
    | ///|
    | fn Parser::parse_projections(
162 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Array[Projection]] raise ParserError {

<WORKDIR>/src\dml.mbt:201:4-201:10:
    | }
    | 
    | ///|
201 | fn Parser::parse_expr(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:202:10-202:16:
    | 
    | ///|
    | fn Parser::parse_expr(
202 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Expr] raise ParserError {

<WORKDIR>/src\dml.mbt:230:4-230:10:
    | }
    | 
    | ///|
230 | fn Parser::parse_binary_expr(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:231:10-231:16:
    | 
    | ///|
    | fn Parser::parse_binary_expr(
231 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    |   min_bp : Int,

<WORKDIR>/src\dml.mbt:250:4-250:10:
    | }
    | 
    | ///|
250 | fn Parser::parse_infix(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:251:10-251:16:
    | 
    | ///|
    | fn Parser::parse_infix(
251 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    |   left : Expr,

<WORKDIR>/src\dml.mbt:334:4-334:10:
    | }
    | 
    | ///|
334 | fn Parser::parse_primary_expr(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:335:10-335:16:
    | 
    | ///|
    | fn Parser::parse_primary_expr(
335 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Expr] raise ParserError {

<WORKDIR>/src\dml.mbt:511:4-511:10:
    | }
    | 
    | ///|
511 | fn Parser::parse_postfix_expr(
    |    ^^^^^^
    |   self : Parser,
    |   expr : Expr,

<WORKDIR>/src\dml.mbt:512:10-512:16:
    | 
    | ///|
    | fn Parser::parse_postfix_expr(
512 |   self : Parser,
    |          ^^^^^^
    |   expr : Expr,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:542:4-542:10:
    | }
    | 
    | ///|
542 | fn Parser::parse_subscript(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:543:10-543:16:
    | 
    | ///|
    | fn Parser::parse_subscript(
543 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Subscript] raise ParserError {

<WORKDIR>/src\dml.mbt:619:4-619:10:
    | }
    | 
    | ///|
619 | fn Parser::parse_table_refs(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:620:10-620:16:
    | 
    | ///|
    | fn Parser::parse_table_refs(
620 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Array[TableRef]] raise ParserError {

<WORKDIR>/src\dml.mbt:640:4-640:10:
    | }
    | 
    | ///|
640 | fn Parser::parse_table_ref(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:641:10-641:16:
    | 
    | ///|
    | fn Parser::parse_table_ref(
641 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[TableRef] raise ParserError {

<WORKDIR>/src\dml.mbt:743:4-743:10:
    | }
    | 
    | ///|
743 | fn Parser::parse_table_factor(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:744:10-744:16:
    | 
    | ///|
    | fn Parser::parse_table_factor(
744 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[TableFactor] raise ParserError {

<WORKDIR>/src\dml.mbt:777:4-777:10:
    | }
    | 
    | ///|
777 | fn Parser::parse_group_by(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:778:10-778:16:
    | 
    | ///|
    | fn Parser::parse_group_by(
778 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Array[Expr]] raise ParserError {

<WORKDIR>/src\dml.mbt:797:4-797:10:
    | }
    | 
    | ///|
797 | fn Parser::parse_order_by(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:798:10-798:16:
    | 
    | ///|
    | fn Parser::parse_order_by(
798 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Array[OrderByExpr]] raise ParserError {

<WORKDIR>/src\dml.mbt:817:4-817:10:
    | }
    | 
    | ///|
817 | fn Parser::parse_order_by_expr(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:818:10-818:16:
    | 
    | ///|
    | fn Parser::parse_order_by_expr(
818 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[OrderByExpr] raise ParserError {

<WORKDIR>/src\dml.mbt:836:4-836:10:
    | }
    | 
    | ///|
836 | fn Parser::parse_date_expr(
    |    ^^^^^^
    |   _self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:837:11-837:17:
    | 
    | ///|
    | fn Parser::parse_date_expr(
837 |   _self : Parser,
    |           ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Expr] raise ParserError {

<WORKDIR>/src\dml.mbt:854:4-854:10:
    | }
    | 
    | ///|
854 | fn Parser::parse_interval_expr(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:855:10-855:16:
    | 
    | ///|
    | fn Parser::parse_interval_expr(
855 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Expr] raise ParserError {

<WORKDIR>/src\dml.mbt:875:4-875:10:
    | }
    | 
    | ///|
875 | fn Parser::parse_extract_expr(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:876:10-876:16:
    | 
    | ///|
    | fn Parser::parse_extract_expr(
876 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Expr] raise ParserError {

<WORKDIR>/src\dml.mbt:897:4-897:10:
    | }
    | 
    | ///|
897 | fn Parser::parse_case_expr(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:898:10-898:16:
    | 
    | ///|
    | fn Parser::parse_case_expr(
898 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Expr] raise ParserError {

<WORKDIR>/src\dml.mbt:944:4-944:10:
    | }
    | 
    | ///|
944 | fn Parser::parse_interval_qualifier(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:945:10-945:16:
    | 
    | ///|
    | fn Parser::parse_interval_qualifier(
945 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[IntervalQualifier] raise ParserError {

<WORKDIR>/src\dml.mbt:961:4-961:10:
    | }
    | 
    | ///|
961 | fn Parser::parse_primary_datetime_field(
    |    ^^^^^^
    |   _self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:962:11-962:17:
    | 
    | ///|
    | fn Parser::parse_primary_datetime_field(
962 |   _self : Parser,
    |           ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[PrimaryDatetimeField] raise ParserError {

<WORKDIR>/src\dml.mbt:993:4-993:10:
    | }
    | 
    | ///|
993 | fn Parser::parse_between_expr(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:994:10-994:16:
    | 
    | ///|
    | fn Parser::parse_between_expr(
994 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    |   left : Expr,

<WORKDIR>/src\dml.mbt:1021:4-1021:10:
     | }
     | 
     | ///|
1021 | fn Parser::parse_in_expr(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:1022:10-1022:16:
     | 
     | ///|
     | fn Parser::parse_in_expr(
1022 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     |   left : Expr,

<WORKDIR>/src\dml.mbt:1079:4-1079:10:
     | }
     | 
     | ///|
1079 | fn Parser::parse_substring_expr(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:1080:10-1080:16:
     | 
     | ///|
     | fn Parser::parse_substring_expr(
1080 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[Expr] raise ParserError {

<WORKDIR>/src\dml.mbt:1115:4-1115:10:
     | }
     | 
     | ///|
1115 | fn Parser::parse_array_expr(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:1116:10-1116:16:
     | 
     | ///|
     | fn Parser::parse_array_expr(
1116 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     |   named : Bool,

<WORKDIR>/src\dml.mbt:1770:4-1770:10:
     | }
     | 
     | ///|
1770 | fn Parser::parse_object_name(
     |    ^^^^^^
     |   _self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:1771:11-1771:17:
     | 
     | ///|
     | fn Parser::parse_object_name(
1771 |   _self : Parser,
     |           ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[ObjectName] raise ParserError {

<WORKDIR>/src\dml.mbt:1842:4-1842:10:
     | }
     | 
     | ///|
1842 | fn Parser::parse_top(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:1843:10-1843:16:
     | 
     | ///|
     | fn Parser::parse_top(
1843 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[Top?] raise ParserError {

<WORKDIR>/src\dml.mbt:1878:4-1878:10:
     | }
     | 
     | ///|
1878 | fn Parser::parse_insert_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:1879:10-1879:16:
     | 
     | ///|
     | fn Parser::parse_insert_statement(
1879 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[InsertStmt] raise ParserError {

<WORKDIR>/src\dml.mbt:2136:4-2136:10:
     | }
     | 
     | ///|
2136 | fn Parser::parse_delete_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2137:10-2137:16:
     | 
     | ///|
     | fn Parser::parse_delete_statement(
2137 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[DeleteStmt] raise ParserError {

<WORKDIR>/src\dml.mbt:2181:4-2181:10:
     | }
     | 
     | ///|
2181 | fn Parser::parse_update_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2182:10-2182:16:
     | 
     | ///|
     | fn Parser::parse_update_statement(
2182 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[UpdateStmt] raise ParserError {

<WORKDIR>/src\dml.mbt:2261:4-2261:10:
     | }
     | 
     | ///|
2261 | fn Parser::parse_truncate_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2262:10-2262:16:
     | 
     | ///|
     | fn Parser::parse_truncate_statement(
2262 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[TruncateStmt] raise ParserError {

<WORKDIR>/src\dml.mbt:2271:4-2271:10:
     | }
     | 
     | ///|
2271 | fn Parser::parse_cte_list(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2272:10-2272:16:
     | 
     | ///|
     | fn Parser::parse_cte_list(
2272 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[Array[Cte]] raise ParserError {

<WORKDIR>/src\dml.mbt:2292:4-2292:10:
     | }
     | 
     | ///|
2292 | fn Parser::parse_cte(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2293:10-2293:16:
     | 
     | ///|
     | fn Parser::parse_cte(
2293 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[Cte] raise ParserError {

<WORKDIR>/src\dml.mbt:2349:4-2349:10:
     | 
     | ///|
     | /// Parse window specification: [PARTITION BY ...] [ORDER BY ...] [frame_clause]
2349 | fn Parser::parse_window_spec(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2350:10-2350:16:
     | ///|
     | /// Parse window specification: [PARTITION BY ...] [ORDER BY ...] [frame_clause]
     | fn Parser::parse_window_spec(
2350 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[WindowSpec] raise ParserError {

<WORKDIR>/src\dml.mbt:2402:4-2402:10:
     | 
     | ///|
     | /// Parse window frame clause: ROWS/RANGE [BETWEEN ... AND ...] or ROWS/RANGE ...
2402 | fn Parser::parse_window_frame_clause(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2403:10-2403:16:
     | ///|
     | /// Parse window frame clause: ROWS/RANGE [BETWEEN ... AND ...] or ROWS/RANGE ...
     | fn Parser::parse_window_frame_clause(
2403 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[WindowFrameClause?] raise ParserError {

<WORKDIR>/src\dml.mbt:2417:4-2417:10:
     | 
     | ///|
     | /// Parse frame bounds: [BETWEEN ... AND ...] or single bound
2417 | fn Parser::parse_frame_bounds(
     |    ^^^^^^
     |   self : Parser,
     |   frame_units : WindowFrameUnits,

<WORKDIR>/src\dml.mbt:2418:10-2418:16:
     | ///|
     | /// Parse frame bounds: [BETWEEN ... AND ...] or single bound
     | fn Parser::parse_frame_bounds(
2418 |   self : Parser,
     |          ^^^^^^
     |   frame_units : WindowFrameUnits,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2471:4-2471:10:
     | 
     | ///|
     | /// Parse individual frame bound
2471 | fn Parser::parse_frame_bound(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2472:10-2472:16:
     | ///|
     | /// Parse individual frame bound
     | fn Parser::parse_frame_bound(
2472 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[WindowFrameBound] raise ParserError {

<WORKDIR>/src\dml.mbt:2757:4-2757:10:
     | }
     | 
     | ///|
2757 | fn Parser::parse_merge_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2758:10-2758:16:
     | 
     | ///|
     | fn Parser::parse_merge_statement(
2758 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[MergeStmt] raise ParserError {

<WORKDIR>/src\dml.mbt:2834:4-2834:10:
     | }
     | 
     | ///|
2834 | fn Parser::parse_merge_when_clause(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2835:10-2835:16:
     | 
     | ///|
     | fn Parser::parse_merge_when_clause(
2835 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[MergeWhenClause] raise ParserError {

<WORKDIR>/src\dml.mbt:2869:4-2869:10:
     | }
     | 
     | ///|
2869 | fn Parser::parse_merge_action(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2870:10-2870:16:
     | 
     | ///|
     | fn Parser::parse_merge_action(
2870 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[MergeAction] raise ParserError {

<WORKDIR>/src\duckdb.mbt:47:13-47:19:
   | ///|
   | pub impl Dialect for DuckDB with fn parse_statement(
   |   _self : DuckDB,
47 |   _parser : Parser,
   |             ^^^^^^
   |   _tokens : ArrayView[Token],
   | ) -> ParserResult[Statement]? raise ParserError {

<WORKDIR>/src\generic.mbt:51:13-51:19:
   | ///|
   | pub impl Dialect for Generic with fn parse_statement(
   |   _self : Generic,
51 |   _parser : Parser,
   |             ^^^^^^
   |   _tokens : ArrayView[Token],
   | ) -> ParserResult[Statement]? raise ParserError {

<WORKDIR>/src\mysql.mbt:65:12-65:18:
   | ///|
   | pub impl Dialect for MySQL with fn parse_statement(
   |   _self : MySQL,
65 |   parser : Parser,
   |            ^^^^^^
   |   tokens : ArrayView[Token],
   | ) -> ParserResult[Statement]? raise ParserError {

<WORKDIR>/src\parser.mbt:30:4-30:10:
   | }
   | 
   | ///|
30 | fn Parser::expect_token(
   |    ^^^^^^
   |   _self : Parser,
   |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:31:11-31:17:
   | 
   | ///|
   | fn Parser::expect_token(
31 |   _self : Parser,
   |           ^^^^^^
   |   tokens : ArrayView[Token],
   |   expected : Token,

<WORKDIR>/src\parser.mbt:47:16-47:22:
   |   tokens : ArrayView[Token],
   |   dialect? : &Dialect = MySQL::{ },
   | ) -> Array[Statement] raise ParserError {
47 |   let parser = Parser::{ dialect, }
   |                ^^^^^^
   |   let statements = []
   |   for tokens = tokens {

<WORKDIR>/src\parser.mbt:64:4-64:10:
   | }
   | 
   | ///|
64 | fn Parser::parse_statement(
   |    ^^^^^^
   |   self : Parser,
   |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:65:10-65:16:
   | 
   | ///|
   | fn Parser::parse_statement(
65 |   self : Parser,
   |          ^^^^^^
   |   tokens : ArrayView[Token],
   | ) -> ParserResult[Statement] raise ParserError {

<WORKDIR>/src\parser.mbt:215:4-215:10:
    | ///|
    | 
    | ///|
215 | fn Parser::parse_show_statement(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:216:10-216:16:
    | 
    | ///|
    | fn Parser::parse_show_statement(
216 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[ShowStmt] raise ParserError {

<WORKDIR>/src\parser.mbt:323:4-323:10:
    | }
    | 
    | ///|
323 | fn Parser::parse_set_statement(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:324:10-324:16:
    | 
    | ///|
    | fn Parser::parse_set_statement(
324 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[SetStmt] raise ParserError {

<WORKDIR>/src\parser.mbt:350:4-350:10:
    | }
    | 
    | ///|
350 | fn Parser::parse_set_assignments(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:351:10-351:16:
    | 
    | ///|
    | fn Parser::parse_set_assignments(
351 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Array[SetAssignment]] raise ParserError {

<WORKDIR>/src\parser.mbt:393:4-393:10:
    | }
    | 
    | ///|
393 | fn Parser::parse_replace_statement(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:394:10-394:16:
    | 
    | ///|
    | fn Parser::parse_replace_statement(
394 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[InsertStmt] raise ParserError {

<WORKDIR>/src\parser.mbt:480:4-480:10:
    | }
    | 
    | ///|
480 | fn Parser::parse_copy_statement(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:481:10-481:16:
    | 
    | ///|
    | fn Parser::parse_copy_statement(
481 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[CopyStmt] raise ParserError {

<WORKDIR>/src\parser.mbt:570:4-570:10:
    | }
    | 
    | ///|
570 | fn Parser::parse_copy_options(
    |    ^^^^^^
    |   _self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:571:11-571:17:
    | 
    | ///|
    | fn Parser::parse_copy_options(
571 |   _self : Parser,
    |           ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Array[CopyOption]] raise ParserError {

<WORKDIR>/src\parser.mbt:748:4-748:10:
    | }
    | 
    | ///|
748 | fn Parser::parse_use_statement(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:749:10-749:16:
    | 
    | ///|
    | fn Parser::parse_use_statement(
749 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[UseStmt] raise ParserError {

<WORKDIR>/src\parser.mbt:760:4-760:10:
    | }
    | 
    | ///|
760 | fn Parser::parse_comma_separated_exprs(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:761:10-761:16:
    | 
    | ///|
    | fn Parser::parse_comma_separated_exprs(
761 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Array[Expr]] raise ParserError {

<WORKDIR>/src\parser.mbt:946:4-946:10:
    | }
    | 
    | ///|
946 | fn Parser::parse_duplicate_key_assignments(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:947:10-947:16:
    | 
    | ///|
    | fn Parser::parse_duplicate_key_assignments(
947 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Array[Assignment]] raise ParserError {

<WORKDIR>/src\parser.mbt:975:4-975:10:
    | }
    | 
    | ///|
975 | fn Parser::parse_on_conflict_clause(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:976:10-976:16:
    | 
    | ///|
    | fn Parser::parse_on_conflict_clause(
976 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[OnConflictClause] raise ParserError {

<WORKDIR>/src\parser.mbt:1113:4-1113:10:
     | }
     | 
     | ///|
1113 | fn Parser::parse_load_data_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:1114:10-1114:16:
     | 
     | ///|
     | fn Parser::parse_load_data_statement(
1114 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[LoadDataStmt] raise ParserError {

<WORKDIR>/src\parser.mbt:1283:4-1283:10:
     | }
     | 
     | ///|
1283 | fn Parser::parse_load_data_fields_options(
     |    ^^^^^^
     |   _self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:1284:11-1284:17:
     | 
     | ///|
     | fn Parser::parse_load_data_fields_options(
1284 |   _self : Parser,
     |           ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[LoadDataFieldsOptions] {

<WORKDIR>/src\parser.mbt:1324:4-1324:10:
     | }
     | 
     | ///|
1324 | fn Parser::parse_load_data_lines_options(
     |    ^^^^^^
     |   _self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:1325:11-1325:17:
     | 
     | ///|
     | fn Parser::parse_load_data_lines_options(
1325 |   _self : Parser,
     |           ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[LoadDataLinesOptions] {

<WORKDIR>/src\parser.mbt:1349:4-1349:10:
     | ///|
     | /// Parse PREPARE statement
     | /// Syntax: PREPARE name [(data_type [, ...])] AS statement
1349 | fn Parser::parse_prepare_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:1350:10-1350:16:
     | /// Parse PREPARE statement
     | /// Syntax: PREPARE name [(data_type [, ...])] AS statement
     | fn Parser::parse_prepare_statement(
1350 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[PrepareStmt] raise ParserError {

<WORKDIR>/src\parser.mbt:1403:4-1403:10:
     | ///   EXECUTE name [(param [, ...])]
     | ///   EXECUTE name USING expr [, ...]
     | ///   EXECUTE IMMEDIATE 'sql_string' [INTO var [, ...]] [USING expr [, ...]]
1403 | fn Parser::parse_execute_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:1404:10-1404:16:
     | ///   EXECUTE name USING expr [, ...]
     | ///   EXECUTE IMMEDIATE 'sql_string' [INTO var [, ...]] [USING expr [, ...]]
     | fn Parser::parse_execute_statement(
1404 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[ExecuteStmt] raise ParserError {

<WORKDIR>/src\parser.mbt:1502:4-1502:10:
     | ///|
     | /// Parse DEALLOCATE statement
     | /// Syntax: DEALLOCATE [PREPARE] name
1502 | fn Parser::parse_deallocate_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:1503:10-1503:16:
     | /// Parse DEALLOCATE statement
     | /// Syntax: DEALLOCATE [PREPARE] name
     | fn Parser::parse_deallocate_statement(
1503 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[DeallocateStmt] raise ParserError {

<WORKDIR>/src\postgres.mbt:53:13-53:19:
   | ///|
   | pub impl Dialect for Postgres with fn parse_statement(
   |   _self : Postgres,
53 |   _parser : Parser,
   |             ^^^^^^
   |   tokens : ArrayView[Token],
   | ) -> ParserResult[Statement]? raise ParserError {

<WORKDIR>/src\redshift.mbt:49:13-49:19:
   | ///|
   | pub impl Dialect for Redshift with fn parse_statement(
   |   _self : Redshift,
49 |   _parser : Parser,
   |             ^^^^^^
   |   _tokens : ArrayView[Token],
   | ) -> ParserResult[Statement]? raise ParserError {

<WORKDIR>/src\snowflake.mbt:49:13-49:19:
   | ///|
   | pub impl Dialect for Snowflake with fn parse_statement(
   |   _self : Snowflake,
49 |   _parser : Parser,
   |             ^^^^^^
   |   _tokens : ArrayView[Token],
   | ) -> ParserResult[Statement]? raise ParserError {

<WORKDIR>/src\sqlite.mbt:46:13-46:19:
   | ///|
   | pub impl Dialect for SQLite with fn parse_statement(
   |   _self : SQLite,
46 |   _parser : Parser,
   |             ^^^^^^
   |   _tokens : ArrayView[Token],
   | ) -> ParserResult[Statement]? raise ParserError {

<WORKDIR>/src\tcl.mbt:5:4-5:10:
  | // TCL (Transaction Control Language) parsing functions
  | 
  | ///|
5 | fn Parser::parse_begin_statement(
  |    ^^^^^^
  |   self : Parser,
  |   tokens : ArrayView[Token],

<WORKDIR>/src\tcl.mbt:6:10-6:16:
  | 
  | ///|
  | fn Parser::parse_begin_statement(
6 |   self : Parser,
  |          ^^^^^^
  |   tokens : ArrayView[Token],
  | ) -> ParserResult[BeginStmt] raise ParserError {

<WORKDIR>/src\tcl.mbt:36:4-36:10:
   | }
   | 
   | ///|
36 | fn Parser::parse_start_transaction_statement(
   |    ^^^^^^
   |   self : Parser,
   |   tokens : ArrayView[Token],

<WORKDIR>/src\tcl.mbt:37:10-37:16:
   | 
   | ///|
   | fn Parser::parse_start_transaction_statement(
37 |   self : Parser,
   |          ^^^^^^
   |   tokens : ArrayView[Token],
   | ) -> ParserResult[BeginStmt] raise ParserError {

<WORKDIR>/src\tcl.mbt:48:4-48:10:
   | }
   | 
   | ///|
48 | fn Parser::parse_commit_statement(
   |    ^^^^^^
   |   self : Parser,
   |   tokens : ArrayView[Token],

<WORKDIR>/src\tcl.mbt:49:10-49:16:
   | 
   | ///|
   | fn Parser::parse_commit_statement(
49 |   self : Parser,
   |          ^^^^^^
   |   tokens : ArrayView[Token],
   | ) -> ParserResult[CommitStmt] raise ParserError {

<WORKDIR>/src\tcl.mbt:79:4-79:10:
   | }
   | 
   | ///|
79 | fn Parser::parse_rollback_statement(
   |    ^^^^^^
   |   self : Parser,
   |   tokens : ArrayView[Token],

<WORKDIR>/src\tcl.mbt:80:10-80:16:
   | 
   | ///|
   | fn Parser::parse_rollback_statement(
80 |   self : Parser,
   |          ^^^^^^
   |   tokens : ArrayView[Token],
   | ) -> ParserResult[RollbackStmt] raise ParserError {

<WORKDIR>/src\tcl.mbt:124:4-124:10:
    | }
    | 
    | ///|
124 | fn Parser::parse_savepoint_statement(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\tcl.mbt:125:10-125:16:
    | 
    | ///|
    | fn Parser::parse_savepoint_statement(
125 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[SavepointStmt] raise ParserError {

<WORKDIR>/src\tcl.mbt:140:4-140:10:
    | }
    | 
    | ///|
140 | fn Parser::parse_release_savepoint_statement(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\tcl.mbt:141:10-141:16:
    | 
    | ///|
    | fn Parser::parse_release_savepoint_statement(
141 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[ReleaseSavepointStmt] raise ParserError {

```
