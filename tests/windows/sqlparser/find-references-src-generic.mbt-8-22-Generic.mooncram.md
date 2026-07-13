# sqlparser find-references Generic src\generic.mbt:8:22

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide find-references 'Generic' --loc 'src\generic.mbt:8:22'
Found 13 references for symbol 'Generic':
<WORKDIR>/src\generic.mbt:5:17-5:24:
  | /// Generic SQL dialect that supports the union of all other dialects
  | /// This is the most permissive dialect, useful for parsing various SQL statements
  | /// from different sources without strict dialect requirements
5 | pub(all) struct Generic {}
  |                 ^^^^^^^
  | 
  | ///|

<WORKDIR>/src\generic.mbt:8:22-8:29:
  | pub(all) struct Generic {}
  | 
  | ///|
8 | pub impl Dialect for Generic with supports_string_literal_backslash_escape(
  |                      ^^^^^^^
  |   _self,
  | ) {

<WORKDIR>/src\generic.mbt:15:22-15:29:
   | }
   | 
   | ///|
15 | pub impl Dialect for Generic with supports_boolean_literals(_self) {
   |                      ^^^^^^^
   |   true
   | }

<WORKDIR>/src\generic.mbt:20:22-20:29:
   | }
   | 
   | ///|
20 | pub impl Dialect for Generic with supports_filter_during_aggregation(_self) {
   |                      ^^^^^^^
   |   true
   | }

<WORKDIR>/src\generic.mbt:25:22-25:29:
   | }
   | 
   | ///|
25 | pub impl Dialect for Generic with supports_within_after_array_aggregation(_self) {
   |                      ^^^^^^^
   |   true
   | }

<WORKDIR>/src\generic.mbt:30:22-30:29:
   | }
   | 
   | ///|
30 | pub impl Dialect for Generic with requires_column_types_in_create_table(_self) {
   |                      ^^^^^^^
   |   false
   | }

<WORKDIR>/src\generic.mbt:35:22-35:29:
   | }
   | 
   | ///|
35 | pub impl Dialect for Generic with supports_if_not_exists(_self) {
   |                      ^^^^^^^
   |   true
   | }

<WORKDIR>/src\generic.mbt:40:22-40:29:
   | }
   | 
   | ///|
40 | pub impl Dialect for Generic with supports_double_quoted_identifiers(_self) {
   |                      ^^^^^^^
   |   true
   | }

<WORKDIR>/src\generic.mbt:45:22-45:29:
   | }
   | 
   | ///|
45 | pub impl Dialect for Generic with parse_statement(
   |                      ^^^^^^^
   |   _self : Generic,
   |   _parser : Parser,

<WORKDIR>/src\generic.mbt:46:11-46:18:
   | 
   | ///|
   | pub impl Dialect for Generic with parse_statement(
46 |   _self : Generic,
   |           ^^^^^^^
   |   _parser : Parser,
   |   _tokens : ArrayView[Token],

<WORKDIR>/src\generic.mbt:54:22-54:29:
   | }
   | 
   | ///|
54 | pub impl Dialect for Generic with parse_expr(
   |                      ^^^^^^^
   |   _self : Generic,
   |   _tokens : ArrayView[Token],

<WORKDIR>/src\generic.mbt:55:11-55:18:
   | 
   | ///|
   | pub impl Dialect for Generic with parse_expr(
55 |   _self : Generic,
   |           ^^^^^^^
   |   _tokens : ArrayView[Token],
   | ) -> ParserResult[Expr]? raise ParserError {

<WORKDIR>/src\postgres.mbt:291:31-291:38:
    | test "Complex PostgreSQL arrays fail with generic dialect" {
    |   let tokens = "SELECT ARRAY[ARRAY[1, 2], [3, 4]] FROM test;"
    |   try {
291 |     let _ = parse_sql(dialect=Generic::{  }, tokens)
    |                               ^^^^^^^
    |     abort("Expected parsing to fail with Generic dialect")
    |   } catch {

```
