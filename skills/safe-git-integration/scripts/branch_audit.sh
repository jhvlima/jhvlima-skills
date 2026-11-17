#!/usr/bin/env bash

set -u

usage() {
  cat <<'EOF'
Usage: branch_audit.sh [--repo PATH] SOURCE DESTINATION

Read-only audit of the requested SOURCE -> DESTINATION integration.
The script never runs git fetch or changes refs, files, the index, or worktrees.

Environment:
  AUDIT_LOG_LIMIT  Maximum commits and changed paths to show (default: 20).
EOF
}

fail() {
  printf 'branch_audit: %s\n' "$*" >&2
  exit 2
}

repo=.
while [ "$#" -gt 0 ]; do
  case "$1" in
    --repo)
      [ "$#" -ge 2 ] || fail "--repo requires a path"
      repo=$2
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    --)
      shift
      break
      ;;
    -*)
      fail "unknown option: $1"
      ;;
    *)
      break
      ;;
  esac
done

[ "$#" -eq 2 ] || {
  usage >&2
  exit 2
}

source_ref=$1
destination_ref=$2
limit=${AUDIT_LOG_LIMIT:-20}

case "$limit" in
  ''|*[!0-9]*) fail "AUDIT_LOG_LIMIT must be a positive integer" ;;
  0) fail "AUDIT_LOG_LIMIT must be greater than zero" ;;
esac

git_cmd=(git -C "$repo")
root=$("${git_cmd[@]}" rev-parse --show-toplevel 2>/dev/null) || fail "not a Git worktree: $repo"

resolve_commit() {
  "${git_cmd[@]}" rev-parse --verify --quiet "$1^{commit}"
}

source_commit=$(resolve_commit "$source_ref") || fail "source does not resolve to a commit: $source_ref"
destination_commit=$(resolve_commit "$destination_ref") || fail "destination does not resolve to a commit: $destination_ref"
current_branch=$("${git_cmd[@]}" symbolic-ref --quiet --short HEAD 2>/dev/null || printf '%s' '(detached HEAD)')

printf 'Repository:  %s\n' "$root"
printf 'Current:     %s\n' "$current_branch"
printf 'Source:      %s -> %s\n' "$source_ref" "$source_commit"
printf 'Destination: %s -> %s\n' "$destination_ref" "$destination_commit"
printf '%s\n' 'Freshness:   no fetch performed; remote-tracking refs are local snapshots.'

printf '\nBranch tracking:\n'
"${git_cmd[@]}" status --porcelain=v1 --branch --untracked-files=no | sed -n '1p'

printf '\nWorking tree changes:\n'
status=$("${git_cmd[@]}" status --porcelain=v1 --untracked-files=all)
if [ -n "$status" ]; then
  printf '%s\n' "$status"
else
  printf '%s\n' '(clean)'
fi

if "${git_cmd[@]}" worktree list --porcelain >/dev/null 2>&1; then
  printf '\nLinked worktrees:\n'
  "${git_cmd[@]}" worktree list
fi

printf '\nHistory relationship:\n'
if merge_base=$("${git_cmd[@]}" merge-base "$destination_commit" "$source_commit" 2>/dev/null); then
  printf 'Merge base:  %s\n' "$merge_base"
  counts=$("${git_cmd[@]}" rev-list --left-right --count "$destination_commit...$source_commit")
  set -- $counts
  printf 'Unique commits: destination=%s source=%s\n' "$1" "$2"

  if "${git_cmd[@]}" merge-base --is-ancestor "$source_commit" "$destination_commit"; then
    printf '%s\n' 'Relation:    source is already contained in destination.'
  elif "${git_cmd[@]}" merge-base --is-ancestor "$destination_commit" "$source_commit"; then
    printf '%s\n' 'Relation:    destination can fast-forward to source.'
  else
    printf '%s\n' 'Relation:    source and destination have diverged.'
  fi

  printf '\nCommits only in source (up to %s):\n' "$limit"
  source_log=$("${git_cmd[@]}" log --oneline --decorate --no-merges -n "$limit" "$destination_commit..$source_commit")
  if [ -n "$source_log" ]; then
    printf '%s\n' "$source_log"
  else
    printf '%s\n' '(none)'
  fi

  printf '\nCommits only in destination (up to %s):\n' "$limit"
  destination_log=$("${git_cmd[@]}" log --oneline --decorate --no-merges -n "$limit" "$source_commit..$destination_commit")
  if [ -n "$destination_log" ]; then
    printf '%s\n' "$destination_log"
  else
    printf '%s\n' '(none)'
  fi

  printf '\nPaths changed by source since merge base (up to %s):\n' "$limit"
  changed_paths=$("${git_cmd[@]}" diff --name-status "$destination_commit...$source_commit" | sed -n "1,${limit}p")
  if [ -n "$changed_paths" ]; then
    printf '%s\n' "$changed_paths"
  else
    printf '%s\n' '(none)'
  fi
else
  printf '%s\n' 'Merge base:  none'
  printf '%s\n' 'Relation:    unrelated histories or incorrect refs; stop and confirm intent.'
fi

printf '\nAudit complete. No fetch or mutation was performed.\n'
