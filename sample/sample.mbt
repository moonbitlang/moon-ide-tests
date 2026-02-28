///|
/// Sample source used by testgen.
pub type Item = Int

pub trait Worker {
  run(Self, Int) -> Int
}

pub fn make_item(x : Int) -> Item {
  x
}

pub let default_item : Item = 1

pub fn use_features() -> Int {
  let xs = [1, 2, 3]
  let n = xs.length()
  Int::abs(-n)
}

impl Worker for Int with run(self, delta) {
  self + delta
}

pub fn demo_call(x : Int) -> Int {
  let item = make_item(default_item)
  let worker_value = Worker::run(x, item)
  worker_value + use_features()
}
