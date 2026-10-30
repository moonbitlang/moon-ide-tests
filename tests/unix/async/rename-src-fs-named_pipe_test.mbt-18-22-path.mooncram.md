# async rename path src/fs/named_pipe_test.mbt:18:22

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/async' moon ide rename 'path' 'path_renamed' --loc 'src/fs/named_pipe_test.mbt:18:22'
*** Begin Patch
*** Update File: <WORKDIR>/src/fs/named_pipe_test.mbt
@@
 ///|
 #cfg(not(platform="windows"))
 #borrow(path)
-extern "C" fn mkfifo(path : @os_string.OsString, mode : Int32) -> Int32 = "mkfifo"
+extern "C" fn mkfifo(path_renamed : @os_string.OsString, mode : Int32) -> Int32 = "mkfifo"
 
 ///|
 #cfg(not(platform="windows"))
*** End Patch
"" (escaped)
````
