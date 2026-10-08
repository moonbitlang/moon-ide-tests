# async find-references ReadFromProcess src/process/redirect.mbt:17:8

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
$ run_moon_ide moon ide find-references 'ReadFromProcess' --loc 'src/process/redirect.mbt:17:8'
Found 8 references for symbol 'ReadFromProcess':
<WORKDIR>/src/process/redirect.mbt:50:7-50:22:
   | /// the read end `r` will fail to observe EOF from children process.
   | pub fn read_from_process(
   |   shared? : Bool = false,
50 | ) -> (ReadFromProcess, &ProcessOutput) raise {
   |       ^^^^^^^^^^^^^^^
   |   let context = "@process.read_from_process()"
   |   let (r, w) = @fd_util.pipe(

<WORKDIR>/src/process/redirect.mbt:101:8-101:23:
    | }
    | 
    | ///|
101 | pub fn ReadFromProcess::close(self : ReadFromProcess) -> Unit {
    |        ^^^^^^^^^^^^^^^
    |   self.io.close()
    | }

<WORKDIR>/src/process/redirect.mbt:101:38-101:53:
    | }
    | 
    | ///|
101 | pub fn ReadFromProcess::close(self : ReadFromProcess) -> Unit {
    |                                      ^^^^^^^^^^^^^^^
    |   self.io.close()
    | }

<WORKDIR>/src/process/redirect.mbt:106:25-106:40:
    | }
    | 
    | ///|
106 | pub impl @io.Reader for ReadFromProcess with fn _get_internal_buffer(self) {
    |                         ^^^^^^^^^^^^^^^
    |   self.read_buf
    | }

<WORKDIR>/src/process/redirect.mbt:111:25-111:40:
    | }
    | 
    | ///|
111 | pub impl @io.Reader for ReadFromProcess with fn _direct_read(
    |                         ^^^^^^^^^^^^^^^
    |   self,
    |   buf,

<WORKDIR>/src/process/redirect.mbt:126:12-126:27:
    | }
    | 
    | ///|
126 | pub extend ReadFromProcess with @io.Reader::{
    |            ^^^^^^^^^^^^^^^
    |   read,
    |   drop,

<WORKDIR>/src/shell/execute.mbt:402:21-402:36:
    | 
    | ///|
    | async fn read_bounded(
402 |   reader : @process.ReadFromProcess,
    |                     ^^^^^^^^^^^^^^^
    |   captured : Ref[Int],
    |   limit : Int,

<WORKDIR>/src/shell/execute.mbt:439:21-439:36:
    | /// bound. A CRLF terminator's CR is punctuation, not content, and so does not
    | /// consume the line's allowance.
    | async fn read_lines(
439 |   reader : @process.ReadFromProcess,
    |                     ^^^^^^^^^^^^^^^
    |   on_line : async (String) -> Unit,
    |   limit : Int,

```
