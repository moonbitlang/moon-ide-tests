# async find-references fd src/internal/event_loop/stdio.mbt:17:35

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
$ run_moon_ide moon ide find-references 'fd' --loc 'src/internal/event_loop/stdio.mbt:17:35'
Found 8 references for symbol 'fd':
<WORKDIR>/src/internal/event_loop/stdio.mbt:17:35-17:37:
   | 
   | ///|
   | #cfg(target="native")
17 | extern "C" fn kind_of_fd_sync_ffi(fd : @fd_util.Fd) -> Int = "moonbitlang_async_kind_of_fd"
   |                                   ^^
   | 
   | ///|

<WORKDIR>/src/internal/event_loop/stdio.mbt:51:28-51:30:
   | ///|
   | fn setup_stdio(id : Int, context~ : String) -> IoHandle raise {
   |   let fd = get_stdio_handle(id)
51 |   if !@fd_util.fd_is_valid(fd) {
   |                            ^^
   |     @os_error.check_errno(context)
   |   }

<WORKDIR>/src/internal/event_loop/stdio.mbt:54:24-54:26:
   |   if !@fd_util.fd_is_valid(fd) {
   |     @os_error.check_errno(context)
   |   }
54 |   if stdio_handles.get(fd) is Some(handle) {
   |                        ^^
   |     // On Windows, when `stdout` and `stderr` are redirected to the same file/pipe,
   |     // `GetStdHande` will return the same handle for them.

<WORKDIR>/src/internal/event_loop/stdio.mbt:60:30-60:32:
   |     // In this case, avoid problem caused by duplicated handle value
   |     return handle
   |   }
60 |   let kind = kind_of_fd_sync(fd, context~)
   |                              ^^
   |   let handle = {
   |     fd,

<WORKDIR>/src/internal/event_loop/stdio.mbt:62:5-62:7:
   |   }
   |   let kind = kind_of_fd_sync(fd, context~)
   |   let handle = {
62 |     fd,
   |     ^^
   |     kind,
   |     // Stdio channels may be shared between many different processes,

<WORKDIR>/src/internal/event_loop/stdio.mbt:84:17-84:19:
   |       -1
   |     },
   |   }
84 |   stdio_handles[fd] = handle
   |                 ^^
   |   register_hook(
   |     init=() => {

<WORKDIR>/src/internal/event_loop/stdio.mbt:88:28-88:30:
   |   register_hook(
   |     init=() => {
   |       guard curr_loop.val is Some(evloop)
88 |       guard evloop.fds.get(fd) is None
   |                            ^^
   |       evloop.fds[fd] = handle
   |     },

<WORKDIR>/src/internal/event_loop/stdio.mbt:89:18-89:20:
   |     init=() => {
   |       guard curr_loop.val is Some(evloop)
   |       guard evloop.fds.get(fd) is None
89 |       evloop.fds[fd] = handle
   |                  ^^
   |     },
   |     exit=() => handle.detach_from_event_loop(),

```
