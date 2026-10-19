#!/usr/bin/env python3
"""Run a native command with both byte streams redirected to one log file."""

from pathlib import Path
import subprocess
import sys


def main():
    if len(sys.argv) < 4 or sys.argv[2] != "--":
        print("usage: run-logged.py LOG -- COMMAND [ARG ...]", file=sys.stderr)
        return 2
    # Passing the same unbuffered OS file to both handles preserves native UTF-8
    # bytes and ordering, bypassing PowerShell 5.1's UTF-16/formatting pipeline.
    with Path(sys.argv[1]).open("wb", buffering=0) as output:
        return subprocess.run(sys.argv[3:], stdout=output, stderr=subprocess.STDOUT).returncode


if __name__ == "__main__":
    sys.exit(main())
