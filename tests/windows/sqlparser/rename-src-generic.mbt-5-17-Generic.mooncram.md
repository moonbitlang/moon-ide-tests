# sqlparser rename Generic src\generic.mbt:5:17

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide rename 'Generic' 'GenericRenamed' --loc 'src\generic.mbt:5:17'
*** Begin Patch
*** Update File: <WORKDIR>/src\generic.mbt
@@
 /// Generic SQL dialect that supports the union of all other dialects
 /// This is the most permissive dialect, useful for parsing various SQL statements
 /// from different sources without strict dialect requirements
-pub(all) struct Generic {}
+pub(all) struct GenericRenamed {}
 
 ///|
-pub impl Dialect for Generic with supports_string_literal_backslash_escape(
+pub impl Dialect for GenericRenamed with supports_string_literal_backslash_escape(
   _self,
 ) {
   true
@@
 }
 
 ///|
-pub impl Dialect for Generic with supports_boolean_literals(_self) {
+pub impl Dialect for GenericRenamed with supports_boolean_literals(_self) {
   true
 }
 
 ///|
-pub impl Dialect for Generic with supports_filter_during_aggregation(_self) {
+pub impl Dialect for GenericRenamed with supports_filter_during_aggregation(_self) {
   true
 }
 
 ///|
-pub impl Dialect for Generic with supports_within_after_array_aggregation(_self) {
+pub impl Dialect for GenericRenamed with supports_within_after_array_aggregation(_self) {
   true
 }
 
 ///|
-pub impl Dialect for Generic with requires_column_types_in_create_table(_self) {
+pub impl Dialect for GenericRenamed with requires_column_types_in_create_table(_self) {
   false
 }
 
 ///|
-pub impl Dialect for Generic with supports_if_not_exists(_self) {
+pub impl Dialect for GenericRenamed with supports_if_not_exists(_self) {
   true
 }
 
 ///|
-pub impl Dialect for Generic with supports_double_quoted_identifiers(_self) {
+pub impl Dialect for GenericRenamed with supports_double_quoted_identifiers(_self) {
   true
 }
 
 ///|
-pub impl Dialect for Generic with parse_statement(
+pub impl Dialect for GenericRenamed with parse_statement(
-  _self : Generic,
+  _self : GenericRenamed,
   _parser : Parser,
   _tokens : ArrayView[Token],
 ) -> ParserResult[Statement]? raise ParserError {
@@
 }
 
 ///|
-pub impl Dialect for Generic with parse_expr(
+pub impl Dialect for GenericRenamed with parse_expr(
-  _self : Generic,
+  _self : GenericRenamed,
   _tokens : ArrayView[Token],
 ) -> ParserResult[Expr]? raise ParserError {
   None
*** Update File: <WORKDIR>/src\postgres.mbt
@@
 test "Complex PostgreSQL arrays fail with generic dialect" {
   let tokens = "SELECT ARRAY[ARRAY[1, 2], [3, 4]] FROM test;"
   try {
-    let _ = parse_sql(dialect=Generic::{  }, tokens)
+    let _ = parse_sql(dialect=GenericRenamed::{  }, tokens)
     abort("Expected parsing to fail with Generic dialect")
   } catch {
     _e => () // Expected behavior - parsing should fail
*** End Patch

```
