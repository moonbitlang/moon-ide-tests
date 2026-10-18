"""Run the pinned generator, migrating legacy manifests only in its cache."""
from pathlib import Path
import re
import subprocess

from .manifest import load_repos


def run_generator(root, args):
    cache = (Path(root) / 'testgen/.mooncakes').resolve()
    migrated = set()
    command = ['moon', '-C', str(Path(root) / 'testgen'), *args]
    while True:
        result = subprocess.run(command, capture_output=True, text=True, encoding='utf-8', errors='replace')
        if result.returncode == 0:
            return result
        match = re.search(r"`moon.mod.json` at '([^']+)' is no longer supported", result.stderr)
        dependency = Path(match[1]).resolve() if match else None
        if (dependency is None or not dependency.is_relative_to(cache)
                or dependency == cache or dependency in migrated or len(migrated) >= 32):
            raise subprocess.CalledProcessError(result.returncode, command, result.stdout, result.stderr)
        migrated.add(dependency)
        migration = subprocess.run(['moon', '-C', str(dependency), 'fmt'], capture_output=True,
                                   text=True, encoding='utf-8', errors='replace')
        if migration.returncode:
            raise subprocess.CalledProcessError(migration.returncode, migration.args,
                                                migration.stdout, migration.stderr)


def generate_cases(workspace, platform, log):
    workspace = Path(workspace)
    with Path(log).open('w', encoding='utf-8') as stream:
        for repo in load_repos(workspace):
            args = ['run', '--target', 'wasm', 'cmd/main', '--',
                    '--repo', str(workspace / repo['path']),
                    '--output-dir', str(workspace / 'tests' / platform / repo['slug']),
                    '--repo-slug', repo['slug'], '--test-repo', repo['path'], '--platform', platform]
            for key in ('max_files', 'max_per_file', 'max_file_size'):
                args.extend(['--' + key.replace('_', '-'), str(repo[key])])
            try:
                result = run_generator(workspace, args)
            except subprocess.CalledProcessError as error:
                stream.write((error.stdout or '') + (error.stderr or ''))
                raise
            stream.write(result.stdout + result.stderr)
