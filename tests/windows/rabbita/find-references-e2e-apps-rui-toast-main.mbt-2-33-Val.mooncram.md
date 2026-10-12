# rabbita find-references Val e2e\apps\rui\toast\main.mbt:2:33

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide find-references 'Val' --loc 'e2e\apps\rui\toast\main.mbt:2:33'
Found 1 references for symbol 'Val':
<WORKDIR>/e2e\apps\rui\toast\toast.mbt:2:23-2:26:
  | ///|
2 | fn toast_fixture() -> Val[Html] {
  |                       ^^^
  |   let toaster = @rui.sonner(max_toasts=3, position="bottom-right", scope => {
  |     div(style=["display:flex;flex-wrap:wrap;gap:0.5rem"], [

```
