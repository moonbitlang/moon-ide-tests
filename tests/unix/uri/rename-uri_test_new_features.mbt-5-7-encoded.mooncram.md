# uri rename encoded uri_test_new_features.mbt:5:7

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
$ run_moon_ide moon ide rename 'encoded' 'encoded_renamed' --loc 'uri_test_new_features.mbt:5:7'
*** Begin Patch
*** Update File: <WORKDIR>/uri_test_new_features.mbt
@@
 /// Test URL encoding functionality
 test "url_encoding" {
   // Test basic encoding
-  let encoded = Uri::encode("hello world!")
+  let encoded_renamed = Uri::encode("hello world!")
-  json_inspect(encoded, content="hello%20world%21")
+  json_inspect(encoded_renamed, content="hello%20world%21")
 
   // Test unreserved characters (should not be encoded)
   let unreserved = "hello-world_123.test~"
*** End Patch

```
