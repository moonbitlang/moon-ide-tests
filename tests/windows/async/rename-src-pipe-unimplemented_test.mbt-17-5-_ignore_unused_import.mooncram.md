# async rename _ignore_unused_import src\pipe\unimplemented_test.mbt:17:5

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide rename '_ignore_unused_import' '_ignore_unused_import_renamed' --loc 'src\pipe\unimplemented_test.mbt:17:5'
Error: could not find references for symbol '_ignore_unused_import' at src\pipe\unimplemented_test.mbt:17:5
[1]
```
