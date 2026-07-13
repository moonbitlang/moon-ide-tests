# indexmap find-references hash src\types.mbt:18:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\indexmap' moon ide find-references 'hash' --loc 'src\types.mbt:18:3'
Found 6 references for symbol 'hash':
<WORKDIR>/src\IndexMap.mbt:112:5-112:9:
    |   // 创建新的桶
    |   let bucket_idx = self.core.entries.length()
    |   let new_bucket = {
112 |     hash,
    |     ^^^^
    |     key,
    |     value,

<WORKDIR>/src\IndexMap.mbt:176:5-176:9:
    |   // 创建新的桶
    |   let bucket_idx = self.core.entries.length()
    |   let new_bucket = {
176 |     hash,
    |     ^^^^
    |     key,
    |     value,

<WORKDIR>/src\IndexMap.mbt:438:24-438:28:
    |     Some(idx) => {
    |       // 获取被删除元素的链表信息
    |       let entry = self.core.entries[idx]
438 |       let hash = entry.hash
    |                        ^^^^
    | 
    |       // 获取被删除元素的位置索引

<WORKDIR>/src\IndexMap.mbt:1230:43-1230:47:
     |   }
     | 
     |   // 从哈希表和键到索引的映射中移除
1230 |   self.core.hash_to_idx.remove(tail_entry.hash)
     |                                           ^^^^
     |   self.key_to_idx.remove(key)
     | 

<WORKDIR>/src\IndexMap.mbt:1284:43-1284:47:
     |   }
     | 
     |   // 从哈希表和键到索引的映射中移除
1284 |   self.core.hash_to_idx.remove(head_entry.hash)
     |                                           ^^^^
     |   self.key_to_idx.remove(key)
     | 

<WORKDIR>/src\types.mbt:18:3-18:7:
   | ///|
   | /// 桶结构，包含键值对信息和链表指针
   | priv struct Bucket[K, V] {
18 |   hash : Int // 键的哈希值（缓存以避免重复计算）
   |   ^^^^
   |   key : K // 键
   |   mut value : V // 值

```
