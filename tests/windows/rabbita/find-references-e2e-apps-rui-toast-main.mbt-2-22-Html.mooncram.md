# rabbita find-references Html e2e\apps\rui\toast\main.mbt:2:22

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide find-references 'Html' --loc 'e2e\apps\rui\toast\main.mbt:2:22'
Found 1 references for symbol 'Html':
<WORKDIR>/e2e\apps\rui\toast\toast.mbt:2:27-2:31:
  | ///|
2 | fn toast_fixture() -> Val[Html] {
  |                           ^^^^
  |   let toaster = @rui.sonner(max_toasts=3, position="bottom-right", scope => {
  |     div(style=["display:flex;flex-wrap:wrap;gap:0.5rem"], [

```
