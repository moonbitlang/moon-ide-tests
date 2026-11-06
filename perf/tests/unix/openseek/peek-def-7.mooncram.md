# openseek peek-def

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' peek-def 'file' --loc 'desktop/frontend/fileeditor/loading_wbtest.mbt:3:7' --target js --no-check
Definition found at file e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\loading_wbtest.mbt
  | ///|
  | test "ordinary retries without previewable content enter loading but successful refreshes retain content" {
3 |   let file = test_file("retry.txt")
  |       ^^^^
  |   let ctx = { ..test_ctx(), open_files: [file], active_file: Some(file), }
  |   for previous in [TabBinary, TabOversized, TabReadFailed("failed")] {
  |     let state = {
  |       ..owned_state(),
  |       docs: Map([
  |         (
  |           file,
  |           { name: "retry.txt", state: previous, review: None, stale: false, },
  |         ),
  |       ]),
  |     }
  |     let (_, loading) = open_file(
  |       test_emit(),
  |       state,
```
