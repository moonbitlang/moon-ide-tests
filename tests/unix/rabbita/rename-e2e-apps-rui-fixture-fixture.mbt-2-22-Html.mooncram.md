# rabbita rename Html e2e/apps/rui/fixture/fixture.mbt:2:22

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/rabbita' moon ide rename 'Html' 'HtmlRenamed' --loc 'e2e/apps/rui/fixture/fixture.mbt:2:22'
*** Begin Patch
*** Update File: <WORKDIR>/e2e/apps/rui/fixture/fixture.mbt
@@
 ///|
-using @rabbita {type Html, type Val}
+using @rabbita {type HtmlRenamed, type Val}
 
 ///|
-pub fn section(id : String, title : String, body : Array[Html]) -> Html {
+pub fn section(id : String, title : String, body : Array[HtmlRenamed]) -> HtmlRenamed {
   @html.section(
     id~,
     style=[
@@
 }
 
 ///|
-pub fn mount(name : String, app : () -> Val[Html]) -> Unit {
+pub fn mount(name : String, app : () -> Val[HtmlRenamed]) -> Unit {
   @rabbita.new(() => {
     app().map(body => {
       @rui.theme(
*** End Patch
"" (escaped)
````
