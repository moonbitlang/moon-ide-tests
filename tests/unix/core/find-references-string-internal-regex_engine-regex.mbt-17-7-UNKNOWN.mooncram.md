# core find-references UNKNOWN string/internal/regex_engine/regex.mbt:17:7

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
$ run_moon_ide moon ide find-references 'UNKNOWN' --loc 'string/internal/regex_engine/regex.mbt:17:7'
Found 7 references for symbol 'UNKNOWN':
<WORKDIR>/string/internal/regex_engine/dfa.mbt:79:19-79:26:
   |   let used = self.kernels.length() * self.width()
   |   self.state_ids.clear()
   |   self.kernels.clear()
79 |   self.trans.fill(UNKNOWN, end=used)
   |                   ^^^^^^^
   |   self.slots.fill(0, end=used)
   |   self.start_bases.fill(UNKNOWN)

<WORKDIR>/string/internal/regex_engine/dfa.mbt:81:25-81:32:
   |   self.kernels.clear()
   |   self.trans.fill(UNKNOWN, end=used)
   |   self.slots.fill(0, end=used)
81 |   self.start_bases.fill(UNKNOWN)
   |                         ^^^^^^^
   |   self.cache_words = 0
   |   self.shapes = None

<WORKDIR>/string/internal/regex_engine/dfa.mbt:132:12-132:19:
    |     self.trans = FixedArray::make_and_blit(
    |       self.trans,
    |       allocate_len=capacity,
132 |       init=UNKNOWN,
    |            ^^^^^^^
    |       len=self.trans.length(),
    |     )

<WORKDIR>/string/internal/regex_engine/dfa.mbt:310:14-310:21:
    | /// Row base of the start state under look-behind context `ctx`.
    | fn Regex::start_base(self : Regex, ctx : Int32) -> Int32 {
    |   let base = self.start_bases[ctx]
310 |   if base != UNKNOWN {
    |              ^^^^^^^
    |     return base
    |   }

<WORKDIR>/string/internal/regex_engine/execute.mbt:62:18-62:25:
   |     let mut next = trans.unsafe_get(index)
   |     if next < 0 {
   |       // Off the fast path: an unbuilt transition, or the end of the scan.
62 |       if next == UNKNOWN {
   |                  ^^^^^^^
   |         next = self.build(base, index - base, pos)
   |         trans = self.trans

<WORKDIR>/string/internal/regex_engine/execute.mbt:94:16-94:23:
   |   if stop == 0 {
   |     let index = base + self.nsym
   |     stop = trans.unsafe_get(index)
94 |     if stop == UNKNOWN {
   |                ^^^^^^^
   |       stop = self.build(base, self.nsym, pos)
   |       regs = self.regs

<WORKDIR>/string/internal/regex_engine/regex.mbt:254:61-254:68:
    |     kernels: [],
    |     trans: [],
    |     slots: [],
254 |     start_bases: FixedArray::make(1 << after_cats.length(), UNKNOWN),
    |                                                             ^^^^^^^
    |     built_slot: 0,
    |     cache_words: 0,

```
