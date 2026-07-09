# async outline

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
$ run_moon_ide moon ide outline 'src/fs/dir.mbt'
 24 |pub async fn mkdir(
 25 |  path : StringView,
 26 |  permission? : Int = 0o755,
 27 |  recursive? : Bool = false,
 28 |) -> Unit {
    |...
 57 |pub async fn rmdir(path : StringView, recursive? : Bool = false) -> Unit {
    |...
 81 |priv enum DirectoryState {
    |...
 88 |priv struct DirectoryBuffer(@c_buffer.Buffer)
    |...
 92 |struct Directory {
    |...
109 |pub fn Directory::close(self : Directory) -> Unit {
    |...
115 |#cfg(target="native")
116 |extern "C" fn Directory::min_buffer_size() -> Int = "moonbitlang_async_dir_buffer_min_size"
    |...
119 |#cfg(target="wasm")
120 |#unsafe_skip_stub_check
121 |fn Directory::min_buffer_size() -> Int = "moonbitlang/async" "fs/dir_buffer_min_size"
    |...
126 |pub async fn opendir(path : StringView) -> Directory {
    |...
131 |async fn opendir_aux(path : StringView, context~ : String) -> Directory {
    |...
152 |fn Directory::from_io_handle(io : @event_loop.IoHandle) -> Directory {
    |...
166 |#cfg(target="native")
167 |extern "C" fn DirectoryBuffer::entry_length(self : Self, offset : Int) -> Int = "moonbitlang_async_dir_entry_length"
    |...
170 |#cfg(target="wasm")
171 |#unsafe_skip_stub_check
172 |#borrow(self)
173 |fn DirectoryBuffer::entry_length(self : Self, offset : Int) -> Int = "moonbitlang/async" "fs/dir_entry_length"
    |...
176 |#cfg(target="native")
177 |extern "C" fn DirectoryBuffer::entry_name_len(self : Self, offset : Int) -> Int = "moonbitlang_async_dir_entry_get_name_len"
    |...
180 |#cfg(target="wasm")
181 |#unsafe_skip_stub_check
182 |#borrow(self)
183 |fn DirectoryBuffer::entry_name_len(self : Self, offset : Int) -> Int = "moonbitlang/async" "fs/dir_entry_get_name_len"
    |...
186 |#cfg(target="native")
187 |extern "C" fn DirectoryBuffer::entry_name_offset(
188 |  self : Self,
189 |  offset : Int,
190 |) -> Int = "moonbitlang_async_dir_entry_get_name_offset"
    |...
193 |#cfg(target="wasm")
194 |#unsafe_skip_stub_check
195 |#borrow(self)
196 |fn DirectoryBuffer::entry_name_offset(self : Self, offset : Int) -> Int = "moonbitlang/async" "fs/dir_entry_get_name_offset"
    |...
199 |#cfg(target="native")
200 |extern "C" fn DirectoryBuffer::entry_is_dir(self : Self, offset : Int) -> Int = "moonbitlang_async_dir_entry_is_dir"
    |...
203 |#cfg(target="wasm")
204 |#unsafe_skip_stub_check
205 |#borrow(self)
206 |fn DirectoryBuffer::entry_is_dir(self : Self, offset : Int) -> Int = "moonbitlang/async" "fs/dir_entry_is_dir"
    |...
209 |#cfg(target="native")
210 |extern "C" fn DirectoryBuffer::entry_is_hidden(
211 |  self : Self,
212 |  offset : Int,
213 |) -> Bool = "moonbitlang_async_dir_entry_is_hidden"
    |...
216 |#cfg(target="wasm")
217 |#unsafe_skip_stub_check
218 |#borrow(self)
219 |fn DirectoryBuffer::entry_is_hidden(self : Self, offset : Int) -> Bool = "moonbitlang/async" "fs/dir_entry_is_hidden"
    |...
222 |#cfg(target="native")
223 |extern "C" fn DirectoryBuffer::entry_file_id(
224 |  self : Self,
225 |  offset : Int,
226 |) -> UInt64 = "moonbitlang_async_dir_entry_get_file_id"
    |...
229 |#cfg(target="wasm")
230 |#unsafe_skip_stub_check
231 |#borrow(self)
232 |fn DirectoryBuffer::entry_file_id(self : Self, offset : Int) -> UInt64 = "moonbitlang/async" "fs/dir_entry_get_file_id"
    |...
235 |#valtype
236 |pub struct DirectoryEntry {
    |...
257 |pub async fn Directory::next(
258 |  dir : Directory,
259 |  include_hidden? : Bool = true,
260 |  include_special? : Bool = false,
261 |) -> DirectoryEntry? {
    |...
270 |async fn Directory::next_aux(
271 |  dir : Directory,
272 |  include_hidden~ : Bool,
273 |  include_special~ : Bool,
274 |  restart? : Bool = false,
275 |  context~ : String,
276 |) -> DirectoryEntry? {
    |...
347 |pub async fn Directory::read_all(
348 |  dir : Directory,
349 |  include_hidden? : Bool = true,
350 |  include_special? : Bool = false,
351 |) -> Array[String] {
    |...
374 |pub async fn readdir(
375 |  path : StringView,
376 |  include_hidden? : Bool = true,
377 |  include_special? : Bool = false,
378 |  sort? : Bool = false,
379 |) -> Array[String] {
    |...
413 |pub async fn walk(
414 |  path : StringView,
415 |  f : async (String, Array[String]) -> Unit,
416 |  exclude? : (String) -> Bool = _ => false,
417 |  max_concurrency? : Int = 1000,
418 |  allow_failure? : Bool = false,
419 |) -> Unit {
    |...

```

```mooncram
$ run_moon_ide moon ide outline 'src/fs/file.mbt'
 16 |struct File {
    |...
 22 |pub fn File::fd(self : File) -> @fd_util.Fd {
    |...
 27 |pub fn File::close(self : File) -> Unit {
    |...
 32 |pub(all) enum Mode {
    |...
 51 |pub(all) enum SyncMode {
    |...
 65 |pub(all) enum CreateMode {
    |...
 79 |fn CreateMode::to_int(self : CreateMode) -> Int = "%identity"
    |...
110 |#label_migration(create, fill=false, msg="the option `create` is deprecated, use `create_mode` and `permission` instead")
111 |#label_migration(truncate, fill=false, msg="the option `truncate` is deprecated, use `create_mode` instead")
112 |pub async fn open(
113 |  filename : StringView,
114 |  mode~ : Mode,
115 |  sync? : SyncMode = NoSync,
116 |  append? : Bool = false,
117 |  create_mode? : CreateMode,
118 |  permission? : Int,
119 |  create? : Int,
120 |  truncate? : Bool = false,
121 |) -> File {
    |...
176 |pub async fn create(
177 |  filename : StringView,
178 |  allow_existing? : Bool = true,
179 |  permission? : Int = 0o644,
180 |  sync? : SyncMode = NoSync,
181 |) -> File {
    |...
201 |pub impl @io.Reader for File with fn _direct_read(self, buf, offset~, max_len~) {
    |...
206 |pub impl @io.Reader for File with fn _get_internal_buffer(self) {
    |...
222 |pub async fn File::read_at(
223 |  self : File,
224 |  buf : FixedArray[Byte],
225 |  position~ : Int64,
226 |  offset? : Int = 0,
227 |  len? : Int = buf.length() - offset,
228 |) -> Int {
    |...
233 |pub async fn File::read_exactly_at(
234 |  self : File,
235 |  len : Int,
236 |  position~ : Int64,
237 |) -> Bytes {
    |...
262 |pub impl @io.Writer for File with fn write_once(self, buf, offset~, len~) {
    |...
277 |pub async fn File::write_at(
278 |  self : File,
279 |  buf : BytesView,
280 |  position~ : Int64,
281 |) -> Unit {
    |...
296 |pub async fn File::sync(self : File, only_data? : Bool = false) -> Unit {
    |...
305 |pub(all) enum Lock {
    |...
320 |pub async fn File::lock(self : File, lock : Lock) -> Unit {
    |...
325 |#cfg(target="native")
326 |extern "C" fn errno_is_lock_violation(err : Int) -> Bool = "moonbitlang_async_errno_is_lock_violation"
    |...
329 |#cfg(target="wasm")
330 |#unsafe_skip_stub_check
331 |fn errno_is_lock_violation(err : Int) -> Bool = "moonbitlang/async" "fs/errno_is_lock_violation"
    |...
334 |#cfg(target="native")
335 |extern "C" fn try_lock_ffi(fd : @fd_util.Fd, exclusive~ : Bool) -> Int = "moonbitlang_async_try_lock_file"
    |...
338 |#cfg(target="wasm")
339 |#unsafe_skip_stub_check
340 |fn try_lock_ffi(fd : @fd_util.Fd, exclusive~ : Bool) -> Int = "moonbitlang/async" "fs/try_lock_file"
    |...
356 |pub fn File::try_lock(self : File, lock : Lock) -> Bool raise {
    |...
369 |#cfg(target="native")
370 |extern "C" fn unlock_ffi(fd : @fd_util.Fd) -> Int = "moonbitlang_async_unlock_file"
    |...
373 |#cfg(target="wasm")
374 |#unsafe_skip_stub_check
375 |fn unlock_ffi(fd : @fd_util.Fd) -> Int = "moonbitlang/async" "fs/unlock_file"
    |...
379 |pub fn File::unlock(self : File) -> Unit {
    |...
389 |pub async fn remove(path : StringView) -> Unit {
    |...
400 |pub async fn rename(
401 |  old_path : StringView,
402 |  new_path : StringView,
403 |  replace? : Bool = true,
404 |) -> Unit {
    |...
411 |pub async fn File::size(self : File) -> Int64 {
    |...
423 |pub fn File::as_dir(self : File) -> Directory raise {
    |...
436 |#cfg(platform="windows")
    |...
440 |pub fn File::kind(self : File) -> FileKind {
    |...
448 |pub async fn File::atime(self : File) -> (Int64, Int) {
    |...
456 |pub async fn File::mtime(self : File) -> (Int64, Int) {
    |...
464 |pub async fn File::ctime(self : File) -> (Int64, Int) {
    |...
472 |pub async fn read_file(
473 |  path : StringView,
474 |  sync_timestamp? : Bool = false,
475 |) -> &@io.Data {
    |...
490 |#label_migration(create, fill=false, msg="the option `create` is deprecated, use `create_mode` and `permission` instead")
491 |#label_migration(truncate, fill=false, msg="the option `truncate` is deprecated, use `create_mode` instead")
492 |pub async fn write_file(
493 |  path : StringView,
494 |  content : &@io.Data,
495 |  create_mode? : CreateMode,
496 |  permission? : Int,
497 |  sync? : SyncMode = Data,
498 |  append? : Bool = false,
499 |  create? : Int,
500 |  truncate? : Bool = true,
501 |) -> Unit {
    |...

```

```mooncram
$ run_moon_ide moon ide outline 'src/fs/utils.mbt'
 19 |pub async fn kind(path : StringView, follow_symlink? : Bool = true) -> FileKind {
    |...
 36 |pub async fn atime(
 37 |  path : StringView,
 38 |  follow_symlink? : Bool = true,
 39 |) -> (Int64, Int) {
    |...
 50 |pub async fn mtime(
 51 |  path : StringView,
 52 |  follow_symlink? : Bool = true,
 53 |) -> (Int64, Int) {
    |...
 64 |pub async fn ctime(
 65 |  path : StringView,
 66 |  follow_symlink? : Bool = true,
 67 |) -> (Int64, Int) {
    |...
 72 |pub async fn exists(path : StringView) -> Bool {
    |...
 82 |pub async fn can_read(path : StringView) -> Bool {
    |...
 93 |pub async fn can_write(path : StringView) -> Bool {
    |...
104 |pub async fn can_execute(path : StringView) -> Bool {
    |...
121 |#cfg(target="native")
122 |pub async fn realpath(path : StringView) -> String {
    |...
140 |pub async fn symlink(
141 |  target~ : StringView,
142 |  path : StringView,
143 |  force_symlink? : Bool = false,
144 |) -> Unit {
    |...
158 |pub async fn chmod(path : StringView, mode : Int) -> Unit {
    |...

```

```mooncram
$ run_moon_ide moon ide outline 'src/fs/watch.mbt'
 16 |using @event_loop {type FileIdentity}
    |...
 19 |priv struct WatchedFile {
    |...
 30 |priv trait WatcherBackend {
    |...
 45 |struct Watcher {
    |...
 57 |pub fn Watcher::close(self : Watcher) -> Unit {
    |...
 68 |#cfg(platform="windows")
 69 |fn Watcher::new_backend(
 70 |  self : Watcher,
 71 |  root : @event_loop.IoHandle,
 72 |  root_id~ : FileIdentity,
 73 |  debounce_timeout~ : Int,
 74 |  max_debounce_delay~ : Int,
 75 |  context~ : String,
 76 |) -> &WatcherBackend {
    |...
 82 |#cfg(not(platform="windows"))
 83 |fn Watcher::new_backend(
 84 |  self : Watcher,
 85 |  root : @event_loop.IoHandle,
 86 |  root_id~ : FileIdentity,
 87 |  debounce_timeout~ : Int,
 88 |  max_debounce_delay~ : Int,
 89 |  context~ : String,
 90 |) -> &WatcherBackend raise {
    |...
129 |pub async fn Watcher::Watcher(
130 |  path : String,
131 |  debounce_timeout? : Int = 20,
132 |  max_debounce_delay? : Int = 200,
133 |  ignored_paths? : (String) -> Bool = _ => false,
134 |) -> Watcher {
    |...
197 |fn rel_path(parent : String, name : String) -> String {
    |...
208 |pub async fn Watcher::wait_any(self : Watcher) -> Unit {
    |...
236 |fn WatchedFile::is_clean(file : WatchedFile) -> Bool {
    |...
241 |async fn Watcher::get_file_at(
242 |  self : Watcher,
243 |  file_id~ : FileIdentity,
244 |  is_dir~ : Bool,
245 |  path~ : String,
246 |  context~ : String,
247 |) -> WatchedFile {
    |...
272 |async fn Watcher::add_file_at(
273 |  self : Watcher,
274 |  dir : WatchedFile,
275 |  name : String,
276 |  is_dir~ : Bool,
277 |  file_id~ : FileIdentity,
278 |  path~ : String,
279 |  context~ : String,
280 |) -> Unit {
    |...
302 |fn Watcher::remove_file_at(
303 |  self : Watcher,
304 |  dir : WatchedFile,
305 |  name : String,
306 |) -> Unit {
    |...
320 |async fn Watcher::scan_dir(
321 |  self : Watcher,
322 |  dir : WatchedFile,
323 |  path~ : String,
324 |  context~ : String,
325 |) -> Unit {
    |...
352 |async fn Watcher::synchronize_tree(self : Watcher, context~ : String) -> Unit {
    |...
371 |async fn Watcher::synchronize_file(
372 |  self : Watcher,
373 |  file : WatchedFile,
374 |  path~ : String,
375 |  context~ : String,
376 |) -> Unit {
    |...
399 |fn Watcher::mark_as_modified(self : Watcher, id : FileIdentity) -> Unit {
    |...
415 |fn Watcher::add_dirty_child(
416 |  self : Watcher,
417 |  dir_id : FileIdentity,
418 |  name : String,
419 |  child_id : FileIdentity,
420 |) -> Unit {
    |...
433 |fn Watcher::overflow(self : Watcher) -> Unit {
    |...

```

```mooncram
$ run_moon_ide moon ide outline 'src/fs/tmpdir.mbt'
16 |let tmpdir_seed : @random.Rand = {
   |...
26 |extern "C" fn get_tmp_path_ffi() -> @c_buffer.Buffer = "moonbitlang_async_get_tmp_path"
   |...
29 |let tmp_base_path : String = {
   |...
53 |pub async fn tmpdir(prefix~ : StringView) -> String {
   |...

```
