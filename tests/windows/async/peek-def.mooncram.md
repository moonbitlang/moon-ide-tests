# async peek-def

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def 'mkdir' --loc 'src\fs\dir.mbt:24:14'
Definition found at file <WORKDIR>/src\fs\dir.mbt
   | /// the default value is `0o755` (anyone can read and traverse, only owner can write).
   | /// The `permission` parameter is currently ignored on Windows.
   | ///
   | /// If `recursive=true` (`false` by default), non-existing parent directories
   | /// of `path` will be recursively created, too.
24 | pub async fn mkdir(
   |              ^^^^^
   |   path : StringView,
   |   permission? : Int = 0o755,
   |   recursive? : Bool = false,
   | ) -> Unit {
   |   let context = "@fs.mkdir()"
   |   @event_loop.mkdir(path, mode=permission, context~) catch {
   |     @os_error.OSError(_) as err if recursive && err.is_ENOENT() => {
   |       let last_path_sep_index = match path.rev_find("/") {
   |         Some(index) => index
   |         None if @event_loop.platform is Windows &&
   |           path.rev_find("\\") is Some(index) => index
   |         None => raise err
   |       }
   |       let parent = path[:last_path_sep_index].trim_end(chars="/")
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def 'path' --loc 'src\fs\dir.mbt:25:3'
Definition found at file <WORKDIR>/src\fs\dir.mbt
   | /// The `permission` parameter is currently ignored on Windows.
   | ///
   | /// If `recursive=true` (`false` by default), non-existing parent directories
   | /// of `path` will be recursively created, too.
   | pub async fn mkdir(
25 |   path : StringView,
   |   ^^^^
   |   permission? : Int = 0o755,
   |   recursive? : Bool = false,
   | ) -> Unit {
   |   let context = "@fs.mkdir()"
   |   @event_loop.mkdir(path, mode=permission, context~) catch {
   |     @os_error.OSError(_) as err if recursive && err.is_ENOENT() => {
   |       let last_path_sep_index = match path.rev_find("/") {
   |         Some(index) => index
   |         None if @event_loop.platform is Windows &&
   |           path.rev_find("\\") is Some(index) => index
   |         None => raise err
   |       }
   |       let parent = path[:last_path_sep_index].trim_end(chars="/")
   |       let parent = if @event_loop.platform is Windows {
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def 'File' --loc 'src\fs\file.mbt:16:8'
Definition found at file <WORKDIR>/src\fs\file.mbt
   | // WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
16 | struct File {
   |        ^^^^
   |   io : @event_loop.IoHandle
   |   read_buf : @io.ReaderBuffer
   | }
   | 
   | ///|
   | pub fn File::fd(self : File) -> @fd_util.Fd {
   |   self.io.fd()
   | }
   | 
   | ///|
   | pub fn File::close(self : File) -> Unit {
   |   self.io.close()
   | }
   | 
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def 'io' --loc 'src\fs\file.mbt:17:3'
Definition found at file <WORKDIR>/src\fs\file.mbt
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
   | struct File {
17 |   io : @event_loop.IoHandle
   |   ^^
   |   read_buf : @io.ReaderBuffer
   | }
   | 
   | ///|
   | pub fn File::fd(self : File) -> @fd_util.Fd {
   |   self.io.fd()
   | }
   | 
   | ///|
   | pub fn File::close(self : File) -> Unit {
   |   self.io.close()
   | }
   | 
   | ///|
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def 'kind' --loc 'src\fs\utils.mbt:19:14'
Definition found at file <WORKDIR>/src\fs\utils.mbt
   | 
   | ///|
   | /// Get the kind of a file at `path`.
   | /// If `path` is a symbolic link and `follow_symlink` is `true` (`true` by default),
   | /// the kind of the target of the link will be returned.
19 | pub async fn kind(path : StringView, follow_symlink? : Bool = true) -> FileKind {
   |              ^^^^
   |   @event_loop.file_kind_by_path(
   |     path,
   |     parent=@fd_util.invalid_fd,
   |     follow_symlink~,
   |     context="@fs.kind()",
   |   )
   |   |> FileKind::from_fd_util_file_kind
   | }
   | 
   | ///|
   | /// Get the last access time of a file at `path`.
   | /// The return value is a pair `(s, ns)`,
   | /// representing the time of `s` seconds + `ns` nanoseconds.
   | ///
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def 'path' --loc 'src\fs\utils.mbt:19:19'
Definition found at file <WORKDIR>/src\fs\utils.mbt
   | 
   | ///|
   | /// Get the kind of a file at `path`.
   | /// If `path` is a symbolic link and `follow_symlink` is `true` (`true` by default),
   | /// the kind of the target of the link will be returned.
19 | pub async fn kind(path : StringView, follow_symlink? : Bool = true) -> FileKind {
   |                   ^^^^
   |   @event_loop.file_kind_by_path(
   |     path,
   |     parent=@fd_util.invalid_fd,
   |     follow_symlink~,
   |     context="@fs.kind()",
   |   )
   |   |> FileKind::from_fd_util_file_kind
   | }
   | 
   | ///|
   | /// Get the last access time of a file at `path`.
   | /// The return value is a pair `(s, ns)`,
   | /// representing the time of `s` seconds + `ns` nanoseconds.
   | ///
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def 'FileIdentity' --loc 'src\fs\watch.mbt:16:25'
Definition found at file <WORKDIR>/src\internal\event_loop\fs.mbt
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
   | #valtype
17 | pub(all) struct FileIdentity {
   |                 ^^^^^^^^^^^^
   |   dev_id : UInt64
   |   file_id : UInt64
   | } derive(Eq, Hash)
   | 
   | ///|
   | pub async fn open(
   |   path : StringView,
   |   // 0 => read only, 1 => write only, 2 => read write, 3 => directory listing
   |   access : Int,
   |   // See `@fs.CreateMode` for more details
   |   create~ : Int,
   |   append~ : Bool,
   |   // 0 => no sync, 1 => data sync, 2 => full sync
   |   sync~ : Int,
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def 'WatchedFile' --loc 'src\fs\watch.mbt:19:13'
Definition found at file <WORKDIR>/src\fs\watch.mbt
   | 
   | ///|
   | using @event_loop {type FileIdentity}
   | 
   | ///|
19 | priv struct WatchedFile {
   |             ^^^^^^^^^^^
   |   wd : @fd_util.Fd
   |   file_id : FileIdentity
   |   paths : Set[(FileIdentity, String)]
   |   is_dir : Bool
   |   children : Map[String, FileIdentity]
   |   mut modified : Bool
   |   dirty_children : Map[String, FileIdentity]
   | }
   | 
   | ///|
   | priv trait WatcherBackend {
   |   fn close(Self) -> Unit
   |   async fn wait(Self) -> Unit
   |   async fn add_file(
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def 'tmpdir_seed' --loc 'src\fs\tmpdir.mbt:16:5'
Definition found at file <WORKDIR>/src\fs\tmpdir.mbt
   | // WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
16 | let tmpdir_seed : @random.Rand = {
   |     ^^^^^^^^^^^
   |   let seed = Buffer()
   |   let now = @env.now()
   |   for _ in 0..<4 {
   |     seed.write_uint64_le(now)
   |   }
   |   @random.Rand::chacha8(seed=seed.contents())
   | }
   | 
   | ///|
   | extern "C" fn get_tmp_path_ffi() -> @c_buffer.Buffer = "moonbitlang_async_get_tmp_path"
   | 
   | ///|
   | let tmp_base_path : String = {
   |   let path = get_tmp_path_ffi()
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def 'Rand' --loc 'src\fs\tmpdir.mbt:16:22'
Definition found at file <MOON_HOME>/lib\core\random\random.mbt
   | // limitations under the License.
   | 
   | ///|
   | /// `Rand` is a pseudo-random number generator (PRNG) that provides various
   | /// methods to generate random numbers of different types.
18 | struct Rand(&Source)
   |        ^^^^
   | 
   | ///|
   | /// The [Source] trait defines a method to generate random numbers.
   | pub(open) trait Source {
   |   fn next(Self) -> UInt64
   | }
   | 
   | ///|
   | impl Source for @random_source.ChaCha8 with fn next(
   |   self : @random_source.ChaCha8,
   | ) -> UInt64 {
   |   self.next_uint64()
   | }
   | 
```
