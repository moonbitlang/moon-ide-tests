# async rename mkfifo src/fs/named_pipe_test.mbt:18:15

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
$ run_moon_ide moon ide rename 'mkfifo' 'mkfifo_renamed' --loc 'src/fs/named_pipe_test.mbt:18:15'
*** Begin Patch
*** Update File: <WORKDIR>/src/fs/named_pipe_test.mbt
@@
 ///|
 #cfg(not(platform="windows"))
 #borrow(path)
-extern "C" fn mkfifo(path : @os_string.OsString, mode : Int) -> Int = "mkfifo"
+extern "C" fn mkfifo_renamed(path : @os_string.OsString, mode : Int) -> Int = "mkfifo"
 
 ///|
 #cfg(not(platform="windows"))
@@
 async test "cancel named fifo open" {
   @async.with_task_group() <| group => {
     let path = "_build/cancel_open_test"
-    if mkfifo(@os_string.encode(path), 0o644) < 0 {
+    if mkfifo_renamed(@os_string.encode(path), 0o644) < 0 {
       @os_error.check_errno("mkfifo")
     }
     group.add_defer(() => @fs.remove(path))
@@
 async test "named fifo" {
   @async.with_task_group() <| group => {
     let path = "_build/named_pipe_test"
-    if mkfifo(@os_string.encode(path), 0o644) < 0 {
+    if mkfifo_renamed(@os_string.encode(path), 0o644) < 0 {
       @os_error.check_errno("mkfifo")
     }
     group.add_defer(() => @fs.remove(path))
*** End Patch

```
