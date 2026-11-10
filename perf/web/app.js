import {OPERATIONS, aggregateVersions, conditionGroups, formatTime, mapLimit,
  measurementConditions, percentChange, statusLabel, toolchainInfo, validTiming} from './model.js';

const $ = id => document.getElementById(id);
const initial = new URLSearchParams(location.hash.slice(1));
const state = {
  platform: initial.get('platform') === 'windows' ? 'windows' : 'unix',
  branch: initial.get('branch') || '', fixture: initial.get('fixture') || '',
  operation: OPERATIONS.includes(initial.get('operation')) ? initial.get('operation') : 'hover',
  group: initial.get('group') || '',
  channel: ['nightly', 'stable', 'dev'].includes(initial.get('channel')) ? initial.get('channel') : 'all',
  range: ['12', '24', '60', 'all'].includes(initial.get('range')) ? initial.get('range') : '12',
};
const colors = ['#3567d6', '#288d8b', '#cc8b2b', '#8667b7', '#b95d7b', '#4a819c', '#788344', '#b56d49'];
const cache = new Map(), selections = new Map();
let index, runs = [], cases = [], activeCases = [], groups = [], conditions;
let data = {versions: [], series: [], unknown: 0}, generation = 0, selectedPoint;
let pendingQueries = initial.has('queries') ? initial.get('queries').split(',').filter(Boolean) : null;
const element = (tag, text, className) => {
  const node = document.createElement(tag);
  if (text !== undefined) node.textContent = text;
  if (className) node.className = className;
  return node;
};
const fullDate = value => new Date(value).toLocaleString(undefined, {dateStyle: 'medium', timeStyle: 'short'});
const percentage = value => value === null ? '—' : `${value > 0 ? '+' : ''}${value.toFixed(1)}%`;
const changeClass = value => value > 0 ? 'increased' : value < 0 ? 'decreased' : 'muted';
const profileLabel = value => value?.startsWith('prepared-mooncram-v1/')
  ? `Mooncram ${value.slice('prepared-mooncram-v1/'.length)} / 标准库预检`
  : ({'prepared-cli-v1': '标准库预检', 'legacy-cli-v0': '旧计时方式'})[value] || value;
const selectionKey = () => `${state.fixture}/${state.operation}`;
const selectedIds = () => selections.get(selectionKey()) || [];
const selectedSeries = () => data.series.filter(series => selectedIds().includes(series.info.id));
const colorFor = info => colors[Math.max(0, activeCases.findIndex(item => item.id === info.id)) % colors.length];
const deltaAt = (series, position) => percentChange(series.points[position].mean, series.points[position - 1]?.mean ?? null);

function githubLink(text, href) {
  const node = element('a', text);
  const url = new URL(href, location.href);
  if (url.protocol === 'https:' && url.hostname === 'github.com') node.href = url.href;
  return node;
}

function persist() {
  const params = new URLSearchParams();
  for (const key of ['platform', 'branch', 'fixture', 'operation', 'group', 'channel', 'range']) {
    if (state[key]) params.set(key, state[key]);
  }
  params.set('queries', selectedIds().join(','));
  history.replaceState(null, '', `#${params}`);
}

function options(control, values, selected) {
  control.replaceChildren(...values.map(([value, label]) => new Option(label, value)));
  control.value = selected;
  if (control.selectedIndex < 0 && control.options.length) control.selectedIndex = 0;
  return control.value;
}

async function readRun(entry) {
  if (!/^runs\/\d+\/\d+\/(unix|windows)\.json$/.test(entry.path)) throw new Error('历史数据路径无效。');
  if (!cache.has(entry.path)) {
    cache.set(entry.path, fetch(`./data/${entry.path}`).then(async response => {
      if (!response.ok) throw new Error(`历史记录加载失败（${response.status}）。`);
      const run = await response.json();
      if (run.schema_version !== 1 || run.id !== entry.id || !Array.isArray(run.samples)) throw new Error('不支持的历史记录格式。');
      return run;
    }).catch(error => { cache.delete(entry.path); throw error; }));
  }
  return cache.get(entry.path);
}

