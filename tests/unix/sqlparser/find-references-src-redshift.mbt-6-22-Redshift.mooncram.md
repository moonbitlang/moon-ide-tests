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
<WORKDIR>/src/redshift.mbt:3:17-3:25:
  | ///|
  | /// Redshift dialect - supports Amazon Redshift specific syntax
3 | pub(all) struct Redshift {}
  |                 ^^^^^^^^
  | 
  | ///|

<WORKDIR>/src/redshift.mbt:6:22-6:30:
  | pub(all) struct Redshift {}
  | 
  | ///|
6 | pub impl Dialect for Redshift with supports_string_literal_backslash_escape(
  |                      ^^^^^^^^
  |   _self,
  | ) {

<WORKDIR>/src/redshift.mbt:13:22-13:30:
   | }
   | 
   | ///|
13 | pub impl Dialect for Redshift with supports_boolean_literals(_self) {
   |                      ^^^^^^^^
   |   true
   | }

<WORKDIR>/src/redshift.mbt:18:22-18:30:
   | }
   | 
   | ///|
18 | pub impl Dialect for Redshift with supports_filter_during_aggregation(_self) {
   |                      ^^^^^^^^
   |   false
   | }

<WORKDIR>/src/redshift.mbt:23:22-23:30:
   | }
   | 
   | ///|
23 | pub impl Dialect for Redshift with supports_within_after_array_aggregation(
   |                      ^^^^^^^^
   |   _self,
   | ) {

<WORKDIR>/src/redshift.mbt:30:22-30:30:
   | }
   | 
   | ///|
30 | pub impl Dialect for Redshift with requires_column_types_in_create_table(_self) {
   |                      ^^^^^^^^
   |   true
   | }

<WORKDIR>/src/redshift.mbt:35:22-35:30:
   | }
   | 
   | ///|
35 | pub impl Dialect for Redshift with supports_if_not_exists(_self) {
   |                      ^^^^^^^^
   |   true
   | }

<WORKDIR>/src/redshift.mbt:40:22-40:30:
   | }
   | 
   | ///|
40 | pub impl Dialect for Redshift with supports_double_quoted_identifiers(_self) {
   |                      ^^^^^^^^
   |   true
   | }

<WORKDIR>/src/redshift.mbt:45:22-45:30:
   | }
   | 
   | ///|
45 | pub impl Dialect for Redshift with parse_statement(
   |                      ^^^^^^^^
   |   _self : Redshift,
   |   _parser : Parser,

<WORKDIR>/src/redshift.mbt:46:11-46:19:
   | 
   | ///|
   | pub impl Dialect for Redshift with parse_statement(
46 |   _self : Redshift,
   |           ^^^^^^^^
   |   _parser : Parser,
   |   _tokens : ArrayView[Token],

<WORKDIR>/src/redshift.mbt:54:22-54:30:
   | }
   | 
   | ///|
54 | pub impl Dialect for Redshift with parse_expr(
   |                      ^^^^^^^^
   |   _self : Redshift,
   |   _tokens : ArrayView[Token],

<WORKDIR>/src/redshift.mbt:55:11-55:19:
   | 
   | ///|
   | pub impl Dialect for Redshift with parse_expr(
55 |   _self : Redshift,
   |           ^^^^^^^^
   |   _tokens : ArrayView[Token],
   | ) -> ParserResult[Expr]? raise ParserError {

```
