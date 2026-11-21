# core find-references Kind async/os_error/extends.mbt:16:12

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' find-references 'Kind' --loc 'async/os_error/extends.mbt:16:12'
Found 15 references for symbol 'Kind':
<WORKDIR>/async/os_error/deprecated.mbt:33:12-33:16:
   | ///|
   | #deprecated
   | #doc(hidden)
33 | pub extend Kind with @json.ToJson::{to_json}
   |            ^^^^
   | 
   | ///|

<WORKDIR>/async/os_error/deprecated.mbt:38:12-38:16:
   | ///|
   | #deprecated
   | #doc(hidden)
38 | pub extend Kind with @debug.Debug::{to_repr}
   |            ^^^^
   | 
   | ///|

<WORKDIR>/async/os_error/deprecated.mbt:43:12-43:16:
   | ///|
   | #deprecated("Use `!=` instead", skip_current_package=true)
   | #doc(hidden)
43 | pub extend Kind with Eq::{not_equal}
   |            ^^^^

<WORKDIR>/async/os_error/error.mbt:31:11-31:15:
   | /// other APIs used by an application may require a newer Node.js version.
   | #derive(@json.ToJson)
   | pub suberror OsError {
31 |   OsError(Kind, raw_code~ : Int32, context~ : String)
   |           ^^^^
   | }
   | 

<WORKDIR>/async/os_error/error.mbt:38:11-38:15:
   | /// Create a `OsError` from a raw error number.
   | #as_free_fn
   | pub fn OsError::from_errno(errno : Int32, context~ : String) -> OsError {
38 |   OsError(Kind(errno), raw_code=errno, context~)
   |           ^^^^
   | }
   | 

<WORKDIR>/async/os_error/error.mbt:71:19-71:23:
   | pub fn check_errno(context : String) -> Unit raise OsError {
   |   let err_code = @errno.get_errno()
   |   if err_code != 0 {
71 |     raise OsError(Kind(err_code), raw_code=err_code, context~)
   |                   ^^^^
   |   }
   | }

<WORKDIR>/async/os_error/error_kind.mbt:34:30-34:34:
   | 
   | ///|
   | #cfg(any(target="native", target="wasm"))
34 | let errno_table : Map[Int32, Kind] = match @env_util.platform {
   |                              ^^^^
   |   Linux =>
   |     Map([

<WORKDIR>/async/os_error/error_kind.mbt:73:4-73:8:
   | 
   | ///|
   | #cfg(any(target="native", target="wasm"))
73 | fn Kind::Kind(code : Int32) -> Kind {
   |    ^^^^
   |   match errno_table.get(code) {
   |     None => Unknown

<WORKDIR>/async/os_error/error_kind.mbt:73:10-73:14:
   | 
   | ///|
   | #cfg(any(target="native", target="wasm"))
73 | fn Kind::Kind(code : Int32) -> Kind {
   |          ^^^^
   |   match errno_table.get(code) {
   |     None => Unknown

<WORKDIR>/async/os_error/error_kind.mbt:73:32-73:36:
   | 
   | ///|
   | #cfg(any(target="native", target="wasm"))
73 | fn Kind::Kind(code : Int32) -> Kind {
   |                                ^^^^
   |   match errno_table.get(code) {
   |     None => Unknown

<WORKDIR>/async/os_error/extends.mbt:16:12-16:16:
   | // limitations under the License.
   | 
   | ///|
16 | pub extend Kind with Eq::{equal}
   |            ^^^^

<WORKDIR>/async/os_error/os_error_test.mbt:41:23-41:27:
   | 
   | ///|
   | test "Kind promotes equal" {
41 |   let eq : (@os_error.Kind, @os_error.Kind) -> Bool = @os_error.Kind::equal
   |                       ^^^^
   |   inspect(eq(NotFound, NotFound), content="true")
   |   inspect(@os_error.Kind::NotFound.equal(AccessDenied), content="false")

<WORKDIR>/async/os_error/os_error_test.mbt:41:39-41:43:
   | 
   | ///|
   | test "Kind promotes equal" {
41 |   let eq : (@os_error.Kind, @os_error.Kind) -> Bool = @os_error.Kind::equal
   |                                       ^^^^
   |   inspect(eq(NotFound, NotFound), content="true")
   |   inspect(@os_error.Kind::NotFound.equal(AccessDenied), content="false")

<WORKDIR>/async/os_error/os_error_test.mbt:41:65-41:69:
   | 
   | ///|
   | test "Kind promotes equal" {
41 |   let eq : (@os_error.Kind, @os_error.Kind) -> Bool = @os_error.Kind::equal
   |                                                                 ^^^^
   |   inspect(eq(NotFound, NotFound), content="true")
   |   inspect(@os_error.Kind::NotFound.equal(AccessDenied), content="false")

<WORKDIR>/async/os_error/os_error_test.mbt:43:21-43:25:
   | test "Kind promotes equal" {
   |   let eq : (@os_error.Kind, @os_error.Kind) -> Bool = @os_error.Kind::equal
   |   inspect(eq(NotFound, NotFound), content="true")
43 |   inspect(@os_error.Kind::NotFound.equal(AccessDenied), content="false")
   |                     ^^^^
   | }
"" (escaped)
```
