# json find-references original src/lib/json.mbt:3:3

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
$ run_moon_ide moon ide find-references 'original' --loc 'src/lib/json.mbt:3:3'
Found 17 references for symbol 'original':
<WORKDIR>/src/lib/json.mbt:27:5-27:13:
   |   }
   |   let ctx = Context::{
   |     rest: input.to_array()[:],
27 |     original: input.to_array(),
   |     ^^^^^^^^
   |     skip: 0,
   |     arr_acc: [],

<WORKDIR>/src/lib/json.mbt:53:5-53:13:
   |   } (escaped)
   |   let ctx = Context::{ (escaped)
   |     rest: input.to_array()[:], (escaped)
53 |     original: input.to_array(),
   |     ^^^^^^^^ (escaped)
   |     skip: 0, (escaped)
   |     arr_acc: [], (escaped)

<WORKDIR>/src/lib/json.mbt:68:5-68:13:
   |   let input = [..state.rest, ..cont.to_array()] (escaped)
   |   let ctx = Context::{ (escaped)
   |     rest: input[:], (escaped)
68 |     original: input,
   |     ^^^^^^^^ (escaped)
   |     skip: 0, (escaped)
   |     arr_acc: state.arr_acc, (escaped)

<WORKDIR>/src/lib/json.mbt:107:9-107:17:
    |  (escaped)
    | ///| (escaped)
    | fn number_zero(ctx : Context, len : Int32) -> Value raise {
107 |   let { original, skip, .. } = ctx
    |         ^^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     [] => { (escaped)

<WORKDIR>/src/lib/json.mbt:129:9-129:17:
    |  (escaped)
    | ///| (escaped)
    | fn number(ctx : Context, len : Int32) -> Value raise {
129 |   let { original, skip, .. } = ctx
    |         ^^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['0'..<='9', .. rest] => number({ ..ctx, rest, }, len + 1)

<WORKDIR>/src/lib/json.mbt:160:9-160:17:
    |  (escaped)
    | ///| (escaped)
    | fn number_frac_cont(ctx : Context, len : Int32) -> Value raise {
160 |   let { original, skip, .. } = ctx
    |         ^^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['0'..<='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1)

<WORKDIR>/src/lib/json.mbt:213:9-213:17:
    |  (escaped)
    | ///| (escaped)
    | fn number_exp_cont(ctx : Context, len : Int32) -> Value raise {
213 |   let { original, skip, .. } = ctx
    |         ^^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['0'..<='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1)

<WORKDIR>/src/lib/json.mbt:298:32-298:40:
    |     ['\\\\', .. rest] => string_escape({ ..ctx, rest, }, len, builder) (escaped)
    |     [c, .. rest] => (escaped)
    |       if c.to_int() < 0x20 { (escaped)
298 |         raise invalid_byte(ctx.original, skip + len)
    |                                ^^^^^^^^ (escaped)
    |       } else { (escaped)
    |         builder.write_char(c) (escaped)

<WORKDIR>/src/lib/json.mbt:352:39-352:47:
    |     } (escaped)
    |     ['u', ..] => (escaped)
    |       unexpected({ ..ctx, skip: ctx.skip - 1, }, len + 6, 0, Checkpoint::Value)
352 |     [_, ..] => raise invalid_byte(ctx.original, ctx.skip + len + 1)
    |                                       ^^^^^^^^ (escaped)
    |     [] => (escaped)
    |       unexpected({ ..ctx, skip: ctx.skip - 1, }, len + 2, 0, Checkpoint::Value)

<WORKDIR>/src/lib/json.mbt:377:34-377:42:
    |           write_codepoint(ctx, ctx.skip + len, codepoint, builder) (escaped)
    |           string_scan({ ..ctx, rest, }, len + 12, builder) (escaped)
    |         } else { (escaped)
377 |           raise invalid_byte(ctx.original, ctx.skip + len + 8)
    |                                  ^^^^^^^^ (escaped)
    |         } (escaped)
    |       } (escaped)

<WORKDIR>/src/lib/json.mbt:394:35-394:43:
    |           0, (escaped)
    |           Checkpoint::Value, (escaped)
    |         ) (escaped)
394 |       _ => raise invalid_byte(ctx.original, ctx.skip + len + 6)
    |                                   ^^^^^^^^ (escaped)
    |     } (escaped)
    |   } else if code_unit.is_trailing_surrogate() { (escaped)

<WORKDIR>/src/lib/json.mbt:397:28-397:36:
    |       _ => raise invalid_byte(ctx.original, ctx.skip + len + 6) (escaped)
    |     } (escaped)
    |   } else if code_unit.is_trailing_surrogate() { (escaped)
397 |     raise invalid_byte(ctx.original, ctx.skip + len + 2)
    |                            ^^^^^^^^ (escaped)
    |   } else { (escaped)
    |     write_codepoint(ctx, ctx.skip + len + 2, code_unit, builder) (escaped)

<WORKDIR>/src/lib/json.mbt:426:33-426:41:
    |     '0'..<='9' => c.to_int() - '0'.to_int()
    |     'a'..<='f' => c.to_int() - 'a'.to_int() + 10
    |     'A'..<='F' => c.to_int() - 'A'.to_int() + 10
426 |     _ => raise invalid_byte(ctx.original, index)
    |                                 ^^^^^^^^ (escaped)
    |   } (escaped)
    | } (escaped)

<WORKDIR>/src/lib/json.mbt:439:36-439:44:
    | ) -> Unit raise { (escaped)
    |   match codepoint.to_char() { (escaped)
    |     Some(c) => builder.write_char(c) (escaped)
439 |     None => raise invalid_byte(ctx.original, index)
    |                                    ^^^^^^^^ (escaped)
    |   } (escaped)
    | } (escaped)

<WORKDIR>/src/lib/json.mbt:599:15-599:23:
    |  (escaped)
    | ///| (escaped)
    | fn terminate(ctx : Context, value : Json) -> Value raise { (escaped)
599 |   let { rest, original, skip, arr_acc, obj_acc, .. } = ctx
    |               ^^^^^^^^ (escaped)
    |   match rest { (escaped)
    |     // skip whitespace (escaped)

<WORKDIR>/src/lib/json.mbt:618:9-618:17:
    |   len : Int32,
    |   func_data : Checkpoint, (escaped)
    | ) -> Value raise { (escaped)
618 |   let { original, arr_acc, obj_acc, skip, stack, decode, .. } = ctx
    |         ^^^^^^^^ (escaped)
    |   let required_size = skip + pos + len (escaped)
    |   let original_size = original.length() (escaped)

<WORKDIR>/src/lib/json.mbt:632:28-632:36:
    |       checkpoint: func_data, (escaped)
    |     }) (escaped)
    |   } else { (escaped)
632 |     raise invalid_byte(ctx.original, ctx.skip + pos)
    |                            ^^^^^^^^ (escaped)
    |   } (escaped)
    | } (escaped)

```
