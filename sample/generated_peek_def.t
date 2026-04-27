  $ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
  $ export BUILD_PATH_PREFIX_MAP="\$MOON_HOME=$MOON_HOME:$BUILD_PATH_PREFIX_MAP"
  $ moon ide peek-def Item --loc 'sample.mbt:3:10'
  Error: could not find definition for symbol 'Item' at sample.mbt:3:10
  [1]
  $ moon ide peek-def Worker --loc 'sample.mbt:5:11'
  Definition found at file $TESTCASE_ROOT/sample.mbt
    | ///|
    | /// Sample source used by testgen.
    | pub type Item = Int
    | 
  5 | pub trait Worker {
    | ^
    |   run(Self, Int) -> Int
    | }
    | 
    | pub fn make_item(x : Int) -> Item {
    |   x
    | }
    | 
    | pub let default_item : Item = 1
    | 
    | pub fn use_features() -> Int {
    |   let xs = [1, 2, 3]
    |   let n = xs.length()
    |   Int::abs(-n)
    | }
    | 
    | impl Worker for Int with run(self, delta) {
  $ moon ide peek-def run --loc 'sample.mbt:6:3'
  Definition found at file $TESTCASE_ROOT/sample.mbt
    | ///|
    | /// Sample source used by testgen.
    | pub type Item = Int
    | 
    | pub trait Worker {
  6 |   run(Self, Int) -> Int
    |   ^^^^^^^^^^^^^^^^^^^^^
    | }
    | 
    | pub fn make_item(x : Int) -> Item {
    |   x
    | }
    | 
    | pub let default_item : Item = 1
    | 
    | pub fn use_features() -> Int {
    |   let xs = [1, 2, 3]
    |   let n = xs.length()
    |   Int::abs(-n)
    | }
    | 
  $ moon ide peek-def make_item --loc 'sample.mbt:9:8'
  Definition found at file $TESTCASE_ROOT/sample.mbt
    | 
    | pub trait Worker {
    |   run(Self, Int) -> Int
    | }
    | 
  9 | pub fn make_item(x : Int) -> Item {
    |        ^^^^^^^^^
    |   x
    | }
    | 
    | pub let default_item : Item = 1
    | 
    | pub fn use_features() -> Int {
    |   let xs = [1, 2, 3]
    |   let n = xs.length()
    |   Int::abs(-n)
    | }
    | 
    | impl Worker for Int with run(self, delta) {
    |   self + delta
    | }
  $ moon ide peek-def x --loc 'sample.mbt:9:18'
  Definition found at file $TESTCASE_ROOT/sample.mbt
    | 
    | pub trait Worker {
    |   run(Self, Int) -> Int
    | }
    | 
  9 | pub fn make_item(x : Int) -> Item {
    |                  ^
    |   x
    | }
    | 
    | pub let default_item : Item = 1
    | 
    | pub fn use_features() -> Int {
    |   let xs = [1, 2, 3]
    |   let n = xs.length()
    |   Int::abs(-n)
    | }
    | 
    | impl Worker for Int with run(self, delta) {
    |   self + delta
    | }
  $ moon ide peek-def Item --loc 'sample.mbt:9:30'
  Error: could not find definition for symbol 'Item' at sample.mbt:9:30
  [1]
  $ moon ide peek-def x --loc 'sample.mbt:10:3'
  Definition found at file $TESTCASE_ROOT/sample.mbt
    | 
    | pub trait Worker {
    |   run(Self, Int) -> Int
    | }
    | 
  9 | pub fn make_item(x : Int) -> Item {
    |                  ^
    |   x
    | }
    | 
    | pub let default_item : Item = 1
    | 
    | pub fn use_features() -> Int {
    |   let xs = [1, 2, 3]
    |   let n = xs.length()
    |   Int::abs(-n)
    | }
    | 
    | impl Worker for Int with run(self, delta) {
    |   self + delta
    | }
  $ moon ide peek-def default_item --loc 'sample.mbt:13:9'
  Definition found at file $TESTCASE_ROOT/sample.mbt
     | 
     | pub fn make_item(x : Int) -> Item {
     |   x
     | }
     | 
  13 | pub let default_item : Item = 1
     |         ^^^^^^^^^^^^
     | 
     | pub fn use_features() -> Int {
     |   let xs = [1, 2, 3]
     |   let n = xs.length()
     |   Int::abs(-n)
     | }
     | 
     | impl Worker for Int with run(self, delta) {
     |   self + delta
     | }
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
  $ moon ide peek-def Item --loc 'sample.mbt:13:24'
  Error: could not find definition for symbol 'Item' at sample.mbt:13:24
  [1]
  $ moon ide peek-def use_features --loc 'sample.mbt:15:8'
  Definition found at file $TESTCASE_ROOT/sample.mbt
     |   x
     | }
     | 
     | pub let default_item : Item = 1
     | 
  15 | pub fn use_features() -> Int {
     |        ^^^^^^^^^^^^
     |   let xs = [1, 2, 3]
     |   let n = xs.length()
     |   Int::abs(-n)
     | }
     | 
     | impl Worker for Int with run(self, delta) {
     |   self + delta
     | }
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
     |   worker_value + use_features()
     | }
  $ moon ide peek-def xs --loc 'sample.mbt:16:7'
  Definition found at file $TESTCASE_ROOT/sample.mbt
     | }
     | 
     | pub let default_item : Item = 1
     | 
     | pub fn use_features() -> Int {
  16 |   let xs = [1, 2, 3]
     |       ^^
     |   let n = xs.length()
     |   Int::abs(-n)
     | }
     | 
     | impl Worker for Int with run(self, delta) {
     |   self + delta
     | }
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
     |   worker_value + use_features()
     | }
  $ moon ide peek-def n --loc 'sample.mbt:17:7'
  Definition found at file $TESTCASE_ROOT/sample.mbt
     | 
     | pub let default_item : Item = 1
     | 
     | pub fn use_features() -> Int {
     |   let xs = [1, 2, 3]
  17 |   let n = xs.length()
     |       ^
     |   Int::abs(-n)
     | }
     | 
     | impl Worker for Int with run(self, delta) {
     |   self + delta
     | }
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
     |   worker_value + use_features()
     | }
  $ moon ide peek-def length --loc 'sample.mbt:17:14'
  Definition found at file $MOON_HOME/lib/core/builtin/arraycore_nonjs.mbt
     | ///   let empty : Array[Int] = []
     | ///   inspect(empty.length(), content="0")
     | /// }
     | /// ```
     | #intrinsic("%array.length")
  81 | pub fn[T] Array::length(self : Array[T]) -> Int {
     |                  ^^^^^^
     |   self.len
     | }
     | 
     | ///|
     | /// Truncates the array to the specified length. This function is marked as
     | /// `unsafe` because it directly manipulates the internal buffer of the array,
     | /// which can lead to undefined behavior if not used carefully.
     | ///
     | /// # Parameters
     | ///
     | /// - `self` : The array to be truncated.
     | /// - `new_len` : The new length to which the array should be truncated. Must be
     | /// less than or equal to the current length of the array.
     | ///
  $ moon ide peek-def xs --loc 'sample.mbt:17:11'
  Definition found at file $TESTCASE_ROOT/sample.mbt
     | }
     | 
     | pub let default_item : Item = 1
     | 
     | pub fn use_features() -> Int {
  16 |   let xs = [1, 2, 3]
     |       ^^
     |   let n = xs.length()
     |   Int::abs(-n)
     | }
     | 
     | impl Worker for Int with run(self, delta) {
     |   self + delta
     | }
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
     |   worker_value + use_features()
     | }
  $ moon ide peek-def abs --loc 'sample.mbt:18:8'
  Definition found at file $MOON_HOME/lib/core/builtin/int.mbt
      | ///   inspect(Int::abs(42), content="42")
      | ///   inspect(Int::abs(-42), content="42")
      | ///   inspect(Int::abs(0), content="0")
      | /// }
      | /// ```
  176 | pub fn Int::abs(self : Int) -> Int {
      |             ^^^
      |   if self < 0 {
      |     -self
      |   } else {
      |     self
      |   }
      | }
  $ moon ide peek-def n --loc 'sample.mbt:18:13'
  Definition found at file $TESTCASE_ROOT/sample.mbt
     | 
     | pub let default_item : Item = 1
     | 
     | pub fn use_features() -> Int {
     |   let xs = [1, 2, 3]
  17 |   let n = xs.length()
     |       ^
     |   Int::abs(-n)
     | }
     | 
     | impl Worker for Int with run(self, delta) {
     |   self + delta
     | }
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
     |   worker_value + use_features()
     | }
  $ moon ide peek-def Worker --loc 'sample.mbt:21:6'
  Definition found at file $TESTCASE_ROOT/sample.mbt
    | ///|
    | /// Sample source used by testgen.
    | pub type Item = Int
    | 
  5 | pub trait Worker {
    | ^
    |   run(Self, Int) -> Int
    | }
    | 
    | pub fn make_item(x : Int) -> Item {
    |   x
    | }
    | 
    | pub let default_item : Item = 1
    | 
    | pub fn use_features() -> Int {
    |   let xs = [1, 2, 3]
    |   let n = xs.length()
    |   Int::abs(-n)
    | }
    | 
    | impl Worker for Int with run(self, delta) {
  $ moon ide peek-def run --loc 'sample.mbt:21:26'
  Definition found at file $TESTCASE_ROOT/sample.mbt
     |   let xs = [1, 2, 3]
     |   let n = xs.length()
     |   Int::abs(-n)
     | }
     | 
  21 | impl Worker for Int with run(self, delta) {
     |                          ^^^
     |   self + delta
     | }
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
     |   worker_value + use_features()
     | }
  $ moon ide peek-def self --loc 'sample.mbt:21:30'
  Definition found at file $TESTCASE_ROOT/sample.mbt
     |   let xs = [1, 2, 3]
     |   let n = xs.length()
     |   Int::abs(-n)
     | }
     | 
  21 | impl Worker for Int with run(self, delta) {
     |                              ^^^^
     |   self + delta
     | }
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
     |   worker_value + use_features()
     | }
  $ moon ide peek-def delta --loc 'sample.mbt:21:36'
  Definition found at file $TESTCASE_ROOT/sample.mbt
     |   let xs = [1, 2, 3]
     |   let n = xs.length()
     |   Int::abs(-n)
     | }
     | 
  21 | impl Worker for Int with run(self, delta) {
     |                                    ^^^^^
     |   self + delta
     | }
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
     |   worker_value + use_features()
     | }
  $ moon ide peek-def self --loc 'sample.mbt:22:3'
  Definition found at file $TESTCASE_ROOT/sample.mbt
     |   let xs = [1, 2, 3]
     |   let n = xs.length()
     |   Int::abs(-n)
     | }
     | 
  21 | impl Worker for Int with run(self, delta) {
     |                              ^^^^
     |   self + delta
     | }
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
     |   worker_value + use_features()
     | }
  $ moon ide peek-def delta --loc 'sample.mbt:22:10'
  Definition found at file $TESTCASE_ROOT/sample.mbt
     |   let xs = [1, 2, 3]
     |   let n = xs.length()
     |   Int::abs(-n)
     | }
     | 
  21 | impl Worker for Int with run(self, delta) {
     |                                    ^^^^^
     |   self + delta
     | }
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
     |   worker_value + use_features()
     | }
  $ moon ide peek-def demo_call --loc 'sample.mbt:25:8'
  Definition found at file $TESTCASE_ROOT/sample.mbt
     | 
     | impl Worker for Int with run(self, delta) {
     |   self + delta
     | }
     | 
  25 | pub fn demo_call(x : Int) -> Int {
     |        ^^^^^^^^^
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
     |   worker_value + use_features()
     | }
  $ moon ide peek-def x --loc 'sample.mbt:25:18'
  Definition found at file $TESTCASE_ROOT/sample.mbt
     | 
     | impl Worker for Int with run(self, delta) {
     |   self + delta
     | }
     | 
  25 | pub fn demo_call(x : Int) -> Int {
     |                  ^
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
     |   worker_value + use_features()
     | }
  $ moon ide peek-def item --loc 'sample.mbt:26:7'
  Definition found at file $TESTCASE_ROOT/sample.mbt
     | impl Worker for Int with run(self, delta) {
     |   self + delta
     | }
     | 
     | pub fn demo_call(x : Int) -> Int {
  26 |   let item = make_item(default_item)
     |       ^^^^
     |   let worker_value = Worker::run(x, item)
     |   worker_value + use_features()
     | }
  $ moon ide peek-def make_item --loc 'sample.mbt:26:14'
  Definition found at file $TESTCASE_ROOT/sample.mbt
    | 
    | pub trait Worker {
    |   run(Self, Int) -> Int
    | }
    | 
  9 | pub fn make_item(x : Int) -> Item {
    |        ^^^^^^^^^
    |   x
    | }
    | 
    | pub let default_item : Item = 1
    | 
    | pub fn use_features() -> Int {
    |   let xs = [1, 2, 3]
    |   let n = xs.length()
    |   Int::abs(-n)
    | }
    | 
    | impl Worker for Int with run(self, delta) {
    |   self + delta
    | }
  $ moon ide peek-def default_item --loc 'sample.mbt:26:24'
  Definition found at file $TESTCASE_ROOT/sample.mbt
     | 
     | pub fn make_item(x : Int) -> Item {
     |   x
     | }
     | 
  13 | pub let default_item : Item = 1
     |         ^^^^^^^^^^^^
     | 
     | pub fn use_features() -> Int {
     |   let xs = [1, 2, 3]
     |   let n = xs.length()
     |   Int::abs(-n)
     | }
     | 
     | impl Worker for Int with run(self, delta) {
     |   self + delta
     | }
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
  $ moon ide peek-def worker_value --loc 'sample.mbt:27:7'
  Definition found at file $TESTCASE_ROOT/sample.mbt
     |   self + delta
     | }
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
  27 |   let worker_value = Worker::run(x, item)
     |       ^^^^^^^^^^^^
     |   worker_value + use_features()
     | }
  $ moon ide peek-def Worker --loc 'sample.mbt:27:22'
  Definition found at file $TESTCASE_ROOT/sample.mbt
    | ///|
    | /// Sample source used by testgen.
    | pub type Item = Int
    | 
  5 | pub trait Worker {
    | ^
    |   run(Self, Int) -> Int
    | }
    | 
    | pub fn make_item(x : Int) -> Item {
    |   x
    | }
    | 
    | pub let default_item : Item = 1
    | 
    | pub fn use_features() -> Int {
    |   let xs = [1, 2, 3]
    |   let n = xs.length()
    |   Int::abs(-n)
    | }
    | 
    | impl Worker for Int with run(self, delta) {
  $ moon ide peek-def run --loc 'sample.mbt:27:30'
  Definition found at file $TESTCASE_ROOT/sample.mbt
     |   let xs = [1, 2, 3]
     |   let n = xs.length()
     |   Int::abs(-n)
     | }
     | 
  21 | impl Worker for Int with run(self, delta) {
     |                          ^^^
     |   self + delta
     | }
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
     |   worker_value + use_features()
     | }
  $ moon ide peek-def x --loc 'sample.mbt:27:34'
  Definition found at file $TESTCASE_ROOT/sample.mbt
     | 
     | impl Worker for Int with run(self, delta) {
     |   self + delta
     | }
     | 
  25 | pub fn demo_call(x : Int) -> Int {
     |                  ^
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
     |   worker_value + use_features()
     | }
  $ moon ide peek-def item --loc 'sample.mbt:27:37'
  Definition found at file $TESTCASE_ROOT/sample.mbt
     | impl Worker for Int with run(self, delta) {
     |   self + delta
     | }
     | 
     | pub fn demo_call(x : Int) -> Int {
  26 |   let item = make_item(default_item)
     |       ^^^^
     |   let worker_value = Worker::run(x, item)
     |   worker_value + use_features()
     | }
  $ moon ide peek-def worker_value --loc 'sample.mbt:28:3'
  Definition found at file $TESTCASE_ROOT/sample.mbt
     |   self + delta
     | }
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
  27 |   let worker_value = Worker::run(x, item)
     |       ^^^^^^^^^^^^
     |   worker_value + use_features()
     | }
  $ moon ide peek-def use_features --loc 'sample.mbt:28:18'
  Definition found at file $TESTCASE_ROOT/sample.mbt
     |   x
     | }
     | 
     | pub let default_item : Item = 1
     | 
  15 | pub fn use_features() -> Int {
     |        ^^^^^^^^^^^^
     |   let xs = [1, 2, 3]
     |   let n = xs.length()
     |   Int::abs(-n)
     | }
     | 
     | impl Worker for Int with run(self, delta) {
     |   self + delta
     | }
     | 
     | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
     |   worker_value + use_features()
     | }
  $ moon ide peek-def demo_call --loc 'sample_test.mbt:7:11'
  Definition found at file $TESTCASE_ROOT/sample.mbt
     | 
     | impl Worker for Int with run(self, delta) {
     |   self + delta
     | }
     | 
  25 | pub fn demo_call(x : Int) -> Int {
     |        ^^^^^^^^^
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
     |   worker_value + use_features()
     | }
  $ moon ide peek-def 'Item'
  Found 1 symbols matching 'Item':
  
  `pub type alias Item` in package bzy-debug/sample at $TESTCASE_ROOT/sample.mbt:1-3
  1 | ///|
    | /// Sample source used by testgen.
    | pub type Item = Int
  $ moon ide peek-def 'Worker'
  Found 1 symbols matching 'Worker':
  
  `pub trait Worker` in package bzy-debug/sample at $TESTCASE_ROOT/sample.mbt:5-7
  5 | pub trait Worker {
    |   run(Self, Int) -> Int
    | }
  $ moon ide peek-def 'make_item'
  Found 1 symbols matching 'make_item':
  
  `pub fn make_item` in package bzy-debug/sample at $TESTCASE_ROOT/sample.mbt:9-11
  9 | pub fn make_item(x : Int) -> Item {
    |   x
    | }
  $ moon ide peek-def 'default_item'
  Found 1 symbols matching 'default_item':
  
  `pub let default_item` in package bzy-debug/sample at $TESTCASE_ROOT/sample.mbt:13-13
  13 | pub let default_item : Item = 1
  $ moon ide peek-def 'use_features'
  Found 1 symbols matching 'use_features':
  
  `pub fn use_features` in package bzy-debug/sample at $TESTCASE_ROOT/sample.mbt:15-19
  15 | pub fn use_features() -> Int {
     |   let xs = [1, 2, 3]
     |   let n = xs.length()
     |   Int::abs(-n)
     | }
  $ moon ide peek-def 'Worker::run for Int'
  Found 1 symbols matching 'Worker::run for Int':
  
  `impl Worker::run for Int` in package bzy-debug/sample at $TESTCASE_ROOT/sample.mbt:21-23
  21 | impl Worker for Int with run(self, delta) {
     |   self + delta
     | }
  $ moon ide peek-def 'demo_call'
  Found 1 symbols matching 'demo_call':
  
  `pub fn demo_call` in package bzy-debug/sample at $TESTCASE_ROOT/sample.mbt:25-29
  25 | pub fn demo_call(x : Int) -> Int {
     |   let item = make_item(default_item)
     |   let worker_value = Worker::run(x, item)
     |   worker_value + use_features()
     | }
