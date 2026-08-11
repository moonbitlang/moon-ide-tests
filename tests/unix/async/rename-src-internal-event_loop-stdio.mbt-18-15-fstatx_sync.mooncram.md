# async rename fstatx_sync src/internal/event_loop/stdio.mbt:18:15

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/async" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide rename 'fstatx_sync' 'fstatx_sync_renamed' --loc 'src/internal/event_loop/stdio.mbt:18:15'
*** Begin Patch
*** Update File: <WORKDIR>/src/internal/event_loop/stdio.mbt
@@
 ///|
 #cfg(target="native")
 #borrow(buf)
-extern "C" fn fstatx_sync(
+extern "C" fn fstatx_sync_renamed(
   fd : @fd_util.Fd,
   request : UInt,
   buf : FixedArray[Byte],
@@
   context~ : String,
 ) -> @fd_util.FileKind raise {
   let buf = FixedArray::make(16, b'\x00')
-  if fstatx_sync(fd, STAT_FILE_KIND, buf, buf.length()) < 0 {
+  if fstatx_sync_renamed(fd, STAT_FILE_KIND, buf, buf.length()) < 0 {
     @os_error.check_errno(context)
   }
   guard! buf is [u32le(_), u32le(mask), i64le(kind)]
*** End Patch

```
