# indexmap find-references Bucket src\types.mbt:17:13

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\indexmap' moon ide find-references 'Bucket' --loc 'src\types.mbt:17:13'
Found 1 references for symbol 'Bucket':
<WORKDIR>/src\types.mbt:29:23-29:29:
   | /// IndexMap核心结构，包含所有数据组织功能
   | priv struct IndexMapCore[K, V] {
   |   mut hash_to_idx : @hashmap.HashMap[Int, Int] // 哈希值到桶索引的映射
29 |   mut entries : Array[Bucket[K, V]] // 数组：存储实际的键值对及其链表信息
   |                       ^^^^^^
   |   mut head : Int // 链表头节点索引，-1表示空链表
   |   mut tail : Int // 链表尾节点索引，-1表示空链表

```
