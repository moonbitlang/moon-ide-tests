# openseek hover

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' hover 'test_file' --loc 'desktop/frontend/fileeditor/loading_wbtest.mbt:3:14' --target js --no-check
///|
test "ordinary retries without previewable content enter loading but successful refreshes retain content" {
  let file = test_file("retry.txt")
             ^^^^^^^^^
             ```moonbit
             fn test_file(path : String) -> @common.Uri raise
             ```
             ---
             
              A file below the shared test checkout, named the way the dock keys it.
  let ctx = { ..test_ctx(), open_files: [file], active_file: Some(file), }
  for previous in [TabBinary, TabOversized, TabReadFailed("failed")] {
```
