# json rename Decode src\top.mbt:3:9

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' rename 'Decode' 'DecodeRenamed' --loc 'src\top.mbt:3:9'
*** Begin Patch
*** Update File: <WORKDIR>/src\top.mbt
@@
 ///|
 pub using @lib {
-  trait Decode,
+  trait DecodeRenamed,
   decode,
   decode_start,
   decode_continue,
*** End Patch
"" (escaped)
````
