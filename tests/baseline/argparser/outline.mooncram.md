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
 L002 | using @trie {type Trie}
        ...
 L016 | pub(all) enum Spec {
        ...
 L025 | fn interpret(
 L026 |   trie : @trie.T[Spec],
 L027 |   xs : Array[String],
 L028 |   fallback : (String) -> Unit raise,
 L029 | ) -> Unit raise {
        ...
 L086 | pub fn parse(
 L087 |   speclist : Array[(String, String, Spec, String)],
 L088 |   rest : (String) -> Unit raise,
 L089 |   usage_msg : String,
 L090 |   argv : Array[String],
 L091 | ) -> Unit raise {
        ...
 L109 | pub suberror ErrorMsg {
        ...

```

```mooncram
$ run_moon_ide moon ide outline 'arg_test.mbt'
 L2 | test {
      ...

```
