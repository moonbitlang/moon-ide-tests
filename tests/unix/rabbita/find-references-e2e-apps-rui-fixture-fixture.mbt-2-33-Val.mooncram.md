# rabbita find-references Val e2e/apps/rui/fixture/fixture.mbt:2:33

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/rabbita' moon ide find-references 'Val' --loc 'e2e/apps/rui/fixture/fixture.mbt:2:33'
Found 1 references for symbol 'Val':
<WORKDIR>/e2e/apps/rui/fixture/fixture.mbt:24:41-24:44:
   | }
   | 
   | ///|
24 | pub fn mount(name : String, app : () -> Val[Html]) -> Unit {
   |                                         ^^^
   |   @rabbita.new(() => {
   |     app().map(body => {
"" (escaped)
````
