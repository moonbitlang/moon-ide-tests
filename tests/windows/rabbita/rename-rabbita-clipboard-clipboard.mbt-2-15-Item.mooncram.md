# rabbita rename Item rabbita\clipboard\clipboard.mbt:2:15

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide rename 'Item' 'ItemRenamed' --loc 'rabbita\clipboard\clipboard.mbt:2:15'
*** Begin Patch
*** Update File: <WORKDIR>/rabbita\clipboard\clipboard.mbt
@@
 ///|
-pub(all) enum Item {
+pub(all) enum ItemRenamed {
   Text(String)
 }
 
@@
 /// 
 /// - `copied` is triggered if the copy operation is successful.
 /// - `failed` is triggered with the error message if the copy operation fails.
-pub fn copy(item : Item, copied? : Cmd, failed? : (String) -> Cmd) -> Cmd {
+pub fn copy(item : ItemRenamed, copied? : Cmd, failed? : (String) -> Cmd) -> Cmd {
   op.request(ClipboardCopy(item, copied, failed))
 }
 
@@
 /// # Message
 /// - `pasted` is triggered with the pasted item if the paste operation is successful.
 /// - `failed` is triggered with the error message if the paste operation fails.
-pub fn paste(pasted~ : (Item) -> Cmd, failed? : (String) -> Cmd) -> Cmd {
+pub fn paste(pasted~ : (ItemRenamed) -> Cmd, failed? : (String) -> Cmd) -> Cmd {
   op.request(ClipboardPaste(pasted, failed))
 }
*** Update File: <WORKDIR>/rabbita\clipboard\op.mbt
@@
 ///|
 extenum @cmd.Extension += {
-  ClipboardCopy(Item, Cmd?, ((String) -> Cmd)?)
+  ClipboardCopy(ItemRenamed, Cmd?, ((String) -> Cmd)?)
-  ClipboardPaste((Item) -> Cmd, ((String) -> Cmd)?)
+  ClipboardPaste((ItemRenamed) -> Cmd, ((String) -> Cmd)?)
 }
 
 ///|
*** End Patch

```
