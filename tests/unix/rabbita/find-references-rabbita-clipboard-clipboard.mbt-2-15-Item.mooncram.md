# rabbita find-references Item rabbita/clipboard/clipboard.mbt:2:15

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/rabbita" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide find-references 'Item' --loc 'rabbita/clipboard/clipboard.mbt:2:15'
Found 4 references for symbol 'Item':
<WORKDIR>/rabbita/clipboard/clipboard.mbt:13:20-13:24:
   | /// 
   | /// - `copied` is triggered if the copy operation is successful.
   | /// - `failed` is triggered with the error message if the copy operation fails.
13 | pub fn copy(item : Item, copied? : Cmd, failed? : (String) -> Cmd) -> Cmd {
   |                    ^^^^
   |   op.request(ClipboardCopy(item, copied, failed))
   | }

<WORKDIR>/rabbita/clipboard/clipboard.mbt:23:25-23:29:
   | /// # Message
   | /// - `pasted` is triggered with the pasted item if the paste operation is successful.
   | /// - `failed` is triggered with the error message if the paste operation fails.
23 | pub fn paste(pasted~ : (Item) -> Cmd, failed? : (String) -> Cmd) -> Cmd {
   |                         ^^^^
   |   op.request(ClipboardPaste(pasted, failed))
   | }

<WORKDIR>/rabbita/clipboard/op.mbt:3:17-3:21:
  | ///|
  | extenum @cmd.Extension += {
3 |   ClipboardCopy(Item, Cmd?, ((String) -> Cmd)?)
  |                 ^^^^
  |   ClipboardPaste((Item) -> Cmd, ((String) -> Cmd)?)
  | }

<WORKDIR>/rabbita/clipboard/op.mbt:4:19-4:23:
  | ///|
  | extenum @cmd.Extension += {
  |   ClipboardCopy(Item, Cmd?, ((String) -> Cmd)?)
4 |   ClipboardPaste((Item) -> Cmd, ((String) -> Cmd)?)
  |                   ^^^^
  | }
  | 

```
