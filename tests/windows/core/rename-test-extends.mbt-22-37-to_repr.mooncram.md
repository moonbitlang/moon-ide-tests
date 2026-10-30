# core rename to_repr test\extends.mbt:22:37

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide rename 'to_repr' 'to_repr_renamed' --loc 'test\extends.mbt:22:37'
*** Begin Patch
*** Update File: <WORKDIR>/test\extends.mbt
@@
 ///|
 #deprecated("Use `Debug::to_repr` instead", skip_current_package=true)
 #doc(hidden)
-pub extend Test with @debug.Debug::{to_repr}
+pub extend Test with @debug.Debug::{to_repr_renamed}
*** End Patch
"" (escaped)
````
