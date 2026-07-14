# json find-references array_start src/lib/decode.mbt:9:3

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
$ run_moon_ide moon ide find-references 'array_start' --loc 'src/lib/decode.mbt:9:3'
Found 4 references for symbol 'array_start':
<WORKDIR>/src/lib/decode.mbt:9:3-9:14:
  |  (escaped)
  | ///| (escaped)
  | pub trait Decode { (escaped)
9 |   array_start(Self, JsonArray) -> JsonArray (escaped)
  |   ^^^^^^^^^^^ (escaped)
  |   array_push(Self, Json, JsonArray) -> JsonArray (escaped)
  |   array_finish(Self, JsonArray, JsonArray) -> (JsonArray, JsonArray) (escaped)

<WORKDIR>/src/lib/decode.mbt:21:27-21:38:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
21 | impl Decode for Unit with array_start(_self, _old_acc) -> JsonArray { (escaped)
   |                           ^^^^^^^^^^^ (escaped)
   |   [] (escaped)
   | } (escaped)

<WORKDIR>/src/lib/json.mbt:457:20-457:31:
    |       array_start({ ..ctx, rest, }, len + 1) (escaped)
    |     [']', .. rest] => { (escaped)
    |       let (value, new_acc) = ctx.decode.array_finish( (escaped)
457 |         ctx.decode.array_start(arr_acc), (escaped)
    |                    ^^^^^^^^^^^ (escaped)
    |         arr_acc, (escaped)
    |       ) (escaped)

<WORKDIR>/src/lib/json.mbt:467:28-467:39:
    |     } (escaped)
    |     [] => unexpected(ctx, len, 0, Checkpoint::Value) (escaped)
    |     rest => { (escaped)
467 |       let new_acc = decode.array_start(arr_acc) (escaped)
    |                            ^^^^^^^^^^^ (escaped)
    |       ctx.stack.push(Frame::Array(arr_acc)) (escaped)
    |       value({ ..ctx, rest, skip: skip + len, arr_acc: new_acc }) (escaped)

```
