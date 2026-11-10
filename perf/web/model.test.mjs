import test from 'node:test';
import assert from 'node:assert/strict';
import {aggregateVersions, conditionGroups, mapLimit, measurementConditions,
  percentChange, toolchainInfo, validTiming} from './model.js';

const cases = [{id: 'query', fixture: 'openseek'}, {id: 'other', fixture: 'openseek'}];
const version = (hash = 'aaaaaaa', date = '2026-11-01', cli = '1111111', path = '~/.moon/bin/') =>
  `moon 0.1.20261101 (${cli} ${date}) ${path}moon\nmoonc v0.10.20+${hash}-nightly (${date}) ${path}moonc\nmoonrun 0.1.20261101 (${cli} ${date}) ${path}moonrun\n\nFeature flags enabled: rr_moon_mod`;
const run = (id, value = 1000, extra = {}) => ({
  id, started_at: '2026-11-02T00:00:00Z', platform: 'unix', status: 'ok', ci: {branch: 'main'},
  environment: {os: 'Linux 7.0', architecture: 'x86_64', moon_version: version(), runner: {image_os: 'ubuntu24', image_version: 'revision-1'}},
  measurement_profile: 'prepared-cli-v1', fixtures: [{slug: 'openseek', commit: 'project', suite_hash: 'suite'}],
  samples: [{case_id: 'query', status: 'ok', elapsed_us: value, exit_code: 0}], ...extra,
});
const aggregate = (runs, options = {}, selectedCases = cases) =>
  aggregateVersions(runs, selectedCases, measurementConditions(runs[0], 'openseek'), options);
const withVersion = (id, value, text, date = '2026-11-02T00:00:00Z') =>
  run(id, value, {started_at: date, environment: {...run(id).environment, moon_version: text}});

test('same-version query means use every successful observation, including a partial run', () => {
  const first = run('a', 1000), second = run('b', 3000, {status: 'failed'});
  first.samples.push({case_id: 'other', status: 'ok', elapsed_us: 10000, exit_code: 0});
  const result = aggregate([first, second]);
  assert.equal(result.versions.length, 1);
  assert.equal(result.series[0].points[0].mean, 2000);
  assert.equal(result.series[0].points[0].n, 2);
  assert.equal(result.series[1].points[0].mean, 10000);
  assert.equal(result.series[1].points[0].missing, 1);
  assert.equal(result.series[0].points[0].observations[1].run.id, 'b');
});

test('timeout, process error and missing observations do not enter the mean', () => {
  const bad = run('bad', 0, {samples: [{case_id: 'query', status: 'timeout', elapsed_us: 60000000}]});
  const error = run('error', 0, {samples: [{case_id: 'query', status: 'process_error', elapsed_us: 0}]});
  const result = aggregate([run('ok', 3000), bad, error, run('missing', 0, {samples: []})]);
  const point = result.series[0].points[0];
  assert.deepEqual([point.mean, point.n, point.failed, point.missing], [3000, 1, 2, 1]);
  assert.equal(point.observations.length, 4);
});

test('a version with no successful measurements is a null gap, never zero', () => {
  const first = run('old');
  const failure = withVersion('failed', 0, version('bbbbbbb', '2026-11-03'));
  failure.samples = [{case_id: 'query', status: 'timeout', elapsed_us: 60000000}];
  const next = withVersion('next', 900, version('ccccccc', '2026-11-04'));
  const points = aggregate([first, failure, next]).series[0].points;
  assert.deepEqual(points.map(point => point.mean), [1000, null, 900]);
  assert.equal(percentChange(points[2].mean, points[1].mean), null);
});

test('versions sort by toolchain date, not hash or a late repeat of an old version', () => {
  const recent = withVersion('new', 2000, version('aaaaaaa', '2026-11-03'), '2026-11-04T00:00:00Z');
  const old = withVersion('old', 1000, version('fffffff', '2026-11-01'), '2026-11-02T00:00:00Z');
  const repeat = withVersion('repeat', 3000, version('fffffff', '2026-11-01'), '2026-11-20T00:00:00Z');
  const result = aggregate([recent, repeat, old]);
  assert.deepEqual(result.versions.map(item => item.short), ['fffffff', 'aaaaaaa']);
  assert.deepEqual(result.series[0].points.map(point => point.mean), [2000, 2000]);
});

test('versions without release dates use their first observation', () => {
  const first = withVersion('first', 1000, 'moonc v0.9.0', '2026-10-01T00:00:00Z');
  const second = withVersion('second', 900, 'moonc v0.10.0', '2026-10-02T00:00:00Z');
  assert.deepEqual(aggregate([second, first]).versions.map(item => item.label), ['v0.9.0', 'v0.10.0']);
});

test('a version limit retains all repeats, not just N recent workflow runs', () => {
  const runs = [run('old')];
  for (let i = 0; i < 35; i++) runs.push(withVersion(`repeat-${i}`, i * 100, version('bbbbbbb', '2026-11-03')));
  const result = aggregate(runs, {limit: '1'});
  assert.equal(result.versions.length, 1);
  assert.equal(result.series[0].points[0].n, 35);
  assert.equal(result.series[0].points[0].mean, 1700);
});

