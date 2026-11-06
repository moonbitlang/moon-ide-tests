# openseek rename file desktop/frontend/fileeditor/loading_wbtest.mbt:3:7

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' rename 'file' 'file_renamed' --loc 'desktop/frontend/fileeditor/loading_wbtest.mbt:3:7' --target js --no-check
*** Begin Patch
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\loading_wbtest.mbt
@@
 ///|
 test "ordinary retries without previewable content enter loading but successful refreshes retain content" {
-  let file = test_file("retry.txt")
+  let file_renamed = test_file("retry.txt")
-  let ctx = { ..test_ctx(), open_files: [file], active_file: Some(file), }
+  let ctx = { ..test_ctx(), open_files: [file_renamed], active_file: Some(file_renamed), }
   for previous in [TabBinary, TabOversized, TabReadFailed("failed")] {
     let state = {
       ..owned_state(),
       docs: Map([
         (
-          file,
+          file_renamed,
           { name: "retry.txt", state: previous, review: None, stale: false, },
         ),
       ]),
@@
       test_emit(),
       state,
       ctx,
-      file,
+      file_renamed,
       range=None,
       had_active=true,
     )
     assert_true(
-      loading.docs.get(file) is Some({ state: TabLoading, review: None, .. }),
+      loading.docs.get(file_renamed) is Some({ state: TabLoading, review: None, .. }),
     )
   }
   for content in ["", "cached content"] {
@@
       state: TabLoaded(content~, sig="saved"),
       stale: true,
     }
-    let state = { ..owned_state(), docs: Map([(file, doc)]), }
+    let state = { ..owned_state(), docs: Map([(file_renamed, doc)]), }
     let (_, refreshing) = open_file(
       test_emit(),
       state,
       ctx,
-      file,
+      file_renamed,
       range=None,
       had_active=true,
     )
-    assert_true(refreshing.docs.get(file) == Some(doc))
+    assert_true(refreshing.docs.get(file_renamed) == Some(doc))
   }
 }
 
*** End Patch
"" (escaped)
```
