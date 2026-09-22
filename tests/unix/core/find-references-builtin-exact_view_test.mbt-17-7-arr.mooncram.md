# core find-references arr builtin/exact_view_test.mbt:17:7

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
$ run_moon_ide moon ide find-references 'arr' --loc 'builtin/exact_view_test.mbt:17:7'
Found 2 references for symbol 'arr':
<WORKDIR>/builtin/exact_view_test.mbt:21:17-21:20:
   |   let fixed : FixedArray[Int] = [1, 2, 3, 4]
   |   let ro : ReadOnlyArray[Int] = [1, 2, 3, 4]
   |   let view = [0, 1, 2, 3, 4, 5][1:5]
21 |   let mutable = arr.mut_view()
   |                 ^^^
   |   let raw = @builtin.UninitializedArray::make(4)
   |   for i in 0..<4 {

<WORKDIR>/builtin/exact_view_test.mbt:28:7-28:10:
   |   }
   |   for
   |     result in [
28 |       arr.exact_view(start=1, end=3),
   |       ^^^
   |       fixed.exact_view(start=1, end=3),
   |       ro.exact_view(start=1, end=3),

```