async function loadRuns() {
  const request = ++generation;
  const branches = [...new Set(index.runs.map(run => run.branch))].sort();
  if (!branches.includes(state.branch)) state.branch = branches.includes(index.default_branch) ? index.default_branch : branches[0];
  state.branch = options($('branch'), branches.map(value => [value, value]), state.branch);
  for (const button of document.querySelectorAll('[data-platform]')) button.setAttribute('aria-pressed', String(button.dataset.platform === state.platform));
  const entries = index.runs.filter(run => run.branch === state.branch && run.platform === state.platform);
  $('chart-section').setAttribute('aria-busy', 'true');
  $('notice').hidden = false;
  $('notice').className = 'notice';
  $('notice').textContent = '正在加载原始测量并按版本聚合…';
  $('open-records').disabled = true;
  try {
    // Load every repeat in this branch/platform. A version range must NEVER
    // truncate that version's observations to the most recent N workflow runs.
    const loaded = await mapLimit(entries, 6, readRun);
    if (request !== generation) return;
    runs = loaded.sort((a, b) => Date.parse(b.started_at) - Date.parse(a.started_at) || b.id.localeCompare(a.id));
    $('notice').hidden = true;
    $('chart-section').setAttribute('aria-busy', 'false');
    $('open-records').disabled = false;
    refresh();
  } catch (error) {
    if (request !== generation) return;
    $('notice').textContent = `${error.message} 请刷新页面重试。`;
    $('notice').className = 'notice error';
    // Keep stale data disabled: it must not masquerade as a new selection.
  }
}

function refresh() {
  const slugs = [...new Set(Object.values(index.cases).map(info => info.fixture))].sort();
  state.fixture = options($('fixture'), slugs.map(value => [value, value]), state.fixture);
  groups = conditionGroups(runs, state.fixture);
  state.group = options($('conditions'), groups.map(group => [group.key,
    `${group.commit.slice(0, 8)} / ${profileLabel(group.profile)} / ${group.image} / ${group.architecture} / ${group.suite.slice(0, 6)}`]), state.group);
  conditions = groups.find(group => group.key === state.group);
  const groupRuns = conditions ? runs.filter(run => measurementConditions(run, state.fixture)?.key === conditions.key) : [];
  const ids = new Set(groupRuns.flatMap(run => run.samples.map(sample => sample.case_id)));
  cases = Object.values(index.cases).filter(info => info.fixture === state.fixture && ids.has(info.id));
  $('context').textContent = [state.branch, conditions ? `${state.fixture} ${conditions.commit.slice(0, 8)}` : state.fixture,
    conditions ? `${conditions.image} / ${conditions.architecture}` : '尚无完整测量组', conditions ? profileLabel(conditions.profile) : ''].filter(Boolean).join('  /  ');
  $('record-count').textContent = runs.length ? String(runs.length) : '';
  $('updated-at').textContent = `数据更新于 ${fullDate(index.updated_at)}`;
  $('channel').value = state.channel;
  $('range').value = state.range;
  renderConditions();
  renderCommands();
  updateChart();
}

function renderConditions() {
  const fragment = document.createDocumentFragment();
  const values = conditions ? [
    ['项目 commit', conditions.commit], ['测试集', conditions.suite], ['计时方式', conditions.profile],
    ['平台', `${conditions.platform} / ${conditions.architecture}`], ['Runner 系列', conditions.image],
    ['原始记录', `${conditions.runs} 次`],
  ] : [['测量组', '尚无项目 commit 和完整测试集信息；可在原始记录中查看准备失败等情况。']];
  for (const [label, value] of values) fragment.append(element('dt', label), element('dd', value));
  $('condition-details').replaceChildren(fragment);
}

function renderCommands() {
  const fragment = document.createDocumentFragment();
  for (const operation of OPERATIONS) {
    const button = element('button', operation);
    button.id = `tab-${operation}`;
    button.type = 'button';
    button.dataset.operation = operation;
    button.setAttribute('role', 'tab');
    button.setAttribute('aria-selected', String(operation === state.operation));
    button.setAttribute('aria-controls', 'command-panel');
    button.tabIndex = operation === state.operation ? 0 : -1;
    button.append(element('span', String(cases.filter(info => info.operation === operation).length)));
    fragment.append(button);
  }
  $('commands').replaceChildren(fragment);
  $('command-panel').setAttribute('aria-labelledby', `tab-${state.operation}`);
}

