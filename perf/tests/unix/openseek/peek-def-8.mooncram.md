# openseek peek-def

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' peek-def 'test_file' --loc 'desktop/frontend/fileeditor/loading_wbtest.mbt:3:14' --target js --no-check
Definition found at file e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\fileeditor\update.mbt
     |   resource
     | }
     | 
     | ///|
     | /// A file below the shared test checkout, named the way the dock keys it.
5023 | fn test_file(path : String) -> @common.Uri raise {
     |    ^^^^^^^^^
     |   test_ctx().test_resource("/work/" + path)
     | }
     | 
     | ///|
     | /// Put a test context in a live managed worktree whose project and checkout
     | /// share the fixture root. Tests that park it as missing then change only
     | /// availability, matching the production registry transition.
     | fn Ctx::test_worktree(self : Ctx, name : String) -> Ctx raise {
     |   let root = self.test_root()
     |   { ..self, placement: Some(@interop.Worktree(project=root, name~, root~)), }
     | }
     | 
     | ///|
     | fn owned_state() -> State {
```
