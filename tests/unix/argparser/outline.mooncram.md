# argparser outline

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/argparser" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide outline 'arg.mbt'
  2 |using @trie {type Trie}
    |...
 16 |pub(all) enum Spec {
    |...
 25 |fn interpret(
 26 |  trie : @trie.T[Spec],
 27 |  xs : Array[String],
 28 |  fallback : (String) -> Unit raise,
 29 |) -> Unit raise {
    |...
 86 |pub fn parse(
 87 |  speclist : Array[(String, String, Spec, String)],
 88 |  rest : (String) -> Unit raise,
 89 |  usage_msg : String,
 90 |  argv : Array[String],
 91 |) -> Unit raise {
    |...
109 |pub suberror ErrorMsg {
    |...

```

```mooncram
$ run_moon_ide moon ide outline 'arg_test.mbt'
2 |test {
  |...

```
