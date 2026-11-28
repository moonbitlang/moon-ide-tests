# rabbita find-references Path warren\path\sourcetree_path.mbt:2:20

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' find-references 'Path' --loc 'warren\path\sourcetree_path.mbt:2:20'
Found 33 references for symbol 'Path':
<WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt:30:19-30:23:
   | pub(all) struct Path(String)
   | 
   | ///|
30 | pub impl Show for Path with fn output(path, logger) {
   |                   ^^^^
   |   logger.write_object(path.0)
   | }

<WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt:35:19-35:23:
   | }
   | 
   | ///|
35 | pub impl Show for Path with fn to_string(path) {
   |                   ^^^^
   |   path.0
   | }

<WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt:50:8-50:12:
   | ///   inspect(path.basename(), content="bin")
   | /// }
   | /// ```
50 | pub fn Path::basename(path : Path) -> StringView {
   |        ^^^^
   |   if is_windows {
   |     @win32.Path::basename(path.0)

<WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt:50:30-50:34:
   | ///   inspect(path.basename(), content="bin")
   | /// }
   | /// ```
50 | pub fn Path::basename(path : Path) -> StringView {
   |                              ^^^^
   |   if is_windows {
   |     @win32.Path::basename(path.0)

<WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt:67:8-67:12:
   | ///   inspect(path.dirname(), content="usr/local")
   | /// }
   | /// ```
67 | pub fn Path::dirname(path : Path) -> Path {
   |        ^^^^
   |   if is_windows {
   |     @win32.Path::dirname(path.0).0

<WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt:67:29-67:33:
   | ///   inspect(path.dirname(), content="usr/local")
   | /// }
   | /// ```
67 | pub fn Path::dirname(path : Path) -> Path {
   |                             ^^^^
   |   if is_windows {
   |     @win32.Path::dirname(path.0).0

<WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt:67:38-67:42:
   | ///   inspect(path.dirname(), content="usr/local")
   | /// }
   | /// ```
67 | pub fn Path::dirname(path : Path) -> Path {
   |                                      ^^^^
   |   if is_windows {
   |     @win32.Path::dirname(path.0).0

<WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt:85:8-85:12:
   | ///   inspect(path.extname(), content=".gz")
   | /// }
   | /// ```
85 | pub fn Path::extname(path : Path) -> StringView {
   |        ^^^^
   |   if is_windows {
   |     @win32.Path::extname(path.0)

<WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt:85:29-85:33:
   | ///   inspect(path.extname(), content=".gz")
   | /// }
   | /// ```
85 | pub fn Path::extname(path : Path) -> StringView {
   |                             ^^^^
   |   if is_windows {
   |     @win32.Path::extname(path.0)

<WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt:106:8-106:12:
    | ///   json_inspect(path2.is_absolute(), content=false)
    | /// }
    | /// ```
106 | pub fn Path::is_absolute(path : Path) -> Bool {
    |        ^^^^
    |   if is_windows {
    |     @win32.Path::is_absolute(path.0)

<WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt:106:33-106:37:
    | ///   json_inspect(path2.is_absolute(), content=false)
    | /// }
    | /// ```
106 | pub fn Path::is_absolute(path : Path) -> Bool {
    |                                 ^^^^
    |   if is_windows {
    |     @win32.Path::is_absolute(path.0)

<WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt:120:8-120:12:
    | /// Absolute right-hand paths do not override `lhs`. When both inputs are empty,
    | /// the result is `"."`.
    | ///
120 | pub fn Path::join(lhs : Path, rhs : Path) -> Path {
    |        ^^^^
    |   if is_windows {
    |     @win32.Path::join(lhs.0, rhs.0).0

<WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt:120:25-120:29:
    | /// Absolute right-hand paths do not override `lhs`. When both inputs are empty,
    | /// the result is `"."`.
    | ///
120 | pub fn Path::join(lhs : Path, rhs : Path) -> Path {
    |                         ^^^^
    |   if is_windows {
    |     @win32.Path::join(lhs.0, rhs.0).0

<WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt:120:37-120:41:
    | /// Absolute right-hand paths do not override `lhs`. When both inputs are empty,
    | /// the result is `"."`.
    | ///
120 | pub fn Path::join(lhs : Path, rhs : Path) -> Path {
    |                                     ^^^^
    |   if is_windows {
    |     @win32.Path::join(lhs.0, rhs.0).0

<WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt:120:46-120:50:
    | /// Absolute right-hand paths do not override `lhs`. When both inputs are empty,
    | /// the result is `"."`.
    | ///
120 | pub fn Path::join(lhs : Path, rhs : Path) -> Path {
    |                                              ^^^^
    |   if is_windows {
    |     @win32.Path::join(lhs.0, rhs.0).0

<WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt:139:8-139:12:
    | ///   2. POSIX leading `//` is normalized to `/`, following Node behavior.
    | ///
    | /// See `@path/posix` and `@path/win32` for separator-specific examples.
139 | pub fn Path::normalize(path : Path) -> Path {
    |        ^^^^
    |   if is_windows {
    |     Show::to_string(@win32.Path::normalize(path.0))

<WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt:139:31-139:35:
    | ///   2. POSIX leading `//` is normalized to `/`, following Node behavior.
    | ///
    | /// See `@path/posix` and `@path/win32` for separator-specific examples.
139 | pub fn Path::normalize(path : Path) -> Path {
    |                               ^^^^
    |   if is_windows {
    |     Show::to_string(@win32.Path::normalize(path.0))

<WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt:139:40-139:44:
    | ///   2. POSIX leading `//` is normalized to `/`, following Node behavior.
    | ///
    | /// See `@path/posix` and `@path/win32` for separator-specific examples.
139 | pub fn Path::normalize(path : Path) -> Path {
    |                                        ^^^^
    |   if is_windows {
    |     Show::to_string(@win32.Path::normalize(path.0))

<WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt:160:8-160:12:
    | /// Warning: cwd is already resolve symbolic link and normalized, but path doesn't.
    | ///
    | /// See `@path/posix` and `@path/win32` for separator-specific examples.
160 | pub fn Path::relative(path : Path, base~ : Path) -> Path {
    |        ^^^^
    |   if is_windows {
    |     @win32.Path::relative(path.0, base=base.0).0

<WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt:160:30-160:34:
    | /// Warning: cwd is already resolve symbolic link and normalized, but path doesn't.
    | ///
    | /// See `@path/posix` and `@path/win32` for separator-specific examples.
160 | pub fn Path::relative(path : Path, base~ : Path) -> Path {
    |                              ^^^^
    |   if is_windows {
    |     @win32.Path::relative(path.0, base=base.0).0

<WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt:160:44-160:48:
    | /// Warning: cwd is already resolve symbolic link and normalized, but path doesn't.
    | ///
    | /// See `@path/posix` and `@path/win32` for separator-specific examples.
160 | pub fn Path::relative(path : Path, base~ : Path) -> Path {
    |                                            ^^^^
    |   if is_windows {
    |     @win32.Path::relative(path.0, base=base.0).0

<WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt:160:53-160:57:
    | /// Warning: cwd is already resolve symbolic link and normalized, but path doesn't.
    | ///
    | /// See `@path/posix` and `@path/win32` for separator-specific examples.
160 | pub fn Path::relative(path : Path, base~ : Path) -> Path {
    |                                                     ^^^^
    |   if is_windows {
    |     @win32.Path::relative(path.0, base=base.0).0

<WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt:175:8-175:12:
    | ///
    | /// Warning: cwd is already resolve symbolic link and normalized, but path doesn't.
    | ///
175 | pub fn Path::resolve(path : Path) -> Path {
    |        ^^^^
    |   if is_windows {
    |     Show::to_string(@win32.Path::resolve(path.0))

<WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt:175:29-175:33:
    | ///
    | /// Warning: cwd is already resolve symbolic link and normalized, but path doesn't.
    | ///
175 | pub fn Path::resolve(path : Path) -> Path {
    |                             ^^^^
    |   if is_windows {
    |     Show::to_string(@win32.Path::resolve(path.0))

<WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt:175:38-175:42:
    | ///
    | /// Warning: cwd is already resolve symbolic link and normalized, but path doesn't.
    | ///
175 | pub fn Path::resolve(path : Path) -> Path {
    |                                      ^^^^
    |   if is_windows {
    |     Show::to_string(@win32.Path::resolve(path.0))

<WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt:193:12-193:16:
    | 
    | ///|
    | #deprecated
193 | pub extend Path with Eq::{not_equal, equal}
    |            ^^^^
    | 
    | ///|

<WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt:197:12-197:16:
    | 
    | ///|
    | #deprecated
197 | pub extend Path with Debug::{to_repr}
    |            ^^^^
    | 
    | ///|

<WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt:200:12-200:16:
    | pub extend Path with Debug::{to_repr}
    | 
    | ///|
200 | pub extend Path with Show::{to_string}
    |            ^^^^
    | 
    | ///|

<WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt:204:12-204:16:
    | 
    | ///|
    | #deprecated
204 | pub extend Path with Show::{output}
    |            ^^^^

<WORKDIR>/examples\document\cmd\server\main.mbt:22:16-22:20:
   |   let server = @rabbita_server.Server(
   |     api~,
   |     port=3002,
22 |     dist=@path.Path("./dist"),
   |                ^^^^
   |     assets=warren_assets(),
   |     component=@app.view,

<WORKDIR>/rabbita\server\server.mbt:33:17-33:21:
   | pub async fn Server::Server(
   |   api~ : @moonback.Module,
   |   port~ : UInt16,
33 |   dist? : @path.Path,
   |                 ^^^^
   |   assets? : Map[String, Bytes],
   |   component? : () -> Val[Html],

<WORKDIR>/rabbita\server\server.mbt:184:26-184:30:
    |     )
    |     return
    |   }
184 |   let index_path = @path.Path(dir).join("index.html")
    |                          ^^^^
    |   let index_path = "\{index_path}"
    |   guard @fs.exists(index_path) else {

<WORKDIR>/warren\path\sourcetree_path.mbt:2:20-2:24:
  | ///|
2 | pub type Path = @p.Path
  |                    ^^^^
  | 
  | ///|
"" (escaped)
```
