# core rename LazyState lazy/lazy.mbt:24:11

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
$ run_moon_ide moon ide rename 'LazyState' 'LazyStateRenamed' --loc 'lazy/lazy.mbt:24:11'
*** Begin Patch
*** Update File: <WORKDIR>/lazy/lazy.mbt
@@
 ///   the thunk and silently break the at-most-once guarantee.
 /// - `Forced(v)`: the thunk has produced `v`; the thunk reference is
 ///   dropped so its captures can be reclaimed.
-priv enum LazyState[A] {
+priv enum LazyStateRenamed[A] {
   Unforced(() -> A)
   Forcing
   Forced(A)
@@
 /// `Lazy[A]` is not thread-safe. Sharing one across threads requires
 /// external synchronization.
 struct Lazy[A] {
-  mut state : LazyState[A]
+  mut state : LazyStateRenamed[A]
 }
 
 ///|
*** End Patch

```
