# core rename i builtin/int64.mbt:31:24

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
$ run_moon_ide moon ide rename 'i' 'i_renamed' --loc 'builtin/int64.mbt:31:24'
*** Begin Patch
*** Update File: <WORKDIR>/builtin/int64.mbt
@@
 ///   inspect(Int64::from_int(42), content="42")
 /// }
 /// ```
-pub fn Int64::from_int(i : Int) -> Int64 {
+pub fn Int64::from_int(i_renamed : Int) -> Int64 {
   i.to_int64()
 }
 
@@
 
 ///|
 pub impl Hash for Int64 with fn hash_combine(self, hasher) {
-  hasher.combine_int64(self)
+  hasher.combine_int64(i_renamed)
 }
 
 ///|
*** End Patch

```
