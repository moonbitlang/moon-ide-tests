#!/usr/bin/env python3
import pathlib
import re
import sys


SPECIAL_OUTPUT = re.compile(
    r"^(?:[ \t]*(?:\||[0-9]+[ \t]+\|)|[ \t]+.*=>|[+-][ \t]+.*=>)"
)


def escape_file(path: pathlib.Path) -> bool:
    lines = path.read_text(encoding="utf-8").splitlines(keepends=True)
    changed = False
    in_block = False
    out: list[str] = []

    for line in lines:
        body = line[:-1] if line.endswith("\n") else line
        newline = "\n" if line.endswith("\n") else ""

        if body == "```mooncram":
            in_block = True
            out.append(line)
            continue
        if in_block and body == "```":
            in_block = False
            out.append(line)
            continue

        if in_block and SPECIAL_OUTPUT.match(body):
            old_marker = None
            if body.endswith(" (escaped)") or body.endswith(" (glob)"):
                body, old_marker = body.rsplit(" ", 1)
                old_marker = old_marker.strip("()")
            if old_marker == "escaped":
                body = body.replace("\\\\", "\\")
            body = body.replace("\\", "\\\\")
            out.append(f"{body} (escaped){newline}")
            changed = True
        else:
            out.append(line)

    if changed:
        path.write_text("".join(out), encoding="utf-8")
    return changed


def iter_files(paths: list[str]) -> list[pathlib.Path]:
    files: list[pathlib.Path] = []
    for raw in paths:
        path = pathlib.Path(raw)
        if path.is_dir():
            files.extend(sorted(path.rglob("*.mooncram.md")))
            files.extend(sorted(path.rglob("*.md")))
        elif path.is_file():
            files.append(path)
    return files


def main() -> int:
    if len(sys.argv) < 2:
        print("usage: escape-mooncram-output.py <file-or-dir>...", file=sys.stderr)
        return 2
    for path in iter_files(sys.argv[1:]):
        escape_file(path)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
