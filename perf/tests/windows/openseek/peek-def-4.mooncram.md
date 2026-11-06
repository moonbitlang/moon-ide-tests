# openseek peek-def

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' peek-def 'tmpdir' --loc 'desktop/backend/host/host_wbtest.mbt:9:17' --target native --no-check
Definition found at file e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\.mooncakes\moonbitlang\async\src\fs\tmpdir.mbt
   | /// so at most 2^32 temporary directories can be created for every process.
   | /// However, due to collision, `tmpdir` will slow down
   | /// when a lot of temporary directories are created by the same process.
   | ///
   | /// The temporary directory name is not cryptographically secure.
53 | pub async fn tmpdir(prefix~ : StringView) -> String {
   |              ^^^^^^
   |   for _ in 0..<@int.MAX_VALUE {
   |     let hasher = Hasher()
   |     hasher.combine_uint64(tmpdir_seed.uint64())
   |     hasher.combine_int64(@event_loop.now())
   |     let h = hasher.finalize().reinterpret_as_uint()
   |     let path = StringBuilder()
   |     path.write_string(tmp_base_path)
   |     path.write_stringview(prefix)
   |     path.write_char('.')
   |     path.write_string(@env_util.current_process.to_string())
   |     path.write_char('.')
   |     path.write_string(h.to_string(radix=16))
   |     let path = path.to_string()
   |     try @event_loop.mkdir(path, mode=0o700, context="@fs.tmpdir()") catch {
```
