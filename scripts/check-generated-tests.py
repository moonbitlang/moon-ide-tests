#!/usr/bin/env python3
"""Fail when generated tests have staged, unstaged, or untracked changes."""

import argparse
import subprocess
import sys


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("paths", nargs="+", help="Generated test directories")
    args = parser.parse_args()
    changes = []
    # Diff honors Git's line-ending normalization. A status-only check can
    # report unchanged LF output as dirty after a CRLF checkout on Windows.
    for command in (
        ("diff", "--exit-code"),
        ("diff", "--cached", "--exit-code"),
        ("ls-files", "--others", "--exclude-standard"),
    ):
        result = subprocess.run(
            ["git", *command, "--", *args.paths],
            capture_output=True,
            text=True,
            encoding="utf-8",
            errors="replace",
        )
        if result.returncode and (command[0] != "diff" or result.returncode != 1):
            sys.stderr.write(result.stderr)
            return result.returncode
        if result.returncode or result.stdout:
            changes.append(result.stdout)
    if changes:
        print("Generated tests are out of date:")
        for change in changes:
            print(change, end="")
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
