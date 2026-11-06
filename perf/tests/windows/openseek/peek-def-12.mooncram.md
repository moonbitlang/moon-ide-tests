# openseek peek-def

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' peek-def 'source' --loc 'desktop/protocol/session_import_test.mbt:5:7' --target native --no-check
Definition found at file e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\protocol\session_import_test.mbt
  | ///|
  | test "import request codecs preserve source and optional worktree placement" {
  |   for worktree_of in [None, Some("source-session")] {
  |     for
5 |       source in [
  |       ^^^^^^
  |         @protocol.JsonFile(text="{}"),
  |         ShareLink(url="https://example/v1/shares/sh_test"),
  |       ] {
  |       let payload : @protocol.SessionImportPayload = {
  |         source,
  |         workspace: "/project",
  |         worktree_of,
  |       }
  |       let encoded = payload.to_json()
  |       let decoded : @protocol.SessionImportPayload = @json.from_json(encoded)
  |       assert_eq(decoded, payload)
  |       assert_true(
  |         match worktree_of {
  |           None => encoded is { "worktree_of": Null, .. }
```