function updateChart() {
  activeCases = cases.filter(info => info.operation === state.operation);
  if (!selections.has(selectionKey())) {
    selections.set(selectionKey(), pendingQueries ?? activeCases.slice(0, 4).map(info => info.id));
    pendingQueries = null;
  }
  selections.set(selectionKey(), selectedIds().filter(id => activeCases.some(info => info.id === id)));
  data = conditions ? aggregateVersions(runs, activeCases, conditions, {channel: state.channel, limit: state.range})
    : {versions: [], series: [], unknown: 0};
  $('chart-heading').textContent = state.operation;
  $('query-count').textContent = `${activeCases.length} 条固定查询`;
  $('version-count').textContent = `${data.versions.length} 个版本`;
  const ungrouped = runs.length - (conditions?.runs || 0);
  $('dataset-note').textContent = conditions
    ? `${conditions.runs} 次记录 · 按精确工具链版本聚合${ungrouped ? ` · 其他条件 ${ungrouped} 次` : ''}${data.unknown ? ` · 版本未知 ${data.unknown} 次` : ''}`
    : '准备失败与缺失报告可在原始记录中查看';
  $('selection-count').textContent = `已选 ${selectedIds().length} / ${activeCases.length}`;
  $('export').disabled = !selectedIds().length || !data.versions.length;
  selectedPoint = null;
  $('point-detail').hidden = true;
  $('tooltip').hidden = true;
  renderLegend();
  renderChart();
  renderVersionData();
  if ($('query-dialog').open) renderPicker();
  persist();
}

function setQuery(id, checked) {
  const ids = new Set(selectedIds());
  if (checked) ids.add(id); else ids.delete(id);
  selections.set(selectionKey(), [...ids]);
  updateChart();
}

function renderLegend() {
  const fragment = document.createDocumentFragment();
  for (const series of selectedSeries()) {
    const {info} = series;
    const label = element('label');
    label.title = `${info.symbol} / ${info.location} / ${info.target}`;
    label.style.setProperty('--series-color', colorFor(info));
    const input = element('input');
    input.type = 'checkbox'; input.checked = true;
    input.setAttribute('aria-label', `显示 ${info.symbol} / ${info.location}`);
    input.addEventListener('change', () => setQuery(info.id, input.checked));
    label.append(input, element('span', '', 'series-dot'), element('span', info.symbol));
    fragment.append(label);
  }
  $('legend').replaceChildren(fragment);
}

function renderPicker() {
  const focused = $('query-options').contains(document.activeElement) ? document.activeElement.dataset.case : null;
  const search = $('search').value.trim().toLowerCase();
  const visible = activeCases.filter(info => `${info.symbol} ${info.location} ${info.target}`.toLowerCase().includes(search));
  const fragment = document.createDocumentFragment();
  for (const info of visible) {
    const label = element('label', undefined, 'query-option'), input = element('input'), name = element('span');
    input.type = 'checkbox'; input.checked = selectedIds().includes(info.id);
    input.dataset.case = info.id;
    input.addEventListener('change', () => setQuery(info.id, input.checked));
    name.append(element('strong', info.symbol), element('small', `${info.location} / ${info.target}`));
    label.append(input, name); fragment.append(label);
  }
  if (!visible.length) fragment.append(element('p', '没有匹配的查询。', 'muted'));
  $('query-options').replaceChildren(fragment);
  if (focused) [...$('query-options').querySelectorAll('input')].find(input => input.dataset.case === focused)?.focus({preventScroll: true});
  $('picker-caption').textContent = `${state.operation} / ${activeCases.length} 条固定查询，每条查询对应一条曲线。`;
  $('picker-count').textContent = `已选 ${selectedIds().length} 条`;
}

