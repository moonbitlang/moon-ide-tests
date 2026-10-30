# rabbita rename Html e2e\apps\rui\toast\main.mbt:2:22

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/rabbita' moon ide rename 'Html' 'HtmlRenamed' --loc 'e2e\apps\rui\toast\main.mbt:2:22'
*** Begin Patch
*** Update File: <WORKDIR>/e2e\apps\rui\toast\main.mbt
@@
 ///|
-using @rabbita {type Html, type Val}
+using @rabbita {type HtmlRenamed, type Val}
 
 ///|
 using @html {div}
*** Update File: <WORKDIR>/e2e\apps\rui\toast\toast.mbt
@@
 ///|
-fn toast_fixture() -> Val[Html] {
+fn toast_fixture() -> Val[HtmlRenamed] {
   let toaster = @rui.sonner(max_toasts=3, position="bottom-right", scope => {
     div(style=["display:flex;flex-wrap:wrap;gap:0.5rem"], [
       @rui.button(
*** End Patch
"" (escaped)
````
