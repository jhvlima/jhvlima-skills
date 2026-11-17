---
name: safe-git-integration
description: Audit and safely integrate one Git branch or commit into another while preserving unrelated work. Use when explaining branch divergence, checking whether work is already merged, moving a feature or fix into a destination branch, resolving a dirty-worktree blocker, choosing merge versus rebase or cherry-pick, or preparing an integration without accidental fetches, stashes, force-pushes, or publication.
---

# Safe Git Integration

## Confirm Intent

- Restate the direction as `source -> destination` before changing history.
- Confirm the repository root, desired commits, publication scope, and whether the user asked only for analysis or also for integration and push.
- Treat remote-tracking refs as local snapshots until freshness is explicitly established.

## Audit First

- Run `scripts/branch_audit.sh --repo <path> <source> <destination>` before integrating.
- Inspect dirty state, staged changes, untracked files, linked worktrees, merge base, ancestry, commits unique to each side, and paths changed by the source.
- Do not fetch automatically. Fetch only as a separate, visible action when current remote state is needed.
- Stop if unrelated work overlaps the integration. Do not stash, discard, or relocate it without an explicit decision.

Read [references/integration-strategies.md](references/integration-strategies.md) before choosing how to integrate diverged history or handling a dirty destination.

## Integrate Deliberately

- Prefer a fast-forward when the destination is an ancestor of the source and policy permits it.
- Prefer a merge when preserving shared history matters.
- Rebase only unpublished work or after explicit coordination.
- Cherry-pick only a deliberately selected, self-contained change set.
- Resolve conflicts from repository semantics and tests, not by blindly choosing one side.
- Keep generated files, vendored assets, migrations, and documentation consistent with the integrated source.

## Verify And Hand Off

- Run repository-defined checks proportional to the affected surface.
- Re-run the audit and inspect the final diff and log.
- Confirm that unrelated dirty files remain untouched.
- Create an integration commit only when the requested operation requires it and the user authorized committing; use a message that identifies the integration intent.
- Push only when explicitly requested. Never force-push or delete branches without separate authorization.
