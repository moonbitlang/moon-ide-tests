# analyze: usage through public re-exports

Reproduces [issue #40](https://github.com/moonbitlang/moon-ide-tests/issues/40)
with the isolated `core_test/analyze_reexport` fixture. `lib` defines the API,
`mid` re-exports it with `pub using`, and `app` imports only `mid`.

These snapshots record the current buggy behavior on moon 0.1.20261023
(3778465). Update the snapshots and remove the limitation markers when the IDE
is fixed.

````mooncram
$ cd "$TESTDIR/../../../core_test/analyze_reexport"
````

The consumer must type-check and run: all four exports are live. `Failure` is
used through a variant and method, and `RequestError` through its constructor,
without explicit annotations naming either type.

````mooncram
$ moon check -q
````

````mooncram
$ moon run -q app
1
https://example.com
unreachable
````

Expected: `Origin`, `Failure`, and `RequestError` should each report `usage: 1`,
like the `helper` control. Actual: all three report `usage: 0`, incorrectly
suggesting their re-exports can be removed.

<!-- known-ide-limitation: issue #40 - analyze misses const and type uses through pub using -->
````mooncram
$ moon ide analyze mid
package "demo/reexport/mid"

import {
  "demo/reexport/lib",
}

// Values
pub const Origin : String = "https://example.com"  // usage: 0 (0 in test)

pub fn helper() -> Int32                           // usage: 1 (0 in test)

// Errors

// Types and methods

// Type aliases
pub using @lib {type Failure}                      // usage: 0 (0 in test)

pub using @lib {type RequestError}                 // usage: 0 (0 in test)

// Traits
````

The source package also counts re-exports inconsistently: `Origin` reports two
uses (the re-export and consumer), while `helper` reports one. The constructor
and method rows confirm the uses that are missing from `mid`'s type aliases.

<!-- known-ide-limitation: issue #40 - analyze counts source const and function re-exports differently -->
````mooncram
$ moon ide analyze lib
package "demo/reexport/lib"

// Values
pub const Origin : String = "https://example.com"  // usage: 2 (0 in test)

pub fn helper() -> Int32                           // usage: 1 (0 in test)

// Errors
pub(all) suberror RequestError {
  RequestError(String)                             // usage: 1 (0 in test)
}

// Types and methods
pub(all) enum Failure {
  Unreachable                                      // usage: 1 (0 in test)
  Denied(String)                                   // usage: 0 (0 in test)
}
pub fn Failure::label(Self) -> String              // usage: 1 (0 in test)

// Type aliases

// Traits
````
