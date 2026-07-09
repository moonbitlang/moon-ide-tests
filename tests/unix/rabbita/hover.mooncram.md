# rabbita hover

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
$ run_moon_ide moon ide hover 'Cast' --loc 'js/cast.mbt:7:17'
No hover information found for symbol 'Cast' at js/cast.mbt:7:17
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'into' --loc 'js/cast.mbt:8:6'
No hover information found for symbol 'into' at js/cast.mbt:8:6
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'Nullable' --loc 'js/null.mbt:8:11'
No hover information found for symbol 'Nullable' at js/null.mbt:8:11
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'is_null' --loc 'js/null.mbt:8:21'
No hover information found for symbol 'is_null' at js/null.mbt:8:21
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'suspend' --loc 'js/async.mbt:3:28'
No hover information found for symbol 'suspend' at js/async.mbt:3:28
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'f' --loc 'js/async.mbt:4:3'
No hover information found for symbol 'f' at js/async.mbt:4:3
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'Error_' --loc 'js/error.mbt:3:14'
No hover information found for symbol 'Error_' at js/error.mbt:3:14
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'Error_' --loc 'js/error.mbt:4:3'
No hover information found for symbol 'Error_' at js/error.mbt:4:3
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'Union2' --loc 'js/union.mbt:9:21'
No hover information found for symbol 'Union2' at js/union.mbt:9:21
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'to0' --loc 'js/union.mbt:9:29'
No hover information found for symbol 'to0' at js/union.mbt:9:29
[1]
```
