# rabbita rename Text rabbita/clipboard/clipboard.mbt:3:3

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
$ run_moon_ide moon ide rename 'Text' 'TextRenamed' --loc 'rabbita/clipboard/clipboard.mbt:3:3'
*** Begin Patch
*** Update File: <WORKDIR>/rabbita/clipboard/clipboard.mbt
@@
 ///|
 pub(all) enum Item {
-  Text(String)
+  TextRenamed(String)
 }
 
 ///|
*** Update File: <WORKDIR>/rabbita/clipboard/op.mbt
@@
   ..on_invoke(op_invoke)
   ..on_debug(extension => {
     match extension {
-      ClipboardCopy(Text(text), _, _) =>
+      ClipboardCopy(TextRenamed(text), _, _) =>
         Repr::ctor("ClipboardCopy", [
           (None, Repr::ctor("Text", [(None, Repr(text))])),
         ])
@@
       Async(() => {
         try {
           match item {
-            Text(text) =>
+            TextRenamed(text) =>
               @dom.window().navigator().clipboard().write_text(text).wait()
           }
           if copied is Some(message) {
@@
           error if failed is Some(to_message) => to_message(error.to_string())
           _ => @cmd.none
         } noraise {
-          text => pasted(Text(text))
+          text => pasted(TextRenamed(text))
         }
       })
     _ => raise Unhandled
*** Update File: <WORKDIR>/rabbita/clipboard/op_test.mbt
@@
 ///|
 test "clipboard commands have structural debug output" {
   debug_inspect(
-    @clipboard.copy(Text("hello")),
+    @clipboard.copy(TextRenamed("hello")),
     content="ClipboardCopy(Text(\"hello\"))",
   )
   debug_inspect(
*** Update File: <WORKDIR>/website/homepage/components/forms_input_group_variants.mbt
@@
                     title="Copy script",
                     attrs=@html.Attrs::build().aria_label("Copy script"),
                     style=["margin-inline-start:auto"],
-                    on_click=@clipboard.copy(Text("println(\"Hello, world!\")")),
+                    on_click=@clipboard.copy(TextRenamed("println(\"Hello, world!\")")),
                     showcase_copy_icon(),
                   ),
                 ]),
@@
                     size=InputButtonIconXs,
                     title="Copy URL",
                     attrs=@html.Attrs::build().aria_label("Copy URL"),
-                    on_click=@clipboard.copy(Text("https://rabbit-tea.dev")),
+                    on_click=@clipboard.copy(TextRenamed("https://rabbit-tea.dev")),
                     showcase_copy_icon(),
                   ),
                 ]),
@@
                     size=InputButtonIconXs,
                     title="Copy editor content",
                     attrs=@html.Attrs::build().aria_label("Copy editor content"),
-                    on_click=@clipboard.copy(Text("println(\"Hello, world!\")")),
+                    on_click=@clipboard.copy(TextRenamed("println(\"Hello, world!\")")),
                     showcase_copy_icon(),
                   ),
                 ]),
*** Update File: <WORKDIR>/website/homepage/components/showcase_component_shell.mbt
@@
       title="Copy code",
       attrs=@html.Attrs::build().aria_label("Copy code"),
       style=[ShowcaseDemoCodeCopyStyle],
-      on_click=@clipboard.copy(Text(code)),
+      on_click=@clipboard.copy(TextRenamed(code)),
       showcase_copy_icon(),
     ),
   )
*** Update File: <WORKDIR>/website/homepage/main/main.mbt
@@
             "qs-copy-btn"
           },
           on_click=batch([
-            @clipboard.copy(Text(cmd)),
+            @clipboard.copy(TextRenamed(cmd)),
             set_copied(_ => true),
             @rabbita.delay(set_copied(_ => false), 1500),
           ]),
*** End Patch

```
