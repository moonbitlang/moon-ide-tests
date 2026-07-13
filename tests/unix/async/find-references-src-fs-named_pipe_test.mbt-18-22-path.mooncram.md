# async find-references path src/fs/named_pipe_test.mbt:18:22

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
$ run_moon_ide moon ide find-references 'path' --loc 'src/fs/named_pipe_test.mbt:18:22'
Found 1 references for symbol 'path':
<WORKDIR>/src/fs/named_pipe_test.mbt:18:22-18:26:
   | ///|
   | #cfg(not(platform="windows"))
   | #borrow(path)
18 | extern "C" fn mkfifo(path : @os_string.OsString, mode : Int) -> Int = "mkfifo"
   |                      ^^^^
   | 
   | ///|

```
