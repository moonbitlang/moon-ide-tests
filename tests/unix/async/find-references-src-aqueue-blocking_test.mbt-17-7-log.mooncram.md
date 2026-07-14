# async find-references log src/aqueue/blocking_test.mbt:17:7

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
$ run_moon_ide moon ide find-references 'log' --loc 'src/aqueue/blocking_test.mbt:17:7'
Found 4 references for symbol 'log':
<WORKDIR>/src/aqueue/blocking_test.mbt:17:7-17:10:
   | 
   | ///|
   | async test "blocking unbuffered" {
17 |   let log = []
   |       ^^^
   |   @async.with_task_group() <| group => {
   |     let q = @async.Queue(kind=Blocking(1))

<WORKDIR>/src/aqueue/blocking_test.mbt:23:9-23:12:
   |     group.spawn_bg() <| () => {
   |       for i in 0..<3 {
   |         q.put(i)
23 |         log.push("put(\{i})")
   |         ^^^
   |       }
   |     }

<WORKDIR>/src/aqueue/blocking_test.mbt:29:9-29:12:
   |     group.spawn_bg() <| () => {
   |       for _ in 0..<3 {
   |         let x = q.get()
29 |         log.push("get() => \{x}")
   |         ^^^
   |         @async.sleep(100)
   |       }

<WORKDIR>/src/aqueue/blocking_test.mbt:34:16-34:19:
   |       }
   |     }
   |   }
34 |   json_inspect(log, content=[
   |                ^^^
   |     "put(0)", "get() => 0", "put(1)", "get() => 1", "put(2)", "get() => 2",
   |   ])

```
