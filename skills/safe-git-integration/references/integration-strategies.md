# Integration Strategies

## Choose From Proven History

| Relationship | Default interpretation | Typical action |
| --- | --- | --- |
| Source is ancestor of destination | work is already integrated | make no integration commit |
| Destination is ancestor of source | fast-forward is possible | fast-forward if policy allows |
| Both share a merge base and diverged | each side has unique work | merge, or rebase unpublished source with approval |
| No merge base | unrelated histories or wrong refs | stop and confirm repository/ref intent |

Use a merge to preserve branch context and published commit identities. Use rebase to linearize only work whose commit identities may safely change. Use cherry-pick for a small, explicit allowlist of commits when the full branch must not be integrated.

## Handle Dirty State

- Classify staged, unstaged, and untracked paths before acting.
- Continue only when dirty paths are unrelated and the chosen operation cannot overwrite them.
- Prefer committing the user's coherent work or using a separate worktree over an automatic stash.
- Use a stash only with explicit agreement, include untracked files when required, name it clearly, and verify restoration.
- Never discard, reset, clean, or overwrite local work to make an integration easier.

## Verify The Result

- Confirm expected source commits are ancestors of the destination.
- Inspect the destination-only commits and merge diff.
- Run focused checks first, then the repository's required suite.
- Verify migrations, generated artifacts, docs, and lockfiles when their source inputs changed.
- Separate local integration from remote publication; obtain authorization for each mutation.
