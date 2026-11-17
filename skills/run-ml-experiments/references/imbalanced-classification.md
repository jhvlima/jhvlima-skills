# Imbalanced classification

## Define the objective

- Name the positive or rare class explicitly.
- State the operational cost of a false negative and a false positive.
- Choose the selection metric from that cost. Use recall when missing positives dominates; precision when false alarms dominate; F1 for symmetric balance; F-beta when recall or precision needs explicit emphasis.
- Include the confusion matrix, class support, precision, recall, F1, and PR-AUC. Do not rely on accuracy alone.

## Keep training operations inside the fold

For every cross-validation or holdout split:

1. Fit preprocessing on the training portion.
2. Derive class or sample weights from the training portion.
3. Apply SMOTE, SMOTENC, undersampling, or synthetic generation only to the training portion.
4. Fit the estimator.
5. Produce probabilities or scores for untouched validation rows.

Use an imbalanced-learn pipeline or an equivalent fold-local implementation. Never resample before the split.

## Tune the threshold safely

1. Gather validation or out-of-fold scores.
2. Evaluate a predeclared metric and operational constraints across candidate thresholds.
3. Select the threshold without consulting the frozen test labels.
4. Freeze the model recipe and threshold.
5. Evaluate once on the frozen test set.

Report the default-threshold and selected-threshold results so the tradeoff is visible. A requested target score is a goal to investigate, not permission to search the test set until it is reached.

## Validate the notebook or pipeline

- Restart the kernel and run all cells in order.
- Verify every changed function signature at all call sites.
- Confirm deterministic seeds where supported.
- Record dependency versions in the experiment environment, not as universal skill assumptions.
- Mark results as invalid when the test set influenced feature selection, resampling, hyperparameters, or threshold choice.
