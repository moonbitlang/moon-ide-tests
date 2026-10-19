#!/usr/bin/env python3
"""Check tracked, staged and newly generated test files against HEAD."""

import argparse
import subprocess


def has_changes(paths, cwd=None):
    diff = subprocess.run(["git", "diff", "--quiet", "HEAD", "--", *paths], cwd=cwd)
    if diff.returncode not in (0, 1):
        raise subprocess.CalledProcessError(diff.returncode, diff.args)
    new = subprocess.check_output(["git", "ls-files", "--others", "--exclude-standard", "-z", "--", *paths], cwd=cwd)
    return diff.returncode == 1 or bool(new)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("paths", nargs="+")
    args = parser.parse_args()
    if has_changes(args.paths):
        subprocess.run(["git", "status", "--short", "--untracked-files=all", "--", *args.paths], check=True)
        parser.exit(1, "Generated tests differ from HEAD; regenerate and commit the baselines.\n")


if __name__ == "__main__":
    main()
