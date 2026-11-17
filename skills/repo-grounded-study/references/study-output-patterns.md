# Study output patterns

## File walkthrough

Use this order:

1. purpose of the file;
2. inputs and outputs;
3. core symbols;
4. one concrete execution path;
5. dependencies and consumers;
6. observed limitations.

## Commit or checkpoint analysis

Use this order:

1. boundary of the selected commit/checkpoint;
2. files added, changed, or generated;
3. behavior demonstrably present there;
4. differences from earlier or current state;
5. documentation claims that remain planned;
6. authoritative files for revision.

## Architecture explanation

Trace a real path rather than listing directories:

```text
input -> parser/controller -> domain transformation -> generated/output artifact -> runtime consumer
```

Attach each arrow to a filename or symbol. Use a table only when several exact mappings need comparison.

## Didactic guardrails

- Explain in Portuguese at the user's apparent level.
- Define jargon before abbreviating it.
- Prefer a small real example from the repository over a generic invented example.
- Keep code excerpts short and point to the source for the full context.
- End with two or three files to reread and unresolved questions, not a generic summary.
