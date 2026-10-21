# rabbita find-references host rabbita/internal/runtime/host_ssr_wbtest.mbt:4:7

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
$ run_moon_ide moon ide find-references 'host' --loc 'rabbita/internal/runtime/host_ssr_wbtest.mbt:4:7' --target native
Found 2 references for symbol 'host':
<WORKDIR>/rabbita/internal/runtime/host_ssr_wbtest.mbt:17:9-17:13:
   |       )
   |     },
   |   )
17 |   defer host.cleanup()
   |         ^^^^
   |   assert_eq(
   |     host.get_base_uri(),

<WORKDIR>/rabbita/internal/runtime/host_ssr_wbtest.mbt:19:5-19:9:
   |   )
   |   defer host.cleanup()
   |   assert_eq(
19 |     host.get_base_uri(),
   |     ^^^^
   |     "https://example.test/site/uml/index.html?lang=en",
   |   )

```
