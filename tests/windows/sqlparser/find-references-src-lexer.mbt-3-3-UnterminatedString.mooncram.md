# sqlparser find-references UnterminatedString src\lexer.mbt:3:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide find-references 'UnterminatedString' --loc 'src\lexer.mbt:3:3'
Found 4 references for symbol 'UnterminatedString':
<WORKDIR>/src\lexer.mbt:3:3-3:21:
  | ///|
  | suberror LexerError {
3 |   UnterminatedString
  |   ^^^^^^^^^^^^^^^^^^
  |   UnknownCharacter(Char)
  | } derive(Debug)

<WORKDIR>/src\lexer.mbt:513:31-513:49:
    |         result.write_char(c)
    |         continue rest
    |       }
513 |       [] => raise LexerError::UnterminatedString
    |                               ^^^^^^^^^^^^^^^^^^
    |     }
    |   }

<WORKDIR>/src\lexer.mbt:556:31-556:49:
    |         result.write_char(c)
    |         continue rest
    |       }
556 |       [] => raise LexerError::UnterminatedString
    |                               ^^^^^^^^^^^^^^^^^^
    |     }
    |   }

<WORKDIR>/src\lexer.mbt:587:31-587:49:
    |         result.write_char(c)
    |         continue rest
    |       }
587 |       [] => raise LexerError::UnterminatedString
    |                               ^^^^^^^^^^^^^^^^^^
    |     }
    |   }

```
