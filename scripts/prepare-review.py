#!/usr/bin/env python3
"""Copy only execution evidence into the scoped review bundle, as strict UTF-8."""

import argparse
from pathlib import Path


def copy_utf8(source, destination):
    raw = source.read_bytes()
    encoding = "utf-16" if raw.startswith((b"\xff\xfe", b"\xfe\xff")) else "utf-8-sig"
    destination.write_bytes(raw.decode(encoding).encode("utf-8"))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", type=Path)
    parser.add_argument("destination", type=Path)
    args = parser.parse_args()
    args.destination.mkdir(parents=True, exist_ok=True)
    names = ["baseline-health.log", "baseline-health-status.txt"]
    for platform in ("unix", "windows"):
        names.extend(f"{platform}-{suffix}" for suffix in ("cram-test-status.txt", "cram-test.log", "cram-update.log"))
    for name in names:
        copy_utf8(args.source / name, args.destination / name)


if __name__ == "__main__":
    main()
