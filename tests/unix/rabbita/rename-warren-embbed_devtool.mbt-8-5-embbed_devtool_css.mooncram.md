# rabbita rename embbed_devtool_css warren/embbed_devtool.mbt:8:5

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
$ run_moon_ide moon ide rename 'embbed_devtool_css' 'embbed_devtool_css_renamed' --loc 'warren/embbed_devtool.mbt:8:5'
*** Begin Patch
*** Update File: <WORKDIR>/warren/embbed_devtool.mbt
@@
 
 ///|
 #warnings("-unused_value")
-let embbed_devtool_css : String =
+let embbed_devtool_css_renamed : String =
   #|body {
   #|  margin: 0;
   #|  font-family: system-ui, sans-serif;
*** Update File: <WORKDIR>/warren/main.mbt
@@
   }
   vfs.mount("/index.html", FileContent(shell_html_template))
   vfs.mount("/warren_devtool.js", FileContent(embbed_devtool_js))
-  vfs.mount("/warren_devtool.css", FileContent(embbed_devtool_css))
+  vfs.mount("/warren_devtool.css", FileContent(embbed_devtool_css_renamed))
 
   @async.with_task_group <| group => {
     let hub = Devhub(port, vfs)
*** End Patch

```
