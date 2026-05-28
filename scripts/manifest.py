#!/usr/bin/env python3
import json
import pathlib
import sys


FIELDS = (
    "slug",
    "path",
    "url",
    "branch",
    "max_files",
    "max_per_file",
)


def parse_manifest(path: pathlib.Path) -> list[dict[str, str]]:
    repos: list[dict[str, str]] = []
    current: dict[str, str] | None = None
    for raw in path.read_text(encoding="utf-8").splitlines():
        stripped = raw.strip()
        if not stripped or stripped.startswith("#") or stripped == "repos:":
            continue
        if stripped.startswith("- "):
            if current is not None:
                repos.append(current)
            current = {}
            stripped = stripped[2:].strip()
            if not stripped:
                continue
        if current is None or ":" not in stripped:
            continue
        key, value = stripped.split(":", 1)
        current[key.strip()] = value.strip().strip("\"'")
    if current is not None:
        repos.append(current)
    for repo in repos:
        missing = [field for field in FIELDS[:4] if not repo.get(field)]
        if missing:
            raise SystemExit(f"manifest entry is missing required fields: {', '.join(missing)}")
        repo.setdefault("max_files", "0")
        repo.setdefault("max_per_file", "50")
    return repos


def main() -> int:
    root = pathlib.Path(__file__).resolve().parents[1]
    manifest = root / "fixtures" / "repos.yaml"
    repos = parse_manifest(manifest)
    if len(sys.argv) > 1 and sys.argv[1] == "--json":
        print(json.dumps(repos, indent=2))
    else:
        for repo in repos:
            print("\t".join(repo[field] for field in FIELDS))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
