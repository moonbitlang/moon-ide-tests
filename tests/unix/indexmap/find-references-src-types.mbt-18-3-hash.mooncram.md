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
Found 5 references for symbol 'hash':
<WORKDIR>/src/IndexMap.mbt:113:5-113:9:
    |   // 创建新的桶 (escaped)
    |   let bucket_idx = self.core.entries.length() (escaped)
    |   let new_bucket = { (escaped)
113 |     hash,
    |     ^^^^ (escaped)
    |     key, (escaped)
    |     value, (escaped)

<WORKDIR>/src/IndexMap.mbt:177:5-177:9:
    |   // 创建新的桶 (escaped)
    |   let bucket_idx = self.core.entries.length() (escaped)
    |   let new_bucket = { (escaped)
177 |     hash,
    |     ^^^^ (escaped)
    |     key, (escaped)
    |     value, (escaped)

<WORKDIR>/src/IndexMap.mbt:396:24-396:28:
    |     Some(idx) => { (escaped)
    |       // 获取被删除元素的链表信息 (escaped)
    |       let entry = self.core.entries[idx] (escaped)
396 |       let hash = entry.hash
    |                        ^^^^ (escaped)
    |  (escaped)
    |       // 获取被删除元素的位置索引 (escaped)

<WORKDIR>/src/IndexMap.mbt:1188:43-1188:47:
     |   } (escaped)
     |  (escaped)
     |   // 从哈希表和键到索引的映射中移除 (escaped)
1188 |   self.core.hash_to_idx.remove(tail_entry.hash)
     |                                           ^^^^ (escaped)
     |   self.key_to_idx.remove(key) (escaped)
     |  (escaped)

<WORKDIR>/src/IndexMap.mbt:1242:43-1242:47:
     |   } (escaped)
     |  (escaped)
     |   // 从哈希表和键到索引的映射中移除 (escaped)
1242 |   self.core.hash_to_idx.remove(head_entry.hash)
     |                                           ^^^^ (escaped)
     |   self.key_to_idx.remove(key) (escaped)
     |  (escaped)

```
