# openseek find-references source desktop/protocol/session_import_test.mbt:5:7

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' find-references 'source' --loc 'desktop/protocol/session_import_test.mbt:5:7' --target native --no-check
Found 1 references for symbol 'source':
e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\protocol\session_import_test.mbt:10:9-10:15:
   |         ShareLink(url="https://example/v1/shares/sh_test"),
   |       ] {
   |       let payload : @protocol.SessionImportPayload = {
10 |         source,
   |         ^^^^^^
   |         workspace: "/project",
   |         worktree_of,
"" (escaped)
```
