# async rename fd src\internal\event_loop\stdio.mbt:19:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide rename 'fd' 'fd_renamed' --loc 'src\internal\event_loop\stdio.mbt:19:3'
*** Begin Patch
*** Update File: <WORKDIR>/src\internal\event_loop\stdio.mbt
@@
 #cfg(target="native")
 #borrow(buf)
 extern "C" fn fstatx_sync(
-  fd : @fd_util.Fd,
+  fd_renamed : @fd_util.Fd,
   request : UInt,
   buf : FixedArray[Byte],
   buf_len : Int,
*** End Patch

```
