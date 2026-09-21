# rabbita rename Sm rui/card.mbt:4:3

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
$ run_moon_ide moon ide rename 'Sm' 'SmRenamed' --loc 'rui/card.mbt:4:3'
*** Begin Patch
*** Update File: <WORKDIR>/rui/card.mbt
@@
 ///|
 pub(all) enum CardSize {
   Default
-  Sm
+  SmRenamed
 } derive(Debug, Eq)
 
 ///|
@@
 fn card_size_style(size : CardSize) -> String {
   match size {
     Default => CardDefaultSizeStyle
-    Sm => CardSmSizeStyle
+    SmRenamed => CardSmSizeStyle
   }
 }
 
@@
 fn card_size_value(size : CardSize) -> String {
   match size {
     Default => "default"
-    Sm => "sm"
+    SmRenamed => "sm"
   }
 }
 
*** Update File: <WORKDIR>/website/homepage/components/foundations_identity_variants.mbt
@@
       identity_demo_section(
         "Small",
         "Compact card composition.",
-        @rui.card(size=Sm, [
+        @rui.card(size=SmRenamed, [
           @rui.card_header([
             @rui.card_title("Preview build"),
             @rui.card_description("A compact card using the same composition."),
*** Update File: <WORKDIR>/website/homepage/components/interactions_collapsible.mbt
@@
         public_images,
       ],
     )
-    @rui.card(size=Sm, style=[IgCollapsibleTreeCardStyle], [
+    @rui.card(size=SmRenamed, style=[IgCollapsibleTreeCardStyle], [
       @rui.card_header(tabs_html),
       @rui.card_content(
         @html.div(style=[IgCollapsibleTreeListStyle], [
*** End Patch

```
