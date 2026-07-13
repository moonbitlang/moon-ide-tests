# async find-references kind_of_fd_sync_ffi src/internal/event_loop/stdio.mbt:17:15

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
$ run_moon_ide moon ide find-references 'kind_of_fd_sync_ffi' --loc 'src/internal/event_loop/stdio.mbt:17:15'
Found 2 references for symbol 'kind_of_fd_sync_ffi':
<WORKDIR>/src/internal/event_loop/stdio.mbt:17:15-17:34:
   | 
   | ///|
   | #cfg(target="native")
17 | extern "C" fn kind_of_fd_sync_ffi(fd : @fd_util.Fd) -> Int = "moonbitlang_async_kind_of_fd"
   |               ^^^^^^^^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/src/internal/event_loop/stdio.mbt:29:14-29:33:
   |   fd : @fd_util.Fd,
   |   context~ : String,
   | ) -> @fd_util.FileKind raise {
29 |   let kind = kind_of_fd_sync_ffi(fd)
   |              ^^^^^^^^^^^^^^^^^^^
   |   if kind < 0 {
   |     @os_error.check_errno(context)

```
