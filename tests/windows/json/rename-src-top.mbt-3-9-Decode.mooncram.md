# json rename Decode src\top.mbt:3:9

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide rename 'Decode' 'DecodeRenamed' --loc 'src\top.mbt:3:9'
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

```
