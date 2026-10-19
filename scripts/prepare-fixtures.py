#!/usr/bin/env python3
"""Migrate fixture manifests without sending fixture sources to the formatter.

Only configuration copies enter `moon fmt`. Publish the converted legacy files
after every module succeeds, retaining the original configurations on failure.
Local .mooncakes copies are included; links to caches outside the fixture are not.
"""

import argparse
import os
from pathlib import Path
import re
import stat
import subprocess
import sys
import tempfile


MANIFESTS = {"moon.mod", "moon.mod.json", "moon.pkg", "moon.pkg.json"}
SKIP_DIRS = {".git", "_build", "target", "node_modules"}


def is_link(path):
    # Windows junctions, like symlinks, can point to a shared registry cache.
    attributes = getattr(path.lstat(), "st_file_attributes", 0)
    return path.is_symlink() or bool(
        attributes & getattr(stat, "FILE_ATTRIBUTE_REPARSE_POINT", 0)
    )


def fixture_roots(root):
    yaml = root / "fixtures/repos.yaml"
    roots = []
    for line in yaml.read_text(encoding="utf-8").splitlines():
        match = re.match(r"^\s+path:\s+([^#]+?)\s*$", line)
        if match:
            fixture = root / match[1].strip().strip("\"'")
            if not fixture.is_dir():
                raise ValueError(f"missing fixture at {fixture}; run scripts/update-submodules.sh")
            roots.append(fixture)
    owned_project = root / "core_test/test_project"
    if owned_project.is_dir():
        roots.append(owned_project)
    return roots


def collect_manifests(roots):
    manifests = set()
    for root in roots:
        if is_link(root):
            raise ValueError(f"refusing to prepare linked fixture directory: {root}")
        for directory, dirs, files in os.walk(root, followlinks=False):
            parent = Path(directory)
            dirs[:] = sorted(
                name for name in dirs
                if name not in SKIP_DIRS and not is_link(parent / name)
            )
            for name in MANIFESTS.intersection(files):
                path = parent / name
                if not is_link(path):
                    manifests.add(path)
    return manifests


def converted_manifests(root):
    manifests = collect_manifests(fixture_roots(root))
    modules = {p.parent for p in manifests if p.name in {"moon.mod", "moon.mod.json"}}
    grouped = {}
    for manifest in sorted(manifests):
        module = next((p for p in manifest.parents if p in modules), None)
        if module is None:
            raise ValueError(f"manifest has no enclosing module: {manifest}")
        grouped.setdefault(module, []).append(manifest)

    replacements = {}
    for module, configs in sorted(grouped.items()):
        legacy = [p for p in configs if p.name.endswith(".json")]
        if not legacy:
            continue
        for source in legacy:
            if source.with_suffix("").exists():
                raise ValueError(f"both legacy and modern manifests exist: {source}")

        # A manifest-only tree needs no source parsing or dependency downloads.
        # New-format configs provide context but are never copied back.
        with tempfile.TemporaryDirectory(prefix="moon-fixture-manifests-") as directory:
            temporary = Path(directory)
            for config in configs:
                target = temporary / config.relative_to(module)
                target.parent.mkdir(parents=True, exist_ok=True)
                target.write_bytes(config.read_bytes())
            result = subprocess.run(
                ["moon", "-C", str(temporary), "fmt"], capture_output=True
            )
            if result.returncode:
                details = (result.stdout + result.stderr).decode("utf-8", errors="replace")
                raise ValueError(f"cannot migrate manifests in {module}:\n{details}")
            for source in legacy:
                converted = temporary / source.relative_to(module).with_suffix("")
                if not converted.is_file():
                    raise ValueError(f"moon fmt did not migrate {source}")
                replacements[source] = converted.read_bytes()
    return replacements


def prepare(root):
    replacements = converted_manifests(root)
    originals = {source: source.read_bytes() for source in replacements}
    try:
        for source, content in replacements.items():
            source.with_suffix("").write_bytes(content)
            source.unlink()
    except BaseException:
        for source, content in originals.items():
            source.write_bytes(content)
            source.with_suffix("").unlink(missing_ok=True)
        raise
    for source in replacements:
        print(f"Prepared {source.relative_to(root)}")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=Path(__file__).resolve().parents[1])
    args = parser.parse_args()
    try:
        prepare(args.root.resolve())
    except (OSError, ValueError) as error:
        print(f"fixture preparation failed: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
