# json find-references array_start src/lib/decode.mbt:9:6

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/json" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide find-references 'array_start' --loc 'src/lib/decode.mbt:9:6'
Found 3 references for symbol 'array_start':
<WORKDIR>/src/lib/decode.mbt:21:30-21:41:
   | }
   | 
   | ///|
21 | impl Decode for Unit with fn array_start(_self, _old_acc) -> JsonArray {
   |                              ^^^^^^^^^^^
   |   []
   | }

<WORKDIR>/src/lib/json.mbt:455:20-455:31:
    |       array_start({ ..ctx, rest, }, len + 1)
    |     [']', .. rest] => {
    |       let (value, new_acc) = ctx.decode.array_finish(
455 |         ctx.decode.array_start(arr_acc),
    |                    ^^^^^^^^^^^
    |         arr_acc,
    |       )

<WORKDIR>/src/lib/json.mbt:465:28-465:39:
    |     }
    |     [] => unexpected(ctx, len, 0, Checkpoint::Value)
    |     rest => {
465 |       let new_acc = decode.array_start(arr_acc)
    |                            ^^^^^^^^^^^
    |       ctx.stack.push(Frame::Array(arr_acc))
    |       value({ ..ctx, rest, skip: skip + len, arr_acc: new_acc, })

```