function renderTooltip(series, position) {
  const point = series.points[position], delta = deltaAt(series, position);
  $('tooltip').replaceChildren(
    element('span', point.version.label), element('strong', series.info.symbol),
    element('span', `平均 ${formatTime(point.mean)}`, 'mean'),
    element('span', `有效 ${point.n} 次 · 错误 ${point.failed} 次 · 缺失 ${point.missing} 次`),
    element('span', delta === null ? '无可比较的前一版本' : `较前版 ${percentage(delta)}`, changeClass(delta)),
    element('span', '点击查看原始测量'),
  );
  $('tooltip').hidden = false;
}

function renderChart() {
  $('scroll-hint').hidden = true;
  const series = selectedSeries();
  const values = series.flatMap(item => item.points.filter(point => point.mean !== null).map(point => point.mean / 1000));
  if (!values.length) {
    const title = !conditions ? '尚无完整测量组' : !data.versions.length ? '当前条件下没有此通道的版本' : !series.length ? '选择想要观察的查询' : '尚无成功采样';
    const description = !conditions ? '打开原始记录查看准备过程和缺失报告。' : !data.versions.length ? '切换版本通道或测量条件。' : !series.length ? '添加固定查询，在同一张图中比较它们的版本趋势。' : '错误和缺失不会显示成零耗时，可展开版本数据查看。';
    const empty = element('div', undefined, 'empty');
    empty.append(element('strong', title), element('span', description));
    $('chart').replaceChildren(empty);
    return;
  }
  const ns = 'http://www.w3.org/2000/svg';
  const node = (tag, attributes = {}, text) => {
    const result = document.createElementNS(ns, tag);
    for (const [key, value] of Object.entries(attributes)) result.setAttribute(key, value);
    if (text !== undefined) result.textContent = text;
    return result;
  };
  const width = Math.max($('chart').clientWidth, data.versions.length * 105 + 70, 340);
  $('scroll-hint').hidden = width <= $('chart').clientWidth;
  const height = 355, left = 64, right = 50, top = 18, bottom = 53;
  const svg = node('svg', {width, height, viewBox: `0 0 ${width} ${height}`, role: 'group',
    'aria-label': `${state.operation} 各固定查询的版本平均耗时；横轴为 MoonBit 版本，纵轴为毫秒`});
  const minimum = Math.min(...values), maximum = Math.max(...values), padding = (maximum - minimum || maximum * .1 || 1) * .18;
  const rawStep = (maximum - minimum + padding * 2) / 4;
  const scale = 10 ** Math.floor(Math.log10(rawStep));
  const step = ([1, 2, 5, 10].find(value => value >= rawStep / scale) || 10) * scale;
  const lower = Math.max(0, Math.floor((minimum - padding) / step) * step);
  const upper = Math.max(lower + step, Math.ceil((maximum + padding) / step) * step);
  const x = position => data.versions.length === 1 ? (left + width - right) / 2 : left + position / (data.versions.length - 1) * (width - left - right);
  const y = value => height - bottom - (value - lower) / (upper - lower) * (height - top - bottom);
  for (let value = lower; value <= upper + step / 100; value += step) {
    const position = y(value);
    svg.append(node('line', {x1: left, x2: width - right, y1: position, y2: position, class: 'grid'}));
    svg.append(node('text', {x: left - 12, y: position + 4, 'text-anchor': 'end'},
      new Intl.NumberFormat('en', {maximumFractionDigits: Math.max(0, Math.min(6, Math.ceil(-Math.log10(step))))}).format(value)));
  }
  data.versions.forEach((version, position) => {
    svg.append(node('line', {x1: x(position), x2: x(position), y1: top, y2: height - bottom, class: 'vertical-grid'}));
    const label = node('text', {x: x(position), y: height - 29, 'text-anchor': 'middle'});
    label.append(node('title', {}, version.full), document.createTextNode(version.axisLabel));
    svg.append(label, node('text', {x: x(position), y: height - 12, 'text-anchor': 'middle', class: 'axis-secondary'}, `${version.base} / ${version.channel}`));
  });
  for (const item of series) {
    const color = colorFor(item.info);
    const styleIndex = Math.floor(activeCases.findIndex(info => info.id === item.info.id) / colors.length);
    const dash = styleIndex ? styleIndex === 1 ? '6 3' : '2 3' : '';
    let segment = [];
    const flush = () => {
      if (segment.length > 1) svg.append(node('polyline', {points: segment.join(' '), class: 'trend', stroke: color, 'stroke-dasharray': dash}));
      segment = [];
    };
    item.points.forEach((point, position) => {
      if (point.mean === null) { flush(); return; }
      segment.push(`${x(position)},${y(point.mean / 1000)}`);
    });
    flush();
    item.points.forEach((point, position) => {
      if (point.mean === null) return;
      const label = `${item.info.symbol} / ${item.info.location} / ${point.version.label}：平均 ${formatTime(point.mean)}，有效 ${point.n} 次，错误 ${point.failed} 次，缺失 ${point.missing} 次`;
      const group = node('g', {class: 'point', tabindex: 0, role: 'button', 'aria-label': label,
        'data-case': item.info.id, 'data-position': position});
      group.append(node('title', {}, label), node('circle', {cx: x(position), cy: y(point.mean / 1000), r: 13, class: 'hit'}),
        node('circle', {cx: x(position), cy: y(point.mean / 1000), r: 3.6, fill: 'white', stroke: color, 'stroke-width': 2, class: 'mean-dot'}));
      group.addEventListener('mouseenter', () => renderTooltip(item, position));
      group.addEventListener('mouseleave', () => { $('tooltip').hidden = true; });
      group.addEventListener('focus', () => renderTooltip(item, position));
      group.addEventListener('blur', () => { $('tooltip').hidden = true; });
      group.addEventListener('click', () => selectPoint(item, position));
      group.addEventListener('keydown', event => {
        if (event.key === 'Enter' || event.key === ' ') { event.preventDefault(); selectPoint(item, position); }
        if (event.key === 'Escape') $('tooltip').hidden = true;
      });
      svg.append(group);
    });
  }
  $('chart').replaceChildren(svg);
}

