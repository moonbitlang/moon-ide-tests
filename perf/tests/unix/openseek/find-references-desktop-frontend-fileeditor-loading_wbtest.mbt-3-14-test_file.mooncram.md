# openseek find-references test_file desktop/frontend/fileeditor/loading_wbtest.mbt:3:14

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' find-references 'test_file' --loc 'desktop/frontend/fileeditor/loading_wbtest.mbt:3:14' --target js --no-check
Found 250 references for symbol 'test_file':
e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\diff_provider_policy_wbtest.mbt:15:14-15:23:
   |   assert_true(initial.review_diff_ignore_tests)
   | 
   |   let path = @pathx.Relative("src/main.mbt")
15 |   let file = test_file(path.0)
   |              ^^^^^^^^^
   |   let selected = test_modified_change(path)
   |   let docs = owned_state().docs.copy()

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\diff_provider_policy_wbtest.mbt:76:14-76:23:
   | ///|
   | test "non-MoonBit review parks the last semantic review preference" {
   |   let path = @pathx.Relative("README.md")
76 |   let file = test_file(path.0)
   |              ^^^^^^^^^
   |   let selected = test_modified_change(path)
   |   let docs = owned_state().docs.copy()

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\excel_selection_copy_wbtest.mbt:121:14-121:23:
    | ///|
    | fn excel_copy_state() -> (State, Ctx, OfficeSelectionPreview) raise {
    |   let (state, ctx, _) = office_selection_fixture()
121 |   let path = test_file("budget.xlsx")
    |              ^^^^^^^^^
    |   let document : @office_viewer.RenderedDocument = {
    |     kind: Excel,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\explorer_search_wbtest.mbt:6:14-6:23:
  |   let ctx = test_ctx()
  |   guard ctx.root() is Some(root) else { fail("test checkout root expected") }
  |   let path = @pathx.Relative("src/main.mbt")
6 |   let file = test_file(path.0)
  |              ^^^^^^^^^
  |   let reply : @protocol.SearchTextReply = {
  |     root: root.path,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\files.mbt:497:7-497:16:
    |         session: "remote-test",
    |       }),
    |       0,
497 |       test_file("src/main.mbt"),
    |       ^^^^^^^^^
    |       "main.mbt",
    |       review_generation=7,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\files.mbt:517:13-517:22:
    |         message="file root moved to another host before file read"
    |       )
    |     ) &&
