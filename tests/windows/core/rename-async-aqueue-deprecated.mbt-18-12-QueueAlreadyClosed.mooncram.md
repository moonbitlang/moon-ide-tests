# core rename QueueAlreadyClosed async\aqueue\deprecated.mbt:18:12

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'QueueAlreadyClosed' 'QueueAlreadyClosedRenamed' --loc 'async\aqueue\deprecated.mbt:18:12'
*** Begin Patch
*** Update File: <WORKDIR>/async\aqueue\aqueue.mbt
@@
 
 ///|
 /// Default error raised when trying to access an already-closed queue
-pub suberror QueueAlreadyClosed derive(@debug.Debug, @json.ToJson)
+pub suberror QueueAlreadyClosedRenamed derive(@debug.Debug, @json.ToJson)
 
 ///|
 /// Close an async queue. After the queue is closed:
@@
 /// But this error can be customized via the `error` parameter.
 pub fn[X] Queue::close(
   self : Queue[X],
-  error~ : Error = QueueAlreadyClosed,
+  error~ : Error = QueueAlreadyClosedRenamed,
   clear~ : Bool = false,
 ) -> Unit {
   self.closed = Some(error)
*** Update File: <WORKDIR>/async\aqueue\deprecated.mbt
@@
 ///|
 #deprecated
 #doc(hidden)
-pub extend QueueAlreadyClosed with @debug.Debug::{to_repr}
+pub extend QueueAlreadyClosedRenamed with @debug.Debug::{to_repr}
 
 ///|
 #deprecated
 #doc(hidden)
-pub extend QueueAlreadyClosed with @json.ToJson::{to_json}
+pub extend QueueAlreadyClosedRenamed with @json.ToJson::{to_json}
*** End Patch

```