function renderVersionData() {
  const fragment = document.createDocumentFragment();
  for (let position = data.versions.length - 1; position >= 0; position--) {
    for (const series of selectedSeries()) {
      const point = series.points[position], row = element('tr'), version = element('td'), query = element('td');
      const button = element('button', point.version.axisLabel);
      button.type = 'button'; button.title = point.version.label;
      button.addEventListener('click', () => selectPoint(series, position));
      version.append(button, element('small', point.version.label));
      query.append(element('span', series.info.symbol), element('small', `${series.info.location} / ${series.info.target}`));
      const delta = deltaAt(series, position);
      row.append(version, query, element('td', formatTime(point.mean), 'number'), element('td', String(point.n), 'number'),
        element('td', `${point.failed} / ${point.missing}`, 'number'), element('td', percentage(delta), `number ${changeClass(delta)}`));
      fragment.append(row);
    }
  }
  if (!fragment.childNodes.length) {
    const row = element('tr'), cell = element('td', '当前选择没有可展示的版本数据。');
    cell.colSpan = 6; row.append(cell); fragment.append(row);
  }
  $('version-rows').replaceChildren(fragment);
}

function selectPoint(series, position) {
  const point = series.points[position];
  selectedPoint = {caseId: series.info.id, versionId: point.version.id};
  for (const group of $('chart').querySelectorAll('.point')) {
    group.classList.toggle('selected', group.dataset.case === series.info.id && Number(group.dataset.position) === position);
  }
  $('point-heading').textContent = `${series.info.symbol} / 原始测量`;
  $('point-caption').textContent = `${point.version.label} / ${series.info.location} / ${series.info.target}`;
  const delta = deltaAt(series, position);
  $('point-summary').replaceChildren(element('strong', formatTime(point.mean)), element('span', `有效 ${point.n} 次`),
    element('span', `错误 ${point.failed} 次 · 缺失 ${point.missing} 次`),
    element('span', delta === null ? '无可比较的前一版本' : `较前版 ${percentage(delta)}`, changeClass(delta)));
  const fragment = document.createDocumentFragment();
  for (const {run, sample} of [...point.observations].sort((a, b) => Date.parse(b.run.started_at) - Date.parse(a.run.started_at))) {
    const row = element('tr'), name = element('td'), status = element('td'), metadata = element('td');
    name.append(githubLink(`#${run.ci.run_id}.${run.ci.attempt}`, run.ci.url), element('small', fullDate(run.started_at)));
    status.append(element('span', statusLabel(sample.status), `badge ${sample.status}`));
    const runner = run.environment.runner || {};
    metadata.append(element('span', runner.image_version ? `Runner ${runner.image_version}` : 'Runner 修订未记录'));
    if (run.status !== 'ok') metadata.append(element('small', `本次运行：${statusLabel(run.status)}；各查询分别统计`));
    if (sample.error) {
      const details = element('details'); details.append(element('summary', '错误详情'), element('pre', sample.error)); metadata.append(details);
    }
    row.append(name, element('td', validTiming(sample) ? formatTime(sample.elapsed_us) : '—', 'number'), status, metadata);
    fragment.append(row);
  }
  $('point-rows').replaceChildren(fragment);
  $('point-command').textContent = `moon ${series.info.argv.map(arg => /^[\w./:@-]+$/.test(arg) ? arg : JSON.stringify(arg)).join(' ')}`;
  $('point-toolchain').textContent = point.version.full;
  $('point-detail').hidden = false;
  $('tooltip').hidden = true;
}

