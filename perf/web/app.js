import {baseline, change, formatTime, historyPoints, mapLimit,
  sampleFor, statusLabel, validTiming, versionLabel} from './model.js';

const $ = id => document.getElementById(id);
const initial = new URLSearchParams(location.hash.slice(1));
const state = {
  platform: initial.get('platform') || 'unix', branch: initial.get('branch') || '',
  run: initial.get('run') || '', case: initial.get('case') || '',
  fixture: initial.get('fixture') || '', operation: initial.get('operation') || '',
  search: '', sort: 'name', range: ['14', '30', '90', '365'].includes(initial.get('range')) ? initial.get('range') : '30',
};
let index, runs = [], current, visibleCases = [], generation = 0;
const cache = new Map();
const shortDate = value => new Date(value).toLocaleString(undefined, {month: 'short', day: 'numeric', hour: '2-digit', minute: '2-digit'});
const fullDate = value => new Date(value).toLocaleString(undefined, {dateStyle: 'medium', timeStyle: 'short'});
const element = (tag, text, className) => {
  const node = document.createElement(tag);
  if (text !== undefined) node.textContent = text;
  if (className) node.className = className;
  return node;
};
const badge = status => element('span', statusLabel(status), `badge ${status}`);
const percentage = value => value === null ? '—' : `${value > 0 ? '+' : ''}${value.toFixed(1)}%`;
const sampleTime = sample => validTiming(sample) ? formatTime(sample.elapsed_us) : '—';

function link(text, href) {
  const node = element('a', text);
  // Links in data never decide the destination origin.
  const url = new URL(href, location.href);
  if (url.protocol === 'https:' && url.hostname === 'github.com') node.href = url.href;
  return node;
}

function persist() {
  const params = new URLSearchParams();
  for (const key of ['platform', 'branch', 'run', 'case', 'fixture', 'operation', 'range']) {
    if (state[key]) params.set(key, state[key]);
  }
  history.replaceState(null, '', `#${params}`);
}

function options(control, values, selected, emptyLabel) {
  control.replaceChildren();
  if (emptyLabel) control.add(new Option(emptyLabel, ''));
  for (const [value, label] of values) control.add(new Option(label, value));
  control.value = selected;
  if (control.selectedIndex < 0 && control.options.length) control.selectedIndex = 0;
  return control.value;
}

function selectRunEntries() {
  const branches = [...new Set(index.runs.map(run => run.branch))].sort();
  if (!branches.includes(state.branch)) state.branch = branches.includes(index.default_branch) ? index.default_branch : branches[0];
  state.branch = options($('branch'), branches.map(branch => [branch, branch]), state.branch);
  if (!['unix', 'windows'].includes(state.platform)) state.platform = 'unix';
  $('platform').value = state.platform;
  $('range').value = state.range;
  const entries = index.runs.filter(run => run.branch === state.branch && run.platform === state.platform);
  if (!entries.some(run => run.id === state.run)) state.run = entries[0]?.id || '';
  state.run = options($('run'), entries.map(run => [run.id,
    `${fullDate(run.started_at)} / #${run.ci.run_id}.${run.ci.attempt} / ${statusLabel(run.status)}`]), state.run);
  const selected = entries.findIndex(run => run.id === state.run);
  return selected < 0 ? [] : entries.slice(selected, selected + Number(state.range));
}

async function readRun(entry) {
  if (!/^runs\/\d+\/\d+\/(unix|windows)\.json$/.test(entry.path)) throw new Error('Invalid history data path.');
  if (!cache.has(entry.path)) {
    cache.set(entry.path, fetch(`./data/${entry.path}`).then(async response => {
      if (!response.ok) throw new Error(`A history record could not be loaded (${response.status}).`);
      const data = await response.json();
      if (data.schema_version !== 1 || data.id !== entry.id || !Array.isArray(data.samples)) throw new Error('Unsupported history record.');
      return data;
    }).catch(error => { cache.delete(entry.path); throw error; }));
  }
  return cache.get(entry.path);
}

async function loadRuns() {
  const request = ++generation;
  const entries = selectRunEntries();
  $('notice').hidden = false;
  $('notice').className = 'notice';
  $('notice').textContent = 'Loading selected runs…';
  try {
    const loaded = await mapLimit(entries, 6, readRun);
    if (request !== generation) return;
    runs = loaded;
    current = runs[0];
    if (!current) {
      $('notice').textContent = 'No performance runs are available for this selection.';
      $('queries').replaceChildren();
      $('query-detail').hidden = true;
      return;
    }
    $('notice').hidden = true;
    renderOverview();
    renderQueries();
    persist();
  } catch (error) {
    if (request !== generation) return;
    $('notice').textContent = error.message;
    $('notice').className = 'notice error';
  }
}

