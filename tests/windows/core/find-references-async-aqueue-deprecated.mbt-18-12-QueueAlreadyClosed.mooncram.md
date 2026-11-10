# core find-references QueueAlreadyClosed async\aqueue\deprecated.mbt:18:12

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide find-references 'QueueAlreadyClosed' --loc 'async\aqueue\deprecated.mbt:18:12'
Found 3 references for symbol 'QueueAlreadyClosed':
<WORKDIR>/async\aqueue\aqueue.mbt:347:20-347:38:
    | /// But this error can be customized via the `error` parameter.
    | pub fn[X] Queue::close(
    |   self : Queue[X],
347 |   error~ : Error = QueueAlreadyClosed,
    |                    ^^^^^^^^^^^^^^^^^^
    |   clear~ : Bool = false,
    | ) -> Unit {

<WORKDIR>/async\aqueue\deprecated.mbt:18:12-18:30:
   | ///|
   | #deprecated
   | #doc(hidden)
18 | pub extend QueueAlreadyClosed with @debug.Debug::{to_repr}
   |            ^^^^^^^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/async\aqueue\deprecated.mbt:23:12-23:30:
   | ///|
   | #deprecated
   | #doc(hidden)
23 | pub extend QueueAlreadyClosed with @json.ToJson::{to_json}
   |            ^^^^^^^^^^^^^^^^^^

```
