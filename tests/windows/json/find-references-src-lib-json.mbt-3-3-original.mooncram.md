# json find-references original src\lib\json.mbt:3:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide find-references 'original' --loc 'src\lib\json.mbt:3:3'
Found 18 references for symbol 'original':
<WORKDIR>/src\lib\json.mbt:3:3-3:11:
  | ///|
  | priv struct Context {
3 |   original : Array[Char]
  |   ^^^^^^^^
  |   rest : ArrayView[Char]
  |   skip : Int

<WORKDIR>/src\lib\json.mbt:27:5-27:13:
   |   }
   |   let ctx = Context::{
   |     rest: input.to_array()[:],
27 |     original: input.to_array(),
   |     ^^^^^^^^
   |     skip: 0,
   |     arr_acc: [],

<WORKDIR>/src\lib\json.mbt:55:5-55:13:
   |   }
   |   let ctx = Context::{
   |     rest: input.to_array()[:],
55 |     original: input.to_array(),
   |     ^^^^^^^^
   |     skip: 0,
   |     arr_acc: [],

<WORKDIR>/src\lib\json.mbt:70:5-70:13:
   |   let input = [..state.rest, ..cont.to_array()]
   |   let ctx = Context::{
   |     rest: input[:],
70 |     original: input,
   |     ^^^^^^^^
   |     skip: 0,
   |     arr_acc: state.arr_acc,

<WORKDIR>/src\lib\json.mbt:109:9-109:17:
    | 
    | ///|
    | fn number_zero(ctx : Context, len : Int) -> Value raise {
109 |   let { original, skip, .. } = ctx
    |         ^^^^^^^^
    |   match ctx.rest {
    |     [] => {

<WORKDIR>/src\lib\json.mbt:131:9-131:17:
    | 
    | ///|
    | fn number(ctx : Context, len : Int) -> Value raise {
131 |   let { original, skip, .. } = ctx
    |         ^^^^^^^^
    |   match ctx.rest {
    |     ['0'..='9', .. rest] => number({ ..ctx, rest, }, len + 1)

<WORKDIR>/src\lib\json.mbt:162:9-162:17:
    | 
    | ///|
    | fn number_frac_cont(ctx : Context, len : Int) -> Value raise {
162 |   let { original, skip, .. } = ctx
    |         ^^^^^^^^
    |   match ctx.rest {
    |     ['0'..='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1)

<WORKDIR>/src\lib\json.mbt:215:9-215:17:
    | 
    | ///|
    | fn number_exp_cont(ctx : Context, len : Int) -> Value raise {
215 |   let { original, skip, .. } = ctx
    |         ^^^^^^^^
    |   match ctx.rest {
    |     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1)

<WORKDIR>/src\lib\json.mbt:300:32-300:40:
    |     ['\\', .. rest] => string_escape({ ..ctx, rest, }, len, builder)
    |     [c, .. rest] =>
    |       if c.to_int() < 0x20 {
300 |         raise invalid_byte(ctx.original, skip + len)
    |                                ^^^^^^^^
    |       } else {
    |         builder.write_char(c)

<WORKDIR>/src\lib\json.mbt:354:39-354:47:
    |     }
    |     ['u', ..] =>
    |       unexpected({ ..ctx, skip: ctx.skip - 1 }, len + 6, 0, Checkpoint::Value)
354 |     [_, ..] => raise invalid_byte(ctx.original, ctx.skip + len + 1)
    |                                       ^^^^^^^^
    |     [] =>
    |       unexpected({ ..ctx, skip: ctx.skip - 1 }, len + 2, 0, Checkpoint::Value)

<WORKDIR>/src\lib\json.mbt:379:34-379:42:
    |           write_codepoint(ctx, ctx.skip + len, codepoint, builder)
    |           string_scan({ ..ctx, rest, }, len + 12, builder)
    |         } else {
379 |           raise invalid_byte(ctx.original, ctx.skip + len + 8)
    |                                  ^^^^^^^^
    |         }
    |       }

<WORKDIR>/src\lib\json.mbt:396:35-396:43:
    |           0,
    |           Checkpoint::Value,
    |         )
396 |       _ => raise invalid_byte(ctx.original, ctx.skip + len + 6)
    |                                   ^^^^^^^^
    |     }
    |   } else if code_unit.is_trailing_surrogate() {

<WORKDIR>/src\lib\json.mbt:399:28-399:36:
    |       _ => raise invalid_byte(ctx.original, ctx.skip + len + 6)
    |     }
    |   } else if code_unit.is_trailing_surrogate() {
399 |     raise invalid_byte(ctx.original, ctx.skip + len + 2)
    |                            ^^^^^^^^
    |   } else {
    |     write_codepoint(ctx, ctx.skip + len + 2, code_unit, builder)

<WORKDIR>/src\lib\json.mbt:428:33-428:41:
    |     '0'..='9' => c.to_int() - '0'.to_int()
    |     'a'..='f' => c.to_int() - 'a'.to_int() + 10
    |     'A'..='F' => c.to_int() - 'A'.to_int() + 10
428 |     _ => raise invalid_byte(ctx.original, index)
    |                                 ^^^^^^^^
    |   }
    | }

<WORKDIR>/src\lib\json.mbt:441:36-441:44:
    | ) -> Unit raise {
    |   match codepoint.to_char() {
    |     Some(c) => builder.write_char(c)
441 |     None => raise invalid_byte(ctx.original, index)
    |                                    ^^^^^^^^
    |   }
    | }

<WORKDIR>/src\lib\json.mbt:601:15-601:23:
    | 
    | ///|
    | fn terminate(ctx : Context, value : Json) -> Value raise {
601 |   let { rest, original, skip, arr_acc, obj_acc, .. } = ctx
    |               ^^^^^^^^
    |   match rest {
    |     // skip whitespace

<WORKDIR>/src\lib\json.mbt:620:9-620:17:
    |   len : Int,
    |   func_data : Checkpoint,
    | ) -> Value raise {
620 |   let { original, arr_acc, obj_acc, skip, stack, decode, .. } = ctx
    |         ^^^^^^^^
    |   let required_size = skip + pos + len
    |   let original_size = original.length()

<WORKDIR>/src\lib\json.mbt:634:28-634:36:
    |       checkpoint: func_data,
    |     })
    |   } else {
634 |     raise invalid_byte(ctx.original, ctx.skip + pos)
    |                            ^^^^^^^^
    |   }
    | }

```
