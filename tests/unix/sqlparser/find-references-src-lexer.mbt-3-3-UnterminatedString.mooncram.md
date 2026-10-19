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
Found 3 references for symbol 'UnterminatedString':
<WORKDIR>/src/lexer.mbt:511:19-511:37:
    |         result.write_char(c)
    |         continue rest
    |       }
511 |       [] => raise UnterminatedString
    |                   ^^^^^^^^^^^^^^^^^^
    |     }
    |   }

<WORKDIR>/src/lexer.mbt:554:19-554:37:
    |         result.write_char(c)
    |         continue rest
    |       }
554 |       [] => raise UnterminatedString
    |                   ^^^^^^^^^^^^^^^^^^
    |     }
    |   }

<WORKDIR>/src/lexer.mbt:585:19-585:37:
    |         result.write_char(c)
    |         continue rest
    |       }
585 |       [] => raise UnterminatedString
    |                   ^^^^^^^^^^^^^^^^^^
    |     }
    |   }

```
