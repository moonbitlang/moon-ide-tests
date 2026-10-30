# json find-references original src\lib\json.mbt:3:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide find-references 'original' --loc 'src\lib\json.mbt:3:3'
Found 17 references for symbol 'original':
<WORKDIR>/src\lib\json.mbt:27:5-27:13:
   |   }
   |   let ctx = Context::{
   |     rest: input.to_array()[:],
27 |     original: input.to_array(),
   |     ^^^^^^^^
   |     skip: 0,
   |     arr_acc: [],

<WORKDIR>/src\lib\json.mbt:53:5-53:13:
   |   }
   |   let ctx = Context::{
   |     rest: input.to_array()[:],
53 |     original: input.to_array(),
   |     ^^^^^^^^
   |     skip: 0,
   |     arr_acc: [],

<WORKDIR>/src\lib\json.mbt:68:5-68:13:
   |   let input = [..state.rest, ..cont.to_array()]
   |   let ctx = Context::{
   |     rest: input[:],
68 |     original: input,
   |     ^^^^^^^^
   |     skip: 0,
   |     arr_acc: state.arr_acc,

<WORKDIR>/src\lib\json.mbt:107:9-107:17:
    | 
    | ///|
    | fn number_zero(ctx : Context, len : Int32) -> Value raise {
107 |   let { original, skip, .. } = ctx
    |         ^^^^^^^^
    |   match ctx.rest {
    |     [] => {

<WORKDIR>/src\lib\json.mbt:129:9-129:17:
    | 
    | ///|
    | fn number(ctx : Context, len : Int32) -> Value raise {
129 |   let { original, skip, .. } = ctx
    |         ^^^^^^^^
    |   match ctx.rest {
    |     ['0'..<='9', .. rest] => number({ ..ctx, rest, }, len + 1)

<WORKDIR>/src\lib\json.mbt:160:9-160:17:
    | 
    | ///|
    | fn number_frac_cont(ctx : Context, len : Int32) -> Value raise {
160 |   let { original, skip, .. } = ctx
    |         ^^^^^^^^
    |   match ctx.rest {
    |     ['0'..<='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1)

<WORKDIR>/src\lib\json.mbt:213:9-213:17:
    | 
    | ///|
    | fn number_exp_cont(ctx : Context, len : Int32) -> Value raise {
213 |   let { original, skip, .. } = ctx
    |         ^^^^^^^^
    |   match ctx.rest {
    |     ['0'..<='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1)

<WORKDIR>/src\lib\json.mbt:298:32-298:40:
    |     ['\\', .. rest] => string_escape({ ..ctx, rest, }, len, builder)
    |     [c, .. rest] =>
    |       if c.to_int() < 0x20 {
298 |         raise invalid_byte(ctx.original, skip + len)
    |                                ^^^^^^^^
    |       } else {
    |         builder.write_char(c)

<WORKDIR>/src\lib\json.mbt:352:39-352:47:
    |     }
    |     ['u', ..] =>
    |       unexpected({ ..ctx, skip: ctx.skip - 1, }, len + 6, 0, Checkpoint::Value)
352 |     [_, ..] => raise invalid_byte(ctx.original, ctx.skip + len + 1)
    |                                       ^^^^^^^^
    |     [] =>
    |       unexpected({ ..ctx, skip: ctx.skip - 1, }, len + 2, 0, Checkpoint::Value)

<WORKDIR>/src\lib\json.mbt:377:34-377:42:
    |           write_codepoint(ctx, ctx.skip + len, codepoint, builder)
    |           string_scan({ ..ctx, rest, }, len + 12, builder)
    |         } else {
377 |           raise invalid_byte(ctx.original, ctx.skip + len + 8)
    |                                  ^^^^^^^^
    |         }
    |       }

<WORKDIR>/src\lib\json.mbt:394:35-394:43:
    |           0,
    |           Checkpoint::Value,
    |         )
394 |       _ => raise invalid_byte(ctx.original, ctx.skip + len + 6)
    |                                   ^^^^^^^^
    |     }
    |   } else if code_unit.is_trailing_surrogate() {

<WORKDIR>/src\lib\json.mbt:397:28-397:36:
    |       _ => raise invalid_byte(ctx.original, ctx.skip + len + 6)
    |     }
    |   } else if code_unit.is_trailing_surrogate() {
397 |     raise invalid_byte(ctx.original, ctx.skip + len + 2)
    |                            ^^^^^^^^
    |   } else {
    |     write_codepoint(ctx, ctx.skip + len + 2, code_unit, builder)

<WORKDIR>/src\lib\json.mbt:426:33-426:41:
    |     '0'..<='9' => c.to_int() - '0'.to_int()
    |     'a'..<='f' => c.to_int() - 'a'.to_int() + 10
    |     'A'..<='F' => c.to_int() - 'A'.to_int() + 10
426 |     _ => raise invalid_byte(ctx.original, index)
    |                                 ^^^^^^^^
    |   }
    | }

<WORKDIR>/src\lib\json.mbt:439:36-439:44:
    | ) -> Unit raise {
    |   match codepoint.to_char() {
    |     Some(c) => builder.write_char(c)
439 |     None => raise invalid_byte(ctx.original, index)
    |                                    ^^^^^^^^
    |   }
    | }

<WORKDIR>/src\lib\json.mbt:599:15-599:23:
    | 
    | ///|
    | fn terminate(ctx : Context, value : Json) -> Value raise {
599 |   let { rest, original, skip, arr_acc, obj_acc, .. } = ctx
    |               ^^^^^^^^
    |   match rest {
    |     // skip whitespace

<WORKDIR>/src\lib\json.mbt:618:9-618:17:
    |   len : Int32,
    |   func_data : Checkpoint,
    | ) -> Value raise {
618 |   let { original, arr_acc, obj_acc, skip, stack, decode, .. } = ctx
    |         ^^^^^^^^
    |   let required_size = skip + pos + len
    |   let original_size = original.length()

<WORKDIR>/src\lib\json.mbt:632:28-632:36:
    |       checkpoint: func_data,
    |     })
    |   } else {
632 |     raise invalid_byte(ctx.original, ctx.skip + pos)
    |                            ^^^^^^^^
    |   }
    | }

```
