# rabbita rename Val e2e\apps\rui\toast\main.mbt:2:33

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide rename 'Val' 'ValRenamed' --loc 'e2e\apps\rui\toast\main.mbt:2:33'
*** Begin Patch
*** Update File: <WORKDIR>/e2e\apps\rui\toast\main.mbt
@@
 ///|
-using @rabbita {type Html, type Val}
+using @rabbita {type Html, type ValRenamed}
 
 ///|
 using @html {div}
*** Update File: <WORKDIR>/e2e\apps\rui\toast\toast.mbt
@@
 ///|
-fn toast_fixture() -> Val[Html] {
+fn toast_fixture() -> ValRenamed[Html] {
   let toaster = @rui.sonner(max_toasts=3, position="bottom-right", scope => {
     div(style=["display:flex;flex-wrap:wrap;gap:0.5rem"], [
       @rui.button(
*** End Patch

```
