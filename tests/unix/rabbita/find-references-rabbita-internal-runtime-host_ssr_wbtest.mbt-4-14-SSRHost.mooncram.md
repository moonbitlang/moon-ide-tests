# rabbita find-references SSRHost rabbita/internal/runtime/host_ssr_wbtest.mbt:4:14

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
$ run_moon_ide moon ide find-references 'SSRHost' --loc 'rabbita/internal/runtime/host_ssr_wbtest.mbt:4:14' --target native
Found 2 references for symbol 'SSRHost':
<WORKDIR>/rabbita/internal/runtime/host_ssr_wbtest.mbt:4:14-4:21:
  | ///|
  | #cfg(not(target="js"))
  | async test "SSR base URI combines the base and request path without reading base tags" {
4 |   let host = SSRHost(
  |              ^^^^^^^
  |     base_uri="https://example.test/site/",
  |     path="/uml/index.html?lang=en",

<WORKDIR>/rabbita/top.mbt:96:25-96:32:
   | ) -> String {
   |   let (base_uri, path) = split_url(url)
   |   @async.with_timeout(timeout, () => {
96 |     let host = @runtime.SSRHost(base_uri~, path~, () => {
   |                         ^^^^^^^
   |       let output = (self.builder)()
   |       output.0.map(html => html.0)

```
