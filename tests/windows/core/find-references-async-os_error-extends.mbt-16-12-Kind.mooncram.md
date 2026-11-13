# core find-references Kind async\os_error\extends.mbt:16:12

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' find-references 'Kind' --loc 'async\os_error\extends.mbt:16:12'
Found 15 references for symbol 'Kind':
<WORKDIR>/async\os_error\deprecated.mbt:33:12-33:16:
   | ///|
   | #deprecated
   | #doc(hidden)
33 | pub extend Kind with @json.ToJson::{to_json}
   |            ^^^^
   | 
   | ///|

<WORKDIR>/async\os_error\deprecated.mbt:38:12-38:16:
   | ///|
   | #deprecated
   | #doc(hidden)
38 | pub extend Kind with @debug.Debug::{to_repr}
   |            ^^^^
   | 
   | ///|

<WORKDIR>/async\os_error\deprecated.mbt:43:12-43:16:
   | ///|
   | #deprecated("Use `!=` instead", skip_current_package=true)
   | #doc(hidden)
43 | pub extend Kind with Eq::{not_equal}
   |            ^^^^

<WORKDIR>/async\os_error\error.mbt:27:11-27:15:
   | /// `context` describe the context that generated this error.
   | #derive(@json.ToJson)
   | pub suberror OsError {
27 |   OsError(Kind, raw_code~ : Int32, context~ : String)
   |           ^^^^
   | }
   | 

<WORKDIR>/async\os_error\error.mbt:34:11-34:15:
   | /// Create a `OsError` from a raw error number
   | #as_free_fn
   | pub fn OsError::from_errno(errno : Int32, context~ : String) -> OsError {
34 |   OsError(Kind(errno), raw_code=errno, context~)
   |           ^^^^
   | }
   | 

<WORKDIR>/async\os_error\error.mbt:66:19-66:23:
   | pub fn check_errno(context : String) -> Unit raise OsError {
   |   let err_code = @errno.get_errno()
   |   if err_code != 0 {
66 |     raise OsError(Kind(err_code), raw_code=err_code, context~)
   |                   ^^^^
   |   }
   | }

<WORKDIR>/async\os_error\error_kind.mbt:33:30-33:34:
   | }
   | 
   | ///|
33 | let errno_table : Map[Int32, Kind] = match @env_util.platform {
   |                              ^^^^
   |   Linux =>
   |     Map([

<WORKDIR>/async\os_error\error_kind.mbt:71:4-71:8:
   | }
   | 
   | ///|
71 | fn Kind::Kind(code : Int32) -> Kind {
   |    ^^^^
   |   match errno_table.get(code) {
   |     None => Unknown

<WORKDIR>/async\os_error\error_kind.mbt:71:10-71:14:
   | }
   | 
   | ///|
71 | fn Kind::Kind(code : Int32) -> Kind {
   |          ^^^^
   |   match errno_table.get(code) {
   |     None => Unknown

<WORKDIR>/async\os_error\error_kind.mbt:71:32-71:36:
   | }
   | 
   | ///|
71 | fn Kind::Kind(code : Int32) -> Kind {
   |                                ^^^^
   |   match errno_table.get(code) {
   |     None => Unknown

<WORKDIR>/async\os_error\extends.mbt:16:12-16:16:
   | // limitations under the License.
   | 
   | ///|
16 | pub extend Kind with Eq::{equal}
   |            ^^^^

<WORKDIR>/async\os_error\os_error_test.mbt:39:23-39:27:
   | 
   | ///|
   | test "Kind promotes equal" {
39 |   let eq : (@os_error.Kind, @os_error.Kind) -> Bool = @os_error.Kind::equal
   |                       ^^^^
   |   inspect(eq(NotFound, NotFound), content="true")
   |   inspect(@os_error.Kind::NotFound.equal(AccessDenied), content="false")

<WORKDIR>/async\os_error\os_error_test.mbt:39:39-39:43:
   | 
   | ///|
   | test "Kind promotes equal" {
39 |   let eq : (@os_error.Kind, @os_error.Kind) -> Bool = @os_error.Kind::equal
   |                                       ^^^^
   |   inspect(eq(NotFound, NotFound), content="true")
   |   inspect(@os_error.Kind::NotFound.equal(AccessDenied), content="false")

<WORKDIR>/async\os_error\os_error_test.mbt:39:65-39:69:
   | 
   | ///|
   | test "Kind promotes equal" {
39 |   let eq : (@os_error.Kind, @os_error.Kind) -> Bool = @os_error.Kind::equal
   |                                                                 ^^^^
   |   inspect(eq(NotFound, NotFound), content="true")
   |   inspect(@os_error.Kind::NotFound.equal(AccessDenied), content="false")

<WORKDIR>/async\os_error\os_error_test.mbt:41:21-41:25:
   | test "Kind promotes equal" {
   |   let eq : (@os_error.Kind, @os_error.Kind) -> Bool = @os_error.Kind::equal
   |   inspect(eq(NotFound, NotFound), content="true")
41 |   inspect(@os_error.Kind::NotFound.equal(AccessDenied), content="false")
   |                     ^^^^
   | }
"" (escaped)
```
