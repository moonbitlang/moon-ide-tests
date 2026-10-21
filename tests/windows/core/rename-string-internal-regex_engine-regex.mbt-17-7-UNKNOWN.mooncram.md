# core rename UNKNOWN string\internal\regex_engine\regex.mbt:17:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'UNKNOWN' 'UNKNOWNRenamed' --loc 'string\internal\regex_engine\regex.mbt:17:7'
*** Begin Patch
*** Update File: <WORKDIR>/string\internal\regex_engine\dfa.mbt
@@
   let used = self.kernels.length() * self.width()
   self.state_ids.clear()
   self.kernels.clear()
-  self.trans.fill(UNKNOWN, end=used)
+  self.trans.fill(UNKNOWNRenamed, end=used)
   self.slots.fill(0, end=used)
-  self.start_bases.fill(UNKNOWN)
+  self.start_bases.fill(UNKNOWNRenamed)
   self.cache_words = 0
   self.shapes = None
   self.moves.clear()
@@
     self.trans = FixedArray::make_and_blit(
       self.trans,
       allocate_len=capacity,
-      init=UNKNOWN,
+      init=UNKNOWNRenamed,
       len=self.trans.length(),
     )
     self.slots = FixedArray::make_and_blit(
@@
 /// Row base of the start state under look-behind context `ctx`.
 fn Regex::start_base(self : Regex, ctx : Int32) -> Int32 {
   let base = self.start_bases[ctx]
-  if base != UNKNOWN {
+  if base != UNKNOWNRenamed {
     return base
   }
   // One thread at the entry node that has set no tag yet.
*** Update File: <WORKDIR>/string\internal\regex_engine\execute.mbt
@@
     let mut next = trans.unsafe_get(index)
     if next < 0 {
       // Off the fast path: an unbuilt transition, or the end of the scan.
-      if next == UNKNOWN {
+      if next == UNKNOWNRenamed {
         next = self.build(base, index - base, pos)
         trans = self.trans
         slots = self.slots
@@
   if stop == 0 {
     let index = base + self.nsym
     stop = trans.unsafe_get(index)
-    if stop == UNKNOWN {
+    if stop == UNKNOWNRenamed {
       stop = self.build(base, self.nsym, pos)
       regs = self.regs
       regs.unsafe_set(self.built_slot, pos)
*** Update File: <WORKDIR>/string\internal\regex_engine\regex.mbt
@@
 
 ///|
 /// Transition table entry: the transition has not been built yet.
-const UNKNOWN : Int32 = -1
+const UNKNOWNRenamed : Int32 = -1
 
 ///|
 /// Transition table entry: no thread survives and nothing was accepted.
@@
     kernels: [],
     trans: [],
     slots: [],
-    start_bases: FixedArray::make(1 << after_cats.length(), UNKNOWN),
+    start_bases: FixedArray::make(1 << after_cats.length(), UNKNOWNRenamed),
     built_slot: 0,
     cache_words: 0,
     max_cache_words,
*** End Patch

```
