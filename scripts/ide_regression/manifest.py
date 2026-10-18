"""Read existing Cram baselines without replacing Moon Cram's matcher."""

from collections import Counter, defaultdict
import hashlib
from functools import lru_cache
import json
import os
from pathlib import Path
import re
import shlex
import subprocess

SCHEMA_VERSION = 1
IGNORED = {".git", ".mooncakes", "_build", "target", "node_modules", ".moonagent", ".repo", "__pycache__"}


def digest(value):
    return hashlib.sha256(json.dumps(value, sort_keys=True, ensure_ascii=False).encode()).hexdigest()


def read_json(path):
    return json.loads(Path(path).read_text(encoding="utf-8-sig"))


def write_json(path, value):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True, ensure_ascii=False) + "\n", encoding="utf-8")


def tree_fingerprint(path, *, include_dependencies=False):
    path = Path(path)
    if not path.exists():
        raise ValueError(f"Missing input tree: {path}")
    rows = []
    for directory, dirs, files in os.walk(path, followlinks=False):
        dirs[:] = sorted(d for d in dirs if d not in IGNORED or (include_dependencies and d == ".mooncakes"))
        for name in sorted(files):
            file = Path(directory) / name
            if name in {".git", ".DS_Store", ".moon-lock"}:
                continue
            relative = file.relative_to(path).as_posix()
            if file.is_symlink():
                data = os.readlink(file).encode()
            else:
                data = file.read_bytes()
                # Checkout line endings are not source changes. Binary inputs
                # retain their exact bytes.
                try:
                    data = data.decode("utf-8").replace("\r\n", "\n").encode()
                except UnicodeDecodeError:
                    pass
            rows.append((relative, hashlib.sha256(data).hexdigest()))
    return digest(rows)


def shell_words(text, platform):
    if platform == "unix":
        return shlex.split(text)
    words = []
    offset = 0
    token = re.compile(r"\s*(?:'((?:[^']|'')*)'|([^\s']+))")
    while offset < len(text):
        if not text[offset:].strip():
            break
        match = token.match(text, offset)
        if not match:
            raise ValueError(f"Unsupported PowerShell command syntax: {text}")
        words.append(match[1].replace("''", "'") if match[1] is not None else match[2])
        offset = match.end()
    return words


def command_blocks(text):
    """Yield single-line shell commands and their untouched Cram expectations."""
    lines = text.replace("\r\n", "\n").splitlines()
    fence = None
    i = 0
    while i < len(lines):
        line = lines[i]
        opening = re.fullmatch(r"(`{3,})mooncram\s*", line)
        if fence is None:
            if opening:
                fence = opening[1]
            i += 1
            continue
        if re.fullmatch(r"`{%d,}" % len(fence), line):
            fence = None
            i += 1
            continue
        if line.startswith("$ "):
            number, command = i + 1, line[2:]
            output = []
            i += 1
            while i < len(lines) and not lines[i].startswith("$ ") and not re.fullmatch(r"`{%d,}" % len(fence), lines[i]):
                if lines[i].startswith("> "):
                    raise ValueError(f"Multiline commands need explicit support: {command}")
                output.append(lines[i])
                i += 1
            yield number, command, output
        else:
            i += 1
    if fence is not None:
        raise ValueError("Unclosed mooncram fence")


def _inside(root, path):
    resolved = path.resolve()
    try:
        return resolved.relative_to(root.resolve()).as_posix()
    except ValueError as error:
        raise ValueError(f"Input path escapes the checkout: {path}") from error


def _repo_path(root, file, text, words, platform):
    if platform == "windows":
        relative = words.pop(1).replace("\\", "/")
        return _inside(root, file.parent / relative)
    match = re.search(r'TEST_REPO_ROOT="\$\(cd "\$TESTDIR/\.\./\.\./\.\./([^"\n]+)"', text)
    if not match:
        raise ValueError(f"Cannot resolve test repository in {file}")
    return _inside(root, root / match[1])


