# async find-references fd src/internal/event_loop/stdio.mbt:19:3

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
$ run_moon_ide moon ide find-references 'fd' --loc 'src/internal/event_loop/stdio.mbt:19:3'
Found 4 references for symbol 'fd':
<WORKDIR>/src/internal/event_loop/stdio.mbt:19:3-19:5:
   | #cfg(target="native")
   | #borrow(buf)
   | extern "C" fn fstatx_sync(
19 |   fd : @fd_util.Fd,
   |   ^^
   |   request : UInt,
   |   buf : FixedArray[Byte],

<WORKDIR>/src/internal/event_loop/stdio.mbt:87:5-87:9:
   |   let kind = kind_of_fd_sync(fd, context~)
   |   let handle = {
   |     fd,
87 |     kind,
   |     ^^^^
   |     // Stdio channels may be shared between many different processes,
   |     // and some (argubly misbehaving ones) of them may

<WORKDIR>/src/internal/event_loop/stdio.mbt:96:21-96:25:
   |     // see the code for `read_job_worker`/`write_job_worker` in `thread_pool.c` for more details.
   |     is_async: false,
   |     read: Idle,
96 |     read_offset: if kind is Regular {
   |                     ^^^^
   |       0
   |     } else {

<WORKDIR>/src/internal/event_loop/stdio.mbt:102:22-102:26:
    |       -1
    |     },
    |     write: Idle,
102 |     write_offset: if kind is Regular {
    |                      ^^^^
    |       0
    |     } else {

```
