# sqlparser rename UnterminatedString src\lexer.mbt:3:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide rename 'UnterminatedString' 'UnterminatedStringRenamed' --loc 'src\lexer.mbt:3:3'
*** Begin Patch
*** Update File: <WORKDIR>/src\lexer.mbt
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