function renderRecords() {
  $('records-caption').textContent = `${state.branch} / ${state.platform}，共 ${runs.length} 次记录，包含其他测量条件及准备失败。`;
  const fragment = document.createDocumentFragment();
  for (const run of runs) {
    const row = element('tr'), version = element('td'), name = element('td'), status = element('td');
    const toolchain = toolchainInfo(run.environment.moon_version);
    version.append(element('span', toolchain?.label || '工具链版本未知'));
    const fixture = run.fixtures.find(item => item.slug === state.fixture);
    version.append(element('small', `${fixture?.commit?.slice(0, 8) || '未准备项目'} / ${profileLabel(run.measurement_profile)}`));
    name.append(githubLink(`#${run.ci.run_id}.${run.ci.attempt}`, run.ci.url), element('small', fullDate(run.started_at)));
    status.append(element('span', statusLabel(run.status), `badge ${run.status}`));
    const details = element('details');
    const errors = [run.error, ...run.fixtures.map(item => item.error)].filter(Boolean);
    details.append(element('summary', '采样信息'), element('pre', [run.environment.moon_version,
      JSON.stringify(run.environment.runner || {}, null, 2), ...errors].join('\n\n')));
    status.append(details);
    row.append(version, name, element('td', `${run.counts.ok} / ${run.counts.failed} / ${run.counts.missing}`, 'number'), status);
    fragment.append(row);
  }
  if (!runs.length) {
    const row = element('tr'), cell = element('td', '此分支与平台尚无原始记录。');
    cell.colSpan = 4; row.append(cell); fragment.append(row);
  }
  $('record-rows').replaceChildren(fragment);
}

function exportCsv() {
  const quote = value => `"${String(value).replaceAll('"', '""')}"`;
  const text = value => quote(/^[=+@-]/.test(value) ? `'${value}` : value);
  const rows = [['toolchain', 'query', 'location', 'target', 'mean_us', 'successful', 'failed', 'missing', 'change_percent']];
  for (const series of selectedSeries()) series.points.forEach((point, position) => {
    rows.push([text(point.version.id), text(series.info.symbol), text(series.info.location), text(series.info.target),
      point.mean ?? '', point.n, point.failed, point.missing, deltaAt(series, position) ?? '']);
  });
  const blob = new Blob(['\uFEFF', rows.map(row => row.join(',')).join('\r\n')], {type: 'text/csv;charset=utf-8'});
  const url = URL.createObjectURL(blob), anchor = element('a');
  anchor.href = url; anchor.download = `moon-ide-${state.operation}-${state.platform}.csv`;
  anchor.click(); setTimeout(() => URL.revokeObjectURL(url), 1000);
}

