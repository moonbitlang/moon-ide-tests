# sqlparser find-references Parser src\dml.mbt:2:4

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide find-references 'Parser' --loc 'src\dml.mbt:2:4'
Found 200 references for symbol 'Parser':
<WORKDIR>/src\ansi.mbt:43:13-43:19:
   | ///|
   | pub impl Dialect for ANSI with parse_statement(
   |   _self : ANSI,
43 |   _parser : Parser,
   |             ^^^^^^
   |   _tokens : ArrayView[Token],
   | ) -> ParserResult[Statement]? raise ParserError {

<WORKDIR>/src\bigquery.mbt:52:13-52:19:
   | ///|
   | pub impl Dialect for BigQuery with parse_statement(
   |   _self : BigQuery,
52 |   _parser : Parser,
   |             ^^^^^^
   |   _tokens : ArrayView[Token],
   | ) -> ParserResult[Statement]? raise ParserError {

<WORKDIR>/src\clickhouse.mbt:49:13-49:19:
   | ///|
   | pub impl Dialect for ClickHouse with parse_statement(
   |   _self : ClickHouse,
49 |   _parser : Parser,
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

<WORKDIR>/src\dialect.mbt:34:34-34:40:
   |   parse_expr(Self, tokens : ArrayView[Token]) -> ParserResult[Expr]? raise ParserError = _
   | 
   |   /// Custom statement parsing for dialect-specific syntax
34 |   parse_statement(Self, parser : Parser, tokens : ArrayView[Token]) -> ParserResult[
   |                                  ^^^^^^
   |     Statement,
   |   ]? raise ParserError = _

<WORKDIR>/src\dialect.mbt:97:13-97:19:
   | ///|
   | impl Dialect with parse_statement(
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

<WORKDIR>/src\dml.mbt:82:4-82:10:
   | }
   | 
   | ///|
82 | fn Parser::parse_query(
   |    ^^^^^^
   |   self : Parser,
   |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:83:10-83:16:
   | 
   | ///|
   | fn Parser::parse_query(
83 |   self : Parser,
   |          ^^^^^^
   |   tokens : ArrayView[Token],
   | ) -> ParserResult[QueryStmt] raise ParserError {

<WORKDIR>/src\dml.mbt:116:4-116:10:
    | }
    | 
    | ///|
116 | fn Parser::parse_aliasing(
    |    ^^^^^^
    |   _self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:117:11-117:17:
    | 
    | ///|
    | fn Parser::parse_aliasing(
117 |   _self : Parser,
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

<WORKDIR>/src\dml.mbt:198:4-198:10:
    | }
    | 
    | ///|
198 | fn Parser::parse_expr(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:199:10-199:16:
    | 
    | ///|
    | fn Parser::parse_expr(
199 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Expr] raise ParserError {

<WORKDIR>/src\dml.mbt:227:4-227:10:
    | }
    | 
    | ///|
227 | fn Parser::parse_binary_expr(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:228:10-228:16:
    | 
    | ///|
    | fn Parser::parse_binary_expr(
228 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    |   min_bp : Int,

<WORKDIR>/src\dml.mbt:247:4-247:10:
    | }
    | 
    | ///|
247 | fn Parser::parse_infix(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:248:10-248:16:
    | 
    | ///|
    | fn Parser::parse_infix(
248 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    |   left : Expr,

<WORKDIR>/src\dml.mbt:331:4-331:10:
    | }
    | 
    | ///|
331 | fn Parser::parse_primary_expr(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:332:10-332:16:
    | 
    | ///|
    | fn Parser::parse_primary_expr(
332 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Expr] raise ParserError {

<WORKDIR>/src\dml.mbt:508:4-508:10:
    | }
    | 
    | ///|
508 | fn Parser::parse_postfix_expr(
    |    ^^^^^^
    |   self : Parser,
    |   expr : Expr,

<WORKDIR>/src\dml.mbt:509:10-509:16:
    | 
    | ///|
    | fn Parser::parse_postfix_expr(
509 |   self : Parser,
    |          ^^^^^^
    |   expr : Expr,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:539:4-539:10:
    | }
    | 
    | ///|
539 | fn Parser::parse_subscript(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:540:10-540:16:
    | 
    | ///|
    | fn Parser::parse_subscript(
540 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Subscript] raise ParserError {

<WORKDIR>/src\dml.mbt:616:4-616:10:
    | }
    | 
    | ///|
616 | fn Parser::parse_table_refs(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:617:10-617:16:
    | 
    | ///|
    | fn Parser::parse_table_refs(
617 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Array[TableRef]] raise ParserError {

<WORKDIR>/src\dml.mbt:637:4-637:10:
    | }
    | 
    | ///|
637 | fn Parser::parse_table_ref(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:638:10-638:16:
    | 
    | ///|
    | fn Parser::parse_table_ref(
638 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[TableRef] raise ParserError {

<WORKDIR>/src\dml.mbt:740:4-740:10:
    | }
    | 
    | ///|
740 | fn Parser::parse_table_factor(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:741:10-741:16:
    | 
    | ///|
    | fn Parser::parse_table_factor(
741 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[TableFactor] raise ParserError {

<WORKDIR>/src\dml.mbt:774:4-774:10:
    | }
    | 
    | ///|
774 | fn Parser::parse_group_by(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:775:10-775:16:
    | 
    | ///|
    | fn Parser::parse_group_by(
775 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Array[Expr]] raise ParserError {

<WORKDIR>/src\dml.mbt:794:4-794:10:
    | }
    | 
    | ///|
794 | fn Parser::parse_order_by(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:795:10-795:16:
    | 
    | ///|
    | fn Parser::parse_order_by(
795 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Array[OrderByExpr]] raise ParserError {

<WORKDIR>/src\dml.mbt:814:4-814:10:
    | }
    | 
    | ///|
814 | fn Parser::parse_order_by_expr(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:815:10-815:16:
    | 
    | ///|
    | fn Parser::parse_order_by_expr(
815 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[OrderByExpr] raise ParserError {

<WORKDIR>/src\dml.mbt:833:4-833:10:
    | }
    | 
    | ///|
833 | fn Parser::parse_date_expr(
    |    ^^^^^^
    |   _self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:834:11-834:17:
    | 
    | ///|
    | fn Parser::parse_date_expr(
834 |   _self : Parser,
    |           ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Expr] raise ParserError {

<WORKDIR>/src\dml.mbt:851:4-851:10:
    | }
    | 
    | ///|
851 | fn Parser::parse_interval_expr(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:852:10-852:16:
    | 
    | ///|
    | fn Parser::parse_interval_expr(
852 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Expr] raise ParserError {

<WORKDIR>/src\dml.mbt:872:4-872:10:
    | }
    | 
    | ///|
872 | fn Parser::parse_extract_expr(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:873:10-873:16:
    | 
    | ///|
    | fn Parser::parse_extract_expr(
873 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Expr] raise ParserError {

<WORKDIR>/src\dml.mbt:894:4-894:10:
    | }
    | 
    | ///|
894 | fn Parser::parse_case_expr(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:895:10-895:16:
    | 
    | ///|
    | fn Parser::parse_case_expr(
895 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[Expr] raise ParserError {

<WORKDIR>/src\dml.mbt:941:4-941:10:
    | }
    | 
    | ///|
941 | fn Parser::parse_interval_qualifier(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:942:10-942:16:
    | 
    | ///|
    | fn Parser::parse_interval_qualifier(
942 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[IntervalQualifier] raise ParserError {

<WORKDIR>/src\dml.mbt:958:4-958:10:
    | }
    | 
    | ///|
958 | fn Parser::parse_primary_datetime_field(
    |    ^^^^^^
    |   _self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:959:11-959:17:
    | 
    | ///|
    | fn Parser::parse_primary_datetime_field(
959 |   _self : Parser,
    |           ^^^^^^
    |   tokens : ArrayView[Token],
    | ) -> ParserResult[PrimaryDatetimeField] raise ParserError {

<WORKDIR>/src\dml.mbt:990:4-990:10:
    | }
    | 
    | ///|
990 | fn Parser::parse_between_expr(
    |    ^^^^^^
    |   self : Parser,
    |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:991:10-991:16:
    | 
    | ///|
    | fn Parser::parse_between_expr(
991 |   self : Parser,
    |          ^^^^^^
    |   tokens : ArrayView[Token],
    |   left : Expr,

<WORKDIR>/src\dml.mbt:1018:4-1018:10:
     | }
     | 
     | ///|
1018 | fn Parser::parse_in_expr(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:1019:10-1019:16:
     | 
     | ///|
     | fn Parser::parse_in_expr(
1019 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     |   left : Expr,

<WORKDIR>/src\dml.mbt:1076:4-1076:10:
     | }
     | 
     | ///|
1076 | fn Parser::parse_substring_expr(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:1077:10-1077:16:
     | 
     | ///|
     | fn Parser::parse_substring_expr(
1077 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[Expr] raise ParserError {

<WORKDIR>/src\dml.mbt:1112:4-1112:10:
     | }
     | 
     | ///|
1112 | fn Parser::parse_array_expr(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:1113:10-1113:16:
     | 
     | ///|
     | fn Parser::parse_array_expr(
1113 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     |   named : Bool,

<WORKDIR>/src\dml.mbt:1767:4-1767:10:
     | }
     | 
     | ///|
1767 | fn Parser::parse_object_name(
     |    ^^^^^^
     |   _self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:1768:11-1768:17:
     | 
     | ///|
     | fn Parser::parse_object_name(
1768 |   _self : Parser,
     |           ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[ObjectName] raise ParserError {

<WORKDIR>/src\dml.mbt:1839:4-1839:10:
     | }
     | 
     | ///|
1839 | fn Parser::parse_top(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:1840:10-1840:16:
     | 
     | ///|
     | fn Parser::parse_top(
1840 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[Top?] raise ParserError {

<WORKDIR>/src\dml.mbt:1875:4-1875:10:
     | }
     | 
     | ///|
1875 | fn Parser::parse_insert_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:1876:10-1876:16:
     | 
     | ///|
     | fn Parser::parse_insert_statement(
1876 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[InsertStmt] raise ParserError {

<WORKDIR>/src\dml.mbt:2133:4-2133:10:
     | }
     | 
     | ///|
2133 | fn Parser::parse_delete_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2134:10-2134:16:
     | 
     | ///|
     | fn Parser::parse_delete_statement(
2134 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[DeleteStmt] raise ParserError {

<WORKDIR>/src\dml.mbt:2178:4-2178:10:
     | }
     | 
     | ///|
2178 | fn Parser::parse_update_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2179:10-2179:16:
     | 
     | ///|
     | fn Parser::parse_update_statement(
2179 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[UpdateStmt] raise ParserError {

<WORKDIR>/src\dml.mbt:2258:4-2258:10:
     | }
     | 
     | ///|
2258 | fn Parser::parse_truncate_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2259:10-2259:16:
     | 
     | ///|
     | fn Parser::parse_truncate_statement(
2259 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[TruncateStmt] raise ParserError {

<WORKDIR>/src\dml.mbt:2268:4-2268:10:
     | }
     | 
     | ///|
2268 | fn Parser::parse_cte_list(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2269:10-2269:16:
     | 
     | ///|
     | fn Parser::parse_cte_list(
2269 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[Array[Cte]] raise ParserError {

<WORKDIR>/src\dml.mbt:2289:4-2289:10:
     | }
     | 
     | ///|
2289 | fn Parser::parse_cte(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2290:10-2290:16:
     | 
     | ///|
     | fn Parser::parse_cte(
2290 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[Cte] raise ParserError {

<WORKDIR>/src\dml.mbt:2346:4-2346:10:
     | 
     | ///|
     | /// Parse window specification: [PARTITION BY ...] [ORDER BY ...] [frame_clause]
2346 | fn Parser::parse_window_spec(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2347:10-2347:16:
     | ///|
     | /// Parse window specification: [PARTITION BY ...] [ORDER BY ...] [frame_clause]
     | fn Parser::parse_window_spec(
2347 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[WindowSpec] raise ParserError {

<WORKDIR>/src\dml.mbt:2399:4-2399:10:
     | 
     | ///|
     | /// Parse window frame clause: ROWS/RANGE [BETWEEN ... AND ...] or ROWS/RANGE ...
2399 | fn Parser::parse_window_frame_clause(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2400:10-2400:16:
     | ///|
     | /// Parse window frame clause: ROWS/RANGE [BETWEEN ... AND ...] or ROWS/RANGE ...
     | fn Parser::parse_window_frame_clause(
2400 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[WindowFrameClause?] raise ParserError {

<WORKDIR>/src\dml.mbt:2414:4-2414:10:
     | 
     | ///|
     | /// Parse frame bounds: [BETWEEN ... AND ...] or single bound
2414 | fn Parser::parse_frame_bounds(
     |    ^^^^^^
     |   self : Parser,
     |   frame_units : WindowFrameUnits,

<WORKDIR>/src\dml.mbt:2415:10-2415:16:
     | ///|
     | /// Parse frame bounds: [BETWEEN ... AND ...] or single bound
     | fn Parser::parse_frame_bounds(
2415 |   self : Parser,
     |          ^^^^^^
     |   frame_units : WindowFrameUnits,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2468:4-2468:10:
     | 
     | ///|
     | /// Parse individual frame bound
2468 | fn Parser::parse_frame_bound(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2469:10-2469:16:
     | ///|
     | /// Parse individual frame bound
     | fn Parser::parse_frame_bound(
2469 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[WindowFrameBound] raise ParserError {

<WORKDIR>/src\dml.mbt:2754:4-2754:10:
     | }
     | 
     | ///|
2754 | fn Parser::parse_merge_statement(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2755:10-2755:16:
     | 
     | ///|
     | fn Parser::parse_merge_statement(
2755 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[MergeStmt] raise ParserError {

<WORKDIR>/src\dml.mbt:2831:4-2831:10:
     | }
     | 
     | ///|
2831 | fn Parser::parse_merge_when_clause(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2832:10-2832:16:
     | 
     | ///|
     | fn Parser::parse_merge_when_clause(
2832 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[MergeWhenClause] raise ParserError {

<WORKDIR>/src\dml.mbt:2866:4-2866:10:
     | }
     | 
     | ///|
2866 | fn Parser::parse_merge_action(
     |    ^^^^^^
     |   self : Parser,
     |   tokens : ArrayView[Token],

<WORKDIR>/src\dml.mbt:2867:10-2867:16:
     | 
     | ///|
     | fn Parser::parse_merge_action(
2867 |   self : Parser,
     |          ^^^^^^
     |   tokens : ArrayView[Token],
     | ) -> ParserResult[MergeAction] raise ParserError {

<WORKDIR>/src\duckdb.mbt:43:13-43:19:
   | ///|
   | pub impl Dialect for DuckDB with parse_statement(
   |   _self : DuckDB,
43 |   _parser : Parser,
   |             ^^^^^^
   |   _tokens : ArrayView[Token],
   | ) -> ParserResult[Statement]? raise ParserError {

<WORKDIR>/src\generic.mbt:47:13-47:19:
   | ///|
   | pub impl Dialect for Generic with parse_statement(
   |   _self : Generic,
47 |   _parser : Parser,
   |             ^^^^^^
   |   _tokens : ArrayView[Token],
   | ) -> ParserResult[Statement]? raise ParserError {

<WORKDIR>/src\mysql.mbt:61:12-61:18:
   | ///|
   | pub impl Dialect for MySQL with parse_statement(
   |   _self : MySQL,
61 |   parser : Parser,
   |            ^^^^^^
   |   tokens : ArrayView[Token],
   | ) -> ParserResult[Statement]? raise ParserError {

<WORKDIR>/src\parser.mbt:15:12-15:18:
   | type ParserResult[T] = (T, ArrayView[Token])
   | 
   | ///|
15 | pub struct Parser {
   |            ^^^^^^
   |   dialect : &Dialect
   |   // recursion counter

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
   |   dialect? : &Dialect = MySQL::{  },
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

<WORKDIR>/src\postgres.mbt:51:13-51:19:
   | ///|
   | pub impl Dialect for Postgres with parse_statement(
   |   _self : Postgres,
51 |   _parser : Parser,
   |             ^^^^^^
   |   tokens : ArrayView[Token],
   | ) -> ParserResult[Statement]? raise ParserError {

<WORKDIR>/src\redshift.mbt:47:13-47:19:
   | ///|
   | pub impl Dialect for Redshift with parse_statement(
   |   _self : Redshift,
47 |   _parser : Parser,
   |             ^^^^^^
   |   _tokens : ArrayView[Token],
   | ) -> ParserResult[Statement]? raise ParserError {

<WORKDIR>/src\snowflake.mbt:47:13-47:19:
   | ///|
   | pub impl Dialect for Snowflake with parse_statement(
   |   _self : Snowflake,
47 |   _parser : Parser,
   |             ^^^^^^
   |   _tokens : ArrayView[Token],
   | ) -> ParserResult[Statement]? raise ParserError {

<WORKDIR>/src\sqlite.mbt:42:13-42:19:
   | ///|
   | pub impl Dialect for SQLite with parse_statement(
   |   _self : SQLite,
42 |   _parser : Parser,
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
