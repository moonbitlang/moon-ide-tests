# uri find-references encoded uri_test_new_features.mbt:5:7

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
$ run_moon_ide moon ide find-references 'encoded' --loc 'uri_test_new_features.mbt:5:7'
Found 1 references for symbol 'encoded':
<WORKDIR>/uri_test_new_features.mbt:6:16-6:23:
  | test "url_encoding" { (escaped)
  |   // Test basic encoding (escaped)
  |   let encoded = Uri::encode("hello world!") (escaped)
6 |   json_inspect(encoded, content="hello%20world%21") (escaped)
  |                ^^^^^^^ (escaped)
  |  (escaped)
  |   // Test unreserved characters (should not be encoded) (escaped)

```
