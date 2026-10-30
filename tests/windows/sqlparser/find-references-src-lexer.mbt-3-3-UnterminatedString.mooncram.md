# sqlparser find-references UnterminatedString src\lexer.mbt:3:3

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/sqlparser' moon ide find-references 'UnterminatedString' --loc 'src\lexer.mbt:3:3'
Found 3 references for symbol 'UnterminatedString':
<WORKDIR>/src\lexer.mbt:511:19-511:37:
    |         result.write_char(c)
    |         continue rest
    |       }
511 |       [] => raise UnterminatedString
    |                   ^^^^^^^^^^^^^^^^^^
    |     }
    |   }

<WORKDIR>/src\lexer.mbt:554:19-554:37:
    |         result.write_char(c)
    |         continue rest
    |       }
554 |       [] => raise UnterminatedString
    |                   ^^^^^^^^^^^^^^^^^^
    |     }
    |   }

<WORKDIR>/src\lexer.mbt:585:19-585:37:
    |         result.write_char(c)
    |         continue rest
    |       }
585 |       [] => raise UnterminatedString
    |                   ^^^^^^^^^^^^^^^^^^
    |     }
    |   }
"" (escaped)
````
