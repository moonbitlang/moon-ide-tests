# indexmap find-references Bucket src/types.mbt:17:13

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
$ run_moon_ide moon ide find-references 'Bucket' --loc 'src/types.mbt:17:13'
Found 2 references for symbol 'Bucket':
<WORKDIR>/src/types.mbt:17:13-17:19:
   |  (escaped)
   | ///| (escaped)
   | /// 桶结构，包含键值对信息和链表指针 (escaped)
17 | priv struct Bucket[K, V] { (escaped)
   |             ^^^^^^ (escaped)
   |   hash : Int // 键的哈希值（缓存以避免重复计算） (escaped)
   |   key : K // 键 (escaped)

<WORKDIR>/src/types.mbt:29:23-29:29:
   | /// IndexMap核心结构，包含所有数据组织功能 (escaped)
   | priv struct IndexMapCore[K, V] { (escaped)
   |   mut hash_to_idx : @hashmap.HashMap[Int, Int] // 哈希值到桶索引的映射 (escaped)
29 |   mut entries : Array[Bucket[K, V]] // 数组：存储实际的键值对及其链表信息 (escaped)
   |                       ^^^^^^ (escaped)
   |   mut head : Int // 链表头节点索引，-1表示空链表 (escaped)
   |   mut tail : Int // 链表尾节点索引，-1表示空链表 (escaped)

```
