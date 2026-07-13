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
Found 18 references for symbol 'original':
<WORKDIR>/src/lib/json.mbt:3:3-3:11:
  | ///| (escaped)
  | priv struct Context { (escaped)
3 |   original : Array[Char] (escaped)
  |   ^^^^^^^^ (escaped)
  |   rest : ArrayView[Char] (escaped)
  |   skip : Int (escaped)

<WORKDIR>/src/lib/json.mbt:27:5-27:13:
   |   } (escaped)
   |   let ctx = Context::{ (escaped)
   |     rest: input.to_array()[:], (escaped)
27 |     original: input.to_array(), (escaped)
   |     ^^^^^^^^ (escaped)
   |     skip: 0, (escaped)
   |     arr_acc: [], (escaped)

<WORKDIR>/src/lib/json.mbt:55:5-55:13:
   |   } (escaped)
   |   let ctx = Context::{ (escaped)
   |     rest: input.to_array()[:], (escaped)
55 |     original: input.to_array(), (escaped)
   |     ^^^^^^^^ (escaped)
   |     skip: 0, (escaped)
   |     arr_acc: [], (escaped)

<WORKDIR>/src/lib/json.mbt:70:5-70:13:
   |   let input = [..state.rest, ..cont.to_array()] (escaped)
   |   let ctx = Context::{ (escaped)
   |     rest: input[:], (escaped)
70 |     original: input, (escaped)
   |     ^^^^^^^^ (escaped)
   |     skip: 0, (escaped)
   |     arr_acc: state.arr_acc, (escaped)

<WORKDIR>/src/lib/json.mbt:109:9-109:17:
    |  (escaped)
    | ///| (escaped)
    | fn number_zero(ctx : Context, len : Int) -> Value raise { (escaped)
109 |   let { original, skip, .. } = ctx (escaped)
    |         ^^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     [] => { (escaped)

<WORKDIR>/src/lib/json.mbt:131:9-131:17:
    |  (escaped)
    | ///| (escaped)
    | fn number(ctx : Context, len : Int) -> Value raise { (escaped)
131 |   let { original, skip, .. } = ctx (escaped)
    |         ^^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['0'..='9', .. rest] => number({ ..ctx, rest, }, len + 1) (escaped)

<WORKDIR>/src/lib/json.mbt:162:9-162:17:
    |  (escaped)
    | ///| (escaped)
    | fn number_frac_cont(ctx : Context, len : Int) -> Value raise { (escaped)
162 |   let { original, skip, .. } = ctx (escaped)
    |         ^^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['0'..='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1) (escaped)

<WORKDIR>/src/lib/json.mbt:215:9-215:17:
    |  (escaped)
    | ///| (escaped)
    | fn number_exp_cont(ctx : Context, len : Int) -> Value raise { (escaped)
215 |   let { original, skip, .. } = ctx (escaped)
    |         ^^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1) (escaped)

<WORKDIR>/src/lib/json.mbt:300:32-300:40:
    |     ['\\\\', .. rest] => string_escape({ ..ctx, rest, }, len, builder) (escaped)
    |     [c, .. rest] => (escaped)
    |       if c.to_int() < 0x20 { (escaped)
300 |         raise invalid_byte(ctx.original, skip + len) (escaped)
    |                                ^^^^^^^^ (escaped)
    |       } else { (escaped)
    |         builder.write_char(c) (escaped)

<WORKDIR>/src/lib/json.mbt:354:39-354:47:
    |     } (escaped)
    |     ['u', ..] => (escaped)
    |       unexpected({ ..ctx, skip: ctx.skip - 1 }, len + 6, 0, Checkpoint::Value) (escaped)
354 |     [_, ..] => raise invalid_byte(ctx.original, ctx.skip + len + 1) (escaped)
    |                                       ^^^^^^^^ (escaped)
    |     [] => (escaped)
    |       unexpected({ ..ctx, skip: ctx.skip - 1 }, len + 2, 0, Checkpoint::Value) (escaped)

<WORKDIR>/src/lib/json.mbt:379:34-379:42:
    |           write_codepoint(ctx, ctx.skip + len, codepoint, builder) (escaped)
    |           string_scan({ ..ctx, rest, }, len + 12, builder) (escaped)
    |         } else { (escaped)
379 |           raise invalid_byte(ctx.original, ctx.skip + len + 8) (escaped)
    |                                  ^^^^^^^^ (escaped)
    |         } (escaped)
    |       } (escaped)

<WORKDIR>/src/lib/json.mbt:396:35-396:43:
    |           0, (escaped)
    |           Checkpoint::Value, (escaped)
    |         ) (escaped)
396 |       _ => raise invalid_byte(ctx.original, ctx.skip + len + 6) (escaped)
    |                                   ^^^^^^^^ (escaped)
    |     } (escaped)
    |   } else if code_unit.is_trailing_surrogate() { (escaped)

<WORKDIR>/src/lib/json.mbt:399:28-399:36:
    |       _ => raise invalid_byte(ctx.original, ctx.skip + len + 6) (escaped)
    |     } (escaped)
    |   } else if code_unit.is_trailing_surrogate() { (escaped)
399 |     raise invalid_byte(ctx.original, ctx.skip + len + 2) (escaped)
    |                            ^^^^^^^^ (escaped)
    |   } else { (escaped)
    |     write_codepoint(ctx, ctx.skip + len + 2, code_unit, builder) (escaped)

<WORKDIR>/src/lib/json.mbt:428:33-428:41:
    |     '0'..='9' => c.to_int() - '0'.to_int() (escaped)
    |     'a'..='f' => c.to_int() - 'a'.to_int() + 10 (escaped)
    |     'A'..='F' => c.to_int() - 'A'.to_int() + 10 (escaped)
428 |     _ => raise invalid_byte(ctx.original, index) (escaped)
    |                                 ^^^^^^^^ (escaped)
    |   } (escaped)
    | } (escaped)

<WORKDIR>/src/lib/json.mbt:441:36-441:44:
    | ) -> Unit raise { (escaped)
    |   match codepoint.to_char() { (escaped)
    |     Some(c) => builder.write_char(c) (escaped)
441 |     None => raise invalid_byte(ctx.original, index) (escaped)
    |                                    ^^^^^^^^ (escaped)
    |   } (escaped)
    | } (escaped)

<WORKDIR>/src/lib/json.mbt:601:15-601:23:
    |  (escaped)
    | ///| (escaped)
    | fn terminate(ctx : Context, value : Json) -> Value raise { (escaped)
601 |   let { rest, original, skip, arr_acc, obj_acc, .. } = ctx (escaped)
    |               ^^^^^^^^ (escaped)
    |   match rest { (escaped)
    |     // skip whitespace (escaped)

<WORKDIR>/src/lib/json.mbt:620:9-620:17:
    |   len : Int, (escaped)
    |   func_data : Checkpoint, (escaped)
    | ) -> Value raise { (escaped)
620 |   let { original, arr_acc, obj_acc, skip, stack, decode, .. } = ctx (escaped)
    |         ^^^^^^^^ (escaped)
    |   let required_size = skip + pos + len (escaped)
    |   let original_size = original.length() (escaped)

<WORKDIR>/src/lib/json.mbt:634:28-634:36:
    |       checkpoint: func_data, (escaped)
    |     }) (escaped)
    |   } else { (escaped)
634 |     raise invalid_byte(ctx.original, ctx.skip + pos) (escaped)
    |                            ^^^^^^^^ (escaped)
    |   } (escaped)
    | } (escaped)

```
