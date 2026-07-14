# sqlparser find-references parse_set_expr src/dml.mbt:2:12

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
$ run_moon_ide moon ide find-references 'parse_set_expr' --loc 'src/dml.mbt:2:12'
Found 3 references for symbol 'parse_set_expr':
<WORKDIR>/src/dml.mbt:2:12-2:26:
  | ///|
2 | fn Parser::parse_set_expr(
  |            ^^^^^^^^^^^^^^
  |   self : Parser,
  |   tokens : ArrayView[Token],

<WORKDIR>/src/dml.mbt:42:32-42:46:
   |     if next_bp <= min_bp {
   |       return (left, tokens)
   |     }
42 |     let (right, tokens) = self.parse_set_expr(tokens, min_bp)
   |                                ^^^^^^^^^^^^^^
   |     left_tokens = (SetExpr::SetOperation(op, left, right), tokens)
   |   }

<WORKDIR>/src/dml.mbt:93:29-93:43:
   |     }
   |     _ => (None, tokens)
   |   }
93 |   let (body, tokens) = self.parse_set_expr(tokens, 0)
   |                             ^^^^^^^^^^^^^^
   |   let (order_by, tokens) = match tokens {
   |     [Keyword(Order), Keyword(By), .. tokens] => self.parse_order_by(tokens)

```
