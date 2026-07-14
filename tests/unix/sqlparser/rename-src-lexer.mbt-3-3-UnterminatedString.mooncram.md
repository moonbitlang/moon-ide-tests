# sqlparser rename UnterminatedString src/lexer.mbt:3:3

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
$ run_moon_ide moon ide rename 'UnterminatedString' 'UnterminatedStringRenamed' --loc 'src/lexer.mbt:3:3'
*** Begin Patch
*** Update File: <WORKDIR>/src/lexer.mbt
@@
 ///|
 suberror LexerError {
-  UnterminatedString
+  UnterminatedStringRenamed
   UnknownCharacter(Char)
 } derive(Debug)
 
@@
         result.write_char(c)
         continue rest
       }
-      [] => raise LexerError::UnterminatedString
+      [] => raise LexerError::UnterminatedStringRenamed
     }
   }
   (StringLiteral(result.to_string()), rest)
@@
         result.write_char(c)
         continue rest
       }
-      [] => raise LexerError::UnterminatedString
+      [] => raise LexerError::UnterminatedStringRenamed
     }
   }
   (StringLiteral(result.to_string()), rest)
@@
         result.write_char(c)
         continue rest
       }
-      [] => raise LexerError::UnterminatedString
+      [] => raise LexerError::UnterminatedStringRenamed
     }
   }
   (Identifier(result.to_string()), rest)
*** End Patch

```
