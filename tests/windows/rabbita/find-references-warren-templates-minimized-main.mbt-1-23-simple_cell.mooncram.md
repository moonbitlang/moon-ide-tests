# rabbita find-references simple_cell warren\templates\minimized\main.mbt:1:23

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide find-references 'simple_cell' --loc 'warren\templates\minimized\main.mbt:1:23'
Found 2 references for symbol 'simple_cell':
<WORKDIR>/warren\templates\minimized\main.mbt:1:23-1:34:
1 | using @rabbita { new, simple_cell }
  |                       ^^^^^^^^^^^
  | using @html { button, div, h1 }
  | 

<WORKDIR>/warren\templates\minimized\main.mbt:10:13-10:24:
   | }
   | 
   | fn main {
10 |   let app = simple_cell(
   |             ^^^^^^^^^^^
   |     model=0,
   |     update=(msg, model) => match msg {

```
