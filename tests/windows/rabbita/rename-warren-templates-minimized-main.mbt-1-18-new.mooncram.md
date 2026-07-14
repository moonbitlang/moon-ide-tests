# rabbita rename new warren\templates\minimized\main.mbt:1:18

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide rename 'new' 'new_renamed' --loc 'warren\templates\minimized\main.mbt:1:18'
*** Begin Patch
*** Update File: <WORKDIR>/warren\templates\minimized\main.mbt
@@
-using @rabbita { new, simple_cell }
+using @rabbita { new_renamed, simple_cell }
 using @html { button, div, h1 }
 
 enum Msg {
@@
       ],
     ],
   )
-  new(app).mount("app")
+  new_renamed(app).mount("app")
 }
*** End Patch

```
