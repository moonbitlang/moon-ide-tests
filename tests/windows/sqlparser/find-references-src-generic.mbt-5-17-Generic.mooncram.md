# sqlparser find-references Generic src\generic.mbt:5:17

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide find-references 'Generic' --loc 'src\generic.mbt:5:17'
Found 13 references for symbol 'Generic':
<WORKDIR>/src\generic.mbt:8:22-8:29:
  | pub(all) struct Generic {}
  | 
  | ///|
8 | pub impl Dialect for Generic with fn supports_string_literal_backslash_escape(
  |                      ^^^^^^^
  |   _self,
  | ) {

<WORKDIR>/src\generic.mbt:15:22-15:29:
   | }
   | 
   | ///|
15 | pub impl Dialect for Generic with fn supports_boolean_literals(_self) {
   |                      ^^^^^^^
   |   true
   | }

<WORKDIR>/src\generic.mbt:20:22-20:29:
   | }
   | 
   | ///|
20 | pub impl Dialect for Generic with fn supports_filter_during_aggregation(_self) {
   |                      ^^^^^^^
   |   true
   | }

<WORKDIR>/src\generic.mbt:25:22-25:29:
   | }
   | 
   | ///|
25 | pub impl Dialect for Generic with fn supports_within_after_array_aggregation(
   |                      ^^^^^^^
   |   _self,
   | ) {

<WORKDIR>/src\generic.mbt:32:22-32:29:
   | }
   | 
   | ///|
32 | pub impl Dialect for Generic with fn requires_column_types_in_create_table(
   |                      ^^^^^^^
   |   _self,
   | ) {

<WORKDIR>/src\generic.mbt:39:22-39:29:
   | }
   | 
   | ///|
39 | pub impl Dialect for Generic with fn supports_if_not_exists(_self) {
   |                      ^^^^^^^
   |   true
   | }

<WORKDIR>/src\generic.mbt:44:22-44:29:
   | }
   | 
   | ///|
44 | pub impl Dialect for Generic with fn supports_double_quoted_identifiers(_self) {
   |                      ^^^^^^^
   |   true
   | }

<WORKDIR>/src\generic.mbt:49:22-49:29:
   | }
   | 
   | ///|
49 | pub impl Dialect for Generic with fn parse_statement(
   |                      ^^^^^^^
   |   _self : Generic,
   |   _parser : Parser,

<WORKDIR>/src\generic.mbt:50:11-50:18:
   | 
   | ///|
   | pub impl Dialect for Generic with fn parse_statement(
50 |   _self : Generic,
   |           ^^^^^^^
   |   _parser : Parser,
   |   _tokens : ArrayView[Token],

<WORKDIR>/src\generic.mbt:58:22-58:29:
   | }
   | 
   | ///|
58 | pub impl Dialect for Generic with fn parse_expr(
   |                      ^^^^^^^
   |   _self : Generic,
   |   _tokens : ArrayView[Token],

<WORKDIR>/src\generic.mbt:59:11-59:18:
   | 
   | ///|
   | pub impl Dialect for Generic with fn parse_expr(
59 |   _self : Generic,
   |           ^^^^^^^
   |   _tokens : ArrayView[Token],
   | ) -> ParserResult[Expr]? raise ParserError {

<WORKDIR>/src\generic.mbt:66:12-66:19:
   | }
   | 
   | ///|
66 | pub extend Generic with Dialect::{
   |            ^^^^^^^
   |   supports_filter_during_aggregation,
   |   parse_statement,

<WORKDIR>/src\postgres.mbt:293:31-293:38:
    | test "Complex PostgreSQL arrays fail with generic dialect" {
    |   let tokens = "SELECT ARRAY[ARRAY[1, 2], [3, 4]] FROM test;"
    |   try {
293 |     let _ = parse_sql(dialect=Generic::{ }, tokens)
    |                               ^^^^^^^
    |     abort("Expected parsing to fail with Generic dialect")
    |   } catch {

```
