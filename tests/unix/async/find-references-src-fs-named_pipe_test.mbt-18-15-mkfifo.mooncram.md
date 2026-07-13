# async find-references mkfifo src/fs/named_pipe_test.mbt:18:15

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
$ run_moon_ide moon ide find-references 'mkfifo' --loc 'src/fs/named_pipe_test.mbt:18:15'
Found 3 references for symbol 'mkfifo':
<WORKDIR>/src/fs/named_pipe_test.mbt:18:15-18:21:
   | ///|
   | #cfg(not(platform="windows"))
   | #borrow(path)
18 | extern "C" fn mkfifo(path : @os_string.OsString, mode : Int) -> Int = "mkfifo"
   |               ^^^^^^
   | 
   | ///|

<WORKDIR>/src/fs/named_pipe_test.mbt:25:8-25:14:
   | async test "cancel named fifo open" {
   |   @async.with_task_group() <| group => {
   |     let path = "_build/cancel_open_test"
25 |     if mkfifo(@os_string.encode(path), 0o644) < 0 {
   |        ^^^^^^
   |       @os_error.check_errno("mkfifo")
   |     }

<WORKDIR>/src/fs/named_pipe_test.mbt:62:8-62:14:
   | async test "named fifo" {
   |   @async.with_task_group() <| group => {
   |     let path = "_build/named_pipe_test"
62 |     if mkfifo(@os_string.encode(path), 0o644) < 0 {
   |        ^^^^^^
   |       @os_error.check_errno("mkfifo")
   |     }

```
