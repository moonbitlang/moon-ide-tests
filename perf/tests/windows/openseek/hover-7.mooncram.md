# openseek hover

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' hover 'file' --loc 'desktop/frontend/fileeditor/loading_wbtest.mbt:3:7' --target js --no-check
///|
test "ordinary retries without previewable content enter loading but successful refreshes retain content" {
  let file = test_file("retry.txt")
      ^^^^
      ```moonbit
      @common.Uri
      ```
  let ctx = { ..test_ctx(), open_files: [file], active_file: Some(file), }
  for previous in [TabBinary, TabOversized, TabReadFailed("failed")] {
```
