# uri rename uri uri_test.mbt:5:7

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
$ run_moon_ide moon ide rename 'uri' 'uri_renamed' --loc 'uri_test.mbt:5:7'
*** Begin Patch
*** Update File: <WORKDIR>/uri_test.mbt
@@
 /// Test basic URI parsing functionality
 test "basic_uri_parsing" {
   // Test simple HTTP URI
-  let uri = @uri.parse("https://example.com/path")
+  let uri_renamed = @uri.parse("https://example.com/path")
-  json_inspect(uri, content={
+  json_inspect(uri_renamed, content={
     "scheme": "https",
     "authority": { "host": "example.com" },
     "path": "/path",
*** End Patch

```
