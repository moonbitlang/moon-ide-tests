# core find-references Unknown async\internal\fd_util\stat.mbt:18:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide find-references 'Unknown' --loc 'async\internal\fd_util\stat.mbt:18:3'
Found 7 references for symbol 'Unknown':
<WORKDIR>/async\fs\watch_inotify.mbt:53:12-53:19:
   |   let self = {
   |     inotify: @event_loop.IoHandle::from_fd(
   |       inotify_fd,
53 |       kind=Unknown,
   |            ^^^^^^^
   |       is_async=true,
   |     ),

<WORKDIR>/async\fs\watch_kqueue.mbt:72:12-72:19:
   |   {
   |     kqueue: @event_loop.IoHandle::from_fd(
   |       kqueue,
72 |       kind=Unknown,
   |            ^^^^^^^
   |       is_async=true,
   |       read_only=true,

<WORKDIR>/async\internal\event_loop\process.mbt:50:12-50:19:
   |   } else {
   |     IoHandle::from_fd(
   |       handle,
50 |       kind=Unknown,
   |            ^^^^^^^
   |       is_async=platform is Linux,
   |       read_only=true,

<WORKDIR>/async\internal\event_loop\process_unix.mbt:46:40-46:47:
   |   let handle = if !@fd_util.fd_is_valid(pidfd) {
   |     None
   |   } else {
46 |     Some(IoHandle::from_fd(pidfd, kind=Unknown, read_only=true))
   |                                        ^^^^^^^
   |   }
   |   { pid, handle, }

<WORKDIR>/async\internal\event_loop\process_windows.mbt:45:10-45:17:
   |   let pid = perform_job_in_worker(job.0, context~)
   |   let handle = IoHandle::from_fd(
   |     job.result_handle(),
45 |     kind=Unknown,
   |          ^^^^^^^
   |     is_async=false,
   |   )

<WORKDIR>/async\internal\fd_util\stat.mbt:48:5-48:12:
   |   if value >= 1 && value - 1 < known_kinds.length() {
   |     known_kinds[value - 1]
   |   } else {
48 |     Unknown
   |     ^^^^^^^
   |   }
   | }

<WORKDIR>/async\internal\fd_util\stat.mbt:59:5-59:12:
   | pub fn FileKind::can_poll(self : FileKind) -> Bool {
   |   match self {
   |     Socket | Pipe | CharDevice | Console => true
59 |     Unknown | Regular | Directory | SymLink | BlockDevice => false
   |     ^^^^^^^
   |   }
   | }

```
