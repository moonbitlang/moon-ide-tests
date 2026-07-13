# async rename kind_of_fd_sync_ffi src/internal/event_loop/stdio.mbt:17:15

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/async" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide rename 'kind_of_fd_sync_ffi' 'kind_of_fd_sync_ffi_renamed' --loc 'src/internal/event_loop/stdio.mbt:17:15'
*** Begin Patch
*** Update File: <WORKDIR>/src/internal/event_loop/stdio.mbt
@@
 
 ///|
 #cfg(target="native")
-extern "C" fn kind_of_fd_sync_ffi(fd : @fd_util.Fd) -> Int = "moonbitlang_async_kind_of_fd"
+extern "C" fn kind_of_fd_sync_ffi_renamed(fd : @fd_util.Fd) -> Int = "moonbitlang_async_kind_of_fd"
 
 ///|
 #cfg(target="wasm")
@@
   fd : @fd_util.Fd,
   context~ : String,
 ) -> @fd_util.FileKind raise {
-  let kind = kind_of_fd_sync_ffi(fd)
+  let kind = kind_of_fd_sync_ffi_renamed(fd)
   if kind < 0 {
     @os_error.check_errno(context)
   }
*** End Patch

```
