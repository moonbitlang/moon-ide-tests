# sqlparser rename parse_set_expr src\dml.mbt:2:12

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide rename 'parse_set_expr' 'parse_set_expr_renamed' --loc 'src\dml.mbt:2:12'
*** Begin Patch
*** Update File: <WORKDIR>/src\dml.mbt
@@
 ///|
-fn Parser::parse_set_expr(
+fn Parser::parse_set_expr_renamed(
   self : Parser,
   tokens : ArrayView[Token],
   min_bp : Int,
@@
     if next_bp <= min_bp {
       return (left, tokens)
     }
-    let (right, tokens) = self.parse_set_expr(tokens, min_bp)
+    let (right, tokens) = self.parse_set_expr_renamed(tokens, min_bp)
     left_tokens = (SetExpr::SetOperation(op, left, right), tokens)
   }
 }
@@
     }
     _ => (None, tokens)
   }
-  let (body, tokens) = self.parse_set_expr(tokens, 0)
+  let (body, tokens) = self.parse_set_expr_renamed(tokens, 0)
   let (order_by, tokens) = match tokens {
     [Keyword(Order), Keyword(By), .. tokens] => self.parse_order_by(tokens)
     _ => ([], tokens)
*** End Patch

```