function renderOverview() {
  $('run-status').replaceChildren(badge(current.status));
  const counts = current.counts;
  $('run-counts').textContent = `${counts.ok} passed / ${counts.failed + counts.missing} failed or missing`;
  $('run-toolchain').textContent = versionLabel(current.environment.moon_version);
  $('run-toolchain').title = current.environment.moon_version;
  $('workflow-link').href = current.ci.url;
  const errors = [current.error, ...current.fixtures.map(fixture => fixture.error)].filter(Boolean);
  $('run-error').hidden = !errors.length;
  $('run-error').textContent = errors.join('\n').slice(0, 1600);
  $('updated-at').textContent = `Latest data: ${fullDate(index.updated_at)} (your local time)`;
}

function caseChange(info) {
  const previous = baseline(runs, current, info);
  return previous ? change(sampleFor(current, info.id), sampleFor(previous, info.id)) : null;
}

function renderQueries() {
  const ids = new Set(runs.flatMap(run => run.samples.map(sample => sample.case_id)));
  let cases = [...ids].map(id => index.cases[id]).filter(Boolean);
  const fixtures = [...new Set(cases.map(info => info.fixture))].sort();
  const operations = [...new Set(cases.map(info => info.operation))].sort();
  state.fixture = options($('fixture'), fixtures.map(value => [value, value]), state.fixture, 'All projects');
  state.operation = options($('operation'), operations.map(value => [value, value]), state.operation, 'All commands');
  const search = state.search.trim().toLowerCase();
  cases = cases.filter(info => (!state.fixture || info.fixture === state.fixture)
    && (!state.operation || info.operation === state.operation)
    && (!search || `${info.symbol} ${info.location} ${info.fixture}`.toLowerCase().includes(search)));
  const byName = (a, b) => `${a.operation}/${a.symbol}/${a.location}`.localeCompare(`${b.operation}/${b.symbol}/${b.location}`);
  cases.sort((a, b) => {
    if (state.sort === 'slowest') {
      const time = info => { const sample = sampleFor(current, info.id); return validTiming(sample) ? sample.elapsed_us : -1; };
      return time(b) - time(a) || byName(a, b);
    }
    if (state.sort === 'change') return (caseChange(b) ?? -Infinity) - (caseChange(a) ?? -Infinity) || byName(a, b);
    if (state.sort === 'errors') return Number(validTiming(sampleFor(current, a.id))) - Number(validTiming(sampleFor(current, b.id))) || byName(a, b);
    return byName(a, b);
  });
  visibleCases = cases;
  if (!cases.some(info => info.id === state.case)) state.case = cases[0]?.id || '';
  $('query-count').textContent = `${cases.length} ${cases.length === 1 ? 'query' : 'queries'}`;
  $('query-empty').hidden = !!cases.length;
  const fragment = document.createDocumentFragment();
  for (const info of cases) {
    const sample = sampleFor(current, info.id);
    const delta = caseChange(info);
    const row = element('tr');
    row.dataset.case = info.id;
    const name = element('td');
    const button = element('button', info.symbol, 'case-button');
    button.type = 'button';
    button.dataset.case = info.id;
    const operation = element('span', `${info.operation} / ${info.fixture}`, 'case-operation');
    const location = element('span', info.location, 'case-location');
    location.title = info.location;
    name.append(button, operation, location);
    const time = element('td', sampleTime(sample), 'number');
    const changed = element('td', percentage(delta), `number ${delta > 0 ? 'increased' : delta < 0 ? 'decreased' : 'muted'}`);
    const status = element('td');
    status.append(badge(sample.status));
    row.append(name, time, changed, status);
    fragment.append(row);
  }
  $('queries').replaceChildren(fragment);
  selectCase(state.case);
}

