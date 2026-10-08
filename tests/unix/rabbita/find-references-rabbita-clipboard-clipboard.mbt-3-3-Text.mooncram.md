# rabbita find-references Text rabbita/clipboard/clipboard.mbt:3:3

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
$ run_moon_ide moon ide find-references 'Text' --loc 'rabbita/clipboard/clipboard.mbt:3:3'
Found 9 references for symbol 'Text':
<WORKDIR>/rabbita/clipboard/op.mbt:12:21-12:25:
   |   ..on_invoke(op_invoke)
   |   ..on_debug(extension => {
   |     match extension {
12 |       ClipboardCopy(Text(text), _, _) =>
   |                     ^^^^
   |         Repr::ctor("ClipboardCopy", [
   |           (None, Repr::ctor("Text", [(None, Repr(text))])),

<WORKDIR>/rabbita/clipboard/op.mbt:32:13-32:17:
   |       Async(() => {
   |         try {
   |           match item {
32 |             Text(text) =>
   |             ^^^^
   |               @dom.window().navigator().clipboard().write_text(text).wait()
   |           }

<WORKDIR>/rabbita/clipboard/op.mbt:55:26-55:30:
   |           error if failed is Some(to_message) => to_message(error.to_string())
   |           _ => @cmd.none
   |         } noraise {
55 |           text => pasted(Text(text))
   |                          ^^^^
   |         }
   |       })

<WORKDIR>/rabbita/clipboard/op_test.mbt:4:21-4:25:
  | ///|
  | test "clipboard commands have structural debug output" {
  |   debug_inspect(
4 |     @clipboard.copy(Text("hello")),
  |                     ^^^^
  |     content="ClipboardCopy(Text(\"hello\"))",
  |   )

<WORKDIR>/website/homepage/components/forms_input_group_variants.mbt:909:46-909:50:
    |                     title="Copy script",
    |                     attrs=@html.Attrs::build().aria_label("Copy script"),
    |                     style=["margin-inline-start:auto"],
909 |                     on_click=@clipboard.copy(Text("println(\"Hello, world!\")")),
    |                                              ^^^^
    |                     showcase_copy_icon(),
    |                   ),

<WORKDIR>/website/homepage/components/forms_input_group_variants.mbt:1186:46-1186:50:
     |                     size=InputButtonIconXs,
     |                     title="Copy URL",
     |                     attrs=@html.Attrs::build().aria_label("Copy URL"),
1186 |                     on_click=@clipboard.copy(Text("https://rabbit-tea.dev")),
     |                                              ^^^^
     |                     showcase_copy_icon(),
     |                   ),

<WORKDIR>/website/homepage/components/forms_input_group_variants.mbt:1437:46-1437:50:
     |                     size=InputButtonIconXs,
     |                     title="Copy editor content",
     |                     attrs=@html.Attrs::build().aria_label("Copy editor content"),
1437 |                     on_click=@clipboard.copy(Text("println(\"Hello, world!\")")),
     |                                              ^^^^
     |                     showcase_copy_icon(),
     |                   ),

<WORKDIR>/website/homepage/components/showcase_component_shell.mbt:175:32-175:36:
    |       title="Copy code",
    |       attrs=@html.Attrs::build().aria_label("Copy code"),
    |       style=[ShowcaseDemoCodeCopyStyle],
175 |       on_click=@clipboard.copy(Text(code)),
    |                                ^^^^
    |       showcase_copy_icon(),
    |     ),

<WORKDIR>/website/homepage/main/main.mbt:898:29-898:33:
    |             "qs-copy-btn"
    |           },
    |           on_click=batch([
898 |             @clipboard.copy(Text(cmd)),
    |                             ^^^^
    |             set_copied(_ => true),
    |             @rabbita.delay(set_copied(_ => false), 1500),

```
