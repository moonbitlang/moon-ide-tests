# core find-references decode_utf8_js encoding/utf8/decode_js.mbt:16:16

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
$ run_moon_ide moon ide find-references 'decode_utf8_js' --loc 'encoding/utf8/decode_js.mbt:16:16' --target js
Found 1 references for symbol 'decode_utf8_js':
<WORKDIR>/encoding/utf8/decode_js.mbt:104:16-104:30:
    |   bytes : BytesView,
    |   ignore_bom~ : Bool = false,
    | ) -> String raise Malformed {
104 |   let result = decode_utf8_js(
    |                ^^^^^^^^^^^^^^
    |     bytes.data(),
    |     bytes.start_offset(),

```
