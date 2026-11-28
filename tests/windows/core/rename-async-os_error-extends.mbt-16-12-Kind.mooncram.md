# core rename Kind async\os_error\extends.mbt:16:12

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' rename 'Kind' 'KindRenamed' --loc 'async\os_error\extends.mbt:16:12'
*** Begin Patch
*** Update File: <WORKDIR>/async\os_error\error.mbt
@@
 /// other APIs used by an application may require a newer Node.js version.
 #derive(@json.ToJson)
 pub suberror OsError {
-  OsError(Kind, raw_code~ : Int32, context~ : String)
+  OsError(KindRenamed, raw_code~ : Int32, context~ : String)
 }
 
 ///|
@@
 /// Create a `OsError` from a raw error number.
 #as_free_fn
 pub fn OsError::from_errno(errno : Int32, context~ : String) -> OsError {
-  OsError(Kind(errno), raw_code=errno, context~)
+  OsError(KindRenamed(errno), raw_code=errno, context~)
 }
 
 ///|
@@
 pub fn check_errno(context : String) -> Unit raise OsError {
   let err_code = @errno.get_errno()
   if err_code != 0 {
-    raise OsError(Kind(err_code), raw_code=err_code, context~)
+    raise OsError(KindRenamed(err_code), raw_code=err_code, context~)
   }
 }
*** Update File: <WORKDIR>/async\os_error\error_kind.mbt
@@
 /// Useful for matching specific special error codes.
 #derive(@debug.Debug, @json.ToJson, Eq)
 #non_exhaustive
-pub(all) enum Kind {
+pub(all) enum KindRenamed {
   NotFound
   AlreadyExists
   AccessDenied
@@
 
 ///|
 #cfg(any(target="native", target="wasm"))
-let errno_table : Map[Int32, Kind] = match @env_util.platform {
+let errno_table : Map[Int32, KindRenamed] = match @env_util.platform {
   Linux =>
     Map([
       (@errno.linux_ENOENT, NotFound),
@@
 
 ///|
 #cfg(any(target="native", target="wasm"))
-fn Kind::Kind(code : Int32) -> Kind {
+fn KindRenamed::KindRenamed(code : Int32) -> KindRenamed {
   match errno_table.get(code) {
     None => Unknown
     Some(kind) => kind
*** Update File: <WORKDIR>/async\os_error\extends.mbt
@@
 // limitations under the License.
 
 ///|
-pub extend Kind with Eq::{equal}
+pub extend KindRenamed with Eq::{equal}
*** Update File: <WORKDIR>/async\os_error\os_error_test.mbt
@@
 
 ///|
 test "Kind promotes equal" {
-  let eq : (@os_error.Kind, @os_error.Kind) -> Bool = @os_error.Kind::equal
+  let eq : (@os_error.KindRenamed, @os_error.KindRenamed) -> Bool = @os_error.KindRenamed::equal
   inspect(eq(NotFound, NotFound), content="true")
-  inspect(@os_error.Kind::NotFound.equal(AccessDenied), content="false")
+  inspect(@os_error.KindRenamed::NotFound.equal(AccessDenied), content="false")
 }
*** End Patch
"" (escaped)
```
