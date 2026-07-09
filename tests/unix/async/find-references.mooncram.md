# async find-references

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
$ run_moon_ide moon ide find-references 'mkdir' --loc 'src/fs/dir.mbt:24:14'
Found 27 references for symbol 'mkdir':
<WORKDIR>/src/fs/README.mbt.md:281:7-281:12:
    | #cfg(target="native")
    | async test "mkdir - create directory" {
    |   let dir_path = "_build/test_mkdir"
281 |   @fs.mkdir(dir_path, permission=0o755)
    |       ^^^^^
    |   let exists = @fs.exists(dir_path)
    |   @fs.rmdir(dir_path)

<WORKDIR>/src/fs/README.mbt.md:291:7-291:12:
    | #cfg(target="native")
    | async test "mkdir - create with custom permissions" {
    |   let dir_path = "_build/test_mkdir_perm"
291 |   @fs.mkdir(dir_path, permission=0o700)
    |       ^^^^^
    |   let kind = @fs.kind(dir_path)
    |   @fs.rmdir(dir_path)

<WORKDIR>/src/fs/README.mbt.md:305:7-305:12:
    | #cfg(target="native")
    | async test "readdir - read directory entries" {
    |   let dir_path = "_build/test_readdir"
305 |   @fs.mkdir(dir_path, permission=0o755)
    |       ^^^^^
    |   @fs.write_file("\{dir_path}/test1.txt", b"", create_mode=CreateOrTruncate)
    |   @fs.write_file("\{dir_path}/test2.txt", b"", create_mode=CreateOrTruncate)

<WORKDIR>/src/fs/README.mbt.md:323:7-323:12:
    | #cfg(target="native")
    | async test "readdir with sorting" {
    |   let dir_path = "_build/test_readdir_sort"
323 |   @fs.mkdir(dir_path, permission=0o755)
    |       ^^^^^
    |   @fs.write_file("\{dir_path}/c.txt", b"", create_mode=CreateOrTruncate)
    |   @fs.write_file("\{dir_path}/a.txt", b"", create_mode=CreateOrTruncate)

<WORKDIR>/src/fs/README.mbt.md:336:7-336:12:
    | #cfg(target="native")
    | async test "opendir and Directory::read_all" {
    |   let dir_path = "_build/test_opendir"
336 |   @fs.mkdir(dir_path, permission=0o755)
    |       ^^^^^
    |   @fs.write_file("\{dir_path}/file1.txt", b"test", create_mode=CreateOrTruncate)
    |   @fs.write_file("\{dir_path}/file2.txt", b"test", create_mode=CreateOrTruncate)

<WORKDIR>/src/fs/README.mbt.md:358:7-358:12:
    | #cfg(target="native")
    | async test "walk directory tree" {
    |   let base = "_build/test_walk"
358 |   @fs.mkdir(base)
    |       ^^^^^
    |   @fs.mkdir("\{base}/sub1")
    |   @fs.mkdir("\{base}/sub2")

<WORKDIR>/src/fs/README.mbt.md:359:7-359:12:
    | async test "walk directory tree" {
    |   let base = "_build/test_walk"
    |   @fs.mkdir(base)
359 |   @fs.mkdir("\{base}/sub1")
    |       ^^^^^
    |   @fs.mkdir("\{base}/sub2")
    |   @fs.write_file("\{base}/file.txt", b"", create_mode=CreateOrTruncate)

<WORKDIR>/src/fs/README.mbt.md:360:7-360:12:
    |   let base = "_build/test_walk"
    |   @fs.mkdir(base)
    |   @fs.mkdir("\{base}/sub1")
360 |   @fs.mkdir("\{base}/sub2")
    |       ^^^^^
    |   @fs.write_file("\{base}/file.txt", b"", create_mode=CreateOrTruncate)
    |   @fs.write_file("\{base}/sub1/file1.txt", b"", create_mode=CreateOrTruncate)

<WORKDIR>/src/fs/README.mbt.md:377:7-377:12:
    | #cfg(target="native")
    | async test "walk with max_concurrency" {
    |   let base = "_build/test_walk_concurrency"
377 |   @fs.mkdir(base, permission=0o755)
    |       ^^^^^
    |   @fs.mkdir("\{base}/dir1", permission=0o755)
    |   @fs.mkdir("\{base}/dir2", permission=0o755)

<WORKDIR>/src/fs/README.mbt.md:378:7-378:12:
    | async test "walk with max_concurrency" {
    |   let base = "_build/test_walk_concurrency"
    |   @fs.mkdir(base, permission=0o755)
378 |   @fs.mkdir("\{base}/dir1", permission=0o755)
    |       ^^^^^
    |   @fs.mkdir("\{base}/dir2", permission=0o755)
    |   let count : Ref[Int] = Ref(0)

<WORKDIR>/src/fs/README.mbt.md:379:7-379:12:
    |   let base = "_build/test_walk_concurrency"
    |   @fs.mkdir(base, permission=0o755)
    |   @fs.mkdir("\{base}/dir1", permission=0o755)
379 |   @fs.mkdir("\{base}/dir2", permission=0o755)
    |       ^^^^^
    |   let count : Ref[Int] = Ref(0)
    |   @fs.walk(

<WORKDIR>/src/fs/README.mbt.md:400:7-400:12:
    | #cfg(target="native")
    | async test "rmdir - remove empty directory" {
    |   let dir_path = "_build/test_rmdir"
400 |   @fs.mkdir(dir_path)
    |       ^^^^^
    |   @fs.rmdir(dir_path)
    |   let exists = @fs.exists(dir_path)

<WORKDIR>/src/fs/README.mbt.md:410:7-410:12:
    | #cfg(target="native")
    | async test "rmdir recursive - remove directory tree" {
    |   let base = "_build/test_rmdir_recursive"
410 |   @fs.mkdir(base)
    |       ^^^^^
    |   @fs.mkdir("\{base}/subdir")
    |   @fs.write_file("\{base}/file.txt", b"test", create_mode=CreateOrTruncate)

<WORKDIR>/src/fs/README.mbt.md:411:7-411:12:
    | async test "rmdir recursive - remove directory tree" {
    |   let base = "_build/test_rmdir_recursive"
    |   @fs.mkdir(base)
411 |   @fs.mkdir("\{base}/subdir")
    |       ^^^^^
    |   @fs.write_file("\{base}/file.txt", b"test", create_mode=CreateOrTruncate)
    |   @fs.write_file(

<WORKDIR>/src/fs/README.mbt.md:445:7-445:12:
    | #cfg(target="native")
    | async test "kind - directory" {
    |   let dir_path = "_build/test_kind_dir"
445 |   @fs.mkdir(dir_path, permission=0o755)
    |       ^^^^^
    |   let kind = @fs.kind(dir_path)
    |   @fs.rmdir(dir_path)

<WORKDIR>/src/fs/README.mbt.md:579:7-579:12:
    | #cfg(target="native")
    | async test "realpath - resolve absolute path" {
    |   let test_dir = "_build/test_realpath"
579 |   @fs.mkdir(test_dir)
    |       ^^^^^
    |   let real_path = @fs.realpath(test_dir)
    |   @fs.rmdir(test_dir)

<WORKDIR>/src/fs/dir.mbt:24:14-24:19:
   | ///
   | /// If `recursive=true` (`false` by default), non-existing parent directories
   | /// of `path` will be recursively created, too.
24 | pub async fn mkdir(
   |              ^^^^^
   |   path : StringView,
   |   permission? : Int = 0o755,

<WORKDIR>/src/fs/dir.mbt:44:7-44:12:
   |       } else {
   |         parent
   |       }
44 |       mkdir(parent, permission~, recursive~)
   |       ^^^^^
   |       @event_loop.mkdir(path, mode=permission, context~)
   |     }

<WORKDIR>/src/fs/mkdir_test.mbt:18:7-18:12:
   | ///|
   | async test "mkdir" {
   |   let path = "_build/mkdir_test"
18 |   @fs.mkdir(path)
   |       ^^^^^
   |   @fs.write_file("\{path}/file", "", create_mode=CreateOrTruncate)
   |   let result = @fs.readdir(path, sort=true)

<WORKDIR>/src/fs/mkdir_test.mbt:30:7-30:12:
   | async test "rmdir recursive" {
   |   guard @env.current_dir() is Some(cwd)
   |   let path = "_build/rmdir_test"
30 |   @fs.mkdir(path, permission=0o755)
   |       ^^^^^
   |   @fs.write_file("\{path}/file", "", create_mode=CreateOrTruncate)
   |   @fs.mkdir("\{path}/inner")

<WORKDIR>/src/fs/mkdir_test.mbt:32:7-32:12:
   |   let path = "_build/rmdir_test"
   |   @fs.mkdir(path, permission=0o755)
   |   @fs.write_file("\{path}/file", "", create_mode=CreateOrTruncate)
32 |   @fs.mkdir("\{path}/inner")
   |       ^^^^^
   |   @fs.write_file("\{path}/inner/file", "", create_mode=CreateOrTruncate)
   |   @fs.symlink("\{path}/symlink", target="\{cwd}/_build")

<WORKDIR>/src/fs/mkdir_test.mbt:44:9-44:14:
   |   @async.with_task_group() <| group => {
   |     let base_path = "_build/recursive_mkdir"
   |     let path = "\{base_path}/test//directory"
44 |     @fs.mkdir(path, recursive=true)
   |         ^^^^^
   |     group.add_defer(() => @fs.rmdir(base_path, recursive=true))
   |     json_inspect(@fs.readdir(base_path), content=["test"])

<WORKDIR>/src/fs/watch_test.mbt:26:11-26:16:
   |   match self {
   |     File(content) => @fs.write_file(path, content, create_mode=CreateOrTruncate)
   |     Dir(files) => {
26 |       @fs.mkdir(path)
   |           ^^^^^
   |       for name, file in files {
   |         file.instantiate("\{path}/\{name}")

<WORKDIR>/src/fs/watch_test.mbt:113:9-113:14:
    | 
    |     // 10. create new inner directory
    |     log.push("creating new directory in root directory")
113 |     @fs.mkdir("\{path}/inner_dir")
    |         ^^^^^
    |     @async.sleep(150)
    | 

<WORKDIR>/src/fs/watch_test.mbt:527:9-527:14:
    | 
    |     // 11. re-create directory at ignored path
    |     log.push("re-creating directory at ignored path")
527 |     @fs.mkdir("\{path}/ignored")
    |         ^^^^^
    |     @async.sleep(150)
    | 

<WORKDIR>/src/fs/watch_test.mbt:545:9-545:14:
    | 
    |     // 14. re-create directory at normal path
    |     log.push("re-creating directory at normal path")
545 |     @fs.mkdir("\{path}/normal")
    |         ^^^^^
    |     @async.sleep(150)
    | 

<WORKDIR>/src/os_error/os_error_test.mbt:29:9-29:14:
   | ///|
   | async test "is_EEXIST" {
   |   let err = @test_util.expect_error_async <| () => {
29 |     @fs.mkdir("src", permission=0o755)
   |         ^^^^^
   |   }
   |   match err {

```

```mooncram
$ run_moon_ide moon ide find-references 'path' --loc 'src/fs/dir.mbt:25:3'
Found 6 references for symbol 'path':
<WORKDIR>/src/fs/dir.mbt:25:3-25:7:
   | /// If `recursive=true` (`false` by default), non-existing parent directories
   | /// of `path` will be recursively created, too.
   | pub async fn mkdir(
25 |   path : StringView,
   |   ^^^^
   |   permission? : Int = 0o755,
   |   recursive? : Bool = false,

<WORKDIR>/src/fs/dir.mbt:30:21-30:25:
   |   recursive? : Bool = false,
   | ) -> Unit {
   |   let context = "@fs.mkdir()"
30 |   @event_loop.mkdir(path, mode=permission, context~) catch {
   |                     ^^^^
   |     @os_error.OSError(_) as err if recursive && err.is_ENOENT() => {
   |       let last_path_sep_index = match path.rev_find("/") {

<WORKDIR>/src/fs/dir.mbt:32:39-32:43:
   |   let context = "@fs.mkdir()"
   |   @event_loop.mkdir(path, mode=permission, context~) catch {
   |     @os_error.OSError(_) as err if recursive && err.is_ENOENT() => {
32 |       let last_path_sep_index = match path.rev_find("/") {
   |                                       ^^^^
   |         Some(index) => index
   |         None if @event_loop.platform is Windows &&

<WORKDIR>/src/fs/dir.mbt:35:11-35:15:
   |       let last_path_sep_index = match path.rev_find("/") {
   |         Some(index) => index
   |         None if @event_loop.platform is Windows &&
35 |           path.rev_find("\\") is Some(index) => index
   |           ^^^^
   |         None => raise err
   |       }

<WORKDIR>/src/fs/dir.mbt:38:20-38:24:
   |           path.rev_find("\\") is Some(index) => index
   |         None => raise err
   |       }
38 |       let parent = path[:last_path_sep_index].trim_end(chars="/")
   |                    ^^^^
   |       let parent = if @event_loop.platform is Windows {
   |         parent.trim_end(chars="\\")

<WORKDIR>/src/fs/dir.mbt:45:25-45:29:
   |         parent
   |       }
   |       mkdir(parent, permission~, recursive~)
45 |       @event_loop.mkdir(path, mode=permission, context~)
   |                         ^^^^
   |     }
   |     err => raise err

```

```mooncram
$ run_moon_ide moon ide find-references 'File' --loc 'src/fs/file.mbt:16:8'
Found 37 references for symbol 'File':
<WORKDIR>/src/fs/file.mbt:16:8-16:12:
   | // limitations under the License.
   | 
   | ///|
16 | struct File {
   |        ^^^^
   |   io : @event_loop.IoHandle
   |   read_buf : @io.ReaderBuffer

<WORKDIR>/src/fs/file.mbt:22:8-22:12:
   | }
   | 
   | ///|
22 | pub fn File::fd(self : File) -> @fd_util.Fd {
   |        ^^^^
   |   self.io.fd()
   | }

<WORKDIR>/src/fs/file.mbt:22:24-22:28:
   | }
   | 
   | ///|
22 | pub fn File::fd(self : File) -> @fd_util.Fd {
   |                        ^^^^
   |   self.io.fd()
   | }

<WORKDIR>/src/fs/file.mbt:27:8-27:12:
   | }
   | 
   | ///|
27 | pub fn File::close(self : File) -> Unit {
   |        ^^^^
   |   self.io.close()
   | }

<WORKDIR>/src/fs/file.mbt:27:27-27:31:
   | }
   | 
   | ///|
27 | pub fn File::close(self : File) -> Unit {
   |                           ^^^^
   |   self.io.close()
   | }

<WORKDIR>/src/fs/file.mbt:121:6-121:10:
    |   permission? : Int,
    |   create? : Int,
    |   truncate? : Bool = false,
121 | ) -> File {
    |      ^^^^
    |   let access = match mode {
    |     ReadOnly => 0

<WORKDIR>/src/fs/file.mbt:181:6-181:10:
    |   allow_existing? : Bool = true,
    |   permission? : Int = 0o644,
    |   sync? : SyncMode = NoSync,
181 | ) -> File {
    |      ^^^^
    |   let create_mode = if allow_existing { CreateOrTruncate } else { CreateNew }
    |   open(filename, mode=WriteOnly, sync~, create_mode~, permission~)

<WORKDIR>/src/fs/file.mbt:201:25-201:29:
    | /// the content of the file will be read as a byte stream.
    | /// The position of the read stream in the file is
    | /// independent of the write stream (via the `@io.Writer` interface)
201 | pub impl @io.Reader for File with fn _direct_read(self, buf, offset~, max_len~) {
    |                         ^^^^
    |   self.io.read(buf, offset~, len=max_len, context="@fs.File::read()")
    | }

<WORKDIR>/src/fs/file.mbt:206:25-206:29:
    | }
    | 
    | ///|
206 | pub impl @io.Reader for File with fn _get_internal_buffer(self) {
    |                         ^^^^
    |   self.read_buf
    | }

<WORKDIR>/src/fs/file.mbt:222:14-222:18:
    | /// Up to `len` bytes of data will be read into `buf[offset:]`.
    | /// The number of bytes actually read would be returned.
    | /// The number of read bytes will be smaller than `len` only when EOF is reached.
222 | pub async fn File::read_at(
    |              ^^^^
    |   self : File,
    |   buf : FixedArray[Byte],

<WORKDIR>/src/fs/file.mbt:223:10-223:14:
    | /// The number of bytes actually read would be returned.
    | /// The number of read bytes will be smaller than `len` only when EOF is reached.
    | pub async fn File::read_at(
223 |   self : File,
    |          ^^^^
    |   buf : FixedArray[Byte],
    |   position~ : Int64,

<WORKDIR>/src/fs/file.mbt:233:14-233:18:
    | }
    | 
    | ///|
233 | pub async fn File::read_exactly_at(
    |              ^^^^
    |   self : File,
    |   len : Int,

<WORKDIR>/src/fs/file.mbt:234:10-234:14:
    | 
    | ///|
    | pub async fn File::read_exactly_at(
234 |   self : File,
    |          ^^^^
    |   len : Int,
    |   position~ : Int64,

<WORKDIR>/src/fs/file.mbt:262:25-262:29:
    | /// will be written as a byte stream, starting at offset 0.
    | /// The position of the write stream in the file is
    | /// independent of the read stream (via the `@io.Reader` interface)
262 | pub impl @io.Writer for File with fn write_once(self, buf, offset~, len~) {
    |                         ^^^^
    |   self.io.write(buf, offset~, len~, context="@fs.File::write()")
    | }

<WORKDIR>/src/fs/file.mbt:277:14-277:18:
    | /// as long as the regions they write do not overlap.
    | ///
    | /// `write_at` would only return after all data is written.
277 | pub async fn File::write_at(
    |              ^^^^
    |   self : File,
    |   buf : BytesView,

<WORKDIR>/src/fs/file.mbt:278:10-278:14:
    | ///
    | /// `write_at` would only return after all data is written.
    | pub async fn File::write_at(
278 |   self : File,
    |          ^^^^
    |   buf : BytesView,
    |   position~ : Int64,

<WORKDIR>/src/fs/file.mbt:296:14-296:18:
    | /// If `only_data` is `true` (`false` by default),
    | /// some metadata such as timestamp may not be flushed.
    | /// Buf file content and important metadata such as file size are always flushed.
296 | pub async fn File::sync(self : File, only_data? : Bool = false) -> Unit {
    |              ^^^^
    |   self.io.fsync(only_data~, context="@fs.File::sync()")
    | }

<WORKDIR>/src/fs/file.mbt:296:32-296:36:
    | /// If `only_data` is `true` (`false` by default),
    | /// some metadata such as timestamp may not be flushed.
    | /// Buf file content and important metadata such as file size are always flushed.
296 | pub async fn File::sync(self : File, only_data? : Bool = false) -> Unit {
    |                                ^^^^
    |   self.io.fsync(only_data~, context="@fs.File::sync()")
    | }

<WORKDIR>/src/fs/file.mbt:320:14-320:18:
    | /// The underlying syscall used to implement the lock is undefined.
    | /// So the lock should only be used for synchronization between multiple process
    | /// written using `moonbitlang/async`.
320 | pub async fn File::lock(self : File, lock : Lock) -> Unit {
    |              ^^^^
    |   self.io.lock(exclusive=lock is Exclusive, context="@fs.File::lock()")
    | }

<WORKDIR>/src/fs/file.mbt:320:32-320:36:
    | /// The underlying syscall used to implement the lock is undefined.
    | /// So the lock should only be used for synchronization between multiple process
    | /// written using `moonbitlang/async`.
320 | pub async fn File::lock(self : File, lock : Lock) -> Unit {
    |                                ^^^^
    |   self.io.lock(exclusive=lock is Exclusive, context="@fs.File::lock()")
    | }

<WORKDIR>/src/fs/file.mbt:356:8-356:12:
    | /// The underlying syscall used to implement the lock is undefined.
    | /// So the lock should only be used for synchronization between multiple process
    | /// written using `moonbitlang/async`.
356 | pub fn File::try_lock(self : File, lock : Lock) -> Bool raise {
    |        ^^^^
    |   let ret = try_lock_ffi(self.fd(), exclusive=lock is Exclusive)
    |   if ret >= 0 {

<WORKDIR>/src/fs/file.mbt:356:30-356:34:
    | /// The underlying syscall used to implement the lock is undefined.
    | /// So the lock should only be used for synchronization between multiple process
    | /// written using `moonbitlang/async`.
356 | pub fn File::try_lock(self : File, lock : Lock) -> Bool raise {
    |                              ^^^^
    |   let ret = try_lock_ffi(self.fd(), exclusive=lock is Exclusive)
    |   if ret >= 0 {

<WORKDIR>/src/fs/file.mbt:379:8-379:12:
    | 
    | ///|
    | /// Unlock a file that was previously locked by this process.
379 | pub fn File::unlock(self : File) -> Unit {
    |        ^^^^
    |   if unlock_ffi(self.fd()) < 0 {
    |     // swallow the error so that we can use `unlock` in `defer`.

<WORKDIR>/src/fs/file.mbt:379:28-379:32:
    | 
    | ///|
    | /// Unlock a file that was previously locked by this process.
379 | pub fn File::unlock(self : File) -> Unit {
    |                            ^^^^
    |   if unlock_ffi(self.fd()) < 0 {
    |     // swallow the error so that we can use `unlock` in `defer`.

<WORKDIR>/src/fs/file.mbt:411:14-411:18:
    | ///|
    | /// Get the size of the file. This method will not change position in the file.
    | /// Can only be applied to a regular file.
411 | pub async fn File::size(self : File) -> Int64 {
    |              ^^^^
    |   @event_loop.file_size(self.io.fd(), context="@fs.File::size()")
    | }

<WORKDIR>/src/fs/file.mbt:411:32-411:36:
    | ///|
    | /// Get the size of the file. This method will not change position in the file.
    | /// Can only be applied to a regular file.
411 | pub async fn File::size(self : File) -> Int64 {
    |                                ^^^^
    |   @event_loop.file_size(self.io.fd(), context="@fs.File::size()")
    | }

<WORKDIR>/src/fs/file.mbt:423:8-423:12:
    | /// The input file will be automatically closed when the
    | /// result directory object is closed.
    | /// If `as_dir` fails, the input file will be closed automatically.
423 | pub fn File::as_dir(self : File) -> Directory raise {
    |        ^^^^
    |   guard self.io.kind() is Directory else {
    |     self.close()

<WORKDIR>/src/fs/file.mbt:423:28-423:32:
    | /// The input file will be automatically closed when the
    | /// result directory object is closed.
    | /// If `as_dir` fails, the input file will be closed automatically.
423 | pub fn File::as_dir(self : File) -> Directory raise {
    |                            ^^^^
    |   guard self.io.kind() is Directory else {
    |     self.close()

<WORKDIR>/src/fs/file.mbt:440:8-440:12:
    | let _unused : Unit = ignore(@os_error.check_errno)
    | 
    | ///|
440 | pub fn File::kind(self : File) -> FileKind {
    |        ^^^^
    |   FileKind::from_fd_util_file_kind(self.io.kind())
    | }

<WORKDIR>/src/fs/file.mbt:440:26-440:30:
    | let _unused : Unit = ignore(@os_error.check_errno)
    | 
    | ///|
440 | pub fn File::kind(self : File) -> FileKind {
    |                          ^^^^
    |   FileKind::from_fd_util_file_kind(self.io.kind())
    | }

<WORKDIR>/src/fs/file.mbt:448:14-448:18:
    | /// Get the last access time of a file.
    | /// The return value is a pair `(s, ns)`,
    | /// representing the time of `s` seconds + `ns` nanoseconds.
448 | pub async fn File::atime(self : File) -> (Int64, Int) {
    |              ^^^^
    |   @event_loop.file_time(self.io.fd(), context="@fs.File::atime()").atime()
    | }

<WORKDIR>/src/fs/file.mbt:448:33-448:37:
    | /// Get the last access time of a file.
    | /// The return value is a pair `(s, ns)`,
    | /// representing the time of `s` seconds + `ns` nanoseconds.
448 | pub async fn File::atime(self : File) -> (Int64, Int) {
    |                                 ^^^^
    |   @event_loop.file_time(self.io.fd(), context="@fs.File::atime()").atime()
    | }

<WORKDIR>/src/fs/file.mbt:456:14-456:18:
    | /// Get the last modification time of a file.
    | /// The return value is a pair `(s, ns)`,
    | /// representing the time of `s` seconds + `ns` nanoseconds.
456 | pub async fn File::mtime(self : File) -> (Int64, Int) {
    |              ^^^^
    |   @event_loop.file_time(self.io.fd(), context="@fs.File::mtime()").mtime()
    | }

<WORKDIR>/src/fs/file.mbt:456:33-456:37:
    | /// Get the last modification time of a file.
    | /// The return value is a pair `(s, ns)`,
    | /// representing the time of `s` seconds + `ns` nanoseconds.
456 | pub async fn File::mtime(self : File) -> (Int64, Int) {
    |                                 ^^^^
    |   @event_loop.file_time(self.io.fd(), context="@fs.File::mtime()").mtime()
    | }

<WORKDIR>/src/fs/file.mbt:464:14-464:18:
    | /// Get the last status change time of a file.
    | /// The return value is a pair `(s, ns)`,
    | /// representing the time of `s` seconds + `ns` nanoseconds.
464 | pub async fn File::ctime(self : File) -> (Int64, Int) {
    |              ^^^^
    |   @event_loop.file_time(self.io.fd(), context="@fs.File::ctime()").ctime()
    | }

<WORKDIR>/src/fs/file.mbt:464:33-464:37:
    | /// Get the last status change time of a file.
    | /// The return value is a pair `(s, ns)`,
    | /// representing the time of `s` seconds + `ns` nanoseconds.
464 | pub async fn File::ctime(self : File) -> (Int64, Int) {
    |                                 ^^^^
    |   @event_loop.file_time(self.io.fd(), context="@fs.File::ctime()").ctime()
    | }

<WORKDIR>/src/tls/openssl.mbt:715:19-715:23:
    | let _unused : Unit = {
    |   ignore(@os_error.check_errno)
    |   ignore(@os_string.encode)
715 |   ignore((_ : @fs.File) => ())
    |                   ^^^^
    | }

```

```mooncram
$ run_moon_ide moon ide find-references 'io' --loc 'src/fs/file.mbt:17:3'
Found 19 references for symbol 'io':
<WORKDIR>/src/fs/file.mbt:17:3-17:5:
   | 
   | ///|
   | struct File {
17 |   io : @event_loop.IoHandle
   |   ^^
   |   read_buf : @io.ReaderBuffer
   | }

<WORKDIR>/src/fs/file.mbt:23:8-23:10:
   | 
   | ///|
   | pub fn File::fd(self : File) -> @fd_util.Fd {
23 |   self.io.fd()
   |        ^^
   | }
   | 

<WORKDIR>/src/fs/file.mbt:28:8-28:10:
   | 
   | ///|
   | pub fn File::close(self : File) -> Unit {
28 |   self.io.close()
   |        ^^
   | }
   | 

<WORKDIR>/src/fs/file.mbt:156:5-156:7:
    |     mode=permission,
    |     context="@fs.open()",
    |   )
156 |   { io, read_buf: @io.ReaderBuffer::new() }
    |     ^^
    | }
    | 

<WORKDIR>/src/fs/file.mbt:202:8-202:10:
    | /// The position of the read stream in the file is
    | /// independent of the write stream (via the `@io.Writer` interface)
    | pub impl @io.Reader for File with fn _direct_read(self, buf, offset~, max_len~) {
202 |   self.io.read(buf, offset~, len=max_len, context="@fs.File::read()")
    |        ^^
    | }
    | 

<WORKDIR>/src/fs/file.mbt:229:8-229:10:
    |   offset? : Int = 0,
    |   len? : Int = buf.length() - offset,
    | ) -> Int {
229 |   self.io.read_at(buf, offset~, len~, position~, context="@fs.File::read_at()")
    |        ^^
    | }
    | 

<WORKDIR>/src/fs/file.mbt:239:16-239:18:
    |   position~ : Int64,
    | ) -> Bytes {
    |   let buf = FixedArray::make(len, b'\x00')
239 |   let n = self.io.read_at(
    |                ^^
    |     buf,
    |     offset=0,

<WORKDIR>/src/fs/file.mbt:263:8-263:10:
    | /// The position of the write stream in the file is
    | /// independent of the read stream (via the `@io.Reader` interface)
    | pub impl @io.Writer for File with fn write_once(self, buf, offset~, len~) {
263 |   self.io.write(buf, offset~, len~, context="@fs.File::write()")
    |        ^^
    | }
    | 

<WORKDIR>/src/fs/file.mbt:282:8-282:10:
    |   buf : BytesView,
    |   position~ : Int64,
    | ) -> Unit {
282 |   self.io.write_at(
    |        ^^
    |     buf.data(),
    |     offset=buf.start_offset(),

<WORKDIR>/src/fs/file.mbt:297:8-297:10:
    | /// some metadata such as timestamp may not be flushed.
    | /// Buf file content and important metadata such as file size are always flushed.
    | pub async fn File::sync(self : File, only_data? : Bool = false) -> Unit {
297 |   self.io.fsync(only_data~, context="@fs.File::sync()")
    |        ^^
    | }
    | 

<WORKDIR>/src/fs/file.mbt:321:8-321:10:
    | /// So the lock should only be used for synchronization between multiple process
    | /// written using `moonbitlang/async`.
    | pub async fn File::lock(self : File, lock : Lock) -> Unit {
321 |   self.io.lock(exclusive=lock is Exclusive, context="@fs.File::lock()")
    |        ^^
    | }
    | 

<WORKDIR>/src/fs/file.mbt:412:30-412:32:
    | /// Get the size of the file. This method will not change position in the file.
    | /// Can only be applied to a regular file.
    | pub async fn File::size(self : File) -> Int64 {
412 |   @event_loop.file_size(self.io.fd(), context="@fs.File::size()")
    |                              ^^
    | }
    | 

<WORKDIR>/src/fs/file.mbt:424:14-424:16:
    | /// result directory object is closed.
    | /// If `as_dir` fails, the input file will be closed automatically.
    | pub fn File::as_dir(self : File) -> Directory raise {
424 |   guard self.io.kind() is Directory else {
    |              ^^
    |     self.close()
    |     raise @os_error.OSError(

<WORKDIR>/src/fs/file.mbt:431:34-431:36:
    |       context="@fs.File::as_dir()",
    |     )
    |   }
431 |   Directory::from_io_handle(self.io)
    |                                  ^^
    | }
    | 

<WORKDIR>/src/fs/file.mbt:441:41-441:43:
    | 
    | ///|
    | pub fn File::kind(self : File) -> FileKind {
441 |   FileKind::from_fd_util_file_kind(self.io.kind())
    |                                         ^^
    | }
    | 

<WORKDIR>/src/fs/file.mbt:449:30-449:32:
    | /// The return value is a pair `(s, ns)`,
    | /// representing the time of `s` seconds + `ns` nanoseconds.
    | pub async fn File::atime(self : File) -> (Int64, Int) {
449 |   @event_loop.file_time(self.io.fd(), context="@fs.File::atime()").atime()
    |                              ^^
    | }
    | 

<WORKDIR>/src/fs/file.mbt:457:30-457:32:
    | /// The return value is a pair `(s, ns)`,
    | /// representing the time of `s` seconds + `ns` nanoseconds.
    | pub async fn File::mtime(self : File) -> (Int64, Int) {
457 |   @event_loop.file_time(self.io.fd(), context="@fs.File::mtime()").mtime()
    |                              ^^
    | }
    | 

<WORKDIR>/src/fs/file.mbt:465:30-465:32:
    | /// The return value is a pair `(s, ns)`,
    | /// representing the time of `s` seconds + `ns` nanoseconds.
    | pub async fn File::ctime(self : File) -> (Int64, Int) {
465 |   @event_loop.file_time(self.io.fd(), context="@fs.File::ctime()").ctime()
    |                              ^^
    | }
    | 

<WORKDIR>/src/fs/file.mbt:480:10-480:12:
    |   defer file.close()
    |   let result = file.read_all()
    |   if sync_timestamp {
480 |     file.io.fsync(only_data=false, context="@fs.read_file(sync_timestamp=true)")
    |          ^^
    |   }
    |   result

```

```mooncram
$ run_moon_ide moon ide find-references 'kind' --loc 'src/fs/utils.mbt:19:14'
Found 9 references for symbol 'kind':
<WORKDIR>/examples/http_file_server/main.mbt:147:12-147:16:
    |       serve_404(conn)
    |       return
    |     }
147 |     if @fs.kind(full_path) is Directory {
    |            ^^^^
    |       if download_zip {
    |         serve_zip(conn, full_path)

<WORKDIR>/src/fs/README.mbt.md:292:18-292:22:
    | async test "mkdir - create with custom permissions" {
    |   let dir_path = "_build/test_mkdir_perm"
    |   @fs.mkdir(dir_path, permission=0o700)
292 |   let kind = @fs.kind(dir_path)
    |                  ^^^^
    |   @fs.rmdir(dir_path)
    |   debug_inspect(kind, content="Directory")

<WORKDIR>/src/fs/README.mbt.md:436:18-436:22:
    | async test "kind - regular file" {
    |   let test_file = "_build/test_kind_file.txt"
    |   @fs.write_file(test_file, b"test", create_mode=CreateOrTruncate)
436 |   let kind = @fs.kind(test_file)
    |                  ^^^^
    |   @fs.remove(test_file)
    |   debug_inspect(kind, content="Regular")

<WORKDIR>/src/fs/README.mbt.md:446:18-446:22:
    | async test "kind - directory" {
    |   let dir_path = "_build/test_kind_dir"
    |   @fs.mkdir(dir_path, permission=0o755)
446 |   let kind = @fs.kind(dir_path)
    |                  ^^^^
    |   @fs.rmdir(dir_path)
    |   debug_inspect(kind, content="Directory")

<WORKDIR>/src/fs/stat_test.mbt:22:23-22:27:
   |   @fs.symlink(link_path, target="../LICENSE")
   |   @async.with_task_group() <| group => {
   |     group.add_defer(() => @fs.remove(link_path))
22 |     debug_inspect(@fs.kind(link_path), content="Regular")
   |                       ^^^^
   |     debug_inspect(@fs.kind(link_path, follow_symlink=false), content="SymLink")
   |   }

<WORKDIR>/src/fs/stat_test.mbt:23:23-23:27:
   |   @async.with_task_group() <| group => {
   |     group.add_defer(() => @fs.remove(link_path))
   |     debug_inspect(@fs.kind(link_path), content="Regular")
23 |     debug_inspect(@fs.kind(link_path, follow_symlink=false), content="SymLink")
   |                       ^^^^
   |   }
   | }

<WORKDIR>/src/fs/stat_test.mbt:34:23-34:27:
   |   @fs.symlink(link_path, target="\{cwd}/_build")
   |   @async.with_task_group() <| group => {
   |     group.add_defer(() => @fs.remove(link_path))
34 |     debug_inspect(@fs.kind(link_path), content="Directory")
   |                       ^^^^
   |     debug_inspect(@fs.kind(link_path, follow_symlink=false), content="SymLink")
   |   }

<WORKDIR>/src/fs/stat_test.mbt:35:23-35:27:
   |   @async.with_task_group() <| group => {
   |     group.add_defer(() => @fs.remove(link_path))
   |     debug_inspect(@fs.kind(link_path), content="Directory")
35 |     debug_inspect(@fs.kind(link_path, follow_symlink=false), content="SymLink")
   |                       ^^^^
   |   }
   | }

<WORKDIR>/src/fs/utils.mbt:19:14-19:18:
   | /// Get the kind of a file at `path`.
   | /// If `path` is a symbolic link and `follow_symlink` is `true` (`true` by default),
   | /// the kind of the target of the link will be returned.
19 | pub async fn kind(path : StringView, follow_symlink? : Bool = true) -> FileKind {
   |              ^^^^
   |   @event_loop.file_kind_by_path(
   |     path,

```

```mooncram
$ run_moon_ide moon ide find-references 'path' --loc 'src/fs/utils.mbt:19:19'
Found 2 references for symbol 'path':
<WORKDIR>/src/fs/utils.mbt:19:19-19:23:
   | /// Get the kind of a file at `path`.
   | /// If `path` is a symbolic link and `follow_symlink` is `true` (`true` by default),
   | /// the kind of the target of the link will be returned.
19 | pub async fn kind(path : StringView, follow_symlink? : Bool = true) -> FileKind {
   |                   ^^^^
   |   @event_loop.file_kind_by_path(
   |     path,

<WORKDIR>/src/fs/utils.mbt:21:5-21:9:
   | /// the kind of the target of the link will be returned.
   | pub async fn kind(path : StringView, follow_symlink? : Bool = true) -> FileKind {
   |   @event_loop.file_kind_by_path(
21 |     path,
   |     ^^^^
   |     parent=@fd_util.invalid_fd,
   |     follow_symlink~,

```

```mooncram
$ run_moon_ide moon ide find-references 'FileIdentity' --loc 'src/fs/watch.mbt:16:25'
Found 17 references for symbol 'FileIdentity':
<WORKDIR>/src/fs/watch.mbt:16:25-16:37:
   | // limitations under the License.
   | 
   | ///|
16 | using @event_loop {type FileIdentity}
   |                         ^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/src/fs/watch.mbt:21:13-21:25:
   | ///|
   | priv struct WatchedFile {
   |   wd : @fd_util.Fd
21 |   file_id : FileIdentity
   |             ^^^^^^^^^^^^
   |   paths : Set[(FileIdentity, String)]
   |   is_dir : Bool

<WORKDIR>/src/fs/watch.mbt:22:16-22:28:
   | priv struct WatchedFile {
   |   wd : @fd_util.Fd
   |   file_id : FileIdentity
22 |   paths : Set[(FileIdentity, String)]
   |                ^^^^^^^^^^^^
   |   is_dir : Bool
   |   children : Map[String, FileIdentity]

<WORKDIR>/src/fs/watch.mbt:24:26-24:38:
   |   file_id : FileIdentity
   |   paths : Set[(FileIdentity, String)]
   |   is_dir : Bool
24 |   children : Map[String, FileIdentity]
   |                          ^^^^^^^^^^^^
   |   mut modified : Bool
   |   dirty_children : Map[String, FileIdentity]

<WORKDIR>/src/fs/watch.mbt:26:32-26:44:
   |   is_dir : Bool
   |   children : Map[String, FileIdentity]
   |   mut modified : Bool
26 |   dirty_children : Map[String, FileIdentity]
   |                                ^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/src/fs/watch.mbt:37:16-37:28:
   |     Self,
   |     StringView,
   |     is_dir~ : Bool,
37 |     file_id~ : FileIdentity,
   |                ^^^^^^^^^^^^
   |     context~ : String,
   |   ) -> @fd_util.Fd

<WORKDIR>/src/fs/watch.mbt:47:13-47:25:
   | /// A file system watcher for watching changes in a directory.
   | struct Watcher {
   |   mut backend : &WatcherBackend?
47 |   root_id : FileIdentity
   |             ^^^^^^^^^^^^
   |   base_path : String
   |   watched : Map[FileIdentity, WatchedFile]

<WORKDIR>/src/fs/watch.mbt:49:17-49:29:
   |   mut backend : &WatcherBackend?
   |   root_id : FileIdentity
   |   base_path : String
49 |   watched : Map[FileIdentity, WatchedFile]
   |                 ^^^^^^^^^^^^
   |   pending_remove : Set[FileIdentity]
   |   ignored_paths : (String) -> Bool

<WORKDIR>/src/fs/watch.mbt:50:24-50:36:
   |   root_id : FileIdentity
   |   base_path : String
   |   watched : Map[FileIdentity, WatchedFile]
50 |   pending_remove : Set[FileIdentity]
   |                        ^^^^^^^^^^^^
   |   ignored_paths : (String) -> Bool
   |   mut event_count : Int

<WORKDIR>/src/fs/watch.mbt:86:14-86:26:
   | fn Watcher::new_backend(
   |   self : Watcher,
   |   root : @event_loop.IoHandle,
86 |   root_id~ : FileIdentity,
   |              ^^^^^^^^^^^^
   |   debounce_timeout~ : Int,
   |   max_debounce_delay~ : Int,

<WORKDIR>/src/fs/watch.mbt:243:14-243:26:
    | ///|
    | async fn Watcher::get_file_at(
    |   self : Watcher,
243 |   file_id~ : FileIdentity,
    |              ^^^^^^^^^^^^
    |   is_dir~ : Bool,
    |   path~ : String,

<WORKDIR>/src/fs/watch.mbt:277:14-277:26:
    |   dir : WatchedFile,
    |   name : String,
    |   is_dir~ : Bool,
277 |   file_id~ : FileIdentity,
    |              ^^^^^^^^^^^^
    |   path~ : String,
    |   context~ : String,

<WORKDIR>/src/fs/watch.mbt:399:51-399:63:
    | }
    | 
    | ///|
399 | fn Watcher::mark_as_modified(self : Watcher, id : FileIdentity) -> Unit {
    |                                                   ^^^^^^^^^^^^
    |   let file = self.watched[id]
    |   if file.modified {

<WORKDIR>/src/fs/watch.mbt:417:12-417:24:
    | ///|
    | fn Watcher::add_dirty_child(
    |   self : Watcher,
417 |   dir_id : FileIdentity,
    |            ^^^^^^^^^^^^
    |   name : String,
    |   child_id : FileIdentity,

<WORKDIR>/src/fs/watch.mbt:419:14-419:26:
    |   self : Watcher,
    |   dir_id : FileIdentity,
    |   name : String,
419 |   child_id : FileIdentity,
    |              ^^^^^^^^^^^^
    | ) -> Unit {
    |   let dir = self.watched[dir_id]

<WORKDIR>/src/fs/watch_inotify.mbt:19:30-19:42:
   | #cfg(not(platform="windows"))
   | priv struct InotifyWatcher {
   |   inotify : @event_loop.IoHandle
19 |   watched : Map[@fd_util.Fd, FileIdentity]
   |                              ^^^^^^^^^^^^
   |   watcher : Watcher
   |   mut event_processor : @coroutine.Coroutine?

<WORKDIR>/src/fs/watch_kqueue.mbt:18:13-18:25:
   | ///|
   | #cfg(not(platform="windows"))
   | priv struct KqueueWatchedFile {
18 |   file_id : FileIdentity
   |             ^^^^^^^^^^^^
   |   io : @event_loop.IoHandle
   | }

```

```mooncram
$ run_moon_ide moon ide find-references 'WatchedFile' --loc 'src/fs/watch.mbt:19:13'
Found 9 references for symbol 'WatchedFile':
<WORKDIR>/src/fs/watch.mbt:19:13-19:24:
   | using @event_loop {type FileIdentity}
   | 
   | ///|
19 | priv struct WatchedFile {
   |             ^^^^^^^^^^^
   |   wd : @fd_util.Fd
   |   file_id : FileIdentity

<WORKDIR>/src/fs/watch.mbt:49:31-49:42:
   |   mut backend : &WatcherBackend?
   |   root_id : FileIdentity
   |   base_path : String
49 |   watched : Map[FileIdentity, WatchedFile]
   |                               ^^^^^^^^^^^
   |   pending_remove : Set[FileIdentity]
   |   ignored_paths : (String) -> Bool

<WORKDIR>/src/fs/watch.mbt:236:4-236:15:
    | }
    | 
    | ///|
236 | fn WatchedFile::is_clean(file : WatchedFile) -> Bool {
    |    ^^^^^^^^^^^
    |   !file.modified && file.dirty_children.is_empty()
    | }

<WORKDIR>/src/fs/watch.mbt:236:33-236:44:
    | }
    | 
    | ///|
236 | fn WatchedFile::is_clean(file : WatchedFile) -> Bool {
    |                                 ^^^^^^^^^^^
    |   !file.modified && file.dirty_children.is_empty()
    | }

<WORKDIR>/src/fs/watch.mbt:247:6-247:17:
    |   is_dir~ : Bool,
    |   path~ : String,
    |   context~ : String,
247 | ) -> WatchedFile {
    |      ^^^^^^^^^^^
    |   if self.watched.get(file_id) is Some(existing) {
    |     return existing

<WORKDIR>/src/fs/watch.mbt:274:9-274:20:
    | ///|
    | async fn Watcher::add_file_at(
    |   self : Watcher,
274 |   dir : WatchedFile,
    |         ^^^^^^^^^^^
    |   name : String,
    |   is_dir~ : Bool,

<WORKDIR>/src/fs/watch.mbt:304:9-304:20:
    | ///|
    | fn Watcher::remove_file_at(
    |   self : Watcher,
304 |   dir : WatchedFile,
    |         ^^^^^^^^^^^
    |   name : String,
    | ) -> Unit {

<WORKDIR>/src/fs/watch.mbt:322:9-322:20:
    | ///|
    | async fn Watcher::scan_dir(
    |   self : Watcher,
322 |   dir : WatchedFile,
    |         ^^^^^^^^^^^
    |   path~ : String,
    |   context~ : String,

<WORKDIR>/src/fs/watch.mbt:373:10-373:21:
    | ///|
    | async fn Watcher::synchronize_file(
    |   self : Watcher,
373 |   file : WatchedFile,
    |          ^^^^^^^^^^^
    |   path~ : String,
    |   context~ : String,

```

```mooncram
$ run_moon_ide moon ide find-references 'tmpdir_seed' --loc 'src/fs/tmpdir.mbt:16:5'
Found 2 references for symbol 'tmpdir_seed':
<WORKDIR>/src/fs/tmpdir.mbt:16:5-16:16:
   | // limitations under the License.
   | 
   | ///|
16 | let tmpdir_seed : @random.Rand = {
   |     ^^^^^^^^^^^
   |   let seed = Buffer()
   |   let now = @env.now()

<WORKDIR>/src/fs/tmpdir.mbt:56:27-56:38:
   | pub async fn tmpdir(prefix~ : StringView) -> String {
   |   for _ in 0..<@int.MAX_VALUE {
   |     let hasher = Hasher()
56 |     hasher.combine_uint64(tmpdir_seed.uint64())
   |                           ^^^^^^^^^^^
   |     hasher.combine_uint64(@env.now())
   |     let h = hasher.finalize().reinterpret_as_uint()

```

```mooncram
$ run_moon_ide moon ide find-references 'Rand' --loc 'src/fs/tmpdir.mbt:16:22'
Found 7 references for symbol 'Rand':
<WORKDIR>/examples/tcp_server_benchmark/main.mbt:20:18-20:22:
   | 
   | ///|
   | async fn client(
20 |   rand : @random.Rand,
   |                  ^^^^
   |   dst : @socket.Addr,
   |   total_conn~ : Int,

<WORKDIR>/examples/tcp_server_benchmark/main.mbt:119:13-119:17:
    |     ..write_uint64_le(now)
    |     ..write_uint64_le(now)
    |     .write_uint64_le(now)
119 |     @random.Rand::chacha8(seed=seed.contents())
    |             ^^^^
    |   }
    |   let (throughput, average_latency) = client(

<WORKDIR>/src/fs/tmpdir.mbt:16:27-16:31:
   | // limitations under the License.
   | 
   | ///|
16 | let tmpdir_seed : @random.Rand = {
   |                           ^^^^
   |   let seed = Buffer()
   |   let now = @env.now()

<WORKDIR>/src/fs/tmpdir.mbt:22:11-22:15:
   |   for _ in 0..<4 {
   |     seed.write_uint64_le(now)
   |   }
22 |   @random.Rand::chacha8(seed=seed.contents())
   |           ^^^^
   | }
   | 

<WORKDIR>/src/websocket/client.mbt:39:22-39:26:
   | ) -> Conn {
   |   // Ref : https://datatracker.ietf.org/doc/html/rfc6455#section-4.1
   |   let seed = @tls.rand_bytes(32)
39 |   let rand = @random.Rand::chacha8(seed~)
   |                      ^^^^
   | 
   |   // Send WebSocket handshake request

<WORKDIR>/src/websocket/conn.mbt:101:24-101:28:
    | 
    |   // If present, `write_mask` is a random generator used to generate frame masks.
    |   // If absent, frames will be unmasked.
101 |   write_mask : @random.Rand?
    |                        ^^^^
    | 
    |   // We reserve some fixed space at the start of `write_buf` for header,

<WORKDIR>/src/websocket/conn.mbt:152:19-152:23:
    | fn Conn::new(
    |   transport : &Transport,
    |   max_frame_size : Int,
152 |   mask~ : @random.Rand?,
    |                   ^^^^
    | ) -> Conn {
    |   {

```
