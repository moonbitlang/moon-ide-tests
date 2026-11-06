# openseek rename source desktop/protocol/session_import_test.mbt:5:7

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' rename 'source' 'source_renamed' --loc 'desktop/protocol/session_import_test.mbt:5:7' --target native --no-check
*** Begin Patch
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\protocol\session_import_test.mbt
@@
 test "import request codecs preserve source and optional worktree placement" {
   for worktree_of in [None, Some("source-session")] {
     for
-      source in [
+      source_renamed in [
         @protocol.JsonFile(text="{}"),
         ShareLink(url="https://example/v1/shares/sh_test"),
       ] {
       let payload : @protocol.SessionImportPayload = {
-        source,
+        source: source_renamed,
         workspace: "/project",
         worktree_of,
       }
*** End Patch
"" (escaped)
```
