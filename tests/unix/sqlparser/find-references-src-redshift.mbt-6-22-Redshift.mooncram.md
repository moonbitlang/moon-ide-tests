# sqlparser find-references Redshift src/redshift.mbt:6:22

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
$ run_moon_ide moon ide find-references 'Redshift' --loc 'src/redshift.mbt:6:22'
Found 12 references for symbol 'Redshift':
<WORKDIR>/src/redshift.mbt:6:22-6:30:
  | pub(all) struct Redshift {}
  | 
  | ///|
6 | pub impl Dialect for Redshift with fn supports_string_literal_backslash_escape(
  |                      ^^^^^^^^
  |   _self,
  | ) {

<WORKDIR>/src/redshift.mbt:13:22-13:30:
   | }
   | 
   | ///|
13 | pub impl Dialect for Redshift with fn supports_boolean_literals(_self) {
   |                      ^^^^^^^^
   |   true
   | }

<WORKDIR>/src/redshift.mbt:18:22-18:30:
   | }
   | 
   | ///|
18 | pub impl Dialect for Redshift with fn supports_filter_during_aggregation(_self) {
   |                      ^^^^^^^^
   |   false
   | }

<WORKDIR>/src/redshift.mbt:23:22-23:30:
   | }
   | 
   | ///|
23 | pub impl Dialect for Redshift with fn supports_within_after_array_aggregation(
   |                      ^^^^^^^^
   |   _self,
   | ) {

<WORKDIR>/src/redshift.mbt:30:22-30:30:
   | }
   | 
   | ///|
30 | pub impl Dialect for Redshift with fn requires_column_types_in_create_table(
   |                      ^^^^^^^^
   |   _self,
   | ) {

<WORKDIR>/src/redshift.mbt:37:22-37:30:
   | }
   | 
   | ///|
37 | pub impl Dialect for Redshift with fn supports_if_not_exists(_self) {
   |                      ^^^^^^^^
   |   true
   | }

<WORKDIR>/src/redshift.mbt:42:22-42:30:
   | }
   | 
   | ///|
42 | pub impl Dialect for Redshift with fn supports_double_quoted_identifiers(_self) {
   |                      ^^^^^^^^
   |   true
   | }

<WORKDIR>/src/redshift.mbt:47:22-47:30:
   | }
   | 
   | ///|
47 | pub impl Dialect for Redshift with fn parse_statement(
   |                      ^^^^^^^^
   |   _self : Redshift,
   |   _parser : Parser,

<WORKDIR>/src/redshift.mbt:48:11-48:19:
   | 
   | ///|
   | pub impl Dialect for Redshift with fn parse_statement(
48 |   _self : Redshift,
   |           ^^^^^^^^
   |   _parser : Parser,
   |   _tokens : ArrayView[Token],

<WORKDIR>/src/redshift.mbt:56:22-56:30:
   | }
   | 
   | ///|
56 | pub impl Dialect for Redshift with fn parse_expr(
   |                      ^^^^^^^^
   |   _self : Redshift,
   |   _tokens : ArrayView[Token],

<WORKDIR>/src/redshift.mbt:57:11-57:19:
   | 
   | ///|
   | pub impl Dialect for Redshift with fn parse_expr(
57 |   _self : Redshift,
   |           ^^^^^^^^
   |   _tokens : ArrayView[Token],
   | ) -> ParserResult[Expr]? raise ParserError {

<WORKDIR>/src/redshift.mbt:64:12-64:20:
   | }
   | 
   | ///|
64 | pub extend Redshift with Dialect::{
   |            ^^^^^^^^
   |   supports_filter_during_aggregation,
   |   parse_statement,

```
