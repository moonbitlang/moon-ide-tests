# async find-references wait_read src/internal/event_loop/io_unix.mbt:17:24

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
$ run_moon_ide moon ide find-references 'wait_read' --loc 'src/internal/event_loop/io_unix.mbt:17:24'
Found 8 references for symbol 'wait_read':
<WORKDIR>/src/fs/watch_inotify.mbt:224:20-224:29:
    |       if self.waiter is Some(coro) {
    |         coro.wake()
    |       }
224 |       self.inotify.wait_read()
    |                    ^^^^^^^^^
    |       continue
    |     }

<WORKDIR>/src/fs/watch_kqueue.mbt:192:27-192:36:
    |   }
    |   if n is 0 {
    |     match timeout {
192 |       None => self.kqueue.wait_read()
    |                           ^^^^^^^^^
    |       Some(t) => @async.with_timeout(t, () => self.kqueue.wait_read())
    |     }

<WORKDIR>/src/fs/watch_kqueue.mbt:193:59-193:68:
    |   if n is 0 {
    |     match timeout {
    |       None => self.kqueue.wait_read()
193 |       Some(t) => @async.with_timeout(t, () => self.kqueue.wait_read())
    |                                                           ^^^^^^^^^
    |     }
    |   }

<WORKDIR>/src/internal/event_loop/io_unix.mbt:17:24-17:33:
   | 
   | ///|
   | #cfg(not(platform="windows"))
17 | pub async fn IoHandle::wait_read(handle : IoHandle) -> Unit {
   |                        ^^^^^^^^^
   |   guard @fd_util.fd_is_valid(handle.fd) else {
   |     abort("file descriptor already closed")

<WORKDIR>/src/internal/event_loop/io_unix.mbt:82:12-82:21:
   |     return ret
   |   }
   |   let ret = if @os_error.is_nonblocking_io_error() {
82 |     handle.wait_read()
   |            ^^^^^^^^^
   |     read_unix_ffi(handle.fd, buf, offset~, len~)
   |   } else {

<WORKDIR>/src/internal/event_loop/network_unix.mbt:67:12-67:21:
   |     return ret
   |   }
   |   let ret = if @os_error.is_nonblocking_io_error() {
67 |     handle.wait_read()
   |            ^^^^^^^^^
   |     recvfrom_unix_ffi(handle.fd, buf, offset~, len~, addr~)
   |   } else {

<WORKDIR>/src/internal/event_loop/network_unix.mbt:248:12-248:21:
    |     @coroutine.protect_from_cancel(@coroutine.pause, resume_on_cancel=true)
    |     conn
    |   } else if @os_error.is_nonblocking_io_error() {
248 |     handle.wait_read()
    |            ^^^^^^^^^
    |     accept_unix_ffi(handle.fd, addr)
    |   } else {

<WORKDIR>/src/internal/event_loop/process_unix.mbt:58:8-58:17:
   |     if !@os_error.is_nonblocking_io_error() {
   |       @os_error.check_errno(context)
   |     }
58 |     io.wait_read()
   |        ^^^^^^^^^
   |   } else if platform is MacOS {
   |     // MacOS/BSD, use `kqueue` with `EVFILT_PROC`

```
