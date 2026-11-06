# openseek find-references file desktop/frontend/fileeditor/loading_wbtest.mbt:3:7

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' find-references 'file' --loc 'desktop/frontend/fileeditor/loading_wbtest.mbt:3:7' --target js --no-check
Found 8 references for symbol 'file':
e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\loading_wbtest.mbt:4:42-4:46:
  | ///|
  | test "ordinary retries without previewable content enter loading but successful refreshes retain content" {
  |   let file = test_file("retry.txt")
4 |   let ctx = { ..test_ctx(), open_files: [file], active_file: Some(file), }
  |                                          ^^^^
  |   for previous in [TabBinary, TabOversized, TabReadFailed("failed")] {
  |     let state = {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\loading_wbtest.mbt:4:67-4:71:
  | ///|
  | test "ordinary retries without previewable content enter loading but successful refreshes retain content" {
  |   let file = test_file("retry.txt")
4 |   let ctx = { ..test_ctx(), open_files: [file], active_file: Some(file), }
  |                                                                   ^^^^
  |   for previous in [TabBinary, TabOversized, TabReadFailed("failed")] {
  |     let state = {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\loading_wbtest.mbt:10:11-10:15:
   |       ..owned_state(),
   |       docs: Map([
   |         (
10 |           file,
   |           ^^^^
   |           { name: "retry.txt", state: previous, review: None, stale: false, },
   |         ),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\loading_wbtest.mbt:19:7-19:11:
   |       test_emit(),
   |       state,
   |       ctx,
19 |       file,
   |       ^^^^
   |       range=None,
   |       had_active=true,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\loading_wbtest.mbt:24:24-24:28:
   |       had_active=true,
   |     )
   |     assert_true(
24 |       loading.docs.get(file) is Some({ state: TabLoading, review: None, .. }),
   |                        ^^^^
   |     )
   |   }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\loading_wbtest.mbt:33:48-33:52:
   |       state: TabLoaded(content~, sig="saved"),
   |       stale: true,
   |     }
33 |     let state = { ..owned_state(), docs: Map([(file, doc)]), }
   |                                                ^^^^
   |     let (_, refreshing) = open_file(
   |       test_emit(),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\loading_wbtest.mbt:38:7-38:11:
   |       test_emit(),
   |       state,
   |       ctx,
38 |       file,
   |       ^^^^
   |       range=None,
   |       had_active=true,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\loading_wbtest.mbt:42:37-42:41:
   |       range=None,
   |       had_active=true,
   |     )
42 |     assert_true(refreshing.docs.get(file) == Some(doc))
   |                                     ^^^^
   |   }
   | }
"" (escaped)
```
