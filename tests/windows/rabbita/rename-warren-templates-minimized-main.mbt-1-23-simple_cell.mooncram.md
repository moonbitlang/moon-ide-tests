# rabbita rename simple_cell warren\templates\minimized\main.mbt:1:23

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide rename 'simple_cell' 'simple_cell_renamed' --loc 'warren\templates\minimized\main.mbt:1:23'
*** Begin Patch
*** Update File: <WORKDIR>/warren\templates\minimized\main.mbt
@@
-using @rabbita { new, simple_cell }
+using @rabbita { new, simple_cell_renamed }
 using @html { button, div, h1 }
 
 enum Msg {
@@
 }
 
 fn main {
-  let app = simple_cell(
+  let app = simple_cell_renamed(
     model=0,
     update=(msg, model) => match msg {
       Inc => model + 1
*** End Patch

```
