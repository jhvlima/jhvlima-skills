# Experiment manifest

Record one manifest beside every durable experiment. Use the repository's preferred format and include at least:

```yaml
experiment_name: descriptive-slug
purpose: candidate comparison, frozen test, external test, or operational refit
created_at: ISO-8601 timestamp
code_revision: commit or dirty-worktree marker
dataset:
  path: repository-relative path
  fingerprint: content hash or deterministic surrogate
  rows_before_filters: integer
  rows_after_filters: integer
features:
  target: column name
  inputs: [column names]
  grouping_key: definition
split:
  strategy: grouped holdout, grouped CV, frozen holdout, or external test
  seed: integer or null
  train_rows: integer
  test_rows: integer
  shared_groups: 0
evaluation:
  selection_metric: metric name
  official: true or false
  model_saw_evaluation_rows: false
artifacts:
  metrics: path
  predictions: path
  plots: path
  model: path or null
notes:
  - exclusions, anomalies, limitations, and stale dependencies
```

Mark a full-data refit with `official: false` for its seen-data diagnostics. Link its operational model to the separate experiment that selected it.
