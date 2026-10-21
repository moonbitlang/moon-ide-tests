# rabbita rename Val e2e\apps\rui\fixture\fixture.mbt:2:33

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide rename 'Val' 'ValRenamed' --loc 'e2e\apps\rui\fixture\fixture.mbt:2:33'
*** Begin Patch
*** Update File: <WORKDIR>/e2e\apps\rui\fixture\fixture.mbt
@@
 ///|
-using @rabbita {type Html, type Val}
+using @rabbita {type Html, type ValRenamed}
 
 ///|
 pub fn section(id : String, title : String, body : Array[Html]) -> Html {
@@
 }
 
 ///|
-pub fn mount(name : String, app : () -> Val[Html]) -> Unit {
+pub fn mount(name : String, app : () -> ValRenamed[Html]) -> Unit {
   @rabbita.new(() => {
     app().map(body => {
       @rui.theme(
*** End Patch

```
