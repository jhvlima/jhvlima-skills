# Evaluation guardrails

## Split before learning from data

1. Define the observation unit and entity or duplicate group.
2. Create the split from stable identifiers or a deterministic signature.
3. Fit every learned preprocessing operation on training folds only.
4. Verify that no group crosses train, validation, external test, or frozen holdout boundaries.

Treat vocabularies, medians, modes, clipping thresholds, target encodings, neighborhood dictionaries, feature selection, and hyperparameter choice as learned operations.

## Keep evaluation roles separate

| Role | Use | Report as generalization? |
| --- | --- | --- |
| Training fold | Fit model and preprocessing | No |
| Validation or OOF fold | Compare candidates | Yes, with split details |
| Frozen holdout | Confirm the selected approach once | Yes |
| External later collection | Test temporal or source generalization | Yes, after overlap removal |
| Full-data refit | Produce operational model | No independent score |
| Seen-data inference | Smoke test or fit diagnostic | No |

Never replace an official result with a lower error obtained after the model saw those rows.

## Name metrics by what they measure

- Use MAE for average absolute error in target units.
- Use RMSE to emphasize large errors.
- Use MAPE or MdAPE only when zero or near-zero targets are handled explicitly.
- Use threshold accuracy only with a stated per-row percentage formula.
- Name `abs(sum(y) - sum(pred)) / sum(y)` as aggregate bias or total-value deviation. Explain that positive and negative errors cancel.
- Add error percentiles, maximum error, and subgroup metrics when rare observations dominate the summary.

## Reject invalid comparisons

Reject or qualify a comparison when dataset hashes, grouping rules, folds, target transformations, preprocessing, metric formulas, or candidate sets differ. Preserve both runs instead of presenting them as a direct improvement.
