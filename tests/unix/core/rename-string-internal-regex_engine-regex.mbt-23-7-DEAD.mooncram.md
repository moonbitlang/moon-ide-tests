# core rename DEAD string/internal/regex_engine/regex.mbt:23:7

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/core" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide rename 'DEAD' 'DEADRenamed' --loc 'string/internal/regex_engine/regex.mbt:23:7'
*** Begin Patch
*** Update File: <WORKDIR>/string/internal/regex_engine/dfa.mbt
@@
 /// entry that stops the scan loop. Terminal states take every other entry
 /// below `DEAD`, transitions that move registers the entries in between.
 fn terminal(state : Int32) -> Int32 {
-  DEAD - 1 - 2 * state
+  DEADRenamed - 1 - 2 * state
 }
 
 ///|
 fn terminal_state(entry : Int32) -> Int32 {
-  (DEAD - 1 - entry) / 2
+  (DEADRenamed - 1 - entry) / 2
 }
 
 ///|
@@
 /// Encode a transition that moves registers, as a negative table entry that
 /// takes the scan loop off its fast path.
 fn moving(index : Int32) -> Int32 {
-  DEAD - 2 - 2 * index
+  DEADRenamed - 2 - 2 * index
 }
 
 ///|
 fn is_moving(entry : Int32) -> Bool {
-  entry < DEAD && ((DEAD - 1 - entry) & 1) == 1
+  entry < DEADRenamed && ((DEADRenamed - 1 - entry) & 1) == 1
 }
 
 ///|
@@
 /// transition itself has been written. Returns the table entry of the state
 /// entered.
 fn Regex::follow(self : Regex, entry : Int32) -> Int32 {
-  let taken = self.moves[(DEAD - 2 - entry) / 2]
+  let taken = self.moves[(DEADRenamed - 2 - entry) / 2]
   self.move_registers(taken.pairs)
   taken.target
 }
@@
   }
   self.built_slot = slot
   guard rows > 0 else {
-    self.trans[base + column] = DEAD
+    self.trans[base + column] = DEADRenamed
     self.slots[base + column] = 0
-    DEAD
+    DEADRenamed
   }
   let count = out_nodes.length()
   let key = FixedArray::make(size, 0)
*** Update File: <WORKDIR>/string/internal/regex_engine/execute.mbt
@@
       }
     }
   }
-  guard stop != DEAD else { None }
+  guard stop != DEADRenamed else { None }
   // A terminal state has no threads, only the row of the match: its length
   // and then `(tag, register)` pairs.
   let key = self.kernels[terminal_state(stop)].key
*** Update File: <WORKDIR>/string/internal/regex_engine/regex.mbt
@@
 /// Transition table entry: no thread survives and nothing was accepted.
 /// Entries below `DEAD` denote a terminal state or a transition that moves
 /// registers, see `terminal` and `moving`.
-const DEAD : Int32 = -2
+const DEADRenamed : Int32 = -2
 
 ///|
 /// Register of a tag while a transition is being built: the tag is set by
*** End Patch

```
