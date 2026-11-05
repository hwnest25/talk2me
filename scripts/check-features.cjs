const assert = require('node:assert/strict');
const fs = require('node:fs');
const { loadConfiguration, loadSources } = require('@cucumber/cucumber/api');

(async () => {
  const { runConfiguration } = await loadConfiguration();
  const { plan, errors } = await loadSources(runConfiguration.sources);
  assert.equal(errors.length, 0, JSON.stringify(errors, null, 2));
  const mapping = JSON.parse(fs.readFileSync('docs/scenario-map.json', 'utf8'));
  const names = new Set(plan.map(p => p.name));
  assert.equal(names.size, plan.length, 'Scenario names must be unique');
  assert.equal(plan.length, mapping.length, 'Each scenario needs a diagram mapping');
  for (const row of mapping) assert(names.has(row.name), `Missing scenario: ${row.name}`);
  const counts = {};
  for (const item of plan) counts[item.uri] = (counts[item.uri] || 0) + 1;
  assert.equal(Object.keys(counts).length, 3, 'Expected three feature files');
  for (const [file, count] of Object.entries(counts)) {
    assert(count >= 2, `${file}: at least two scenarios required`);
    const source = fs.readFileSync(file, 'utf8');
    assert(source.includes('  As a ') && source.includes('  I want to '), `${file}: actor/goal missing`);
    console.log(`${file}: ${count} parsed scenarios, mapping present`);
  }
  console.log(`PASS: ${plan.length} scenarios parsed and mapped. No app behaviour was executed.`);
})().catch(error => { console.error(error); process.exitCode = 1; });
