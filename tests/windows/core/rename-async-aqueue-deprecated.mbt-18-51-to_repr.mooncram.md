# core rename to_repr async\aqueue\deprecated.mbt:18:51

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'to_repr' 'to_repr_renamed' --loc 'async\aqueue\deprecated.mbt:18:51'
*** Begin Patch
*** Update File: <WORKDIR>/async\aqueue\deprecated.mbt
@@
 ///|
 #deprecated
 #doc(hidden)
-pub extend QueueAlreadyClosed with @debug.Debug::{to_repr}
+pub extend QueueAlreadyClosed with @debug.Debug::{to_repr_renamed}
 
 ///|
 #deprecated
*** End Patch

```
