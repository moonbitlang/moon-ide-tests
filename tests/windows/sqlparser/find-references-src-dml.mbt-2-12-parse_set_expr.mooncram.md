# sqlparser find-references parse_set_expr src\dml.mbt:2:12

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\sqlparser' moon ide find-references 'parse_set_expr' --loc 'src\dml.mbt:2:12'
Found 2 references for symbol 'parse_set_expr':
<WORKDIR>/src\dml.mbt:42:32-42:46:
   |     if next_bp <= min_bp {
   |       return (left, tokens)
   |     }
42 |     let (right, tokens) = self.parse_set_expr(tokens, min_bp)
   |                                ^^^^^^^^^^^^^^
   |     left_tokens = (SetExpr::SetOperation(op, left, right), tokens)
   |   }

<WORKDIR>/src\dml.mbt:96:29-96:43:
   |     }
   |     _ => (None, tokens)
   |   }
96 |   let (body, tokens) = self.parse_set_expr(tokens, 0)
   |                             ^^^^^^^^^^^^^^
   |   let (order_by, tokens) = match tokens {
   |     [Keyword(Order), Keyword(By), .. tokens] => self.parse_order_by(tokens)

```