def _option(argv, name, default=None):
    if name not in argv:
        return default
    index = argv.index(name)
    if index + 1 == len(argv):
        raise ValueError(f"Missing {name} value")
    return argv[index + 1]


def _anchor(root, repo, argv):
    loc = _option(argv, "--loc")
    if loc:
        parts = loc.replace("\\", "/").rsplit(":", 2)
        if len(parts) != 3 or not all(p.isdigit() for p in parts[1:]):
            return None, False, "unsupported location shape", loc
        source, line, column = parts[0], int(parts[1]), int(parts[2])
        path = root / repo / source
        _inside(root / repo, path)
        if not path.is_file():
            return None, False, f"missing source file: {source}", loc
        lines = path.read_text(encoding="utf-8").splitlines()
        if line < 1 or line > len(lines) or column < 1:
            return None, False, "source location out of range", loc
        text = lines[line - 1]
        try:
            prefix = text.encode('utf-16-le')[:(column - 1) * 2].decode('utf-16-le')
        except UnicodeDecodeError:
            return None, False, 'source column splits a UTF-16 character', loc
        offset = len(prefix)
        if len(text.encode('utf-16-le')) < (column - 1) * 2:
            return None, False, 'source location out of range', loc
        token = re.match(r"[A-Za-z_][A-Za-z0-9_]*", text[offset:])
        query = argv[3] if len(argv) > 3 and not argv[3].startswith("--") else None
        if token is None or (query is not None and token[0] != query):
            return None, False, "location no longer points to the queried token", loc
        marked = text[:offset] + "<TOKEN>" + text[offset + len(token[0]):]
        return " ".join(marked.split()), True, "", loc
    if argv[2] == "outline":
        source = argv[3].replace("\\", "/")
        path = root / repo / source
        _inside(root / repo, path)
        return source, path.exists(), "" if path.exists() else "missing outline input", source
    # Query-only commands have no fragile physical source position.
    return "query", True, "", None


def collect_cases(root, platform, policy=None):
    root = Path(root)
    cases = []
    overrides = (policy or {}).get("cases", {})
    for file in sorted((root / "tests" / platform).rglob("*.mooncram.md")):
        text = file.read_text(encoding="utf-8")
        occurrences = Counter()
        for number, expression, expected in command_blocks(text):
            if not expression.startswith("run_moon_ide "):
                continue
            words = shell_words(expression, platform)
            occurrences[expression] += 1
            repo = _repo_path(root, file, text, words, platform)
            if words[1:3] != ["moon", "ide"] or len(words) < 4:
                raise ValueError(f"Unsupported IDE invocation: {expression}")
            argv = words[1:]
            anchor, valid, reason, location = _anchor(root, repo, argv)
            arguments = list(argv)
            if "--loc" in arguments:
                index = arguments.index("--loc")
                del arguments[index:index + 2]
            if argv[2] == "outline":
                arguments = argv[:3]
            semantic = digest([repo, arguments, anchor])[:24]
            expected_exit = 0
            if expected and re.fullmatch(r"\[\d+\]", expected[-1]):
                expected_exit = int(expected[-1][1:-1])
                expected = expected[:-1]
            case = {
                "id": semantic, "semantic_key": semantic,
                "execution_id": digest([file.relative_to(root).as_posix(), expression, occurrences[expression]])[:24],
                "command": argv[2], "argv": argv, "shell_expression": expression,
                "cram_file": file.relative_to(root).as_posix(), "command_line": number,
                "repo_path": repo, "platform": platform, "location": location,
                "anchor": anchor, "input_valid": valid, "input_reason": reason,
                "mode": "symbol+loc" if "--loc" in argv and not argv[3].startswith("--") else "loc" if "--loc" in argv else "path" if argv[2] == "outline" else "query",
                "format": "json" if "--json" in argv or "--output-json" in argv else "text",
                "target": _option(argv, "--target", "module-default"),
                "scenario": "source-location" if "--loc" in argv else "file-outline" if argv[2] == "outline" else "api-query",
                "expected_exit": expected_exit, "expected_output": expected,
                "identity_review": anchor is None,
            }
            cases.append(case)
    counts = Counter(c["semantic_key"] for c in cases)
    for case in cases:
        if counts[case["semantic_key"]] > 1:
            case["identity_review"] = True
            case["id"] = case["semantic_key"] + ":" + case["execution_id"]
        override = overrides.get(case["id"], {})
        case["expectation"] = override.get("expectation", {"kind": "success"})
        case["scenario"] = override.get("scenario", case["scenario"])
        case["legacy_error_requires_review"] = case["expected_exit"] != 0 and "expectation" not in override
    return cases


