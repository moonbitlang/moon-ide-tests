# sqlparser rename BigQuery src\bigquery.mbt:6:22

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide rename 'BigQuery' 'BigQueryRenamed' --loc 'src\bigquery.mbt:6:22'
*** Begin Patch
*** Update File: <WORKDIR>/src\bigquery.mbt
@@
 ///|
 /// BigQuery dialect - supports Google BigQuery specific syntax
-pub(all) struct BigQuery {}
+pub(all) struct BigQueryRenamed {}
 
 ///|
-pub impl Dialect for BigQuery with supports_string_literal_backslash_escape(
+pub impl Dialect for BigQueryRenamed with supports_string_literal_backslash_escape(
   _self,
 ) {
   true
@@
 }
 
 ///|
-pub impl Dialect for BigQuery with supports_boolean_literals(_self) {
+pub impl Dialect for BigQueryRenamed with supports_boolean_literals(_self) {
   true
 }
 
 ///|
-pub impl Dialect for BigQuery with supports_filter_during_aggregation(_self) {
+pub impl Dialect for BigQueryRenamed with supports_filter_during_aggregation(_self) {
   false
 }
 
 ///|
-pub impl Dialect for BigQuery with supports_within_after_array_aggregation(
+pub impl Dialect for BigQueryRenamed with supports_within_after_array_aggregation(
   _self,
 ) {
   false
@@
 }
 
 ///|
-pub impl Dialect for BigQuery with requires_column_types_in_create_table(_self) {
+pub impl Dialect for BigQueryRenamed with requires_column_types_in_create_table(_self) {
   true
 }
 
 ///|
-pub impl Dialect for BigQuery with supports_if_not_exists(_self) {
+pub impl Dialect for BigQueryRenamed with supports_if_not_exists(_self) {
   true
 }
 
 ///|
-pub impl Dialect for BigQuery with supports_double_quoted_identifiers(_self) {
+pub impl Dialect for BigQueryRenamed with supports_double_quoted_identifiers(_self) {
   false
 }
 
 ///|
-pub impl Dialect for BigQuery with supports_named_parameters(_self) {
+pub impl Dialect for BigQueryRenamed with supports_named_parameters(_self) {
   true
 }
 
 ///|
-pub impl Dialect for BigQuery with parse_statement(
+pub impl Dialect for BigQueryRenamed with parse_statement(
-  _self : BigQuery,
+  _self : BigQueryRenamed,
   _parser : Parser,
   _tokens : ArrayView[Token],
 ) -> ParserResult[Statement]? raise ParserError {
@@
 }
 
 ///|
-pub impl Dialect for BigQuery with parse_expr(
+pub impl Dialect for BigQueryRenamed with parse_expr(
-  _self : BigQuery,
+  _self : BigQueryRenamed,
   _tokens : ArrayView[Token],
 ) -> ParserResult[Expr]? raise ParserError {
   None
@@
 
 test "BigQuery named parameter" {
   let tokens = "SELECT * FROM users WHERE id = @user_id;"
-  let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=BigQueryRenamed::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "BigQuery positional parameter" {
   let tokens = "SELECT * FROM users WHERE id = ?;"
-  let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=BigQueryRenamed::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "BigQuery mixed parameters" {
   let tokens = "SELECT * FROM users WHERE id = @user_id AND age > ?;"
-  let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=BigQueryRenamed::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
@@
 ///|
 test "BigQuery multiple named parameters" {
   let tokens = "SELECT @field FROM @table WHERE @condition = @value;"
-  let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
+  let stmt = parse_sql(dialect=BigQueryRenamed::{  }, tokens).stmts[0] |> pretty_print
   inspect(
     stmt,
     content=(
*** End Patch

```