function selectCase(id) {
  state.case = id;
  for (const row of $('queries').querySelectorAll('tr')) {
    row.classList.toggle('selected', row.dataset.case === id);
    row.querySelector('button').setAttribute('aria-pressed', String(row.dataset.case === id));
  }
  const info = visibleCases.find(item => item.id === id);
  $('query-detail').hidden = !info;
  if (!info) { $('detail-heading').textContent = 'Select a query'; return; }
  $('detail-heading').textContent = `${info.operation} / ${info.symbol}`;
  $('query-target').textContent = info.target;
  $('query-location').textContent = `${info.fixture} / ${info.location}`;
  const sample = sampleFor(current, id);
  $('query-time').textContent = validTiming(sample) ? formatTime(sample.elapsed_us) : statusLabel(sample.status);
  const delta = caseChange(info);
  $('query-change').textContent = delta === null ? '' : `${percentage(delta)} vs previous comparable run`;
  $('query-change').className = delta > 0 ? 'increased' : 'decreased';
  const previous = baseline(runs, current, info);
  $('baseline-note').textContent = previous
    ? `Baseline: ${fullDate(previous.started_at)}. Project commit, suite, platform and measurement profile match.`
    : 'No comparable passing baseline in the selected history window.';
  $('query-command').textContent = `moon ${info.argv.map(arg => /^[\w./:@-]+$/.test(arg) ? arg : JSON.stringify(arg)).join(' ')}`;
  const points = historyPoints(runs, current, info);
  renderChart(points, info);
  renderHistory(points, info);
  renderPoint(points.at(-1), info);
  persist();
}

function renderPoint(point, info) {
  if (!point) return;
  const {run, sample, comparable} = point;
  const fixture = run.fixtures.find(item => item.slug === info.fixture);
  const details = element('dl');
  const add = (label, value) => {
    const term = element('dt', label), description = element('dd');
    description.append(typeof value === 'string' ? document.createTextNode(value) : value);
    details.append(term, description);
  };
  add('Selected point', fullDate(run.started_at));
  add('Run', link(`#${run.ci.run_id}.${run.ci.attempt} / ${run.ci.sha.slice(0, 7)}`, run.ci.url));
  add('Status', `${statusLabel(sample.status)}${run.status !== 'ok' ? ` / ${statusLabel(run.status)} run` : ''}`);
  add('Time', sampleTime(sample));
  add('Project', fixture?.commit || 'Not available');
  add('Conditions', `${run.measurement_profile}${comparable ? '' : ' / differs from selected run'}`);
  const runner = run.environment.runner || {};
  add('Runner', [run.environment.os, run.environment.architecture, runner.image_os, runner.image_version].filter(Boolean).join(' / ') || 'Not recorded');
  if (sample.error || fixture?.error || run.error) add('Error', element('span', sample.error || fixture?.error || run.error, 'point-error'));
  $('point-details').replaceChildren(...details.childNodes);
  $('full-toolchain').textContent = run.environment.moon_version;
}

function renderHistory(points, info) {
  const fragment = document.createDocumentFragment();
  for (const point of [...points].reverse()) {
    const row = element('tr'), time = element('td'), version = element('td');
    const button = element('button', shortDate(point.run.started_at));
    button.type = 'button';
    button.addEventListener('click', () => renderPoint(point, info));
    time.append(button);
    if (!point.comparable) time.append(element('span', 'Different configuration', 'config-note'));
    else if (point.run.status !== 'ok' && point.sample.status === 'ok') time.append(element('span', 'Partial run', 'config-note'));
    if (point.runnerChanged) time.append(element('span', 'Runner image changed', 'config-note'));
    version.textContent = versionLabel(point.run.environment.moon_version);
    version.title = point.run.environment.moon_version;
    const status = element('td');
    status.append(badge(point.sample.status));
    row.append(time, version, element('td', sampleTime(point.sample), 'number'), status);
    fragment.append(row);
  }
  $('history').replaceChildren(fragment);
}

