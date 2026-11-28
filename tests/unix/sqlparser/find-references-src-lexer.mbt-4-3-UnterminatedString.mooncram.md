# sqlparser find-references UnterminatedString src/lexer.mbt:4:3

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' find-references 'UnterminatedString' --loc 'src/lexer.mbt:4:3'
Found 3 references for symbol 'UnterminatedString':
<WORKDIR>/src/lexer.mbt:513:19-513:37:
    |         result.write_char(c)
    |         continue rest
    |       }
513 |       [] => raise UnterminatedString
    |                   ^^^^^^^^^^^^^^^^^^
    |     }
    |   }

<WORKDIR>/src/lexer.mbt:556:19-556:37:
    |         result.write_char(c)
    |         continue rest
    |       }
556 |       [] => raise UnterminatedString
    |                   ^^^^^^^^^^^^^^^^^^
    |     }
    |   }

<WORKDIR>/src/lexer.mbt:587:19-587:37:
    |         result.write_char(c)
    |         continue rest
    |       }
587 |       [] => raise UnterminatedString
    |                   ^^^^^^^^^^^^^^^^^^
    |     }
    |   }
"" (escaped)
```
