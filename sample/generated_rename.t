  $ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
  $ export BUILD_PATH_PREFIX_MAP="\$MOON_HOME=$MOON_HOME:$BUILD_PATH_PREFIX_MAP"
  $ moon ide rename Item ItemRenamed --loc 'sample.mbt:3:10'
  Error: could not find references for symbol 'Item' at sample.mbt:3:10
  [1]
  $ moon ide rename Worker WorkerRenamed --loc 'sample.mbt:5:11'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
   /// Sample source used by testgen.
   pub type Item = Int
   
  -pub trait Worker {
  +pub trait WorkerRenamed {
     run(Self, Int) -> Int
   }
   
  @@
     Int::abs(-n)
   }
   
  -impl Worker for Int with run(self, delta) {
  +impl WorkerRenamed for Int with run(self, delta) {
     self + delta
   }
   
   pub fn demo_call(x : Int) -> Int {
     let item = make_item(default_item)
  -  let worker_value = Worker::run(x, item)
  +  let worker_value = WorkerRenamed::run(x, item)
     worker_value + use_features()
   }
  *** End Patch
  
  $ moon ide rename run run_renamed --loc 'sample.mbt:6:3'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
   pub type Item = Int
   
   pub trait Worker {
  -  run(Self, Int) -> Int
  +  run_renamed(Self, Int) -> Int
   }
   
   pub fn make_item(x : Int) -> Item {
  @@
     Int::abs(-n)
   }
   
  -impl Worker for Int with run(self, delta) {
  +impl Worker for Int with run_renamed(self, delta) {
     self + delta
   }
   
   pub fn demo_call(x : Int) -> Int {
     let item = make_item(default_item)
  -  let worker_value = Worker::run(x, item)
  +  let worker_value = Worker::run_renamed(x, item)
     worker_value + use_features()
   }
  *** End Patch
  
  $ moon ide rename make_item make_item_renamed --loc 'sample.mbt:9:8'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
     run(Self, Int) -> Int
   }
   
  -pub fn make_item(x : Int) -> Item {
  +pub fn make_item_renamed(x : Int) -> Item {
     x
   }
   
  @@
   }
   
   pub fn demo_call(x : Int) -> Int {
  -  let item = make_item(default_item)
  +  let item = make_item_renamed(default_item)
     let worker_value = Worker::run(x, item)
     worker_value + use_features()
   }
  *** End Patch
  
  $ moon ide rename x x_renamed --loc 'sample.mbt:9:18'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
     run(Self, Int) -> Int
   }
   
  -pub fn make_item(x : Int) -> Item {
  +pub fn make_item(x_renamed : Int) -> Item {
  -  x
  +  x_renamed
   }
   
   pub let default_item : Item = 1
  *** End Patch
  
  $ moon ide rename Item ItemRenamed --loc 'sample.mbt:9:30'
  Error: could not find references for symbol 'Item' at sample.mbt:9:30
  [1]
  $ moon ide rename x x_renamed --loc 'sample.mbt:10:3'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
     run(Self, Int) -> Int
   }
   
  -pub fn make_item(x : Int) -> Item {
  +pub fn make_item(x_renamed : Int) -> Item {
  -  x
  +  x_renamed
   }
   
   pub let default_item : Item = 1
  *** End Patch
  
  $ moon ide rename default_item default_item_renamed --loc 'sample.mbt:13:9'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
     x
   }
   
  -pub let default_item : Item = 1
  +pub let default_item_renamed : Item = 1
   
   pub fn use_features() -> Int {
     let xs = [1, 2, 3]
  @@
   }
   
   pub fn demo_call(x : Int) -> Int {
  -  let item = make_item(default_item)
  +  let item = make_item(default_item_renamed)
     let worker_value = Worker::run(x, item)
     worker_value + use_features()
   }
  *** End Patch
  
  $ moon ide rename Item ItemRenamed --loc 'sample.mbt:13:24'
  Error: could not find references for symbol 'Item' at sample.mbt:13:24
  [1]
  $ moon ide rename use_features use_features_renamed --loc 'sample.mbt:15:8'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
   
   pub let default_item : Item = 1
   
  -pub fn use_features() -> Int {
  +pub fn use_features_renamed() -> Int {
     let xs = [1, 2, 3]
     let n = xs.length()
     Int::abs(-n)
  @@
   pub fn demo_call(x : Int) -> Int {
     let item = make_item(default_item)
     let worker_value = Worker::run(x, item)
  -  worker_value + use_features()
  +  worker_value + use_features_renamed()
   }
  *** End Patch
  
  $ moon ide rename xs xs_renamed --loc 'sample.mbt:16:7'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
   pub let default_item : Item = 1
   
   pub fn use_features() -> Int {
  -  let xs = [1, 2, 3]
  +  let xs_renamed = [1, 2, 3]
  -  let n = xs.length()
  +  let n = xs_renamed.length()
     Int::abs(-n)
   }
   
  *** End Patch
  
  $ moon ide rename n n_renamed --loc 'sample.mbt:17:7'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
   
   pub fn use_features() -> Int {
     let xs = [1, 2, 3]
  -  let n = xs.length()
  +  let n_renamed = xs.length()
  -  Int::abs(-n)
  +  Int::abs(-n_renamed)
   }
   
   impl Worker for Int with run(self, delta) {
  *** End Patch
  
  $ moon ide rename length length_renamed --loc 'sample.mbt:17:14'
  Error: cannot rename symbol 'length' in package 'moonbitlang/core/builtin' outside of module 'bzy-debug/sample'
  [1]
  $ moon ide rename xs xs_renamed --loc 'sample.mbt:17:11'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
   pub let default_item : Item = 1
   
   pub fn use_features() -> Int {
  -  let xs = [1, 2, 3]
  +  let xs_renamed = [1, 2, 3]
  -  let n = xs.length()
  +  let n = xs_renamed.length()
     Int::abs(-n)
   }
   
  *** End Patch
  
  $ moon ide rename abs abs_renamed --loc 'sample.mbt:18:8'
  Error: cannot rename symbol 'abs' in package 'moonbitlang/core/builtin' outside of module 'bzy-debug/sample'
  [1]
  $ moon ide rename n n_renamed --loc 'sample.mbt:18:13'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
   
   pub fn use_features() -> Int {
     let xs = [1, 2, 3]
  -  let n = xs.length()
  +  let n_renamed = xs.length()
  -  Int::abs(-n)
  +  Int::abs(-n_renamed)
   }
   
   impl Worker for Int with run(self, delta) {
  *** End Patch
  
  $ moon ide rename Worker WorkerRenamed --loc 'sample.mbt:21:6'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
   /// Sample source used by testgen.
   pub type Item = Int
   
  -pub trait Worker {
  +pub trait WorkerRenamed {
     run(Self, Int) -> Int
   }
   
  @@
     Int::abs(-n)
   }
   
  -impl Worker for Int with run(self, delta) {
  +impl WorkerRenamed for Int with run(self, delta) {
     self + delta
   }
   
   pub fn demo_call(x : Int) -> Int {
     let item = make_item(default_item)
  -  let worker_value = Worker::run(x, item)
  +  let worker_value = WorkerRenamed::run(x, item)
     worker_value + use_features()
   }
  *** End Patch
  
  $ moon ide rename run run_renamed --loc 'sample.mbt:21:26'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
   pub type Item = Int
   
   pub trait Worker {
  -  run(Self, Int) -> Int
  +  run_renamed(Self, Int) -> Int
   }
   
   pub fn make_item(x : Int) -> Item {
  @@
     Int::abs(-n)
   }
   
  -impl Worker for Int with run(self, delta) {
  +impl Worker for Int with run_renamed(self, delta) {
     self + delta
   }
   
   pub fn demo_call(x : Int) -> Int {
     let item = make_item(default_item)
  -  let worker_value = Worker::run(x, item)
  +  let worker_value = Worker::run_renamed(x, item)
     worker_value + use_features()
   }
  *** End Patch
  
  $ moon ide rename self self_renamed --loc 'sample.mbt:21:30'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
     Int::abs(-n)
   }
   
  -impl Worker for Int with run(self, delta) {
  +impl Worker for Int with run(self_renamed, delta) {
  -  self + delta
  +  self_renamed + delta
   }
   
   pub fn demo_call(x : Int) -> Int {
  *** End Patch
  
  $ moon ide rename delta delta_renamed --loc 'sample.mbt:21:36'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
     Int::abs(-n)
   }
   
  -impl Worker for Int with run(self, delta) {
  +impl Worker for Int with run(self, delta_renamed) {
  -  self + delta
  +  self + delta_renamed
   }
   
   pub fn demo_call(x : Int) -> Int {
  *** End Patch
  
  $ moon ide rename self self_renamed --loc 'sample.mbt:22:3'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
     Int::abs(-n)
   }
   
  -impl Worker for Int with run(self, delta) {
  +impl Worker for Int with run(self_renamed, delta) {
  -  self + delta
  +  self_renamed + delta
   }
   
   pub fn demo_call(x : Int) -> Int {
  *** End Patch
  
  $ moon ide rename delta delta_renamed --loc 'sample.mbt:22:10'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
     Int::abs(-n)
   }
   
  -impl Worker for Int with run(self, delta) {
  +impl Worker for Int with run(self, delta_renamed) {
  -  self + delta
  +  self + delta_renamed
   }
   
   pub fn demo_call(x : Int) -> Int {
  *** End Patch
  
  $ moon ide rename demo_call demo_call_renamed --loc 'sample.mbt:25:8'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
     self + delta
   }
   
  -pub fn demo_call(x : Int) -> Int {
  +pub fn demo_call_renamed(x : Int) -> Int {
     let item = make_item(default_item)
     let worker_value = Worker::run(x, item)
     worker_value + use_features()
  *** Update File: $TESTCASE_ROOT/sample_test.mbt
  @@
   
   ///|
   test "demo_call" {
  -  inspect(demo_call(2), content="6")
  +  inspect(demo_call_renamed(2), content="6")
   }
  *** End Patch
  
  $ moon ide rename x x_renamed --loc 'sample.mbt:25:18'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
     self + delta
   }
   
  -pub fn demo_call(x : Int) -> Int {
  +pub fn demo_call(x_renamed : Int) -> Int {
     let item = make_item(default_item)
  -  let worker_value = Worker::run(x, item)
  +  let worker_value = Worker::run(x_renamed, item)
     worker_value + use_features()
   }
  *** End Patch
  
  $ moon ide rename item item_renamed --loc 'sample.mbt:26:7'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
   }
   
   pub fn demo_call(x : Int) -> Int {
  -  let item = make_item(default_item)
  +  let item_renamed = make_item(default_item)
  -  let worker_value = Worker::run(x, item)
  +  let worker_value = Worker::run(x, item_renamed)
     worker_value + use_features()
   }
  *** End Patch
  
  $ moon ide rename make_item make_item_renamed --loc 'sample.mbt:26:14'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
     run(Self, Int) -> Int
   }
   
  -pub fn make_item(x : Int) -> Item {
  +pub fn make_item_renamed(x : Int) -> Item {
     x
   }
   
  @@
   }
   
   pub fn demo_call(x : Int) -> Int {
  -  let item = make_item(default_item)
  +  let item = make_item_renamed(default_item)
     let worker_value = Worker::run(x, item)
     worker_value + use_features()
   }
  *** End Patch
  
  $ moon ide rename default_item default_item_renamed --loc 'sample.mbt:26:24'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
     x
   }
   
  -pub let default_item : Item = 1
  +pub let default_item_renamed : Item = 1
   
   pub fn use_features() -> Int {
     let xs = [1, 2, 3]
  @@
   }
   
   pub fn demo_call(x : Int) -> Int {
  -  let item = make_item(default_item)
  +  let item = make_item(default_item_renamed)
     let worker_value = Worker::run(x, item)
     worker_value + use_features()
   }
  *** End Patch
  
  $ moon ide rename worker_value worker_value_renamed --loc 'sample.mbt:27:7'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
   
   pub fn demo_call(x : Int) -> Int {
     let item = make_item(default_item)
  -  let worker_value = Worker::run(x, item)
  +  let worker_value_renamed = Worker::run(x, item)
  -  worker_value + use_features()
  +  worker_value_renamed + use_features()
   }
  *** End Patch
  
  $ moon ide rename Worker WorkerRenamed --loc 'sample.mbt:27:22'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
   /// Sample source used by testgen.
   pub type Item = Int
   
  -pub trait Worker {
  +pub trait WorkerRenamed {
     run(Self, Int) -> Int
   }
   
  @@
     Int::abs(-n)
   }
   
  -impl Worker for Int with run(self, delta) {
  +impl WorkerRenamed for Int with run(self, delta) {
     self + delta
   }
   
   pub fn demo_call(x : Int) -> Int {
     let item = make_item(default_item)
  -  let worker_value = Worker::run(x, item)
  +  let worker_value = WorkerRenamed::run(x, item)
     worker_value + use_features()
   }
  *** End Patch
  
  $ moon ide rename run run_renamed --loc 'sample.mbt:27:30'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
   pub type Item = Int
   
   pub trait Worker {
  -  run(Self, Int) -> Int
  +  run_renamed(Self, Int) -> Int
   }
   
   pub fn make_item(x : Int) -> Item {
  @@
     Int::abs(-n)
   }
   
  -impl Worker for Int with run(self, delta) {
  +impl Worker for Int with run_renamed(self, delta) {
     self + delta
   }
   
   pub fn demo_call(x : Int) -> Int {
     let item = make_item(default_item)
  -  let worker_value = Worker::run(x, item)
  +  let worker_value = Worker::run_renamed(x, item)
     worker_value + use_features()
   }
  *** End Patch
  
  $ moon ide rename x x_renamed --loc 'sample.mbt:27:34'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
     self + delta
   }
   
  -pub fn demo_call(x : Int) -> Int {
  +pub fn demo_call(x_renamed : Int) -> Int {
     let item = make_item(default_item)
  -  let worker_value = Worker::run(x, item)
  +  let worker_value = Worker::run(x_renamed, item)
     worker_value + use_features()
   }
  *** End Patch
  
  $ moon ide rename item item_renamed --loc 'sample.mbt:27:37'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
   }
   
   pub fn demo_call(x : Int) -> Int {
  -  let item = make_item(default_item)
  +  let item_renamed = make_item(default_item)
  -  let worker_value = Worker::run(x, item)
  +  let worker_value = Worker::run(x, item_renamed)
     worker_value + use_features()
   }
  *** End Patch
  
  $ moon ide rename worker_value worker_value_renamed --loc 'sample.mbt:28:3'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
   
   pub fn demo_call(x : Int) -> Int {
     let item = make_item(default_item)
  -  let worker_value = Worker::run(x, item)
  +  let worker_value_renamed = Worker::run(x, item)
  -  worker_value + use_features()
  +  worker_value_renamed + use_features()
   }
  *** End Patch
  
  $ moon ide rename use_features use_features_renamed --loc 'sample.mbt:28:18'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
   
   pub let default_item : Item = 1
   
  -pub fn use_features() -> Int {
  +pub fn use_features_renamed() -> Int {
     let xs = [1, 2, 3]
     let n = xs.length()
     Int::abs(-n)
  @@
   pub fn demo_call(x : Int) -> Int {
     let item = make_item(default_item)
     let worker_value = Worker::run(x, item)
  -  worker_value + use_features()
  +  worker_value + use_features_renamed()
   }
  *** End Patch
  
  $ moon ide rename demo_call demo_call_renamed --loc 'sample_test.mbt:7:11'
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
     self + delta
   }
   
  -pub fn demo_call(x : Int) -> Int {
  +pub fn demo_call_renamed(x : Int) -> Int {
     let item = make_item(default_item)
     let worker_value = Worker::run(x, item)
     worker_value + use_features()
  *** Update File: $TESTCASE_ROOT/sample_test.mbt
  @@
   
   ///|
   test "demo_call" {
  -  inspect(demo_call(2), content="6")
  +  inspect(demo_call_renamed(2), content="6")
   }
  *** End Patch
  
  $ moon ide rename 'Item' ItemRenamed
  No references found for symbol 'Item'
  [1]
  $ moon ide rename 'Worker' WorkerRenamed
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
   /// Sample source used by testgen.
   pub type Item = Int
   
  -pub trait Worker {
  +pub trait WorkerRenamed {
     run(Self, Int) -> Int
   }
   
  @@
     Int::abs(-n)
   }
   
  -impl Worker for Int with run(self, delta) {
  +impl WorkerRenamed for Int with run(self, delta) {
     self + delta
   }
   
   pub fn demo_call(x : Int) -> Int {
     let item = make_item(default_item)
  -  let worker_value = Worker::run(x, item)
  +  let worker_value = WorkerRenamed::run(x, item)
     worker_value + use_features()
   }
  *** End Patch
  
  $ moon ide rename 'make_item' make_item_renamed
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
     run(Self, Int) -> Int
   }
   
  -pub fn make_item(x : Int) -> Item {
  +pub fn make_item_renamed(x : Int) -> Item {
     x
   }
   
  @@
   }
   
   pub fn demo_call(x : Int) -> Int {
  -  let item = make_item(default_item)
  +  let item = make_item_renamed(default_item)
     let worker_value = Worker::run(x, item)
     worker_value + use_features()
   }
  *** End Patch
  
  $ moon ide rename 'default_item' default_item_renamed
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
     x
   }
   
  -pub let default_item : Item = 1
  +pub let default_item_renamed : Item = 1
   
   pub fn use_features() -> Int {
     let xs = [1, 2, 3]
  @@
   }
   
   pub fn demo_call(x : Int) -> Int {
  -  let item = make_item(default_item)
  +  let item = make_item(default_item_renamed)
     let worker_value = Worker::run(x, item)
     worker_value + use_features()
   }
  *** End Patch
  
  $ moon ide rename 'use_features' use_features_renamed
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
   
   pub let default_item : Item = 1
   
  -pub fn use_features() -> Int {
  +pub fn use_features_renamed() -> Int {
     let xs = [1, 2, 3]
     let n = xs.length()
     Int::abs(-n)
  @@
   pub fn demo_call(x : Int) -> Int {
     let item = make_item(default_item)
     let worker_value = Worker::run(x, item)
  -  worker_value + use_features()
  +  worker_value + use_features_renamed()
   }
  *** End Patch
  
  $ moon ide rename 'Worker::run for Int' run_renamed
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
   pub type Item = Int
   
   pub trait Worker {
  -  run(Self, Int) -> Int
  +  run_renamed(Self, Int) -> Int
   }
   
   pub fn make_item(x : Int) -> Item {
  @@
     Int::abs(-n)
   }
   
  -impl Worker for Int with run(self, delta) {
  +impl Worker for Int with run_renamed(self, delta) {
     self + delta
   }
   
   pub fn demo_call(x : Int) -> Int {
     let item = make_item(default_item)
  -  let worker_value = Worker::run(x, item)
  +  let worker_value = Worker::run_renamed(x, item)
     worker_value + use_features()
   }
  *** End Patch
  
  $ moon ide rename 'demo_call' demo_call_renamed
  *** Begin Patch
  *** Update File: $TESTCASE_ROOT/sample.mbt
  @@
     self + delta
   }
   
  -pub fn demo_call(x : Int) -> Int {
  +pub fn demo_call_renamed(x : Int) -> Int {
     let item = make_item(default_item)
     let worker_value = Worker::run(x, item)
     worker_value + use_features()
  *** Update File: $TESTCASE_ROOT/sample_test.mbt
  @@
   
   ///|
   test "demo_call" {
  -  inspect(demo_call(2), content="6")
  +  inspect(demo_call_renamed(2), content="6")
   }
  *** End Patch
  