function renderChart(points, info) {
  const ns = 'http://www.w3.org/2000/svg';
  const svgNode = (tag, attrs = {}, text) => {
    const node = document.createElementNS(ns, tag);
    for (const [key, value] of Object.entries(attrs)) node.setAttribute(key, value);
    if (text !== undefined) node.textContent = text;
    return node;
  };
  const width = Math.max($('chart').clientWidth, 300), height = 245, left = 59, right = 19, top = 24, bottom = 36;
  const svg = svgNode('svg', {viewBox: `0 0 ${width} ${height}`, role: 'group', 'aria-label': `Duration history for ${info.operation} ${info.symbol}`});
  const values = points.filter(point => point.comparable && validTiming(point.sample)).map(point => point.sample.elapsed_us / 1000);
  if (!values.length) {
    $('chart').replaceChildren(element('p', 'No successful comparable measurements in this window.', 'empty'));
    return;
  }
  const maximum = Math.max(...values, 1) * 1.2;
  const times = points.map(point => Date.parse(point.run.started_at));
  const first = Math.min(...times), last = Math.max(...times);
  const x = point => first === last ? (left + width - right) / 2 : left + (Date.parse(point.run.started_at) - first) / (last - first) * (width - left - right);
  const y = value => height - bottom - value / maximum * (height - top - bottom);
  svg.append(svgNode('text', {x: left, y: 12}, 'Time (ms)'));
  for (let i = 0; i <= 4; i++) {
    const value = maximum * i / 4, position = y(value);
    svg.append(svgNode('line', {x1: left, x2: width - right, y1: position, y2: position, class: 'grid'}));
    svg.append(svgNode('text', {x: left - 9, y: position + 4, 'text-anchor': 'end'}, new Intl.NumberFormat('en', {maximumFractionDigits: 0}).format(value)));
  }
  if (points.length) {
    svg.append(svgNode('text', {x: left, y: height - 10}, shortDate(points[0].run.started_at)));
    if (points.length > 1) svg.append(svgNode('text', {x: width - right, y: height - 10, 'text-anchor': 'end'}, shortDate(points.at(-1).run.started_at)));
  }
  let segment = [];
  const flush = () => {
    if (segment.length > 1) svg.append(svgNode('polyline', {points: segment.join(' '), class: 'trend'}));
    segment = [];
  };
  for (const point of points) {
    if (!point.connected) { flush(); continue; }
    segment.push(`${x(point)},${y(point.sample.elapsed_us / 1000)}`);
  }
  flush();
  for (const point of points) {
    const positionX = x(point);
    const positionY = point.comparable && validTiming(point.sample) ? y(point.sample.elapsed_us / 1000) : top + 4;
    const description = `${fullDate(point.run.started_at)}: ${statusLabel(point.sample.status)}, ${sampleTime(point.sample)}${point.comparable ? '' : ', different configuration'}${point.runnerChanged ? ', runner image changed' : ''}`;
    const group = svgNode('g', {class: 'point', tabindex: 0, role: 'button', 'aria-label': description});
    group.append(svgNode('title', {}, description), svgNode('circle', {cx: positionX, cy: positionY, r: 13, class: 'hit'}));
    const color = !point.comparable ? '#8f9bb0' : point.connected ? '#2755d8' : '#ba3546';
    if (validTiming(point.sample) && point.comparable) group.append(svgNode('circle', {cx: positionX, cy: positionY, r: 4.5, fill: color, stroke: 'white', 'stroke-width': 2}));
    else group.append(svgNode('path', {d: `M${positionX},${positionY - 5}l5,5l-5,5l-5,-5Z`, fill: color}));
    group.addEventListener('click', () => renderPoint(point, info));
    group.addEventListener('keydown', event => {
      if (event.key === 'Enter' || event.key === ' ') { event.preventDefault(); renderPoint(point, info); }
    });
    svg.append(group);
  }
  $('chart').replaceChildren(svg);
}

for (const id of ['platform', 'branch', 'run', 'range']) $(id).addEventListener('change', event => {
  state[id] = event.target.value;
  if (id === 'branch' || id === 'platform') state.run = '';
  loadRuns();
});
for (const id of ['fixture', 'operation', 'sort']) $(id).addEventListener('change', event => {
  state[id] = event.target.value;
  if (current) renderQueries();
});
$('search').addEventListener('input', event => { state.search = event.target.value; if (current) renderQueries(); });
$('queries').addEventListener('click', event => {
  const row = event.target.closest('tr[data-case]');
  if (row) selectCase(row.dataset.case);
});
let resizeFrame;
window.addEventListener('resize', () => {
  cancelAnimationFrame(resizeFrame);
  resizeFrame = requestAnimationFrame(() => {
    const info = visibleCases.find(item => item.id === state.case);
    if (info && current) renderChart(historyPoints(runs, current, info), info);
  });
});

try {
  const response = await fetch('./data/index.json', {cache: 'no-cache'});
  if (response.status === 404) {
    $('notice').textContent = 'No performance history has been published yet.';
  } else {
    if (!response.ok) throw new Error(`Performance history could not be loaded (${response.status}).`);
    index = await response.json();
    if (index.schema_version !== 1 || !Array.isArray(index.runs) || !index.cases) throw new Error('Unsupported history format.');
    if (!index.runs.length) $('notice').textContent = 'No performance runs are available yet.';
    else {
      if (/^[\w.-]+\/[\w.-]+$/.test(index.repository)) $('repository-link').href = `https://github.com/${index.repository}`;
      $('dashboard').hidden = false;
      await loadRuns();
    }
  }
} catch (error) {
  $('notice').textContent = `${error.message} Try reloading the page.`;
  $('notice').className = 'notice error';
}
