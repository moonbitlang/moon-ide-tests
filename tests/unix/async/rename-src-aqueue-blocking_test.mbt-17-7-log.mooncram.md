# async rename log src/aqueue/blocking_test.mbt:17:7

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
$ run_moon_ide moon ide rename 'log' 'log_renamed' --loc 'src/aqueue/blocking_test.mbt:17:7'
*** Begin Patch
*** Update File: <WORKDIR>/src/aqueue/blocking_test.mbt
@@
 
 ///|
 async test "blocking unbuffered" {
-  let log = []
+  let log_renamed = []
   @async.with_task_group() <| group => {
     let q = @async.Queue(kind=Blocking(1))
     group.spawn_bg() <| () => {
       for i in 0..<3 {
         q.put(i)
-        log.push("put(\{i})")
+        log_renamed.push("put(\{i})")
       }
     }
     group.spawn_bg() <| () => {
       for _ in 0..<3 {
         let x = q.get()
-        log.push("get() => \{x}")
+        log_renamed.push("get() => \{x}")
         @async.sleep(100)
       }
     }
   }
-  json_inspect(log, content=[
+  json_inspect(log_renamed, content=[
     "put(0)", "get() => 0", "put(1)", "get() => 1", "put(2)", "get() => 2",
   ])
 }
*** End Patch

```
