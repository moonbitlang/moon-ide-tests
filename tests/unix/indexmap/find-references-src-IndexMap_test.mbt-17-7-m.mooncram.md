# indexmap find-references m src/IndexMap_test.mbt:17:7

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/indexmap" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide find-references 'm' --loc 'src/IndexMap_test.mbt:17:7'
Found 3 references for symbol 'm':
<WORKDIR>/src/IndexMap_test.mbt:17:7-17:8:
   |  (escaped)
   | ///| (escaped)
   | test "new" { (escaped)
17 |   let m : @IndexMap.T[Int, Int] = @IndexMap.new() (escaped)
   |       ^ (escaped)
   |   inspect(m.capacity(), content="8") (escaped)
   |   @debug.assert_eq(m.size(), 0) (escaped)

<WORKDIR>/src/IndexMap_test.mbt:18:11-18:12:
   | ///| (escaped)
   | test "new" { (escaped)
   |   let m : @IndexMap.T[Int, Int] = @IndexMap.new() (escaped)
18 |   inspect(m.capacity(), content="8") (escaped)
   |           ^ (escaped)
   |   @debug.assert_eq(m.size(), 0) (escaped)
   | } (escaped)

<WORKDIR>/src/IndexMap_test.mbt:19:20-19:21:
   | test "new" { (escaped)
   |   let m : @IndexMap.T[Int, Int] = @IndexMap.new() (escaped)
   |   inspect(m.capacity(), content="8") (escaped)
19 |   @debug.assert_eq(m.size(), 0) (escaped)
   |                    ^ (escaped)
   | } (escaped)
   |  (escaped)

```
