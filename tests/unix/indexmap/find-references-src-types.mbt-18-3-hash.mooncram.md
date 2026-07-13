# indexmap find-references hash src/types.mbt:18:3

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
$ run_moon_ide moon ide find-references 'hash' --loc 'src/types.mbt:18:3'
Found 6 references for symbol 'hash':
<WORKDIR>/src/IndexMap.mbt:112:5-112:9:
    |   // 创建新的桶 (escaped)
    |   let bucket_idx = self.core.entries.length() (escaped)
    |   let new_bucket = { (escaped)
112 |     hash, (escaped)
    |     ^^^^ (escaped)
    |     key, (escaped)
    |     value, (escaped)

<WORKDIR>/src/IndexMap.mbt:176:5-176:9:
    |   // 创建新的桶 (escaped)
    |   let bucket_idx = self.core.entries.length() (escaped)
    |   let new_bucket = { (escaped)
176 |     hash, (escaped)
    |     ^^^^ (escaped)
    |     key, (escaped)
    |     value, (escaped)

<WORKDIR>/src/IndexMap.mbt:438:24-438:28:
    |     Some(idx) => { (escaped)
    |       // 获取被删除元素的链表信息 (escaped)
    |       let entry = self.core.entries[idx] (escaped)
438 |       let hash = entry.hash (escaped)
    |                        ^^^^ (escaped)
    |  (escaped)
    |       // 获取被删除元素的位置索引 (escaped)

<WORKDIR>/src/IndexMap.mbt:1230:43-1230:47:
     |   } (escaped)
     |  (escaped)
     |   // 从哈希表和键到索引的映射中移除 (escaped)
1230 |   self.core.hash_to_idx.remove(tail_entry.hash) (escaped)
     |                                           ^^^^ (escaped)
     |   self.key_to_idx.remove(key) (escaped)
     |  (escaped)

<WORKDIR>/src/IndexMap.mbt:1284:43-1284:47:
     |   } (escaped)
     |  (escaped)
     |   // 从哈希表和键到索引的映射中移除 (escaped)
1284 |   self.core.hash_to_idx.remove(head_entry.hash) (escaped)
     |                                           ^^^^ (escaped)
     |   self.key_to_idx.remove(key) (escaped)
     |  (escaped)

<WORKDIR>/src/types.mbt:18:3-18:7:
   | ///| (escaped)
   | /// 桶结构，包含键值对信息和链表指针 (escaped)
   | priv struct Bucket[K, V] { (escaped)
18 |   hash : Int // 键的哈希值（缓存以避免重复计算） (escaped)
   |   ^^^^ (escaped)
   |   key : K // 键 (escaped)
   |   mut value : V // 值 (escaped)

```
