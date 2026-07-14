# rabbita find-references new warren\templates\minimized\main.mbt:1:18

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide find-references 'new' --loc 'warren\templates\minimized\main.mbt:1:18'
Found 2 references for symbol 'new':
<WORKDIR>/warren\templates\minimized\main.mbt:1:18-1:21:
1 | using @rabbita { new, simple_cell }
  |                  ^^^
  | using @html { button, div, h1 }
  | 

<WORKDIR>/warren\templates\minimized\main.mbt:24:3-24:6:
   |       ],
   |     ],
   |   )
24 |   new(app).mount("app")
   |   ^^^
   | }

```
