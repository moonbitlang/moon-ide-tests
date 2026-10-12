# core find-references DEAD string\internal\regex_engine\regex.mbt:23:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide find-references 'DEAD' --loc 'string\internal\regex_engine\regex.mbt:23:7'
Found 9 references for symbol 'DEAD':
<WORKDIR>/string\internal\regex_engine\dfa.mbt:25:3-25:7:
   | /// entry that stops the scan loop. Terminal states take every other entry
   | /// below `DEAD`, transitions that move registers the entries in between.
   | fn terminal(state : Int) -> Int {
25 |   DEAD - 1 - 2 * state
   |   ^^^^
   | }
   | 

<WORKDIR>/string\internal\regex_engine\dfa.mbt:30:4-30:8:
   | 
   | ///|
   | fn terminal_state(entry : Int) -> Int {
30 |   (DEAD - 1 - entry) / 2
   |    ^^^^
   | }
   | 

<WORKDIR>/string\internal\regex_engine\dfa.mbt:37:3-37:7:
   | /// Encode a transition that moves registers, as a negative table entry that
   | /// takes the scan loop off its fast path.
   | fn moving(index : Int) -> Int {
37 |   DEAD - 2 - 2 * index
   |   ^^^^
   | }
   | 

<WORKDIR>/string\internal\regex_engine\dfa.mbt:42:11-42:15:
   | 
   | ///|
   | fn is_moving(entry : Int) -> Bool {
42 |   entry < DEAD && ((DEAD - 1 - entry) & 1) == 1
   |           ^^^^
   | }
   | 

<WORKDIR>/string\internal\regex_engine\dfa.mbt:42:21-42:25:
   | 
   | ///|
   | fn is_moving(entry : Int) -> Bool {
42 |   entry < DEAD && ((DEAD - 1 - entry) & 1) == 1
   |                     ^^^^
   | }
   | 

<WORKDIR>/string\internal\regex_engine\dfa.mbt:67:27-67:31:
   | /// transition itself has been written. Returns the table entry of the state
   | /// entered.
   | fn Regex::follow(self : Regex, entry : Int) -> Int {
67 |   let taken = self.moves[(DEAD - 2 - entry) / 2]
   |                           ^^^^
   |   self.move_registers(taken.pairs)
   |   taken.target

<WORKDIR>/string\internal\regex_engine\dfa.mbt:439:33-439:37:
    |   }
    |   self.built_slot = slot
    |   guard rows > 0 else {
439 |     self.trans[base + column] = DEAD
    |                                 ^^^^
    |     self.slots[base + column] = 0
    |     DEAD

<WORKDIR>/string\internal\regex_engine\dfa.mbt:441:5-441:9:
    |   guard rows > 0 else {
    |     self.trans[base + column] = DEAD
    |     self.slots[base + column] = 0
441 |     DEAD
    |     ^^^^
    |   }
    |   let count = out_nodes.length()

<WORKDIR>/string\internal\regex_engine\execute.mbt:105:17-105:21:
    |       }
    |     }
    |   }
105 |   guard stop != DEAD else { None }
    |                 ^^^^
    |   // A terminal state has no threads, only the row of the match: its length
    |   // and then `(tag, register)` pairs.

```
