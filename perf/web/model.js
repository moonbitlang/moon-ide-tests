// Shared comparison rules for the browser and its unit tests.
export function sampleFor(run, id) {
  return run.samples.find(sample => sample.case_id === id) ?? {
    case_id: id, status: 'missing', elapsed_us: null, exit_code: null,
    error: run.error || 'No measurement was collected.',
  };
}

export function comparisonKey(run, info) {
  const fixture = run.fixtures.find(item => item.slug === info.fixture);
  if (!fixture?.commit || !fixture.suite_hash) return null;
  return JSON.stringify([
    run.platform, run.ci.branch, run.environment.architecture,
    run.environment.runner?.image_os || null,
    run.measurement_profile, fixture.commit, fixture.suite_hash,
  ]);
}

export function validTiming(sample) {
  return sample.status === 'ok' && typeof sample.elapsed_us === 'number'
    && Number.isFinite(sample.elapsed_us) && sample.elapsed_us >= 0;
}

export function baseline(runs, current, info) {
  const key = comparisonKey(current, info);
  if (!key || current.status !== 'ok' || !validTiming(sampleFor(current, info.id))) return null;
  const position = runs.findIndex(run => run.id === current.id);
  if (position < 0) return null;
  return runs.slice(position + 1).find(run => run.status === 'ok'
    && comparisonKey(run, info) === key && validTiming(sampleFor(run, info.id))) ?? null;
}

export function change(current, previous) {
  if (!validTiming(current) || !previous || !validTiming(previous) || previous.elapsed_us === 0) return null;
  return (current.elapsed_us / previous.elapsed_us - 1) * 100;
}

export function historyPoints(runs, current, info) {
  const key = comparisonKey(current, info);
  let previousImage;
  return [...runs].reverse().map(run => {
    const sample = sampleFor(run, info.id);
    const comparable = key !== null && comparisonKey(run, info) === key;
    const image = run.environment.runner?.image_version;
    const runnerChanged = Boolean(image && previousImage && image !== previousImage);
    if (image) previousImage = image;
    return {run, sample, comparable, runnerChanged, connected: comparable && run.status === 'ok' && validTiming(sample)};
  });
}

export function formatTime(microseconds) {
  if (typeof microseconds !== 'number' || !Number.isFinite(microseconds)) return '—';
  return `${new Intl.NumberFormat('en', {maximumFractionDigits: 1}).format(microseconds / 1000)} ms`;
}

export function versionLabel(text) {
  return text.split('\n').find(line => line.startsWith('moonc '))?.split(' ').slice(0, 2).join(' ')
    || text.split('\n')[0] || 'Unknown toolchain';
}

export function statusLabel(status) {
  return ({ok: 'Passed', failed: 'Failed', failure: 'Failed', timeout: 'Timeout',
    nonzero_exit: 'Command failed', process_error: 'Process error', missing: 'Missing',
    invalid_report: 'Invalid report', cancelled: 'Cancelled', skipped: 'Skipped'})[status] || status;
}

export async function mapLimit(items, limit, callback) {
  const output = new Array(items.length);
  let cursor = 0;
  await Promise.all(Array.from({length: Math.min(limit, items.length)}, async () => {
    while (cursor < items.length) {
      const index = cursor++;
      output[index] = await callback(items[index]);
    }
  }));
  return output;
}
