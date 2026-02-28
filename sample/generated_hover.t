  $ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
  $ export BUILD_PATH_PREFIX_MAP="\$MOON_HOME=$MOON_HOME:$BUILD_PATH_PREFIX_MAP"
  $ moon ide hover Item --loc 'sample.mbt:3:10'
  No hover information found for symbol 'Item' at sample.mbt:3:10
  [1]
  $ moon ide hover Worker --loc 'sample.mbt:5:11'
  /// Sample source used by testgen.
  pub type Item = Int
  
  pub trait Worker {
            ^^^^^^
            ```moonbit
            trait Worker {
              run(Self, Int) -> Int
            }
            ```
    run(Self, Int) -> Int
  }
  $ moon ide hover run --loc 'sample.mbt:6:3'
  pub type Item = Int
  
  pub trait Worker {
    run(Self, Int) -> Int
    ^^^
    ```moonbit
    (Self, Int) -> Int
    ```
  }
  
  $ moon ide hover make_item --loc 'sample.mbt:9:8'
    run(Self, Int) -> Int
  }
  
  pub fn make_item(x : Int) -> Item {
         ^^^^^^^^^
         ```moonbit
         fn make_item(x : Int) -> Int
         ```
    x
  }
  $ moon ide hover x --loc 'sample.mbt:9:18'
    run(Self, Int) -> Int
  }
  
  pub fn make_item(x : Int) -> Item {
                   ^
                   ```moonbit
                   Int
                   ```
    x
  }
  $ moon ide hover Item --loc 'sample.mbt:9:30'
    run(Self, Int) -> Int
  }
  
  pub fn make_item(x : Int) -> Item {
                               ^^^^
                               ```moonbit
                               Int
                               ```
    x
  }
  $ moon ide hover x --loc 'sample.mbt:10:3'
  }
  
  pub fn make_item(x : Int) -> Item {
    x
    ^
    ```moonbit
    Int
    ```
  }
  
  $ moon ide hover default_item --loc 'sample.mbt:13:9'
    x
  }
  
  pub let default_item : Item = 1
          ^^^^^^^^^^^^
          ```moonbit
          Int
          ```
  
  pub fn use_features() -> Int {
  $ moon ide hover Item --loc 'sample.mbt:13:24'
    x
  }
  
  pub let default_item : Item = 1
                         ^^^^
                         ```moonbit
                         Int
                         ```
  
  pub fn use_features() -> Int {
  $ moon ide hover use_features --loc 'sample.mbt:15:8'
  pub let default_item : Item = 1
  
  pub fn use_features() -> Int {
         ^^^^^^^^^^^^
         ```moonbit
         fn use_features() -> Int
         ```
    let xs = [1, 2, 3]
    let n = xs.length()
  $ moon ide hover xs --loc 'sample.mbt:16:7'
  pub let default_item : Item = 1
  
  pub fn use_features() -> Int {
    let xs = [1, 2, 3]
        ^^
        ```moonbit
        Array[Int]
        ```
    let n = xs.length()
    Int::abs(-n)
  $ moon ide hover n --loc 'sample.mbt:17:7'
  pub fn use_features() -> Int {
    let xs = [1, 2, 3]
    let n = xs.length()
        ^
        ```moonbit
        Int
        ```
    Int::abs(-n)
  }
  $ moon ide hover length --loc 'sample.mbt:17:14'
  pub fn use_features() -> Int {
    let xs = [1, 2, 3]
    let n = xs.length()
               ^^^^^^
               ```moonbit
               fn[T] Array::length(self : Array[T]) -> Int
               ```
               ---
               
                Returns the number of elements in the array.
               
                Parameters:
               
                * `array` : The array whose length is to be determined.
               
                Returns the number of elements in the array as an integer.
               
                Example:
               
                ```mbt check
                test {
                  let arr = [1, 2, 3]
                  inspect(arr.length(), content="3")
                  let empty : Array[Int] = []
                  inspect(empty.length(), content="0")
                }
                ```
    Int::abs(-n)
  }
  $ moon ide hover xs --loc 'sample.mbt:17:11'
  pub fn use_features() -> Int {
    let xs = [1, 2, 3]
    let n = xs.length()
            ^^
            ```moonbit
            Array[Int]
            ```
    Int::abs(-n)
  }
  $ moon ide hover abs --loc 'sample.mbt:18:8'
  pub fn use_features() -> Int {
    let xs = [1, 2, 3]
    let n = xs.length()
    Int::abs(-n)
         ^^^
         ```moonbit
         fn Int::abs(self : Int) -> Int
         ```
         ---
         
          Computes the absolute value of an integer.
         
          Parameters:
         
          * `self` : The integer whose absolute value is to be computed.
         
          Returns the absolute value of the integer.
         
          Example:
         
          ```mbt check
          test {
            inspect(Int::abs(42), content="42")
            inspect(Int::abs(-42), content="42")
            inspect(Int::abs(0), content="0")
          }
          ```
  }
  
  $ moon ide hover n --loc 'sample.mbt:18:13'
  pub fn use_features() -> Int {
    let xs = [1, 2, 3]
    let n = xs.length()
    Int::abs(-n)
              ^
              ```moonbit
              Int
              ```
  }
  
  $ moon ide hover Worker --loc 'sample.mbt:21:6'
    Int::abs(-n)
  }
  
  impl Worker for Int with run(self, delta) {
       ^^^^^^
       ```moonbit
       trait Worker {
         run(Self, Int) -> Int
       }
       ```
    self + delta
  }
  $ moon ide hover run --loc 'sample.mbt:21:26'
    Int::abs(-n)
  }
  
  impl Worker for Int with run(self, delta) {
                           ^^^
                           ```moonbit
                           fn Worker::run(self : Int, delta : Int) -> Int
                           ```
    self + delta
  }
  $ moon ide hover self --loc 'sample.mbt:21:30'
    Int::abs(-n)
  }
  
  impl Worker for Int with run(self, delta) {
                               ^^^^
                               ```moonbit
                               Int
                               ```
    self + delta
  }
  $ moon ide hover delta --loc 'sample.mbt:21:36'
    Int::abs(-n)
  }
  
  impl Worker for Int with run(self, delta) {
                                     ^^^^^
                                     ```moonbit
                                     Int
                                     ```
    self + delta
  }
  $ moon ide hover self --loc 'sample.mbt:22:3'
  }
  
  impl Worker for Int with run(self, delta) {
    self + delta
    ^^^^
    ```moonbit
    Int
    ```
  }
  
  $ moon ide hover delta --loc 'sample.mbt:22:10'
  }
  
  impl Worker for Int with run(self, delta) {
    self + delta
           ^^^^^
           ```moonbit
           Int
           ```
  }
  
  $ moon ide hover demo_call --loc 'sample.mbt:25:8'
    self + delta
  }
  
  pub fn demo_call(x : Int) -> Int {
         ^^^^^^^^^
         ```moonbit
         fn demo_call(x : Int) -> Int
         ```
    let item = make_item(default_item)
    let worker_value = Worker::run(x, item)
  $ moon ide hover x --loc 'sample.mbt:25:18'
    self + delta
  }
  
  pub fn demo_call(x : Int) -> Int {
                   ^
                   ```moonbit
                   Int
                   ```
    let item = make_item(default_item)
    let worker_value = Worker::run(x, item)
  $ moon ide hover item --loc 'sample.mbt:26:7'
  }
  
  pub fn demo_call(x : Int) -> Int {
    let item = make_item(default_item)
        ^^^^
        ```moonbit
        Int
        ```
    let worker_value = Worker::run(x, item)
    worker_value + use_features()
  $ moon ide hover make_item --loc 'sample.mbt:26:14'
  }
  
  pub fn demo_call(x : Int) -> Int {
    let item = make_item(default_item)
               ^^^^^^^^^
               ```moonbit
               fn make_item(x : Int) -> Int
               ```
    let worker_value = Worker::run(x, item)
    worker_value + use_features()
  $ moon ide hover default_item --loc 'sample.mbt:26:24'
  }
  
  pub fn demo_call(x : Int) -> Int {
    let item = make_item(default_item)
                         ^^^^^^^^^^^^
                         ```moonbit
                         let default_item : Int
                         ```
    let worker_value = Worker::run(x, item)
    worker_value + use_features()
  $ moon ide hover worker_value --loc 'sample.mbt:27:7'
  pub fn demo_call(x : Int) -> Int {
    let item = make_item(default_item)
    let worker_value = Worker::run(x, item)
        ^^^^^^^^^^^^
        ```moonbit
        Int
        ```
    worker_value + use_features()
  }
  $ moon ide hover Worker --loc 'sample.mbt:27:22'
  pub fn demo_call(x : Int) -> Int {
    let item = make_item(default_item)
    let worker_value = Worker::run(x, item)
                       ^^^^^^
                       ```moonbit
                       trait Worker {
                         run(Self, Int) -> Int
                       }
                       ```
    worker_value + use_features()
  }
  $ moon ide hover run --loc 'sample.mbt:27:30'
  pub fn demo_call(x : Int) -> Int {
    let item = make_item(default_item)
    let worker_value = Worker::run(x, item)
                       ^^^^^^^^^^^
                       ```moonbit
                       (self : Int, delta : Int) -> Int
                       ```
    worker_value + use_features()
  }
  $ moon ide hover x --loc 'sample.mbt:27:34'
  pub fn demo_call(x : Int) -> Int {
    let item = make_item(default_item)
    let worker_value = Worker::run(x, item)
                                   ^
                                   ```moonbit
                                   Int
                                   ```
    worker_value + use_features()
  }
  $ moon ide hover item --loc 'sample.mbt:27:37'
  pub fn demo_call(x : Int) -> Int {
    let item = make_item(default_item)
    let worker_value = Worker::run(x, item)
                                      ^^^^
                                      ```moonbit
                                      Int
                                      ```
    worker_value + use_features()
  }
  $ moon ide hover worker_value --loc 'sample.mbt:28:3'
  pub fn demo_call(x : Int) -> Int {
    let item = make_item(default_item)
    let worker_value = Worker::run(x, item)
    worker_value + use_features()
    ^^^^^^^^^^^^
    ```moonbit
    Int
    ```
  }
  $ moon ide hover use_features --loc 'sample.mbt:28:18'
  pub fn demo_call(x : Int) -> Int {
    let item = make_item(default_item)
    let worker_value = Worker::run(x, item)
    worker_value + use_features()
                   ^^^^^^^^^^^^
                   ```moonbit
                   fn use_features() -> Int
                   ```
  }
  $ moon ide hover demo_call --loc 'sample_test.mbt:7:11'
  ///|
  test "demo_call" {
    inspect(demo_call(2), content="6")
            ^^^^^^^^^
            ```moonbit
            fn @bzy-debug/sample.demo_call(x : Int) -> Int
            ```
  }
