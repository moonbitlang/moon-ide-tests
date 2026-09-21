# rabbita find-references inode rabbita/internal/vdom/diff.mbt:4:7

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/rabbita" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide find-references 'inode' --loc 'rabbita/internal/vdom/diff.mbt:4:7'
Found 6 references for symbol 'inode':
<WORKDIR>/rabbita/internal/vdom/diff.mbt:287:8-287:13:
    | ///|
    | #cfg(target="js")
    | fn VDom::to_vnode(self : Self) -> VNode {
287 |   self.inode.to_vnode()
    |        ^^^^^
    | }
    | 

<WORKDIR>/rabbita/internal/vdom/diff.mbt:316:8-316:13:
    | ///|
    | #cfg(target="js")
    | pub fn VDom::update(self : Self, root : VNode, scheduler : &Scheduler) -> Unit {
316 |   self.inode = diff_document(
    |        ^^^^^
    |     self.inode,
    |     root,

<WORKDIR>/rabbita/internal/vdom/diff.mbt:317:10-317:15:
    | #cfg(target="js")
    | pub fn VDom::update(self : Self, root : VNode, scheduler : &Scheduler) -> Unit {
    |   self.inode = diff_document(
317 |     self.inode,
    |          ^^^^^
    |     root,
    |     scheduler,

<WORKDIR>/rabbita/internal/vdom/diff.mbt:339:5-339:10:
    | ) -> VDom {
    |   let captured_link_listener = new_captured_link_listener(scheduler)
    |   let inode = hydrate_root(vnode, scheduler, captured_link_listener)
339 |   { inode, captured_link_listener, target_element: None, }
    |     ^^^^^
    | }
    | 

<WORKDIR>/rabbita/internal/vdom/diff.mbt:380:48-380:53:
    |         container.as_node(),
    |         null(),
    |       )
380 |       VDom::{ target_element: Some(container), inode, captured_link_listener, }
    |                                                ^^^^^
    |     }
    |     (

<WORKDIR>/rabbita/internal/vdom/diff.mbt:434:37-434:42:
    |         html,
    |         namespace_uri=None,
    |       )
434 |       VDom::{ target_element: None, inode, captured_link_listener, }
    |                                     ^^^^^
    |     }
    |     // VDom root invariant: the root must be either a `(Some(id), _)` or a 

```
