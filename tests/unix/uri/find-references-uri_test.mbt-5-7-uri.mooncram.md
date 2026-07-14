# uri find-references uri uri_test.mbt:5:7

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/uri" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide find-references 'uri' --loc 'uri_test.mbt:5:7'
Found 2 references for symbol 'uri':
<WORKDIR>/uri_test.mbt:5:7-5:10:
  | /// Test basic URI parsing functionality (escaped)
  | test "basic_uri_parsing" { (escaped)
  |   // Test simple HTTP URI (escaped)
5 |   let uri = @uri.parse("https://example.com/path") (escaped)
  |       ^^^ (escaped)
  |   json_inspect(uri, content={ (escaped)
  |     "scheme": "https", (escaped)

<WORKDIR>/uri_test.mbt:6:16-6:19:
  | test "basic_uri_parsing" { (escaped)
  |   // Test simple HTTP URI (escaped)
  |   let uri = @uri.parse("https://example.com/path") (escaped)
6 |   json_inspect(uri, content={ (escaped)
  |                ^^^ (escaped)
  |     "scheme": "https", (escaped)
  |     "authority": { "host": "example.com" }, (escaped)

```
