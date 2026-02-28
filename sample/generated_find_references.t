  $ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
  $ export BUILD_PATH_PREFIX_MAP="\$MOON_HOME=$MOON_HOME:$BUILD_PATH_PREFIX_MAP"
  $ moon ide find-references Item --loc 'sample.mbt:3:10'
  Error: could not find references for symbol 'Item' at sample.mbt:3:10
  [1]
  $ moon ide find-references Worker --loc 'sample.mbt:5:11'
  Found 3 references for symbol 'Worker':
  $TESTCASE_ROOT/sample.mbt:5:11-5:17:
    | /// Sample source used by testgen.
    | pub type Item = Int
    | 
  5 | pub trait Worker {
    |           ^^^^^^
    |   run(Self, Int) -> Int
    | }
  
  $TESTCASE_ROOT/sample.mbt:21:6-21:12:
     |   Int::abs(-n)
     | }
     | 
  21 | impl Worker for Int with run(self, delta) {
     |      ^^^^^^
     |   self + delta
     | }
  
  $TESTCASE_ROOT/sample.mbt:27:22-27:28:
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
  27 |   let worker_value = Worker::run(x, item)
     |                      ^^^^^^
     |   worker_value + use_features()
     | }
  
  $ moon ide find-references run --loc 'sample.mbt:6:3'
  Found 3 references for symbol 'run':
  $TESTCASE_ROOT/sample.mbt:6:3-6:6:
    | pub type Item = Int
    | 
    | pub trait Worker {
  6 |   run(Self, Int) -> Int
    |   ^^^
    | }
    | 
  
  $TESTCASE_ROOT/sample.mbt:21:26-21:29:
     |   Int::abs(-n)
     | }
     | 
  21 | impl Worker for Int with run(self, delta) {
     |                          ^^^
     |   self + delta
     | }
  
  $TESTCASE_ROOT/sample.mbt:27:30-27:33:
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
  27 |   let worker_value = Worker::run(x, item)
     |                              ^^^
     |   worker_value + use_features()
     | }
  
  $ moon ide find-references make_item --loc 'sample.mbt:9:8'
  Found 2 references for symbol 'make_item':
  $TESTCASE_ROOT/sample.mbt:9:8-9:17:
    |   run(Self, Int) -> Int
    | }
    | 
  9 | pub fn make_item(x : Int) -> Item {
    |        ^^^^^^^^^
    |   x
    | }
  
  $TESTCASE_ROOT/sample.mbt:26:14-26:23:
     | }
     | 
     | pub fn demo_call(x : Int) -> Int {
  26 |   let item = make_item(default_item)
     |              ^^^^^^^^^
     |   let worker_value = Worker::run(x, item)
     |   worker_value + use_features()
  
  $ moon ide find-references x --loc 'sample.mbt:9:18'
  Found 2 references for symbol 'x':
  $TESTCASE_ROOT/sample.mbt:9:18-9:19:
    |   run(Self, Int) -> Int
    | }
    | 
  9 | pub fn make_item(x : Int) -> Item {
    |                  ^
    |   x
    | }
  
  $TESTCASE_ROOT/sample.mbt:10:3-10:4:
     | }
     | 
     | pub fn make_item(x : Int) -> Item {
  10 |   x
     |   ^
     | }
     | 
  
  $ moon ide find-references Item --loc 'sample.mbt:9:30'
  Error: could not find references for symbol 'Item' at sample.mbt:9:30
  [1]
  $ moon ide find-references x --loc 'sample.mbt:10:3'
  Found 2 references for symbol 'x':
  $TESTCASE_ROOT/sample.mbt:9:18-9:19:
    |   run(Self, Int) -> Int
    | }
    | 
  9 | pub fn make_item(x : Int) -> Item {
    |                  ^
    |   x
    | }
  
  $TESTCASE_ROOT/sample.mbt:10:3-10:4:
     | }
     | 
     | pub fn make_item(x : Int) -> Item {
  10 |   x
     |   ^
     | }
     | 
  
  $ moon ide find-references default_item --loc 'sample.mbt:13:9'
  Found 2 references for symbol 'default_item':
  $TESTCASE_ROOT/sample.mbt:13:9-13:21:
     |   x
     | }
     | 
  13 | pub let default_item : Item = 1
     |         ^^^^^^^^^^^^
     | 
     | pub fn use_features() -> Int {
  
  $TESTCASE_ROOT/sample.mbt:26:24-26:36:
     | }
     | 
     | pub fn demo_call(x : Int) -> Int {
  26 |   let item = make_item(default_item)
     |                        ^^^^^^^^^^^^
     |   let worker_value = Worker::run(x, item)
     |   worker_value + use_features()
  
  $ moon ide find-references Item --loc 'sample.mbt:13:24'
  Error: could not find references for symbol 'Item' at sample.mbt:13:24
  [1]
  $ moon ide find-references use_features --loc 'sample.mbt:15:8'
  Found 2 references for symbol 'use_features':
  $TESTCASE_ROOT/sample.mbt:15:8-15:20:
     | 
     | pub let default_item : Item = 1
     | 
  15 | pub fn use_features() -> Int {
     |        ^^^^^^^^^^^^
     |   let xs = [1, 2, 3]
     |   let n = xs.length()
  
  $TESTCASE_ROOT/sample.mbt:28:18-28:30:
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
  28 |   worker_value + use_features()
     |                  ^^^^^^^^^^^^
     | }
  
  $ moon ide find-references xs --loc 'sample.mbt:16:7'
  Found 2 references for symbol 'xs':
  $TESTCASE_ROOT/sample.mbt:16:7-16:9:
     | pub let default_item : Item = 1
     | 
     | pub fn use_features() -> Int {
  16 |   let xs = [1, 2, 3]
     |       ^^
     |   let n = xs.length()
     |   Int::abs(-n)
  
  $TESTCASE_ROOT/sample.mbt:17:11-17:13:
     | 
     | pub fn use_features() -> Int {
     |   let xs = [1, 2, 3]
  17 |   let n = xs.length()
     |           ^^
     |   Int::abs(-n)
     | }
  
  $ moon ide find-references n --loc 'sample.mbt:17:7'
  Found 2 references for symbol 'n':
  $TESTCASE_ROOT/sample.mbt:17:7-17:8:
     | 
     | pub fn use_features() -> Int {
     |   let xs = [1, 2, 3]
  17 |   let n = xs.length()
     |       ^
     |   Int::abs(-n)
     | }
  
  $TESTCASE_ROOT/sample.mbt:18:13-18:14:
     | pub fn use_features() -> Int {
     |   let xs = [1, 2, 3]
     |   let n = xs.length()
  18 |   Int::abs(-n)
     |             ^
     | }
     | 
  
  $ moon ide find-references length --loc 'sample.mbt:17:14'
  Found 2 references for symbol 'length':
  $MOON_HOME/lib/core/builtin/arraycore_nonjs.mbt:81:18-81:24:
     | /// }
     | /// ```
     | #intrinsic("%array.length")
  81 | pub fn[T] Array::length(self : Array[T]) -> Int {
     |                  ^^^^^^
     |   self.len
     | }
  
  $TESTCASE_ROOT/sample.mbt:17:14-17:20:
     | 
     | pub fn use_features() -> Int {
     |   let xs = [1, 2, 3]
  17 |   let n = xs.length()
     |              ^^^^^^
     |   Int::abs(-n)
     | }
  
  $ moon ide find-references xs --loc 'sample.mbt:17:11'
  Found 2 references for symbol 'xs':
  $TESTCASE_ROOT/sample.mbt:16:7-16:9:
     | pub let default_item : Item = 1
     | 
     | pub fn use_features() -> Int {
  16 |   let xs = [1, 2, 3]
     |       ^^
     |   let n = xs.length()
     |   Int::abs(-n)
  
  $TESTCASE_ROOT/sample.mbt:17:11-17:13:
     | 
     | pub fn use_features() -> Int {
     |   let xs = [1, 2, 3]
  17 |   let n = xs.length()
     |           ^^
     |   Int::abs(-n)
     | }
  
  $ moon ide find-references abs --loc 'sample.mbt:18:8'
  Found 2 references for symbol 'abs':
  $MOON_HOME/lib/core/builtin/int.mbt:176:13-176:16:
      | ///   inspect(Int::abs(0), content="0")
      | /// }
      | /// ```
  176 | pub fn Int::abs(self : Int) -> Int {
      |             ^^^
      |   if self < 0 {
      |     -self
  
  $TESTCASE_ROOT/sample.mbt:18:8-18:11:
     | pub fn use_features() -> Int {
     |   let xs = [1, 2, 3]
     |   let n = xs.length()
  18 |   Int::abs(-n)
     |        ^^^
     | }
     | 
  
  $ moon ide find-references n --loc 'sample.mbt:18:13'
  Found 2 references for symbol 'n':
  $TESTCASE_ROOT/sample.mbt:17:7-17:8:
     | 
     | pub fn use_features() -> Int {
     |   let xs = [1, 2, 3]
  17 |   let n = xs.length()
     |       ^
     |   Int::abs(-n)
     | }
  
  $TESTCASE_ROOT/sample.mbt:18:13-18:14:
     | pub fn use_features() -> Int {
     |   let xs = [1, 2, 3]
     |   let n = xs.length()
  18 |   Int::abs(-n)
     |             ^
     | }
     | 
  
  $ moon ide find-references Worker --loc 'sample.mbt:21:6'
  Found 3 references for symbol 'Worker':
  $TESTCASE_ROOT/sample.mbt:5:11-5:17:
    | /// Sample source used by testgen.
    | pub type Item = Int
    | 
  5 | pub trait Worker {
    |           ^^^^^^
    |   run(Self, Int) -> Int
    | }
  
  $TESTCASE_ROOT/sample.mbt:21:6-21:12:
     |   Int::abs(-n)
     | }
     | 
  21 | impl Worker for Int with run(self, delta) {
     |      ^^^^^^
     |   self + delta
     | }
  
  $TESTCASE_ROOT/sample.mbt:27:22-27:28:
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
  27 |   let worker_value = Worker::run(x, item)
     |                      ^^^^^^
     |   worker_value + use_features()
     | }
  
  $ moon ide find-references run --loc 'sample.mbt:21:26'
  Found 2 references for symbol 'run':
  $TESTCASE_ROOT/sample.mbt:21:26-21:29:
     |   Int::abs(-n)
     | }
     | 
  21 | impl Worker for Int with run(self, delta) {
     |                          ^^^
     |   self + delta
     | }
  
  $TESTCASE_ROOT/sample.mbt:27:22-27:33:
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
  27 |   let worker_value = Worker::run(x, item)
     |                      ^^^^^^^^^^^
     |   worker_value + use_features()
     | }
  
  $ moon ide find-references self --loc 'sample.mbt:21:30'
  Found 2 references for symbol 'self':
  $TESTCASE_ROOT/sample.mbt:21:30-21:34:
     |   Int::abs(-n)
     | }
     | 
  21 | impl Worker for Int with run(self, delta) {
     |                              ^^^^
     |   self + delta
     | }
  
  $TESTCASE_ROOT/sample.mbt:22:3-22:7:
     | }
     | 
     | impl Worker for Int with run(self, delta) {
  22 |   self + delta
     |   ^^^^
     | }
     | 
  
  $ moon ide find-references delta --loc 'sample.mbt:21:36'
  Found 2 references for symbol 'delta':
  $TESTCASE_ROOT/sample.mbt:21:36-21:41:
     |   Int::abs(-n)
     | }
     | 
  21 | impl Worker for Int with run(self, delta) {
     |                                    ^^^^^
     |   self + delta
     | }
  
  $TESTCASE_ROOT/sample.mbt:22:10-22:15:
     | }
     | 
     | impl Worker for Int with run(self, delta) {
  22 |   self + delta
     |          ^^^^^
     | }
     | 
  
  $ moon ide find-references self --loc 'sample.mbt:22:3'
  Found 2 references for symbol 'self':
  $TESTCASE_ROOT/sample.mbt:21:30-21:34:
     |   Int::abs(-n)
     | }
     | 
  21 | impl Worker for Int with run(self, delta) {
     |                              ^^^^
     |   self + delta
     | }
  
  $TESTCASE_ROOT/sample.mbt:22:3-22:7:
     | }
     | 
     | impl Worker for Int with run(self, delta) {
  22 |   self + delta
     |   ^^^^
     | }
     | 
  
  $ moon ide find-references delta --loc 'sample.mbt:22:10'
  Found 2 references for symbol 'delta':
  $TESTCASE_ROOT/sample.mbt:21:36-21:41:
     |   Int::abs(-n)
     | }
     | 
  21 | impl Worker for Int with run(self, delta) {
     |                                    ^^^^^
     |   self + delta
     | }
  
  $TESTCASE_ROOT/sample.mbt:22:10-22:15:
     | }
     | 
     | impl Worker for Int with run(self, delta) {
  22 |   self + delta
     |          ^^^^^
     | }
     | 
  
  $ moon ide find-references demo_call --loc 'sample.mbt:25:8'
  Found 2 references for symbol 'demo_call':
  $TESTCASE_ROOT/sample.mbt:25:8-25:17:
     |   self + delta
     | }
     | 
  25 | pub fn demo_call(x : Int) -> Int {
     |        ^^^^^^^^^
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
  
  $TESTCASE_ROOT/sample_test.mbt:7:11-7:20:
    | 
    | ///|
    | test "demo_call" {
  7 |   inspect(demo_call(2), content="6")
    |           ^^^^^^^^^
    | }
  
  $ moon ide find-references x --loc 'sample.mbt:25:18'
  Found 2 references for symbol 'x':
  $TESTCASE_ROOT/sample.mbt:25:18-25:19:
     |   self + delta
     | }
     | 
  25 | pub fn demo_call(x : Int) -> Int {
     |                  ^
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
  
  $TESTCASE_ROOT/sample.mbt:27:34-27:35:
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
  27 |   let worker_value = Worker::run(x, item)
     |                                  ^
     |   worker_value + use_features()
     | }
  
  $ moon ide find-references item --loc 'sample.mbt:26:7'
  Found 2 references for symbol 'item':
  $TESTCASE_ROOT/sample.mbt:26:7-26:11:
     | }
     | 
     | pub fn demo_call(x : Int) -> Int {
  26 |   let item = make_item(default_item)
     |       ^^^^
     |   let worker_value = Worker::run(x, item)
     |   worker_value + use_features()
  
  $TESTCASE_ROOT/sample.mbt:27:37-27:41:
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
  27 |   let worker_value = Worker::run(x, item)
     |                                     ^^^^
     |   worker_value + use_features()
     | }
  
  $ moon ide find-references make_item --loc 'sample.mbt:26:14'
  Found 2 references for symbol 'make_item':
  $TESTCASE_ROOT/sample.mbt:9:8-9:17:
    |   run(Self, Int) -> Int
    | }
    | 
  9 | pub fn make_item(x : Int) -> Item {
    |        ^^^^^^^^^
    |   x
    | }
  
  $TESTCASE_ROOT/sample.mbt:26:14-26:23:
     | }
     | 
     | pub fn demo_call(x : Int) -> Int {
  26 |   let item = make_item(default_item)
     |              ^^^^^^^^^
     |   let worker_value = Worker::run(x, item)
     |   worker_value + use_features()
  
  $ moon ide find-references default_item --loc 'sample.mbt:26:24'
  Found 2 references for symbol 'default_item':
  $TESTCASE_ROOT/sample.mbt:13:9-13:21:
     |   x
     | }
     | 
  13 | pub let default_item : Item = 1
     |         ^^^^^^^^^^^^
     | 
     | pub fn use_features() -> Int {
  
  $TESTCASE_ROOT/sample.mbt:26:24-26:36:
     | }
     | 
     | pub fn demo_call(x : Int) -> Int {
  26 |   let item = make_item(default_item)
     |                        ^^^^^^^^^^^^
     |   let worker_value = Worker::run(x, item)
     |   worker_value + use_features()
  
  $ moon ide find-references worker_value --loc 'sample.mbt:27:7'
  Found 2 references for symbol 'worker_value':
  $TESTCASE_ROOT/sample.mbt:27:7-27:19:
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
  27 |   let worker_value = Worker::run(x, item)
     |       ^^^^^^^^^^^^
     |   worker_value + use_features()
     | }
  
  $TESTCASE_ROOT/sample.mbt:28:3-28:15:
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
  28 |   worker_value + use_features()
     |   ^^^^^^^^^^^^
     | }
  
  $ moon ide find-references Worker --loc 'sample.mbt:27:22'
  Found 3 references for symbol 'Worker':
  $TESTCASE_ROOT/sample.mbt:5:11-5:17:
    | /// Sample source used by testgen.
    | pub type Item = Int
    | 
  5 | pub trait Worker {
    |           ^^^^^^
    |   run(Self, Int) -> Int
    | }
  
  $TESTCASE_ROOT/sample.mbt:21:6-21:12:
     |   Int::abs(-n)
     | }
     | 
  21 | impl Worker for Int with run(self, delta) {
     |      ^^^^^^
     |   self + delta
     | }
  
  $TESTCASE_ROOT/sample.mbt:27:22-27:28:
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
  27 |   let worker_value = Worker::run(x, item)
     |                      ^^^^^^
     |   worker_value + use_features()
     | }
  
  $ moon ide find-references run --loc 'sample.mbt:27:30'
  Found 2 references for symbol 'run':
  $TESTCASE_ROOT/sample.mbt:21:26-21:29:
     |   Int::abs(-n)
     | }
     | 
  21 | impl Worker for Int with run(self, delta) {
     |                          ^^^
     |   self + delta
     | }
  
  $TESTCASE_ROOT/sample.mbt:27:22-27:33:
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
  27 |   let worker_value = Worker::run(x, item)
     |                      ^^^^^^^^^^^
     |   worker_value + use_features()
     | }
  
  $ moon ide find-references x --loc 'sample.mbt:27:34'
  Found 2 references for symbol 'x':
  $TESTCASE_ROOT/sample.mbt:25:18-25:19:
     |   self + delta
     | }
     | 
  25 | pub fn demo_call(x : Int) -> Int {
     |                  ^
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
  
  $TESTCASE_ROOT/sample.mbt:27:34-27:35:
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
  27 |   let worker_value = Worker::run(x, item)
     |                                  ^
     |   worker_value + use_features()
     | }
  
  $ moon ide find-references item --loc 'sample.mbt:27:37'
  Found 2 references for symbol 'item':
  $TESTCASE_ROOT/sample.mbt:26:7-26:11:
     | }
     | 
     | pub fn demo_call(x : Int) -> Int {
  26 |   let item = make_item(default_item)
     |       ^^^^
     |   let worker_value = Worker::run(x, item)
     |   worker_value + use_features()
  
  $TESTCASE_ROOT/sample.mbt:27:37-27:41:
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
  27 |   let worker_value = Worker::run(x, item)
     |                                     ^^^^
     |   worker_value + use_features()
     | }
  
  $ moon ide find-references worker_value --loc 'sample.mbt:28:3'
  Found 2 references for symbol 'worker_value':
  $TESTCASE_ROOT/sample.mbt:27:7-27:19:
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
  27 |   let worker_value = Worker::run(x, item)
     |       ^^^^^^^^^^^^
     |   worker_value + use_features()
     | }
  
  $TESTCASE_ROOT/sample.mbt:28:3-28:15:
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
  28 |   worker_value + use_features()
     |   ^^^^^^^^^^^^
     | }
  
  $ moon ide find-references use_features --loc 'sample.mbt:28:18'
  Found 2 references for symbol 'use_features':
  $TESTCASE_ROOT/sample.mbt:15:8-15:20:
     | 
     | pub let default_item : Item = 1
     | 
  15 | pub fn use_features() -> Int {
     |        ^^^^^^^^^^^^
     |   let xs = [1, 2, 3]
     |   let n = xs.length()
  
  $TESTCASE_ROOT/sample.mbt:28:18-28:30:
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
  28 |   worker_value + use_features()
     |                  ^^^^^^^^^^^^
     | }
  
  $ moon ide find-references demo_call --loc 'sample_test.mbt:7:11'
  Found 2 references for symbol 'demo_call':
  $TESTCASE_ROOT/sample.mbt:25:8-25:17:
     |   self + delta
     | }
     | 
  25 | pub fn demo_call(x : Int) -> Int {
     |        ^^^^^^^^^
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
  
  $TESTCASE_ROOT/sample_test.mbt:7:11-7:20:
    | 
    | ///|
    | test "demo_call" {
  7 |   inspect(demo_call(2), content="6")
    |           ^^^^^^^^^
    | }
  
  $ moon ide find-references 'Item'
  `pub type alias Item` in package bzy-debug/sample at $TESTCASE_ROOT/sample.mbt:1-3
  1 | ///|
    | /// Sample source used by testgen.
    | pub type Item = Int
  
  Found 0 references for symbol 'Item':
  $ moon ide find-references 'Worker'
  `pub trait Worker` in package bzy-debug/sample at $TESTCASE_ROOT/sample.mbt:5-7
  5 | pub trait Worker {
    |   run(Self, Int) -> Int
    | }
  
  Found 3 references for symbol 'Worker':
  $TESTCASE_ROOT/sample.mbt:5:11-5:17:
    | /// Sample source used by testgen.
    | pub type Item = Int
    | 
  5 | pub trait Worker {
    |           ^^^^^^
    |   run(Self, Int) -> Int
    | }
  
  $TESTCASE_ROOT/sample.mbt:21:6-21:12:
     |   Int::abs(-n)
     | }
     | 
  21 | impl Worker for Int with run(self, delta) {
     |      ^^^^^^
     |   self + delta
     | }
  
  $TESTCASE_ROOT/sample.mbt:27:22-27:28:
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
  27 |   let worker_value = Worker::run(x, item)
     |                      ^^^^^^
     |   worker_value + use_features()
     | }
  
  $ moon ide find-references 'make_item'
  `pub fn make_item` in package bzy-debug/sample at $TESTCASE_ROOT/sample.mbt:9-11
  9 | pub fn make_item(x : Int) -> Item {
    |   x
    | }
  
  Found 2 references for symbol 'make_item':
  $TESTCASE_ROOT/sample.mbt:9:8-9:17:
    |   run(Self, Int) -> Int
    | }
    | 
  9 | pub fn make_item(x : Int) -> Item {
    |        ^^^^^^^^^
    |   x
    | }
  
  $TESTCASE_ROOT/sample.mbt:26:14-26:23:
     | }
     | 
     | pub fn demo_call(x : Int) -> Int {
  26 |   let item = make_item(default_item)
     |              ^^^^^^^^^
     |   let worker_value = Worker::run(x, item)
     |   worker_value + use_features()
  
  $ moon ide find-references 'default_item'
  `pub let default_item` in package bzy-debug/sample at $TESTCASE_ROOT/sample.mbt:13-13
  13 | pub let default_item : Item = 1
  
  Found 2 references for symbol 'default_item':
  $TESTCASE_ROOT/sample.mbt:13:9-13:21:
     |   x
     | }
     | 
  13 | pub let default_item : Item = 1
     |         ^^^^^^^^^^^^
     | 
     | pub fn use_features() -> Int {
  
  $TESTCASE_ROOT/sample.mbt:26:24-26:36:
     | }
     | 
     | pub fn demo_call(x : Int) -> Int {
  26 |   let item = make_item(default_item)
     |                        ^^^^^^^^^^^^
     |   let worker_value = Worker::run(x, item)
     |   worker_value + use_features()
  
  $ moon ide find-references 'use_features'
  `pub fn use_features` in package bzy-debug/sample at $TESTCASE_ROOT/sample.mbt:15-19
  15 | pub fn use_features() -> Int {
     |   let xs = [1, 2, 3]
     |   let n = xs.length()
     |   Int::abs(-n)
     | }
  
  Found 2 references for symbol 'use_features':
  $TESTCASE_ROOT/sample.mbt:15:8-15:20:
     | 
     | pub let default_item : Item = 1
     | 
  15 | pub fn use_features() -> Int {
     |        ^^^^^^^^^^^^
     |   let xs = [1, 2, 3]
     |   let n = xs.length()
  
  $TESTCASE_ROOT/sample.mbt:28:18-28:30:
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
  28 |   worker_value + use_features()
     |                  ^^^^^^^^^^^^
     | }
  
  $ moon ide find-references 'Worker::run for Int'
  `impl Worker::run for Int` in package bzy-debug/sample at $TESTCASE_ROOT/sample.mbt:21-23
  21 | impl Worker for Int with run(self, delta) {
     |   self + delta
     | }
  
  Found 2 references for symbol 'Worker::run for Int':
  $TESTCASE_ROOT/sample.mbt:21:26-21:29:
     |   Int::abs(-n)
     | }
     | 
  21 | impl Worker for Int with run(self, delta) {
     |                          ^^^
     |   self + delta
     | }
  
  $TESTCASE_ROOT/sample.mbt:27:22-27:33:
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
  27 |   let worker_value = Worker::run(x, item)
     |                      ^^^^^^^^^^^
     |   worker_value + use_features()
     | }
  
  $ moon ide find-references 'demo_call'
  `pub fn demo_call` in package bzy-debug/sample at $TESTCASE_ROOT/sample.mbt:25-29
  25 | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
     |   worker_value + use_features()
     | }
  
  Found 2 references for symbol 'demo_call':
  $TESTCASE_ROOT/sample.mbt:25:8-25:17:
     |   self + delta
     | }
     | 
  25 | pub fn demo_call(x : Int) -> Int {
     |        ^^^^^^^^^
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
  
  $TESTCASE_ROOT/sample_test.mbt:7:11-7:20:
    | 
    | ///|
    | test "demo_call" {
  7 |   inspect(demo_call(2), content="6")
    |           ^^^^^^^^^
    | }
  
