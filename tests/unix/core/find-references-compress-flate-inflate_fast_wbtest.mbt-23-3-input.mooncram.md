# core find-references input compress/flate/inflate_fast_wbtest.mbt:23:3

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/core" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide find-references 'input' --loc 'compress/flate/inflate_fast_wbtest.mbt:23:3'
Found 3 references for symbol 'input':
<WORKDIR>/compress/flate/inflate_fast_wbtest.mbt:37:38-37:43:
   |   let decoded = @buffer.Buffer()
   |   let mut position = 0
   |   for ;; {
37 |     let end = (position + chunk).min(input.length())
   |                                      ^^^^^
   |     let status_result = inflater.step(input[position:end], output) catch {
   |       InflateError(kind, _) => return Err(kind)

<WORKDIR>/compress/flate/inflate_fast_wbtest.mbt:38:39-38:44:
   |   let mut position = 0
   |   for ;; {
   |     let end = (position + chunk).min(input.length())
38 |     let status_result = inflater.step(input[position:end], output) catch {
   |                                       ^^^^^
   |       InflateError(kind, _) => return Err(kind)
   |     }

<WORKDIR>/compress/flate/inflate_fast_wbtest.mbt:42:42-42:47:
   |       InflateError(kind, _) => return Err(kind)
   |     }
   |     let status = status_result.status
42 |     if status is NeedMoreInput && end == input.length() {
   |                                          ^^^^^
   |       return Err(Truncated)
   |     }

```
