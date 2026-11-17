# Documentation verification

## Content evidence

- Match every command, path, input, output, and environment variable to current source.
- Label behavior as implemented, inferred, planned, or needing confirmation.
- Remove stale IDs, versions, dates, prices, and external-state claims unless freshly verified and necessary.
- Attribute collaborative or imported work precisely.

## Generated-document checks

- Regenerate from the authoritative source.
- Review the diff rather than trusting a successful command.
- Confirm required files and headings through the validator.
- Confirm deterministic output is stable across two equivalent runs when reproducibility matters.
- Confirm human-owned files are not rewritten by maintenance automation.

## Navigation and usability

- Keep the README sufficient for the common installation and usage path.
- Link to specialized guides instead of duplicating their full content.
- Validate relative links, anchors, images, diagrams, and indexes.
- Verify examples from a clean or representative environment when feasible.
- Name the authoritative artifact and the next update location in the final response.

## Minimal handoff evidence

Report:

1. source files changed;
2. generation command executed;
3. artifacts regenerated;
4. validators and link/build checks run;
5. known inferences, planned behavior, or manual review still required.
