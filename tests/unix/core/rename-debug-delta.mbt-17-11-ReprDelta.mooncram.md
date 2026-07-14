# core rename ReprDelta debug/delta.mbt:17:11

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
$ run_moon_ide moon ide rename 'ReprDelta' 'ReprDeltaRenamed' --loc 'debug/delta.mbt:17:11'
*** Begin Patch
*** Update File: <WORKDIR>/debug/delta.mbt
@@
 
 ///|
 /// Tree-shaped diff between two `Repr` values.
-priv enum ReprDelta {
+priv enum ReprDeltaRenamed {
-  Same(Repr, Array[ReprDelta])
+  Same(Repr, Array[ReprDeltaRenamed])
   Different(Repr, Repr)
   Extra1(Repr)
   Extra2(Repr)
@@
   left : Repr,
   right : Repr,
   max_relative_error~ : Double,
-) -> ReprDelta {
+) -> ReprDeltaRenamed {
-  fn go(left_node : Repr, right_node : Repr) -> ReprDelta {
+  fn go(left_node : Repr, right_node : Repr) -> ReprDeltaRenamed {
     if info_approx_eq(max_relative_error, left_node, right_node) {
       let xs = left_node.children()
       let ys = right_node.children()
@@
       let xlen = xs.length()
       let ylen = ys.length()
       let min_len = if xlen < ylen { xlen } else { ylen }
-      let children : Array[ReprDelta] = []
+      let children : Array[ReprDeltaRenamed] = []
       for i in 0..<min_len {
         children.push(go(xs[i], ys[i]))
       }
@@
   x : Repr,
   y : Repr,
   max_relative_error? : Double = DEFAULT_MAX_RELATIVE_ERROR,
-) -> ReprDelta {
+) -> ReprDeltaRenamed {
   diff_info_with(x, y, max_relative_error~)
 }
 
@@
 /// - `use_ansi?`: whether to emit ANSI color escape codes (for +/- markers).
 ///   Defaults to `true` when omitted.
 fn pretty_print_delta(
-  d : ReprDelta,
+  d : ReprDeltaRenamed,
   max_depth? : Int,
   compact_threshold? : Int = default_threshold,
   use_ansi? : Bool = true,
@@
 
 ///|
 /// Prune a `ReprDelta` using max_depth (replacing with `Same(Omitted, [])`).
-fn prune_delta(max_depth : Int?, delta : ReprDelta) -> ReprDelta {
+fn prune_delta(max_depth : Int?, delta : ReprDeltaRenamed) -> ReprDeltaRenamed {
-  fn go(d : Int, node : ReprDelta) -> ReprDelta {
+  fn go(d : Int, node : ReprDeltaRenamed) -> ReprDeltaRenamed {
     if d <= 0 {
       match node {
         Same(label, children) =>
@@
 
 ///|
 /// Heuristic "size" of a delta for compact-vs-multiline decisions.
-fn delta_root_size(delta : ReprDelta) -> Int {
+fn delta_root_size(delta : ReprDeltaRenamed) -> Int {
   match delta {
     Same(label, _) => info_size(label)
     _ => 0
@@
 
 ///|
 /// Render a `ReprDelta` as `Content` with resizing decisions.
-fn render_delta(threshold : Int, use_ansi : Bool, delta : ReprDelta) -> Content {
+fn render_delta(threshold : Int, use_ansi : Bool, delta : ReprDeltaRenamed) -> Content {
   match delta {
     Same(label, children_delta) => {
       let children = children_delta.map(child => {
*** End Patch

```
