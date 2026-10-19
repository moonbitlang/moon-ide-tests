# core rename to_repr test/extends.mbt:22:37

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
$ run_moon_ide moon ide rename 'to_repr' 'to_repr_renamed' --loc 'test/extends.mbt:22:37'
*** Begin Patch
*** Update File: <WORKDIR>/test/extends.mbt
@@
 ///|
 #deprecated("Use `Debug::to_repr` instead", skip_current_package=true)
 #doc(hidden)
-pub extend Test with @debug.Debug::{to_repr}
+pub extend Test with @debug.Debug::{to_repr_renamed}
*** End Patch

```
