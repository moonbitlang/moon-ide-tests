# async find-references log src/pipe/read_exactly_test.mbt:18:6

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/async" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide find-references 'log' --loc 'src/pipe/read_exactly_test.mbt:18:6'
Found 5 references for symbol 'log':
<WORKDIR>/src/pipe/read_exactly_test.mbt:28:7-28:10:
   |     root.spawn_bg() <| () => {
   |       defer r.close()
   |       let msg1 = r.read_exactly(4) |> @utf8.decode
28 |       log("first message: \{msg1}")
   |       ^^^
   |       let msg2 = r.read_exactly(4) |> @utf8.decode
   |       log("second message: \{msg2}")

<WORKDIR>/src/pipe/read_exactly_test.mbt:30:7-30:10:
   |       let msg1 = r.read_exactly(4) |> @utf8.decode
   |       log("first message: \{msg1}")
   |       let msg2 = r.read_exactly(4) |> @utf8.decode
30 |       log("second message: \{msg2}")
   |       ^^^
   |       let msg3 = r.read_exactly(4) |> @utf8.decode
   |       log("third message: \{msg3}")

<WORKDIR>/src/pipe/read_exactly_test.mbt:32:7-32:10:
   |       let msg2 = r.read_exactly(4) |> @utf8.decode
   |       log("second message: \{msg2}")
   |       let msg3 = r.read_exactly(4) |> @utf8.decode
32 |       log("third message: \{msg3}")
   |       ^^^
   |     }
   |     // writer

<WORKDIR>/src/pipe/read_exactly_test.mbt:37:7-37:10:
   |     // writer
   |     root.spawn_bg() <| () => {
   |       defer w.close()
37 |       log("first message sent")
   |       ^^^
   |       w.write("abcdef")
   |       @async.sleep(100)

<WORKDIR>/src/pipe/read_exactly_test.mbt:40:7-40:10:
   |       log("first message sent")
   |       w.write("abcdef")
   |       @async.sleep(100)
40 |       log("second message sent")
   |       ^^^
   |       w.write("ghijkl")
   |     }

```
