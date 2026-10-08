# core find-references fixed builtin/exact_view_test.mbt:18:7

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
$ run_moon_ide moon ide find-references 'fixed' --loc 'builtin/exact_view_test.mbt:18:7'
Found 1 references for symbol 'fixed':
<WORKDIR>/builtin/exact_view_test.mbt:29:7-29:12:
   |   for
   |     result in [
   |       arr.exact_view(start=1, end=3),
29 |       fixed.exact_view(start=1, end=3),
   |       ^^^^^
   |       ro.exact_view(start=1, end=3),
   |       view.exact_view(start=1, end=3),

```
