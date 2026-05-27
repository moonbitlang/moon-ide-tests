# json find-references

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$PWD"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
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

```mooncram
$ run_moon_ide moon ide find-references 'rest' --loc 'src/lib/json.mbt:4:3'
Found 86 references for symbol 'rest':
<WORKDIR>/src/lib/json.mbt:4:3-4:7:
  | ///| (escaped)
  | priv struct Context { (escaped)
  |   original : Array[Char] (escaped)
4 |   rest : ArrayView[Char] (escaped)
  |   ^^^^ (escaped)
  |   skip : Int (escaped)
  |   arr_acc : Array[Json] (escaped)

<WORKDIR>/src/lib/json.mbt:26:5-26:9:
   |     None => () (escaped)
   |   } (escaped)
   |   let ctx = Context::{ (escaped)
26 |     rest: input.to_array()[:], (escaped)
   |     ^^^^ (escaped)
   |     original: input.to_array(), (escaped)
   |     skip: 0, (escaped)

<WORKDIR>/src/lib/json.mbt:54:5-54:9:
   |     None => () (escaped)
   |   } (escaped)
   |   let ctx = Context::{ (escaped)
54 |     rest: input.to_array()[:], (escaped)
   |     ^^^^ (escaped)
   |     original: input.to_array(), (escaped)
   |     skip: 0, (escaped)

<WORKDIR>/src/lib/json.mbt:69:5-69:9:
   | pub fn decode_continue(cont : String, state : ContinueValue) -> Value raise { (escaped)
   |   let input = [..state.rest, ..cont.to_array()] (escaped)
   |   let ctx = Context::{ (escaped)
69 |     rest: input[:], (escaped)
   |     ^^^^ (escaped)
   |     original: input, (escaped)
   |     skip: 0, (escaped)

<WORKDIR>/src/lib/json.mbt:88:13-88:17:
   |  (escaped)
   | ///| (escaped)
   | fn value(ctx : Context) -> Value raise { (escaped)
88 |   match ctx.rest { (escaped)
   |             ^^^^ (escaped)
   |     // skip whitespace (escaped)
   |     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)

<WORKDIR>/src/lib/json.mbt:91:22-91:26:
   |   match ctx.rest { (escaped)
   |     // skip whitespace (escaped)
   |     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
91 |       value({ ..ctx, rest, skip: ctx.skip + 1 }) (escaped)
   |                      ^^^^ (escaped)
   |     ['0', .. rest] => number_zero({ ..ctx, rest, }, 1) (escaped)
   |     ['1'..='9', .. rest] => number({ ..ctx, rest, }, 1) (escaped)

<WORKDIR>/src/lib/json.mbt:92:44-92:48:
   |     // skip whitespace (escaped)
   |     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
   |       value({ ..ctx, rest, skip: ctx.skip + 1 }) (escaped)
92 |     ['0', .. rest] => number_zero({ ..ctx, rest, }, 1) (escaped)
   |                                            ^^^^ (escaped)
   |     ['1'..='9', .. rest] => number({ ..ctx, rest, }, 1) (escaped)
   |     ['-', .. rest] => number_minus({ ..ctx, rest, }) (escaped)

<WORKDIR>/src/lib/json.mbt:93:45-93:49:
   |     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
   |       value({ ..ctx, rest, skip: ctx.skip + 1 }) (escaped)
   |     ['0', .. rest] => number_zero({ ..ctx, rest, }, 1) (escaped)
93 |     ['1'..='9', .. rest] => number({ ..ctx, rest, }, 1) (escaped)
   |                                             ^^^^ (escaped)
   |     ['-', .. rest] => number_minus({ ..ctx, rest, }) (escaped)
   |     ['t', .. rest] => true_({ ..ctx, rest, }) (escaped)

<WORKDIR>/src/lib/json.mbt:94:45-94:49:
   |       value({ ..ctx, rest, skip: ctx.skip + 1 }) (escaped)
   |     ['0', .. rest] => number_zero({ ..ctx, rest, }, 1) (escaped)
   |     ['1'..='9', .. rest] => number({ ..ctx, rest, }, 1) (escaped)
94 |     ['-', .. rest] => number_minus({ ..ctx, rest, }) (escaped)
   |                                             ^^^^ (escaped)
   |     ['t', .. rest] => true_({ ..ctx, rest, }) (escaped)
   |     ['f', .. rest] => false_({ ..ctx, rest, }) (escaped)

<WORKDIR>/src/lib/json.mbt:95:38-95:42:
   |     ['0', .. rest] => number_zero({ ..ctx, rest, }, 1) (escaped)
   |     ['1'..='9', .. rest] => number({ ..ctx, rest, }, 1) (escaped)
   |     ['-', .. rest] => number_minus({ ..ctx, rest, }) (escaped)
95 |     ['t', .. rest] => true_({ ..ctx, rest, }) (escaped)
   |                                      ^^^^ (escaped)
   |     ['f', .. rest] => false_({ ..ctx, rest, }) (escaped)
   |     ['n', .. rest] => null({ ..ctx, rest, }) (escaped)

<WORKDIR>/src/lib/json.mbt:96:39-96:43:
   |     ['1'..='9', .. rest] => number({ ..ctx, rest, }, 1) (escaped)
   |     ['-', .. rest] => number_minus({ ..ctx, rest, }) (escaped)
   |     ['t', .. rest] => true_({ ..ctx, rest, }) (escaped)
96 |     ['f', .. rest] => false_({ ..ctx, rest, }) (escaped)
   |                                       ^^^^ (escaped)
   |     ['n', .. rest] => null({ ..ctx, rest, }) (escaped)
   |     ['"', .. rest] => string({ ..ctx, rest, skip: ctx.skip + 1 }, 0) (escaped)

<WORKDIR>/src/lib/json.mbt:97:37-97:41:
   |     ['-', .. rest] => number_minus({ ..ctx, rest, }) (escaped)
   |     ['t', .. rest] => true_({ ..ctx, rest, }) (escaped)
   |     ['f', .. rest] => false_({ ..ctx, rest, }) (escaped)
97 |     ['n', .. rest] => null({ ..ctx, rest, }) (escaped)
   |                                     ^^^^ (escaped)
   |     ['"', .. rest] => string({ ..ctx, rest, skip: ctx.skip + 1 }, 0) (escaped)
   |     ['[', .. rest] => array_start({ ..ctx, rest, }, 1) (escaped)

<WORKDIR>/src/lib/json.mbt:98:39-98:43:
   |     ['t', .. rest] => true_({ ..ctx, rest, }) (escaped)
   |     ['f', .. rest] => false_({ ..ctx, rest, }) (escaped)
   |     ['n', .. rest] => null({ ..ctx, rest, }) (escaped)
98 |     ['"', .. rest] => string({ ..ctx, rest, skip: ctx.skip + 1 }, 0) (escaped)
   |                                       ^^^^ (escaped)
   |     ['[', .. rest] => array_start({ ..ctx, rest, }, 1) (escaped)
   |     ['{', .. rest] => object_start({ ..ctx, rest, }, 1) (escaped)

<WORKDIR>/src/lib/json.mbt:99:44-99:48:
   |     ['f', .. rest] => false_({ ..ctx, rest, }) (escaped)
   |     ['n', .. rest] => null({ ..ctx, rest, }) (escaped)
   |     ['"', .. rest] => string({ ..ctx, rest, skip: ctx.skip + 1 }, 0) (escaped)
99 |     ['[', .. rest] => array_start({ ..ctx, rest, }, 1) (escaped)
   |                                            ^^^^ (escaped)
   |     ['{', .. rest] => object_start({ ..ctx, rest, }, 1) (escaped)
   |     _ => unexpected(ctx, 0, 0, Checkpoint::Value) (escaped)

<WORKDIR>/src/lib/json.mbt:100:45-100:49:
    |     ['n', .. rest] => null({ ..ctx, rest, }) (escaped)
    |     ['"', .. rest] => string({ ..ctx, rest, skip: ctx.skip + 1 }, 0) (escaped)
    |     ['[', .. rest] => array_start({ ..ctx, rest, }, 1) (escaped)
100 |     ['{', .. rest] => object_start({ ..ctx, rest, }, 1) (escaped)
    |                                             ^^^^ (escaped)
    |     _ => unexpected(ctx, 0, 0, Checkpoint::Value) (escaped)
    |   } (escaped)

<WORKDIR>/src/lib/json.mbt:110:13-110:17:
    | ///| (escaped)
    | fn number_zero(ctx : Context, len : Int) -> Value raise { (escaped)
    |   let { original, skip, .. } = ctx (escaped)
110 |   match ctx.rest { (escaped)
    |             ^^^^ (escaped)
    |     [] => { (escaped)
    |       let token = original[skip:skip + len] (escaped)

<WORKDIR>/src/lib/json.mbt:116:44-116:48:
    |       let value = integer_decode(ctx, token) (escaped)
    |       unexpected(ctx, len, 0, Checkpoint::NumberI(value)) (escaped)
    |     } (escaped)
116 |     ['.', .. rest] => number_frac({ ..ctx, rest, }, len + 1) (escaped)
    |                                            ^^^^ (escaped)
    |     ['e' | 'E', .. rest] => number_exp({ ..ctx, rest, }, len + 1) (escaped)
    |     rest => { (escaped)

<WORKDIR>/src/lib/json.mbt:117:49-117:53:
    |       unexpected(ctx, len, 0, Checkpoint::NumberI(value)) (escaped)
    |     } (escaped)
    |     ['.', .. rest] => number_frac({ ..ctx, rest, }, len + 1) (escaped)
117 |     ['e' | 'E', .. rest] => number_exp({ ..ctx, rest, }, len + 1) (escaped)
    |                                                 ^^^^ (escaped)
    |     rest => { (escaped)
    |       let token = original[skip:skip + len] (escaped)

<WORKDIR>/src/lib/json.mbt:122:18-122:22:
    |       let token = original[skip:skip + len] (escaped)
    |       let value = integer_decode(ctx, token) (escaped)
    |       continue_( (escaped)
122 |         { ..ctx, rest, skip: ctx.skip + len }, (escaped)
    |                  ^^^^ (escaped)
    |         Json::number(value.to_double()), (escaped)
    |       ) (escaped)

<WORKDIR>/src/lib/json.mbt:132:13-132:17:
    | ///| (escaped)
    | fn number(ctx : Context, len : Int) -> Value raise { (escaped)
    |   let { original, skip, .. } = ctx (escaped)
132 |   match ctx.rest { (escaped)
    |             ^^^^ (escaped)
    |     ['0'..='9', .. rest] => number({ ..ctx, rest, }, len + 1) (escaped)
    |     ['.', .. rest] => number_frac({ ..ctx, rest, }, len + 1) (escaped)

<WORKDIR>/src/lib/json.mbt:133:45-133:49:
    | fn number(ctx : Context, len : Int) -> Value raise { (escaped)
    |   let { original, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)
133 |     ['0'..='9', .. rest] => number({ ..ctx, rest, }, len + 1) (escaped)
    |                                             ^^^^ (escaped)
    |     ['.', .. rest] => number_frac({ ..ctx, rest, }, len + 1) (escaped)
    |     ['e' | 'E', .. rest] => number_exp({ ..ctx, rest, }, len + 1) (escaped)

<WORKDIR>/src/lib/json.mbt:134:44-134:48:
    |   let { original, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)
    |     ['0'..='9', .. rest] => number({ ..ctx, rest, }, len + 1) (escaped)
134 |     ['.', .. rest] => number_frac({ ..ctx, rest, }, len + 1) (escaped)
    |                                            ^^^^ (escaped)
    |     ['e' | 'E', .. rest] => number_exp({ ..ctx, rest, }, len + 1) (escaped)
    |     [] => { (escaped)

<WORKDIR>/src/lib/json.mbt:135:49-135:53:
    |   match ctx.rest { (escaped)
    |     ['0'..='9', .. rest] => number({ ..ctx, rest, }, len + 1) (escaped)
    |     ['.', .. rest] => number_frac({ ..ctx, rest, }, len + 1) (escaped)
135 |     ['e' | 'E', .. rest] => number_exp({ ..ctx, rest, }, len + 1) (escaped)
    |                                                 ^^^^ (escaped)
    |     [] => { (escaped)
    |       let part = original[skip:skip + len] (escaped)

<WORKDIR>/src/lib/json.mbt:145:18-145:22:
    |       let part = original[skip:skip + len] (escaped)
    |       let value = integer_decode(ctx, part) (escaped)
    |       continue_( (escaped)
145 |         { ..ctx, rest, skip: skip + len }, (escaped)
    |                  ^^^^ (escaped)
    |         Json::number(value.to_double()), (escaped)
    |       ) (escaped)

<WORKDIR>/src/lib/json.mbt:154:13-154:17:
    |  (escaped)
    | ///| (escaped)
    | fn number_frac(ctx : Context, len : Int) -> Value raise { (escaped)
154 |   match ctx.rest { (escaped)
    |             ^^^^ (escaped)
    |     ['0'..='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1) (escaped)
    |     _ => unexpected(ctx, len, 0, Checkpoint::Value) (escaped)

<WORKDIR>/src/lib/json.mbt:155:55-155:59:
    | ///| (escaped)
    | fn number_frac(ctx : Context, len : Int) -> Value raise { (escaped)
    |   match ctx.rest { (escaped)
155 |     ['0'..='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1) (escaped)
    |                                                       ^^^^ (escaped)
    |     _ => unexpected(ctx, len, 0, Checkpoint::Value) (escaped)
    |   } (escaped)

<WORKDIR>/src/lib/json.mbt:163:13-163:17:
    | ///| (escaped)
    | fn number_frac_cont(ctx : Context, len : Int) -> Value raise { (escaped)
    |   let { original, skip, .. } = ctx (escaped)
163 |   match ctx.rest { (escaped)
    |             ^^^^ (escaped)
    |     ['0'..='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1) (escaped)
    |     ['e' | 'E', .. rest] => number_exp({ ..ctx, rest, }, len + 1) (escaped)

<WORKDIR>/src/lib/json.mbt:164:55-164:59:
    | fn number_frac_cont(ctx : Context, len : Int) -> Value raise { (escaped)
    |   let { original, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)
164 |     ['0'..='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1) (escaped)
    |                                                       ^^^^ (escaped)
    |     ['e' | 'E', .. rest] => number_exp({ ..ctx, rest, }, len + 1) (escaped)
    |     _ => { (escaped)

<WORKDIR>/src/lib/json.mbt:165:49-165:53:
    |   let { original, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)
    |     ['0'..='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1) (escaped)
165 |     ['e' | 'E', .. rest] => number_exp({ ..ctx, rest, }, len + 1) (escaped)
    |                                                 ^^^^ (escaped)
    |     _ => { (escaped)
    |       let token = original[skip:skip + len] (escaped)

<WORKDIR>/src/lib/json.mbt:180:13-180:17:
    |   token : ArrayView[Char], (escaped)
    | ) -> Value raise { (escaped)
    |   let { skip, .. } = ctx (escaped)
180 |   match ctx.rest { (escaped)
    |             ^^^^ (escaped)
    |     [] => (escaped)
    |       try ctx.decode.double(token) catch { (escaped)

<WORKDIR>/src/lib/json.mbt:191:37-191:41:
    |       try ctx.decode.double(token) catch { (escaped)
    |         _ => unexpected(ctx, len, 0, Checkpoint::FloatError(token, ctx.skip)) (escaped)
    |       } noraise { (escaped)
191 |         value => continue_({ ..ctx, rest, skip: skip + len }, value.to_json()) (escaped)
    |                                     ^^^^ (escaped)
    |       } (escaped)
    |   } (escaped)

<WORKDIR>/src/lib/json.mbt:198:13-198:17:
    |  (escaped)
    | ///| (escaped)
    | fn number_exp(ctx : Context, len : Int) -> Value raise { (escaped)
198 |   match ctx.rest { (escaped)
    |             ^^^^ (escaped)
    |     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1) (escaped)
    |     ['+' | '-', .. rest] => number_exp_sign({ ..ctx, rest, }, len + 1) (escaped)

<WORKDIR>/src/lib/json.mbt:199:54-199:58:
    | ///| (escaped)
    | fn number_exp(ctx : Context, len : Int) -> Value raise { (escaped)
    |   match ctx.rest { (escaped)
199 |     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1) (escaped)
    |                                                      ^^^^ (escaped)
    |     ['+' | '-', .. rest] => number_exp_sign({ ..ctx, rest, }, len + 1) (escaped)
    |     _ => unexpected(ctx, len, 0, Checkpoint::Value) (escaped)

<WORKDIR>/src/lib/json.mbt:200:54-200:58:
    | fn number_exp(ctx : Context, len : Int) -> Value raise { (escaped)
    |   match ctx.rest { (escaped)
    |     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1) (escaped)
200 |     ['+' | '-', .. rest] => number_exp_sign({ ..ctx, rest, }, len + 1) (escaped)
    |                                                      ^^^^ (escaped)
    |     _ => unexpected(ctx, len, 0, Checkpoint::Value) (escaped)
    |   } (escaped)

<WORKDIR>/src/lib/json.mbt:207:13-207:17:
    |  (escaped)
    | ///| (escaped)
    | fn number_exp_sign(ctx : Context, len : Int) -> Value raise { (escaped)
207 |   match ctx.rest { (escaped)
    |             ^^^^ (escaped)
    |     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1) (escaped)
    |     _ => unexpected(ctx, len, 0, Checkpoint::Value) (escaped)

<WORKDIR>/src/lib/json.mbt:208:54-208:58:
    | ///| (escaped)
    | fn number_exp_sign(ctx : Context, len : Int) -> Value raise { (escaped)
    |   match ctx.rest { (escaped)
208 |     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1) (escaped)
    |                                                      ^^^^ (escaped)
    |     _ => unexpected(ctx, len, 0, Checkpoint::Value) (escaped)
    |   } (escaped)

<WORKDIR>/src/lib/json.mbt:216:13-216:17:
    | ///| (escaped)
    | fn number_exp_cont(ctx : Context, len : Int) -> Value raise { (escaped)
    |   let { original, skip, .. } = ctx (escaped)
216 |   match ctx.rest { (escaped)
    |             ^^^^ (escaped)
    |     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1) (escaped)
    |     _ => { (escaped)

<WORKDIR>/src/lib/json.mbt:217:54-217:58:
    | fn number_exp_cont(ctx : Context, len : Int) -> Value raise { (escaped)
    |   let { original, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)
217 |     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1) (escaped)
    |                                                      ^^^^ (escaped)
    |     _ => { (escaped)
    |       let token = original[skip:skip + len] (escaped)

<WORKDIR>/src/lib/json.mbt:227:13-227:17:
    |  (escaped)
    | ///| (escaped)
    | fn number_minus(ctx : Context) -> Value raise { (escaped)
227 |   match ctx.rest { (escaped)
    |             ^^^^ (escaped)
    |     ['0', .. rest] => number_zero({ ..ctx, rest, }, 2) (escaped)
    |     ['1'..='9', .. rest] => number({ ..ctx, rest, }, 2) (escaped)

<WORKDIR>/src/lib/json.mbt:228:44-228:48:
    | ///| (escaped)
    | fn number_minus(ctx : Context) -> Value raise { (escaped)
    |   match ctx.rest { (escaped)
228 |     ['0', .. rest] => number_zero({ ..ctx, rest, }, 2) (escaped)
    |                                            ^^^^ (escaped)
    |     ['1'..='9', .. rest] => number({ ..ctx, rest, }, 2) (escaped)
    |     _ => unexpected(ctx, 1, 0, Checkpoint::Value) (escaped)

<WORKDIR>/src/lib/json.mbt:229:45-229:49:
    | fn number_minus(ctx : Context) -> Value raise { (escaped)
    |   match ctx.rest { (escaped)
    |     ['0', .. rest] => number_zero({ ..ctx, rest, }, 2) (escaped)
229 |     ['1'..='9', .. rest] => number({ ..ctx, rest, }, 2) (escaped)
    |                                             ^^^^ (escaped)
    |     _ => unexpected(ctx, 1, 0, Checkpoint::Value) (escaped)
    |   } (escaped)

<WORKDIR>/src/lib/json.mbt:249:13-249:17:
    |  (escaped)
    | ///| (escaped)
    | fn true_(ctx : Context) -> Value raise { (escaped)
249 |   match ctx.rest { (escaped)
    |             ^^^^ (escaped)
    |     ['r', 'u', 'e', .. rest] => (escaped)
    |       continue_({ ..ctx, rest, skip: ctx.skip + 4 }, Json::boolean(true)) (escaped)

<WORKDIR>/src/lib/json.mbt:251:26-251:30:
    | fn true_(ctx : Context) -> Value raise { (escaped)
    |   match ctx.rest { (escaped)
    |     ['r', 'u', 'e', .. rest] => (escaped)
251 |       continue_({ ..ctx, rest, skip: ctx.skip + 4 }, Json::boolean(true)) (escaped)
    |                          ^^^^ (escaped)
    |     _ => unexpected(ctx, 1, 3, Checkpoint::Value) (escaped)
    |   } (escaped)

<WORKDIR>/src/lib/json.mbt:258:13-258:17:
    |  (escaped)
    | ///| (escaped)
    | fn false_(ctx : Context) -> Value raise { (escaped)
258 |   match ctx.rest { (escaped)
    |             ^^^^ (escaped)
    |     ['a', 'l', 's', 'e', .. rest] => (escaped)
    |       continue_({ ..ctx, rest, skip: ctx.skip + 5 }, Json::boolean(false)) (escaped)

<WORKDIR>/src/lib/json.mbt:260:26-260:30:
    | fn false_(ctx : Context) -> Value raise { (escaped)
    |   match ctx.rest { (escaped)
    |     ['a', 'l', 's', 'e', .. rest] => (escaped)
260 |       continue_({ ..ctx, rest, skip: ctx.skip + 5 }, Json::boolean(false)) (escaped)
    |                          ^^^^ (escaped)
    |     _ => unexpected(ctx, 1, 4, Checkpoint::Value) (escaped)
    |   } (escaped)

<WORKDIR>/src/lib/json.mbt:267:13-267:17:
    |  (escaped)
    | ///| (escaped)
    | fn null(ctx : Context) -> Value raise { (escaped)
267 |   match ctx.rest { (escaped)
    |             ^^^^ (escaped)
    |     ['u', 'l', 'l', .. rest] => (escaped)
    |       continue_({ ..ctx, rest, skip: ctx.skip + 4 }, Json::null()) (escaped)

<WORKDIR>/src/lib/json.mbt:269:26-269:30:
    | fn null(ctx : Context) -> Value raise { (escaped)
    |   match ctx.rest { (escaped)
    |     ['u', 'l', 'l', .. rest] => (escaped)
269 |       continue_({ ..ctx, rest, skip: ctx.skip + 4 }, Json::null()) (escaped)
    |                          ^^^^ (escaped)
    |     _ => unexpected(ctx, 1, 3, Checkpoint::Value) (escaped)
    |   } (escaped)

<WORKDIR>/src/lib/json.mbt:291:13-291:17:
    |   builder : StringBuilder, (escaped)
    | ) -> Value raise { (escaped)
    |   let { skip, .. } = ctx (escaped)
291 |   match ctx.rest { (escaped)
    |             ^^^^ (escaped)
    |     ['"', .. rest] => { (escaped)
    |       let skip = skip + len + 1 (escaped)

<WORKDIR>/src/lib/json.mbt:295:26-295:30:
    |     ['"', .. rest] => { (escaped)
    |       let skip = skip + len + 1 (escaped)
    |       let s = ctx.decode.string(builder.to_string()) (escaped)
295 |       continue_({ ..ctx, rest, skip }, Json::string(s)) (escaped)
    |                          ^^^^ (escaped)
    |     } (escaped)
    |     ['\\\\', .. rest] => string_escape({ ..ctx, rest, }, len, builder) (escaped)

<WORKDIR>/src/lib/json.mbt:297:47-297:51:
    |       let s = ctx.decode.string(builder.to_string()) (escaped)
    |       continue_({ ..ctx, rest, skip }, Json::string(s)) (escaped)
    |     } (escaped)
297 |     ['\\\\', .. rest] => string_escape({ ..ctx, rest, }, len, builder) (escaped)
    |                                               ^^^^ (escaped)
    |     [c, .. rest] => (escaped)
    |       if c.to_int() < 0x20 { (escaped)

<WORKDIR>/src/lib/json.mbt:303:30-303:34:
    |         raise invalid_byte(ctx.original, skip + len) (escaped)
    |       } else { (escaped)
    |         builder.write_char(c) (escaped)
303 |         string_scan({ ..ctx, rest, }, len + 1, builder) (escaped)
    |                              ^^^^ (escaped)
    |       } (escaped)
    |     _ => unexpected({ ..ctx, skip: skip - 1 }, len + 1, 0, Checkpoint::Value) (escaped)

<WORKDIR>/src/lib/json.mbt:315:13-315:17:
    |   len : Int, (escaped)
    |   builder : StringBuilder, (escaped)
    | ) -> Value raise { (escaped)
315 |   match ctx.rest { (escaped)
    |             ^^^^ (escaped)
    |     ['"', .. rest] => { (escaped)
    |       builder.write_char('"') (escaped)

<WORKDIR>/src/lib/json.mbt:318:28-318:32:
    |   match ctx.rest { (escaped)
    |     ['"', .. rest] => { (escaped)
    |       builder.write_char('"') (escaped)
318 |       string_scan({ ..ctx, rest, }, len + 2, builder) (escaped)
    |                            ^^^^ (escaped)
    |     } (escaped)
    |     ['\\\\', .. rest] => { (escaped)

<WORKDIR>/src/lib/json.mbt:322:28-322:32:
    |     } (escaped)
    |     ['\\\\', .. rest] => { (escaped)
    |       builder.write_char('\\\\') (escaped)
322 |       string_scan({ ..ctx, rest, }, len + 2, builder) (escaped)
    |                            ^^^^ (escaped)
    |     } (escaped)
    |     ['/', .. rest] => { (escaped)

<WORKDIR>/src/lib/json.mbt:326:28-326:32:
    |     } (escaped)
    |     ['/', .. rest] => { (escaped)
    |       builder.write_char('/') (escaped)
326 |       string_scan({ ..ctx, rest, }, len + 2, builder) (escaped)
    |                            ^^^^ (escaped)
    |     } (escaped)
    |     ['b', .. rest] => { (escaped)

<WORKDIR>/src/lib/json.mbt:330:28-330:32:
    |     } (escaped)
    |     ['b', .. rest] => { (escaped)
    |       builder.write_char('\\u{08}') (escaped)
330 |       string_scan({ ..ctx, rest, }, len + 2, builder) (escaped)
    |                            ^^^^ (escaped)
    |     } (escaped)
    |     ['f', .. rest] => { (escaped)

<WORKDIR>/src/lib/json.mbt:334:28-334:32:
    |     } (escaped)
    |     ['f', .. rest] => { (escaped)
    |       builder.write_char('\\u{0c}') (escaped)
334 |       string_scan({ ..ctx, rest, }, len + 2, builder) (escaped)
    |                            ^^^^ (escaped)
    |     } (escaped)
    |     ['n', .. rest] => { (escaped)

<WORKDIR>/src/lib/json.mbt:338:28-338:32:
    |     } (escaped)
    |     ['n', .. rest] => { (escaped)
    |       builder.write_char('\\n') (escaped)
338 |       string_scan({ ..ctx, rest, }, len + 2, builder) (escaped)
    |                            ^^^^ (escaped)
    |     } (escaped)
    |     ['r', .. rest] => { (escaped)

<WORKDIR>/src/lib/json.mbt:342:28-342:32:
    |     } (escaped)
    |     ['r', .. rest] => { (escaped)
    |       builder.write_char('\\r') (escaped)
342 |       string_scan({ ..ctx, rest, }, len + 2, builder) (escaped)
    |                            ^^^^ (escaped)
    |     } (escaped)
    |     ['t', .. rest] => { (escaped)

<WORKDIR>/src/lib/json.mbt:346:28-346:32:
    |     } (escaped)
    |     ['t', .. rest] => { (escaped)
    |       builder.write_char('\\t') (escaped)
346 |       string_scan({ ..ctx, rest, }, len + 2, builder) (escaped)
    |                            ^^^^ (escaped)
    |     } (escaped)
    |     ['u', a, b, c, d, .. rest] => { (escaped)

<WORKDIR>/src/lib/json.mbt:377:32-377:36:
    |             (code_unit - 0xD800) * 0x400 + (escaped)
    |             (low - 0xDC00) (escaped)
    |           write_codepoint(ctx, ctx.skip + len, codepoint, builder) (escaped)
377 |           string_scan({ ..ctx, rest, }, len + 12, builder) (escaped)
    |                                ^^^^ (escaped)
    |         } else { (escaped)
    |           raise invalid_byte(ctx.original, ctx.skip + len + 8) (escaped)

<WORKDIR>/src/lib/json.mbt:402:26-402:30:
    |     raise invalid_byte(ctx.original, ctx.skip + len + 2) (escaped)
    |   } else { (escaped)
    |     write_codepoint(ctx, ctx.skip + len + 2, code_unit, builder) (escaped)
402 |     string_scan({ ..ctx, rest, }, len + 6, builder) (escaped)
    |                          ^^^^ (escaped)
    |   } (escaped)
    | } (escaped)

<WORKDIR>/src/lib/json.mbt:452:13-452:17:
    | ///| (escaped)
    | fn array_start(ctx : Context, len : Int) -> Value raise { (escaped)
    |   let { decode, skip, arr_acc, .. } = ctx (escaped)
452 |   match ctx.rest { (escaped)
    |             ^^^^ (escaped)
    |     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
    |       array_start({ ..ctx, rest, }, len + 1) (escaped)

<WORKDIR>/src/lib/json.mbt:454:28-454:32:
    |   let { decode, skip, arr_acc, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)
    |     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
454 |       array_start({ ..ctx, rest, }, len + 1) (escaped)
    |                            ^^^^ (escaped)
    |     [']', .. rest] => { (escaped)
    |       let (value, new_acc) = ctx.decode.array_finish( (escaped)

<WORKDIR>/src/lib/json.mbt:461:18-461:22:
    |         arr_acc, (escaped)
    |       ) (escaped)
    |       continue_( (escaped)
461 |         { ..ctx, rest, skip: skip + len + 1, arr_acc: new_acc }, (escaped)
    |                  ^^^^ (escaped)
    |         Json::array(value), (escaped)
    |       ) (escaped)

<WORKDIR>/src/lib/json.mbt:469:22-469:26:
    |     rest => { (escaped)
    |       let new_acc = decode.array_start(arr_acc) (escaped)
    |       ctx.stack.push(Frame::Array(arr_acc)) (escaped)
469 |       value({ ..ctx, rest, skip: skip + len, arr_acc: new_acc }) (escaped)
    |                      ^^^^ (escaped)
    |     } (escaped)
    |   } (escaped)

<WORKDIR>/src/lib/json.mbt:477:13-477:17:
    | ///| (escaped)
    | fn array_push(ctx : Context, value0 : Json) -> Value raise { (escaped)
    |   let { skip, .. } = ctx (escaped)
477 |   match ctx.rest { (escaped)
    |             ^^^^ (escaped)
    |     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
    |       array_push({ ..ctx, rest, skip: skip + 1 }, value0) (escaped)

<WORKDIR>/src/lib/json.mbt:479:27-479:31:
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)
    |     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
479 |       array_push({ ..ctx, rest, skip: skip + 1 }, value0) (escaped)
    |                           ^^^^ (escaped)
    |     [']', .. rest] => { (escaped)
    |       let acc = ctx.decode.array_push(value0, ctx.arr_acc) (escaped)

<WORKDIR>/src/lib/json.mbt:485:18-485:22:
    |       guard ctx.stack.pop() is Some(Frame::Array(old_acc)) (escaped)
    |       let (array_value, new_acc) = ctx.decode.array_finish(acc, old_acc) (escaped)
    |       continue_( (escaped)
485 |         { ..ctx, rest, skip: skip + 1, arr_acc: new_acc }, (escaped)
    |                  ^^^^ (escaped)
    |         Json::array(array_value), (escaped)
    |       ) (escaped)

<WORKDIR>/src/lib/json.mbt:491:22-491:26:
    |     } (escaped)
    |     [',', .. rest] => { (escaped)
    |       let arr_acc = ctx.decode.array_push(value0, ctx.arr_acc) (escaped)
491 |       value({ ..ctx, rest, skip: skip + 1, arr_acc }) (escaped)
    |                      ^^^^ (escaped)
    |     } (escaped)
    |     _ => unexpected(ctx, 0, 0, Checkpoint::ArrayPush(value0)) (escaped)

<WORKDIR>/src/lib/json.mbt:504:13-504:17:
    | ///| (escaped)
    | fn object_start(ctx : Context, len : Int) -> Value raise { (escaped)
    |   let { obj_acc, skip, .. } = ctx (escaped)
504 |   match ctx.rest { (escaped)
    |             ^^^^ (escaped)
    |     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
    |       object_start({ ..ctx, rest, }, len + 1) (escaped)

<WORKDIR>/src/lib/json.mbt:506:29-506:33:
    |   let { obj_acc, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)
    |     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
506 |       object_start({ ..ctx, rest, }, len + 1) (escaped)
    |                             ^^^^ (escaped)
    |     ['}', .. rest] => { (escaped)
    |       let (value, new_acc) = ctx.decode.object_finish( (escaped)

<WORKDIR>/src/lib/json.mbt:513:18-513:22:
    |         obj_acc, (escaped)
    |       ) (escaped)
    |       continue_( (escaped)
513 |         { ..ctx, rest, skip: skip + len + 1, obj_acc: new_acc }, (escaped)
    |                  ^^^^ (escaped)
    |         Json::object(value), (escaped)
    |       ) (escaped)

<WORKDIR>/src/lib/json.mbt:522:11-522:15:
    |       string( (escaped)
    |         { (escaped)
    |           ..ctx, (escaped)
522 |           rest, (escaped)
    |           ^^^^ (escaped)
    |           skip: skip + len + 1, (escaped)
    |           obj_acc: ctx.decode.object_start(obj_acc), (escaped)

<WORKDIR>/src/lib/json.mbt:536:13-536:17:
    | ///| (escaped)
    | fn object_value(ctx : Context, key : String) -> Value raise { (escaped)
    |   let { skip, .. } = ctx (escaped)
536 |   match ctx.rest { (escaped)
    |             ^^^^ (escaped)
    |     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
    |       object_value({ ..ctx, rest, skip: skip + 1 }, key) (escaped)

<WORKDIR>/src/lib/json.mbt:538:29-538:33:
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)
    |     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
538 |       object_value({ ..ctx, rest, skip: skip + 1 }, key) (escaped)
    |                             ^^^^ (escaped)
    |     [':', .. rest] => { (escaped)
    |       ctx.stack.push(Frame::Key(key)) (escaped)

<WORKDIR>/src/lib/json.mbt:541:22-541:26:
    |       object_value({ ..ctx, rest, skip: skip + 1 }, key) (escaped)
    |     [':', .. rest] => { (escaped)
    |       ctx.stack.push(Frame::Key(key)) (escaped)
541 |       value({ ..ctx, rest, skip: skip + 1 }) (escaped)
    |                      ^^^^ (escaped)
    |     } (escaped)
    |     _ => unexpected(ctx, 0, 0, Checkpoint::ObjectValue(key)) (escaped)

<WORKDIR>/src/lib/json.mbt:550:13-550:17:
    | ///| (escaped)
    | fn object_push(ctx : Context, value0 : Json, key : String) -> Value raise { (escaped)
    |   let { skip, .. } = ctx (escaped)
550 |   match ctx.rest { (escaped)
    |             ^^^^ (escaped)
    |     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
    |       object_push({ ..ctx, rest, skip: skip + 1 }, value0, key) (escaped)

<WORKDIR>/src/lib/json.mbt:552:28-552:32:
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)
    |     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
552 |       object_push({ ..ctx, rest, skip: skip + 1 }, value0, key) (escaped)
    |                            ^^^^ (escaped)
    |     ['}', .. rest] => { (escaped)
    |       let acc = ctx.decode.object_push(key, value0, ctx.obj_acc) (escaped)

<WORKDIR>/src/lib/json.mbt:558:18-558:22:
    |       guard ctx.stack.pop() is Some(Frame::Map(old_acc)) (escaped)
    |       let (object_value, new_acc) = ctx.decode.object_finish(acc, old_acc) (escaped)
    |       continue_( (escaped)
558 |         { ..ctx, rest, skip: skip + 1, obj_acc: new_acc }, (escaped)
    |                  ^^^^ (escaped)
    |         Json::object(object_value), (escaped)
    |       ) (escaped)

<WORKDIR>/src/lib/json.mbt:564:27-564:31:
    |     } (escaped)
    |     [',', .. rest] => { (escaped)
    |       let obj_acc = ctx.decode.object_push(key, value0, ctx.obj_acc) (escaped)
564 |       object_key({ ..ctx, rest, skip: skip + 1, obj_acc }) (escaped)
    |                           ^^^^ (escaped)
    |     } (escaped)
    |     _ => unexpected(ctx, 0, 0, Checkpoint::ObjectPush((value0, key))) (escaped)

<WORKDIR>/src/lib/json.mbt:573:13-573:17:
    | ///| (escaped)
    | fn object_key(ctx : Context) -> Value raise { (escaped)
    |   let { skip, .. } = ctx (escaped)
573 |   match ctx.rest { (escaped)
    |             ^^^^ (escaped)
    |     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
    |       object_key({ ..ctx, rest, skip: skip + 1 }) (escaped)

<WORKDIR>/src/lib/json.mbt:575:27-575:31:
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)
    |     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
575 |       object_key({ ..ctx, rest, skip: skip + 1 }) (escaped)
    |                           ^^^^ (escaped)
    |     ['"', .. rest] => string({ ..ctx, rest, skip: skip + 1 }, 0) (escaped)
    |     _ => unexpected(ctx, 0, 0, Checkpoint::ObjectKey) (escaped)

<WORKDIR>/src/lib/json.mbt:576:39-576:43:
    |   match ctx.rest { (escaped)
    |     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
    |       object_key({ ..ctx, rest, skip: skip + 1 }) (escaped)
576 |     ['"', .. rest] => string({ ..ctx, rest, skip: skip + 1 }, 0) (escaped)
    |                                       ^^^^ (escaped)
    |     _ => unexpected(ctx, 0, 0, Checkpoint::ObjectKey) (escaped)
    |   } (escaped)

<WORKDIR>/src/lib/json.mbt:601:9-601:13:
    |  (escaped)
    | ///| (escaped)
    | fn terminate(ctx : Context, value : Json) -> Value raise { (escaped)
601 |   let { rest, original, skip, arr_acc, obj_acc, .. } = ctx (escaped)
    |         ^^^^ (escaped)
    |   match rest { (escaped)
    |     // skip whitespace (escaped)

<WORKDIR>/src/lib/json.mbt:604:64-604:68:
    |   let { rest, original, skip, arr_acc, obj_acc, .. } = ctx (escaped)
    |   match rest { (escaped)
    |     // skip whitespace (escaped)
604 |     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => terminate({ ..ctx, rest, }, value) (escaped)
    |                                                                ^^^^ (escaped)
    |     [] => Value::Finish({ value, arr_acc, obj_acc, rest: [][:] }) (escaped)
    |     _ => { (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'ParseError' --loc 'src/lib/error.mbt:3:3'
Found 8 references for symbol 'ParseError':
<WORKDIR>/src/lib/error.mbt:3:3-3:13:
  | ///| (escaped)
  | pub suberror ParseError { (escaped)
3 |   ParseError(Reason) (escaped)
  |   ^^^^^^^^^^ (escaped)
  | } derive(Debug) (escaped)
  |  (escaped)

<WORKDIR>/src/lib/json.mbt:42:13-42:23:
   |     Continue({ stack: [], checkpoint: Checkpoint::NumberD(n), .. }) => (escaped)
   |       n.to_json() (escaped)
   |     Continue({ checkpoint: Checkpoint::FloatError(token, skip), .. }) => (escaped)
42 |       raise ParseError(UnexpectedSequence(token.to_owned(), skip)) (escaped)
   |             ^^^^^^^^^^ (escaped)
   |     Continue({ checkpoint: cp, .. }) => raise ParseError(UnexpectedEnd(cp)) (escaped)
   |   } (escaped)

<WORKDIR>/src/lib/json.mbt:43:47-43:57:
   |       n.to_json() (escaped)
   |     Continue({ checkpoint: Checkpoint::FloatError(token, skip), .. }) => (escaped)
   |       raise ParseError(UnexpectedSequence(token.to_owned(), skip)) (escaped)
43 |     Continue({ checkpoint: cp, .. }) => raise ParseError(UnexpectedEnd(cp)) (escaped)
   |                                               ^^^^^^^^^^ (escaped)
   |   } (escaped)
   | } (escaped)

<WORKDIR>/src/lib/json.mbt:237:16-237:26:
    | ///| (escaped)
    | fn integer_decode(ctx : Context, token : ArrayView[Char]) -> Int raise { (escaped)
    |   try ctx.decode.integer(token) catch { (escaped)
237 |     _ => raise ParseError(UnexpectedSequence(token.to_owned(), ctx.skip)) (escaped)
    |                ^^^^^^^^^^ (escaped)
    |   } noraise { (escaped)
    |     value => value (escaped)

<WORKDIR>/src/lib/json.mbt:641:3-641:13:
    | ///| (escaped)
    | fn invalid_byte(arr : Array[Char], skip : Int) -> ParseError { (escaped)
    |   let byte = arr[skip] (escaped)
641 |   ParseError(InvalidByte(skip, byte)) (escaped)
    |   ^^^^^^^^^^ (escaped)
    | } (escaped)

<WORKDIR>/src/tests/incr.mbt:51:10-51:20:
   |   chunks : ArrayView[String], (escaped)
   | ) -> Unit raise { (escaped)
   |   try decode_chunks(chunks) catch { (escaped)
51 |     @lib.ParseError(_) => () (escaped)
   |          ^^^^^^^^^^ (escaped)
   |     _ => (escaped)
   |       incr_fail( (escaped)

<WORKDIR>/src/tests/json_testsuite_helpers_test.mbt:18:10-18:20:
   | ///| (escaped)
   | fn expect_reject(name : String, input : String) -> Unit raise { (escaped)
   |   try @json.decode(input) catch { (escaped)
18 |     @lib.ParseError(_) => () (escaped)
   |          ^^^^^^^^^^ (escaped)
   |     _ => (escaped)
   |       json_testsuite_fail( (escaped)

<WORKDIR>/src/tests/json_testsuite_helpers_test.mbt:34:10-34:20:
   | ///| (escaped)
   | fn expect_accept_or_reject(name : String, input : String) -> Unit raise { (escaped)
   |   try @json.decode(input) catch { (escaped)
34 |     @lib.ParseError(_) => () (escaped)
   |          ^^^^^^^^^^ (escaped)
   |     _ => (escaped)
   |       json_testsuite_fail( (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'Reason' --loc 'src/lib/error.mbt:3:14'
Found 3 references for symbol 'Reason':
<WORKDIR>/src/lib/error.mbt:3:14-3:20:
  | ///| (escaped)
  | pub suberror ParseError { (escaped)
3 |   ParseError(Reason) (escaped)
  |              ^^^^^^ (escaped)
  | } derive(Debug) (escaped)
  |  (escaped)

<WORKDIR>/src/lib/error.mbt:7:10-7:16:
  | } derive(Debug) (escaped)
  |  (escaped)
  | ///| (escaped)
7 | pub enum Reason { (escaped)
  |          ^^^^^^ (escaped)
  |   InvalidByte(Int, Char) (escaped)
  |   UnexpectedEnd(Checkpoint) (escaped)

<WORKDIR>/src/top.mbt:11:8-11:14:
   |   type ContinueValue, (escaped)
   |   type FinishValue, (escaped)
   |   type ParseError, (escaped)
11 |   type Reason, (escaped)
   |        ^^^^^^ (escaped)
   | } (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'Continue' --loc 'src/lib/value.mbt:3:3'
Found 10 references for symbol 'Continue':
<WORKDIR>/src/lib/json.mbt:37:5-37:13:
   |   match value(ctx) { (escaped)
   |     Finish({ value, rest: [], .. }) => value (escaped)
   |     Finish({ rest, .. }) => raise invalid_byte([..rest], 0) (escaped)
37 |     Continue({ stack: [], checkpoint: Checkpoint::NumberI(n), .. }) => (escaped)
   |     ^^^^^^^^ (escaped)
   |       n.to_json() (escaped)
   |     Continue({ stack: [], checkpoint: Checkpoint::NumberD(n), .. }) => (escaped)

<WORKDIR>/src/lib/json.mbt:39:5-39:13:
   |     Finish({ rest, .. }) => raise invalid_byte([..rest], 0) (escaped)
   |     Continue({ stack: [], checkpoint: Checkpoint::NumberI(n), .. }) => (escaped)
   |       n.to_json() (escaped)
39 |     Continue({ stack: [], checkpoint: Checkpoint::NumberD(n), .. }) => (escaped)
   |     ^^^^^^^^ (escaped)
   |       n.to_json() (escaped)
   |     Continue({ checkpoint: Checkpoint::FloatError(token, skip), .. }) => (escaped)

<WORKDIR>/src/lib/json.mbt:41:5-41:13:
   |       n.to_json() (escaped)
   |     Continue({ stack: [], checkpoint: Checkpoint::NumberD(n), .. }) => (escaped)
   |       n.to_json() (escaped)
41 |     Continue({ checkpoint: Checkpoint::FloatError(token, skip), .. }) => (escaped)
   |     ^^^^^^^^ (escaped)
   |       raise ParseError(UnexpectedSequence(token.to_owned(), skip)) (escaped)
   |     Continue({ checkpoint: cp, .. }) => raise ParseError(UnexpectedEnd(cp)) (escaped)

<WORKDIR>/src/lib/json.mbt:43:5-43:13:
   |       n.to_json() (escaped)
   |     Continue({ checkpoint: Checkpoint::FloatError(token, skip), .. }) => (escaped)
   |       raise ParseError(UnexpectedSequence(token.to_owned(), skip)) (escaped)
43 |     Continue({ checkpoint: cp, .. }) => raise ParseError(UnexpectedEnd(cp)) (escaped)
   |     ^^^^^^^^ (escaped)
   |   } (escaped)
   | } (escaped)

<WORKDIR>/src/lib/json.mbt:625:12-625:20:
    |   let original_size = original.length() (escaped)
    |   if original_size <= required_size { (escaped)
    |     let rest = original[skip:] (escaped)
625 |     Value::Continue(ContinueValue::{ (escaped)
    |            ^^^^^^^^ (escaped)
    |       rest, (escaped)
    |       arr_acc, (escaped)

<WORKDIR>/src/lib/value.mbt:3:3-3:11:
  | ///| (escaped)
  | pub enum Value { (escaped)
3 |   Continue(ContinueValue) (escaped)
  |   ^^^^^^^^ (escaped)
  |   Finish(FinishValue) (escaped)
  | } (escaped)

<WORKDIR>/src/tests/incr.mbt:10:24-10:32:
   | fn continue_chunks(chunks : ArrayView[String], value : Value) -> Value raise { (escaped)
   |   match (chunks, value) { (escaped)
   |     ([], value) => value (escaped)
10 |     ([chunk, .. rest], Continue(state)) => (escaped)
   |                        ^^^^^^^^ (escaped)
   |       continue_chunks(rest, decode_continue(chunk, state)) (escaped)
   |     ([_, ..], Finish(_)) => (escaped)

<WORKDIR>/src/tests/incr.mbt:41:5-41:13:
   |         ", got " + (escaped)
   |         String::from_array([..rest]), (escaped)
   |       ) (escaped)
41 |     Continue(_) => incr_fail("expected chunked JSON to finish: " + name) (escaped)
   |     ^^^^^^^^ (escaped)
   |   } (escaped)
   | } (escaped)

<WORKDIR>/src/tests/incr.mbt:57:5-57:13:
   |         "expected chunked parser rejection, got non-parser error: " + name, (escaped)
   |       ) (escaped)
   |   } noraise { (escaped)
57 |     Continue(_) => (escaped)
   |     ^^^^^^^^ (escaped)
   |       incr_fail("expected chunked parser rejection, got continuation: " + name) (escaped)
   |     Finish(_) => (escaped)

<WORKDIR>/src/tests/incr.mbt:139:5-139:13:
    |       @debug.assert_eq(value, Json::object({ "a": Json::number(1.0) })) (escaped)
    |       assert_eq(String::from_array([..rest]), " trailing") (escaped)
    |     } (escaped)
139 |     Continue(_) => (escaped)
    |     ^^^^^^^^ (escaped)
    |       incr_fail("expected chunked parser to finish with trailing rest") (escaped)
    |   } (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'ContinueValue' --loc 'src/lib/value.mbt:3:12'
Found 5 references for symbol 'ContinueValue':
<WORKDIR>/src/lib/json.mbt:66:47-66:60:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
66 | pub fn decode_continue(cont : String, state : ContinueValue) -> Value raise { (escaped)
   |                                               ^^^^^^^^^^^^^ (escaped)
   |   let input = [..state.rest, ..cont.to_array()] (escaped)
   |   let ctx = Context::{ (escaped)

<WORKDIR>/src/lib/json.mbt:625:21-625:34:
    |   let original_size = original.length() (escaped)
    |   if original_size <= required_size { (escaped)
    |     let rest = original[skip:] (escaped)
625 |     Value::Continue(ContinueValue::{ (escaped)
    |                     ^^^^^^^^^^^^^ (escaped)
    |       rest, (escaped)
    |       arr_acc, (escaped)

<WORKDIR>/src/lib/value.mbt:3:12-3:25:
  | ///| (escaped)
  | pub enum Value { (escaped)
3 |   Continue(ContinueValue) (escaped)
  |            ^^^^^^^^^^^^^ (escaped)
  |   Finish(FinishValue) (escaped)
  | } (escaped)

<WORKDIR>/src/lib/value.mbt:8:12-8:25:
  | } (escaped)
  |  (escaped)
  | ///| (escaped)
8 | pub struct ContinueValue { (escaped)
  |            ^^^^^^^^^^^^^ (escaped)
  |   rest : ArrayView[Char] (escaped)
  |   arr_acc : JsonArray (escaped)

<WORKDIR>/src/top.mbt:8:8-8:21:
  |   decode_start, (escaped)
  |   decode_continue, (escaped)
  |   type Value, (escaped)
8 |   type ContinueValue, (escaped)
  |        ^^^^^^^^^^^^^ (escaped)
  |   type FinishValue, (escaped)
  |   type ParseError, (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'Decode' --loc 'src/lib/decode.mbt:8:11'
Found 17 references for symbol 'Decode':
<WORKDIR>/src/lib/decode.mbt:8:11-8:17:
  | pub type JsonObject = Map[String, Json] (escaped)
  |  (escaped)
  | ///| (escaped)
8 | pub trait Decode { (escaped)
  |           ^^^^^^ (escaped)
  |   array_start(Self, JsonArray) -> JsonArray (escaped)
  |   array_push(Self, Json, JsonArray) -> JsonArray (escaped)

<WORKDIR>/src/lib/decode.mbt:21:6-21:12:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
21 | impl Decode for Unit with array_start(_self, _old_acc) -> JsonArray { (escaped)
   |      ^^^^^^ (escaped)
   |   [] (escaped)
   | } (escaped)

<WORKDIR>/src/lib/decode.mbt:26:6-26:12:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
26 | impl Decode for Unit with array_push(_self, elem, acc) { (escaped)
   |      ^^^^^^ (escaped)
   |   [elem, ..acc] (escaped)
   | } (escaped)

<WORKDIR>/src/lib/decode.mbt:31:6-31:12:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
31 | impl Decode for Unit with array_finish(_self, acc, old_acc) { (escaped)
   |      ^^^^^^ (escaped)
   |   (acc.rev(), old_acc) (escaped)
   | } (escaped)

<WORKDIR>/src/lib/decode.mbt:36:6-36:12:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
36 | impl Decode for Unit with object_start(_self, _old_acc) -> JsonObject { (escaped)
   |      ^^^^^^ (escaped)
   |   Map([]) (escaped)
   | } (escaped)

<WORKDIR>/src/lib/decode.mbt:41:6-41:12:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
41 | impl Decode for Unit with object_push(_self, key, value, acc) { (escaped)
   |      ^^^^^^ (escaped)
   |   if !acc.contains(key) { (escaped)
   |     acc[key] = value (escaped)

<WORKDIR>/src/lib/decode.mbt:49:6-49:12:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
49 | impl Decode for Unit with object_finish(_self, acc, old_acc) { (escaped)
   |      ^^^^^^ (escaped)
   |   (acc, old_acc) (escaped)
   | } (escaped)

<WORKDIR>/src/lib/decode.mbt:54:6-54:12:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
54 | impl Decode for Unit with double(_self, view) -> Double raise { (escaped)
   |      ^^^^^^ (escaped)
   |   @string.parse_double(String::from_iter(view.iter())) (escaped)
   | } (escaped)

<WORKDIR>/src/lib/decode.mbt:59:6-59:12:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
59 | impl Decode for Unit with integer(_self, view) -> Int raise { (escaped)
   |      ^^^^^^ (escaped)
   |   @string.parse_int(String::from_iter(view.iter())) (escaped)
   | } (escaped)

<WORKDIR>/src/lib/decode.mbt:64:6-64:12:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
64 | impl Decode for Unit with string(_self, s) { (escaped)
   |      ^^^^^^ (escaped)
   |   s (escaped)
   | } (escaped)

<WORKDIR>/src/lib/json.mbt:9:13-9:19:
  |   arr_acc : Array[Json] (escaped)
  |   obj_acc : Map[String, Json] (escaped)
  |   stack : Array[Frame] (escaped)
9 |   decode : &Decode (escaped)
  |             ^^^^^^ (escaped)
  | } (escaped)
  |  (escaped)

<WORKDIR>/src/lib/json.mbt:20:42-20:48:
   | } derive(Debug) (escaped)
   |  (escaped)
   | ///| (escaped)
20 | pub fn decode(input : String, decode? : &Decode) -> Json raise { (escaped)
   |                                          ^^^^^^ (escaped)
   |   let decode : &Decode = match decode { (escaped)
   |     Some(decode) => decode (escaped)

<WORKDIR>/src/lib/json.mbt:21:17-21:23:
   |  (escaped)
   | ///| (escaped)
   | pub fn decode(input : String, decode? : &Decode) -> Json raise { (escaped)
21 |   let decode : &Decode = match decode { (escaped)
   |                 ^^^^^^ (escaped)
   |     Some(decode) => decode (escaped)
   |     None => () (escaped)

<WORKDIR>/src/lib/json.mbt:48:48-48:54:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
48 | pub fn decode_start(input : String, decode? : &Decode) -> Value raise { (escaped)
   |                                                ^^^^^^ (escaped)
   |   let decode : &Decode = match decode { (escaped)
   |     Some(decode) => decode (escaped)

<WORKDIR>/src/lib/json.mbt:49:17-49:23:
   |  (escaped)
   | ///| (escaped)
   | pub fn decode_start(input : String, decode? : &Decode) -> Value raise { (escaped)
49 |   let decode : &Decode = match decode { (escaped)
   |                 ^^^^^^ (escaped)
   |     Some(decode) => decode (escaped)
   |     None => () (escaped)

<WORKDIR>/src/lib/value.mbt:13:13-13:19:
   |   arr_acc : JsonArray (escaped)
   |   obj_acc : JsonObject (escaped)
   |   stack : Array[Frame] (escaped)
13 |   decode : &Decode (escaped)
   |             ^^^^^^ (escaped)
   |   checkpoint : Checkpoint (escaped)
   | } (escaped)

<WORKDIR>/src/top.mbt:3:9-3:15:
  | ///| (escaped)
  | pub using @lib { (escaped)
3 |   trait Decode, (escaped)
  |         ^^^^^^ (escaped)
  |   decode, (escaped)
  |   decode_start, (escaped)

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

```mooncram
$ run_moon_ide moon ide find-references 'decode_start' --loc 'src/tests/top.mbt:2:14'
Found 3 references for symbol 'decode_start':
<WORKDIR>/src/tests/incr.mbt:21:31-21:43:
   | fn decode_chunks(chunks : ArrayView[String]) -> Value raise { (escaped)
   |   match chunks { (escaped)
   |     [first_chunk, .. chunks] => (escaped)
21 |       continue_chunks(chunks, decode_start(first_chunk)) (escaped)
   |                               ^^^^^^^^^^^^ (escaped)
   |     [] => raise InspectError::InspectError("expected at least one chunk") (escaped)
   |   } (escaped)

<WORKDIR>/src/tests/incr.mbt:71:33-71:45:
   |   guard compelet_json.to_array().chunks(6).map(String::from_array) (escaped)
   |     is [first_chunk, .. chunks] (escaped)
   |   // start parsing from `first_chunk` (escaped)
71 |   guard continue_chunks(chunks, decode_start(first_chunk)) (escaped)
   |                                 ^^^^^^^^^^^^ (escaped)
   |     is Finish({ value, .. }) (escaped)
   |   let expected = Json::object({ (escaped)

<WORKDIR>/src/tests/top.mbt:2:14-2:26:
  | ///| (escaped)
2 | using @json {decode_start, decode_continue, type Value} (escaped)
  |              ^^^^^^^^^^^^ (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'decode_continue' --loc 'src/tests/top.mbt:2:28'
Found 2 references for symbol 'decode_continue':
<WORKDIR>/src/tests/incr.mbt:11:29-11:44:
   |   match (chunks, value) { (escaped)
   |     ([], value) => value (escaped)
   |     ([chunk, .. rest], Continue(state)) => (escaped)
11 |       continue_chunks(rest, decode_continue(chunk, state)) (escaped)
   |                             ^^^^^^^^^^^^^^^ (escaped)
   |     ([_, ..], Finish(_)) => (escaped)
   |       raise InspectError::InspectError("parser finished before all chunks") (escaped)

<WORKDIR>/src/tests/top.mbt:2:28-2:43:
  | ///| (escaped)
2 | using @json {decode_start, decode_continue, type Value} (escaped)
  |                            ^^^^^^^^^^^^^^^ (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'Context' --loc 'src/lib/json.mbt:2:13'
Found 34 references for symbol 'Context':
<WORKDIR>/src/lib/json.mbt:2:13-2:20:
  | ///| (escaped)
2 | priv struct Context { (escaped)
  |             ^^^^^^^ (escaped)
  |   original : Array[Char] (escaped)
  |   rest : ArrayView[Char] (escaped)

<WORKDIR>/src/lib/json.mbt:25:13-25:20:
   |     Some(decode) => decode (escaped)
   |     None => () (escaped)
   |   } (escaped)
25 |   let ctx = Context::{ (escaped)
   |             ^^^^^^^ (escaped)
   |     rest: input.to_array()[:], (escaped)
   |     original: input.to_array(), (escaped)

<WORKDIR>/src/lib/json.mbt:53:13-53:20:
   |     Some(decode) => decode (escaped)
   |     None => () (escaped)
   |   } (escaped)
53 |   let ctx = Context::{ (escaped)
   |             ^^^^^^^ (escaped)
   |     rest: input.to_array()[:], (escaped)
   |     original: input.to_array(), (escaped)

<WORKDIR>/src/lib/json.mbt:68:13-68:20:
   | ///| (escaped)
   | pub fn decode_continue(cont : String, state : ContinueValue) -> Value raise { (escaped)
   |   let input = [..state.rest, ..cont.to_array()] (escaped)
68 |   let ctx = Context::{ (escaped)
   |             ^^^^^^^ (escaped)
   |     rest: input[:], (escaped)
   |     original: input, (escaped)

<WORKDIR>/src/lib/json.mbt:87:16-87:23:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
87 | fn value(ctx : Context) -> Value raise { (escaped)
   |                ^^^^^^^ (escaped)
   |   match ctx.rest { (escaped)
   |     // skip whitespace (escaped)

<WORKDIR>/src/lib/json.mbt:108:22-108:29:
    | // number {{{ (escaped)
    |  (escaped)
    | ///| (escaped)
108 | fn number_zero(ctx : Context, len : Int) -> Value raise { (escaped)
    |                      ^^^^^^^ (escaped)
    |   let { original, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:130:17-130:24:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
130 | fn number(ctx : Context, len : Int) -> Value raise { (escaped)
    |                 ^^^^^^^ (escaped)
    |   let { original, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:153:22-153:29:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
153 | fn number_frac(ctx : Context, len : Int) -> Value raise { (escaped)
    |                      ^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['0'..='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1) (escaped)

<WORKDIR>/src/lib/json.mbt:161:27-161:34:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
161 | fn number_frac_cont(ctx : Context, len : Int) -> Value raise { (escaped)
    |                           ^^^^^^^ (escaped)
    |   let { original, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:175:9-175:16:
    |  (escaped)
    | ///| (escaped)
    | fn float_decode( (escaped)
175 |   ctx : Context, (escaped)
    |         ^^^^^^^ (escaped)
    |   len : Int, (escaped)
    |   token : ArrayView[Char], (escaped)

<WORKDIR>/src/lib/json.mbt:197:21-197:28:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
197 | fn number_exp(ctx : Context, len : Int) -> Value raise { (escaped)
    |                     ^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1) (escaped)

<WORKDIR>/src/lib/json.mbt:206:26-206:33:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
206 | fn number_exp_sign(ctx : Context, len : Int) -> Value raise { (escaped)
    |                          ^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1) (escaped)

<WORKDIR>/src/lib/json.mbt:214:26-214:33:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
214 | fn number_exp_cont(ctx : Context, len : Int) -> Value raise { (escaped)
    |                          ^^^^^^^ (escaped)
    |   let { original, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:226:23-226:30:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
226 | fn number_minus(ctx : Context) -> Value raise { (escaped)
    |                       ^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['0', .. rest] => number_zero({ ..ctx, rest, }, 2) (escaped)

<WORKDIR>/src/lib/json.mbt:235:25-235:32:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
235 | fn integer_decode(ctx : Context, token : ArrayView[Char]) -> Int raise { (escaped)
    |                         ^^^^^^^ (escaped)
    |   try ctx.decode.integer(token) catch { (escaped)
    |     _ => raise ParseError(UnexpectedSequence(token.to_owned(), ctx.skip)) (escaped)

<WORKDIR>/src/lib/json.mbt:248:16-248:23:
    | // constants {{{ (escaped)
    |  (escaped)
    | ///| (escaped)
248 | fn true_(ctx : Context) -> Value raise { (escaped)
    |                ^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['r', 'u', 'e', .. rest] => (escaped)

<WORKDIR>/src/lib/json.mbt:257:17-257:24:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
257 | fn false_(ctx : Context) -> Value raise { (escaped)
    |                 ^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['a', 'l', 's', 'e', .. rest] => (escaped)

<WORKDIR>/src/lib/json.mbt:266:15-266:22:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
266 | fn null(ctx : Context) -> Value raise { (escaped)
    |               ^^^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['u', 'l', 'l', .. rest] => (escaped)

<WORKDIR>/src/lib/json.mbt:279:17-279:24:
    | // string {{{ (escaped)
    |  (escaped)
    | ///| (escaped)
279 | fn string(ctx : Context, len : Int) -> Value raise { (escaped)
    |                 ^^^^^^^ (escaped)
    |   let builder = StringBuilder::new(size_hint=len) (escaped)
    |   string_scan(ctx, len, builder) (escaped)

<WORKDIR>/src/lib/json.mbt:286:9-286:16:
    |  (escaped)
    | ///| (escaped)
    | fn string_scan( (escaped)
286 |   ctx : Context, (escaped)
    |         ^^^^^^^ (escaped)
    |   len : Int, (escaped)
    |   builder : StringBuilder, (escaped)

<WORKDIR>/src/lib/json.mbt:311:9-311:16:
    |  (escaped)
    | ///| (escaped)
    | fn string_escape( (escaped)
311 |   ctx : Context, (escaped)
    |         ^^^^^^^ (escaped)
    |   len : Int, (escaped)
    |   builder : StringBuilder, (escaped)

<WORKDIR>/src/lib/json.mbt:362:9-362:16:
    |  (escaped)
    | ///| (escaped)
    | fn string_unicode( (escaped)
362 |   ctx : Context, (escaped)
    |         ^^^^^^^ (escaped)
    |   len : Int, (escaped)
    |   code_unit : Int, (escaped)

<WORKDIR>/src/lib/json.mbt:408:9-408:16:
    |  (escaped)
    | ///| (escaped)
    | fn unicode_escape_value( (escaped)
408 |   ctx : Context, (escaped)
    |         ^^^^^^^ (escaped)
    |   len : Int, (escaped)
    |   a : Char, (escaped)

<WORKDIR>/src/lib/json.mbt:423:20-423:27:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
423 | fn hex_value(ctx : Context, index : Int, c : Char) -> Int raise { (escaped)
    |                    ^^^^^^^ (escaped)
    |   match c { (escaped)
    |     '0'..='9' => c.to_int() - '0'.to_int() (escaped)

<WORKDIR>/src/lib/json.mbt:434:9-434:16:
    |  (escaped)
    | ///| (escaped)
    | fn write_codepoint( (escaped)
434 |   ctx : Context, (escaped)
    |         ^^^^^^^ (escaped)
    |   index : Int, (escaped)
    |   codepoint : Int, (escaped)

<WORKDIR>/src/lib/json.mbt:450:22-450:29:
    | // array {{{ (escaped)
    |  (escaped)
    | ///| (escaped)
450 | fn array_start(ctx : Context, len : Int) -> Value raise { (escaped)
    |                      ^^^^^^^ (escaped)
    |   let { decode, skip, arr_acc, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:475:21-475:28:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
475 | fn array_push(ctx : Context, value0 : Json) -> Value raise { (escaped)
    |                     ^^^^^^^ (escaped)
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:502:23-502:30:
    | // object {{{ (escaped)
    |  (escaped)
    | ///| (escaped)
502 | fn object_start(ctx : Context, len : Int) -> Value raise { (escaped)
    |                       ^^^^^^^ (escaped)
    |   let { obj_acc, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:534:23-534:30:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
534 | fn object_value(ctx : Context, key : String) -> Value raise { (escaped)
    |                       ^^^^^^^ (escaped)
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:548:22-548:29:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
548 | fn object_push(ctx : Context, value0 : Json, key : String) -> Value raise { (escaped)
    |                      ^^^^^^^ (escaped)
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:571:21-571:28:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
571 | fn object_key(ctx : Context) -> Value raise { (escaped)
    |                     ^^^^^^^ (escaped)
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:584:20-584:27:
    | // }}} (escaped)
    |  (escaped)
    | ///| (escaped)
584 | fn continue_(ctx : Context, value : Json) -> Value raise { (escaped)
    |                    ^^^^^^^ (escaped)
    |   match ctx.stack.last() { (escaped)
    |     None => terminate(ctx, value) (escaped)

<WORKDIR>/src/lib/json.mbt:600:20-600:27:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
600 | fn terminate(ctx : Context, value : Json) -> Value raise { (escaped)
    |                    ^^^^^^^ (escaped)
    |   let { rest, original, skip, arr_acc, obj_acc, .. } = ctx (escaped)
    |   match rest { (escaped)

<WORKDIR>/src/lib/json.mbt:615:9-615:16:
    |  (escaped)
    | ///| (escaped)
    | fn unexpected( (escaped)
615 |   ctx : Context, (escaped)
    |         ^^^^^^^ (escaped)
    |   pos : Int, (escaped)
    |   len : Int, (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'Frame' --loc 'src/lib/json.mbt:13:6'
Found 11 references for symbol 'Frame':
<WORKDIR>/src/lib/json.mbt:8:17-8:22:
  |   skip : Int (escaped)
  |   arr_acc : Array[Json] (escaped)
  |   obj_acc : Map[String, Json] (escaped)
8 |   stack : Array[Frame] (escaped)
  |                 ^^^^^ (escaped)
  |   decode : &Decode (escaped)
  | } (escaped)

<WORKDIR>/src/lib/json.mbt:13:6-13:11:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
13 | enum Frame { (escaped)
   |      ^^^^^ (escaped)
   |   Array(Array[Json]) (escaped)
   |   Map(Map[String, Json]) (escaped)

<WORKDIR>/src/lib/json.mbt:468:22-468:27:
    |     [] => unexpected(ctx, len, 0, Checkpoint::Value) (escaped)
    |     rest => { (escaped)
    |       let new_acc = decode.array_start(arr_acc) (escaped)
468 |       ctx.stack.push(Frame::Array(arr_acc)) (escaped)
    |                      ^^^^^ (escaped)
    |       value({ ..ctx, rest, skip: skip + len, arr_acc: new_acc }) (escaped)
    |     } (escaped)

<WORKDIR>/src/lib/json.mbt:482:37-482:42:
    |       array_push({ ..ctx, rest, skip: skip + 1 }, value0) (escaped)
    |     [']', .. rest] => { (escaped)
    |       let acc = ctx.decode.array_push(value0, ctx.arr_acc) (escaped)
482 |       guard ctx.stack.pop() is Some(Frame::Array(old_acc)) (escaped)
    |                                     ^^^^^ (escaped)
    |       let (array_value, new_acc) = ctx.decode.array_finish(acc, old_acc) (escaped)
    |       continue_( (escaped)

<WORKDIR>/src/lib/json.mbt:518:22-518:27:
    |       ) (escaped)
    |     } (escaped)
    |     ['"', .. rest] => { (escaped)
518 |       ctx.stack.push(Frame::Map(obj_acc)) (escaped)
    |                      ^^^^^ (escaped)
    |       string( (escaped)
    |         { (escaped)

<WORKDIR>/src/lib/json.mbt:540:22-540:27:
    |     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
    |       object_value({ ..ctx, rest, skip: skip + 1 }, key) (escaped)
    |     [':', .. rest] => { (escaped)
540 |       ctx.stack.push(Frame::Key(key)) (escaped)
    |                      ^^^^^ (escaped)
    |       value({ ..ctx, rest, skip: skip + 1 }) (escaped)
    |     } (escaped)

<WORKDIR>/src/lib/json.mbt:555:37-555:42:
    |       object_push({ ..ctx, rest, skip: skip + 1 }, value0, key) (escaped)
    |     ['}', .. rest] => { (escaped)
    |       let acc = ctx.decode.object_push(key, value0, ctx.obj_acc) (escaped)
555 |       guard ctx.stack.pop() is Some(Frame::Map(old_acc)) (escaped)
    |                                     ^^^^^ (escaped)
    |       let (object_value, new_acc) = ctx.decode.object_finish(acc, old_acc) (escaped)
    |       continue_( (escaped)

<WORKDIR>/src/lib/json.mbt:587:10-587:15:
    | fn continue_(ctx : Context, value : Json) -> Value raise { (escaped)
    |   match ctx.stack.last() { (escaped)
    |     None => terminate(ctx, value) (escaped)
587 |     Some(Frame::Array(_)) => array_push(ctx, value) (escaped)
    |          ^^^^^ (escaped)
    |     Some(Frame::Map(_)) => { (escaped)
    |       guard value is Json::String(key) (escaped)

<WORKDIR>/src/lib/json.mbt:588:10-588:15:
    |   match ctx.stack.last() { (escaped)
    |     None => terminate(ctx, value) (escaped)
    |     Some(Frame::Array(_)) => array_push(ctx, value) (escaped)
588 |     Some(Frame::Map(_)) => { (escaped)
    |          ^^^^^ (escaped)
    |       guard value is Json::String(key) (escaped)
    |       object_value(ctx, key) (escaped)

<WORKDIR>/src/lib/json.mbt:592:10-592:15:
    |       guard value is Json::String(key) (escaped)
    |       object_value(ctx, key) (escaped)
    |     } (escaped)
592 |     Some(Frame::Key(key)) => { (escaped)
    |          ^^^^^ (escaped)
    |       ctx.stack.pop() |> ignore (escaped)
    |       object_push({ ..ctx }, value, key) (escaped)

<WORKDIR>/src/lib/value.mbt:12:17-12:22:
   |   rest : ArrayView[Char] (escaped)
   |   arr_acc : JsonArray (escaped)
   |   obj_acc : JsonObject (escaped)
12 |   stack : Array[Frame] (escaped)
   |                 ^^^^^ (escaped)
   |   decode : &Decode (escaped)
   |   checkpoint : Checkpoint (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'decode' --loc 'src/lib/json.mbt:20:8'
Found 1 references for symbol 'decode':
<WORKDIR>/src/lib/json.mbt:20:8-20:14:
   | } derive(Debug) (escaped)
   |  (escaped)
   | ///| (escaped)
20 | pub fn decode(input : String, decode? : &Decode) -> Json raise { (escaped)
   |        ^^^^^^ (escaped)
   |   let decode : &Decode = match decode { (escaped)
   |     Some(decode) => decode (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'decode_start' --loc 'src/lib/json.mbt:48:8'
Found 1 references for symbol 'decode_start':
<WORKDIR>/src/lib/json.mbt:48:8-48:20:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
48 | pub fn decode_start(input : String, decode? : &Decode) -> Value raise { (escaped)
   |        ^^^^^^^^^^^^ (escaped)
   |   let decode : &Decode = match decode { (escaped)
   |     Some(decode) => decode (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'decode_continue' --loc 'src/lib/json.mbt:66:8'
Found 1 references for symbol 'decode_continue':
<WORKDIR>/src/lib/json.mbt:66:8-66:23:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
66 | pub fn decode_continue(cont : String, state : ContinueValue) -> Value raise { (escaped)
   |        ^^^^^^^^^^^^^^^ (escaped)
   |   let input = [..state.rest, ..cont.to_array()] (escaped)
   |   let ctx = Context::{ (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'value' --loc 'src/lib/json.mbt:87:4'
Found 8 references for symbol 'value':
<WORKDIR>/src/lib/json.mbt:34:9-34:14:
   |     stack: [], (escaped)
   |     decode, (escaped)
   |   } (escaped)
34 |   match value(ctx) { (escaped)
   |         ^^^^^ (escaped)
   |     Finish({ value, rest: [], .. }) => value (escaped)
   |     Finish({ rest, .. }) => raise invalid_byte([..rest], 0) (escaped)

<WORKDIR>/src/lib/json.mbt:62:3-62:8:
   |     stack: [], (escaped)
   |     decode, (escaped)
   |   } (escaped)
62 |   value(ctx) (escaped)
   |   ^^^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/src/lib/json.mbt:78:59-78:64:
   |     decode: state.decode, (escaped)
   |   } (escaped)
   |   match state.checkpoint { (escaped)
78 |     Value | NumberI(_) | NumberD(_) | FloatError(_, _) => value(ctx) (escaped)
   |                                                           ^^^^^ (escaped)
   |     ArrayPush(v) => array_push(ctx, v) (escaped)
   |     ObjectKey => object_key(ctx) (escaped)

<WORKDIR>/src/lib/json.mbt:87:4-87:9:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
87 | fn value(ctx : Context) -> Value raise { (escaped)
   |    ^^^^^ (escaped)
   |   match ctx.rest { (escaped)
   |     // skip whitespace (escaped)

<WORKDIR>/src/lib/json.mbt:91:7-91:12:
   |   match ctx.rest { (escaped)
   |     // skip whitespace (escaped)
   |     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => (escaped)
91 |       value({ ..ctx, rest, skip: ctx.skip + 1 }) (escaped)
   |       ^^^^^ (escaped)
   |     ['0', .. rest] => number_zero({ ..ctx, rest, }, 1) (escaped)
   |     ['1'..='9', .. rest] => number({ ..ctx, rest, }, 1) (escaped)

<WORKDIR>/src/lib/json.mbt:469:7-469:12:
    |     rest => { (escaped)
    |       let new_acc = decode.array_start(arr_acc) (escaped)
    |       ctx.stack.push(Frame::Array(arr_acc)) (escaped)
469 |       value({ ..ctx, rest, skip: skip + len, arr_acc: new_acc }) (escaped)
    |       ^^^^^ (escaped)
    |     } (escaped)
    |   } (escaped)

<WORKDIR>/src/lib/json.mbt:491:7-491:12:
    |     } (escaped)
    |     [',', .. rest] => { (escaped)
    |       let arr_acc = ctx.decode.array_push(value0, ctx.arr_acc) (escaped)
491 |       value({ ..ctx, rest, skip: skip + 1, arr_acc }) (escaped)
    |       ^^^^^ (escaped)
    |     } (escaped)
    |     _ => unexpected(ctx, 0, 0, Checkpoint::ArrayPush(value0)) (escaped)

<WORKDIR>/src/lib/json.mbt:541:7-541:12:
    |       object_value({ ..ctx, rest, skip: skip + 1 }, key) (escaped)
    |     [':', .. rest] => { (escaped)
    |       ctx.stack.push(Frame::Key(key)) (escaped)
541 |       value({ ..ctx, rest, skip: skip + 1 }) (escaped)
    |       ^^^^^ (escaped)
    |     } (escaped)
    |     _ => unexpected(ctx, 0, 0, Checkpoint::ObjectValue(key)) (escaped)

```
