# core rename fixed builtin/exact_view_test.mbt:18:7

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
$ run_moon_ide moon ide rename 'fixed' 'fixed_renamed' --loc 'builtin/exact_view_test.mbt:18:7'
*** Begin Patch
*** Update File: <WORKDIR>/builtin/exact_view_test.mbt
@@
 ///|
 test "exact_view uses the same bounds on all array types" {
   let arr = [1, 2, 3, 4]
-  let fixed : FixedArray[Int] = [1, 2, 3, 4]
+  let fixed_renamed : FixedArray[Int] = [1, 2, 3, 4]
   let ro : ReadOnlyArray[Int] = [1, 2, 3, 4]
   let view = [0, 1, 2, 3, 4, 5][1:5]
   let mutable = arr.mut_view()
@@
   for
     result in [
       arr.exact_view(start=1, end=3),
-      fixed.exact_view(start=1, end=3),
+      fixed_renamed.exact_view(start=1, end=3),
       ro.exact_view(start=1, end=3),
       view.exact_view(start=1, end=3),
       mutable.exact_view(start=1, end=3),
*** End Patch

```
