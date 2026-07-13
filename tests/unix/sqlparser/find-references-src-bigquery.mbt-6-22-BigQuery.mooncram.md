# sqlparser find-references BigQuery src/bigquery.mbt:6:22

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
$ run_moon_ide moon ide find-references 'BigQuery' --loc 'src/bigquery.mbt:6:22'
Found 17 references for symbol 'BigQuery':
<WORKDIR>/src/bigquery.mbt:3:17-3:25:
  | ///|
  | /// BigQuery dialect - supports Google BigQuery specific syntax
3 | pub(all) struct BigQuery {}
  |                 ^^^^^^^^
  | 
  | ///|

<WORKDIR>/src/bigquery.mbt:6:22-6:30:
  | pub(all) struct BigQuery {}
  | 
  | ///|
6 | pub impl Dialect for BigQuery with supports_string_literal_backslash_escape(
  |                      ^^^^^^^^
  |   _self,
  | ) {

<WORKDIR>/src/bigquery.mbt:13:22-13:30:
   | }
   | 
   | ///|
13 | pub impl Dialect for BigQuery with supports_boolean_literals(_self) {
   |                      ^^^^^^^^
   |   true
   | }

<WORKDIR>/src/bigquery.mbt:18:22-18:30:
   | }
   | 
   | ///|
18 | pub impl Dialect for BigQuery with supports_filter_during_aggregation(_self) {
   |                      ^^^^^^^^
   |   false
   | }

<WORKDIR>/src/bigquery.mbt:23:22-23:30:
   | }
   | 
   | ///|
23 | pub impl Dialect for BigQuery with supports_within_after_array_aggregation(
   |                      ^^^^^^^^
   |   _self,
   | ) {

<WORKDIR>/src/bigquery.mbt:30:22-30:30:
   | }
   | 
   | ///|
30 | pub impl Dialect for BigQuery with requires_column_types_in_create_table(_self) {
   |                      ^^^^^^^^
   |   true
   | }

<WORKDIR>/src/bigquery.mbt:35:22-35:30:
   | }
   | 
   | ///|
35 | pub impl Dialect for BigQuery with supports_if_not_exists(_self) {
   |                      ^^^^^^^^
   |   true
   | }

<WORKDIR>/src/bigquery.mbt:40:22-40:30:
   | }
   | 
   | ///|
40 | pub impl Dialect for BigQuery with supports_double_quoted_identifiers(_self) {
   |                      ^^^^^^^^
   |   false
   | }

<WORKDIR>/src/bigquery.mbt:45:22-45:30:
   | }
   | 
   | ///|
45 | pub impl Dialect for BigQuery with supports_named_parameters(_self) {
   |                      ^^^^^^^^
   |   true
   | }

<WORKDIR>/src/bigquery.mbt:50:22-50:30:
   | }
   | 
   | ///|
50 | pub impl Dialect for BigQuery with parse_statement(
   |                      ^^^^^^^^
   |   _self : BigQuery,
   |   _parser : Parser,

<WORKDIR>/src/bigquery.mbt:51:11-51:19:
   | 
   | ///|
   | pub impl Dialect for BigQuery with parse_statement(
51 |   _self : BigQuery,
   |           ^^^^^^^^
   |   _parser : Parser,
   |   _tokens : ArrayView[Token],

<WORKDIR>/src/bigquery.mbt:59:22-59:30:
   | }
   | 
   | ///|
59 | pub impl Dialect for BigQuery with parse_expr(
   |                      ^^^^^^^^
   |   _self : BigQuery,
   |   _tokens : ArrayView[Token],

<WORKDIR>/src/bigquery.mbt:60:11-60:19:
   | 
   | ///|
   | pub impl Dialect for BigQuery with parse_expr(
60 |   _self : BigQuery,
   |           ^^^^^^^^
   |   _tokens : ArrayView[Token],
   | ) -> ParserResult[Expr]? raise ParserError {

<WORKDIR>/src/bigquery.mbt:71:32-71:40:
   | 
   | test "BigQuery named parameter" {
   |   let tokens = "SELECT * FROM users WHERE id = @user_id;"
71 |   let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
   |                                ^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src/bigquery.mbt:88:32-88:40:
   | ///|
   | test "BigQuery positional parameter" {
   |   let tokens = "SELECT * FROM users WHERE id = ?;"
88 |   let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
   |                                ^^^^^^^^
   |   inspect(
   |     stmt,

<WORKDIR>/src/bigquery.mbt:105:32-105:40:
    | ///|
    | test "BigQuery mixed parameters" {
    |   let tokens = "SELECT * FROM users WHERE id = @user_id AND age > ?;"
105 |   let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
    |                                ^^^^^^^^
    |   inspect(
    |     stmt,

<WORKDIR>/src/bigquery.mbt:123:32-123:40:
    | ///|
    | test "BigQuery multiple named parameters" {
    |   let tokens = "SELECT @field FROM @table WHERE @condition = @value;"
123 |   let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
    |                                ^^^^^^^^
    |   inspect(
    |     stmt,

```
