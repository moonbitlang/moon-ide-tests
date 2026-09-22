# rabbita find-references Sm rui/card.mbt:4:3

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
$ run_moon_ide moon ide find-references 'Sm' --loc 'rui/card.mbt:4:3'
Found 4 references for symbol 'Sm':
<WORKDIR>/rui/card.mbt:38:5-38:7:
   | fn card_size_style(size : CardSize) -> String {
   |   match size {
   |     Default => CardDefaultSizeStyle
38 |     Sm => CardSmSizeStyle
   |     ^^
   |   }
   | }

<WORKDIR>/rui/card.mbt:46:5-46:7:
   | fn card_size_value(size : CardSize) -> String {
   |   match size {
   |     Default => "default"
46 |     Sm => "sm"
   |     ^^
   |   }
   | }

<WORKDIR>/website/homepage/components/foundations_identity_variants.mbt:310:24-310:26:
    |       identity_demo_section(
    |         "Small",
    |         "Compact card composition.",
310 |         @rui.card(size=Sm, [
    |                        ^^
    |           @rui.card_header([
    |             @rui.card_title("Preview build"),

<WORKDIR>/website/homepage/components/interactions_collapsible.mbt:306:20-306:22:
    |         public_images,
    |       ],
    |     )
306 |     @rui.card(size=Sm, style=[IgCollapsibleTreeCardStyle], [
    |                    ^^
    |       @rui.card_header(tabs_html),
    |       @rui.card_content(

```
