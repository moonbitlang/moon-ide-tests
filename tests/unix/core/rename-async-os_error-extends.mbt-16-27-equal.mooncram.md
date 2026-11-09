# core rename equal async/os_error/extends.mbt:16:27

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide rename 'equal' 'equal_renamed' --loc 'async/os_error/extends.mbt:16:27'
*** Begin Patch
*** Update File: <WORKDIR>/async/os_error/extends.mbt
@@
 // limitations under the License.
 
 ///|
-pub extend Kind with Eq::{equal}
+pub extend Kind with Eq::{equal_renamed}
*** Update File: <WORKDIR>/async/os_error/os_error_test.mbt
@@
 
 ///|
 test "Kind promotes equal" {
-  let eq : (@os_error.Kind, @os_error.Kind) -> Bool = @os_error.Kind::equal
+  let eq : (@os_error.Kind, @os_error.Kind) -> Bool = @os_error.Kind::equal_renamed
   inspect(eq(NotFound, NotFound), content="true")
-  inspect(@os_error.Kind::NotFound.equal(AccessDenied), content="false")
+  inspect(@os_error.Kind::NotFound.equal_renamed(AccessDenied), content="false")
 }
*** End Patch
"" (escaped)
```
