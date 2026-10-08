# sqlparser find-references BigQuery src\bigquery.mbt:3:17

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide find-references 'BigQuery' --loc 'src\bigquery.mbt:3:17'
Found 17 references for symbol 'BigQuery':
<WORKDIR>/src\bigquery.mbt:6:22-6:30:
  | pub(all) struct BigQuery {}
  | 
  | ///|
6 | pub impl Dialect for BigQuery with fn supports_string_literal_backslash_escape(
  |                      ^^^^^^^^
  |   _self,
  | ) {

<WORKDIR>/src\bigquery.mbt:13:22-13:30:
   | }
   | 
   | ///|
13 | pub impl Dialect for BigQuery with fn supports_boolean_literals(_self) {
   |                      ^^^^^^^^
   |   true
   | }

<WORKDIR>/src\bigquery.mbt:18:22-18:30:
   | }
   | 
   | ///|
18 | pub impl Dialect for BigQuery with fn supports_filter_during_aggregation(_self) {
   |                      ^^^^^^^^
   |   false
   | }

<WORKDIR>/src\bigquery.mbt:23:22-23:30:
   | }
   | 
   | ///|
23 | pub impl Dialect for BigQuery with fn supports_within_after_array_aggregation(
   |                      ^^^^^^^^
   |   _self,
   | ) {

<WORKDIR>/src\bigquery.mbt:30:22-30:30:
   | }
   | 
   | ///|
30 | pub impl Dialect for BigQuery with fn requires_column_types_in_create_table(
   |                      ^^^^^^^^
   |   _self,
   | ) {

<WORKDIR>/src\bigquery.mbt:37:22-37:30:
   | }
   | 
   | ///|
37 | pub impl Dialect for BigQuery with fn supports_if_not_exists(_self) {
   |                      ^^^^^^^^
   |   true
   | }

<WORKDIR>/src\bigquery.mbt:42:22-42:30:
   | }
   | 
   | ///|
42 | pub impl Dialect for BigQuery with fn supports_double_quoted_identifiers(_self) {
   |                      ^^^^^^^^
   |   false
   | }

<WORKDIR>/src\bigquery.mbt:47:22-47:30:
   | }
   | 
   | ///|
47 | pub impl Dialect for BigQuery with fn supports_named_parameters(_self) {
   |                      ^^^^^^^^
   |   true
   | }

<WORKDIR>/src\bigquery.mbt:52:22-52:30:
   | }
   | 
   | ///|
52 | pub impl Dialect for BigQuery with fn parse_statement(
   |                      ^^^^^^^^
   |   _self : BigQuery,
   |   _parser : Parser,

<WORKDIR>/src\bigquery.mbt:53:11-53:19:
   | 
   | ///|
   | pub impl Dialect for BigQuery with fn parse_statement(
53 |   _self : BigQuery,
   |           ^^^^^^^^
   |   _parser : Parser,
   |   _tokens : ArrayView[Token],

<WORKDIR>/src\bigquery.mbt:61:22-61:30:
   | }
   | 
   | ///|
61 | pub impl Dialect for BigQuery with fn parse_expr(
   |                      ^^^^^^^^
   |   _self : BigQuery,
   |   _tokens : ArrayView[Token],

<WORKDIR>/src\bigquery.mbt:62:11-62:19:
   | 
   | ///|
   | pub impl Dialect for BigQuery with fn parse_expr(
62 |   _self : BigQuery,
   |           ^^^^^^^^
   |   _tokens : ArrayView[Token],
   | ) -> ParserResult[Expr]? raise ParserError {

<WORKDIR>/src\bigquery.mbt:73:32-73:40:
   | 
   | test "BigQuery named parameter" {
   |   let tokens = "SELECT * FROM users WHERE id = @user_id;"
73 |   let stmt = parse_sql(dialect=BigQuery::{ }, tokens).stmts[0] |> pretty_print
   |                                ^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src\bigquery.mbt:90:32-90:40:
   | ///|
   | test "BigQuery positional parameter" {
   |   let tokens = "SELECT * FROM users WHERE id = ?;"
90 |   let stmt = parse_sql(dialect=BigQuery::{ }, tokens).stmts[0] |> pretty_print
   |                                ^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src\bigquery.mbt:107:32-107:40:
    | ///|
    | test "BigQuery mixed parameters" {
    |   let tokens = "SELECT * FROM users WHERE id = @user_id AND age > ?;"
107 |   let stmt = parse_sql(dialect=BigQuery::{ }, tokens).stmts[0] |> pretty_print
    |                                ^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\bigquery.mbt:125:32-125:40:
    | ///|
    | test "BigQuery multiple named parameters" {
    |   let tokens = "SELECT @field FROM @table WHERE @condition = @value;"
125 |   let stmt = parse_sql(dialect=BigQuery::{ }, tokens).stmts[0] |> pretty_print
    |                                ^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src\bigquery.mbt:157:12-157:20:
    | }
    | 
    | ///|
157 | pub extend BigQuery with Dialect::{
    |            ^^^^^^^^
    |   supports_filter_during_aggregation,
    |   parse_statement,

```
