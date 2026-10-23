# async find-references parse_int src/socket/unimplemented.mbt:20:24

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/async" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide find-references 'parse_int' --loc 'src/socket/unimplemented.mbt:20:24' --target js
Found 3 references for symbol 'parse_int':
<WORKDIR>/src/http/unimplemented.mbt:22:24-22:33:
   | pub let unimplemented : Unit = {
   |   let _ : (@buffer.Buffer) -> Unit = ignore
   |   ignore(@int.MAX_VALUE)
22 |   ignore(() => @string.parse_int("0"))
   |                        ^^^^^^^^^
   |   ignore(@cmp.minimum(0, 0))
   |   ignore(@io.pipe)

<WORKDIR>/src/process/unimplemented_test.mbt:19:24-19:33:
   | #cfg(not(any(target="native", target="wasm")))
   | let _unimplemented : Unit = {
   |   ignore(@env.get_env_var)
19 |   ignore(() => @string.parse_int("0"))
   |                        ^^^^^^^^^
   |   ignore(@fs.unimplemented)
   |   ignore(@utf8.encode(""))

<WORKDIR>/src/socket/unimplemented.mbt:20:24-20:33:
   | #cfg(not(any(target="native", target="wasm")))
   | #coverage.skip
   | pub let unimplemented : Unit = {
20 |   ignore(() => @string.parse_int("0"))
   |                        ^^^^^^^^^
   |   ignore(@io.pipe)
   |   ignore(@event_loop.Timer::new)

```
