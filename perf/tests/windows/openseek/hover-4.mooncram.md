# openseek hover

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' hover 'tmpdir' --loc 'desktop/backend/host/host_wbtest.mbt:9:17' --target native --no-check
///|
async test "native language preference survives independent reads and rejects invalid writes" {
  let dir = @fs.tmpdir(prefix="openseek-ui-language-")
            ^^^^^^^^^^
            ```moonbit
            async fn @moonbitlang/async/fs.tmpdir(prefix~ : StringView) -> String
            ```
            ---
            
             Create a temporary directory in the system-specific temporary file storage
             (such as `/tmp/`) with prefix `prefix`.
             `tmpdir` force-create the directory atomically, so it never reuse directory.
            
             The format of the directory name is:
            
               <prefix>.<current_pid>.<random_number>
            
             The random number part cotains 32bits of information,
             so at most 2^32 temporary directories can be created for every process.
             However, due to collision, `tmpdir` will slow down
             when a lot of temporary directories are created by the same process.
            
             The temporary directory name is not cryptographically secure.
  defer @fs.rmdir(dir, recursive=true)
  assert_eq(read_ui_language(Some(dir)).language, None)
```
