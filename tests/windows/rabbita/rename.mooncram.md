# rabbita rename

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita\rabbita' moon ide rename 'Cast' 'CastRenamed' --loc 'js\cast.mbt:7:17'
Error: could not find references for symbol 'Cast' at js\cast.mbt:7:17
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita\rabbita' moon ide rename 'into' 'into_renamed' --loc 'js\cast.mbt:8:6'
Error: could not find references for symbol 'into' at js\cast.mbt:8:6
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita\rabbita' moon ide rename 'Nullable' 'NullableRenamed' --loc 'js\null.mbt:8:11'
Error: could not find references for symbol 'Nullable' at js\null.mbt:8:11
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita\rabbita' moon ide rename 'is_null' 'is_null_renamed' --loc 'js\null.mbt:8:21'
Error: could not find references for symbol 'is_null' at js\null.mbt:8:21
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita\rabbita' moon ide rename 'suspend' 'suspend_renamed' --loc 'js\async.mbt:3:28'
Error: could not find references for symbol 'suspend' at js\async.mbt:3:28
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita\rabbita' moon ide rename 'f' 'f_renamed' --loc 'js\async.mbt:4:3'
Error: could not find references for symbol 'f' at js\async.mbt:4:3
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita\rabbita' moon ide rename 'Error_' 'Error_Renamed' --loc 'js\error.mbt:3:14'
Error: could not find references for symbol 'Error_' at js\error.mbt:3:14
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita\rabbita' moon ide rename 'Error_' 'Error_Renamed' --loc 'js\error.mbt:4:3'
Error: could not find references for symbol 'Error_' at js\error.mbt:4:3
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita\rabbita' moon ide rename 'Union2' 'Union2Renamed' --loc 'js\union.mbt:9:21'
Error: could not find references for symbol 'Union2' at js\union.mbt:9:21
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita\rabbita' moon ide rename 'to0' 'to0_renamed' --loc 'js\union.mbt:9:29'
Error: could not find references for symbol 'to0' at js\union.mbt:9:29
[1]
```