test('exact SDK identity ignores install paths and line endings, but distinguishes tool revisions and flags', () => {
  const original = toolchainInfo(version());
  const otherPath = toolchainInfo(version('aaaaaaa', '2026-11-01', '1111111', '/opt/moon/').replaceAll('\n', '\r\n'));
  assert.equal(original.id, otherPath.id);
  assert.notEqual(original.id, toolchainInfo(version('aaaaaaa', '2026-11-01', '2222222')).id);
  assert.notEqual(original.id, toolchainInfo(`${version()}\nFeature flags enabled: experimental`).id);
  assert.equal(original.short, 'aaaaaaa');
  assert.equal(toolchainInfo('Unknown toolchain'), null);
});

test('SDKs sharing a compiler retain distinct points and disambiguated axis labels', () => {
  const first = run('first');
  const other = withVersion('other', 2000, version('aaaaaaa', '2026-11-01', '2222222'));
  const result = aggregate([first, other]);
  assert.equal(result.versions.length, 2);
  assert.equal(new Set(result.versions.map(item => item.axisLabel)).size, 2);
});

test('fixture commit, suite, profile, branch, platform, architecture and runner family partition observations', () => {
  const base = run('base');
  const variants = [
    run('commit', 9999, {fixtures: [{slug: 'openseek', commit: 'changed', suite_hash: 'suite'}]}),
    run('suite', 9999, {fixtures: [{slug: 'openseek', commit: 'project', suite_hash: 'changed'}]}),
    run('profile', 9999, {measurement_profile: 'legacy-cli-v0'}),
    run('branch', 9999, {ci: {branch: 'feature'}}),
    run('platform', 9999, {platform: 'windows'}),
    run('architecture', 9999, {environment: {...base.environment, architecture: 'arm64'}}),
    run('image', 9999, {environment: {...base.environment, runner: {image_os: 'ubuntu26'}}}),
  ];
  for (const variant of variants) {
    assert.notEqual(measurementConditions(base, 'openseek').key, measurementConditions(variant, 'openseek').key);
    assert.equal(aggregate([base, variant]).series[0].points[0].mean, 1000);
  }
  assert.equal(conditionGroups([base, ...variants], 'openseek').length, 8);
});

test('runner patch revisions stay in the same image family, with provenance retained', () => {
  const first = run('first'), second = run('second', 3000);
  second.environment.runner.image_version = 'revision-2';
  const point = aggregate([first, second]).series[0].points[0];
  assert.equal(point.mean, 2000);
  assert.deepEqual(point.observations.map(item => item.run.environment.runner.image_version), ['revision-1', 'revision-2']);
});

test('unknown versions and incomplete suites cannot create made-up aggregate points', () => {
  const unknown = withVersion('unknown', 9999, 'Unknown toolchain');
  const incomplete = run('incomplete', 9999, {fixtures: [{slug: 'openseek', commit: 'project', suite_hash: null}]});
  const result = aggregate([run('base'), unknown, incomplete]);
  assert.equal(result.unknown, 1);
  assert.equal(result.series[0].points[0].mean, 1000);
  assert.equal(conditionGroups([incomplete], 'openseek').length, 0);
});

test('channel filtering does not mix dev, nightly and stable observations', () => {
  const nightly = run('nightly'), dev = withVersion('dev', 2000, version().replace('-nightly', '-dev'));
  const stable = withVersion('stable', 3000, version().replace('-nightly', ''));
  assert.equal(aggregate([nightly, dev, stable]).versions.length, 3);
  assert.equal(aggregate([nightly, dev, stable], {channel: 'nightly'}).series[0].points[0].mean, 1000);
  assert.equal(aggregate([nightly], {channel: 'stable'}).versions.length, 0);
});

test('zero is valid, but invalid values and zero baselines do not create false percentages', () => {
  assert.equal(validTiming({status: 'ok', elapsed_us: 0, exit_code: 0}), true);
  for (const elapsed_us of [NaN, Infinity, -1, null, '100']) assert.equal(validTiming({status: 'ok', elapsed_us}), false);
  assert.equal(validTiming({status: 'ok', elapsed_us: 100, exit_code: 1}), false);
  assert.equal(percentChange(1, 0), null);
  assert.equal(percentChange(1, null), null);
  assert.equal(percentChange(0, 100), -100);
  assert.equal(percentChange(1500, 1000), 50);
});

test('history loading preserves order and bounds concurrency', async () => {
  let active = 0, maximum = 0;
  const result = await mapLimit([1, 2, 3, 4], 2, async value => {
    maximum = Math.max(maximum, ++active);
    await new Promise(resolve => setTimeout(resolve, 5));
    active--;
    return value * 2;
  });
  assert.deepEqual(result, [2, 4, 6, 8]);
  assert.equal(maximum, 2);
});
