# sqlparser rename Redshift src\redshift.mbt:3:17

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide rename 'Redshift' 'RedshiftRenamed' --loc 'src\redshift.mbt:3:17'
*** Begin Patch
*** Update File: <WORKDIR>/src\redshift.mbt
@@
 ///|
 /// Redshift dialect - supports Amazon Redshift specific syntax
-pub(all) struct Redshift {}
+pub(all) struct RedshiftRenamed {}
 
 ///|
-pub impl Dialect for Redshift with supports_string_literal_backslash_escape(
+pub impl Dialect for RedshiftRenamed with supports_string_literal_backslash_escape(
   _self,
 ) {
   true
@@
 }
 
 ///|
-pub impl Dialect for Redshift with supports_boolean_literals(_self) {
+pub impl Dialect for RedshiftRenamed with supports_boolean_literals(_self) {
   true
 }
 
 ///|
-pub impl Dialect for Redshift with supports_filter_during_aggregation(_self) {
+pub impl Dialect for RedshiftRenamed with supports_filter_during_aggregation(_self) {
   false
 }
 
 ///|
-pub impl Dialect for Redshift with supports_within_after_array_aggregation(
+pub impl Dialect for RedshiftRenamed with supports_within_after_array_aggregation(
   _self,
 ) {
   false
@@
 }
 
 ///|
-pub impl Dialect for Redshift with requires_column_types_in_create_table(_self) {
+pub impl Dialect for RedshiftRenamed with requires_column_types_in_create_table(_self) {
   true
 }
 
 ///|
-pub impl Dialect for Redshift with supports_if_not_exists(_self) {
+pub impl Dialect for RedshiftRenamed with supports_if_not_exists(_self) {
   true
 }
 
 ///|
-pub impl Dialect for Redshift with supports_double_quoted_identifiers(_self) {
+pub impl Dialect for RedshiftRenamed with supports_double_quoted_identifiers(_self) {
   true
 }
 
 ///|
-pub impl Dialect for Redshift with parse_statement(
+pub impl Dialect for RedshiftRenamed with parse_statement(
-  _self : Redshift,
+  _self : RedshiftRenamed,
   _parser : Parser,
   _tokens : ArrayView[Token],
 ) -> ParserResult[Statement]? raise ParserError {
@@
 }
 
 ///|
-pub impl Dialect for Redshift with parse_expr(
+pub impl Dialect for RedshiftRenamed with parse_expr(
-  _self : Redshift,
+  _self : RedshiftRenamed,
   _tokens : ArrayView[Token],
 ) -> ParserResult[Expr]? raise ParserError {
   None
*** End Patch

```
