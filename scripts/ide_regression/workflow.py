"""Isolated A/B/C execution; only explicit staging writes accepted snapshots."""
import copy
from pathlib import Path
import shutil
import tempfile

from .manifest import (_anchor, capture_manifest, compare_cases, digest, read_json,
                       tree_fingerprint, verify_inputs, write_json)
from .policy import coverage, evaluate, markdown_report
from .runner import CramRunner, stability_diff


def copy_workspace(source, destination, platform):
    destination = Path(destination)
    destination.mkdir(parents=True, exist_ok=True)
    ignore = shutil.ignore_patterns('.git', '_build', 'target', 'node_modules',
                                    '__pycache__', '.moonagent', '.repo')
    for name in ('fixtures', 'core_test', 'testgen', 'scripts'):
        if (Path(source) / name).exists():
            shutil.copytree(Path(source) / name, destination / name, ignore=ignore)
    shutil.copytree(Path(source) / 'tests' / platform, destination / 'tests' / platform)
    return destination


def revalidate(cases, root):
    cases = copy.deepcopy(cases)
    for case in cases:
        _, case['input_valid'], case['input_reason'], _ = _anchor(
            Path(root), case['repo_path'], case['argv'])
    return cases


def compact_manifest(manifest):
    result = copy.deepcopy(manifest)
    for case in result['cases']:
        case['expected_output_hash'] = digest(case.pop('expected_output'))
    return result


