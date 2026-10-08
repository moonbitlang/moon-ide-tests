# rabbita find-references VDom rabbita\internal\vdom\diff.mbt:3:8

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide find-references 'VDom' --loc 'rabbita\internal\vdom\diff.mbt:3:8'
Found 13 references for symbol 'VDom':
<WORKDIR>/rabbita\internal\runtime\ambient.mbt:2:62-2:66:
  | ///|
2 | pub using @vdom {type Children, type Props, type VNode, type VDom}
  |                                                              ^^^^
  | 
  | ///|

<WORKDIR>/rabbita\internal\runtime\host_browser.mbt:17:24-17:28:
   |   mut graph_output : @duplix.Node[VNode]?
   |   mut drain_scheduled : Bool
   |   mut paint_scheduled : Bool
17 |   mut document : @vdom.VDom?
   |                        ^^^^
   |   mut url_request : @cmd.Injector[String]
   |   mut url_changed : @cmd.Injector[String]

<WORKDIR>/rabbita\internal\runtime\host_browser.mbt:48:11-48:15:
   |   Scheduler::queue_command(host, cmd)
   |   let root = ambient_host.protect(host, () => output.read())
   |   host.document = Some(
48 |     @vdom.VDom::initialize(root, host, target_element_id?=element_id),
   |           ^^^^
   |   )
   |   host.drain_scheduled = false

<WORKDIR>/rabbita\internal\runtime\host_hydration.mbt:58:20-58:24:
   |     }
   |   }
   | 
58 |   let vdom = @vdom.VDom::initialize_with_hydration(vnode, host)
   |                    ^^^^
   |   host.browser.document = Some(vdom)
   |   host.browser.drain_scheduled = false

<WORKDIR>/rabbita\internal\vdom\diff.mbt:286:4-286:8:
    | 
    | ///|
    | #cfg(target="js")
286 | fn VDom::to_vnode(self : Self) -> VNode {
    |    ^^^^
    |   self.inode.to_vnode()
    | }

<WORKDIR>/rabbita\internal\vdom\diff.mbt:297:8-297:12:
    | }
    | 
    | ///|
297 | pub fn VDom::to_string(self : Self) -> String {
    |        ^^^^
    |   server_side_render(() => self.to_vnode())
    | }

<WORKDIR>/rabbita\internal\vdom\diff.mbt:315:8-315:12:
    | 
    | ///|
    | #cfg(target="js")
315 | pub fn VDom::update(self : Self, root : VNode, scheduler : &Scheduler) -> Unit {
    |        ^^^^
    |   self.inode = diff_document(
    |     self.inode,

<WORKDIR>/rabbita\internal\vdom\diff.mbt:333:8-333:12:
    | 
    | ///|
    | #cfg(target="js")
333 | pub fn VDom::initialize_with_hydration(
    |        ^^^^
    |   vnode : VNode,
    |   scheduler : &Scheduler,

<WORKDIR>/rabbita\internal\vdom\diff.mbt:336:6-336:10:
    | pub fn VDom::initialize_with_hydration(
    |   vnode : VNode,
    |   scheduler : &Scheduler,
336 | ) -> VDom {
    |      ^^^^
    |   let captured_link_listener = new_captured_link_listener(scheduler)
    |   let inode = hydrate_root(vnode, scheduler, captured_link_listener)

<WORKDIR>/rabbita\internal\vdom\diff.mbt:363:8-363:12:
    | 
    | ///|
    | #cfg(target="js")
363 | pub fn VDom::initialize(
    |        ^^^^
    |   vnode : VNode,
    |   scheduler : &Scheduler,

<WORKDIR>/rabbita\internal\vdom\diff.mbt:367:6-367:10:
    |   vnode : VNode,
    |   scheduler : &Scheduler,
    |   target_element_id? : String,
367 | ) -> VDom {
    |      ^^^^
    |   let captured_link_listener = new_captured_link_listener(scheduler)
    |   match (target_element_id, vnode) {

<WORKDIR>/rabbita\internal\vdom\diff.mbt:380:7-380:11:
    |         container.as_node(),
    |         null(),
    |       )
380 |       VDom::{ target_element: Some(container), inode, captured_link_listener, }
    |       ^^^^
    |     }
    |     (

<WORKDIR>/rabbita\internal\vdom\diff.mbt:434:7-434:11:
    |         html,
    |         namespace_uri=None,
    |       )
434 |       VDom::{ target_element: None, inode, captured_link_listener, }
    |       ^^^^
    |     }
    |     // VDom root invariant: the root must be either a `(Some(id), _)` or a 

```
