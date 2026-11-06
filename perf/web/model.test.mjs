import test from 'node:test';
import assert from 'node:assert/strict';
import {baseline, change, historyPoints, mapLimit, sampleFor, validTiming} from './model.js';

const info = {id: 'query', fixture: 'openseek'};
const run = (id, extra = {}) => ({
  id, platform: 'unix', status: 'ok', ci: {branch: 'main'},
  environment: {architecture: 'x86_64'}, measurement_profile: 'prepared-cli-v1',
  fixtures: [{slug: 'openseek', commit: 'abc', suite_hash: 'suite'}],
  samples: [{case_id: 'query', status: 'ok', elapsed_us: 1000}], ...extra,
});

test('baselines exclude failed runs and changed measurement conditions, but allow a new nightly', () => {
  const current = run('current');
  const failed = run('failed', {status: 'failed'});
  const changed = run('changed', {measurement_profile: 'legacy-cli-v0'});
  const previous = run('previous', {environment: {architecture: 'x86_64', moon_version: 'old nightly'}});
  assert.equal(baseline([current, failed, changed, previous], current, info), previous);
  assert.equal(baseline([failed, previous], failed, info), null);
});

test('missing measurements and timeouts are gaps, never zero-duration observations', () => {
  const current = run('current');
  const timeout = run('timeout', {samples: [{case_id: 'query', status: 'timeout', elapsed_us: 60000000}]});
  const missing = run('missing', {samples: []});
  const points = historyPoints([current, timeout, missing], current, info);
  assert.deepEqual(points.map(point => point.connected), [false, false, true]);
  assert.equal(sampleFor(missing, info.id).elapsed_us, null);
  assert.equal(validTiming(timeout.samples[0]), false);
  assert.equal(change(current.samples[0], timeout.samples[0]), null);
});

test('a fixture or suite change breaks the trend line', () => {
  const current = run('current');
  const other = run('other', {fixtures: [{slug: 'openseek', commit: 'changed', suite_hash: 'suite'}]});
  const points = historyPoints([current, other], current, info);
  assert.equal(points[0].comparable, false);
  assert.equal(points[0].connected, false);
});

test('zero baselines and non-finite numbers do not yield false percentages', () => {
  assert.equal(change({status: 'ok', elapsed_us: 1}, {status: 'ok', elapsed_us: 0}), null);
  assert.equal(validTiming({status: 'ok', elapsed_us: NaN}), false);
  assert.equal(change({status: 'ok', elapsed_us: 1500}, {status: 'ok', elapsed_us: 1000}), 50);
});

test('runner image revisions are marked without hiding daily toolchain trends', () => {
  const current = run('current', {environment: {architecture: 'x86_64', runner: {image_os: 'ubuntu24', image_version: 'new'}}});
  const previous = run('previous', {environment: {architecture: 'x86_64', runner: {image_os: 'ubuntu24', image_version: 'old'}}});
  const points = historyPoints([current, previous], current, info);
  assert.equal(points[1].runnerChanged, true);
  assert.equal(points[1].connected, true);
  assert.equal(baseline([current, previous], current, info), previous);
});

test('history fetching preserves order and bounds concurrency', async () => {
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
