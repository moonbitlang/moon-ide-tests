# indexmap rename calc_grow_threshold src/IndexMap.mbt:5:4

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
$ run_moon_ide moon ide rename 'calc_grow_threshold' 'calc_grow_threshold_renamed' --loc 'src/IndexMap.mbt:5:4'
*** Begin Patch
*** Update File: <WORKDIR>/src/IndexMap.mbt
@@
 const Default_init_capacity = 8
 
 ///|
-fn calc_grow_threshold(capacity : Int) -> Int {
+fn calc_grow_threshold_renamed(capacity : Int) -> Int {
   capacity * 3 / 4 // 75% 负载因子
 }
 
@@
     },
     size: 0,
     capacity,
-    growAt: calc_grow_threshold(capacity),
+    growAt: calc_grow_threshold_renamed(capacity),
     key_to_idx: @hashmap.HashMap::default(),
   }
 }
@@
   } else {
     self.capacity = self.capacity * 2
   }
-  self.growAt = calc_grow_threshold(self.capacity)
+  self.growAt = calc_grow_threshold_renamed(self.capacity)
   self.core.hash_to_idx = @hashmap.HashMap([], capacity=self.capacity)
   self.core.entries = []
   self.core.head = -1
*** End Patch

```
