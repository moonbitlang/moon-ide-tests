#!/usr/bin/env python3
"""Reject failed IDE snapshots except narrowly documented hover limitations."""

import argparse
import re
import shlex
from pathlib import Path


LIMITATIONS = {
    "extension-declaration-hover": [("core", "test/extends.mbt", "to_repr", 37, None)],
    "intrinsic-parameter-hover": [("core", "builtin/int64.mbt", "self", 21, None)],
    "using-trait-hover": [("rabbita", "rabbita/internal/vdom/vdom.mbt", "Scheduler", 19, None)],
    "extern-function-hover": [
        ("core", "encoding/utf8/decode_js.mbt", "decode_utf8_js", 16, "js"),
        ("async", "src/fs/named_pipe_test.mbt", "mkfifo", 15, None),
        ("async", "src/internal/event_loop/stdio.mbt", "fstatx_sync", 15, None),
    ],
    "extern-parameter-hover": [
        ("core", "encoding/utf8/decode_js.mbt", "bytes", 3, "js"),
        ("async", "src/fs/named_pipe_test.mbt", "path", 22, None),
        ("async", "src/internal/event_loop/stdio.mbt", "fd", 3, None),
    ],
}
MARKER = re.compile(r"<!-- known-ide-limitation: ([a-z-]+) -->")
STATUS = re.compile(r"\[(-?[1-9][0-9]*)\]")
LOADING_ERROR = re.compile(
    r"^(?:Error: could not get package|Error: Failed to resolve the module dependency graph|"
    r".*`moon\.mod\.json`.*no longer supported)"
)


def known_failure(marker, command, output, path):
    try:
        tokens = shlex.split(command[2:])
        start = tokens.index("moon")
    except (ValueError, IndexError):
        return False
    invocation = tokens[start:]
    for repo, source, symbol, column, target in LIMITATIONS.get(marker, []):
        if not re.search(rf"(?:^|/)tests/(unix|windows)/{repo}/hover\.mooncram\.md$", path):
            continue
        expected_length = 8 if target else 6
        if len(invocation) != expected_length or invocation[:5] != ["moon", "ide", "hover", symbol, "--loc"]:
            continue
        if target and invocation[6:] != ["--target", target]:
            continue
        location = invocation[5]
        if not re.fullmatch(re.escape(source) + rf":[1-9][0-9]*:{column}", location.replace("\\", "/")):
            continue
        if output == [f"No hover information found for symbol '{symbol}' at {location}", "[1]"]:
            return True
    return False


def command_blocks(text):
    """Yield IDE command/output pairs; a marker applies to the next fence only."""
    marker = None
    fence = None
    command = None
    output = []
    command_line = 0
    for number, line in enumerate(text.splitlines(), 1):
        if fence is None:
            match = MARKER.fullmatch(line)
            if match:
                marker = match[1]
            opened = re.fullmatch(r"(`{3,})mooncram", line)
            if opened:
                fence = opened[1]
            continue
        if line == fence:
            if command is not None:
                yield command_line, marker, command, output
            fence, marker, command, output = None, None, None, []
        elif line.startswith("$ "):
            if command is not None:
                yield command_line, marker, command, output
                marker = None
            command, output, command_line = line, [], number
        elif command is not None:
            output.append(line)


def validate_text(text, path):
    errors = []
    for line, marker, command, output in command_blocks(text):
        if "moon ide " not in command:
            continue
        failed = bool(output and STATUS.fullmatch(output[-1]))
        load_error = any(LOADING_ERROR.match(value) for value in output)
        if (failed or load_error) and not known_failure(marker, command, output, path):
            errors.append(f"{path}:{line}: unapproved failed IDE baseline\n  {command}\n  " + "\n  ".join(output[-4:]))
    return errors


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("paths", type=Path, nargs="+")
    args = parser.parse_args()
    files = []
    for path in args.paths:
        if not path.exists():
            parser.error(f"baseline path does not exist: {path}")
        files.extend(sorted(path.rglob("*.mooncram.md")) if path.is_dir() else [path])
    errors = []
    known_count = 0
    for file in files:
        text = file.read_text(encoding="utf-8-sig")
        path = file.as_posix()
        errors.extend(validate_text(text, path))
        for line, marker, command, output in command_blocks(text):
            if known_failure(marker, command, output, path):
                known_count += 1
                print(f"Known IDE limitation ({marker}): {path}:{line}: {command}")
    for error in errors:
        print(error)
    print(f"Baseline health: {len(files)} files, {known_count} known limitations, {len(errors)} unexpected failures")
    return int(bool(errors))


if __name__ == "__main__":
    raise SystemExit(main())
