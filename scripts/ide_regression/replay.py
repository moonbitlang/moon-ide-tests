"""Replay only after validating every recorded input identity."""
import copy
from pathlib import Path
import tempfile

from .manifest import capture_manifest, digest, read_json, verify_inputs, write_json
from .policy import coverage, evaluate, markdown_report
from .runner import CramRunner
from .workflow import copy_workspace


def hydrate(saved, current):
    actual = {case['execution_id']: case for case in current}
    if len(actual) != len(saved) or set(actual) != {c['execution_id'] for c in saved}:
        raise ValueError('Recorded case set does not match the checkout')
    result = []
    for recorded in saved:
        case = actual[recorded['execution_id']]
        if case['id'] != recorded['id']:
            raise ValueError('Recorded case identity changed')
        expected_hash = recorded.get('expected_output_hash', digest(recorded.get('expected_output')))
        if digest(case['expected_output']) != expected_hash:
            raise ValueError('Recorded snapshot output changed')
        restored = copy.deepcopy(recorded)
        restored.pop('expected_output_hash', None)
        restored['expected_output'] = case['expected_output']
        # Physical line numbers can change with expected output lengths.
        restored['command_line'] = case['command_line']
        result.append(restored)
    return result


def check_report(path):
    report = read_json(path)
    verdict = report.get('gate', {}).get('verdict')
    if report.get('schema_version') != 1 or verdict not in {'clean', 'needs_review', 'failed'}:
        raise ValueError('Missing or invalid P0 report')
    return {'clean': 0, 'needs_review': 2, 'failed': 1}[verdict]


def replay(root, saved, output, *, allow_toolchain_change=False):
    policy, platform = saved['policy'], saved['inputs']['platform']
    current = capture_manifest(root, platform, policy)
    differences = verify_inputs(saved, current, allow_toolchain_change=allow_toolchain_change)
    if differences:
        raise ValueError('Replay inputs differ: ' + ', '.join(differences))
    cases = hydrate(saved['cases'], current['cases'])
    output = Path(output)
    output.mkdir(parents=True, exist_ok=False)
    with tempfile.TemporaryDirectory(prefix='moon-ide-replay-') as temp:
        workspace = copy_workspace(root, temp, platform)
        results = CramRunner(platform).run(workspace, cases, output / 'replay')['results']
        after = capture_manifest(workspace, platform, policy, provenance=current)
    errors = []
    if saved.get('resolved_dependencies') != after.get('resolved_dependencies'):
        errors.append('resolved dependency identity differs from recorded execution')
    filtered = {**policy, 'required_cells': [c for c in policy.get('required_cells', [])
                                           if c.get('platform', platform) == platform]}
    cells = coverage(cases, results, filtered)
    delta = {key: [] for key in ('retired', 'changed', 'ambiguous')}
    report = {'schema_version': 1, 'platform': platform, 'stages': {'replay': results},
              'coverage': cells, 'delta': delta, 'stability_errors': errors}
    report['gate'] = evaluate(report['stages'], delta, cells, errors)
    write_json(output / 'report.json', report)
    write_json(output / 'replayed-manifest.json', after)
    (output / 'report.md').write_text(markdown_report(report), encoding='utf-8')
    return report
