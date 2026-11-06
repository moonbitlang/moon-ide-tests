# openseek hover

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' hover 'dir' --loc 'desktop/backend/host/host_wbtest.mbt:9:7' --target native --no-check
///|
async test "native language preference survives independent reads and rejects invalid writes" {
  let dir = @fs.tmpdir(prefix="openseek-ui-language-")
      ^^^
      ```moonbit
      String
      ```
  defer @fs.rmdir(dir, recursive=true)
  assert_eq(read_ui_language(Some(dir)).language, None)
```
