# core find-references Same debug/delta.mbt:18:3

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
$ run_moon_ide moon ide find-references 'Same' --loc 'debug/delta.mbt:18:3'
Found 20 references for symbol 'Same':
<WORKDIR>/debug/delta.mbt:18:3-18:7:
   | ///|
   | /// Tree-shaped diff between two `Repr` values.
   | priv enum ReprDelta {
18 |   Same(Repr, Array[ReprDelta])
   |   ^^^^
   |   Different(Repr, Repr)
   |   Extra1(Repr)

<WORKDIR>/debug/delta.mbt:122:34-122:38:
    |       }
    |       if info_is_unimportant(left_node) &&
    |         !children.is_empty() &&
122 |         children.all(d => !(d is Same(_, _))) {
    |                                  ^^^^
    |         Different(left_node, right_node)
    |       } else {

<WORKDIR>/debug/delta.mbt:125:9-125:13:
    |         children.all(d => !(d is Same(_, _))) {
    |         Different(left_node, right_node)
    |       } else {
125 |         Same(left_node.shallow(), children)
    |         ^^^^
    |       }
    |     } else {

<WORKDIR>/debug/delta.mbt:180:9-180:13:
    |   fn go(d : Int, node : ReprDelta) -> ReprDelta {
    |     if d <= 0 {
    |       match node {
180 |         Same(label, children) =>
    |         ^^^^
    |           if children.is_empty() {
    |             node

<WORKDIR>/debug/delta.mbt:184:13-184:17:
    |           if children.is_empty() {
    |             node
    |           } else if !label.info_adds_depth() {
184 |             Same(label, children.map(child => go(d, child)))
    |             ^^^^
    |           } else {
    |             Same(Repr::omitted(), [])

<WORKDIR>/debug/delta.mbt:186:13-186:17:
    |           } else if !label.info_adds_depth() {
    |             Same(label, children.map(child => go(d, child)))
    |           } else {
186 |             Same(Repr::omitted(), [])
    |             ^^^^
    |           }
    |         Different(_, _) | Extra1(_) | Extra2(_) => Same(Repr::omitted(), [])

<WORKDIR>/debug/delta.mbt:188:52-188:56:
    |           } else {
    |             Same(Repr::omitted(), [])
    |           }
188 |         Different(_, _) | Extra1(_) | Extra2(_) => Same(Repr::omitted(), [])
    |                                                    ^^^^
    |       }
    |     } else {

<WORKDIR>/debug/delta.mbt:192:9-192:13:
    |       }
    |     } else {
    |       match node {
192 |         Same(label, children) => {
    |         ^^^^
    |           let next_depth = if label.info_adds_depth() { d - 1 } else { d }
    |           Same(label, children.map(child => go(next_depth, child)))

<WORKDIR>/debug/delta.mbt:194:11-194:15:
    |       match node {
    |         Same(label, children) => {
    |           let next_depth = if label.info_adds_depth() { d - 1 } else { d }
194 |           Same(label, children.map(child => go(next_depth, child)))
    |           ^^^^
    |         }
    |         Different(left, right) =>

<WORKDIR>/debug/delta.mbt:217:5-217:9:
    | /// Heuristic "size" of a delta for compact-vs-multiline decisions.
    | fn delta_root_size(delta : ReprDelta) -> Int {
    |   match delta {
217 |     Same(label, _) => info_size(label)
    |     ^^^^
    |     _ => 0
    |   }

<WORKDIR>/debug/delta.mbt:258:5-258:9:
    | /// Render a `ReprDelta` as `Content` with resizing decisions.
    | fn render_delta(threshold : Int, use_ansi : Bool, delta : ReprDelta) -> Content {
    |   match delta {
258 |     Same(label, children_delta) => {
    |     ^^^^
    |       let children = children_delta.map(child => {
    |         render_delta(threshold, use_ansi, child)

<WORKDIR>/debug/delta_wbtest.mbt:32:18-32:22:
   | test "diff: empty containers stay Same" {
   |   let empty : Array[Int] = []
   |   let delta = diff_repr(Debug::to_repr(empty), Debug::to_repr(empty))
32 |   guard delta is Same(Array([]), []) else {
   |                  ^^^^
   |     fail("expected Same(Array([]), [])")
   |   }

<WORKDIR>/debug/delta_wbtest.mbt:37:18-37:22:
   |   }
   |   let empty = Empty::{  }
   |   let delta = diff_repr(Debug::to_repr(empty), Debug::to_repr(empty))
37 |   guard delta is Same(Record([]), []) else {
   |                  ^^^^
   |     fail("expected Same(Array([]), [])")
   |   }

<WORKDIR>/debug/delta_wbtest.mbt:47:18-47:22:
   |   let x = Repr::array([Repr::integer("1"), Repr::integer("2")])
   |   let y = Repr::array([Repr::integer("1"), Repr::integer("3")])
   |   let delta = diff_repr(x, y)
47 |   guard delta is Same(Array([]), [Same(Integer("1"), []), _]) else {
   |                  ^^^^
   |     fail("expected Same(Array, children...)")
   |   }

<WORKDIR>/debug/delta_wbtest.mbt:47:35-47:39:
   |   let x = Repr::array([Repr::integer("1"), Repr::integer("2")])
   |   let y = Repr::array([Repr::integer("1"), Repr::integer("3")])
   |   let delta = diff_repr(x, y)
47 |   guard delta is Same(Array([]), [Same(Integer("1"), []), _]) else {
   |                                   ^^^^
   |     fail("expected Same(Array, children...)")
   |   }

<WORKDIR>/debug/delta_wbtest.mbt:57:18-57:22:
   |   let x = Repr::array([Repr::integer("1")])
   |   let y = Repr::array([Repr::integer("1"), Repr::integer("2")])
   |   let delta = diff_repr(x, y)
57 |   guard delta is Same(Array([]), [Same(Integer("1"), []), Extra2(Integer("2"))]) else {
   |                  ^^^^
   |     fail("expected Same(Array, [Same 1, Extra2 2])")
   |   }

<WORKDIR>/debug/delta_wbtest.mbt:57:35-57:39:
   |   let x = Repr::array([Repr::integer("1")])
   |   let y = Repr::array([Repr::integer("1"), Repr::integer("2")])
   |   let delta = diff_repr(x, y)
57 |   guard delta is Same(Array([]), [Same(Integer("1"), []), Extra2(Integer("2"))]) else {
   |                                   ^^^^
   |     fail("expected Same(Array, [Same 1, Extra2 2])")
   |   }

<WORKDIR>/debug/delta_wbtest.mbt:67:18-67:22:
   |   let x = Repr::double(1.0)
   |   let y = Repr::double(1.0 + 1.0e-13)
   |   let delta = diff_repr(x, y, max_relative_error=1.0e-12)
67 |   guard delta is Same(DoubleLit(_), []) else {
   |                  ^^^^
   |     fail("expected Same(DoubleLit, [])")
   |   }

<WORKDIR>/debug/delta_wbtest.mbt:90:18-90:22:
   |   let x = Repr::array([Repr::integer("1"), Repr::integer("2")])
   |   let y = Repr::array([Repr::integer("1")])
   |   let delta = diff_repr(x, y)
90 |   guard delta is Same(Array([]), [Same(Integer("1"), []), Extra1(Integer("2"))]) else {
   |                  ^^^^
   |     fail("expected Same(Array, [Same 1, Extra1 2])")
   |   }

<WORKDIR>/debug/delta_wbtest.mbt:90:35-90:39:
   |   let x = Repr::array([Repr::integer("1"), Repr::integer("2")])
   |   let y = Repr::array([Repr::integer("1")])
   |   let delta = diff_repr(x, y)
90 |   guard delta is Same(Array([]), [Same(Integer("1"), []), Extra1(Integer("2"))]) else {
   |                                   ^^^^
   |     fail("expected Same(Array, [Same 1, Extra1 2])")
   |   }

```
