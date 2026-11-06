# openseek rename worktree_of desktop/protocol/session_import_test.mbt:3:7

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' rename 'worktree_of' 'worktree_of_renamed' --loc 'desktop/protocol/session_import_test.mbt:3:7' --target native --no-check
*** Begin Patch
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\protocol\session_import_test.mbt
@@
 ///|
 test "import request codecs preserve source and optional worktree placement" {
-  for worktree_of in [None, Some("source-session")] {
+  for worktree_of_renamed in [None, Some("source-session")] {
     for
       source in [
         @protocol.JsonFile(text="{}"),
@@
       let payload : @protocol.SessionImportPayload = {
         source,
         workspace: "/project",
-        worktree_of,
+        worktree_of: worktree_of_renamed,
       }
       let encoded = payload.to_json()
       let decoded : @protocol.SessionImportPayload = @json.from_json(encoded)
       assert_eq(decoded, payload)
       assert_true(
-        match worktree_of {
+        match worktree_of_renamed {
           None => encoded is { "worktree_of": Null, .. }
           Some(_) => encoded is { "worktree_of": String("source-session"), .. }
         },
*** End Patch
"" (escaped)
```
