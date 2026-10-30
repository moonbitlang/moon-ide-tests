# indexmap find-references hash src\types.mbt:18:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\indexmap' moon ide find-references 'hash' --loc 'src\types.mbt:18:3'
Found 5 references for symbol 'hash':
<WORKDIR>/src\IndexMap.mbt:113:5-113:9:
    |   // 创建新的桶
    |   let bucket_idx = self.core.entries.length()
    |   let new_bucket = {
113 |     hash,
    |     ^^^^
    |     key,
    |     value,

<WORKDIR>/src\IndexMap.mbt:177:5-177:9:
    |   // 创建新的桶
    |   let bucket_idx = self.core.entries.length()
    |   let new_bucket = {
177 |     hash,
    |     ^^^^
    |     key,
    |     value,

<WORKDIR>/src\IndexMap.mbt:396:24-396:28:
    |     Some(idx) => {
    |       // 获取被删除元素的链表信息
    |       let entry = self.core.entries[idx]
396 |       let hash = entry.hash
    |                        ^^^^
    | 
    |       // 获取被删除元素的位置索引

<WORKDIR>/src\IndexMap.mbt:1188:43-1188:47:
     |   }
     | 
     |   // 从哈希表和键到索引的映射中移除
1188 |   self.core.hash_to_idx.remove(tail_entry.hash)
     |                                           ^^^^
     |   self.key_to_idx.remove(key)
     | 

<WORKDIR>/src\IndexMap.mbt:1242:43-1242:47:
     |   }
     | 
     |   // 从哈希表和键到索引的映射中移除
1242 |   self.core.hash_to_idx.remove(head_entry.hash)
     |                                           ^^^^
     |   self.key_to_idx.remove(key)
     | 

```
