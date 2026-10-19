# rabbita find-references Html e2e\apps\rui\fixture\fixture.mbt:2:22

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide find-references 'Html' --loc 'e2e\apps\rui\fixture\fixture.mbt:2:22'
Found 3 references for symbol 'Html':
<WORKDIR>/e2e\apps\rui\fixture\fixture.mbt:5:58-5:62:
  | using @rabbita {type Html, type Val}
  | 
  | ///|
5 | pub fn section(id : String, title : String, body : Array[Html]) -> Html {
  |                                                          ^^^^
  |   @html.section(
  |     id~,

<WORKDIR>/e2e\apps\rui\fixture\fixture.mbt:5:68-5:72:
  | using @rabbita {type Html, type Val}
  | 
  | ///|
5 | pub fn section(id : String, title : String, body : Array[Html]) -> Html {
  |                                                                    ^^^^
  |   @html.section(
  |     id~,

<WORKDIR>/e2e\apps\rui\fixture\fixture.mbt:24:45-24:49:
   | }
   | 
   | ///|
24 | pub fn mount(name : String, app : () -> Val[Html]) -> Unit {
   |                                             ^^^^
   |   @rabbita.new(() => {
   |     app().map(body => {

```
