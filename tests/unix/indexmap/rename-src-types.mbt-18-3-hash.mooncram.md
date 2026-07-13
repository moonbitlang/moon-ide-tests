# indexmap rename hash src/types.mbt:18:3

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
$ run_moon_ide moon ide rename 'hash' 'hash_renamed' --loc 'src/types.mbt:18:3'
*** Begin Patch
*** Update File: <WORKDIR>/src/IndexMap.mbt
@@
   // 创建新的桶
   let bucket_idx = self.core.entries.length()
   let new_bucket = {
-    hash,
+    hash_renamed: hash,
     key,
     value,
     next: -1, // 无后继
@@
   // 创建新的桶
   let bucket_idx = self.core.entries.length()
   let new_bucket = {
-    hash,
+    hash_renamed: hash,
     key,
     value,
     next: -1, // 无后继
@@
     Some(idx) => { (escaped)
       // 获取被删除元素的链表信息
       let entry = self.core.entries[idx]
-      let hash = entry.hash
+      let hash = entry.hash_renamed
 
       // 获取被删除元素的位置索引
       // 此处一定能获取到位置，因为idx是从key_to_idx中获得的有效索引
@@
   }
 
   // 从哈希表和键到索引的映射中移除
-  self.core.hash_to_idx.remove(tail_entry.hash)
+  self.core.hash_to_idx.remove(tail_entry.hash_renamed)
   self.key_to_idx.remove(key)
 
   // 从位置映射中移除最后一个位置
@@
   }
 
   // 从哈希表和键到索引的映射中移除
-  self.core.hash_to_idx.remove(head_entry.hash)
+  self.core.hash_to_idx.remove(head_entry.hash_renamed)
   self.key_to_idx.remove(key)
 
   // 获取头部元素的位置（应该是0）
*** Update File: <WORKDIR>/src/types.mbt
@@
 ///|
 /// 桶结构，包含键值对信息和链表指针
 priv struct Bucket[K, V] {
-  hash : Int // 键的哈希值（缓存以避免重复计算）
+  hash_renamed : Int // 键的哈希值（缓存以避免重复计算）
   key : K // 键
   mut value : V // 值
   mut next : Int // 链表后继索引，-1表示没有后继
*** End Patch

```