def compare_cases(old, new):
    result = {key: [] for key in ("retained", "relocated", "added", "retired", "changed", "ambiguous")}
    before, after = {c["id"]: c for c in old}, {c["id"]: c for c in new}
    for identity in sorted(before.keys() | after.keys()):
        a, b = before.get(identity), after.get(identity)
        if (a and a["identity_review"]) or (b and b["identity_review"]):
            result["ambiguous"].append(identity)
        elif a is None:
            result["added"].append(identity)
        elif b is None:
            result["retired"].append(identity)
        else:
            result["relocated" if (a["location"], a["cram_file"]) != (b["location"], b["cram_file"]) else "retained"].append(identity)
            if (a["expected_exit"], a["expected_output"], a["expectation"]) != (b["expected_exit"], b["expected_output"], b["expectation"]):
                result["changed"].append(identity)
    return result


def verify_inputs(accepted, current, *, allow_toolchain_change=False):
    if accepted.get("schema_version") != SCHEMA_VERSION or current.get("schema_version") != SCHEMA_VERSION:
        return ["schema_version"]
    ignored = {"toolchain"} if allow_toolchain_change else set()
    a, b = accepted["inputs"], current["inputs"]
    return sorted(key for key in a.keys() | b.keys() if key not in ignored and a.get(key) != b.get(key))


def load_repos(root):
    """Validate the repository's intentionally small fixture-list YAML subset."""
    repos, current = [], None
    for line in (Path(root) / "fixtures/repos.yaml").read_text(encoding="utf-8").splitlines():
        if not line.strip() or line.lstrip().startswith("#") or line.strip() == "repos:":
            continue
        match = re.fullmatch(r"\s*(-\s+)?([a-z_]+):\s*(.*?)\s*", line)
        if not match:
            raise ValueError(f"Unsupported fixture configuration: {line}")
        if match[1]:
            if match[2] != "slug":
                raise ValueError("Each fixture must start with slug")
            current = {"max_files": 0, "max_per_file": 50, "max_file_size": 102400}
            repos.append(current)
        if current is None or match[2] not in {"slug", "path", "url", "branch", "max_files", "max_per_file", "max_file_size"}:
            raise ValueError(f"Unexpected fixture field: {line}")
        value = match[3].strip("\"'")
        current[match[2]] = int(value) if match[2].startswith("max_") else value
    if not repos or len({r.get("slug") for r in repos}) != len(repos):
        raise ValueError("Fixture list must contain unique slugs")
    for repo in repos:
        if not re.fullmatch(r"[A-Za-z0-9_-]+", repo.get("slug", "")) or "path" not in repo:
            raise ValueError(f"Invalid fixture: {repo}")
        _inside(Path(root), Path(root) / repo["path"])
        if any(repo[key] < 0 for key in ("max_files", "max_per_file", "max_file_size")):
            raise ValueError("Fixture limits must be nonnegative")
    return repos


def _git(root, *args):
    result = subprocess.run(["git", "-C", str(root), *args], capture_output=True, text=True)
    return result.stdout.strip() if result.returncode == 0 else None


def fixture_commit(path):
    top = _git(path, 'rev-parse', '--show-toplevel')
    # Handwritten fixtures belong to this repository, whose HEAD necessarily
    # changes when a candidate is merged. Their own content hash is sufficient.
    return _git(path, 'rev-parse', 'HEAD') if top and Path(top).resolve() == Path(path).resolve() else None


