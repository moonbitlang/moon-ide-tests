# rabbita rename CardSize rui/card.mbt:2:15

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
$ run_moon_ide moon ide rename 'CardSize' 'CardSizeRenamed' --loc 'rui/card.mbt:2:15'
*** Begin Patch
*** Update File: <WORKDIR>/rui/card.mbt
@@
 ///|
-pub(all) enum CardSize {
+pub(all) enum CardSizeRenamed {
   Default
   Sm
 } derive(Debug, Eq)
@@
 const CardFooterStyle : String = "display:flex;align-items:center;padding-inline:var(--rui-card-spacing,1.5rem);border-radius:0 0 var(--rui-card-radius,0.875rem) var(--rui-card-radius,0.875rem)"
 
 ///|
-fn card_size_style(size : CardSize) -> String {
+fn card_size_style(size : CardSizeRenamed) -> String {
   match size {
     Default => CardDefaultSizeStyle
     Sm => CardSmSizeStyle
@@
 }
 
 ///|
-fn card_size_value(size : CardSize) -> String {
+fn card_size_value(size : CardSizeRenamed) -> String {
   match size {
     Default => "default"
     Sm => "sm"
@@
 /// `--rui-card-spacing` is inherited by every card part. Appending a value through
 /// `style` changes the spacing of the complete composition without CSS setup.
 pub fn[C : @html.IsChildren] card(
-  size? : CardSize = Default,
+  size? : CardSizeRenamed = Default,
   id? : String,
   class? : String,
   title? : String,
*** End Patch

```