517 |     path == test_file("src/main.mbt"),
    |             ^^^^^^^^^
    |   )
    | }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\loading_wbtest.mbt:3:14-3:23:
  | ///|
  | test "ordinary retries without previewable content enter loading but successful refreshes retain content" {
3 |   let file = test_file("retry.txt")
  |              ^^^^^^^^^
  |   let ctx = { ..test_ctx(), open_files: [file], active_file: Some(file), }
  |   for previous in [TabBinary, TabOversized, TabReadFailed("failed")] {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\loading_wbtest.mbt:49:14-49:23:
   | ///|
   | test "ordinary retries preserve a review's visible or pending baseline" {
   |   let path = @pathx.Relative("retry.mbt")
49 |   let file = test_file(path.0)
   |              ^^^^^^^^^
   |   let ctx = { ..test_ctx(), open_files: [file], active_file: Some(file), }
   |   let original = reviewed_doc(

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\mbti_presentation_wbtest.mbt:4:14-4:23:
  | ///|
  | test "ordinary MBTI tabs default to source and toggle without replacing the document" {
  |   let path = @pathx.Relative("api/pkg.generated.mbti")
4 |   let file = test_file(path.0)
  |              ^^^^^^^^^
  |   let docs = owned_state().docs.copy()
  |   docs[file] = loaded_doc(path.0)

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\mbti_presentation_wbtest.mbt:37:14-37:23:
   | ///|
   | test "reviewed MBTI files keep source and reject the diagram toggle" {
   |   let path = @pathx.Relative("api/pkg.generated.mbti")
37 |   let file = test_file(path.0)
   |              ^^^^^^^^^
   |   let selected = test_modified_change(path)
   |   let docs = owned_state().docs.copy()

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\mbti_presentation_wbtest.mbt:63:14-63:23:
   | ///|
   | test "positioned MBTI opens use source and closing forgets the tab preference" {
   |   let path = @pathx.Relative("api/pkg.generated.mbti")
63 |   let file = test_file(path.0)
   |              ^^^^^^^^^
   |   let docs = owned_state().docs.copy()
   |   docs[file] = loaded_doc(path.0)

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\mbti_presentation_wbtest.mbt:109:14-109:23:
    | ///|
    | test "non-MBTI documents do not expose or accept MBTI presentation" {
    |   let path = @pathx.Relative("src/main.mbt")
109 |   let file = test_file(path.0)
    |              ^^^^^^^^^
    |   let docs = owned_state().docs.copy()
    |   docs[file] = loaded_doc(path.0)

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:5:8-5:17:
  | fn moon_mod_test_state() -> (State, Ctx, @pathx.Relative) raise {
  |   let path = @pathx.Relative("moon.mod")
  |   let docs = owned_state().docs.copy()
5 |   docs[test_file(path.0)] = loaded_doc(path.0)
  |        ^^^^^^^^^
  |   let state = { ..owned_state(), docs, }
  |   let ctx = {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:9:18-9:27:
  |   let state = { ..owned_state(), docs, }
  |   let ctx = {
  |     ..test_ctx(),
9 |     open_files: [test_file(path.0)],
  |                  ^^^^^^^^^
  |     active_file: Some(test_file(path.0)),
  |   }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:10:23-10:32:
   |   let ctx = {
   |     ..test_ctx(),
   |     open_files: [test_file(path.0)],
10 |     active_file: Some(test_file(path.0)),
   |                       ^^^^^^^^^
   |   }
   |   (state, ctx, path)

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:20:40-20:49:
   |   let (state, ctx, path) = moon_mod_test_state()
   |   assert_true(moon_mod_view_available(state, ctx))
   |   assert_false(uses_package_diagram_surface(state, ctx))
20 |   assert_true(state.moon_mod_view_mode(test_file(path.0)) is MoonModSource)
   |                                        ^^^^^^^^^
   | 
   |   let (source, _) = sync(test_emit(), state, ctx)

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:23:41-23:50:
   |   assert_true(state.moon_mod_view_mode(test_file(path.0)) is MoonModSource)
   | 
   |   let (source, _) = sync(test_emit(), state, ctx)
23 |   assert_true(source.package_graphs.get(test_file(path.0)) is None)
   |                                         ^^^^^^^^^
   |   assert_eq(source.package_graph_generation, 0)
   |   let (_, state) = update(

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:34:36-34:45:
   |   assert_true(uses_package_diagram_surface(state, ctx))
   | 
   |   let (loading, _) = sync(test_emit(), state, ctx)
34 |   guard loading.package_graphs.get(test_file(path.0))
   |                                    ^^^^^^^^^
   |     is Some(PackageGraphLoading(generation)) else {
   |     fail("expected the explicitly selected dependency graph request")

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:41:38-41:47:
   |   assert_eq(generation, 1)
   |   let (still_loading, _) = sync(test_emit(), loading, ctx)
   |   assert_true(
41 |     still_loading.package_graphs.get(test_file(path.0)) ==
   |                                      ^^^^^^^^^
   |     Some(PackageGraphLoading(generation)),
   |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:60:10-60:19:
   |   let stale = PackageGraphRequestLoaded(
   |     owner=ctx.owner.host().unwrap(),
   |     epoch=ctx.request_epoch,
60 |     path=test_file(path.0),
   |          ^^^^^^^^^
   |     generation=0,
   |     source="stale",

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:70:10-70:19:
   |   let wrong_owner = PackageGraphRequestLoaded(
   |     owner={ ..ctx.owner.host().unwrap(), session: "another-session", },
   |     epoch=ctx.request_epoch,
70 |     path=test_file(path.0),
   |          ^^^^^^^^^
   |     generation=1,
   |     source="wrong-owner",

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:79:10-79:19:
   |   let wrong_epoch = PackageGraphRequestLoaded(
   |     owner=ctx.owner.host().unwrap(),
   |     epoch=ctx.request_epoch + 1,
79 |     path=test_file(path.0),
   |          ^^^^^^^^^
   |     generation=1,
   |     source="wrong-epoch",

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:88:10-88:19:
   |   let wrong_path = PackageGraphRequestLoaded(
   |     owner=ctx.owner.host().unwrap(),
   |     epoch=ctx.request_epoch,
88 |     path=test_file("nested/moon.mod"),
   |          ^^^^^^^^^
   |     generation=1,
   |     source="wrong-path",

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:98:10-98:19:
   |   let current = PackageGraphRequestLoaded(
   |     owner=ctx.owner.host().unwrap(),
   |     epoch=ctx.request_epoch,
98 |     path=test_file(path.0),
   |          ^^^^^^^^^
   |     generation=1,
   |     source="graph-json",

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:104:30-104:39:
    |   )
    |   let (_, ready) = update(test_emit(), current, loading, ctx)
    |   assert_true(
104 |     ready.package_graphs.get(test_file(path.0)) ==
    |                              ^^^^^^^^^
    |     Some(PackageGraphReady(1, "graph-json")),
    |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:111:10-111:19:
    |   let late_failure = PackageGraphRequestFailed(
    |     owner=ctx.owner.host().unwrap(),
    |     epoch=ctx.request_epoch,
111 |     path=test_file(path.0),
    |          ^^^^^^^^^
    |     generation=1,
    |     message="late",

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:129:18-129:27:
    |     ctx,
    |   )
    |   let package_graphs = state.package_graphs.copy()
129 |   package_graphs[test_file(path.0)] = PackageGraphReady(4, "cached")
    |                  ^^^^^^^^^
    |   let ready = { ..state, package_graphs, package_graph_generation: 4, }
    |   let (_, source) = update(

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:137:41-137:50:
    |     ready,
    |     ctx,
    |   )
137 |   assert_true(source.moon_mod_view_mode(test_file(path.0)) is MoonModSource)
    |                                         ^^^^^^^^^
    |   assert_false(uses_package_diagram_surface(source, ctx))
    |   assert_true(

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:140:31-140:40:
    |   assert_true(source.moon_mod_view_mode(test_file(path.0)) is MoonModSource)
    |   assert_false(uses_package_diagram_surface(source, ctx))
    |   assert_true(
140 |     source.package_graphs.get(test_file(path.0)) ==
    |                               ^^^^^^^^^
    |     Some(PackageGraphReady(4, "cached")),
    |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:152:37-152:46:
    |   )
    |   assert_true(uses_package_diagram_surface(dependencies, ctx))
    |   assert_true(
152 |     dependencies.package_graphs.get(test_file(path.0)) ==
    |                                     ^^^^^^^^^
    |     Some(PackageGraphReady(4, "cached")),
    |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:157:17-157:26:
    |   )
    | 
    |   let failed_graphs = dependencies.package_graphs.copy()
157 |   failed_graphs[test_file(path.0)] = PackageGraphFailed(5, "moon failed")
    |                 ^^^^^^^^^
    |   let failed = {
    |     ..dependencies,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:170:45-170:54:
    |     ctx,
    |   )
    |   assert_true(
170 |     source_after_failure.moon_mod_view_mode(test_file(path.0)) is MoonModSource,
    |                                             ^^^^^^^^^
    |   )
    |   assert_true(

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:173:45-173:54:
    |     source_after_failure.moon_mod_view_mode(test_file(path.0)) is MoonModSource,
    |   )
    |   assert_true(
173 |     source_after_failure.package_graphs.get(test_file(path.0)) ==
    |                                             ^^^^^^^^^
    |     Some(PackageGraphFailed(5, "moon failed")),
    |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:182:43-182:52:
    |     source_after_failure,
    |     ctx,
    |   )
182 |   assert_true(retrying.package_graphs.get(test_file(path.0)) is None)
    |                                           ^^^^^^^^^
    |   let (loading, _) = sync(test_emit(), retrying, ctx)
    |   assert_true(

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:185:32-185:41:
    |   assert_true(retrying.package_graphs.get(test_file(path.0)) is None)
    |   let (loading, _) = sync(test_emit(), retrying, ctx)
    |   assert_true(
185 |     loading.package_graphs.get(test_file(path.0)) ==
    |                                ^^^^^^^^^
    |     Some(PackageGraphLoading(6)),
    |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:203:5-203:14:
    |     test_emit(),
    |     state,
    |     ctx,
203 |     test_file(path.0),
    |     ^^^^^^^^^
    |     name="moon.mod",
    |     range=Some(@common.Range(1, 1, 1, 5)),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:208:45-208:54:
    |     range=Some(@common.Range(1, 1, 1, 5)),
    |     had_active=true,
    |   )
208 |   assert_true(positioned.moon_mod_view_mode(test_file(path.0)) is MoonModSource)
    |                                             ^^^^^^^^^
    | 
    |   let graphs = positioned.package_graphs.copy()

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:211:10-211:19:
    |   assert_true(positioned.moon_mod_view_mode(test_file(path.0)) is MoonModSource)
    | 
    |   let graphs = positioned.package_graphs.copy()
211 |   graphs[test_file(path.0)] = PackageGraphReady(1, "cached")
    |          ^^^^^^^^^
    |   let positioned = { ..positioned, package_graphs: graphs, }
    |   let (_, closed) = close_document(

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:217:5-217:14:
    |     test_emit(),
    |     positioned,
    |     { ..ctx, open_files: [], active_file: None, },
217 |     test_file(path.0),
    |     ^^^^^^^^^
    |     next=None,
    |     was_active=true,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:221:46-221:55:
    |     next=None,
    |     was_active=true,
    |   )
221 |   assert_true(closed.moon_mod_view_modes.get(test_file(path.0)) is None)
    |                                              ^^^^^^^^^
    |   assert_true(closed.package_graphs.get(test_file(path.0)) is None)
    |   assert_true(closed.moon_mod_view_mode(test_file(path.0)) is MoonModSource)

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:222:41-222:50:
    |     was_active=true,
    |   )
    |   assert_true(closed.moon_mod_view_modes.get(test_file(path.0)) is None)
222 |   assert_true(closed.package_graphs.get(test_file(path.0)) is None)
    |                                         ^^^^^^^^^
    |   assert_true(closed.moon_mod_view_mode(test_file(path.0)) is MoonModSource)
    | }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:223:41-223:50:
    |   )
    |   assert_true(closed.moon_mod_view_modes.get(test_file(path.0)) is None)
    |   assert_true(closed.package_graphs.get(test_file(path.0)) is None)
223 |   assert_true(closed.moon_mod_view_mode(test_file(path.0)) is MoonModSource)
    |                                         ^^^^^^^^^
    | }
    | 

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:236:8-236:17:
    |     ctx,
    |   )
    |   let docs = state.docs.copy()
236 |   docs[test_file(path.0)] = {
    |        ^^^^^^^^^
    |     ..docs[test_file(path.0)],
    |     review: Some({

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:237:12-237:21:
    |   )
    |   let docs = state.docs.copy()
    |   docs[test_file(path.0)] = {
237 |     ..docs[test_file(path.0)],
    |            ^^^^^^^^^
    |     review: Some({
    |       generation: 1,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:257:45-257:54:
    |   )
    |   assert_true(after_toggle == reviewed)
    |   let (after_sync, _) = sync(test_emit(), reviewed, ctx)
257 |   assert_true(after_sync.package_graphs.get(test_file(path.0)) is None)
    |                                             ^^^^^^^^^
    | 
    |   let history = {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:299:18-299:27:
    | test "watcher baseline invalidates a graph cached across its observation gap" {
    |   let (state, ctx, path) = moon_mod_test_state()
    |   let package_graphs = state.package_graphs.copy()
299 |   package_graphs[test_file(path.0)] = PackageGraphReady(3, "cached")
    |                  ^^^^^^^^^
    |   let state = { ..state, package_graphs, package_graph_generation: 3, }
    |   let (_, invalidated) = update(

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\moon_mod_presentation_wbtest.mbt:311:46-311:55:
    |     state,
    |     ctx,
    |   )
311 |   assert_true(invalidated.package_graphs.get(test_file(path.0)) is None)
    |                                              ^^^^^^^^^
    | }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\office_navigation_wbtest.mbt:36:23-36:32:
   |   }
   |   let (_, switched) = state.sync_office_navigation(test_emit(), {
   |     ..ctx,
36 |     active_file: Some(test_file("other.docx")),
   |                       ^^^^^^^^^
   |   })
   |   assert_eq(switched.office_navigation, None)

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\office_navigation_wbtest.mbt:131:29-131:38:
    |     stale in [
    |       { ..navigation, generation: navigation.generation - 1, },
    |       { ..navigation, epoch: navigation.epoch - 1, },
131 |       { ..navigation, path: test_file("other.xlsx"), },
    |                             ^^^^^^^^^
    |     ] {
    |     let (_, ignored) = update(

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\office_selection_wbtest.mbt:3:14-3:23:
  | ///|
  | fn office_selection_fixture() -> (State, Ctx, @common.Uri) raise {
3 |   let path = test_file("report.docx")
  |              ^^^^^^^^^
  |   let ctx = { ..test_ctx(), active_file: Some(path), open_files: [path], }
  |   let document : @office_viewer.RenderedDocument = {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\office_selection_wbtest.mbt:90:34-90:43:
   |     .unwrap()
   |   for
   |     changed in [
90 |       { ..ctx, active_file: Some(test_file("other.docx")), },
   |                                  ^^^^^^^^^
   |       { ..ctx, active_file: None, },
   |       { ..ctx, panel_open: false, },

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\office_selection_wbtest.mbt:122:14-122:23:
    | ///|
    | test "Excel preview retains the sheet range and selected cell contents" {
    |   let (state, ctx, _) = office_selection_fixture()
122 |   let path = test_file("budget.xlsx")
    |              ^^^^^^^^^
    |   let document : @office_viewer.RenderedDocument = {
    |     kind: Excel,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\pdf_wbtest.mbt:3:14-3:23:
  | ///|
  | fn pdf_fixture() -> (State, Ctx, @common.Uri, PdfDocument) raise {
3 |   let path = test_file("report.pdf")
  |              ^^^^^^^^^
  |   let ctx = { ..test_ctx(), open_files: [path], active_file: Some(path), }
  |   let document = decode_pdf_document(@base64.encode(b"%PDF-1.7 fixture"), 7).unwrap()

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\pdf_wbtest.mbt:116:7-116:16:
    |       ctx,
    |       ctx.owner,
    |       0,
116 |       test_file("other.pdf"),
    |       ^^^^^^^^^
    |       "pdf:1",
    |       7,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\pdf_wbtest.mbt:360:7-360:16:
    |     render_office_document(
    |       locale=ctx.locale,
    |       "report.docx",
360 |       test_file("report.docx"),
    |       ^^^^^^^^^
    |       "***invalid base64***",
    |     )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\pdf_wbtest.mbt:369:7-369:16:
    |     render_office_document(
    |       locale=ctx.locale,
    |       "report.docx",
369 |       test_file("report.docx"),
    |       ^^^^^^^^^
    |       @base64.encode(b"invalid Office package"),
    |     )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_context_wbtest.mbt:5:14-5:23:
  | test "hunk context captures only member lines and rejects a changed source snapshot" {
  |   let (initial, _, change) = review_progress_state()
  |   let path = change.path
5 |   let file = test_file(path.0)
  |              ^^^^^^^^^
  |   let doc = reviewed_doc(
  |     path,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_navigation_wbtest.mbt:67:8-67:17:
   |   let middle = test_modified_change(@pathx.Relative("middle.mbt"))
   |   let last = test_modified_change(@pathx.Relative("last.mbt"))
   |   let docs = owned_state().docs.copy()
67 |   docs[test_file(first.path.0)] = reviewed_doc(first.path, first)
   |        ^^^^^^^^^
   |   let ctx = { ..test_ctx(), active_file: Some(test_file(first.path.0)), }
   |   let state = {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_navigation_wbtest.mbt:68:47-68:56:
   |   let last = test_modified_change(@pathx.Relative("last.mbt"))
   |   let docs = owned_state().docs.copy()
   |   docs[test_file(first.path.0)] = reviewed_doc(first.path, first)
68 |   let ctx = { ..test_ctx(), active_file: Some(test_file(first.path.0)), }
   |                                               ^^^^^^^^^
   |   let state = {
   |     ..owned_state(),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_navigation_wbtest.mbt:170:8-170:17:
    |     kind: ChangeSymlink,
    |   }
    |   let docs = owned_state().docs.copy()
170 |   docs[test_file(first.path.0)] = reviewed_doc(first.path, first)
    |        ^^^^^^^^^
    |   docs[test_file(last.path.0)] = reviewed_doc(last.path, last)
    |   let state = {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_navigation_wbtest.mbt:171:8-171:17:
    |   }
    |   let docs = owned_state().docs.copy()
    |   docs[test_file(first.path.0)] = reviewed_doc(first.path, first)
171 |   docs[test_file(last.path.0)] = reviewed_doc(last.path, last)
    |        ^^^^^^^^^
    |   let state = {
    |     ..owned_state(),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_navigation_wbtest.mbt:182:53-182:62:
    |       refresh_again=false,
    |     ),
    |   }
182 |   let first_ctx = { ..test_ctx(), active_file: Some(test_file(first.path.0)), }
    |                                                     ^^^^^^^^^
    |   let last_ctx = { ..test_ctx(), active_file: Some(test_file(last.path.0)), }
    |   assert_true(review_diff_navigation_enabled(state, first_ctx))

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_navigation_wbtest.mbt:183:52-183:61:
    |     ),
    |   }
    |   let first_ctx = { ..test_ctx(), active_file: Some(test_file(first.path.0)), }
183 |   let last_ctx = { ..test_ctx(), active_file: Some(test_file(last.path.0)), }
    |                                                    ^^^^^^^^^
    |   assert_true(review_diff_navigation_enabled(state, first_ctx))
    |   assert_true(review_navigation_neighbor(state, first_ctx, true) == Some(last))

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_navigation_wbtest.mbt:196:8-196:17:
    |   let (initial, first_ctx, first) = review_progress_state()
    |   let last = test_modified_change(@pathx.Relative("src/last.mbt"))
    |   let docs = initial.docs.copy()
196 |   docs[test_file(last.path.0)] = reviewed_doc(last.path, last)
    |        ^^^^^^^^^
    |   let state = {
    |     ..initial,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_navigation_wbtest.mbt:207:51-207:60:
    |       refresh_again=false,
    |     ),
    |   }
207 |   let last_ctx = { ..first_ctx, active_file: Some(test_file(last.path.0)), }
    |                                                   ^^^^^^^^^
    |   for previous in [false, true] {
    |     let messages : Array[Msg] = []

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_navigation_wbtest.mbt:254:14-254:23:
    | ///|
    | test "cross-file reveal waits for content and cancels when its review is superseded" {
    |   let path = @pathx.Relative("last.mbt")
254 |   let file = test_file(path.0)
    |              ^^^^^^^^^
    |   let change = test_modified_change(path)
    |   let doc = reviewed_doc(path, change)

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_progress_wbtest.mbt:6:8-6:17:
  |   let path = @pathx.Relative("src/main.mbt")
  |   let selected = test_modified_change(path)
  |   let docs = owned_state().docs.copy()
6 |   docs[test_file(path.0)] = reviewed_doc(path, selected)
  |        ^^^^^^^^^
  |   let state = {
  |     ..owned_state(),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_progress_wbtest.mbt:20:18-20:27:
   |   }
   |   let ctx = {
   |     ..test_ctx(),
20 |     open_files: [test_file(path.0)],
   |                  ^^^^^^^^^
   |     active_file: Some(test_file(path.0)),
   |   }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_progress_wbtest.mbt:21:23-21:32:
   |   let ctx = {
   |     ..test_ctx(),
   |     open_files: [test_file(path.0)],
21 |     active_file: Some(test_file(path.0)),
   |                       ^^^^^^^^^
   |   }
   |   (state, ctx, selected)

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_progress_wbtest.mbt:225:49-225:58:
    |   )
    |   assert_true(stale_row.review_active_hunk is None)
    |   assert_false(stale_row.review_navigation_ready(ctx))
225 |   let inactive_ctx = { ..ctx, active_file: Some(test_file("src/other.mbt")), }
    |                                                 ^^^^^^^^^
    |   let inactive = activate_review_hunk(
    |     state, inactive_ctx, selected, hunk, hunk, 0, 1,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_view_mode_wbtest.mbt:27:14-27:23:
   | test "positioned Content failures settle retained reviews and fence both generations" {
   |   let emit = test_emit()
   |   let path = @pathx.Relative("src/main.mbt")
27 |   let file = test_file(path.0)
   |              ^^^^^^^^^
   |   let ctx = { ..test_ctx(), open_files: [file], active_file: Some(file), }
   |   let docs = owned_state().docs.copy()

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_view_mode_wbtest.mbt:93:14-93:23:
   | ///|
   | test "new reviews default to the full diff" {
   |   let path = @pathx.Relative("src/main.mbt")
93 |   let file = test_file(path.0)
   |              ^^^^^^^^^
   |   let change = test_modified_change(path)
   |   let state = owned_state()

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_view_mode_wbtest.mbt:114:14-114:23:
    | ///|
    | test "full diff change navigation is enabled only after a nonempty diff" {
    |   let path = @pathx.Relative("src/main.mbt")
114 |   let file = test_file(path.0)
    |              ^^^^^^^^^
    |   let selected = test_modified_change(path)
    |   let docs = owned_state().docs.copy()

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_view_mode_wbtest.mbt:199:14-199:23:
    | ///|
    | test "full diff layout toggles independently and source mode preserves it" {
    |   let path = @pathx.Relative("src/main.mbt")
199 |   let file = test_file(path.0)
    |              ^^^^^^^^^
    |   let selected = test_modified_change(path)
    |   let docs = owned_state().docs.copy()

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_view_mode_wbtest.mbt:235:8-235:17:
    |   let first_change = test_modified_change(first_path)
    |   let second_change = test_modified_change(second_path)
    |   let docs = owned_state().docs.copy()
235 |   docs[test_file(first_path.0)] = reviewed_doc(
    |        ^^^^^^^^^
    |     first_path,
    |     first_change,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_view_mode_wbtest.mbt:242:18-242:27:
    |   )
    |   let first_ctx = {
    |     ..test_ctx(),
242 |     open_files: [test_file(first_path.0)],
    |                  ^^^^^^^^^
    |     active_file: Some(test_file(first_path.0)),
    |   }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_view_mode_wbtest.mbt:243:23-243:32:
    |   let first_ctx = {
    |     ..test_ctx(),
    |     open_files: [test_file(first_path.0)],
243 |     active_file: Some(test_file(first_path.0)),
    |                       ^^^^^^^^^
    |   }
    |   let (_, full_diff) = update(

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_view_mode_wbtest.mbt:252:24-252:33:
    |     first_ctx,
    |   )
    |   assert_true(
252 |     full_diff.docs.get(test_file(first_path.0))
    |                        ^^^^^^^^^
    |     is Some({ review: Some({ view_mode: ReviewDiff, .. }), .. }),
    |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_view_mode_wbtest.mbt:258:18-258:27:
    | 
    |   let second_ctx = {
    |     ..first_ctx,
258 |     open_files: [test_file(first_path.0), test_file(second_path.0)],
    |                  ^^^^^^^^^
    |     active_file: Some(test_file(second_path.0)),
    |   }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_view_mode_wbtest.mbt:258:43-258:52:
    | 
    |   let second_ctx = {
    |     ..first_ctx,
258 |     open_files: [test_file(first_path.0), test_file(second_path.0)],
    |                                           ^^^^^^^^^
    |     active_file: Some(test_file(second_path.0)),
    |   }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_view_mode_wbtest.mbt:259:23-259:32:
    |   let second_ctx = {
    |     ..first_ctx,
    |     open_files: [test_file(first_path.0), test_file(second_path.0)],
259 |     active_file: Some(test_file(second_path.0)),
    |                       ^^^^^^^^^
    |   }
    |   let (_, switched) = open_changed_document(

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_view_mode_wbtest.mbt:269:23-269:32:
    |     had_active=true,
    |   )
    |   assert_true(
269 |     switched.docs.get(test_file(second_path.0))
    |                       ^^^^^^^^^
    |     is Some({ review: Some({ view_mode: ReviewDiff, .. }), .. }),
    |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_view_mode_wbtest.mbt:274:15-274:24:
    |   )
    | 
    |   let loaded_docs = switched.docs.copy()
274 |   loaded_docs[test_file(second_path.0)] = reviewed_doc(
    |               ^^^^^^^^^
    |     second_path,
    |     second_change,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_view_mode_wbtest.mbt:287:27-287:36:
    |     second_ctx,
    |   )
    |   assert_true(
287 |     source_again.docs.get(test_file(first_path.0))
    |                           ^^^^^^^^^
    |     is Some({ review: Some({ view_mode: ReviewDiff, .. }), .. }),
    |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\review_view_mode_wbtest.mbt:291:27-291:36:
    |     is Some({ review: Some({ view_mode: ReviewDiff, .. }), .. }),
    |   )
    |   assert_true(
291 |     source_again.docs.get(test_file(second_path.0))
    |                           ^^^^^^^^^
    |     is Some({ review: Some({ view_mode: ReviewSource, .. }), .. }),
    |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\semantic_review_view_wbtest.mbt:160:14-160:23:
    | ///|
    | test "semantic input follows active MoonBit review and ignores layout" {
    |   let path = @pathx.Relative("src/main.mbt")
160 |   let file = test_file(path.0)
    |              ^^^^^^^^^
    |   let selected = test_modified_change(path)
    |   let docs = owned_state().docs.copy()

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5338:20-5338:29:
     |     owned_state(),
     |     {
     |       ..test_ctx(),
5338 |       open_files: [test_file("a.mbt")],
     |                    ^^^^^^^^^
     |       active_file: Some(test_file("a.mbt")),
     |     },

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5339:25-5339:34:
     |     {
     |       ..test_ctx(),
     |       open_files: [test_file("a.mbt")],
5339 |       active_file: Some(test_file("a.mbt")),
     |                         ^^^^^^^^^
     |     },
     |     test_file("a.mbt"),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5341:5-5341:14:
     |       open_files: [test_file("a.mbt")],
     |       active_file: Some(test_file("a.mbt")),
     |     },
5341 |     test_file("a.mbt"),
     |     ^^^^^^^^^
     |     name="a.mbt",
     |     range=None,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5347:18-5347:27:
     |     had_active=false,
     |   )
     |   assert_true(
5347 |     one.docs.get(test_file("a.mbt")) is Some({ state: TabLoading, .. }),
     |                  ^^^^^^^^^
     |   )
     |   // A plain re-open of a loaded document keeps the cached state — the show

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5352:8-5352:17:
     |   // A plain re-open of a loaded document keeps the cached state — the show
     |   // command redraws from the table, never waiting on a re-read's reply.
     |   let docs = one.docs.copy()
5352 |   docs[test_file("a.mbt")] = loaded_doc("a.mbt")
     |        ^^^^^^^^^
     |   let (_, again) = open_document(
     |     emit,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5358:20-5358:29:
     |     { ..one, docs, },
     |     {
     |       ..test_ctx(),
5358 |       open_files: [test_file("a.mbt")],
     |                    ^^^^^^^^^
     |       active_file: Some(test_file("a.mbt")),
     |     },

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5359:25-5359:34:
     |     {
     |       ..test_ctx(),
     |       open_files: [test_file("a.mbt")],
5359 |       active_file: Some(test_file("a.mbt")),
     |                         ^^^^^^^^^
     |     },
     |     test_file("a.mbt"),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5361:5-5361:14:
     |       open_files: [test_file("a.mbt")],
     |       active_file: Some(test_file("a.mbt")),
     |     },
5361 |     test_file("a.mbt"),
     |     ^^^^^^^^^
     |     name="a.mbt",
     |     range=None,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5367:20-5367:29:
     |     had_active=true,
     |   )
     |   assert_true(
5367 |     again.docs.get(test_file("a.mbt")) is Some({ state: TabLoaded(..), .. }),
     |                    ^^^^^^^^^
     |   )
     | }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5375:14-5375:23:
     | test "changed-file review fences paired replies and Content opens retain comparison" {
     |   let emit = test_emit()
     |   let path = @pathx.Relative("a.mbt")
5375 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let ctx = { ..test_ctx(), open_files: [file], active_file: Some(file), }
     |   let change : ChangedFile = {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5604:14-5604:23:
     | ///|
     | test "reselecting a settled review keeps its cached comparison generation" {
     |   let path = @pathx.Relative("settled.mbt")
5604 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let change = test_modified_change(path)
     |   let doc = {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5651:14-5651:23:
     | test "changed-file review preserves a stale cached working document until reload" {
     |   let emit = test_emit()
     |   let path = @pathx.Relative("stale.mbt")
5651 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let docs : Map[@common.Uri, Doc] = Map([])
     |   docs[file] = { ..loaded_doc("stale.mbt"), stale: true, }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5735:14-5735:23:
     | test "review failures settle precisely and missing rename sources stay unavailable" {
     |   let emit = test_emit()
     |   let path = @pathx.Relative("new.mbt")
5735 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let ctx = { ..test_ctx(), open_files: [file], active_file: Some(file), }
     |   let rename : ChangedFile = {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5831:18-5831:27:
     |   let deleted_path = @pathx.Relative("gone.mbt")
     |   let ctx = {
     |     ..test_ctx(),
5831 |     open_files: [test_file(deleted_path.0)],
     |                  ^^^^^^^^^
     |     active_file: Some(test_file(deleted_path.0)),
     |   }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5832:23-5832:32:
     |   let ctx = {
     |     ..test_ctx(),
     |     open_files: [test_file(deleted_path.0)],
5832 |     active_file: Some(test_file(deleted_path.0)),
     |                       ^^^^^^^^^
     |   }
     |   let deleted : ChangedFile = {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5849:22-5849:31:
     |     had_active=false,
     |   )
     |   assert_true(
5849 |     loading.docs.get(test_file(deleted_path.0))
     |                      ^^^^^^^^^
     |     is Some(
     |       {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5863:12-5863:21:
     |     GitOriginalLoaded(
     |       owner=ctx.owner.host().unwrap(),
     |       background=false,
5863 |       path=test_file(deleted_path.0),
     |            ^^^^^^^^^
     |       generation=1,
     |       original=@protocol.OriginalContent("removed source"),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5871:22-5871:31:
     |     ctx,
     |   )
     |   assert_true(
5871 |     preview.docs.get(test_file(deleted_path.0))
     |                      ^^^^^^^^^
     |     is Some(
     |       {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5882:26-5882:35:
     |       }
     |     ),
     |   )
5882 |   guard preview.docs.get(test_file(deleted_path.0)) is Some(deleted_preview) else {
     |                          ^^^^^^^^^
     |     fail("deleted review was missing")
     |   }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5889:21-5889:30:
     |   assert_true(deleted_preview.review is Some({ view_mode: ReviewDiff, .. }))
     |   let (_, source) = update(emit, ToggleReviewDiff, preview, ctx)
     |   assert_true(
5889 |     source.docs.get(test_file(deleted_path.0))
     |                     ^^^^^^^^^
     |     is Some({ review: Some({ view_mode: ReviewSource, .. }), .. }),
     |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5894:30-5894:39:
     |   )
     |   let (_, full_diff_again) = update(emit, ToggleReviewDiff, source, ctx)
     |   assert_true(
5894 |     full_diff_again.docs.get(test_file(deleted_path.0))
     |                              ^^^^^^^^^
     |     is Some({ review: Some({ view_mode: ReviewDiff, .. }), .. }),
     |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5906:9-5906:18:
     |         emit,
     |         prior,
     |         ctx,
5906 |         test_file(deleted_path.0),
     |         ^^^^^^^^^
     |         name="gone.mbt",
     |         range~,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5912:27-5912:36:
     |         had_active=true,
     |       )
     |       assert_true(
5912 |         reopened.docs.get(test_file(deleted_path.0))
     |                           ^^^^^^^^^
     |         is Some({ state: TabDeleted, review: Some(review), .. }) &&
     |         review.view_mode is ReviewDiff,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5925:18-5925:27:
     |   let live_path = @pathx.Relative("live.mbt")
     |   let live_ctx = {
     |     ..ctx,
5925 |     open_files: [test_file(live_path.0)],
     |                  ^^^^^^^^^
     |     active_file: Some(test_file(live_path.0)),
     |   }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5926:23-5926:32:
     |   let live_ctx = {
     |     ..ctx,
     |     open_files: [test_file(live_path.0)],
5926 |     active_file: Some(test_file(live_path.0)),
     |                       ^^^^^^^^^
     |   }
     |   let live = {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5946:12-5946:21:
     |     GitOriginalLoaded(
     |       owner=live_ctx.owner.host().unwrap(),
     |       background=false,
5946 |       path=test_file(live_path.0),
     |            ^^^^^^^^^
     |       generation=1,
     |       original=@protocol.Missing,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5958:12-5958:21:
     |     FileLoaded(
     |       owner=live_ctx.owner,
     |       epoch=0,
5958 |       path=test_file(live_path.0),
     |            ^^^^^^^^^
     |       name="live.mbt",
     |       file=Content(content="new", sig="2:3"),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5970:21-5970:30:
     |     live_ctx,
     |   )
     |   assert_true(
5970 |     loaded.docs.get(test_file(live_path.0))
     |                     ^^^^^^^^^
     |     is Some(
     |       {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5979:25-5979:34:
     |       }
     |     ),
     |   )
5979 |   guard loaded.docs.get(test_file(live_path.0)) is Some(added_preview) else {
     |                         ^^^^^^^^^
     |     fail("added review was missing")
     |   }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5991:18-5991:27:
     |   let narrow : Ctx = {
     |     ..test_ctx(),
     |     narrow: true,
5991 |     open_files: [test_file("a.mbt")],
     |                  ^^^^^^^^^
     |     active_file: Some(test_file("a.mbt")),
     |   }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:5992:23-5992:32:
     |     ..test_ctx(),
     |     narrow: true,
     |     open_files: [test_file("a.mbt")],
5992 |     active_file: Some(test_file("a.mbt")),
     |                       ^^^^^^^^^
     |   }
     |   let start = { ..owned_state(), tree_open: true, }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6000:5-6000:14:
     |     emit,
     |     start,
     |     narrow,
6000 |     test_file("a.mbt"),
     |     ^^^^^^^^^
     |     name="a.mbt",
     |     range=None,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6010:8-6010:17:
     |   let (_, tree) = update(emit, ToggleTree, opened, narrow)
     |   assert_true(tree.tree_open)
     |   let docs : Map[@common.Uri, Doc] = Map([])
6010 |   docs[test_file("a.mbt")] = loaded_doc("a.mbt")
     |        ^^^^^^^^^
     |   let (_, activated) = activate(
     |     emit,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6015:5-6015:14:
     |     emit,
     |     { ..tree, docs, },
     |     narrow,
6015 |     test_file("a.mbt"),
     |     ^^^^^^^^^
     |   )
     |   assert_false(activated.tree_open)

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6024:20-6024:29:
     |     start,
     |     {
     |       ..test_ctx(),
6024 |       open_files: [test_file("b.mbt")],
     |                    ^^^^^^^^^
     |       active_file: Some(test_file("b.mbt")),
     |     },

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6025:25-6025:34:
     |     {
     |       ..test_ctx(),
     |       open_files: [test_file("b.mbt")],
6025 |       active_file: Some(test_file("b.mbt")),
     |                         ^^^^^^^^^
     |     },
     |     test_file("b.mbt"),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6027:5-6027:14:
     |       open_files: [test_file("b.mbt")],
     |       active_file: Some(test_file("b.mbt")),
     |     },
6027 |     test_file("b.mbt"),
     |     ^^^^^^^^^
     |     name="b.mbt",
     |     range=None,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6042:5-6042:14:
     |     emit,
     |     owned_state(),
     |     test_ctx(),
6042 |     test_file("gone.mbt"),
     |     ^^^^^^^^^
     |   )
     |   assert_true(same == owned_state())

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6051:8-6051:17:
     | test "close_document preserves the manual tree preference on the last one" {
     |   let emit = test_emit()
     |   let docs : Map[@common.Uri, Doc] = Map([])
6051 |   docs[test_file("a.mbt")] = loaded_doc("a.mbt")
     |        ^^^^^^^^^
     |   docs[test_file("b.mbt")] = loaded_doc("b.mbt")
     |   let state = { ..owned_state(), docs, tree_open: false, }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6052:8-6052:17:
     |   let emit = test_emit()
     |   let docs : Map[@common.Uri, Doc] = Map([])
     |   docs[test_file("a.mbt")] = loaded_doc("a.mbt")
6052 |   docs[test_file("b.mbt")] = loaded_doc("b.mbt")
     |        ^^^^^^^^^
     |   let state = { ..owned_state(), docs, tree_open: false, }
     |   // Closing the active document with a neighbor left: the entry goes, the

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6060:5-6060:14:
     |     emit,
     |     state,
     |     test_ctx(),
6060 |     test_file("a.mbt"),
     |     ^^^^^^^^^
     |     next=Some(test_file("b.mbt")),
     |     was_active=true,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6061:15-6061:24:
     |     state,
     |     test_ctx(),
     |     test_file("a.mbt"),
6061 |     next=Some(test_file("b.mbt")),
     |               ^^^^^^^^^
     |     was_active=true,
     |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6064:34-6064:43:
     |     next=Some(test_file("b.mbt")),
     |     was_active=true,
     |   )
6064 |   assert_false(one.docs.contains(test_file("a.mbt")))
     |                                  ^^^^^^^^^
     |   assert_true(one.docs.contains(test_file("b.mbt")))
     |   assert_false(one.tree_open)

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6065:33-6065:42:
     |     was_active=true,
     |   )
     |   assert_false(one.docs.contains(test_file("a.mbt")))
6065 |   assert_true(one.docs.contains(test_file("b.mbt")))
     |                                 ^^^^^^^^^
     |   assert_false(one.tree_open)
     |   // Closing the last document shows the picker without changing preference.

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6072:5-6072:14:
     |     emit,
     |     one,
     |     test_ctx(),
6072 |     test_file("b.mbt"),
     |     ^^^^^^^^^
     |     next=None,
     |     was_active=true,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6084:8-6084:17:
     | test "FileLoaded settles content into its document, active or not" {
     |   let emit = test_emit()
     |   let docs : Map[@common.Uri, Doc] = Map([])
6084 |   docs[test_file("a.mbt")] = {
     |        ^^^^^^^^^
     |     name: "a.mbt",
     |     state: TabLoading,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6090:8-6090:17:
     |     review: None,
     |     stale: false,
     |   }
6090 |   docs[test_file("b.mbt")] = loaded_doc("b.mbt")
     |        ^^^^^^^^^
     |   let state = { ..owned_state(), docs, }
     |   let ctx = {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6094:18-6094:27:
     |   let state = { ..owned_state(), docs, }
     |   let ctx = {
     |     ..test_ctx(),
6094 |     open_files: [test_file("a.mbt"), test_file("b.mbt")],
     |                  ^^^^^^^^^
     |     active_file: Some(test_file("b.mbt")),
     |   }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6094:38-6094:47:
     |   let state = { ..owned_state(), docs, }
     |   let ctx = {
     |     ..test_ctx(),
6094 |     open_files: [test_file("a.mbt"), test_file("b.mbt")],
     |                                      ^^^^^^^^^
     |     active_file: Some(test_file("b.mbt")),
     |   }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6095:23-6095:32:
     |   let ctx = {
     |     ..test_ctx(),
     |     open_files: [test_file("a.mbt"), test_file("b.mbt")],
6095 |     active_file: Some(test_file("b.mbt")),
     |                       ^^^^^^^^^
     |   }
     |   let (_, next) = update(

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6102:12-6102:21:
     |     FileLoaded(
     |       owner=test_ctx().owner,
     |       epoch=0,
6102 |       path=test_file("a.mbt"),
     |            ^^^^^^^^^
     |       name="a.mbt",
     |       file=Content(content="fn main {}", sig="2:0"),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6114:19-6114:28:
     |     ctx,
     |   )
     |   assert_true(
6114 |     next.docs.get(test_file("a.mbt"))
     |                   ^^^^^^^^^
     |     is Some({ state: TabLoaded(content="fn main {}", ..), .. }),
     |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6123:12-6123:21:
     |     FileLoaded(
     |       owner=test_ctx().owner,
     |       epoch=0,
6123 |       path=test_file("gone.mbt"),
     |            ^^^^^^^^^
     |       name="gone.mbt",
     |       file=Content(content="", sig="2:0"),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6143:12-6143:21:
     |         session: "desktop-test",
     |       }),
     |       epoch=0,
6143 |       path=test_file("a.mbt"),
     |            ^^^^^^^^^
     |       name="a.mbt",
     |       file=Binary,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6155:20-6155:29:
     |     ctx,
     |   )
     |   assert_true(
6155 |     other.docs.get(test_file("a.mbt")) is Some({ state: TabLoaded(..), .. }),
     |                    ^^^^^^^^^
     |   )
     |   // A stat issued before a placement/reroot boundary is stale even when the

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6166:22-6166:31:
     |       recheck_diagnostics=true,
     |       owner=test_ctx().owner.host().unwrap(),
     |       epoch=1,
6166 |       stats=[{ path: test_file("a.mbt"), signature: Missing, }],
     |                      ^^^^^^^^^
     |     ),
     |     epoch_state,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6177:12-6177:21:
     |     FileLoaded(
     |       owner=test_ctx().owner,
     |       epoch=1,
6177 |       path=test_file("a.mbt"),
     |            ^^^^^^^^^
     |       name="a.mbt",
     |       file=Content(content="stale", sig="9:0"),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6226:8-6226:17:
     | test "sync re-roots the document table from the dock's projection" {
     |   let emit = test_emit()
     |   let docs : Map[@common.Uri, Doc] = Map([])
6226 |   docs[test_file("old.mbt")] = loaded_doc("old.mbt")
     |        ^^^^^^^^^
     |   let state = { ..owned_state(), docs, tree_open: false, }
     |   // Switch conversations: the dock restored a two-file strip for the new

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6236:18-6236:27:
     |       channel: @interop.ChannelId::Remote("other"),
     |       session: "desktop-test",
     |     }),
6236 |     open_files: [test_file("a.mbt"), test_file("b.mbt")],
     |                  ^^^^^^^^^
     |     active_file: Some(test_file("a.mbt")),
     |   }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6236:38-6236:47:
     |       channel: @interop.ChannelId::Remote("other"),
     |       session: "desktop-test",
     |     }),
6236 |     open_files: [test_file("a.mbt"), test_file("b.mbt")],
     |                                      ^^^^^^^^^
     |     active_file: Some(test_file("a.mbt")),
     |   }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6237:23-6237:32:
     |       session: "desktop-test",
     |     }),
     |     open_files: [test_file("a.mbt"), test_file("b.mbt")],
6237 |     active_file: Some(test_file("a.mbt")),
     |                       ^^^^^^^^^
     |   }
     |   let (rerooted, _) = sync(emit, state, other)

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6243:39-6243:48:
     |   assert_true(
     |     rerooted.owner is Some(@interop.Host({ channel: Remote("other"), .. })),
     |   )
6243 |   assert_false(rerooted.docs.contains(test_file("old.mbt")))
     |                                       ^^^^^^^^^
     |   assert_true(
     |     rerooted.docs.get(test_file("a.mbt")) is Some({ state: TabLoading, .. }),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6245:23-6245:32:
     |   )
     |   assert_false(rerooted.docs.contains(test_file("old.mbt")))
     |   assert_true(
6245 |     rerooted.docs.get(test_file("a.mbt")) is Some({ state: TabLoading, .. }),
     |                       ^^^^^^^^^
     |   )
     |   assert_true(

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6248:23-6248:32:
     |     rerooted.docs.get(test_file("a.mbt")) is Some({ state: TabLoading, .. }),
     |   )
     |   assert_true(
6248 |     rerooted.docs.get(test_file("b.mbt")) is Some({ state: TabLoading, .. }),
     |                       ^^^^^^^^^
     |   )
     |   // The pane-visibility preference follows the panel, not the conversation.

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6263:8-6263:17:
     | test "a closed panel still re-roots when the conversation switches" {
     |   let emit = test_emit()
     |   let docs : Map[@common.Uri, Doc] = Map([])
6263 |   docs[test_file("a.mbt")] = loaded_doc("a.mbt")
     |        ^^^^^^^^^
     |   let state = {
     |     ..owned_state(),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6304:18-6304:27:
     |   let back : Ctx = {
     |     ..test_ctx(),
     |     panel_open: false,
6304 |     open_files: [test_file("a.mbt")],
     |                  ^^^^^^^^^
     |     active_file: Some(test_file("a.mbt")),
     |   }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6305:23-6305:32:
     |     ..test_ctx(),
     |     panel_open: false,
     |     open_files: [test_file("a.mbt")],
6305 |     active_file: Some(test_file("a.mbt")),
     |                       ^^^^^^^^^
     |   }
     |   let (restored, _) = sync(emit, parked, back)

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6310:23-6310:32:
     |   let (restored, _) = sync(emit, parked, back)
     |   assert_eq(restored.file_link_generation, 6)
     |   assert_true(
6310 |     restored.docs.get(test_file("a.mbt")) is Some({ state: TabLoading, .. }),
     |                       ^^^^^^^^^
     |   )
     |   assert_true(

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6484:8-6484:17:
     |   let emit = test_emit()
     |   let present = test_ctx().test_worktree("wt")
     |   let docs : Map[@common.Uri, Doc] = Map([])
6484 |   docs[test_file("a.mbt")] = loaded_doc("a.mbt")
     |        ^^^^^^^^^
     |   docs[test_file("b.mbt")] = {
     |     ..loaded_doc("b.mbt"),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6485:8-6485:17:
     |   let present = test_ctx().test_worktree("wt")
     |   let docs : Map[@common.Uri, Doc] = Map([])
     |   docs[test_file("a.mbt")] = loaded_doc("a.mbt")
6485 |   docs[test_file("b.mbt")] = {
     |        ^^^^^^^^^
     |     ..loaded_doc("b.mbt"),
     |     review: Some({

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6519:18-6519:27:
     |     placement: Some(
     |       @interop.MissingWorktree(project=present.test_root(), name="wt"),
     |     ),
6519 |     open_files: [test_file("a.mbt"), test_file("b.mbt")],
     |                  ^^^^^^^^^
     |     active_file: Some(test_file("a.mbt")),
     |   }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6519:38-6519:47:
     |     placement: Some(
     |       @interop.MissingWorktree(project=present.test_root(), name="wt"),
     |     ),
6519 |     open_files: [test_file("a.mbt"), test_file("b.mbt")],
     |                                      ^^^^^^^^^
     |     active_file: Some(test_file("a.mbt")),
     |   }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6520:23-6520:32:
     |       @interop.MissingWorktree(project=present.test_root(), name="wt"),
     |     ),
     |     open_files: [test_file("a.mbt"), test_file("b.mbt")],
6520 |     active_file: Some(test_file("a.mbt")),
     |                       ^^^^^^^^^
     |   }
     |   let (parked, _) = sync(emit, state, missing)

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6525:21-6525:30:
     |   let (parked, _) = sync(emit, state, missing)
     |   assert_true(parked.owner == Some(present.owner))
     |   assert_true(
6525 |     parked.docs.get(test_file("a.mbt")) is Some({ state: TabLoaded(..), .. }),
     |                     ^^^^^^^^^
     |   )
     |   assert_true(parked.children.is_empty())

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6540:5-6540:14:
     |     emit,
     |     parked,
     |     missing,
6540 |     test_file("new.mbt"),
     |     ^^^^^^^^^
     |     name="new.mbt",
     |     range=None,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6558:5-6558:14:
     |     emit,
     |     parked,
     |     missing,
6558 |     test_file("a.mbt"),
     |     ^^^^^^^^^
     |   )
     |   assert_true(direct_activation == parked)

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6574:5-6574:14:
     |     emit,
     |     parked,
     |     missing,
6574 |     test_file("a.mbt"),
     |     ^^^^^^^^^
     |     next=Some(test_file("b.mbt")),
     |     was_active=true,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6575:15-6575:24:
     |     parked,
     |     missing,
     |     test_file("a.mbt"),
6575 |     next=Some(test_file("b.mbt")),
     |               ^^^^^^^^^
     |     was_active=true,
     |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6578:43-6578:52:
     |     next=Some(test_file("b.mbt")),
     |     was_active=true,
     |   )
6578 |   assert_false(direct_close.docs.contains(test_file("a.mbt")))
     |                                           ^^^^^^^^^
     |   assert_true(
     |     direct_close.docs.get(test_file("b.mbt")) ==

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6580:27-6580:36:
     |   )
     |   assert_false(direct_close.docs.contains(test_file("a.mbt")))
     |   assert_true(
6580 |     direct_close.docs.get(test_file("b.mbt")) ==
     |                           ^^^^^^^^^
     |     parked.docs.get(test_file("b.mbt")),
     |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6581:21-6581:30:
     |   assert_false(direct_close.docs.contains(test_file("a.mbt")))
     |   assert_true(
     |     direct_close.docs.get(test_file("b.mbt")) ==
6581 |     parked.docs.get(test_file("b.mbt")),
     |                     ^^^^^^^^^
     |   )
     |   assert_eq(direct_close.review_generation, parked.review_generation)

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6596:18-6596:27:
     |   assert_true(still_parked == parked)
     |   let restored_ctx = {
     |     ..present,
6596 |     open_files: [test_file("a.mbt")],
     |                  ^^^^^^^^^
     |     active_file: Some(test_file("a.mbt")),
     |   }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6597:23-6597:32:
     |   let restored_ctx = {
     |     ..present,
     |     open_files: [test_file("a.mbt")],
6597 |     active_file: Some(test_file("a.mbt")),
     |                       ^^^^^^^^^
     |   }
     |   let (restored, _) = sync(emit, parked, restored_ctx)

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6601:23-6601:32:
     |   }
     |   let (restored, _) = sync(emit, parked, restored_ctx)
     |   assert_true(
6601 |     restored.docs.get(test_file("a.mbt"))
     |                       ^^^^^^^^^
     |     is Some({ state: TabLoaded(..), stale: true, .. }),
     |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6612:14-6612:23:
     | test "opening after a hidden checkout repair restores a stale reviewed tab" {
     |   let emit = test_emit()
     |   let path = @pathx.Relative("reviewed.mbt")
6612 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let change = test_modified_change(path)
     |   let docs : Map[@common.Uri, Doc] = Map([])

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6662:14-6662:23:
     | test "an unresolved gap retains identity so same-checkout recovery restores" {
     |   let emit = test_emit()
     |   let path = @pathx.Relative("reviewed.mbt")
6662 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let docs : Map[@common.Uri, Doc] = Map([])
     |   docs[file] = {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6705:14-6705:23:
     | test "recovery from an unresolved gap into another checkout reroots" {
     |   let emit = test_emit()
     |   let path = @pathx.Relative("reviewed.mbt")
6705 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let docs : Map[@common.Uri, Doc] = Map([])
     |   docs[file] = {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6798:14-6798:23:
     |   let emit = test_emit()
     |   let present = test_ctx().test_worktree("wt")
     |   let path = @pathx.Relative("reviewed.mbt")
6798 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let change : ChangedFile = {
     |     path,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6905:14-6905:23:
     |   let emit = test_emit()
     |   let present = test_ctx().test_worktree("wt")
     |   let path = @pathx.Relative("reviewed.mbt")
6905 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let change : ChangedFile = {
     |     path,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:6989:14-6989:23:
     |   let emit = test_emit()
     |   let present = test_ctx()
     |   let path = @pathx.Relative("slow.mbt")
6989 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let change : ChangedFile = {
     |     path,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:7054:8-7054:17:
     |   let emit = test_emit()
     |   let present = test_ctx()
     |   let docs : Map[@common.Uri, Doc] = Map([])
7054 |   docs[test_file("a.mbt")] = loaded_doc("a.mbt")
     |        ^^^^^^^^^
     |   let state = {
     |     ..owned_state(),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:7239:23-7239:32:
     | test "showing a hidden explorer refreshes Changes before polling resumes" {
     |   let hidden_ctx = {
     |     ..test_ctx(),
7239 |     active_file: Some(test_file("src/main.mbt")),
     |                       ^^^^^^^^^
     |   }
     |   let state = {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:7517:14-7517:23:
     | ///|
     | test "a settled Changes snapshot re-stats loaded reviews whose rows disappeared" {
     |   let path = @pathx.Relative("src/committed.mbt")
7517 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let docs : Map[@common.Uri, Doc] = Map([])
     |   docs[file] = {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:7576:14-7576:23:
     | ///|
     | test "a review that becomes a symlink clears its cached regular-file source" {
     |   let path = @pathx.Relative("src/replaced.mbt")
7576 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let selected = test_modified_change(path)
     |   let symlink = { ..selected, kind: ChangeSymlink, }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:7698:14-7698:23:
     | ///|
     | test "a disappearing review row hands an active reload to an ordinary read" {
     |   let path = @pathx.Relative("src/committed.mbt")
7698 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let docs : Map[@common.Uri, Doc] = Map([])
     |   docs[file] = {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:7801:14-7801:23:
     | ///|
     | test "a newer review reload fences an older working-tree reply" {
     |   let path = @pathx.Relative("src/racing.mbt")
7801 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let docs : Map[@common.Uri, Doc] = Map([])
     |   docs[file] = {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:7929:14-7929:23:
     | ///|
     | test "only a final Changes snapshot reconciles reviews and moved HEAD refreshes survivors" {
     |   let path = @pathx.Relative("src/partial.mbt")
7929 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let docs : Map[@common.Uri, Doc] = Map([])
     |   docs[file] = {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:8042:14-8042:23:
     | ///|
     | test "HEAD refresh restarts the generation-fenced working-tree read" {
     |   let path = @pathx.Relative("src/paired.mbt")
8042 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let change = test_modified_change(path)
     |   let docs : Map[@common.Uri, Doc] = Map([])

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:8157:14-8157:23:
     | ///|
     | test "legacy Changes replies without HEAD refresh baseline-bearing reviews" {
     |   let path = @pathx.Relative("src/legacy-host.mbt")
8157 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let change = test_modified_change(path)
     |   let docs : Map[@common.Uri, Doc] = Map([])

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:8265:14-8265:23:
     | ///|
     | test "unborn repository polls do not churn untracked reviews" {
     |   let path = @pathx.Relative("new.mbt")
8265 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let change : ChangedFile = {
     |     path,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:8317:14-8317:23:
     | ///|
     | test "legacy HEAD omission refreshes a missing baseline once tracking is proven" {
     |   let path = @pathx.Relative("recreated.mbt")
8317 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let untracked : ChangedFile = {
     |     path,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:8380:14-8380:23:
     | ///|
     | test "Changes reconciliation preserves the selected duplicate-path row" {
     |   let path = @pathx.Relative("recreated.mbt")
8380 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let deleted : ChangedFile = {
     |     path,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:8448:14-8448:23:
     | ///|
     | test "moved HEAD normalizes reviewed tabs across the working-file boundary" {
     |   let path = @pathx.Relative("src/crossing.mbt")
8448 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let ctx = { ..test_ctx(), open_files: [file], active_file: Some(file), }
     |   let deleted : ChangedFile = {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:8546:14-8546:23:
     | ///|
     | test "a changed rename source refreshes its review without moving HEAD" {
     |   let path = @pathx.Relative("src/new.mbt")
8546 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let previous : ChangedFile = {
     |     path,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:8635:39-8635:48:
     |     emit,
     |     ChangesPollDue,
     |     { ..state, tree_open: false, },
8635 |     { ..test_ctx(), active_file: Some(test_file("open.mbt")), },
     |                                       ^^^^^^^^^
     |   )
     |   assert_true(hidden_tree == { ..state, tree_open: false, })

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:8707:14-8707:23:
     |   // An open changed-file review consumes the inventory even off-screen, so it
     |   // keeps the fallback alive on its own.
     |   let path = @pathx.Relative("src/reviewed.mbt")
8707 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let docs : Map[@common.Uri, Doc] = Map([])
     |   docs[file] = {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:8734:14-8734:23:
     |   let emit = test_emit()
     |   let present = test_ctx().test_worktree("wt")
     |   let path = @pathx.Relative("reviewed.mbt")
8734 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let change = test_modified_change(path)
     |   let docs : Map[@common.Uri, Doc] = Map([])

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9036:14-9036:23:
     | ///|
     | test "hidden explorer keeps Git refresh live for an open review" {
     |   let path = @pathx.Relative("src/reviewed.mbt")
9036 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let docs : Map[@common.Uri, Doc] = Map([])
     |   docs[file] = {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9081:14-9081:23:
     | ///|
     | test "sync refreshes a hidden review after its workspace watch was parked" {
     |   let path = @pathx.Relative("src/reviewed.mbt")
9081 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let docs : Map[@common.Uri, Doc] = Map([])
     |   docs[file] = {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9120:14-9120:23:
     | ///|
     | test "a hidden review accepts its file-only watch without a refresh loop" {
     |   let path = @pathx.Relative("src/reviewed.mbt")
9120 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let docs : Map[@common.Uri, Doc] = Map([])
     |   docs[file] = {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9227:8-9227:17:
     | test "StatsLoaded marks deletions, reloads the active change, stales the rest" {
     |   let emit = test_emit()
     |   let docs : Map[@common.Uri, Doc] = Map([])
9227 |   docs[test_file("a.mbt")] = loaded_doc("a.mbt")
     |        ^^^^^^^^^
     |   docs[test_file("b.mbt")] = loaded_doc("b.mbt")
     |   docs[test_file("c.mbt")] = loaded_doc("c.mbt")

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9228:8-9228:17:
     |   let emit = test_emit()
     |   let docs : Map[@common.Uri, Doc] = Map([])
     |   docs[test_file("a.mbt")] = loaded_doc("a.mbt")
9228 |   docs[test_file("b.mbt")] = loaded_doc("b.mbt")
     |        ^^^^^^^^^
     |   docs[test_file("c.mbt")] = loaded_doc("c.mbt")
     |   let state = { ..owned_state(), docs, }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9229:8-9229:17:
     |   let docs : Map[@common.Uri, Doc] = Map([])
     |   docs[test_file("a.mbt")] = loaded_doc("a.mbt")
     |   docs[test_file("b.mbt")] = loaded_doc("b.mbt")
9229 |   docs[test_file("c.mbt")] = loaded_doc("c.mbt")
     |        ^^^^^^^^^
     |   let state = { ..owned_state(), docs, }
     |   let ctx = {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9233:18-9233:27:
     |   let state = { ..owned_state(), docs, }
     |   let ctx = {
     |     ..test_ctx(),
9233 |     open_files: [test_file("a.mbt"), test_file("b.mbt"), test_file("c.mbt")],
     |                  ^^^^^^^^^
     |     active_file: Some(test_file("a.mbt")),
     |   }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9233:38-9233:47:
     |   let state = { ..owned_state(), docs, }
     |   let ctx = {
     |     ..test_ctx(),
9233 |     open_files: [test_file("a.mbt"), test_file("b.mbt"), test_file("c.mbt")],
     |                                      ^^^^^^^^^
     |     active_file: Some(test_file("a.mbt")),
     |   }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9233:58-9233:67:
     |   let state = { ..owned_state(), docs, }
     |   let ctx = {
     |     ..test_ctx(),
9233 |     open_files: [test_file("a.mbt"), test_file("b.mbt"), test_file("c.mbt")],
     |                                                          ^^^^^^^^^
     |     active_file: Some(test_file("a.mbt")),
     |   }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9234:23-9234:32:
     |   let ctx = {
     |     ..test_ctx(),
     |     open_files: [test_file("a.mbt"), test_file("b.mbt"), test_file("c.mbt")],
9234 |     active_file: Some(test_file("a.mbt")),
     |                       ^^^^^^^^^
     |   }
     |   let (_, next) = update(

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9245:17-9245:26:
     |       stats=[
     |         // The active file changed: reloaded eagerly, so its document stays
     |         // loaded (the baseline the scroll-keeping reload compares against).
9245 |         { path: test_file("a.mbt"), signature: Present("9:0"), },
     |                 ^^^^^^^^^
     |         // A background file changed: only marked stale.
     |         { path: test_file("b.mbt"), signature: Present("9:0"), },

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9247:17-9247:26:
     |         // loaded (the baseline the scroll-keeping reload compares against).
     |         { path: test_file("a.mbt"), signature: Present("9:0"), },
     |         // A background file changed: only marked stale.
9247 |         { path: test_file("b.mbt"), signature: Present("9:0"), },
     |                 ^^^^^^^^^
     |         // Deleted: the document flips to the deleted notice state.
     |         { path: test_file("c.mbt"), signature: Missing, },

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9249:17-9249:26:
     |         // A background file changed: only marked stale.
     |         { path: test_file("b.mbt"), signature: Present("9:0"), },
     |         // Deleted: the document flips to the deleted notice state.
9249 |         { path: test_file("c.mbt"), signature: Missing, },
     |                 ^^^^^^^^^
     |       ],
     |     ),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9256:19-9256:28:
     |     ctx,
     |   )
     |   assert_true(
9256 |     next.docs.get(test_file("a.mbt"))
     |                   ^^^^^^^^^
     |     is Some({ state: TabLoaded(..), stale: false, .. }),
     |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9259:29-9259:38:
     |     next.docs.get(test_file("a.mbt"))
     |     is Some({ state: TabLoaded(..), stale: false, .. }),
     |   )
9259 |   assert_true(next.docs.get(test_file("b.mbt")) is Some({ stale: true, .. }))
     |                             ^^^^^^^^^
     |   assert_true(
     |     next.docs.get(test_file("c.mbt")) is Some({ state: TabDeleted, .. }),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9261:19-9261:28:
     |   )
     |   assert_true(next.docs.get(test_file("b.mbt")) is Some({ stale: true, .. }))
     |   assert_true(
9261 |     next.docs.get(test_file("c.mbt")) is Some({ state: TabDeleted, .. }),
     |                   ^^^^^^^^^
     |   )
     |   // An unchanged signature on a background file still compares against the

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9266:8-9266:17:
     |   // An unchanged signature on a background file still compares against the
     |   // loaded baseline.
     |   let solo : Map[@common.Uri, Doc] = Map([])
9266 |   solo[test_file("b.mbt")] = loaded_doc("b.mbt")
     |        ^^^^^^^^^
     |   let (_, same) = update(
     |     emit,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9273:22-9273:31:
     |       recheck_diagnostics=true,
     |       owner=test_ctx().owner.host().unwrap(),
     |       epoch=0,
9273 |       stats=[{ path: test_file("b.mbt"), signature: Present("9:0"), }],
     |                      ^^^^^^^^^
     |     ),
     |     { ..next, docs: solo, },

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9279:19-9279:28:
     |     { ..ctx, active_file: None, },
     |   )
     |   assert_true(
9279 |     same.docs.get(test_file("b.mbt"))
     |                   ^^^^^^^^^
     |     is Some({ state: TabLoaded(sig="1:0", ..), stale: true, .. }),
     |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9286:15-9286:24:
     |   // background tab retryable on activation.
     |   let failed_path = @pathx.Relative("failed.mbt")
     |   let failed_docs : Map[@common.Uri, Doc] = Map([])
9286 |   failed_docs[test_file(failed_path.0)] = {
     |               ^^^^^^^^^
     |     name: "failed.mbt",
     |     state: TabReadFailed("temporary failure"),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9304:22-9304:31:
     |       recheck_diagnostics=true,
     |       owner=test_ctx().owner.host().unwrap(),
     |       epoch=0,
9304 |       stats=[{ path: test_file(failed_path.0), signature: Present("10:0"), }],
     |                      ^^^^^^^^^
     |     ),
     |     { ..owned_state(), docs: failed_docs, },

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9310:24-9310:33:
     |     { ..ctx, active_file: None, },
     |   )
     |   assert_true(
9310 |     retryable.docs.get(test_file(failed_path.0))
     |                        ^^^^^^^^^
     |     is Some({ state: TabReadFailed(_), review: Some(_), stale: true, .. }),
     |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9323:22-9323:31:
     |         session: "desktop-test",
     |       },
     |       epoch=0,
9323 |       stats=[{ path: test_file("a.mbt"), signature: Missing, }],
     |                      ^^^^^^^^^
     |     ),
     |     state,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9329:20-9329:29:
     |     ctx,
     |   )
     |   assert_true(
9329 |     other.docs.get(test_file("a.mbt")) is Some({ state: TabLoaded(..), .. }),
     |                    ^^^^^^^^^
     |   )
     | }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9346:8-9346:17:
     |     kind: ChangeDeleted,
     |   }
     |   let docs : Map[@common.Uri, Doc] = Map([])
9346 |   docs[test_file("a.mbt")] = loaded_doc("a.mbt")
     |        ^^^^^^^^^
     |   docs[test_file("b.mbt")] = {
     |     name: "b.mbt",

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9347:8-9347:17:
     |   }
     |   let docs : Map[@common.Uri, Doc] = Map([])
     |   docs[test_file("a.mbt")] = loaded_doc("a.mbt")
9347 |   docs[test_file("b.mbt")] = {
     |        ^^^^^^^^^
     |     name: "b.mbt",
     |     state: TabLoading,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9353:8-9353:17:
     |     review: None,
     |     stale: false,
     |   }
9353 |   docs[test_file("c.mbt")] = {
     |        ^^^^^^^^^
     |     name: "c.mbt",
     |     state: TabDeleted,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9359:8-9359:17:
     |     review: None,
     |     stale: false,
     |   }
9359 |   docs[test_file(gone_path.0)] = {
     |        ^^^^^^^^^
     |     name: "gone.mbt",
     |     state: TabDeleted,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9371:8-9371:17:
     |     }),
     |     stale: false,
     |   }
9371 |   docs[test_file(reviewed_path.0)] = {
     |        ^^^^^^^^^
     |     ..loaded_doc("reviewed.mbt"),
     |     review: Some({

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9384:7-9384:16:
     |   let ctx = {
     |     ..test_ctx(),
     |     open_files: [
9384 |       test_file("a.mbt"),
     |       ^^^^^^^^^
     |       test_file("b.mbt"),
     |       test_file("c.mbt"),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9385:7-9385:16:
     |     ..test_ctx(),
     |     open_files: [
     |       test_file("a.mbt"),
9385 |       test_file("b.mbt"),
     |       ^^^^^^^^^
     |       test_file("c.mbt"),
     |       test_file(gone_path.0),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9386:7-9386:16:
     |     open_files: [
     |       test_file("a.mbt"),
     |       test_file("b.mbt"),
9386 |       test_file("c.mbt"),
     |       ^^^^^^^^^
     |       test_file(gone_path.0),
     |       test_file(reviewed_path.0),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9387:7-9387:16:
     |       test_file("a.mbt"),
     |       test_file("b.mbt"),
     |       test_file("c.mbt"),
9387 |       test_file(gone_path.0),
     |       ^^^^^^^^^
     |       test_file(reviewed_path.0),
     |     ],

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9388:7-9388:16:
     |       test_file("b.mbt"),
     |       test_file("c.mbt"),
     |       test_file(gone_path.0),
9388 |       test_file(reviewed_path.0),
     |       ^^^^^^^^^
     |     ],
     |     active_file: Some(test_file("a.mbt")),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9390:23-9390:32:
     |       test_file(gone_path.0),
     |       test_file(reviewed_path.0),
     |     ],
9390 |     active_file: Some(test_file("a.mbt")),
     |                       ^^^^^^^^^
     |   }
     |   let failed : @protocol.FileSignature = Failed("permission denied")

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9400:17-9400:26:
     |       owner=test_ctx().owner.host().unwrap(),
     |       epoch=0,
     |       stats=[
9400 |         { path: test_file("a.mbt"), signature: failed, },
     |                 ^^^^^^^^^
     |         { path: test_file("b.mbt"), signature: failed, },
     |         { path: test_file("c.mbt"), signature: failed, },

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9401:17-9401:26:
     |       epoch=0,
     |       stats=[
     |         { path: test_file("a.mbt"), signature: failed, },
9401 |         { path: test_file("b.mbt"), signature: failed, },
     |                 ^^^^^^^^^
     |         { path: test_file("c.mbt"), signature: failed, },
     |         { path: test_file(gone_path.0), signature: failed, },

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9402:17-9402:26:
     |       stats=[
     |         { path: test_file("a.mbt"), signature: failed, },
     |         { path: test_file("b.mbt"), signature: failed, },
9402 |         { path: test_file("c.mbt"), signature: failed, },
     |                 ^^^^^^^^^
     |         { path: test_file(gone_path.0), signature: failed, },
     |         { path: test_file(reviewed_path.0), signature: failed, },

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9403:17-9403:26:
     |         { path: test_file("a.mbt"), signature: failed, },
     |         { path: test_file("b.mbt"), signature: failed, },
     |         { path: test_file("c.mbt"), signature: failed, },
9403 |         { path: test_file(gone_path.0), signature: failed, },
     |                 ^^^^^^^^^
     |         { path: test_file(reviewed_path.0), signature: failed, },
     |       ],

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9404:17-9404:26:
     |         { path: test_file("b.mbt"), signature: failed, },
     |         { path: test_file("c.mbt"), signature: failed, },
     |         { path: test_file(gone_path.0), signature: failed, },
9404 |         { path: test_file(reviewed_path.0), signature: failed, },
     |                 ^^^^^^^^^
     |       ],
     |     ),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9413:19-9413:28:
     |   // A loaded document, active or not, shows the failure where the deleted
     |   // notice would otherwise have appeared.
     |   assert_true(
9413 |     next.docs.get(test_file("a.mbt"))
     |                   ^^^^^^^^^
     |     is Some({ state: TabReadFailed("permission denied"), stale: false, .. }),
     |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9418:19-9418:28:
     |   )
     |   // A read in flight settles the document itself.
     |   assert_true(
9418 |     next.docs.get(test_file("b.mbt")) is Some({ state: TabLoading, .. }),
     |                   ^^^^^^^^^
     |   )
     |   // Something the host cannot inspect sits where a deleted file was: that is

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9423:19-9423:28:
     |   // Something the host cannot inspect sits where a deleted file was: that is
     |   // a failed read of a present path, not a confirmed deletion.
     |   assert_true(
9423 |     next.docs.get(test_file("c.mbt"))
     |                   ^^^^^^^^^
     |     is Some({ state: TabReadFailed("permission denied"), .. }),
     |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9429:19-9429:28:
     |   // A selected deletion row keeps its HEAD preview: the object at the path
     |   // belongs to a separate untracked row.
     |   assert_true(
9429 |     next.docs.get(test_file(gone_path.0))
     |                   ^^^^^^^^^
     |     is Some(
     |       { state: TabDeleted, review: Some({ working_generation: 3, .. }), .. }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9437:19-9437:28:
     |   // A reviewed working file fences the tagged read that may still be in
     |   // flight, like a deletion does.
     |   assert_true(
9437 |     next.docs.get(test_file(reviewed_path.0))
     |                   ^^^^^^^^^
     |     is Some(
     |       {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9461:14-9461:23:
     | test "StatsLoaded preserves a settled HEAD preview when its active file disappears" {
     |   let emit = test_emit()
     |   let path = @pathx.Relative("reviewed.mbt")
9461 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let doc = {
     |     ..loaded_doc("reviewed.mbt"),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9503:8-9503:17:
     | test "a deleted document whose file reappears reloads on the next stats" {
     |   let emit = test_emit()
     |   let docs : Map[@common.Uri, Doc] = Map([])
9503 |   docs[test_file("a.mbt")] = {
     |        ^^^^^^^^^
     |     name: "a.mbt",
     |     state: TabDeleted,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9516:22-9516:31:
     |       recheck_diagnostics=true,
     |       owner=test_ctx().owner.host().unwrap(),
     |       epoch=0,
9516 |       stats=[{ path: test_file("a.mbt"), signature: Present("3:0"), }],
     |                      ^^^^^^^^^
     |     ),
     |     state,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9519:34-9519:43:
     |       stats=[{ path: test_file("a.mbt"), signature: Present("3:0"), }],
     |     ),
     |     state,
9519 |     { ..test_ctx(), open_files: [test_file("a.mbt")], },
     |                                  ^^^^^^^^^
     |   )
     |   // Background reappearance: stale, reloaded on activation.

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9523:19-9523:28:
     |   )
     |   // Background reappearance: stale, reloaded on activation.
     |   assert_true(
9523 |     next.docs.get(test_file("a.mbt"))
     |                   ^^^^^^^^^
     |     is Some({ state: TabDeleted, stale: true, .. }),
     |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9532:14-9532:23:
     | test "a selected deletion hands a clean restoration to an ordinary read" {
     |   let emit = test_emit()
     |   let path = @pathx.Relative("recreated.mbt")
9532 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let deleted : ChangedFile = {
     |     path,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9656:14-9656:23:
     | test "a vanished review retries a failed ordinary read" {
     |   let emit = test_emit()
     |   let path = @pathx.Relative("committed.mbt")
9656 |   let file = test_file(path.0)
     |              ^^^^^^^^^
     |   let docs : Map[@common.Uri, Doc] = Map([])
     |   docs[file] = {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9791:7-9791:16:
     |   let ctx = {
     |     ..test_ctx(),
     |     open_files: [
9791 |       test_file("src/main.mbt"),
     |       ^^^^^^^^^
     |       test_file("node_modules/pkg/index.js"),
     |     ],

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9792:7-9792:16:
     |     ..test_ctx(),
     |     open_files: [
     |       test_file("src/main.mbt"),
9792 |       test_file("node_modules/pkg/index.js"),
     |       ^^^^^^^^^
     |     ],
     |   }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9895:51-9895:60:
     |   let attached_generation = watched.watch_generation
     |   // Opening a file or expanding a directory replaces the same conversation's
     |   // watcher with the new exact selection.
9895 |   let selected_ctx = { ..test_ctx(), open_files: [test_file("a.mbt")], }
     |                                                   ^^^^^^^^^
     |   let selected = { ..watched, expanded: [Relative("src")], }
     |   let (replaced, _) = sync(emit, selected, selected_ctx)

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:9939:18-9939:27:
     |   let still_ctx = {
     |     ..test_ctx(),
     |     panel_open: false,
9939 |     open_files: [test_file("a.mbt")],
     |                  ^^^^^^^^^
     |   }
     |   let closed = { ..picking, children: Map([]), loading: [], highlighted: None, }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt:10034:18-10034:27:
      |   // A real policy change starts one fresh concrete watcher generation.
      |   let retry_ctx = {
      |     ..ctx,
10034 |     open_files: [test_file("node_modules/pkg/index.js")],
      |                  ^^^^^^^^^
      |   }
      |   let (retried, _) = sync(emit, stopped, retry_ctx)
"" (escaped)
```
