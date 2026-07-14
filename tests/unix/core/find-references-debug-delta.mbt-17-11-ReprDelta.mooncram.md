# core find-references ReprDelta debug/delta.mbt:17:11

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
$ run_moon_ide moon ide find-references 'ReprDelta' --loc 'debug/delta.mbt:17:11'
Found 13 references for symbol 'ReprDelta':
<WORKDIR>/debug/delta.mbt:17:11-17:20:
   | 
   | ///|
   | /// Tree-shaped diff between two `Repr` values.
17 | priv enum ReprDelta {
   |           ^^^^^^^^^
   |   Same(Repr, Array[ReprDelta])
   |   Different(Repr, Repr)

<WORKDIR>/debug/delta.mbt:18:20-18:29:
   | ///|
   | /// Tree-shaped diff between two `Repr` values.
   | priv enum ReprDelta {
18 |   Same(Repr, Array[ReprDelta])
   |                    ^^^^^^^^^
   |   Different(Repr, Repr)
   |   Extra1(Repr)

<WORKDIR>/debug/delta.mbt:102:6-102:15:
    |   left : Repr,
    |   right : Repr,
    |   max_relative_error~ : Double,
102 | ) -> ReprDelta {
    |      ^^^^^^^^^
    |   fn go(left_node : Repr, right_node : Repr) -> ReprDelta {
    |     if info_approx_eq(max_relative_error, left_node, right_node) {

<WORKDIR>/debug/delta.mbt:103:49-103:58:
    |   right : Repr,
    |   max_relative_error~ : Double,
    | ) -> ReprDelta {
103 |   fn go(left_node : Repr, right_node : Repr) -> ReprDelta {
    |                                                 ^^^^^^^^^
    |     if info_approx_eq(max_relative_error, left_node, right_node) {
    |       let xs = left_node.children()

<WORKDIR>/debug/delta.mbt:110:28-110:37:
    |       let xlen = xs.length()
    |       let ylen = ys.length()
    |       let min_len = if xlen < ylen { xlen } else { ylen }
110 |       let children : Array[ReprDelta] = []
    |                            ^^^^^^^^^
    |       for i in 0..<min_len {
    |         children.push(go(xs[i], ys[i]))

<WORKDIR>/debug/delta.mbt:146:6-146:15:
    |   x : Repr,
    |   y : Repr,
    |   max_relative_error? : Double = DEFAULT_MAX_RELATIVE_ERROR,
146 | ) -> ReprDelta {
    |      ^^^^^^^^^
    |   diff_info_with(x, y, max_relative_error~)
    | }

<WORKDIR>/debug/delta.mbt:161:7-161:16:
    | /// - `use_ansi?`: whether to emit ANSI color escape codes (for +/- markers).
    | ///   Defaults to `true` when omitted.
    | fn pretty_print_delta(
161 |   d : ReprDelta,
    |       ^^^^^^^^^
    |   max_depth? : Int,
    |   compact_threshold? : Int = default_threshold,

<WORKDIR>/debug/delta.mbt:176:42-176:51:
    | 
    | ///|
    | /// Prune a `ReprDelta` using max_depth (replacing with `Same(Omitted, [])`).
176 | fn prune_delta(max_depth : Int?, delta : ReprDelta) -> ReprDelta {
    |                                          ^^^^^^^^^
    |   fn go(d : Int, node : ReprDelta) -> ReprDelta {
    |     if d <= 0 {

<WORKDIR>/debug/delta.mbt:176:56-176:65:
    | 
    | ///|
    | /// Prune a `ReprDelta` using max_depth (replacing with `Same(Omitted, [])`).
176 | fn prune_delta(max_depth : Int?, delta : ReprDelta) -> ReprDelta {
    |                                                        ^^^^^^^^^
    |   fn go(d : Int, node : ReprDelta) -> ReprDelta {
    |     if d <= 0 {

<WORKDIR>/debug/delta.mbt:177:25-177:34:
    | ///|
    | /// Prune a `ReprDelta` using max_depth (replacing with `Same(Omitted, [])`).
    | fn prune_delta(max_depth : Int?, delta : ReprDelta) -> ReprDelta {
177 |   fn go(d : Int, node : ReprDelta) -> ReprDelta {
    |                         ^^^^^^^^^
    |     if d <= 0 {
    |       match node {

<WORKDIR>/debug/delta.mbt:177:39-177:48:
    | ///|
    | /// Prune a `ReprDelta` using max_depth (replacing with `Same(Omitted, [])`).
    | fn prune_delta(max_depth : Int?, delta : ReprDelta) -> ReprDelta {
177 |   fn go(d : Int, node : ReprDelta) -> ReprDelta {
    |                                       ^^^^^^^^^
    |     if d <= 0 {
    |       match node {

<WORKDIR>/debug/delta.mbt:215:28-215:37:
    | 
    | ///|
    | /// Heuristic "size" of a delta for compact-vs-multiline decisions.
215 | fn delta_root_size(delta : ReprDelta) -> Int {
    |                            ^^^^^^^^^
    |   match delta {
    |     Same(label, _) => info_size(label)

<WORKDIR>/debug/delta.mbt:256:59-256:68:
    | 
    | ///|
    | /// Render a `ReprDelta` as `Content` with resizing decisions.
256 | fn render_delta(threshold : Int, use_ansi : Bool, delta : ReprDelta) -> Content {
    |                                                           ^^^^^^^^^
    |   match delta {
    |     Same(label, children_delta) => {

```
