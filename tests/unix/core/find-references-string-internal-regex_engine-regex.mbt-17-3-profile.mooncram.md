# core find-references profile string/internal/regex_engine/regex.mbt:17:3

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/core" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide find-references 'profile' --loc 'string/internal/regex_engine/regex.mbt:17:3'
Found 4 references for symbol 'profile':
<WORKDIR>/string/internal/regex_engine/execute.mbt:59:18-59:25:
   |   guard last_index >= 0 && last_index <= input.length() else { panic() }
   |   let symbol_table = self.symbol_table
   |   let prev_cat = category_from_symbol(
59 |     profile=self.profile,
   |                  ^^^^^^^
   |     symbol_repr=self.symbol_repr,
   |     if last_index == 0 {

<WORKDIR>/string/internal/regex_engine/execute.mbt:117:22-117:29:
    |     Failed => None
    |     Running => {
    |       let next_cat = category_from_symbol(
117 |         profile=self.profile,
    |                      ^^^^^^^
    |         symbol_repr=self.symbol_repr,
    |         if pos >= end {

<WORKDIR>/string/internal/regex_engine/regex.mbt:56:5-56:12:
   |   symbol_repr : ReadOnlyArray[Rechar],
   | ) -> Regex {
   |   {
56 |     profile,
   |     ^^^^^^^
   |     ctx,
   |     expr,

<WORKDIR>/string/internal/regex_engine/states.mbt:87:18-87:25:
   |   symbol : Rechar,
   | ) -> StateId {
   |   let cat = category_from_symbol(
87 |     profile=self.profile,
   |                  ^^^^^^^
   |     symbol_repr=self.symbol_repr,
   |     symbol,

```
