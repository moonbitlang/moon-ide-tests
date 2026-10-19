# Known IDE hover limitations

These are retained reproductions with MoonBit 0.10.15+943464bfa, not confirmed
regressions from an older IDE. Daily keeps the queries and their exit status 1.
The generated test contains a `known-ide-limitation` annotation immediately before
each affected hover block. Other operations still run normally.

The health check accepts only the identified repository, file, symbol and column,
the matching `No hover information found` message, and exit status 1. It rejects
package-loading failures, other commands and other exit codes. If upstream source
changes invalidate a reproduction, update the policy after investigating it.

## Extension declaration

In core at eb321a18, `test/extends.mbt:22:37` is the `to_repr` method in
`pub extend Test with @debug.Debug::{to_repr}`. Run from `fixtures/repos/core`:

```sh
moon ide hover to_repr --loc test/extends.mbt:22:37
moon ide rename to_repr to_repr_repro --loc test/extends.mbt:22:37
```

Hover reports no information. Rename recognizes the declaration. Removing the
`#deprecated` and `#doc(hidden)` attributes while preserving the line numbers does
not restore hover. A temporary call `fn repro(t : Test) -> Unit { ignore(t.to_repr()) }`
does have hover information at the call site. The annotation is
`extension-declaration-hover`.

## Intrinsic parameter

`core/builtin/int64.mbt:26:21` is `self` in the intrinsic declaration
`pub fn Int64::Int64(self : Int64) -> Int64 = "%identity"`.

```sh
moon ide hover self --loc builtin/int64.mbt:26:21
moon ide hover i --loc builtin/int64.mbt:44:22
```

Hover fails at the intrinsic parameter and succeeds at the ordinary function
parameter `i`. The annotation is `intrinsic-parameter-hover`.

## Imported trait in a using declaration

In Rabbita at 101da910, `rabbita/internal/vdom/vdom.mbt:2:19` is `Scheduler` in
`using @cmd {trait Scheduler}`. Run from `fixtures/repos/rabbita`:

```sh
moon ide hover Scheduler --loc rabbita/internal/vdom/vdom.mbt:2:19
moon ide peek-def Scheduler --loc rabbita/internal/vdom/vdom.mbt:2:19
moon ide hover Scheduler --loc rabbita/cmd/scheduler.mbt:14:17
```

Hover fails in the using declaration. Definition lookup succeeds there, and
hover succeeds at the trait declaration. The annotation is `using-trait-hover`.

JSON's public imported trait has the same limitation after fixture preparation:
from `fixtures/repos/json`, hover at `src/top.mbt:3:9` on `Decode` fails, while
`moon ide peek-def Decode --loc src/top.mbt:3:9` succeeds and
`moon ide hover Decode --loc src/lib/decode.mbt:8:11` displays the trait.

## External declarations

External functions and their parameters can be recognized by definition lookup,
references and rename while hover returns no information. Core's JS decoder
reproduces this with the correct backend:

```sh
moon ide hover decode_utf8_js --loc encoding/utf8/decode_js.mbt:16:16 --target js
moon ide hover bytes --loc encoding/utf8/decode_js.mbt:17:3 --target js
moon ide peek-def decode_utf8_js --loc encoding/utf8/decode_js.mbt:16:16 --target js
```

The selected native C declarations in async's `src/fs/named_pipe_test.mbt`
(`mkfifo`, `path`, Unix only) and `src/internal/event_loop/stdio.mbt`
(`fstatx_sync`, `fd`) exercise the same boundary. Their annotations are
`extern-function-hover` and `extern-parameter-hover`. The Unix-only declaration
must not be selected on Windows; that is a test-selection issue.
