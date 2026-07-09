# async rename

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide rename 'mkdir' 'mkdir_renamed' --loc 'src\fs\dir.mbt:24:14'
*** Begin Patch
*** Update File: <WORKDIR>/src\fs\README.mbt.md
@@
 #cfg(target="native")
 async test "mkdir - create directory" {
   let dir_path = "_build/test_mkdir"
-  @fs.mkdir(dir_path, permission=0o755)
+  @fs.mkdir_renamed(dir_path, permission=0o755)
   let exists = @fs.exists(dir_path)
   @fs.rmdir(dir_path)
   inspect(exists, content="true")
@@
 #cfg(target="native")
 async test "mkdir - create with custom permissions" {
   let dir_path = "_build/test_mkdir_perm"
-  @fs.mkdir(dir_path, permission=0o700)
+  @fs.mkdir_renamed(dir_path, permission=0o700)
   let kind = @fs.kind(dir_path)
   @fs.rmdir(dir_path)
   debug_inspect(kind, content="Directory")
@@
 #cfg(target="native")
 async test "readdir - read directory entries" {
   let dir_path = "_build/test_readdir"
-  @fs.mkdir(dir_path, permission=0o755)
+  @fs.mkdir_renamed(dir_path, permission=0o755)
   @fs.write_file("\{dir_path}/test1.txt", b"", create_mode=CreateOrTruncate)
   @fs.write_file("\{dir_path}/test2.txt", b"", create_mode=CreateOrTruncate)
   let entries = @fs.readdir(
@@
 #cfg(target="native")
 async test "readdir with sorting" {
   let dir_path = "_build/test_readdir_sort"
-  @fs.mkdir(dir_path, permission=0o755)
+  @fs.mkdir_renamed(dir_path, permission=0o755)
   @fs.write_file("\{dir_path}/c.txt", b"", create_mode=CreateOrTruncate)
   @fs.write_file("\{dir_path}/a.txt", b"", create_mode=CreateOrTruncate)
   @fs.write_file("\{dir_path}/b.txt", b"", create_mode=CreateOrTruncate)
@@
 #cfg(target="native")
 async test "opendir and Directory::read_all" {
   let dir_path = "_build/test_opendir"
-  @fs.mkdir(dir_path, permission=0o755)
+  @fs.mkdir_renamed(dir_path, permission=0o755)
   @fs.write_file("\{dir_path}/file1.txt", b"test", create_mode=CreateOrTruncate)
   @fs.write_file("\{dir_path}/file2.txt", b"test", create_mode=CreateOrTruncate)
   let dir = @fs.opendir(dir_path)
@@
 #cfg(target="native")
 async test "walk directory tree" {
   let base = "_build/test_walk"
-  @fs.mkdir(base)
+  @fs.mkdir_renamed(base)
-  @fs.mkdir("\{base}/sub1")
+  @fs.mkdir_renamed("\{base}/sub1")
-  @fs.mkdir("\{base}/sub2")
+  @fs.mkdir_renamed("\{base}/sub2")
   @fs.write_file("\{base}/file.txt", b"", create_mode=CreateOrTruncate)
   @fs.write_file("\{base}/sub1/file1.txt", b"", create_mode=CreateOrTruncate)
   let visited : Ref[Int] = Ref(0)
@@
 #cfg(target="native")
 async test "walk with max_concurrency" {
   let base = "_build/test_walk_concurrency"
-  @fs.mkdir(base, permission=0o755)
+  @fs.mkdir_renamed(base, permission=0o755)
-  @fs.mkdir("\{base}/dir1", permission=0o755)
+  @fs.mkdir_renamed("\{base}/dir1", permission=0o755)
-  @fs.mkdir("\{base}/dir2", permission=0o755)
+  @fs.mkdir_renamed("\{base}/dir2", permission=0o755)
   let count : Ref[Int] = Ref(0)
   @fs.walk(
     base,
@@
 #cfg(target="native")
 async test "rmdir - remove empty directory" {
   let dir_path = "_build/test_rmdir"
-  @fs.mkdir(dir_path)
+  @fs.mkdir_renamed(dir_path)
   @fs.rmdir(dir_path)
   let exists = @fs.exists(dir_path)
   inspect(exists, content="false")
@@
 #cfg(target="native")
 async test "rmdir recursive - remove directory tree" {
   let base = "_build/test_rmdir_recursive"
-  @fs.mkdir(base)
+  @fs.mkdir_renamed(base)
-  @fs.mkdir("\{base}/subdir")
+  @fs.mkdir_renamed("\{base}/subdir")
   @fs.write_file("\{base}/file.txt", b"test", create_mode=CreateOrTruncate)
   @fs.write_file(
     "\{base}/subdir/nested.txt",
@@
 #cfg(target="native")
 async test "kind - directory" {
   let dir_path = "_build/test_kind_dir"
-  @fs.mkdir(dir_path, permission=0o755)
+  @fs.mkdir_renamed(dir_path, permission=0o755)
   let kind = @fs.kind(dir_path)
   @fs.rmdir(dir_path)
   debug_inspect(kind, content="Directory")
@@
 #cfg(target="native")
 async test "realpath - resolve absolute path" {
   let test_dir = "_build/test_realpath"
-  @fs.mkdir(test_dir)
+  @fs.mkdir_renamed(test_dir)
   let real_path = @fs.realpath(test_dir)
   @fs.rmdir(test_dir)
   guard @env.current_dir() is Some(cwd)
*** Update File: <WORKDIR>/src\fs\dir.mbt
@@
 ///
 /// If `recursive=true` (`false` by default), non-existing parent directories
 /// of `path` will be recursively created, too.
-pub async fn mkdir(
+pub async fn mkdir_renamed(
   path : StringView,
   permission? : Int = 0o755,
   recursive? : Bool = false,
@@
       } else {
         parent
       }
-      mkdir(parent, permission~, recursive~)
+      mkdir_renamed(parent, permission~, recursive~)
       @event_loop.mkdir(path, mode=permission, context~)
     }
     err => raise err
*** Update File: <WORKDIR>/src\fs\mkdir_test.mbt
@@
 ///|
 async test "mkdir" {
   let path = "_build/mkdir_test"
-  @fs.mkdir(path)
+  @fs.mkdir_renamed(path)
   @fs.write_file("\{path}/file", "", create_mode=CreateOrTruncate)
   let result = @fs.readdir(path, sort=true)
   @fs.remove("\{path}/file")
@@
 async test "rmdir recursive" {
   guard @env.current_dir() is Some(cwd)
   let path = "_build/rmdir_test"
-  @fs.mkdir(path, permission=0o755)
+  @fs.mkdir_renamed(path, permission=0o755)
   @fs.write_file("\{path}/file", "", create_mode=CreateOrTruncate)
-  @fs.mkdir("\{path}/inner")
+  @fs.mkdir_renamed("\{path}/inner")
   @fs.write_file("\{path}/inner/file", "", create_mode=CreateOrTruncate)
   @fs.symlink("\{path}/symlink", target="\{cwd}/_build")
   @test_util.assert_raise_async(() => @fs.rmdir(path))
@@
   @async.with_task_group() <| group => {
     let base_path = "_build/recursive_mkdir"
     let path = "\{base_path}/test//directory"
-    @fs.mkdir(path, recursive=true)
+    @fs.mkdir_renamed(path, recursive=true)
     group.add_defer(() => @fs.rmdir(base_path, recursive=true))
     json_inspect(@fs.readdir(base_path), content=["test"])
     json_inspect(@fs.readdir("\{base_path}/test"), content=["directory"])
@@
   @async.with_task_group() <| group => {
     let base_path = "_build\\recursive_mkdir_windows"
     let path = "\{base_path}\\test\\\\directory"
-    @fs.mkdir(path, recursive=true)
+    @fs.mkdir_renamed(path, recursive=true)
     group.add_defer(() => @fs.rmdir(base_path, recursive=true))
     json_inspect(@fs.readdir(base_path), content=["test"])
     json_inspect(@fs.readdir("\{base_path}\\test"), content=["directory"])
*** Update File: <WORKDIR>/src\fs\watch_test.mbt
@@
   match self {
     File(content) => @fs.write_file(path, content, create_mode=CreateOrTruncate)
     Dir(files) => {
-      @fs.mkdir(path)
+      @fs.mkdir_renamed(path)
       for name, file in files {
         file.instantiate("\{path}/\{name}")
       }
@@
 
     // 10. create new inner directory
     log.push("creating new directory in root directory")
-    @fs.mkdir("\{path}/inner_dir")
+    @fs.mkdir_renamed("\{path}/inner_dir")
     @async.sleep(150)
 
     // 11. create new file in newly created inner directory
@@
 
     // 11. re-create directory at ignored path
     log.push("re-creating directory at ignored path")
-    @fs.mkdir("\{path}/ignored")
+    @fs.mkdir_renamed("\{path}/ignored")
     @async.sleep(150)
 
     // 12. create new file in re-created ignored path
@@
 
     // 14. re-create directory at normal path
     log.push("re-creating directory at normal path")
-    @fs.mkdir("\{path}/normal")
+    @fs.mkdir_renamed("\{path}/normal")
     @async.sleep(150)
 
     // 15. create new file in re-created normal path
*** Update File: <WORKDIR>/src\os_error\os_error_test.mbt
@@
 ///|
 async test "is_EEXIST" {
   let err = @test_util.expect_error_async <| () => {
-    @fs.mkdir("src", permission=0o755)
+    @fs.mkdir_renamed("src", permission=0o755)
   }
   match err {
     @os_error.OSError(_) as err => assert_true(err.is_EEXIST())
*** End Patch

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide rename 'path' 'path_renamed' --loc 'src\fs\dir.mbt:25:3'
*** Begin Patch
*** Update File: <WORKDIR>/src\fs\dir.mbt
@@
 /// If `recursive=true` (`false` by default), non-existing parent directories
 /// of `path` will be recursively created, too.
 pub async fn mkdir(
-  path : StringView,
+  path_renamed : StringView,
   permission? : Int = 0o755,
   recursive? : Bool = false,
 ) -> Unit {
   let context = "@fs.mkdir()"
-  @event_loop.mkdir(path, mode=permission, context~) catch {
+  @event_loop.mkdir(path_renamed, mode=permission, context~) catch {
     @os_error.OSError(_) as err if recursive && err.is_ENOENT() => {
-      let last_path_sep_index = match path.rev_find("/") {
+      let last_path_sep_index = match path_renamed.rev_find("/") {
         Some(index) => index
         None if @event_loop.platform is Windows &&
-          path.rev_find("\\") is Some(index) => index
+          path_renamed.rev_find("\\") is Some(index) => index
         None => raise err
       }
-      let parent = path[:last_path_sep_index].trim_end(chars="/")
+      let parent = path_renamed[:last_path_sep_index].trim_end(chars="/")
       let parent = if @event_loop.platform is Windows {
         parent.trim_end(chars="\\")
       } else {
@@
         parent
       }
       mkdir(parent, permission~, recursive~)
-      @event_loop.mkdir(path, mode=permission, context~)
+      @event_loop.mkdir(path_renamed, mode=permission, context~)
     }
     err => raise err
   }
*** End Patch

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide rename 'File' 'FileRenamed' --loc 'src\fs\file.mbt:16:8'
*** Begin Patch
*** Update File: <WORKDIR>/src\fs\file.mbt
@@
 // limitations under the License.
 
 ///|
-struct File {
+struct FileRenamed {
   io : @event_loop.IoHandle
   read_buf : @io.ReaderBuffer
 }
 
 ///|
-pub fn File::fd(self : File) -> @fd_util.Fd {
+pub fn FileRenamed::fd(self : FileRenamed) -> @fd_util.Fd {
   self.io.fd()
 }
 
 ///|
-pub fn File::close(self : File) -> Unit {
+pub fn FileRenamed::close(self : FileRenamed) -> Unit {
   self.io.close()
 }
 
@@
   permission? : Int,
   create? : Int,
   truncate? : Bool = false,
-) -> File {
+) -> FileRenamed {
   let access = match mode {
     ReadOnly => 0
     WriteOnly => 1
@@
   allow_existing? : Bool = true,
   permission? : Int = 0o644,
   sync? : SyncMode = NoSync,
-) -> File {
+) -> FileRenamed {
   let create_mode = if allow_existing { CreateOrTruncate } else { CreateNew }
   open(filename, mode=WriteOnly, sync~, create_mode~, permission~)
 }
@@
 /// the content of the file will be read as a byte stream.
 /// The position of the read stream in the file is
 /// independent of the write stream (via the `@io.Writer` interface)
-pub impl @io.Reader for File with fn _direct_read(self, buf, offset~, max_len~) {
+pub impl @io.Reader for FileRenamed with fn _direct_read(self, buf, offset~, max_len~) {
   self.io.read(buf, offset~, len=max_len, context="@fs.File::read()")
 }
 
 ///|
-pub impl @io.Reader for File with fn _get_internal_buffer(self) {
+pub impl @io.Reader for FileRenamed with fn _get_internal_buffer(self) {
   self.read_buf
 }
 
@@
 /// Up to `len` bytes of data will be read into `buf[offset:]`.
 /// The number of bytes actually read would be returned.
 /// The number of read bytes will be smaller than `len` only when EOF is reached.
-pub async fn File::read_at(
+pub async fn FileRenamed::read_at(
-  self : File,
+  self : FileRenamed,
   buf : FixedArray[Byte],
   position~ : Int64,
   offset? : Int = 0,
@@
 }
 
 ///|
-pub async fn File::read_exactly_at(
+pub async fn FileRenamed::read_exactly_at(
-  self : File,
+  self : FileRenamed,
   len : Int,
   position~ : Int64,
 ) -> Bytes {
@@
 /// will be written as a byte stream, starting at offset 0.
 /// The position of the write stream in the file is
 /// independent of the read stream (via the `@io.Reader` interface)
-pub impl @io.Writer for File with fn write_once(self, buf, offset~, len~) {
+pub impl @io.Writer for FileRenamed with fn write_once(self, buf, offset~, len~) {
   self.io.write(buf, offset~, len~, context="@fs.File::write()")
 }
 
@@
 /// as long as the regions they write do not overlap.
 ///
 /// `write_at` would only return after all data is written.
-pub async fn File::write_at(
+pub async fn FileRenamed::write_at(
-  self : File,
+  self : FileRenamed,
   buf : BytesView,
   position~ : Int64,
 ) -> Unit {
@@
 /// If `only_data` is `true` (`false` by default),
 /// some metadata such as timestamp may not be flushed.
 /// Buf file content and important metadata such as file size are always flushed.
-pub async fn File::sync(self : File, only_data? : Bool = false) -> Unit {
+pub async fn FileRenamed::sync(self : FileRenamed, only_data? : Bool = false) -> Unit {
   self.io.fsync(only_data~, context="@fs.File::sync()")
 }
 
@@
 /// The underlying syscall used to implement the lock is undefined.
 /// So the lock should only be used for synchronization between multiple process
 /// written using `moonbitlang/async`.
-pub async fn File::lock(self : File, lock : Lock) -> Unit {
+pub async fn FileRenamed::lock(self : FileRenamed, lock : Lock) -> Unit {
   self.io.lock(exclusive=lock is Exclusive, context="@fs.File::lock()")
 }
 
@@
 /// The underlying syscall used to implement the lock is undefined.
 /// So the lock should only be used for synchronization between multiple process
 /// written using `moonbitlang/async`.
-pub fn File::try_lock(self : File, lock : Lock) -> Bool raise {
+pub fn FileRenamed::try_lock(self : FileRenamed, lock : Lock) -> Bool raise {
   let ret = try_lock_ffi(self.fd(), exclusive=lock is Exclusive)
   if ret >= 0 {
     true
@@
 
 ///|
 /// Unlock a file that was previously locked by this process.
-pub fn File::unlock(self : File) -> Unit {
+pub fn FileRenamed::unlock(self : FileRenamed) -> Unit {
   if unlock_ffi(self.fd()) < 0 {
     // swallow the error so that we can use `unlock` in `defer`.
     // TODO: remove the `try!` after we support raising error in `defer`.
@@
 ///|
 /// Get the size of the file. This method will not change position in the file.
 /// Can only be applied to a regular file.
-pub async fn File::size(self : File) -> Int64 {
+pub async fn FileRenamed::size(self : FileRenamed) -> Int64 {
   @event_loop.file_size(self.io.fd(), context="@fs.File::size()")
 }
 
@@
 /// The input file will be automatically closed when the
 /// result directory object is closed.
 /// If `as_dir` fails, the input file will be closed automatically.
-pub fn File::as_dir(self : File) -> Directory raise {
+pub fn FileRenamed::as_dir(self : FileRenamed) -> Directory raise {
   guard self.io.kind() is Directory else {
     self.close()
     raise @os_error.OSError(
@@
 let _unused : Unit = ignore(@os_error.check_errno)
 
 ///|
-pub fn File::kind(self : File) -> FileKind {
+pub fn FileRenamed::kind(self : FileRenamed) -> FileKind {
   FileKind::from_fd_util_file_kind(self.io.kind())
 }
 
@@
 /// Get the last access time of a file.
 /// The return value is a pair `(s, ns)`,
 /// representing the time of `s` seconds + `ns` nanoseconds.
-pub async fn File::atime(self : File) -> (Int64, Int) {
+pub async fn FileRenamed::atime(self : FileRenamed) -> (Int64, Int) {
   @event_loop.file_time(self.io.fd(), context="@fs.File::atime()").atime()
 }
 
@@
 /// Get the last modification time of a file.
 /// The return value is a pair `(s, ns)`,
 /// representing the time of `s` seconds + `ns` nanoseconds.
-pub async fn File::mtime(self : File) -> (Int64, Int) {
+pub async fn FileRenamed::mtime(self : FileRenamed) -> (Int64, Int) {
   @event_loop.file_time(self.io.fd(), context="@fs.File::mtime()").mtime()
 }
 
@@
 /// Get the last status change time of a file.
 /// The return value is a pair `(s, ns)`,
 /// representing the time of `s` seconds + `ns` nanoseconds.
-pub async fn File::ctime(self : File) -> (Int64, Int) {
+pub async fn FileRenamed::ctime(self : FileRenamed) -> (Int64, Int) {
   @event_loop.file_time(self.io.fd(), context="@fs.File::ctime()").ctime()
 }
 
*** End Patch

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide rename 'io' 'io_renamed' --loc 'src\fs\file.mbt:17:3'
*** Begin Patch
*** Update File: <WORKDIR>/src\fs\file.mbt
@@
 
 ///|
 struct File {
-  io : @event_loop.IoHandle
+  io_renamed : @event_loop.IoHandle
   read_buf : @io.ReaderBuffer
 }
 
 ///|
 pub fn File::fd(self : File) -> @fd_util.Fd {
-  self.io.fd()
+  self.io_renamed.fd()
 }
 
 ///|
 pub fn File::close(self : File) -> Unit {
-  self.io.close()
+  self.io_renamed.close()
 }
 
 ///|
@@
     mode=permission,
     context="@fs.open()",
   )
-  { io, read_buf: @io.ReaderBuffer::new() }
+  { io_renamed: io, read_buf: @io.ReaderBuffer::new() }
 }
 
 ///|
@@
 /// The position of the read stream in the file is
 /// independent of the write stream (via the `@io.Writer` interface)
 pub impl @io.Reader for File with fn _direct_read(self, buf, offset~, max_len~) {
-  self.io.read(buf, offset~, len=max_len, context="@fs.File::read()")
+  self.io_renamed.read(buf, offset~, len=max_len, context="@fs.File::read()")
 }
 
 ///|
@@
   offset? : Int = 0,
   len? : Int = buf.length() - offset,
 ) -> Int {
-  self.io.read_at(buf, offset~, len~, position~, context="@fs.File::read_at()")
+  self.io_renamed.read_at(buf, offset~, len~, position~, context="@fs.File::read_at()")
 }
 
 ///|
@@
   position~ : Int64,
 ) -> Bytes {
   let buf = FixedArray::make(len, b'\x00')
-  let n = self.io.read_at(
+  let n = self.io_renamed.read_at(
     buf,
     offset=0,
     len~,
@@
 /// The position of the write stream in the file is
 /// independent of the read stream (via the `@io.Reader` interface)
 pub impl @io.Writer for File with fn write_once(self, buf, offset~, len~) {
-  self.io.write(buf, offset~, len~, context="@fs.File::write()")
+  self.io_renamed.write(buf, offset~, len~, context="@fs.File::write()")
 }
 
 ///|
@@
   buf : BytesView,
   position~ : Int64,
 ) -> Unit {
-  self.io.write_at(
+  self.io_renamed.write_at(
     buf.data(),
     offset=buf.start_offset(),
     len=buf.length(),
@@
 /// some metadata such as timestamp may not be flushed.
 /// Buf file content and important metadata such as file size are always flushed.
 pub async fn File::sync(self : File, only_data? : Bool = false) -> Unit {
-  self.io.fsync(only_data~, context="@fs.File::sync()")
+  self.io_renamed.fsync(only_data~, context="@fs.File::sync()")
 }
 
 ///|
@@
 /// So the lock should only be used for synchronization between multiple process
 /// written using `moonbitlang/async`.
 pub async fn File::lock(self : File, lock : Lock) -> Unit {
-  self.io.lock(exclusive=lock is Exclusive, context="@fs.File::lock()")
+  self.io_renamed.lock(exclusive=lock is Exclusive, context="@fs.File::lock()")
 }
 
 ///|
@@
 /// Get the size of the file. This method will not change position in the file.
 /// Can only be applied to a regular file.
 pub async fn File::size(self : File) -> Int64 {
-  @event_loop.file_size(self.io.fd(), context="@fs.File::size()")
+  @event_loop.file_size(self.io_renamed.fd(), context="@fs.File::size()")
 }
 
 ///|
@@
 /// result directory object is closed.
 /// If `as_dir` fails, the input file will be closed automatically.
 pub fn File::as_dir(self : File) -> Directory raise {
-  guard self.io.kind() is Directory else {
+  guard self.io_renamed.kind() is Directory else {
     self.close()
     raise @os_error.OSError(
       @os_error.errno_ENOTDIR,
@@
       context="@fs.File::as_dir()",
     )
   }
-  Directory::from_io_handle(self.io)
+  Directory::from_io_handle(self.io_renamed)
 }
 
 ///|
@@
 
 ///|
 pub fn File::kind(self : File) -> FileKind {
-  FileKind::from_fd_util_file_kind(self.io.kind())
+  FileKind::from_fd_util_file_kind(self.io_renamed.kind())
 }
 
 ///|
@@
 /// The return value is a pair `(s, ns)`,
 /// representing the time of `s` seconds + `ns` nanoseconds.
 pub async fn File::atime(self : File) -> (Int64, Int) {
-  @event_loop.file_time(self.io.fd(), context="@fs.File::atime()").atime()
+  @event_loop.file_time(self.io_renamed.fd(), context="@fs.File::atime()").atime()
 }
 
 ///|
@@
 /// The return value is a pair `(s, ns)`,
 /// representing the time of `s` seconds + `ns` nanoseconds.
 pub async fn File::mtime(self : File) -> (Int64, Int) {
-  @event_loop.file_time(self.io.fd(), context="@fs.File::mtime()").mtime()
+  @event_loop.file_time(self.io_renamed.fd(), context="@fs.File::mtime()").mtime()
 }
 
 ///|
@@
 /// The return value is a pair `(s, ns)`,
 /// representing the time of `s` seconds + `ns` nanoseconds.
 pub async fn File::ctime(self : File) -> (Int64, Int) {
-  @event_loop.file_time(self.io.fd(), context="@fs.File::ctime()").ctime()
+  @event_loop.file_time(self.io_renamed.fd(), context="@fs.File::ctime()").ctime()
 }
 
 ///|
@@
   defer file.close()
   let result = file.read_all()
   if sync_timestamp {
-    file.io.fsync(only_data=false, context="@fs.read_file(sync_timestamp=true)")
+    file.io_renamed.fsync(only_data=false, context="@fs.read_file(sync_timestamp=true)")
   }
   result
 }
*** End Patch

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide rename 'kind' 'kind_renamed' --loc 'src\fs\utils.mbt:19:14'
*** Begin Patch
*** Update File: <WORKDIR>/examples\http_file_server\main.mbt
@@
       serve_404(conn)
       return
     }
-    if @fs.kind(full_path) is Directory {
+    if @fs.kind_renamed(full_path) is Directory {
       if download_zip {
         serve_zip(conn, full_path)
       } else {
*** Update File: <WORKDIR>/src\fs\README.mbt.md
@@
 async test "mkdir - create with custom permissions" {
   let dir_path = "_build/test_mkdir_perm"
   @fs.mkdir(dir_path, permission=0o700)
-  let kind = @fs.kind(dir_path)
+  let kind = @fs.kind_renamed(dir_path)
   @fs.rmdir(dir_path)
   debug_inspect(kind, content="Directory")
 }
@@
 async test "kind - regular file" {
   let test_file = "_build/test_kind_file.txt"
   @fs.write_file(test_file, b"test", create_mode=CreateOrTruncate)
-  let kind = @fs.kind(test_file)
+  let kind = @fs.kind_renamed(test_file)
   @fs.remove(test_file)
   debug_inspect(kind, content="Regular")
 }
@@
 async test "kind - directory" {
   let dir_path = "_build/test_kind_dir"
   @fs.mkdir(dir_path, permission=0o755)
-  let kind = @fs.kind(dir_path)
+  let kind = @fs.kind_renamed(dir_path)
   @fs.rmdir(dir_path)
   debug_inspect(kind, content="Directory")
 }
*** Update File: <WORKDIR>/src\fs\stat_test.mbt
@@
   @fs.symlink(link_path, target="\{cwd}/_build")
   @async.with_task_group() <| group => {
     group.add_defer(() => @fs.remove(link_path))
-    debug_inspect(@fs.kind(link_path), content="Directory")
+    debug_inspect(@fs.kind_renamed(link_path), content="Directory")
-    debug_inspect(@fs.kind(link_path, follow_symlink=false), content="SymLink")
+    debug_inspect(@fs.kind_renamed(link_path, follow_symlink=false), content="SymLink")
   }
 }
*** Update File: <WORKDIR>/src\fs\utils.mbt
@@
 /// Get the kind of a file at `path`.
 /// If `path` is a symbolic link and `follow_symlink` is `true` (`true` by default),
 /// the kind of the target of the link will be returned.
-pub async fn kind(path : StringView, follow_symlink? : Bool = true) -> FileKind {
+pub async fn kind_renamed(path : StringView, follow_symlink? : Bool = true) -> FileKind {
   @event_loop.file_kind_by_path(
     path,
     parent=@fd_util.invalid_fd,
*** End Patch

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide rename 'path' 'path_renamed' --loc 'src\fs\utils.mbt:19:19'
*** Begin Patch
*** Update File: <WORKDIR>/src\fs\utils.mbt
@@
 /// Get the kind of a file at `path`.
 /// If `path` is a symbolic link and `follow_symlink` is `true` (`true` by default),
 /// the kind of the target of the link will be returned.
-pub async fn kind(path : StringView, follow_symlink? : Bool = true) -> FileKind {
+pub async fn kind(path_renamed : StringView, follow_symlink? : Bool = true) -> FileKind {
   @event_loop.file_kind_by_path(
-    path,
+    path_renamed,
     parent=@fd_util.invalid_fd,
     follow_symlink~,
     context="@fs.kind()",
*** End Patch

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide rename 'FileIdentity' 'FileIdentityRenamed' --loc 'src\fs\watch.mbt:16:25'
*** Begin Patch
*** Update File: <WORKDIR>/src\fs\watch.mbt
@@
 // limitations under the License.
 
 ///|
-using @event_loop {type FileIdentity}
+using @event_loop {type FileIdentityRenamed}
 
 ///|
 priv struct WatchedFile {
   wd : @fd_util.Fd
-  file_id : FileIdentity
+  file_id : FileIdentityRenamed
-  paths : Set[(FileIdentity, String)]
+  paths : Set[(FileIdentityRenamed, String)]
   is_dir : Bool
-  children : Map[String, FileIdentity]
+  children : Map[String, FileIdentityRenamed]
   mut modified : Bool
-  dirty_children : Map[String, FileIdentity]
+  dirty_children : Map[String, FileIdentityRenamed]
 }
 
 ///|
@@
     Self,
     StringView,
     is_dir~ : Bool,
-    file_id~ : FileIdentity,
+    file_id~ : FileIdentityRenamed,
     context~ : String,
   ) -> @fd_util.Fd
   fn remove_file(Self, @fd_util.Fd, context~ : String) -> Unit raise
@@
 /// A file system watcher for watching changes in a directory.
 struct Watcher {
   mut backend : &WatcherBackend?
-  root_id : FileIdentity
+  root_id : FileIdentityRenamed
   base_path : String
-  watched : Map[FileIdentity, WatchedFile]
+  watched : Map[FileIdentityRenamed, WatchedFile]
-  pending_remove : Set[FileIdentity]
+  pending_remove : Set[FileIdentityRenamed]
   ignored_paths : (String) -> Bool
   mut event_count : Int
   mut synchronize_task : @coroutine.Coroutine?
@@
 fn Watcher::new_backend(
   self : Watcher,
   root : @event_loop.IoHandle,
-  root_id~ : FileIdentity,
+  root_id~ : FileIdentityRenamed,
   debounce_timeout~ : Int,
   max_debounce_delay~ : Int,
   context~ : String,
@@
 ///|
 async fn Watcher::get_file_at(
   self : Watcher,
-  file_id~ : FileIdentity,
+  file_id~ : FileIdentityRenamed,
   is_dir~ : Bool,
   path~ : String,
   context~ : String,
@@
   dir : WatchedFile,
   name : String,
   is_dir~ : Bool,
-  file_id~ : FileIdentity,
+  file_id~ : FileIdentityRenamed,
   path~ : String,
   context~ : String,
 ) -> Unit {
@@
 }
 
 ///|
-fn Watcher::mark_as_modified(self : Watcher, id : FileIdentity) -> Unit {
+fn Watcher::mark_as_modified(self : Watcher, id : FileIdentityRenamed) -> Unit {
   let file = self.watched[id]
   if file.modified {
     return
@@
 ///|
 fn Watcher::add_dirty_child(
   self : Watcher,
-  dir_id : FileIdentity,
+  dir_id : FileIdentityRenamed,
   name : String,
-  child_id : FileIdentity,
+  child_id : FileIdentityRenamed,
 ) -> Unit {
   let dir = self.watched[dir_id]
   let was_clean = dir.is_clean()
*** Update File: <WORKDIR>/src\fs\watch_windows.mbt
@@
 fn WindowsWatcher::WindowsWatcher(
   watcher : Watcher,
   root : @event_loop.IoHandle,
-  root_id~ : FileIdentity,
+  root_id~ : FileIdentityRenamed,
   debounce_timeout~ : Int,
   max_debounce_delay~ : Int,
 ) -> WindowsWatcher {
@@
     let mut offset = 0
     while offset < n {
       let size = buf.event_size(offset)
-      let file_id : FileIdentity = if WindowsWatcher::has_ReadDirectoryChangesExW() {
+      let file_id : FileIdentityRenamed = if WindowsWatcher::has_ReadDirectoryChangesExW() {
         let file_id = if buf.is_modify(offset) {
           buf.get_file_id(offset)
         } else {
*** End Patch

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide rename 'WatchedFile' 'WatchedFileRenamed' --loc 'src\fs\watch.mbt:19:13'
*** Begin Patch
*** Update File: <WORKDIR>/src\fs\watch.mbt
@@
 using @event_loop {type FileIdentity}
 
 ///|
-priv struct WatchedFile {
+priv struct WatchedFileRenamed {
   wd : @fd_util.Fd
   file_id : FileIdentity
   paths : Set[(FileIdentity, String)]
@@
   mut backend : &WatcherBackend?
   root_id : FileIdentity
   base_path : String
-  watched : Map[FileIdentity, WatchedFile]
+  watched : Map[FileIdentity, WatchedFileRenamed]
   pending_remove : Set[FileIdentity]
   ignored_paths : (String) -> Bool
   mut event_count : Int
@@
 }
 
 ///|
-fn WatchedFile::is_clean(file : WatchedFile) -> Bool {
+fn WatchedFileRenamed::is_clean(file : WatchedFileRenamed) -> Bool {
   !file.modified && file.dirty_children.is_empty()
 }
 
@@
   is_dir~ : Bool,
   path~ : String,
   context~ : String,
-) -> WatchedFile {
+) -> WatchedFileRenamed {
   if self.watched.get(file_id) is Some(existing) {
     return existing
   }
@@
 ///|
 async fn Watcher::add_file_at(
   self : Watcher,
-  dir : WatchedFile,
+  dir : WatchedFileRenamed,
   name : String,
   is_dir~ : Bool,
   file_id~ : FileIdentity,
@@
 ///|
 fn Watcher::remove_file_at(
   self : Watcher,
-  dir : WatchedFile,
+  dir : WatchedFileRenamed,
   name : String,
 ) -> Unit {
   let curr_id = dir.children.get(name)
@@
 ///|
 async fn Watcher::scan_dir(
   self : Watcher,
-  dir : WatchedFile,
+  dir : WatchedFileRenamed,
   path~ : String,
   context~ : String,
 ) -> Unit {
@@
 ///|
 async fn Watcher::synchronize_file(
   self : Watcher,
-  file : WatchedFile,
+  file : WatchedFileRenamed,
   path~ : String,
   context~ : String,
 ) -> Unit {
*** End Patch

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide rename 'tmpdir_seed' 'tmpdir_seed_renamed' --loc 'src\fs\tmpdir.mbt:16:5'
*** Begin Patch
*** Update File: <WORKDIR>/src\fs\tmpdir.mbt
@@
 // limitations under the License.
 
 ///|
-let tmpdir_seed : @random.Rand = {
+let tmpdir_seed_renamed : @random.Rand = {
   let seed = Buffer()
   let now = @env.now()
   for _ in 0..<4 {
@@
 pub async fn tmpdir(prefix~ : StringView) -> String {
   for _ in 0..<@int.MAX_VALUE {
     let hasher = Hasher()
-    hasher.combine_uint64(tmpdir_seed.uint64())
+    hasher.combine_uint64(tmpdir_seed_renamed.uint64())
     hasher.combine_uint64(@env.now())
     let h = hasher.finalize().reinterpret_as_uint()
     let path = StringBuilder::new()
*** End Patch

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide rename 'Rand' 'RandRenamed' --loc 'src\fs\tmpdir.mbt:16:22'
Error: cannot rename symbol 'Rand' in package 'moonbitlang/core/random' outside of workspace
[1]
```
