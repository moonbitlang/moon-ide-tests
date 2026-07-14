# json find-references Decode src\top.mbt:3:9

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide find-references 'Decode' --loc 'src\top.mbt:3:9'
Found 1 references for symbol 'Decode':
<WORKDIR>/src\top.mbt:3:9-3:15:
  | ///|
  | pub using @lib {
3 |   trait Decode,
  |         ^^^^^^
  |   decode,
  |   decode_start,

```