@lru_cache(maxsize=4)
def runtime_versions(platform):
    commands = {'cram': ['moon-cram', '--version'], 'shell':
                ['powershell.exe', '-NoProfile', '-Command', '$PSVersionTable.PSVersion.ToString()']
                if platform == 'windows' else ['bash', '--version']}
    result = {}
    for key, command in commands.items():
        version = subprocess.run(command, capture_output=True, text=True, check=True)
        result[key] = version.stdout.splitlines()[0]
    return result


def capture_manifest(root, platform, policy, *, moon="moon", provenance=None):
    root = Path(root).resolve()
    cases = collect_cases(root, platform, policy)
    tool = subprocess.run([moon, "version", "--all"], capture_output=True, text=True, check=True)
    version = [re.sub(r"\)\s+.*$", ")", line) for line in tool.stdout.splitlines() if line.startswith(("moon ", "moonc ", "moonrun ", "Feature flags"))]
    fixtures, dependencies, resolved = {}, {}, {}
    if not cases:
        raise ValueError('No IDE cases found; refusing an empty baseline')
    if provenance is None:
        for repo in load_repos(root):
            entry = _git(root, 'ls-files', '--stage', '--', repo['path']) or ''
            if entry.startswith('160000 ') and not (root / repo['path'] / '.git').exists():
                raise ValueError('Uninitialized fixture submodule: ' + repo['path'])
    for relative in sorted({c["repo_path"] for c in cases}):
        path = root / relative
        fixtures[relative] = {"tree": tree_fingerprint(path), "commit": fixture_commit(path)}
        dependencies[relative] = digest([(p.relative_to(path).as_posix(), p.read_text(encoding='utf-8'))
                                        for p in sorted(path.rglob('moon.mod*'))
                                        if not any(part in IGNORED for part in p.relative_to(path).parts)])
        resolved[relative] = tree_fingerprint(path / ".mooncakes") if (path / ".mooncakes").exists() else None
    moon_home = Path(os.environ.get("MOON_HOME", str(Path.home() / ".moon")))
    registry = moon_home / "registry/index"
    registry_commit = _git(registry, 'rev-parse', 'HEAD') if registry.exists() else None
    registry_dirty = _git(registry, 'status', '--porcelain') if registry_commit else None
    inputs = {
        "platform": platform, "toolchain": version,
        "generator": tree_fingerprint(root / "testgen"),
        'generator_dependencies': tree_fingerprint(root / 'testgen/.mooncakes')
                                  if (root / 'testgen/.mooncakes').exists() else None,
        "config": digest([load_repos(root), policy]),
        "fixtures": fixtures, "dependencies": dependencies,
        "registry": {'commit': registry_commit} if registry_commit and not registry_dirty else tree_fingerprint(registry) if registry.exists() else None,
        "baselines": tree_fingerprint(root / "tests" / platform),
        'harness': tree_fingerprint(root / 'scripts'),
        'runtime': runtime_versions(platform),
        "environment": {'LANG': 'C', 'LC_ALL': 'C', 'TZ': 'GMT',
                        'MOON_UNSTABLE': os.environ.get('MOON_UNSTABLE')},
    }
    if provenance:
        # Sandboxes deliberately omit Git administration; carry the source
        # checkout's pin only when its source tree still matches exactly.
        for key, fixture in inputs["fixtures"].items():
            original = provenance["inputs"]["fixtures"].get(key)
            if original and original["tree"] == fixture["tree"]:
                fixture["commit"] = original["commit"]
    return {"schema_version": SCHEMA_VERSION, "inputs": inputs, "cases": cases,
            "source_revision": _git(root, "rev-parse", "HEAD"),
            "toolchain_raw": tool.stdout, "moon_home": str(moon_home),
            "policy": policy, 'resolved_dependencies': resolved}
