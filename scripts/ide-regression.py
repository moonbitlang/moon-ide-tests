#!/usr/bin/env python3
"""P0 baseline capture, isolated A/B/C execution and strict replay."""
import argparse
import os
from pathlib import Path
import re
import subprocess
import sys

from ide_regression.generator import generate_cases, run_generator
from ide_regression.manifest import capture_manifest, load_repos, read_json, write_json
from ide_regression.policy import validate_policy
from ide_regression.replay import check_report, replay
from ide_regression.workflow import RegressionRun


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('command', choices=['inventory', 'begin', 'finish', 'stage', 'check',
                                         'replay', 'generator-test', 'pin-fixtures', 'check-toolchain'])
    parser.add_argument('--root', type=Path, default=Path(__file__).resolve().parents[1])
    parser.add_argument('--platform', choices=['unix', 'windows'], default='windows' if os.name == 'nt' else 'unix')
    parser.add_argument('--output', type=Path)
    parser.add_argument('--manifest', type=Path)
    parser.add_argument('--policy', type=Path)
    parser.add_argument('--allow-toolchain-change', action='store_true')
    args = parser.parse_args(argv)
    root = args.root.resolve()
    policy = validate_policy(read_json(args.policy or root / 'testgen/coverage-policy.json'))
    if args.command == 'generator-test':
        result = run_generator(root, ['test', '--target', 'wasm'])
        print(result.stdout + result.stderr)
        return 0
    if args.command in {'check-toolchain', 'pin-fixtures', 'replay'} and args.manifest is None:
        parser.error('--manifest is required')
    if args.command == 'pin-fixtures':
        manifest = read_json(args.manifest)
        for repo in load_repos(root):
            fixture = manifest['inputs']['fixtures'][repo['path']]
            commit = fixture['commit']
            if not re.fullmatch('[a-f0-9]{40,64}', commit or ''):
                raise ValueError('Invalid recorded fixture commit: ' + repo['path'])
            subprocess.run(['git', '-C', str(root / repo['path']), 'checkout', '--detach', commit], check=True)
        return 0
    if args.command == 'check-toolchain':
        saved = read_json(args.manifest)
        current = capture_manifest(root, args.platform, policy)
        for key in ('toolchain', 'registry'):
            if saved['inputs'][key] != current['inputs'][key]:
                raise ValueError('Unix/Windows frozen input mismatch: ' + key)
        return 0
    if args.output is None:
        parser.error('--output is required')
    output = args.output.resolve()
    if output == root or any(output.is_relative_to(root / name) for name in
                             ('fixtures', 'core_test', 'testgen', 'scripts', 'tests', 'baselines')):
        raise ValueError('Output must be outside the input trees')
    if args.command == 'check':
        return check_report(output / 'report.json')
    if args.command == 'inventory':
        write_json(output, capture_manifest(root, args.platform, policy))
    elif args.command == 'replay':
        replay(root, read_json(args.manifest), output, allow_toolchain_change=args.allow_toolchain_change)
        return check_report(output / 'report.json')
    else:
        pipeline = RegressionRun(root, args.platform, output, policy, generate=generate_cases)
        if args.command == 'begin':
            # Resolve/migrate a cold generator cache before freezing A inputs.
            # Populated generator dependency code is immutable for the run.
            run_generator(root, ['check', '--target', 'wasm'])
            pipeline.begin()
        elif args.command == 'finish':
            pipeline.finish()
        elif args.command == 'stage':
            pipeline.stage()
    return 0


if __name__ == '__main__':
    try:
        sys.exit(main())
    except (OSError, ValueError, KeyError, subprocess.SubprocessError) as error:
        print(f'IDE regression infrastructure error: {error}', file=sys.stderr)
        if isinstance(error, subprocess.CalledProcessError):
            print((error.stdout or '') + (error.stderr or ''), file=sys.stderr)
        sys.exit(1)
