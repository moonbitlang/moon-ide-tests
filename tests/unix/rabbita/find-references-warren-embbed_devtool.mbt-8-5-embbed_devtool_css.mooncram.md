# rabbita find-references embbed_devtool_css warren/embbed_devtool.mbt:8:5

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
$ run_moon_ide moon ide find-references 'embbed_devtool_css' --loc 'warren/embbed_devtool.mbt:8:5'
Found 2 references for symbol 'embbed_devtool_css':
<WORKDIR>/warren/embbed_devtool.mbt:8:5-8:23:
  | 
  | ///|
  | #warnings("-unused_value")
8 | let embbed_devtool_css : String =
  |     ^^^^^^^^^^^^^^^^^^
  |   #|body {
  |   #|  margin: 0;

<WORKDIR>/warren/main.mbt:304:48-304:66:
    |   }
    |   vfs.mount("/index.html", FileContent(shell_html_template))
    |   vfs.mount("/warren_devtool.js", FileContent(embbed_devtool_js))
304 |   vfs.mount("/warren_devtool.css", FileContent(embbed_devtool_css))
    |                                                ^^^^^^^^^^^^^^^^^^
    | 
    |   @async.with_task_group <| group => {

```
