# sqlparser find-references obj src/ast.mbt:2:37

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
$ run_moon_ide moon ide find-references 'obj' --loc 'src/ast.mbt:2:37'
Found 2 references for symbol 'obj':
<WORKDIR>/src/ast.mbt:2:37-2:40:
  | ///| (escaped)
2 | pub fn[T : @pp.Pretty] pretty_print(obj : T) -> String { (escaped)
  |                                     ^^^ (escaped)
  |   @pp.pretty(obj).to_string() (escaped)
  | } (escaped)

<WORKDIR>/src/ast.mbt:3:14-3:17:
  | ///| (escaped)
  | pub fn[T : @pp.Pretty] pretty_print(obj : T) -> String { (escaped)
3 |   @pp.pretty(obj).to_string() (escaped)
  |              ^^^ (escaped)
  | } (escaped)
  |  (escaped)

```
