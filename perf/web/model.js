// Pure aggregation rules shared by the dashboard and its tests.
export const OPERATIONS = ['hover', 'peek-def', 'find-references', 'rename', 'outline'];

export function sampleFor(run, id) {
  return run.samples.find(sample => sample.case_id === id) ?? {
    case_id: id, status: 'missing', elapsed_us: null, exit_code: null,
    error: run.error || '未采集到此查询的测量。',
  };
}

export function validTiming(sample) {
  return sample.status === 'ok' && typeof sample.elapsed_us === 'number'
    && Number.isFinite(sample.elapsed_us) && sample.elapsed_us >= 0
    && (sample.exit_code === undefined || sample.exit_code === 0);
}

// Installation paths are not versions. Keep tool versions, revisions, dates
// and feature flags, including a CLI update with an unchanged compiler.
export function toolchainInfo(text) {
  if (typeof text !== 'string') return null;
  const lines = text.split(/\r?\n/).map(line => line.trim()).filter(Boolean);
  const tools = lines.map(line => line.match(/^(moon|moonc|moonrun)\s+(\S+)(?:\s+\(([^)]+)\))?/))
    .filter(Boolean).map(match => ({name: match[1], version: match[2], revision: match[3] || ''}));
  const compiler = tools.find(tool => tool.name === 'moonc');
  if (!compiler || !/\d/.test(compiler.version)) return null;
  const extras = lines.filter(line => !/^(moon|moonc|moonrun)\s/.test(line));
  const identity = [...tools].sort((a, b) => a.name.localeCompare(b.name));
  const id = JSON.stringify([identity, extras]);
  const revision = compiler.version.match(/\+([a-f\d]{7,})/i)?.[1]
    || compiler.revision.match(/\b([a-f\d]{7,})\b/i)?.[1];
  const channel = /nightly/i.test(compiler.version) ? 'nightly' : /dev/i.test(compiler.version) ? 'dev' : 'stable';
  const date = compiler.revision.match(/\d{4}-\d{2}-\d{2}/)?.[0];
  return {
    id, label: compiler.version, short: revision?.slice(0, 9) || compiler.version,
    base: compiler.version.split('+')[0], channel,
    releasedAt: date && Number.isFinite(Date.parse(date)) ? Date.parse(date) : null,
    full: text,
  };
}

export function measurementConditions(run, slug) {
  const fixture = run.fixtures.find(item => item.slug === slug);
  if (!fixture?.commit || !fixture.suite_hash || !run.measurement_profile) return null;
  const environment = run.environment;
  const image = environment.runner?.image_os || environment.os?.split(' ')[0] || 'unknown';
  const fields = {
    platform: run.platform, branch: run.ci.branch, fixture: slug,
    commit: fixture.commit, suite: fixture.suite_hash, profile: run.measurement_profile,
    architecture: environment.architecture || 'unknown', image,
  };
  return {key: JSON.stringify(Object.values(fields)), ...fields};
}

export function conditionGroups(runs, slug) {
  const groups = new Map();
  for (const run of runs) {
    const conditions = measurementConditions(run, slug);
    if (!conditions) continue;
    if (!groups.has(conditions.key)) groups.set(conditions.key, {...conditions, runs: 0, latest: run.started_at});
    const group = groups.get(conditions.key);
    group.runs++;
    if (Date.parse(run.started_at) > Date.parse(group.latest)) group.latest = run.started_at;
  }
  return [...groups.values()].sort((a, b) => Date.parse(b.latest) - Date.parse(a.latest) || a.key.localeCompare(b.key));
}

export function aggregateVersions(runs, cases, conditions, {channel = 'all', limit = 'all'} = {}) {
  const groups = new Map();
  let unknown = 0;
  for (const run of runs) {
    if (measurementConditions(run, conditions.fixture)?.key !== conditions.key) continue;
    const version = toolchainInfo(run.environment.moon_version);
    if (!version) { unknown++; continue; }
    if (channel !== 'all' && version.channel !== channel) continue;
    if (!groups.has(version.id)) groups.set(version.id, {...version, runs: [], firstSeen: run.started_at});
    const group = groups.get(version.id);
    group.runs.push(run);
    if (Date.parse(run.started_at) < Date.parse(group.firstSeen)) group.firstSeen = run.started_at;
  }
  let versions = [...groups.values()].sort((a, b) =>
    (a.releasedAt ?? Date.parse(a.firstSeen)) - (b.releasedAt ?? Date.parse(b.firstSeen))
    || Date.parse(a.firstSeen) - Date.parse(b.firstSeen) || a.id.localeCompare(b.id));
  // Count versions, never runs: ALL repeats of a displayed version participate.
  if (limit !== 'all') versions = versions.slice(-Number(limit));
  const labels = new Map();
  for (const version of versions) labels.set(version.short, (labels.get(version.short) || 0) + 1);
  const occurrences = new Map();
  for (const version of versions) {
    const ordinal = (occurrences.get(version.short) || 0) + 1;
    occurrences.set(version.short, ordinal);
    version.axisLabel = labels.get(version.short) > 1 ? `${version.short} / ${ordinal}` : version.short;
  }
  const series = cases.map(info => ({info, points: versions.map(version => {
    const observations = version.runs.map(run => ({run, sample: sampleFor(run, info.id)}));
    let mean = 0, n = 0, failed = 0, missing = 0;
    for (const {sample} of observations) {
      if (validTiming(sample)) { n++; mean += (sample.elapsed_us - mean) / n; }
      else if (sample.status === 'missing') missing++;
      else failed++;
    }
    return {version, caseId: info.id, mean: n ? mean : null, n, failed, missing, observations};
  })}));
  return {versions, series, unknown};
}

export function percentChange(current, previous) {
  if (current === null || previous === null || !Number.isFinite(current)
    || !Number.isFinite(previous) || previous <= 0) return null;
  return (current / previous - 1) * 100;
}

export function formatTime(microseconds) {
  if (typeof microseconds !== 'number' || !Number.isFinite(microseconds)) return '—';
  return `${new Intl.NumberFormat('en', {maximumFractionDigits: 1}).format(microseconds / 1000)} ms`;
}

export function statusLabel(status) {
  return ({ok: '成功', failed: '失败', failure: '失败', timeout: '超时', nonzero_exit: '命令失败',
    process_error: '进程错误', missing: '缺失', invalid_report: '报告无效', cancelled: '已取消', skipped: '已跳过'})[status] || status;
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