class RegressionRun:
    def __init__(self, root, platform, output, policy, *, runner=None, generate=None,
                 capture=capture_manifest):
        self.root = Path(root).resolve()
        self.platform = platform
        self.output = Path(output).resolve()
        self.policy = policy
        self.runner = runner or CramRunner(platform)
        self.generate = generate
        self.capture = capture

    def _capture(self, root, provenance=None):
        return self.capture(root, self.platform, self.policy, provenance=provenance)

    def begin(self):
        self.output.mkdir(parents=True, exist_ok=False)
        accepted = self._capture(self.root)
        write_json(self.output / 'accepted-manifest.json', accepted)
        with tempfile.TemporaryDirectory(prefix='moon-ide-A-') as temp:
            workspace = copy_workspace(self.root, temp, self.platform)
            a = self.runner.run(workspace, accepted['cases'], self.output / 'A')
            after = self._capture(workspace, accepted)
            differences = verify_inputs(accepted, after)
            if differences:
                a['results'].append({'id': 'frozen-inputs', 'status': 'infrastructure_error',
                                     'reason': 'Frozen inputs changed during A: ' + ', '.join(differences)})
            accepted['resolved_dependencies'] = after.get('resolved_dependencies')
        # Legacy baselines have no recorded creator; expose that fact rather
        # than assigning today's toolchain to a historical snapshot.
        catalog_path = self.root / 'baselines' / (self.platform + '.json')
        provenance = 'legacy creator unknown'
        if catalog_path.exists():
            catalog = read_json(catalog_path)
            for key in ('fixtures', 'baselines'):
                if catalog['inputs'][key] != accepted['inputs'][key]:
                    raise ValueError('Accepted baseline catalog differs: ' + key)
            provenance = catalog['inputs']['toolchain']
        write_json(self.output / 'accepted-manifest.json', accepted)
        write_json(self.output / 'state.json', {
            'schema_version': 1, 'platform': self.platform, 'root': str(self.root),
            'accepted': accepted, 'A': a['results'], 'baseline_creator': provenance})

    def _state(self):
        state = read_json(self.output / 'state.json')
        if state['platform'] != self.platform or Path(state['root']) != self.root:
            raise ValueError('Run belongs to a different checkout or platform')
        if state['accepted']['policy'] != self.policy:
            raise ValueError('Run policy changed')
        return state

    def finish(self):
        state = self._state()
        accepted = state['accepted']
        current = self._capture(self.root)
        changes = set(verify_inputs(accepted, current)) - {'fixtures', 'dependencies'}
        if changes:
            raise ValueError('Frozen inputs changed between A and B: ' + ', '.join(sorted(changes)))
        if self.generate is None:
            raise ValueError('Candidate generator is required')
        with tempfile.TemporaryDirectory(prefix='moon-ide-BC-') as temp:
            workspace = copy_workspace(self.root, Path(temp) / 'B', self.platform)
            b = self.runner.run(workspace, revalidate(accepted['cases'], workspace), self.output / 'B')
            first = copy_workspace(self.root, Path(temp) / 'candidate', self.platform)
            second = copy_workspace(self.root, Path(temp) / 'independent', self.platform)
            self.generate(first, self.platform, self.output / 'generation-first.log')
            self.generate(second, self.platform, self.output / 'generation-second.log')
            stability = []
            if tree_fingerprint(first / 'tests' / self.platform) != tree_fingerprint(second / 'tests' / self.platform):
                stability.append('independent generation produced different baseline files')
            generated = self._capture(first, current)
            cold = self.runner.run(first, generated['cases'], self.output / 'C-cold', update=True)
            candidate = self._capture(first, current)
            warm = self.runner.run(first, candidate['cases'], self.output / 'C-warm')
            after_warm = self._capture(first, current)
            unexpected_inputs = set(verify_inputs(current, after_warm)) - {'baselines'}
            if unexpected_inputs:
                stability.append('frozen inputs changed during C: ' + ', '.join(sorted(unexpected_inputs)))
            stability.extend(stability_diff(cold['results'], warm['results']))
            if candidate.get('resolved_dependencies') != after_warm.get('resolved_dependencies'):
                stability.append('resolved dependencies changed between cold and warm execution')
            candidate_dir = self.output / 'candidate'
            shutil.copytree(first / 'tests' / self.platform, candidate_dir / 'tests' / self.platform)
        delta = compare_cases(accepted['cases'], candidate['cases'])
        platform_policy = copy.deepcopy(self.policy)
        for field in ('required_cells', 'deferred_cells'):
            platform_policy[field] = [c for c in self.policy.get(field, []) if c.get('platform', self.platform) == self.platform]
        cells = coverage(candidate['cases'], warm['results'], platform_policy)
        stages = {'A': state['A'], 'B': b['results'], 'C-cold': cold['results'], 'C': warm['results']}
        report = {'schema_version': 1, 'platform': self.platform, 'stages': stages,
                  'delta': delta, 'coverage': cells, 'stability_errors': stability,
                  'baseline_creator': state.get('baseline_creator')}
        report['gate'] = evaluate(stages, delta, cells, stability)
        write_json(self.output / 'candidate-manifest.json', candidate)
        write_json(candidate_dir / 'baselines' / (self.platform + '.json'), compact_manifest(candidate))
        state.update(source_inputs=current, candidate_hash=tree_fingerprint(candidate_dir))
        write_json(self.output / 'state.json', state)
        write_json(self.output / 'report.json', report)
        (self.output / 'report.md').write_text(markdown_report(report), encoding='utf-8')
        return report

    def stage(self):
        state = self._state()
        candidate = self.output / 'candidate'
        if tree_fingerprint(candidate) != state.get('candidate_hash'):
            raise ValueError('candidate files changed after validation')
        differences = verify_inputs(state['source_inputs'], self._capture(self.root))
        if differences:
            raise ValueError('Source inputs changed before staging: ' + ', '.join(differences))
        source = candidate / 'tests' / self.platform
        target = self.root / 'tests' / self.platform
        incoming = {p.relative_to(source) for p in source.rglob('*') if p.is_file()}
        for path in target.rglob('*.mooncram.md'):
            if path.relative_to(target) not in incoming:
                path.unlink()
        for relative in incoming:
            destination = target / relative
            destination.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(source / relative, destination)
        destination = self.root / 'baselines' / (self.platform + '.json')
        destination.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(candidate / 'baselines' / destination.name, destination)
