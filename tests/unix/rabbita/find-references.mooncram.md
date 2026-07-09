# rabbita find-references

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/rabbita/rabbita" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide find-references 'Cast' --loc 'js/cast.mbt:7:17'
Error: could not find references for symbol 'Cast' at js/cast.mbt:7:17
[1]
```

```mooncram
$ run_moon_ide moon ide find-references 'into' --loc 'js/cast.mbt:8:6'
Error: could not find references for symbol 'into' at js/cast.mbt:8:6
[1]
```

```mooncram
$ run_moon_ide moon ide find-references 'Nullable' --loc 'js/null.mbt:8:11'
Error: could not find references for symbol 'Nullable' at js/null.mbt:8:11
[1]
```

```mooncram
$ run_moon_ide moon ide find-references 'is_null' --loc 'js/null.mbt:8:21'
Error: could not find references for symbol 'is_null' at js/null.mbt:8:21
[1]
```

```mooncram
$ run_moon_ide moon ide find-references 'suspend' --loc 'js/async.mbt:3:28'
Error: could not find references for symbol 'suspend' at js/async.mbt:3:28
[1]
```

```mooncram
$ run_moon_ide moon ide find-references 'f' --loc 'js/async.mbt:4:3'
Error: could not find references for symbol 'f' at js/async.mbt:4:3
[1]
```

```mooncram
$ run_moon_ide moon ide find-references 'Error_' --loc 'js/error.mbt:3:14'
Error: could not find references for symbol 'Error_' at js/error.mbt:3:14
[1]
```

```mooncram
$ run_moon_ide moon ide find-references 'Error_' --loc 'js/error.mbt:4:3'
Error: could not find references for symbol 'Error_' at js/error.mbt:4:3
[1]
```

```mooncram
$ run_moon_ide moon ide find-references 'Union2' --loc 'js/union.mbt:9:21'
Error: could not find references for symbol 'Union2' at js/union.mbt:9:21
[1]
```

```mooncram
$ run_moon_ide moon ide find-references 'to0' --loc 'js/union.mbt:9:29'
Error: could not find references for symbol 'to0' at js/union.mbt:9:29
[1]
```
