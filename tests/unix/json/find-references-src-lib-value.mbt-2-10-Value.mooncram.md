# json find-references Value src/lib/value.mbt:2:10

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
$ run_moon_ide moon ide find-references 'Value' --loc 'src/lib/value.mbt:2:10'
Found 33 references for symbol 'Value':
<WORKDIR>/src/lib/json.mbt:48:59-48:64:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
48 | pub fn decode_start(input : String, decode? : &Decode) -> Value raise { (escaped)
   |                                                           ^^^^^ (escaped)
   |   let decode : &Decode = match decode { (escaped)
   |     Some(decode) => decode (escaped)

<WORKDIR>/src/lib/json.mbt:66:65-66:70:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
66 | pub fn decode_continue(cont : String, state : ContinueValue) -> Value raise { (escaped)
   |                                                                 ^^^^^ (escaped)
   |   let input = [..state.rest, ..cont.to_array()] (escaped)
   |   let ctx = Context::{ (escaped)

<WORKDIR>/src/lib/json.mbt:87:28-87:33:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
87 | fn value(ctx : Context) -> Value raise { (escaped)
   |                            ^^^^^ (escaped)
   |   match ctx.rest { (escaped)
   |     // skip whitespace (escaped)

<WORKDIR>/src/lib/json.mbt:108:45-108:50:
    | // number {{{ (escaped)
    |  (escaped)
    | ///| (escaped)
108 | fn number_zero(ctx : Context, len : Int) -> Value raise { (escaped)
    |                                             ^^^^^ (escaped)
    |   let { original, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:130:40-130:45:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
130 | fn number(ctx : Context, len : Int) -> Value raise { (escaped)
    |                                        ^^^^^ (escaped)
    |   let { original, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:153:45-153:50:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
153 | fn number_frac(ctx : Context, len : Int) -> Value raise { (escaped)
    |                                             ^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['0'..='9', .. rest] => number_frac_cont({ ..ctx, rest, }, len + 1) (escaped)

<WORKDIR>/src/lib/json.mbt:161:50-161:55:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
161 | fn number_frac_cont(ctx : Context, len : Int) -> Value raise { (escaped)
    |                                                  ^^^^^ (escaped)
    |   let { original, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:178:6-178:11:
    |   ctx : Context, (escaped)
    |   len : Int, (escaped)
    |   token : ArrayView[Char], (escaped)
178 | ) -> Value raise { (escaped)
    |      ^^^^^ (escaped)
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:197:44-197:49:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
197 | fn number_exp(ctx : Context, len : Int) -> Value raise { (escaped)
    |                                            ^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1) (escaped)

<WORKDIR>/src/lib/json.mbt:206:49-206:54:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
206 | fn number_exp_sign(ctx : Context, len : Int) -> Value raise { (escaped)
    |                                                 ^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['0'..='9', .. rest] => number_exp_cont({ ..ctx, rest, }, len + 1) (escaped)

<WORKDIR>/src/lib/json.mbt:214:49-214:54:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
214 | fn number_exp_cont(ctx : Context, len : Int) -> Value raise { (escaped)
    |                                                 ^^^^^ (escaped)
    |   let { original, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:226:35-226:40:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
226 | fn number_minus(ctx : Context) -> Value raise { (escaped)
    |                                   ^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['0', .. rest] => number_zero({ ..ctx, rest, }, 2) (escaped)

<WORKDIR>/src/lib/json.mbt:248:28-248:33:
    | // constants {{{ (escaped)
    |  (escaped)
    | ///| (escaped)
248 | fn true_(ctx : Context) -> Value raise { (escaped)
    |                            ^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['r', 'u', 'e', .. rest] => (escaped)

<WORKDIR>/src/lib/json.mbt:257:29-257:34:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
257 | fn false_(ctx : Context) -> Value raise { (escaped)
    |                             ^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['a', 'l', 's', 'e', .. rest] => (escaped)

<WORKDIR>/src/lib/json.mbt:266:27-266:32:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
266 | fn null(ctx : Context) -> Value raise { (escaped)
    |                           ^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['u', 'l', 'l', .. rest] => (escaped)

<WORKDIR>/src/lib/json.mbt:279:40-279:45:
    | // string {{{ (escaped)
    |  (escaped)
    | ///| (escaped)
279 | fn string(ctx : Context, len : Int) -> Value raise { (escaped)
    |                                        ^^^^^ (escaped)
    |   let builder = StringBuilder::new(size_hint=len) (escaped)
    |   string_scan(ctx, len, builder) (escaped)

<WORKDIR>/src/lib/json.mbt:289:6-289:11:
    |   ctx : Context, (escaped)
    |   len : Int, (escaped)
    |   builder : StringBuilder, (escaped)
289 | ) -> Value raise { (escaped)
    |      ^^^^^ (escaped)
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:314:6-314:11:
    |   ctx : Context, (escaped)
    |   len : Int, (escaped)
    |   builder : StringBuilder, (escaped)
314 | ) -> Value raise { (escaped)
    |      ^^^^^ (escaped)
    |   match ctx.rest { (escaped)
    |     ['"', .. rest] => { (escaped)

<WORKDIR>/src/lib/json.mbt:367:6-367:11:
    |   code_unit : Int, (escaped)
    |   rest : ArrayView[Char], (escaped)
    |   builder : StringBuilder, (escaped)
367 | ) -> Value raise { (escaped)
    |      ^^^^^ (escaped)
    |   if code_unit.is_leading_surrogate() { (escaped)
    |     match rest { (escaped)

<WORKDIR>/src/lib/json.mbt:450:45-450:50:
    | // array {{{ (escaped)
    |  (escaped)
    | ///| (escaped)
450 | fn array_start(ctx : Context, len : Int) -> Value raise { (escaped)
    |                                             ^^^^^ (escaped)
    |   let { decode, skip, arr_acc, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:475:48-475:53:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
475 | fn array_push(ctx : Context, value0 : Json) -> Value raise { (escaped)
    |                                                ^^^^^ (escaped)
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:502:46-502:51:
    | // object {{{ (escaped)
    |  (escaped)
    | ///| (escaped)
502 | fn object_start(ctx : Context, len : Int) -> Value raise { (escaped)
    |                                              ^^^^^ (escaped)
    |   let { obj_acc, skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:534:49-534:54:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
534 | fn object_value(ctx : Context, key : String) -> Value raise { (escaped)
    |                                                 ^^^^^ (escaped)
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:548:63-548:68:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
548 | fn object_push(ctx : Context, value0 : Json, key : String) -> Value raise { (escaped)
    |                                                               ^^^^^ (escaped)
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:571:33-571:38:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
571 | fn object_key(ctx : Context) -> Value raise { (escaped)
    |                                 ^^^^^ (escaped)
    |   let { skip, .. } = ctx (escaped)
    |   match ctx.rest { (escaped)

<WORKDIR>/src/lib/json.mbt:584:46-584:51:
    | // }}} (escaped)
    |  (escaped)
    | ///| (escaped)
584 | fn continue_(ctx : Context, value : Json) -> Value raise { (escaped)
    |                                              ^^^^^ (escaped)
    |   match ctx.stack.last() { (escaped)
    |     None => terminate(ctx, value) (escaped)

<WORKDIR>/src/lib/json.mbt:600:46-600:51:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
600 | fn terminate(ctx : Context, value : Json) -> Value raise { (escaped)
    |                                              ^^^^^ (escaped)
    |   let { rest, original, skip, arr_acc, obj_acc, .. } = ctx (escaped)
    |   match rest { (escaped)

<WORKDIR>/src/lib/json.mbt:605:11-605:16:
    |   match rest { (escaped)
    |     // skip whitespace (escaped)
    |     ['\\ ' | '\\n' | '\\r' | '\\t', .. rest] => terminate({ ..ctx, rest, }, value) (escaped)
605 |     [] => Value::Finish({ value, arr_acc, obj_acc, rest: [][:] }) (escaped)
    |           ^^^^^ (escaped)
    |     _ => { (escaped)
    |       let rest = original[skip:] (escaped)

<WORKDIR>/src/lib/json.mbt:608:7-608:12:
    |     [] => Value::Finish({ value, arr_acc, obj_acc, rest: [][:] }) (escaped)
    |     _ => { (escaped)
    |       let rest = original[skip:] (escaped)
608 |       Value::Finish({ value, arr_acc, obj_acc, rest }) (escaped)
    |       ^^^^^ (escaped)
    |     } (escaped)
    |   } (escaped)

<WORKDIR>/src/lib/json.mbt:619:6-619:11:
    |   pos : Int, (escaped)
    |   len : Int, (escaped)
    |   func_data : Checkpoint, (escaped)
619 | ) -> Value raise { (escaped)
    |      ^^^^^ (escaped)
    |   let { original, arr_acc, obj_acc, skip, stack, decode, .. } = ctx (escaped)
    |   let required_size = skip + pos + len (escaped)

<WORKDIR>/src/lib/json.mbt:625:5-625:10:
    |   let original_size = original.length() (escaped)
    |   if original_size <= required_size { (escaped)
    |     let rest = original[skip:] (escaped)
625 |     Value::Continue(ContinueValue::{ (escaped)
    |     ^^^^^ (escaped)
    |       rest, (escaped)
    |       arr_acc, (escaped)

<WORKDIR>/src/lib/value.mbt:2:10-2:15:
  | ///| (escaped)
2 | pub enum Value { (escaped)
  |          ^^^^^ (escaped)
  |   Continue(ContinueValue) (escaped)
  |   Finish(FinishValue) (escaped)

<WORKDIR>/src/top.mbt:7:8-7:13:
  |   decode, (escaped)
  |   decode_start, (escaped)
  |   decode_continue, (escaped)
7 |   type Value, (escaped)
  |        ^^^^^ (escaped)
  |   type ContinueValue, (escaped)
  |   type FinishValue, (escaped)

```
