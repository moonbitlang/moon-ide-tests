# async find-references io src/process/redirect.mbt:18:3

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
$ run_moon_ide moon ide find-references 'io' --loc 'src/process/redirect.mbt:18:3'
Found 4 references for symbol 'io':
<WORKDIR>/src/process/redirect.mbt:18:3-18:5:
   | ///|
   | /// A temporary pipe used to read output from a spawned process
   | struct ReadFromProcess {
18 |   io : @event_loop.IoHandle
   |   ^^
   |   read_buf : @io.ReaderBuffer
   | }

<WORKDIR>/src/process/redirect.mbt:44:7-44:9:
   |   let r = @event_loop.IoHandle::from_fd(r, kind=Pipe)
   |   let w = @event_loop.IoHandle::from_fd(w, kind=Pipe, is_async=false)
   |   (
44 |     { io: r, read_buf: @io.ReaderBuffer::new() },
   |       ^^
   |     TempPipeWrite::{ pipe: w, closed: false },
   |   )

<WORKDIR>/src/process/redirect.mbt:68:8-68:10:
   | 
   | ///|
   | pub fn ReadFromProcess::close(self : ReadFromProcess) -> Unit {
68 |   self.io.close()
   |        ^^
   | }
   | 

<WORKDIR>/src/process/redirect.mbt:83:8-83:10:
   |   offset~,
   |   max_len~,
   | ) {
83 |   self.io.read(
   |        ^^
   |     buf,
   |     offset~,

```
