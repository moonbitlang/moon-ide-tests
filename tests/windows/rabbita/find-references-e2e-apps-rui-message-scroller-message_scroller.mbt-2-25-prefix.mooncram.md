# rabbita find-references prefix e2e\apps\rui\message-scroller\message_scroller.mbt:2:25

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/rabbita' moon ide find-references 'prefix' --loc 'e2e\apps\rui\message-scroller\message_scroller.mbt:2:25'
Found 1 references for symbol 'prefix':
<WORKDIR>/e2e\apps\rui\message-scroller\message_scroller.mbt:7:15-7:21:
  |   for index in 1..<=18 {
  |     items.push(
  |       div(
7 |         id="\{prefix}-\{index}",
  |               ^^^^^^
  |         style=["height:2rem;flex:none;padding:0.25rem"],
  |         "Fixture item \{index}",
"" (escaped)
````
