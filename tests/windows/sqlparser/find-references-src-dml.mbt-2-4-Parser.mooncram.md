# sqlparser find-references Parser src\dml.mbt:2:4

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/sqlparser' moon ide find-references 'Parser' --loc 'src\dml.mbt:2:4'
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

<WORKDIR>/src\ddl.mbt:337:4-337:10:
    | }
    | 
    | ///|
337 | fn Parser::parse_column_defs(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:338:10-338:16:
    | 
    | ///|
    | fn Parser::parse_column_defs(
338 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[(Array[ColumnDef], Array[TableConstraint])] raise ParserError {

<WORKDIR>/src\ddl.mbt:385:4-385:10:
    | }
    | 
    | ///|
385 | fn Parser::parse_data_type(
    |    ^^^^^^
    |   _self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:386:11-386:17:
    | 
    | ///|
    | fn Parser::parse_data_type(
386 |   _self : Parser,
    |           ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[DataType] raise ParserError {

<WORKDIR>/src\ddl.mbt:467:4-467:10:
    | }
    | 
    | ///|
467 | fn Parser::parse_column_def_option(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:468:10-468:16:
    | 
    | ///|
    | fn Parser::parse_column_def_option(
468 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Array[ColumnDefOption]] raise ParserError {

<WORKDIR>/src\ddl.mbt:513:4-513:10:
    | }
    | 
    | ///|
513 | fn Parser::parse_create_view_statement(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:514:10-514:16:
    | 
    | ///|
    | fn Parser::parse_create_view_statement(
514 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[CreateViewStmt] raise ParserError {

<WORKDIR>/src\ddl.mbt:553:4-553:10:
    | }
    | 
    | ///|
553 | fn Parser::parse_view_column_def(
    |    ^^^^^^
    |   _self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:554:11-554:17:
    | 
    | ///|
    | fn Parser::parse_view_column_def(
554 |   _self : Parser,
    |           ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[ViewColumnDef] raise ParserError {

<WORKDIR>/src\ddl.mbt:583:4-583:10:
    | }
    | 
    | ///|
583 | fn Parser::parse_drop_view_statement(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:584:10-584:16:
    | 
    | ///|
    | fn Parser::parse_drop_view_statement(
584 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[DropViewStmt] raise ParserError {

<WORKDIR>/src\ddl.mbt:608:4-608:10:
    | }
    | 
    | ///|
608 | fn Parser::parse_table_constraint(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:609:10-609:16:
    | 
    | ///|
    | fn Parser::parse_table_constraint(
609 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[TableConstraint] raise ParserError {

<WORKDIR>/src\ddl.mbt:662:4-662:10:
    | }
    | 
    | ///|
662 | fn Parser::parse_foreign_key_constraint(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:663:10-663:16:
    | 
    | ///|
    | fn Parser::parse_foreign_key_constraint(
663 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[TableConstraint] raise ParserError {

<WORKDIR>/src\ddl.mbt:767:4-767:10:
    | }
    | 
    | ///|
767 | fn Parser::parse_drop_table_statement(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:768:10-768:16:
    | 
    | ///|
    | fn Parser::parse_drop_table_statement(
768 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[DropTableStmt] raise ParserError {

<WORKDIR>/src\ddl.mbt:808:4-808:10:
    | }
    | 
    | ///|
808 | fn Parser::parse_drop_index_statement(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:809:10-809:16:
    | 
    | ///|
    | fn Parser::parse_drop_index_statement(
809 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[DropIndexStmt] raise ParserError {

<WORKDIR>/src\ddl.mbt:909:4-909:10:
    | }
    | 
    | ///|
909 | fn Parser::parse_alter_table_statement(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:910:10-910:16:
    | 
    | ///|
    | fn Parser::parse_alter_table_statement(
910 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[AlterTableStmt] raise ParserError {

<WORKDIR>/src\ddl.mbt:955:4-955:10:
    | 
    | ///|
    | /// ALTER INDEX statement
955 | fn Parser::parse_alter_index_statement(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:956:10-956:16:
    | ///|
    | /// ALTER INDEX statement
    | fn Parser::parse_alter_index_statement(
956 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[AlterIndexStmt] raise ParserError {

<WORKDIR>/src\ddl.mbt:1209:4-1209:10:
     | }
     | 
     | ///|
1209 | fn Parser::parse_create_database_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:1210:10-1210:16:
     | 
     | ///|
     | fn Parser::parse_create_database_statement(
1210 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[CreateDatabaseStmt] raise ParserError {

<WORKDIR>/src\ddl.mbt:1255:4-1255:10:
     | }
     | 
     | ///|
1255 | fn Parser::parse_create_schema_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:1256:10-1256:16:
     | 
     | ///|
     | fn Parser::parse_create_schema_statement(
1256 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[CreateSchemaStmt] raise ParserError {

<WORKDIR>/src\ddl.mbt:1376:4-1376:10:
     | }
     | 
     | ///|
1376 | fn Parser::parse_create_function_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:1377:10-1377:16:
     | 
     | ///|
     | fn Parser::parse_create_function_statement(
1377 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[CreateFunctionStmt] raise ParserError {

<WORKDIR>/src\ddl.mbt:1466:4-1466:10:
     | }
     | 
     | ///|
1466 | fn Parser::parse_create_procedure_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:1467:10-1467:16:
     | 
     | ///|
     | fn Parser::parse_create_procedure_statement(
1467 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[CreateProcedureStmt] raise ParserError {

<WORKDIR>/src\ddl.mbt:1533:4-1533:10:
     | }
     | 
     | ///|
1533 | fn Parser::parse_function_parameter(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:1534:10-1534:16:
     | 
     | ///|
     | fn Parser::parse_function_parameter(
1534 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[FunctionParameter] raise ParserError {

<WORKDIR>/src\ddl.mbt:1660:4-1660:10:
     | }
     | 
     | ///|
1660 | fn Parser::parse_create_sequence_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\ddl.mbt:1661:10-1661:16:
     | 
     | ///|
     | fn Parser::parse_create_sequence_statement(
1661 |   self : Parser,
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
  |   min_bp : Int32,

<WORKDIR>/src\dml.mbt:47:4-47:10:
   | }
   | 
   | ///|
47 | fn Parser::parse_select(
   |    ^^^^^^
   |   self : Parser,
   |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:48:10-48:16:
   | 
   | ///|
   | fn Parser::parse_select(
48 |   self : Parser,
   |          ^^^^^^
   |   tokens : ArrayView[Token],
   | ) -> ParserResult[SelectStmt] raise ParserError {

<WORKDIR>/src\dml.mbt:84:4-84:10:
   | }
   | 
   | ///|
84 | fn Parser::parse_query(
   |    ^^^^^^
   |   self : Parser,
   |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:85:10-85:16:
   | 
   | ///|
   | fn Parser::parse_query(
85 |   self : Parser,
   |          ^^^^^^
   |   tokens : ArrayView[Token],
   | ) -> ParserResult[QueryStmt] raise ParserError {

<WORKDIR>/src\dml.mbt:118:4-118:10:
    | }
    | 
    | ///|
118 | fn Parser::parse_aliasing(
    |    ^^^^^^
    |   _self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:119:11-119:17:
    | 
    | ///|
    | fn Parser::parse_aliasing(
119 |   _self : Parser,
    |           ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[TableAlias?] raise ParserError {

<WORKDIR>/src\dml.mbt:158:4-158:10:
    | }
    | 
    | ///|
158 | fn Parser::parse_projections(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:159:10-159:16:
    | 
    | ///|
    | fn Parser::parse_projections(
159 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Array[Projection]] raise ParserError {

<WORKDIR>/src\dml.mbt:197:4-197:10:
    | }
    | 
    | ///|
197 | fn Parser::parse_expr(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:198:10-198:16:
    | 
    | ///|
    | fn Parser::parse_expr(
198 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Expr] raise ParserError {

<WORKDIR>/src\dml.mbt:226:4-226:10:
    | }
    | 
    | ///|
226 | fn Parser::parse_binary_expr(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:227:10-227:16:
    | 
    | ///|
    | fn Parser::parse_binary_expr(
227 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    |   min_bp : Int32,

<WORKDIR>/src\dml.mbt:246:4-246:10:
    | }
    | 
    | ///|
246 | fn Parser::parse_infix(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:247:10-247:16:
    | 
    | ///|
    | fn Parser::parse_infix(
247 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    |   left : Expr,

<WORKDIR>/src\dml.mbt:330:4-330:10:
    | }
    | 
    | ///|
330 | fn Parser::parse_primary_expr(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:331:10-331:16:
    | 
    | ///|
    | fn Parser::parse_primary_expr(
331 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Expr] raise ParserError {

<WORKDIR>/src\dml.mbt:493:4-493:10:
    | }
    | 
    | ///|
493 | fn Parser::parse_postfix_expr(
    |    ^^^^^^
    |   self : Parser,
    |   expr : Expr,

<WORKDIR>/src\dml.mbt:494:10-494:16:
    | 
    | ///|
    | fn Parser::parse_postfix_expr(
494 |   self : Parser,
    |          ^^^^^^
    |   expr : Expr,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:524:4-524:10:
    | }
    | 
    | ///|
524 | fn Parser::parse_subscript(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:525:10-525:16:
    | 
    | ///|
    | fn Parser::parse_subscript(
525 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Subscript] raise ParserError {

<WORKDIR>/src\dml.mbt:591:4-591:10:
    | }
    | 
    | ///|
591 | fn Parser::parse_table_refs(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:592:10-592:16:
    | 
    | ///|
    | fn Parser::parse_table_refs(
592 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Array[TableRef]] raise ParserError {

<WORKDIR>/src\dml.mbt:612:4-612:10:
    | }
    | 
    | ///|
612 | fn Parser::parse_table_ref(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:613:10-613:16:
    | 
    | ///|
    | fn Parser::parse_table_ref(
613 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[TableRef] raise ParserError {

<WORKDIR>/src\dml.mbt:713:4-713:10:
    | }
    | 
    | ///|
713 | fn Parser::parse_table_factor(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:714:10-714:16:
    | 
    | ///|
    | fn Parser::parse_table_factor(
714 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[TableFactor] raise ParserError {

<WORKDIR>/src\dml.mbt:744:4-744:10:
    | }
    | 
    | ///|
744 | fn Parser::parse_group_by(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:745:10-745:16:
    | 
    | ///|
    | fn Parser::parse_group_by(
745 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Array[Expr]] raise ParserError {

<WORKDIR>/src\dml.mbt:764:4-764:10:
    | }
    | 
    | ///|
764 | fn Parser::parse_order_by(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:765:10-765:16:
    | 
    | ///|
    | fn Parser::parse_order_by(
765 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Array[OrderByExpr]] raise ParserError {

<WORKDIR>/src\dml.mbt:784:4-784:10:
    | }
    | 
    | ///|
784 | fn Parser::parse_order_by_expr(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:785:10-785:16:
    | 
    | ///|
    | fn Parser::parse_order_by_expr(
785 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[OrderByExpr] raise ParserError {

<WORKDIR>/src\dml.mbt:803:4-803:10:
    | }
    | 
    | ///|
803 | fn Parser::parse_date_expr(
    |    ^^^^^^
    |   _self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:804:11-804:17:
    | 
    | ///|
    | fn Parser::parse_date_expr(
804 |   _self : Parser,
    |           ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Expr] raise ParserError {

<WORKDIR>/src\dml.mbt:818:4-818:10:
    | }
    | 
    | ///|
818 | fn Parser::parse_interval_expr(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:819:10-819:16:
    | 
    | ///|
    | fn Parser::parse_interval_expr(
819 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Expr] raise ParserError {

<WORKDIR>/src\dml.mbt:836:4-836:10:
    | }
    | 
    | ///|
836 | fn Parser::parse_extract_expr(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:837:10-837:16:
    | 
    | ///|
    | fn Parser::parse_extract_expr(
837 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Expr] raise ParserError {

<WORKDIR>/src\dml.mbt:855:4-855:10:
    | }
    | 
    | ///|
855 | fn Parser::parse_case_expr(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:856:10-856:16:
    | 
    | ///|
    | fn Parser::parse_case_expr(
856 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Expr] raise ParserError {

<WORKDIR>/src\dml.mbt:899:4-899:10:
    | }
    | 
    | ///|
899 | fn Parser::parse_interval_qualifier(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:900:10-900:16:
    | 
    | ///|
    | fn Parser::parse_interval_qualifier(
900 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[IntervalQualifier] raise ParserError {

<WORKDIR>/src\dml.mbt:916:4-916:10:
    | }
    | 
    | ///|
916 | fn Parser::parse_primary_datetime_field(
    |    ^^^^^^
    |   _self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:917:11-917:17:
    | 
    | ///|
    | fn Parser::parse_primary_datetime_field(
917 |   _self : Parser,
    |           ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[PrimaryDatetimeField] raise ParserError {

<WORKDIR>/src\dml.mbt:948:4-948:10:
    | }
    | 
    | ///|
948 | fn Parser::parse_between_expr(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:949:10-949:16:
    | 
    | ///|
    | fn Parser::parse_between_expr(
949 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    |   left : Expr,

<WORKDIR>/src\dml.mbt:973:4-973:10:
    | }
    | 
    | ///|
973 | fn Parser::parse_in_expr(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:974:10-974:16:
    | 
    | ///|
    | fn Parser::parse_in_expr(
974 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    |   left : Expr,

<WORKDIR>/src\dml.mbt:1025:4-1025:10:
     | }
     | 
     | ///|
1025 | fn Parser::parse_substring_expr(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:1026:10-1026:16:
     | 
     | ///|
     | fn Parser::parse_substring_expr(
1026 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[Expr] raise ParserError {

<WORKDIR>/src\dml.mbt:1061:4-1061:10:
     | }
     | 
     | ///|
1061 | fn Parser::parse_array_expr(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:1062:10-1062:16:
     | 
     | ///|
     | fn Parser::parse_array_expr(
1062 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     |   named : Bool,

<WORKDIR>/src\dml.mbt:1713:4-1713:10:
     | }
     | 
     | ///|
1713 | fn Parser::parse_object_name(
     |    ^^^^^^
     |   _self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:1714:11-1714:17:
     | 
     | ///|
     | fn Parser::parse_object_name(
1714 |   _self : Parser,
     |           ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[ObjectName] raise ParserError {

<WORKDIR>/src\dml.mbt:1782:4-1782:10:
     | }
     | 
     | ///|
1782 | fn Parser::parse_top(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:1783:10-1783:16:
     | 
     | ///|
     | fn Parser::parse_top(
1783 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[Top?] raise ParserError {

<WORKDIR>/src\dml.mbt:1818:4-1818:10:
     | }
     | 
     | ///|
1818 | fn Parser::parse_insert_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:1819:10-1819:16:
     | 
     | ///|
     | fn Parser::parse_insert_statement(
1819 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[InsertStmt] raise ParserError {

<WORKDIR>/src\dml.mbt:2072:4-2072:10:
     | }
     | 
     | ///|
2072 | fn Parser::parse_delete_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2073:10-2073:16:
     | 
     | ///|
     | fn Parser::parse_delete_statement(
2073 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[DeleteStmt] raise ParserError {

<WORKDIR>/src\dml.mbt:2117:4-2117:10:
     | }
     | 
     | ///|
2117 | fn Parser::parse_update_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2118:10-2118:16:
     | 
     | ///|
     | fn Parser::parse_update_statement(
2118 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[UpdateStmt] raise ParserError {

<WORKDIR>/src\dml.mbt:2197:4-2197:10:
     | }
     | 
     | ///|
2197 | fn Parser::parse_truncate_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2198:10-2198:16:
     | 
     | ///|
     | fn Parser::parse_truncate_statement(
2198 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[TruncateStmt] raise ParserError {

<WORKDIR>/src\dml.mbt:2207:4-2207:10:
     | }
     | 
     | ///|
2207 | fn Parser::parse_cte_list(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2208:10-2208:16:
     | 
     | ///|
     | fn Parser::parse_cte_list(
2208 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[Array[Cte]] raise ParserError {

<WORKDIR>/src\dml.mbt:2228:4-2228:10:
     | }
     | 
     | ///|
2228 | fn Parser::parse_cte(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2229:10-2229:16:
     | 
     | ///|
     | fn Parser::parse_cte(
2229 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[Cte] raise ParserError {

<WORKDIR>/src\dml.mbt:2285:4-2285:10:
     | 
     | ///|
     | /// Parse window specification: [PARTITION BY ...] [ORDER BY ...] [frame_clause]
2285 | fn Parser::parse_window_spec(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2286:10-2286:16:
     | ///|
     | /// Parse window specification: [PARTITION BY ...] [ORDER BY ...] [frame_clause]
     | fn Parser::parse_window_spec(
2286 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[WindowSpec] raise ParserError {

<WORKDIR>/src\dml.mbt:2338:4-2338:10:
     | 
     | ///|
     | /// Parse window frame clause: ROWS/RANGE [BETWEEN ... AND ...] or ROWS/RANGE ...
2338 | fn Parser::parse_window_frame_clause(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2339:10-2339:16:
     | ///|
     | /// Parse window frame clause: ROWS/RANGE [BETWEEN ... AND ...] or ROWS/RANGE ...
     | fn Parser::parse_window_frame_clause(
2339 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[WindowFrameClause?] raise ParserError {

<WORKDIR>/src\dml.mbt:2351:4-2351:10:
     | 
     | ///|
     | /// Parse frame bounds: [BETWEEN ... AND ...] or single bound
2351 | fn Parser::parse_frame_bounds(
     |    ^^^^^^
     |   self : Parser,
     |   frame_units : WindowFrameUnits,

<WORKDIR>/src\dml.mbt:2352:10-2352:16:
     | ///|
     | /// Parse frame bounds: [BETWEEN ... AND ...] or single bound
     | fn Parser::parse_frame_bounds(
2352 |   self : Parser,
     |          ^^^^^^
     |   frame_units : WindowFrameUnits,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2397:4-2397:10:
     | 
     | ///|
     | /// Parse individual frame bound
2397 | fn Parser::parse_frame_bound(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2398:10-2398:16:
     | ///|
     | /// Parse individual frame bound
     | fn Parser::parse_frame_bound(
2398 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[WindowFrameBound] raise ParserError {

<WORKDIR>/src\dml.mbt:2677:4-2677:10:
     | }
     | 
     | ///|
2677 | fn Parser::parse_merge_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2678:10-2678:16:
     | 
     | ///|
     | fn Parser::parse_merge_statement(
2678 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[MergeStmt] raise ParserError {

<WORKDIR>/src\dml.mbt:2754:4-2754:10:
     | }
     | 
     | ///|
2754 | fn Parser::parse_merge_when_clause(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2755:10-2755:16:
     | 
     | ///|
     | fn Parser::parse_merge_when_clause(
2755 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[MergeWhenClause] raise ParserError {

<WORKDIR>/src\dml.mbt:2785:4-2785:10:
     | }
     | 
     | ///|
2785 | fn Parser::parse_merge_action(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2786:10-2786:16:
     | 
     | ///|
     | fn Parser::parse_merge_action(
2786 |   self : Parser,
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
   |   dialect~ : &Dialect = MySQL::{ },
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

<WORKDIR>/src\parser.mbt:185:4-185:10:
    | ///|
    | 
    | ///|
185 | fn Parser::parse_show_statement(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:186:10-186:16:
    | 
    | ///|
    | fn Parser::parse_show_statement(
186 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[ShowStmt] raise ParserError {

<WORKDIR>/src\parser.mbt:290:4-290:10:
    | }
    | 
    | ///|
290 | fn Parser::parse_set_statement(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:291:10-291:16:
    | 
    | ///|
    | fn Parser::parse_set_statement(
291 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[SetStmt] raise ParserError {

<WORKDIR>/src\parser.mbt:317:4-317:10:
    | }
    | 
    | ///|
317 | fn Parser::parse_set_assignments(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:318:10-318:16:
    | 
    | ///|
    | fn Parser::parse_set_assignments(
318 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Array[SetAssignment]] raise ParserError {

<WORKDIR>/src\parser.mbt:360:4-360:10:
    | }
    | 
    | ///|
360 | fn Parser::parse_replace_statement(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:361:10-361:16:
    | 
    | ///|
    | fn Parser::parse_replace_statement(
361 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[InsertStmt] raise ParserError {

<WORKDIR>/src\parser.mbt:438:4-438:10:
    | }
    | 
    | ///|
438 | fn Parser::parse_copy_statement(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:439:10-439:16:
    | 
    | ///|
    | fn Parser::parse_copy_statement(
439 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[CopyStmt] raise ParserError {

<WORKDIR>/src\parser.mbt:528:4-528:10:
    | }
    | 
    | ///|
528 | fn Parser::parse_copy_options(
    |    ^^^^^^
    |   _self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:529:11-529:17:
    | 
    | ///|
    | fn Parser::parse_copy_options(
529 |   _self : Parser,
    |           ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Array[CopyOption]] raise ParserError {

<WORKDIR>/src\parser.mbt:706:4-706:10:
    | }
    | 
    | ///|
706 | fn Parser::parse_use_statement(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:707:10-707:16:
    | 
    | ///|
    | fn Parser::parse_use_statement(
707 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[UseStmt] raise ParserError {

<WORKDIR>/src\parser.mbt:718:4-718:10:
    | }
    | 
    | ///|
718 | fn Parser::parse_comma_separated_exprs(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:719:10-719:16:
    | 
    | ///|
    | fn Parser::parse_comma_separated_exprs(
719 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Array[Expr]] raise ParserError {

<WORKDIR>/src\parser.mbt:894:4-894:10:
    | }
    | 
    | ///|
894 | fn Parser::parse_duplicate_key_assignments(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:895:10-895:16:
    | 
    | ///|
    | fn Parser::parse_duplicate_key_assignments(
895 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Array[Assignment]] raise ParserError {

<WORKDIR>/src\parser.mbt:923:4-923:10:
    | }
    | 
    | ///|
923 | fn Parser::parse_on_conflict_clause(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:924:10-924:16:
    | 
    | ///|
    | fn Parser::parse_on_conflict_clause(
924 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[OnConflictClause] raise ParserError {

<WORKDIR>/src\parser.mbt:1047:4-1047:10:
     | }
     | 
     | ///|
1047 | fn Parser::parse_load_data_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:1048:10-1048:16:
     | 
     | ///|
     | fn Parser::parse_load_data_statement(
1048 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[LoadDataStmt] raise ParserError {

<WORKDIR>/src\parser.mbt:1216:4-1216:10:
     | }
     | 
     | ///|
1216 | fn Parser::parse_load_data_fields_options(
     |    ^^^^^^
     |   _self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:1217:11-1217:17:
     | 
     | ///|
     | fn Parser::parse_load_data_fields_options(
1217 |   _self : Parser,
     |           ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[LoadDataFieldsOptions] {

<WORKDIR>/src\parser.mbt:1257:4-1257:10:
     | }
     | 
     | ///|
1257 | fn Parser::parse_load_data_lines_options(
     |    ^^^^^^
     |   _self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:1258:11-1258:17:
     | 
     | ///|
     | fn Parser::parse_load_data_lines_options(
1258 |   _self : Parser,
     |           ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[LoadDataLinesOptions] {

<WORKDIR>/src\parser.mbt:1282:4-1282:10:
     | ///|
     | /// Parse PREPARE statement
     | /// Syntax: PREPARE name [(data_type [, ...])] AS statement
1282 | fn Parser::parse_prepare_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:1283:10-1283:16:
     | /// Parse PREPARE statement
     | /// Syntax: PREPARE name [(data_type [, ...])] AS statement
     | fn Parser::parse_prepare_statement(
1283 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[PrepareStmt] raise ParserError {

<WORKDIR>/src\parser.mbt:1336:4-1336:10:
     | ///   EXECUTE name [(param [, ...])]
     | ///   EXECUTE name USING expr [, ...]
     | ///   EXECUTE IMMEDIATE 'sql_string' [INTO var [, ...]] [USING expr [, ...]]
1336 | fn Parser::parse_execute_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:1337:10-1337:16:
     | ///   EXECUTE name USING expr [, ...]
     | ///   EXECUTE IMMEDIATE 'sql_string' [INTO var [, ...]] [USING expr [, ...]]
     | fn Parser::parse_execute_statement(
1337 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[ExecuteStmt] raise ParserError {

<WORKDIR>/src\parser.mbt:1435:4-1435:10:
     | ///|
     | /// Parse DEALLOCATE statement
     | /// Syntax: DEALLOCATE [PREPARE] name
1435 | fn Parser::parse_deallocate_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\parser.mbt:1436:10-1436:16:
     | /// Parse DEALLOCATE statement
     | /// Syntax: DEALLOCATE [PREPARE] name
     | fn Parser::parse_deallocate_statement(
1436 |   self : Parser,
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
"" (escaped)
````
