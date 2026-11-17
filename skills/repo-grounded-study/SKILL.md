---
name: repo-grounded-study
description: Explain and study software in Portuguese from the actual repository, named files, commits, checkpoints, and generated artifacts. Use when the user asks for a didactic walkthrough, study guide, implementation history, checkpoint analysis, or clarification of what is implemented versus inferred or merely planned.
---

# Study a repository from evidence

## Fix the evidence boundary

1. Honor the exact repository, files, commit, checkpoint, or artifact named by the user.
2. Inspect repository instructions before reading code.
3. Use the current worktree for present-state questions and `git show`, `git log`, or the named commit for historical questions. Do not infer historical intent from branch head.
4. Keep study and explanation tasks read-only unless the user also asks for changes.

## Build the explanation from the repository

1. Locate entry points, core types or grammar rules, data/control flow, tests, generated outputs, and documentation claims.
2. Follow symbols and imports across the smallest set of files needed to answer the question.
3. Compare documentation with implementation and call out divergences.
4. Use [evidence-classification.md](references/evidence-classification.md) to label observed, inferred, planned, and unverified statements.
5. Distinguish source files from generated artifacts and distinguish personal contribution from imported or collaborative material when relevant.

## Teach in Portuguese

- Lead with what the component does and why it exists.
- Refer to exact filenames, symbols, commits, inputs, and outputs throughout the explanation.
- Translate jargon into plain Portuguese before using it as shorthand.
- Walk through one concrete path end to end before generalizing.
- Use a compact table or flow only when it materially clarifies mappings or sequence.
- State uncertainty explicitly and avoid presenting planned README items as implemented code.
- Read [study-output-patterns.md](references/study-output-patterns.md) when choosing the structure of a walkthrough or checkpoint report.

## Verify the lesson

1. Recheck every named file, symbol, and command.
2. Confirm whether examples match the selected commit or current artifact.
3. Add short verification questions or exercises only when they help the user's study goal.
4. Close with the authoritative files to revisit and the exact unresolved gaps.