function activateCommand(operation, focus = false) {
  state.operation = operation;
  renderCommands(); updateChart();
  if (focus) $(`tab-${operation}`).focus();
}
$('commands').addEventListener('click', event => {
  const button = event.target.closest('button[data-operation]');
  if (button) activateCommand(button.dataset.operation, true);
});
$('commands').addEventListener('keydown', event => {
  const position = OPERATIONS.indexOf(state.operation);
  let target;
  if (event.key === 'ArrowRight') target = (position + 1) % OPERATIONS.length;
  if (event.key === 'ArrowLeft') target = (position + OPERATIONS.length - 1) % OPERATIONS.length;
  if (event.key === 'Home') target = 0;
  if (event.key === 'End') target = OPERATIONS.length - 1;
  if (target !== undefined) { event.preventDefault(); activateCommand(OPERATIONS[target], true); }
});
for (const button of document.querySelectorAll('[data-platform]')) button.addEventListener('click', () => {
  if (state.platform === button.dataset.platform) return;
  state.platform = button.dataset.platform; state.group = ''; loadRuns();
});
$('branch').addEventListener('change', event => { state.branch = event.target.value; state.group = ''; loadRuns(); });
$('fixture').addEventListener('change', event => { state.fixture = event.target.value; state.group = ''; refresh(); });
$('conditions').addEventListener('change', event => { state.group = event.target.value; refresh(); });
for (const id of ['channel', 'range']) $(id).addEventListener('change', event => { state[id] = event.target.value; updateChart(); });
$('open-conditions').addEventListener('click', () => $('conditions-dialog').showModal());
$('open-queries').addEventListener('click', () => { $('search').value = ''; renderPicker(); $('query-dialog').showModal(); $('search').focus(); });
$('open-records').addEventListener('click', () => { renderRecords(); $('records-dialog').showModal(); });
$('search').addEventListener('input', renderPicker);
$('reset-queries').addEventListener('click', () => { selections.set(selectionKey(), activeCases.slice(0, 4).map(info => info.id)); updateChart(); });
$('open-version-data').addEventListener('click', () => {
  $('version-data').hidden = !$('version-data').hidden;
  $('open-version-data').setAttribute('aria-expanded', String(!$('version-data').hidden));
});
$('close-point').addEventListener('click', () => {
  $('point-detail').hidden = true; selectedPoint = null;
  for (const group of $('chart').querySelectorAll('.point.selected')) group.classList.remove('selected');
});
$('export').addEventListener('click', exportCsv);
for (const button of document.querySelectorAll('[data-close]')) button.addEventListener('click', () => $(button.dataset.close).close());
for (const dialog of document.querySelectorAll('dialog')) dialog.addEventListener('click', event => {
  if (event.target !== dialog) return;
  const bounds = dialog.getBoundingClientRect();
  if (event.clientX < bounds.left || event.clientX > bounds.right || event.clientY < bounds.top || event.clientY > bounds.bottom) dialog.close();
});
let resizeFrame;
window.addEventListener('resize', () => {
  cancelAnimationFrame(resizeFrame);
  resizeFrame = requestAnimationFrame(() => {
    if (!index) return;
    renderChart();
    if (selectedPoint) for (const group of $('chart').querySelectorAll('.point')) {
      group.classList.toggle('selected', group.dataset.case === selectedPoint.caseId
        && data.versions[Number(group.dataset.position)].id === selectedPoint.versionId);
    }
  });
});

try {
  const response = await fetch('./data/index.json', {cache: 'no-cache'});
  if (response.status === 404) $('notice').textContent = '尚未发布性能数据。每日任务归档完成后，可在这里查看版本趋势。';
  else {
    if (!response.ok) throw new Error(`性能历史加载失败（${response.status}）。`);
    index = await response.json();
    if (index.schema_version !== 1 || !Array.isArray(index.runs) || !index.cases) throw new Error('不支持的历史数据格式。');
    if (!index.runs.length) $('notice').textContent = '尚无性能测量记录。';
    else {
      if (/^[\w.-]+\/[\w.-]+$/.test(index.repository)) $('repository-link').href = `https://github.com/${index.repository}`;
      $('dashboard').hidden = false;
      await loadRuns();
    }
  }
} catch (error) {
  $('notice').textContent = `${error.message} 请刷新页面重试。`;
  $('notice').className = 'notice error';
}
