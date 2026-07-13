# sqlparser find-references UnterminatedString src/lexer.mbt:3:3

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/sqlparser" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide find-references 'UnterminatedString' --loc 'src/lexer.mbt:3:3'
Found 4 references for symbol 'UnterminatedString':
<WORKDIR>/src/lexer.mbt:3:3-3:21:
  | ///|
  | suberror LexerError {
3 |   UnterminatedString
  |   ^^^^^^^^^^^^^^^^^^
  |   UnknownCharacter(Char)
  | } derive(Debug)

<WORKDIR>/src/lexer.mbt:513:31-513:49:
    |         result.write_char(c)
    |         continue rest
    |       }
513 |       [] => raise LexerError::UnterminatedString
    |                               ^^^^^^^^^^^^^^^^^^
    |     }
    |   }

<WORKDIR>/src/lexer.mbt:556:31-556:49:
    |         result.write_char(c)
    |         continue rest
    |       }
556 |       [] => raise LexerError::UnterminatedString
    |                               ^^^^^^^^^^^^^^^^^^
    |     }
    |   }

<WORKDIR>/src/lexer.mbt:587:31-587:49:
    |         result.write_char(c)
    |         continue rest
    |       }
587 |       [] => raise LexerError::UnterminatedString
    |                               ^^^^^^^^^^^^^^^^^^
    |     }
    |   }

```
