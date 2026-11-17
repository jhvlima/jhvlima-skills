---
name: run-ml-experiments
description: Plan, execute, audit, and report reproducible machine-learning experiments while preventing train-test leakage, refit contamination, threshold leakage, misleading metrics, and stale artifacts. Use when asked to train or compare regression or classification models, handle class imbalance, tune a decision threshold, run holdouts or cross-validation, test on newly collected data, investigate results that look too good, calculate official metrics, refit a final model, or organize experiment outputs and manifests.
---

# Run ML Experiments

## Establish the experiment contract

- Read the repository instructions and locate the dataset builder, feature contract, model configuration, training entry point, evaluation code, and current artifact directories.
- Classify the request as analysis, experiment execution, final refit, artifact regeneration, or reporting. Stay inside the requested phase.
- Record the target, observation unit, input features, derived features, grouping key, split policy, selection metric, random seed, and output directory before running training.
- Read [evaluation-guardrails.md](references/evaluation-guardrails.md) before creating or changing a split, preprocessing step, metric, or refit flow.

## Protect evaluation integrity

- Build the duplicate or entity grouping key before splitting data.
- Keep equivalent observations in one partition or fold, and verify that the train-test group intersection is empty.
- Fit imputers, encoders, scalers, vocabularies, clipping rules, and other learned transformations on training data only.
- Keep a frozen holdout untouched until model and hyperparameter selection finish.
- Never report a score from a model evaluated on rows used by a later full-data refit as a generalization result.
- Label scores from seen data as diagnostics, and keep them separate from official holdout, external-test, or out-of-fold results.
- Remove or isolate overlaps between historical training data and a new external collection, then report how many rows and groups were excluded.

## Interpret metrics precisely

- Report individual-error metrics such as MAE, RMSE, MAPE, and MdAPE together when the target permits them.
- Treat the difference between the sums of predictions and targets as aggregate bias, not individual accuracy.
- Explain cancellation whenever overestimates and underestimates can make an aggregate metric look artificially small.
- For classification, declare the positive class and business cost of false negatives and false positives before choosing recall, precision, F1, F-beta, PR-AUC, ROC-AUC, or a threshold.
- Select a classification threshold on validation or out-of-fold predictions only. Keep the frozen test set out of threshold selection.
- Apply class weights, sample weights, SMOTE, SMOTENC, or other resampling only inside the training fold. Read [imbalanced-classification.md](references/imbalanced-classification.md) before changing an imbalanced classifier.
- Compare experiments only when their dataset, split, grouping policy, preprocessing, and metric definitions match.
- Investigate extreme residuals and report their influence without deleting legitimate observations merely to improve a score.

## Preserve reproducibility

- Prefer the repository's environment and existing command-line entry points over ad hoc notebooks or global installations.
- Isolate each experiment under a dedicated directory; do not mix current artifacts with historical or exploratory outputs.
- Write a manifest using [experiment-manifest.md](references/experiment-manifest.md).
- Attach dataset and split fingerprints to metrics, predictions, plots, and model packages whenever the repository supports metadata.
- Regenerate dependent reports and plots after changing data preparation, features, splits, metrics, or model parameters.
- Preserve prior outputs unless the user explicitly authorizes deletion or replacement.
- Refit the selected model on all eligible data only after evaluation, and mark the refitted package as operational rather than independently evaluated.

## Validate and hand off

- Run the relevant automated tests, compilation checks, and a load-and-predict smoke test for the saved model.
- Verify zero group overlap, finite predictions, unique row identifiers, target exclusion from features, and consistency between manifests and artifacts.
- For notebooks, execute the full dependency chain from a clean kernel instead of trusting selectively run cells.
- Lead with the defensible result, distinguish official and diagnostic metrics, and name the exact dataset, split, manifest, model, and report used.
- State stale, missing, or incomparable artifacts explicitly instead of silently selecting the most favorable result.
