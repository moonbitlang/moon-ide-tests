# core find-references equal async/os_error/extends.mbt:16:27

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide find-references 'equal' --loc 'async/os_error/extends.mbt:16:27'
Found 2 references for symbol 'equal':
<WORKDIR>/async/os_error/os_error_test.mbt:39:71-39:76:
   | 
   | ///|
   | test "Kind promotes equal" {
39 |   let eq : (@os_error.Kind, @os_error.Kind) -> Bool = @os_error.Kind::equal
   |                                                                       ^^^^^
   |   inspect(eq(NotFound, NotFound), content="true")
   |   inspect(@os_error.Kind::NotFound.equal(AccessDenied), content="false")

<WORKDIR>/async/os_error/os_error_test.mbt:41:36-41:41:
   | test "Kind promotes equal" {
   |   let eq : (@os_error.Kind, @os_error.Kind) -> Bool = @os_error.Kind::equal
   |   inspect(eq(NotFound, NotFound), content="true")
41 |   inspect(@os_error.Kind::NotFound.equal(AccessDenied), content="false")
   |                                    ^^^^^
   | }
"" (escaped)
```
