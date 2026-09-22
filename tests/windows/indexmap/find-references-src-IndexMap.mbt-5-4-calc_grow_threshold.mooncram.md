# indexmap find-references calc_grow_threshold src\IndexMap.mbt:5:4

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\indexmap' moon ide find-references 'calc_grow_threshold' --loc 'src\IndexMap.mbt:5:4'
Found 2 references for symbol 'calc_grow_threshold':
<WORKDIR>/src\IndexMap.mbt:39:13-39:32:
   |     },
   |     size: 0,
   |     capacity,
39 |     growAt: calc_grow_threshold(capacity),
   |             ^^^^^^^^^^^^^^^^^^^
   |     key_to_idx: @hashmap.HashMap::default(),
   |   }

<WORKDIR>/src\IndexMap.mbt:780:17-780:36:
    |   } else {
    |     self.capacity = self.capacity * 2
    |   }
780 |   self.growAt = calc_grow_threshold(self.capacity)
    |                 ^^^^^^^^^^^^^^^^^^^
    |   self.core.hash_to_idx = @hashmap.HashMap([], capacity=self.capacity)
    |   self.core.entries = []

```
