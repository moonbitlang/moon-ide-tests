# rabbita find-references Path warren/path/sourcetree_path.mbt:2:20

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' find-references 'Path' --loc 'warren/path/sourcetree_path.mbt:2:20'
Found 33 references for symbol 'Path':
<WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt:29:19-29:23:
   | pub(all) struct Path(String) derive(Eq, Debug)
   | 
   | ///|
29 | pub impl Show for Path with fn output(path, logger) {
   |                   ^^^^
   |   logger.write_object(path.0)
   | }

<WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt:34:19-34:23:
   | }
   | 
   | ///|
34 | pub impl Show for Path with fn to_string(path) {
   |                   ^^^^
   |   path.0
   | }

<WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt:49:8-49:12:
   | ///   inspect(path.basename(), content="bin")
   | /// }
   | /// ```
49 | pub fn Path::basename(path : Path) -> StringView {
   |        ^^^^
   |   if is_windows {
   |     @win32.Path::basename(path.0)

<WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt:49:30-49:34:
   | ///   inspect(path.basename(), content="bin")
   | /// }
   | /// ```
49 | pub fn Path::basename(path : Path) -> StringView {
   |                              ^^^^
   |   if is_windows {
   |     @win32.Path::basename(path.0)

<WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt:66:8-66:12:
   | ///   inspect(path.dirname(), content="usr/local")
   | /// }
   | /// ```
66 | pub fn Path::dirname(path : Path) -> Path {
   |        ^^^^
   |   if is_windows {
   |     @win32.Path::dirname(path.0).0

<WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt:66:29-66:33:
   | ///   inspect(path.dirname(), content="usr/local")
   | /// }
   | /// ```
66 | pub fn Path::dirname(path : Path) -> Path {
   |                             ^^^^
   |   if is_windows {
   |     @win32.Path::dirname(path.0).0

<WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt:66:38-66:42:
   | ///   inspect(path.dirname(), content="usr/local")
   | /// }
   | /// ```
66 | pub fn Path::dirname(path : Path) -> Path {
   |                                      ^^^^
   |   if is_windows {
   |     @win32.Path::dirname(path.0).0

<WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt:84:8-84:12:
   | ///   inspect(path.extname(), content=".gz")
   | /// }
   | /// ```
84 | pub fn Path::extname(path : Path) -> StringView {
   |        ^^^^
   |   if is_windows {
   |     @win32.Path::extname(path.0)

<WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt:84:29-84:33:
   | ///   inspect(path.extname(), content=".gz")
   | /// }
   | /// ```
84 | pub fn Path::extname(path : Path) -> StringView {
   |                             ^^^^
   |   if is_windows {
   |     @win32.Path::extname(path.0)

<WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt:105:8-105:12:
    | ///   json_inspect(path2.is_absolute(), content=false)
    | /// }
    | /// ```
105 | pub fn Path::is_absolute(path : Path) -> Bool {
    |        ^^^^
    |   if is_windows {
    |     @win32.Path::is_absolute(path.0)

<WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt:105:33-105:37:
    | ///   json_inspect(path2.is_absolute(), content=false)
    | /// }
    | /// ```
105 | pub fn Path::is_absolute(path : Path) -> Bool {
    |                                 ^^^^
    |   if is_windows {
    |     @win32.Path::is_absolute(path.0)

<WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt:119:8-119:12:
    | /// Absolute right-hand paths do not override `lhs`. When both inputs are empty,
    | /// the result is `"."`.
    | ///
119 | pub fn Path::join(lhs : Path, rhs : Path) -> Path {
    |        ^^^^
    |   if is_windows {
    |     @win32.Path::join(lhs.0, rhs.0).0

<WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt:119:25-119:29:
    | /// Absolute right-hand paths do not override `lhs`. When both inputs are empty,
    | /// the result is `"."`.
    | ///
119 | pub fn Path::join(lhs : Path, rhs : Path) -> Path {
    |                         ^^^^
    |   if is_windows {
    |     @win32.Path::join(lhs.0, rhs.0).0

<WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt:119:37-119:41:
    | /// Absolute right-hand paths do not override `lhs`. When both inputs are empty,
    | /// the result is `"."`.
    | ///
119 | pub fn Path::join(lhs : Path, rhs : Path) -> Path {
    |                                     ^^^^
    |   if is_windows {
    |     @win32.Path::join(lhs.0, rhs.0).0

<WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt:119:46-119:50:
    | /// Absolute right-hand paths do not override `lhs`. When both inputs are empty,
    | /// the result is `"."`.
    | ///
119 | pub fn Path::join(lhs : Path, rhs : Path) -> Path {
    |                                              ^^^^
    |   if is_windows {
    |     @win32.Path::join(lhs.0, rhs.0).0

<WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt:138:8-138:12:
    | ///   2. POSIX leading `//` is normalized to `/`, following Node behavior.
    | ///
    | /// See `@path/posix` and `@path/win32` for separator-specific examples.
138 | pub fn Path::normalize(path : Path) -> Path {
    |        ^^^^
    |   if is_windows {
    |     Show::to_string(@win32.Path::normalize(path.0))

<WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt:138:31-138:35:
    | ///   2. POSIX leading `//` is normalized to `/`, following Node behavior.
    | ///
    | /// See `@path/posix` and `@path/win32` for separator-specific examples.
138 | pub fn Path::normalize(path : Path) -> Path {
    |                               ^^^^
    |   if is_windows {
    |     Show::to_string(@win32.Path::normalize(path.0))

<WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt:138:40-138:44:
    | ///   2. POSIX leading `//` is normalized to `/`, following Node behavior.
    | ///
    | /// See `@path/posix` and `@path/win32` for separator-specific examples.
138 | pub fn Path::normalize(path : Path) -> Path {
    |                                        ^^^^
    |   if is_windows {
    |     Show::to_string(@win32.Path::normalize(path.0))

<WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt:159:8-159:12:
    | /// Warning: cwd is already resolve symbolic link and normalized, but path doesn't.
    | ///
    | /// See `@path/posix` and `@path/win32` for separator-specific examples.
159 | pub fn Path::relative(path : Path, base~ : Path) -> Path {
    |        ^^^^
    |   if is_windows {
    |     @win32.Path::relative(path.0, base=base.0).0

<WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt:159:30-159:34:
    | /// Warning: cwd is already resolve symbolic link and normalized, but path doesn't.
    | ///
    | /// See `@path/posix` and `@path/win32` for separator-specific examples.
159 | pub fn Path::relative(path : Path, base~ : Path) -> Path {
    |                              ^^^^
    |   if is_windows {
    |     @win32.Path::relative(path.0, base=base.0).0

<WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt:159:44-159:48:
    | /// Warning: cwd is already resolve symbolic link and normalized, but path doesn't.
    | ///
    | /// See `@path/posix` and `@path/win32` for separator-specific examples.
159 | pub fn Path::relative(path : Path, base~ : Path) -> Path {
    |                                            ^^^^
    |   if is_windows {
    |     @win32.Path::relative(path.0, base=base.0).0

<WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt:159:53-159:57:
    | /// Warning: cwd is already resolve symbolic link and normalized, but path doesn't.
    | ///
    | /// See `@path/posix` and `@path/win32` for separator-specific examples.
159 | pub fn Path::relative(path : Path, base~ : Path) -> Path {
    |                                                     ^^^^
    |   if is_windows {
    |     @win32.Path::relative(path.0, base=base.0).0

<WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt:174:8-174:12:
    | ///
    | /// Warning: cwd is already resolve symbolic link and normalized, but path doesn't.
    | ///
174 | pub fn Path::resolve(path : Path) -> Path {
    |        ^^^^
    |   if is_windows {
    |     Show::to_string(@win32.Path::resolve(path.0))

<WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt:174:29-174:33:
    | ///
    | /// Warning: cwd is already resolve symbolic link and normalized, but path doesn't.
    | ///
174 | pub fn Path::resolve(path : Path) -> Path {
    |                             ^^^^
    |   if is_windows {
    |     Show::to_string(@win32.Path::resolve(path.0))

<WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt:174:38-174:42:
    | ///
    | /// Warning: cwd is already resolve symbolic link and normalized, but path doesn't.
    | ///
174 | pub fn Path::resolve(path : Path) -> Path {
    |                                      ^^^^
    |   if is_windows {
    |     Show::to_string(@win32.Path::resolve(path.0))

<WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt:192:12-192:16:
    | 
    | ///|
    | #deprecated
192 | pub extend Path with Eq::{not_equal, equal}
    |            ^^^^
    | 
    | ///|

<WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt:196:12-196:16:
    | 
    | ///|
    | #deprecated
196 | pub extend Path with Debug::{to_repr}
    |            ^^^^
    | 
    | ///|

<WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt:199:12-199:16:
    | pub extend Path with Debug::{to_repr}
    | 
    | ///|
199 | pub extend Path with Show::{to_string}
    |            ^^^^
    | 
    | ///|

<WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt:203:12-203:16:
    | 
    | ///|
    | #deprecated
203 | pub extend Path with Show::{output}
    |            ^^^^

<WORKDIR>/examples/document/cmd/server/main.mbt:22:16-22:20:
   |   let server = @rabbita_server.Server(
   |     api~,
   |     port=3002,
22 |     dist=@path.Path("./dist"),
   |                ^^^^
   |     assets=warren_assets(),
   |     component=@app.view,

<WORKDIR>/rabbita/server/server.mbt:33:17-33:21:
   | pub async fn Server::Server(
   |   api~ : @moonback.Module,
   |   port~ : UInt16,
33 |   dist? : @path.Path,
   |                 ^^^^
   |   assets? : Map[String, Bytes],
   |   component? : () -> Val[Html],

<WORKDIR>/rabbita/server/server.mbt:184:26-184:30:
    |     )
    |     return
    |   }
184 |   let index_path = @path.Path(dir).join("index.html")
    |                          ^^^^
    |   let index_path = "\{index_path}"
    |   guard @fs.exists(index_path) else {

<WORKDIR>/warren/path/sourcetree_path.mbt:2:20-2:24:
  | ///|
2 | pub type Path = @p.Path
  |                    ^^^^
  | 
  | ///|
"" (escaped)
```
