# indexmap find-references calc_grow_threshold src/IndexMap.mbt:5:4

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/indexmap" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide find-references 'calc_grow_threshold' --loc 'src/IndexMap.mbt:5:4'
Found 3 references for symbol 'calc_grow_threshold':
<WORKDIR>/src/IndexMap.mbt:5:4-5:23:
  | const Default_init_capacity = 8 (escaped)
  |  (escaped)
  | ///| (escaped)
5 | fn calc_grow_threshold(capacity : Int) -> Int { (escaped)
  |    ^^^^^^^^^^^^^^^^^^^ (escaped)
  |   capacity * 3 / 4 // 75% 负载因子 (escaped)
  | } (escaped)

<WORKDIR>/src/IndexMap.mbt:39:13-39:32:
   |     }, (escaped)
   |     size: 0, (escaped)
   |     capacity, (escaped)
39 |     growAt: calc_grow_threshold(capacity), (escaped)
   |             ^^^^^^^^^^^^^^^^^^^ (escaped)
   |     key_to_idx: @hashmap.HashMap::default(), (escaped)
   |   } (escaped)

<WORKDIR>/src/IndexMap.mbt:780:17-780:36:
    |   } else { (escaped)
    |     self.capacity = self.capacity * 2 (escaped)
    |   } (escaped)
780 |   self.growAt = calc_grow_threshold(self.capacity) (escaped)
    |                 ^^^^^^^^^^^^^^^^^^^ (escaped)
    |   self.core.hash_to_idx = @hashmap.HashMap([], capacity=self.capacity) (escaped)
    |   self.core.entries = [] (escaped)

```
