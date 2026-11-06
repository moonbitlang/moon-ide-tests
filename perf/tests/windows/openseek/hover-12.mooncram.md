# openseek hover

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' hover 'source' --loc 'desktop/protocol/session_import_test.mbt:5:7' --target native --no-check
test "import request codecs preserve source and optional worktree placement" {
  for worktree_of in [None, Some("source-session")] {
    for
      source in [
      ^^^^^^
      ```moonbit
      @protocol.SessionImportSource
      ```
        @protocol.JsonFile(text="{}"),
        ShareLink(url="https://example/v1/shares/sh_test"),
```
