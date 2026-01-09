///|
/// A simple 2D point structure
pub struct Point {
  x : Int
  y : Int
}

///|
/// Creates a new Point at the origin
pub fn Point::origin() -> Point {
  { x: 0, y: 0 }
}

///|
/// Creates a new Point with specified coordinates
pub fn Point::new(x : Int, y : Int) -> Point {
  { x, y }
}

///|
/// Calculates the Manhattan distance from origin
pub fn Point::distance_from_origin(self : Point) -> Int {
  self.x.abs() + self.y.abs()
}

///|
/// Adds two points together
pub fn Point::add(self : Point, other : Point) -> Point {
  { x: self.x + other.x, y: self.y + other.y }
}

///|
/// A generic container type
pub enum Container[T] {
  Empty
  Value(T)
}

///|
/// Maps a function over the container
pub fn[T, U] Container::map(self : Container[T], f : (T) -> U) -> Container[U] {
  match self {
    Empty => Empty
    Value(x) => Value(f(x))
  }
}

///|
/// Checks if the container is empty
pub fn[T] Container::is_empty(self : Container[T]) -> Bool {
  match self {
    Empty => true
    Value(_) => false
  }
}
