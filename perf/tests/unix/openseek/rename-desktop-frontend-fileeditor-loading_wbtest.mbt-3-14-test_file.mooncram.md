# openseek rename test_file desktop/frontend/fileeditor/loading_wbtest.mbt:3:14

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' rename 'test_file' 'test_file_renamed' --loc 'desktop/frontend/fileeditor/loading_wbtest.mbt:3:14' --target js --no-check
*** Begin Patch
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\diff_provider_policy_wbtest.mbt
@@
   assert_true(initial.review_diff_ignore_tests)
 
   let path = @pathx.Relative("src/main.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let selected = test_modified_change(path)
   let docs = owned_state().docs.copy()
   docs[file] = reviewed_doc(path, selected, view_mode=ReviewSource)
@@
 ///|
 test "non-MoonBit review parks the last semantic review preference" {
   let path = @pathx.Relative("README.md")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let selected = test_modified_change(path)
   let docs = owned_state().docs.copy()
   docs[file] = reviewed_doc(path, selected, baseline="old text")
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\excel_selection_copy_wbtest.mbt
@@
 ///|
 fn excel_copy_state() -> (State, Ctx, OfficeSelectionPreview) raise {
   let (state, ctx, _) = office_selection_fixture()
-  let path = test_file("budget.xlsx")
+  let path = test_file_renamed("budget.xlsx")
   let document : @office_viewer.RenderedDocument = {
     kind: Excel,
     file: path.path,
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\explorer_search_wbtest.mbt
@@
   let ctx = test_ctx()
   guard ctx.root() is Some(root) else { fail("test checkout root expected") }
   let path = @pathx.Relative("src/main.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let reply : @protocol.SearchTextReply = {
     root: root.path,
     generation: 0,
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\files.mbt
@@
         session: "remote-test",
       }),
       0,
-      test_file("src/main.mbt"),
+      test_file_renamed("src/main.mbt"),
       "main.mbt",
       review_generation=7,
       range=None,
@@
         message="file root moved to another host before file read"
       )
     ) &&
-    path == test_file("src/main.mbt"),
+    path == test_file_renamed("src/main.mbt"),
   )
 }
 
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\loading_wbtest.mbt
@@
 ///|
 test "ordinary retries without previewable content enter loading but successful refreshes retain content" {
-  let file = test_file("retry.txt")
+  let file = test_file_renamed("retry.txt")
   let ctx = { ..test_ctx(), open_files: [file], active_file: Some(file), }
   for previous in [TabBinary, TabOversized, TabReadFailed("failed")] {
     let state = {
@@
 ///|
 test "ordinary retries preserve a review's visible or pending baseline" {
   let path = @pathx.Relative("retry.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let ctx = { ..test_ctx(), open_files: [file], active_file: Some(file), }
   let original = reviewed_doc(
     path,
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\mbti_presentation_wbtest.mbt
@@
 ///|
 test "ordinary MBTI tabs default to source and toggle without replacing the document" {
   let path = @pathx.Relative("api/pkg.generated.mbti")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let docs = owned_state().docs.copy()
   docs[file] = loaded_doc(path.0)
   let state = { ..owned_state(), docs, }
@@
 ///|
 test "reviewed MBTI files keep source and reject the diagram toggle" {
   let path = @pathx.Relative("api/pkg.generated.mbti")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let selected = test_modified_change(path)
   let docs = owned_state().docs.copy()
   docs[file] = reviewed_doc(
@@
 ///|
 test "positioned MBTI opens use source and closing forgets the tab preference" {
   let path = @pathx.Relative("api/pkg.generated.mbti")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let docs = owned_state().docs.copy()
   docs[file] = loaded_doc(path.0)
   let state = { ..owned_state(), docs, }
@@
 ///|
 test "non-MBTI documents do not expose or accept MBTI presentation" {
   let path = @pathx.Relative("src/main.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let docs = owned_state().docs.copy()
   docs[file] = loaded_doc(path.0)
   let state = { ..owned_state(), docs, }
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt
@@
 fn moon_mod_test_state() -> (State, Ctx, @pathx.Relative) raise {
   let path = @pathx.Relative("moon.mod")
   let docs = owned_state().docs.copy()
-  docs[test_file(path.0)] = loaded_doc(path.0)
+  docs[test_file_renamed(path.0)] = loaded_doc(path.0)
   let state = { ..owned_state(), docs, }
   let ctx = {
     ..test_ctx(),
-    open_files: [test_file(path.0)],
+    open_files: [test_file_renamed(path.0)],
-    active_file: Some(test_file(path.0)),
+    active_file: Some(test_file_renamed(path.0)),
   }
   (state, ctx, path)
 }
@@
   let (state, ctx, path) = moon_mod_test_state()
   assert_true(moon_mod_view_available(state, ctx))
   assert_false(uses_package_diagram_surface(state, ctx))
-  assert_true(state.moon_mod_view_mode(test_file(path.0)) is MoonModSource)
+  assert_true(state.moon_mod_view_mode(test_file_renamed(path.0)) is MoonModSource)
 
   let (source, _) = sync(test_emit(), state, ctx)
-  assert_true(source.package_graphs.get(test_file(path.0)) is None)
+  assert_true(source.package_graphs.get(test_file_renamed(path.0)) is None)
   assert_eq(source.package_graph_generation, 0)
   let (_, state) = update(
     test_emit(),
@@
   assert_true(uses_package_diagram_surface(state, ctx))
 
   let (loading, _) = sync(test_emit(), state, ctx)
-  guard loading.package_graphs.get(test_file(path.0))
+  guard loading.package_graphs.get(test_file_renamed(path.0))
     is Some(PackageGraphLoading(generation)) else {
     fail("expected the explicitly selected dependency graph request")
   }
@@
   assert_eq(generation, 1)
   let (still_loading, _) = sync(test_emit(), loading, ctx)
   assert_true(
-    still_loading.package_graphs.get(test_file(path.0)) ==
+    still_loading.package_graphs.get(test_file_renamed(path.0)) ==
     Some(PackageGraphLoading(generation)),
   )
   assert_eq(still_loading.package_graph_generation, generation)
@@
   let stale = PackageGraphRequestLoaded(
     owner=ctx.owner.host().unwrap(),
     epoch=ctx.request_epoch,
-    path=test_file(path.0),
+    path=test_file_renamed(path.0),
     generation=0,
     source="stale",
   )
@@
   let wrong_owner = PackageGraphRequestLoaded(
     owner={ ..ctx.owner.host().unwrap(), session: "another-session", },
     epoch=ctx.request_epoch,
-    path=test_file(path.0),
+    path=test_file_renamed(path.0),
     generation=1,
     source="wrong-owner",
   )
@@
   let wrong_epoch = PackageGraphRequestLoaded(
     owner=ctx.owner.host().unwrap(),
     epoch=ctx.request_epoch + 1,
-    path=test_file(path.0),
+    path=test_file_renamed(path.0),
     generation=1,
     source="wrong-epoch",
   )
@@
   let wrong_path = PackageGraphRequestLoaded(
     owner=ctx.owner.host().unwrap(),
     epoch=ctx.request_epoch,
-    path=test_file("nested/moon.mod"),
+    path=test_file_renamed("nested/moon.mod"),
     generation=1,
     source="wrong-path",
   )
@@
   let current = PackageGraphRequestLoaded(
     owner=ctx.owner.host().unwrap(),
     epoch=ctx.request_epoch,
-    path=test_file(path.0),
+    path=test_file_renamed(path.0),
     generation=1,
     source="graph-json",
   )
   let (_, ready) = update(test_emit(), current, loading, ctx)
   assert_true(
-    ready.package_graphs.get(test_file(path.0)) ==
+    ready.package_graphs.get(test_file_renamed(path.0)) ==
     Some(PackageGraphReady(1, "graph-json")),
   )
 
@@
   let late_failure = PackageGraphRequestFailed(
     owner=ctx.owner.host().unwrap(),
     epoch=ctx.request_epoch,
-    path=test_file(path.0),
+    path=test_file_renamed(path.0),
     generation=1,
     message="late",
   )
@@
     ctx,
   )
   let package_graphs = state.package_graphs.copy()
-  package_graphs[test_file(path.0)] = PackageGraphReady(4, "cached")
+  package_graphs[test_file_renamed(path.0)] = PackageGraphReady(4, "cached")
   let ready = { ..state, package_graphs, package_graph_generation: 4, }
   let (_, source) = update(
     test_emit(),
@@
     ready,
     ctx,
   )
-  assert_true(source.moon_mod_view_mode(test_file(path.0)) is MoonModSource)
+  assert_true(source.moon_mod_view_mode(test_file_renamed(path.0)) is MoonModSource)
   assert_false(uses_package_diagram_surface(source, ctx))
   assert_true(
-    source.package_graphs.get(test_file(path.0)) ==
+    source.package_graphs.get(test_file_renamed(path.0)) ==
     Some(PackageGraphReady(4, "cached")),
   )
 
@@
   )
   assert_true(uses_package_diagram_surface(dependencies, ctx))
   assert_true(
-    dependencies.package_graphs.get(test_file(path.0)) ==
+    dependencies.package_graphs.get(test_file_renamed(path.0)) ==
     Some(PackageGraphReady(4, "cached")),
   )
 
   let failed_graphs = dependencies.package_graphs.copy()
-  failed_graphs[test_file(path.0)] = PackageGraphFailed(5, "moon failed")
+  failed_graphs[test_file_renamed(path.0)] = PackageGraphFailed(5, "moon failed")
   let failed = {
     ..dependencies,
     package_graphs: failed_graphs,
@@
     ctx,
   )
   assert_true(
-    source_after_failure.moon_mod_view_mode(test_file(path.0)) is MoonModSource,
+    source_after_failure.moon_mod_view_mode(test_file_renamed(path.0)) is MoonModSource,
   )
   assert_true(
-    source_after_failure.package_graphs.get(test_file(path.0)) ==
+    source_after_failure.package_graphs.get(test_file_renamed(path.0)) ==
     Some(PackageGraphFailed(5, "moon failed")),
   )
   let (_, retrying) = update(
@@
     source_after_failure,
     ctx,
   )
-  assert_true(retrying.package_graphs.get(test_file(path.0)) is None)
+  assert_true(retrying.package_graphs.get(test_file_renamed(path.0)) is None)
   let (loading, _) = sync(test_emit(), retrying, ctx)
   assert_true(
-    loading.package_graphs.get(test_file(path.0)) ==
+    loading.package_graphs.get(test_file_renamed(path.0)) ==
     Some(PackageGraphLoading(6)),
   )
 }
@@
     test_emit(),
     state,
     ctx,
-    test_file(path.0),
+    test_file_renamed(path.0),
     name="moon.mod",
     range=Some(@common.Range(1, 1, 1, 5)),
     had_active=true,
   )
-  assert_true(positioned.moon_mod_view_mode(test_file(path.0)) is MoonModSource)
+  assert_true(positioned.moon_mod_view_mode(test_file_renamed(path.0)) is MoonModSource)
 
   let graphs = positioned.package_graphs.copy()
-  graphs[test_file(path.0)] = PackageGraphReady(1, "cached")
+  graphs[test_file_renamed(path.0)] = PackageGraphReady(1, "cached")
   let positioned = { ..positioned, package_graphs: graphs, }
   let (_, closed) = close_document(
     test_emit(),
     positioned,
     { ..ctx, open_files: [], active_file: None, },
-    test_file(path.0),
+    test_file_renamed(path.0),
     next=None,
     was_active=true,
   )
-  assert_true(closed.moon_mod_view_modes.get(test_file(path.0)) is None)
+  assert_true(closed.moon_mod_view_modes.get(test_file_renamed(path.0)) is None)
-  assert_true(closed.package_graphs.get(test_file(path.0)) is None)
+  assert_true(closed.package_graphs.get(test_file_renamed(path.0)) is None)
-  assert_true(closed.moon_mod_view_mode(test_file(path.0)) is MoonModSource)
+  assert_true(closed.moon_mod_view_mode(test_file_renamed(path.0)) is MoonModSource)
 }
 
 ///|
@@
     ctx,
   )
   let docs = state.docs.copy()
-  docs[test_file(path.0)] = {
+  docs[test_file_renamed(path.0)] = {
-    ..docs[test_file(path.0)],
+    ..docs[test_file_renamed(path.0)],
     review: Some({
       generation: 1,
       working_generation: 1,
@@
   )
   assert_true(after_toggle == reviewed)
   let (after_sync, _) = sync(test_emit(), reviewed, ctx)
-  assert_true(after_sync.package_graphs.get(test_file(path.0)) is None)
+  assert_true(after_sync.package_graphs.get(test_file_renamed(path.0)) is None)
 
   let history = {
     ..ctx,
@@
 test "watcher baseline invalidates a graph cached across its observation gap" {
   let (state, ctx, path) = moon_mod_test_state()
   let package_graphs = state.package_graphs.copy()
-  package_graphs[test_file(path.0)] = PackageGraphReady(3, "cached")
+  package_graphs[test_file_renamed(path.0)] = PackageGraphReady(3, "cached")
   let state = { ..state, package_graphs, package_graph_generation: 3, }
   let (_, invalidated) = update(
     test_emit(),
@@
     state,
     ctx,
   )
-  assert_true(invalidated.package_graphs.get(test_file(path.0)) is None)
+  assert_true(invalidated.package_graphs.get(test_file_renamed(path.0)) is None)
 }
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\office_navigation_wbtest.mbt
@@
   }
   let (_, switched) = state.sync_office_navigation(test_emit(), {
     ..ctx,
-    active_file: Some(test_file("other.docx")),
+    active_file: Some(test_file_renamed("other.docx")),
   })
   assert_eq(switched.office_navigation, None)
 }
@@
     stale in [
       { ..navigation, generation: navigation.generation - 1, },
       { ..navigation, epoch: navigation.epoch - 1, },
-      { ..navigation, path: test_file("other.xlsx"), },
+      { ..navigation, path: test_file_renamed("other.xlsx"), },
     ] {
     let (_, ignored) = update(
       test_emit(),
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\office_selection_wbtest.mbt
@@
 ///|
 fn office_selection_fixture() -> (State, Ctx, @common.Uri) raise {
-  let path = test_file("report.docx")
+  let path = test_file_renamed("report.docx")
   let ctx = { ..test_ctx(), active_file: Some(path), open_files: [path], }
   let document : @office_viewer.RenderedDocument = {
     kind: Word,
@@
     .unwrap()
   for
     changed in [
-      { ..ctx, active_file: Some(test_file("other.docx")), },
+      { ..ctx, active_file: Some(test_file_renamed("other.docx")), },
       { ..ctx, active_file: None, },
       { ..ctx, panel_open: false, },
       {
@@
 ///|
 test "Excel preview retains the sheet range and selected cell contents" {
   let (state, ctx, _) = office_selection_fixture()
-  let path = test_file("budget.xlsx")
+  let path = test_file_renamed("budget.xlsx")
   let document : @office_viewer.RenderedDocument = {
     kind: Excel,
     file: path.path,
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\pdf_wbtest.mbt
@@
 ///|
 fn pdf_fixture() -> (State, Ctx, @common.Uri, PdfDocument) raise {
-  let path = test_file("report.pdf")
+  let path = test_file_renamed("report.pdf")
   let ctx = { ..test_ctx(), open_files: [path], active_file: Some(path), }
   let document = decode_pdf_document(@base64.encode(b"%PDF-1.7 fixture"), 7).unwrap()
   let docs : Map[@common.Uri, Doc] = Map([])
@@
       ctx,
       ctx.owner,
       0,
-      test_file("other.pdf"),
+      test_file_renamed("other.pdf"),
       "pdf:1",
       7,
     ),
@@
     render_office_document(
       locale=ctx.locale,
       "report.docx",
-      test_file("report.docx"),
+      test_file_renamed("report.docx"),
       "***invalid base64***",
     )
     is Err("无法预览此文档。请重新打开文件。"),
@@
     render_office_document(
       locale=ctx.locale,
       "report.docx",
-      test_file("report.docx"),
+      test_file_renamed("report.docx"),
       @base64.encode(b"invalid Office package"),
     )
     is Err("无法预览此文档。请重新打开文件。"),
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_context_wbtest.mbt
@@
 test "hunk context captures only member lines and rejects a changed source snapshot" {
   let (initial, _, change) = review_progress_state()
   let path = change.path
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let doc = reviewed_doc(
     path,
     change,
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_navigation_wbtest.mbt
@@
   let middle = test_modified_change(@pathx.Relative("middle.mbt"))
   let last = test_modified_change(@pathx.Relative("last.mbt"))
   let docs = owned_state().docs.copy()
-  docs[test_file(first.path.0)] = reviewed_doc(first.path, first)
+  docs[test_file_renamed(first.path.0)] = reviewed_doc(first.path, first)
-  let ctx = { ..test_ctx(), active_file: Some(test_file(first.path.0)), }
+  let ctx = { ..test_ctx(), active_file: Some(test_file_renamed(first.path.0)), }
   let state = {
     ..owned_state(),
     docs,
@@
     kind: ChangeSymlink,
   }
   let docs = owned_state().docs.copy()
-  docs[test_file(first.path.0)] = reviewed_doc(first.path, first)
+  docs[test_file_renamed(first.path.0)] = reviewed_doc(first.path, first)
-  docs[test_file(last.path.0)] = reviewed_doc(last.path, last)
+  docs[test_file_renamed(last.path.0)] = reviewed_doc(last.path, last)
   let state = {
     ..owned_state(),
     docs,
@@
       refresh_again=false,
     ),
   }
-  let first_ctx = { ..test_ctx(), active_file: Some(test_file(first.path.0)), }
+  let first_ctx = { ..test_ctx(), active_file: Some(test_file_renamed(first.path.0)), }
-  let last_ctx = { ..test_ctx(), active_file: Some(test_file(last.path.0)), }
+  let last_ctx = { ..test_ctx(), active_file: Some(test_file_renamed(last.path.0)), }
   assert_true(review_diff_navigation_enabled(state, first_ctx))
   assert_true(review_navigation_neighbor(state, first_ctx, true) == Some(last))
   assert_true(review_navigation_neighbor(state, first_ctx, false) == Some(last))
@@
   let (initial, first_ctx, first) = review_progress_state()
   let last = test_modified_change(@pathx.Relative("src/last.mbt"))
   let docs = initial.docs.copy()
-  docs[test_file(last.path.0)] = reviewed_doc(last.path, last)
+  docs[test_file_renamed(last.path.0)] = reviewed_doc(last.path, last)
   let state = {
     ..initial,
     docs,
@@
       refresh_again=false,
     ),
   }
-  let last_ctx = { ..first_ctx, active_file: Some(test_file(last.path.0)), }
+  let last_ctx = { ..first_ctx, active_file: Some(test_file_renamed(last.path.0)), }
   for previous in [false, true] {
     let messages : Array[Msg] = []
     let emit = @cmd.Emit(message => {
@@
 ///|
 test "cross-file reveal waits for content and cancels when its review is superseded" {
   let path = @pathx.Relative("last.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let change = test_modified_change(path)
   let doc = reviewed_doc(path, change)
   let docs = owned_state().docs.copy()
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_progress_wbtest.mbt
@@
   let path = @pathx.Relative("src/main.mbt")
   let selected = test_modified_change(path)
   let docs = owned_state().docs.copy()
-  docs[test_file(path.0)] = reviewed_doc(path, selected)
+  docs[test_file_renamed(path.0)] = reviewed_doc(path, selected)
   let state = {
     ..owned_state(),
     docs,
@@
   }
   let ctx = {
     ..test_ctx(),
-    open_files: [test_file(path.0)],
+    open_files: [test_file_renamed(path.0)],
-    active_file: Some(test_file(path.0)),
+    active_file: Some(test_file_renamed(path.0)),
   }
   (state, ctx, selected)
 }
@@
   )
   assert_true(stale_row.review_active_hunk is None)
   assert_false(stale_row.review_navigation_ready(ctx))
-  let inactive_ctx = { ..ctx, active_file: Some(test_file("src/other.mbt")), }
+  let inactive_ctx = { ..ctx, active_file: Some(test_file_renamed("src/other.mbt")), }
   let inactive = activate_review_hunk(
     state, inactive_ctx, selected, hunk, hunk, 0, 1,
   )
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_view_mode_wbtest.mbt
@@
 test "positioned Content failures settle retained reviews and fence both generations" {
   let emit = test_emit()
   let path = @pathx.Relative("src/main.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let ctx = { ..test_ctx(), open_files: [file], active_file: Some(file), }
   let docs = owned_state().docs.copy()
   docs[file] = reviewed_doc(path, test_modified_change(path))
@@
 ///|
 test "new reviews default to the full diff" {
   let path = @pathx.Relative("src/main.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let change = test_modified_change(path)
   let state = owned_state()
   assert_true(state.review_diff_layout is ReviewSideBySide)
@@
 ///|
 test "full diff change navigation is enabled only after a nonempty diff" {
   let path = @pathx.Relative("src/main.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let selected = test_modified_change(path)
   let docs = owned_state().docs.copy()
   docs[file] = reviewed_doc(path, selected)
@@
 ///|
 test "full diff layout toggles independently and source mode preserves it" {
   let path = @pathx.Relative("src/main.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let selected = test_modified_change(path)
   let docs = owned_state().docs.copy()
   docs[file] = reviewed_doc(path, selected)
@@
   let first_change = test_modified_change(first_path)
   let second_change = test_modified_change(second_path)
   let docs = owned_state().docs.copy()
-  docs[test_file(first_path.0)] = reviewed_doc(
+  docs[test_file_renamed(first_path.0)] = reviewed_doc(
     first_path,
     first_change,
     view_mode=ReviewSource,
@@
   )
   let first_ctx = {
     ..test_ctx(),
-    open_files: [test_file(first_path.0)],
+    open_files: [test_file_renamed(first_path.0)],
-    active_file: Some(test_file(first_path.0)),
+    active_file: Some(test_file_renamed(first_path.0)),
   }
   let (_, full_diff) = update(
     test_emit(),
@@
     first_ctx,
   )
   assert_true(
-    full_diff.docs.get(test_file(first_path.0))
+    full_diff.docs.get(test_file_renamed(first_path.0))
     is Some({ review: Some({ view_mode: ReviewDiff, .. }), .. }),
   )
 
   let second_ctx = {
     ..first_ctx,
-    open_files: [test_file(first_path.0), test_file(second_path.0)],
+    open_files: [test_file_renamed(first_path.0), test_file_renamed(second_path.0)],
-    active_file: Some(test_file(second_path.0)),
+    active_file: Some(test_file_renamed(second_path.0)),
   }
   let (_, switched) = open_changed_document(
     test_emit(),
@@
     had_active=true,
   )
   assert_true(
-    switched.docs.get(test_file(second_path.0))
+    switched.docs.get(test_file_renamed(second_path.0))
     is Some({ review: Some({ view_mode: ReviewDiff, .. }), .. }),
   )
 
   let loaded_docs = switched.docs.copy()
-  loaded_docs[test_file(second_path.0)] = reviewed_doc(
+  loaded_docs[test_file_renamed(second_path.0)] = reviewed_doc(
     second_path,
     second_change,
     baseline="second old source",
@@
     second_ctx,
   )
   assert_true(
-    source_again.docs.get(test_file(first_path.0))
+    source_again.docs.get(test_file_renamed(first_path.0))
     is Some({ review: Some({ view_mode: ReviewDiff, .. }), .. }),
   )
   assert_true(
-    source_again.docs.get(test_file(second_path.0))
+    source_again.docs.get(test_file_renamed(second_path.0))
     is Some({ review: Some({ view_mode: ReviewSource, .. }), .. }),
   )
 }
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\semantic_review_view_wbtest.mbt
@@
 ///|
 test "semantic input follows active MoonBit review and ignores layout" {
   let path = @pathx.Relative("src/main.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let selected = test_modified_change(path)
   let docs = owned_state().docs.copy()
   docs[file] = {
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt
@@
 
 ///|
 /// A file below the shared test checkout, named the way the dock keys it.
-fn test_file(path : String) -> @common.Uri raise {
+fn test_file_renamed(path : String) -> @common.Uri raise {
   test_ctx().test_resource("/work/" + path)
 }
 
@@
     owned_state(),
     {
       ..test_ctx(),
-      open_files: [test_file("a.mbt")],
+      open_files: [test_file_renamed("a.mbt")],
-      active_file: Some(test_file("a.mbt")),
+      active_file: Some(test_file_renamed("a.mbt")),
     },
-    test_file("a.mbt"),
+    test_file_renamed("a.mbt"),
     name="a.mbt",
     range=None,
     had_active=false,
   )
   assert_true(
-    one.docs.get(test_file("a.mbt")) is Some({ state: TabLoading, .. }),
+    one.docs.get(test_file_renamed("a.mbt")) is Some({ state: TabLoading, .. }),
   )
   // A plain re-open of a loaded document keeps the cached state — the show
   // command redraws from the table, never waiting on a re-read's reply.
   let docs = one.docs.copy()
-  docs[test_file("a.mbt")] = loaded_doc("a.mbt")
+  docs[test_file_renamed("a.mbt")] = loaded_doc("a.mbt")
   let (_, again) = open_document(
     emit,
     { ..one, docs, },
     {
       ..test_ctx(),
-      open_files: [test_file("a.mbt")],
+      open_files: [test_file_renamed("a.mbt")],
-      active_file: Some(test_file("a.mbt")),
+      active_file: Some(test_file_renamed("a.mbt")),
     },
-    test_file("a.mbt"),
+    test_file_renamed("a.mbt"),
     name="a.mbt",
     range=None,
     had_active=true,
   )
   assert_true(
-    again.docs.get(test_file("a.mbt")) is Some({ state: TabLoaded(..), .. }),
+    again.docs.get(test_file_renamed("a.mbt")) is Some({ state: TabLoaded(..), .. }),
   )
 }
 
@@
 test "changed-file review fences paired replies and Content opens retain comparison" {
   let emit = test_emit()
   let path = @pathx.Relative("a.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let ctx = { ..test_ctx(), open_files: [file], active_file: Some(file), }
   let change : ChangedFile = {
     path,
@@
 ///|
 test "reselecting a settled review keeps its cached comparison generation" {
   let path = @pathx.Relative("settled.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let change = test_modified_change(path)
   let doc = {
     ..loaded_doc(path.0),
@@
 test "changed-file review preserves a stale cached working document until reload" {
   let emit = test_emit()
   let path = @pathx.Relative("stale.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let docs : Map[@common.Uri, Doc] = Map([])
   docs[file] = { ..loaded_doc("stale.mbt"), stale: true, }
   let ctx = { ..test_ctx(), open_files: [file], active_file: Some(file), }
@@
 test "review failures settle precisely and missing rename sources stay unavailable" {
   let emit = test_emit()
   let path = @pathx.Relative("new.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let ctx = { ..test_ctx(), open_files: [file], active_file: Some(file), }
   let rename : ChangedFile = {
     path,
@@
   let deleted_path = @pathx.Relative("gone.mbt")
   let ctx = {
     ..test_ctx(),
-    open_files: [test_file(deleted_path.0)],
+    open_files: [test_file_renamed(deleted_path.0)],
-    active_file: Some(test_file(deleted_path.0)),
+    active_file: Some(test_file_renamed(deleted_path.0)),
   }
   let deleted : ChangedFile = {
     path: deleted_path,
@@
     had_active=false,
   )
   assert_true(
-    loading.docs.get(test_file(deleted_path.0))
+    loading.docs.get(test_file_renamed(deleted_path.0))
     is Some(
       {
         state: TabDeleted,
@@
     GitOriginalLoaded(
       owner=ctx.owner.host().unwrap(),
       background=false,
-      path=test_file(deleted_path.0),
+      path=test_file_renamed(deleted_path.0),
       generation=1,
       original=@protocol.OriginalContent("removed source"),
     ),
@@
     ctx,
   )
   assert_true(
-    preview.docs.get(test_file(deleted_path.0))
+    preview.docs.get(test_file_renamed(deleted_path.0))
     is Some(
       {
         state: TabDeleted,
@@
       }
     ),
   )
-  guard preview.docs.get(test_file(deleted_path.0)) is Some(deleted_preview) else {
+  guard preview.docs.get(test_file_renamed(deleted_path.0)) is Some(deleted_preview) else {
     fail("deleted review was missing")
   }
   assert_eq(deleted_preview.diff_content(), Some(("removed source", "")))
@@
   assert_true(deleted_preview.review is Some({ view_mode: ReviewDiff, .. }))
   let (_, source) = update(emit, ToggleReviewDiff, preview, ctx)
   assert_true(
-    source.docs.get(test_file(deleted_path.0))
+    source.docs.get(test_file_renamed(deleted_path.0))
     is Some({ review: Some({ view_mode: ReviewSource, .. }), .. }),
   )
   let (_, full_diff_again) = update(emit, ToggleReviewDiff, source, ctx)
   assert_true(
-    full_diff_again.docs.get(test_file(deleted_path.0))
+    full_diff_again.docs.get(test_file_renamed(deleted_path.0))
     is Some({ review: Some({ view_mode: ReviewDiff, .. }), .. }),
   )
 
@@
         emit,
         prior,
         ctx,
-        test_file(deleted_path.0),
+        test_file_renamed(deleted_path.0),
         name="gone.mbt",
         range~,
         had_active=true,
       )
       assert_true(
-        reopened.docs.get(test_file(deleted_path.0))
+        reopened.docs.get(test_file_renamed(deleted_path.0))
         is Some({ state: TabDeleted, review: Some(review), .. }) &&
         review.view_mode is ReviewDiff,
       )
@@
   let live_path = @pathx.Relative("live.mbt")
   let live_ctx = {
     ..ctx,
-    open_files: [test_file(live_path.0)],
+    open_files: [test_file_renamed(live_path.0)],
-    active_file: Some(test_file(live_path.0)),
+    active_file: Some(test_file_renamed(live_path.0)),
   }
   let live = {
     ..deleted,
@@
     GitOriginalLoaded(
       owner=live_ctx.owner.host().unwrap(),
       background=false,
-      path=test_file(live_path.0),
+      path=test_file_renamed(live_path.0),
       generation=1,
       original=@protocol.Missing,
     ),
@@
     FileLoaded(
       owner=live_ctx.owner,
       epoch=0,
-      path=test_file(live_path.0),
+      path=test_file_renamed(live_path.0),
       name="live.mbt",
       file=Content(content="new", sig="2:3"),
       file_link_generation=None,
@@
     live_ctx,
   )
   assert_true(
-    loaded.docs.get(test_file(live_path.0))
+    loaded.docs.get(test_file_renamed(live_path.0))
     is Some(
       {
         state: TabLoaded(content="new", ..),
@@
       }
     ),
   )
-  guard loaded.docs.get(test_file(live_path.0)) is Some(added_preview) else {
+  guard loaded.docs.get(test_file_renamed(live_path.0)) is Some(added_preview) else {
     fail("added review was missing")
   }
   assert_eq(added_preview.diff_content(), Some(("", "new")))
@@
   let narrow : Ctx = {
     ..test_ctx(),
     narrow: true,
-    open_files: [test_file("a.mbt")],
+    open_files: [test_file_renamed("a.mbt")],
-    active_file: Some(test_file("a.mbt")),
+    active_file: Some(test_file_renamed("a.mbt")),
   }
   let start = { ..owned_state(), tree_open: true, }
   // A fresh open drills down into the viewer.
@@
     emit,
     start,
     narrow,
-    test_file("a.mbt"),
+    test_file_renamed("a.mbt"),
     name="a.mbt",
     range=None,
     had_active=false,
@@
   let (_, tree) = update(emit, ToggleTree, opened, narrow)
   assert_true(tree.tree_open)
   let docs : Map[@common.Uri, Doc] = Map([])
-  docs[test_file("a.mbt")] = loaded_doc("a.mbt")
+  docs[test_file_renamed("a.mbt")] = loaded_doc("a.mbt")
   let (_, activated) = activate(
     emit,
     { ..tree, docs, },
     narrow,
-    test_file("a.mbt"),
+    test_file_renamed("a.mbt"),
   )
   assert_false(activated.tree_open)
   // The wide layout keeps the pane open alongside the viewer.
@@
     start,
     {
       ..test_ctx(),
-      open_files: [test_file("b.mbt")],
+      open_files: [test_file_renamed("b.mbt")],
-      active_file: Some(test_file("b.mbt")),
+      active_file: Some(test_file_renamed("b.mbt")),
     },
-    test_file("b.mbt"),
+    test_file_renamed("b.mbt"),
     name="b.mbt",
     range=None,
     had_active=false,
@@
     emit,
     owned_state(),
     test_ctx(),
-    test_file("gone.mbt"),
+    test_file_renamed("gone.mbt"),
   )
   assert_true(same == owned_state())
 }
@@
 test "close_document preserves the manual tree preference on the last one" {
   let emit = test_emit()
   let docs : Map[@common.Uri, Doc] = Map([])
-  docs[test_file("a.mbt")] = loaded_doc("a.mbt")
+  docs[test_file_renamed("a.mbt")] = loaded_doc("a.mbt")
-  docs[test_file("b.mbt")] = loaded_doc("b.mbt")
+  docs[test_file_renamed("b.mbt")] = loaded_doc("b.mbt")
   let state = { ..owned_state(), docs, tree_open: false, }
   // Closing the active document with a neighbor left: the entry goes, the
   // tree stays as it was.
@@
     emit,
     state,
     test_ctx(),
-    test_file("a.mbt"),
+    test_file_renamed("a.mbt"),
-    next=Some(test_file("b.mbt")),
+    next=Some(test_file_renamed("b.mbt")),
     was_active=true,
   )
-  assert_false(one.docs.contains(test_file("a.mbt")))
+  assert_false(one.docs.contains(test_file_renamed("a.mbt")))
-  assert_true(one.docs.contains(test_file("b.mbt")))
+  assert_true(one.docs.contains(test_file_renamed("b.mbt")))
   assert_false(one.tree_open)
   // Closing the last document shows the picker without changing preference.
   let (_, last) = close_document(
@@
     emit,
     one,
     test_ctx(),
-    test_file("b.mbt"),
+    test_file_renamed("b.mbt"),
     next=None,
     was_active=true,
   )
@@
 test "FileLoaded settles content into its document, active or not" {
   let emit = test_emit()
   let docs : Map[@common.Uri, Doc] = Map([])
-  docs[test_file("a.mbt")] = {
+  docs[test_file_renamed("a.mbt")] = {
     name: "a.mbt",
     state: TabLoading,
     review: None,
     stale: false,
   }
-  docs[test_file("b.mbt")] = loaded_doc("b.mbt")
+  docs[test_file_renamed("b.mbt")] = loaded_doc("b.mbt")
   let state = { ..owned_state(), docs, }
   let ctx = {
     ..test_ctx(),
-    open_files: [test_file("a.mbt"), test_file("b.mbt")],
+    open_files: [test_file_renamed("a.mbt"), test_file_renamed("b.mbt")],
-    active_file: Some(test_file("b.mbt")),
+    active_file: Some(test_file_renamed("b.mbt")),
   }
   let (_, next) = update(
     emit,
@@
     FileLoaded(
       owner=test_ctx().owner,
       epoch=0,
-      path=test_file("a.mbt"),
+      path=test_file_renamed("a.mbt"),
       name="a.mbt",
       file=Content(content="fn main {}", sig="2:0"),
       file_link_generation=None,
@@
     ctx,
   )
   assert_true(
-    next.docs.get(test_file("a.mbt"))
+    next.docs.get(test_file_renamed("a.mbt"))
     is Some({ state: TabLoaded(content="fn main {}", ..), .. }),
   )
   // A reply for a closed document (or another conversation) is dropped.
@@
     FileLoaded(
       owner=test_ctx().owner,
       epoch=0,
-      path=test_file("gone.mbt"),
+      path=test_file_renamed("gone.mbt"),
       name="gone.mbt",
       file=Content(content="", sig="2:0"),
       file_link_generation=None,
@@
         session: "desktop-test",
       }),
       epoch=0,
-      path=test_file("a.mbt"),
+      path=test_file_renamed("a.mbt"),
       name="a.mbt",
       file=Binary,
       file_link_generation=None,
@@
     ctx,
   )
   assert_true(
-    other.docs.get(test_file("a.mbt")) is Some({ state: TabLoaded(..), .. }),
+    other.docs.get(test_file_renamed("a.mbt")) is Some({ state: TabLoaded(..), .. }),
   )
   // A stat issued before a placement/reroot boundary is stale even when the
   // same conversation is active again. It cannot invalidate a newer live doc.
@@
       recheck_diagnostics=true,
       owner=test_ctx().owner.host().unwrap(),
       epoch=1,
-      stats=[{ path: test_file("a.mbt"), signature: Missing, }],
+      stats=[{ path: test_file_renamed("a.mbt"), signature: Missing, }],
     ),
     epoch_state,
     ctx,
@@
     FileLoaded(
       owner=test_ctx().owner,
       epoch=1,
-      path=test_file("a.mbt"),
+      path=test_file_renamed("a.mbt"),
       name="a.mbt",
       file=Content(content="stale", sig="9:0"),
       file_link_generation=None,
@@
 test "sync re-roots the document table from the dock's projection" {
   let emit = test_emit()
   let docs : Map[@common.Uri, Doc] = Map([])
-  docs[test_file("old.mbt")] = loaded_doc("old.mbt")
+  docs[test_file_renamed("old.mbt")] = loaded_doc("old.mbt")
   let state = { ..owned_state(), docs, tree_open: false, }
   // Switch conversations: the dock restored a two-file strip for the new
   // one; the table re-seeds from it, identities only.
@@
       channel: @interop.ChannelId::Remote("other"),
       session: "desktop-test",
     }),
-    open_files: [test_file("a.mbt"), test_file("b.mbt")],
+    open_files: [test_file_renamed("a.mbt"), test_file_renamed("b.mbt")],
-    active_file: Some(test_file("a.mbt")),
+    active_file: Some(test_file_renamed("a.mbt")),
   }
   let (rerooted, _) = sync(emit, state, other)
   assert_true(
     rerooted.owner is Some(@interop.Host({ channel: Remote("other"), .. })),
   )
-  assert_false(rerooted.docs.contains(test_file("old.mbt")))
+  assert_false(rerooted.docs.contains(test_file_renamed("old.mbt")))
   assert_true(
-    rerooted.docs.get(test_file("a.mbt")) is Some({ state: TabLoading, .. }),
+    rerooted.docs.get(test_file_renamed("a.mbt")) is Some({ state: TabLoading, .. }),
   )
   assert_true(
-    rerooted.docs.get(test_file("b.mbt")) is Some({ state: TabLoading, .. }),
+    rerooted.docs.get(test_file_renamed("b.mbt")) is Some({ state: TabLoading, .. }),
   )
   // The pane-visibility preference follows the panel, not the conversation.
   assert_false(rerooted.tree_open)
@@
 test "a closed panel still re-roots when the conversation switches" {
   let emit = test_emit()
   let docs : Map[@common.Uri, Doc] = Map([])
-  docs[test_file("a.mbt")] = loaded_doc("a.mbt")
+  docs[test_file_renamed("a.mbt")] = loaded_doc("a.mbt")
   let state = {
     ..owned_state(),
     docs,
@@
   let back : Ctx = {
     ..test_ctx(),
     panel_open: false,
-    open_files: [test_file("a.mbt")],
+    open_files: [test_file_renamed("a.mbt")],
-    active_file: Some(test_file("a.mbt")),
+    active_file: Some(test_file_renamed("a.mbt")),
   }
   let (restored, _) = sync(emit, parked, back)
   assert_eq(restored.file_link_generation, 6)
   assert_true(
-    restored.docs.get(test_file("a.mbt")) is Some({ state: TabLoading, .. }),
+    restored.docs.get(test_file_renamed("a.mbt")) is Some({ state: TabLoading, .. }),
   )
   assert_true(
     restored.watching
@@
   let emit = test_emit()
   let present = test_ctx().test_worktree("wt")
   let docs : Map[@common.Uri, Doc] = Map([])
-  docs[test_file("a.mbt")] = loaded_doc("a.mbt")
+  docs[test_file_renamed("a.mbt")] = loaded_doc("a.mbt")
-  docs[test_file("b.mbt")] = {
+  docs[test_file_renamed("b.mbt")] = {
     ..loaded_doc("b.mbt"),
     review: Some({
       generation: 4,
@@
     placement: Some(
       @interop.MissingWorktree(project=present.test_root(), name="wt"),
     ),
-    open_files: [test_file("a.mbt"), test_file("b.mbt")],
+    open_files: [test_file_renamed("a.mbt"), test_file_renamed("b.mbt")],
-    active_file: Some(test_file("a.mbt")),
+    active_file: Some(test_file_renamed("a.mbt")),
   }
   let (parked, _) = sync(emit, state, missing)
   assert_true(parked.owner == Some(present.owner))
   assert_true(
-    parked.docs.get(test_file("a.mbt")) is Some({ state: TabLoaded(..), .. }),
+    parked.docs.get(test_file_renamed("a.mbt")) is Some({ state: TabLoaded(..), .. }),
   )
   assert_true(parked.children.is_empty())
   assert_true(parked.index is IndexEmpty)
@@
     emit,
     parked,
     missing,
-    test_file("new.mbt"),
+    test_file_renamed("new.mbt"),
     name="new.mbt",
     range=None,
     had_active=true,
@@
     emit,
     parked,
     missing,
-    test_file("a.mbt"),
+    test_file_renamed("a.mbt"),
   )
   assert_true(direct_activation == parked)
   let (_, direct_toggle) = panel_toggle_cmds(
@@
     emit,
     parked,
     missing,
-    test_file("a.mbt"),
+    test_file_renamed("a.mbt"),
-    next=Some(test_file("b.mbt")),
+    next=Some(test_file_renamed("b.mbt")),
     was_active=true,
   )
-  assert_false(direct_close.docs.contains(test_file("a.mbt")))
+  assert_false(direct_close.docs.contains(test_file_renamed("a.mbt")))
   assert_true(
-    direct_close.docs.get(test_file("b.mbt")) ==
+    direct_close.docs.get(test_file_renamed("b.mbt")) ==
-    parked.docs.get(test_file("b.mbt")),
+    parked.docs.get(test_file_renamed("b.mbt")),
   )
   assert_eq(direct_close.review_generation, parked.review_generation)
   let (_, selected) = update(
@@
   assert_true(still_parked == parked)
   let restored_ctx = {
     ..present,
-    open_files: [test_file("a.mbt")],
+    open_files: [test_file_renamed("a.mbt")],
-    active_file: Some(test_file("a.mbt")),
+    active_file: Some(test_file_renamed("a.mbt")),
   }
   let (restored, _) = sync(emit, parked, restored_ctx)
   assert_true(
-    restored.docs.get(test_file("a.mbt"))
+    restored.docs.get(test_file_renamed("a.mbt"))
     is Some({ state: TabLoaded(..), stale: true, .. }),
   )
   assert_false(restored.placement.is_parked())
@@
 test "opening after a hidden checkout repair restores a stale reviewed tab" {
   let emit = test_emit()
   let path = @pathx.Relative("reviewed.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let change = test_modified_change(path)
   let docs : Map[@common.Uri, Doc] = Map([])
   docs[file] = {
@@
 test "an unresolved gap retains identity so same-checkout recovery restores" {
   let emit = test_emit()
   let path = @pathx.Relative("reviewed.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let docs : Map[@common.Uri, Doc] = Map([])
   docs[file] = {
     ..loaded_doc("reviewed.mbt"),
@@
 test "recovery from an unresolved gap into another checkout reroots" {
   let emit = test_emit()
   let path = @pathx.Relative("reviewed.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let docs : Map[@common.Uri, Doc] = Map([])
   docs[file] = {
     ..loaded_doc("reviewed.mbt"),
@@
   let emit = test_emit()
   let present = test_ctx().test_worktree("wt")
   let path = @pathx.Relative("reviewed.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let change : ChangedFile = {
     path,
     original_path: None,
@@
   let emit = test_emit()
   let present = test_ctx().test_worktree("wt")
   let path = @pathx.Relative("reviewed.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let change : ChangedFile = {
     path,
     original_path: None,
@@
   let emit = test_emit()
   let present = test_ctx()
   let path = @pathx.Relative("slow.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let change : ChangedFile = {
     path,
     original_path: None,
@@
   let emit = test_emit()
   let present = test_ctx()
   let docs : Map[@common.Uri, Doc] = Map([])
-  docs[test_file("a.mbt")] = loaded_doc("a.mbt")
+  docs[test_file_renamed("a.mbt")] = loaded_doc("a.mbt")
   let state = {
     ..owned_state(),
     docs,
@@
 test "showing a hidden explorer refreshes Changes before polling resumes" {
   let hidden_ctx = {
     ..test_ctx(),
-    active_file: Some(test_file("src/main.mbt")),
+    active_file: Some(test_file_renamed("src/main.mbt")),
   }
   let state = {
     ..owned_state(),
@@
 ///|
 test "a settled Changes snapshot re-stats loaded reviews whose rows disappeared" {
   let path = @pathx.Relative("src/committed.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let docs : Map[@common.Uri, Doc] = Map([])
   docs[file] = {
     ..loaded_doc(path.0),
@@
 ///|
 test "a review that becomes a symlink clears its cached regular-file source" {
   let path = @pathx.Relative("src/replaced.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let selected = test_modified_change(path)
   let symlink = { ..selected, kind: ChangeSymlink, }
   let docs : Map[@common.Uri, Doc] = Map([])
@@
 ///|
 test "a disappearing review row hands an active reload to an ordinary read" {
   let path = @pathx.Relative("src/committed.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let docs : Map[@common.Uri, Doc] = Map([])
   docs[file] = {
     ..loaded_doc(path.0),
@@
 ///|
 test "a newer review reload fences an older working-tree reply" {
   let path = @pathx.Relative("src/racing.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let docs : Map[@common.Uri, Doc] = Map([])
   docs[file] = {
     ..loaded_doc(path.0),
@@
 ///|
 test "only a final Changes snapshot reconciles reviews and moved HEAD refreshes survivors" {
   let path = @pathx.Relative("src/partial.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let docs : Map[@common.Uri, Doc] = Map([])
   docs[file] = {
     ..loaded_doc(path.0),
@@
 ///|
 test "HEAD refresh restarts the generation-fenced working-tree read" {
   let path = @pathx.Relative("src/paired.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let change = test_modified_change(path)
   let docs : Map[@common.Uri, Doc] = Map([])
   docs[file] = {
@@
 ///|
 test "legacy Changes replies without HEAD refresh baseline-bearing reviews" {
   let path = @pathx.Relative("src/legacy-host.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let change = test_modified_change(path)
   let docs : Map[@common.Uri, Doc] = Map([])
   docs[file] = {
@@
 ///|
 test "unborn repository polls do not churn untracked reviews" {
   let path = @pathx.Relative("new.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let change : ChangedFile = {
     path,
     original_path: None,
@@
 ///|
 test "legacy HEAD omission refreshes a missing baseline once tracking is proven" {
   let path = @pathx.Relative("recreated.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let untracked : ChangedFile = {
     path,
     original_path: None,
@@
 ///|
 test "Changes reconciliation preserves the selected duplicate-path row" {
   let path = @pathx.Relative("recreated.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let deleted : ChangedFile = {
     path,
     original_path: None,
@@
 ///|
 test "moved HEAD normalizes reviewed tabs across the working-file boundary" {
   let path = @pathx.Relative("src/crossing.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let ctx = { ..test_ctx(), open_files: [file], active_file: Some(file), }
   let deleted : ChangedFile = {
     path,
@@
 ///|
 test "a changed rename source refreshes its review without moving HEAD" {
   let path = @pathx.Relative("src/new.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let previous : ChangedFile = {
     path,
     original_path: Some(@pathx.Relative("src/old.mbt")),
@@
     emit,
     ChangesPollDue,
     { ..state, tree_open: false, },
-    { ..test_ctx(), active_file: Some(test_file("open.mbt")), },
+    { ..test_ctx(), active_file: Some(test_file_renamed("open.mbt")), },
   )
   assert_true(hidden_tree == { ..state, tree_open: false, })
   let (_, files_mode) = update(
@@
   // An open changed-file review consumes the inventory even off-screen, so it
   // keeps the fallback alive on its own.
   let path = @pathx.Relative("src/reviewed.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let docs : Map[@common.Uri, Doc] = Map([])
   docs[file] = {
     ..loaded_doc(path.0),
@@
   let emit = test_emit()
   let present = test_ctx().test_worktree("wt")
   let path = @pathx.Relative("reviewed.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let change = test_modified_change(path)
   let docs : Map[@common.Uri, Doc] = Map([])
   docs[file] = {
@@
 ///|
 test "hidden explorer keeps Git refresh live for an open review" {
   let path = @pathx.Relative("src/reviewed.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let docs : Map[@common.Uri, Doc] = Map([])
   docs[file] = {
     ..loaded_doc(path.0),
@@
 ///|
 test "sync refreshes a hidden review after its workspace watch was parked" {
   let path = @pathx.Relative("src/reviewed.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let docs : Map[@common.Uri, Doc] = Map([])
   docs[file] = {
     ..loaded_doc(path.0),
@@
 ///|
 test "a hidden review accepts its file-only watch without a refresh loop" {
   let path = @pathx.Relative("src/reviewed.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let docs : Map[@common.Uri, Doc] = Map([])
   docs[file] = {
     ..loaded_doc(path.0),
@@
 test "StatsLoaded marks deletions, reloads the active change, stales the rest" {
   let emit = test_emit()
   let docs : Map[@common.Uri, Doc] = Map([])
-  docs[test_file("a.mbt")] = loaded_doc("a.mbt")
+  docs[test_file_renamed("a.mbt")] = loaded_doc("a.mbt")
-  docs[test_file("b.mbt")] = loaded_doc("b.mbt")
+  docs[test_file_renamed("b.mbt")] = loaded_doc("b.mbt")
-  docs[test_file("c.mbt")] = loaded_doc("c.mbt")
+  docs[test_file_renamed("c.mbt")] = loaded_doc("c.mbt")
   let state = { ..owned_state(), docs, }
   let ctx = {
     ..test_ctx(),
-    open_files: [test_file("a.mbt"), test_file("b.mbt"), test_file("c.mbt")],
+    open_files: [test_file_renamed("a.mbt"), test_file_renamed("b.mbt"), test_file_renamed("c.mbt")],
-    active_file: Some(test_file("a.mbt")),
+    active_file: Some(test_file_renamed("a.mbt")),
   }
   let (_, next) = update(
     emit,
@@
       stats=[
         // The active file changed: reloaded eagerly, so its document stays
         // loaded (the baseline the scroll-keeping reload compares against).
-        { path: test_file("a.mbt"), signature: Present("9:0"), },
+        { path: test_file_renamed("a.mbt"), signature: Present("9:0"), },
         // A background file changed: only marked stale.
-        { path: test_file("b.mbt"), signature: Present("9:0"), },
+        { path: test_file_renamed("b.mbt"), signature: Present("9:0"), },
         // Deleted: the document flips to the deleted notice state.
-        { path: test_file("c.mbt"), signature: Missing, },
+        { path: test_file_renamed("c.mbt"), signature: Missing, },
       ],
     ),
     state,
@@
     ctx,
   )
   assert_true(
-    next.docs.get(test_file("a.mbt"))
+    next.docs.get(test_file_renamed("a.mbt"))
     is Some({ state: TabLoaded(..), stale: false, .. }),
   )
-  assert_true(next.docs.get(test_file("b.mbt")) is Some({ stale: true, .. }))
+  assert_true(next.docs.get(test_file_renamed("b.mbt")) is Some({ stale: true, .. }))
   assert_true(
-    next.docs.get(test_file("c.mbt")) is Some({ state: TabDeleted, .. }),
+    next.docs.get(test_file_renamed("c.mbt")) is Some({ state: TabDeleted, .. }),
   )
   // An unchanged signature on a background file still compares against the
   // loaded baseline.
   let solo : Map[@common.Uri, Doc] = Map([])
-  solo[test_file("b.mbt")] = loaded_doc("b.mbt")
+  solo[test_file_renamed("b.mbt")] = loaded_doc("b.mbt")
   let (_, same) = update(
     emit,
     StatsLoaded(
@@
       recheck_diagnostics=true,
       owner=test_ctx().owner.host().unwrap(),
       epoch=0,
-      stats=[{ path: test_file("b.mbt"), signature: Present("9:0"), }],
+      stats=[{ path: test_file_renamed("b.mbt"), signature: Present("9:0"), }],
     ),
     { ..next, docs: solo, },
     { ..ctx, active_file: None, },
   )
   assert_true(
-    same.docs.get(test_file("b.mbt"))
+    same.docs.get(test_file_renamed("b.mbt"))
     is Some({ state: TabLoaded(sig="1:0", ..), stale: true, .. }),
   )
   // A watcher proving a previously unreadable review path exists makes a
@@
   // background tab retryable on activation.
   let failed_path = @pathx.Relative("failed.mbt")
   let failed_docs : Map[@common.Uri, Doc] = Map([])
-  failed_docs[test_file(failed_path.0)] = {
+  failed_docs[test_file_renamed(failed_path.0)] = {
     name: "failed.mbt",
     state: TabReadFailed("temporary failure"),
     review: Some({
@@
       recheck_diagnostics=true,
       owner=test_ctx().owner.host().unwrap(),
       epoch=0,
-      stats=[{ path: test_file(failed_path.0), signature: Present("10:0"), }],
+      stats=[{ path: test_file_renamed(failed_path.0), signature: Present("10:0"), }],
     ),
     { ..owned_state(), docs: failed_docs, },
     { ..ctx, active_file: None, },
   )
   assert_true(
-    retryable.docs.get(test_file(failed_path.0))
+    retryable.docs.get(test_file_renamed(failed_path.0))
     is Some({ state: TabReadFailed(_), review: Some(_), stale: true, .. }),
   )
   // A reply from another conversation is dropped.
@@
         session: "desktop-test",
       },
       epoch=0,
-      stats=[{ path: test_file("a.mbt"), signature: Missing, }],
+      stats=[{ path: test_file_renamed("a.mbt"), signature: Missing, }],
     ),
     state,
     ctx,
   )
   assert_true(
-    other.docs.get(test_file("a.mbt")) is Some({ state: TabLoaded(..), .. }),
+    other.docs.get(test_file_renamed("a.mbt")) is Some({ state: TabLoaded(..), .. }),
   )
 }
 
@@
     kind: ChangeDeleted,
   }
   let docs : Map[@common.Uri, Doc] = Map([])
-  docs[test_file("a.mbt")] = loaded_doc("a.mbt")
+  docs[test_file_renamed("a.mbt")] = loaded_doc("a.mbt")
-  docs[test_file("b.mbt")] = {
+  docs[test_file_renamed("b.mbt")] = {
     name: "b.mbt",
     state: TabLoading,
     review: None,
     stale: false,
   }
-  docs[test_file("c.mbt")] = {
+  docs[test_file_renamed("c.mbt")] = {
     name: "c.mbt",
     state: TabDeleted,
     review: None,
     stale: false,
   }
-  docs[test_file(gone_path.0)] = {
+  docs[test_file_renamed(gone_path.0)] = {
     name: "gone.mbt",
     state: TabDeleted,
     review: Some({
@@
     }),
     stale: false,
   }
-  docs[test_file(reviewed_path.0)] = {
+  docs[test_file_renamed(reviewed_path.0)] = {
     ..loaded_doc("reviewed.mbt"),
     review: Some({
       generation: 7,
@@
   let ctx = {
     ..test_ctx(),
     open_files: [
-      test_file("a.mbt"),
+      test_file_renamed("a.mbt"),
-      test_file("b.mbt"),
+      test_file_renamed("b.mbt"),
-      test_file("c.mbt"),
+      test_file_renamed("c.mbt"),
-      test_file(gone_path.0),
+      test_file_renamed(gone_path.0),
-      test_file(reviewed_path.0),
+      test_file_renamed(reviewed_path.0),
     ],
-    active_file: Some(test_file("a.mbt")),
+    active_file: Some(test_file_renamed("a.mbt")),
   }
   let failed : @protocol.FileSignature = Failed("permission denied")
   let (_, next) = update(
@@
       owner=test_ctx().owner.host().unwrap(),
       epoch=0,
       stats=[
-        { path: test_file("a.mbt"), signature: failed, },
+        { path: test_file_renamed("a.mbt"), signature: failed, },
-        { path: test_file("b.mbt"), signature: failed, },
+        { path: test_file_renamed("b.mbt"), signature: failed, },
-        { path: test_file("c.mbt"), signature: failed, },
+        { path: test_file_renamed("c.mbt"), signature: failed, },
-        { path: test_file(gone_path.0), signature: failed, },
+        { path: test_file_renamed(gone_path.0), signature: failed, },
-        { path: test_file(reviewed_path.0), signature: failed, },
+        { path: test_file_renamed(reviewed_path.0), signature: failed, },
       ],
     ),
     { ..owned_state(), docs, review_generation: 7, },
@@
   // A loaded document, active or not, shows the failure where the deleted
   // notice would otherwise have appeared.
   assert_true(
-    next.docs.get(test_file("a.mbt"))
+    next.docs.get(test_file_renamed("a.mbt"))
     is Some({ state: TabReadFailed("permission denied"), stale: false, .. }),
   )
   // A read in flight settles the document itself.
   assert_true(
-    next.docs.get(test_file("b.mbt")) is Some({ state: TabLoading, .. }),
+    next.docs.get(test_file_renamed("b.mbt")) is Some({ state: TabLoading, .. }),
   )
   // Something the host cannot inspect sits where a deleted file was: that is
   // a failed read of a present path, not a confirmed deletion.
   assert_true(
-    next.docs.get(test_file("c.mbt"))
+    next.docs.get(test_file_renamed("c.mbt"))
     is Some({ state: TabReadFailed("permission denied"), .. }),
   )
   // A selected deletion row keeps its HEAD preview: the object at the path
   // belongs to a separate untracked row.
   assert_true(
-    next.docs.get(test_file(gone_path.0))
+    next.docs.get(test_file_renamed(gone_path.0))
     is Some(
       { state: TabDeleted, review: Some({ working_generation: 3, .. }), .. }
     ),
@@
   // A reviewed working file fences the tagged read that may still be in
   // flight, like a deletion does.
   assert_true(
-    next.docs.get(test_file(reviewed_path.0))
+    next.docs.get(test_file_renamed(reviewed_path.0))
     is Some(
       {
         state: TabReadFailed("permission denied"),
@@
 test "StatsLoaded preserves a settled HEAD preview when its active file disappears" {
   let emit = test_emit()
   let path = @pathx.Relative("reviewed.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let doc = {
     ..loaded_doc("reviewed.mbt"),
     review: Some({
@@
 test "a deleted document whose file reappears reloads on the next stats" {
   let emit = test_emit()
   let docs : Map[@common.Uri, Doc] = Map([])
-  docs[test_file("a.mbt")] = {
+  docs[test_file_renamed("a.mbt")] = {
     name: "a.mbt",
     state: TabDeleted,
     review: None,
@@
       recheck_diagnostics=true,
       owner=test_ctx().owner.host().unwrap(),
       epoch=0,
-      stats=[{ path: test_file("a.mbt"), signature: Present("3:0"), }],
+      stats=[{ path: test_file_renamed("a.mbt"), signature: Present("3:0"), }],
     ),
     state,
-    { ..test_ctx(), open_files: [test_file("a.mbt")], },
+    { ..test_ctx(), open_files: [test_file_renamed("a.mbt")], },
   )
   // Background reappearance: stale, reloaded on activation.
   assert_true(
-    next.docs.get(test_file("a.mbt"))
+    next.docs.get(test_file_renamed("a.mbt"))
     is Some({ state: TabDeleted, stale: true, .. }),
   )
 }
@@
 test "a selected deletion hands a clean restoration to an ordinary read" {
   let emit = test_emit()
   let path = @pathx.Relative("recreated.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let deleted : ChangedFile = {
     path,
     original_path: None,
@@
 test "a vanished review retries a failed ordinary read" {
   let emit = test_emit()
   let path = @pathx.Relative("committed.mbt")
-  let file = test_file(path.0)
+  let file = test_file_renamed(path.0)
   let docs : Map[@common.Uri, Doc] = Map([])
   docs[file] = {
     name: "committed.mbt",
@@
   let ctx = {
     ..test_ctx(),
     open_files: [
-      test_file("src/main.mbt"),
+      test_file_renamed("src/main.mbt"),
-      test_file("node_modules/pkg/index.js"),
+      test_file_renamed("node_modules/pkg/index.js"),
     ],
   }
   guard state.watched_paths(ctx) is Some(watched) else {
@@
   let attached_generation = watched.watch_generation
   // Opening a file or expanding a directory replaces the same conversation's
   // watcher with the new exact selection.
-  let selected_ctx = { ..test_ctx(), open_files: [test_file("a.mbt")], }
+  let selected_ctx = { ..test_ctx(), open_files: [test_file_renamed("a.mbt")], }
   let selected = { ..watched, expanded: [Relative("src")], }
   let (replaced, _) = sync(emit, selected, selected_ctx)
   assert_true(
@@
   let still_ctx = {
     ..test_ctx(),
     panel_open: false,
-    open_files: [test_file("a.mbt")],
+    open_files: [test_file_renamed("a.mbt")],
   }
   let closed = { ..picking, children: Map([]), loading: [], highlighted: None, }
   let (still, _) = sync(emit, closed, still_ctx)
@@
   // A real policy change starts one fresh concrete watcher generation.
   let retry_ctx = {
     ..ctx,
-    open_files: [test_file("node_modules/pkg/index.js")],
+    open_files: [test_file_renamed("node_modules/pkg/index.js")],
   }
   let (retried, _) = sync(emit, stopped, retry_ctx)
   assert_true(
*** End Patch
"" (escaped)
```
