# Authority and ownership

## Identify the authoritative layer

| Evidence | Likely role | Edit by default? |
| --- | --- | --- |
| Template, workflow, schema, or source Markdown consumed by a generator | Authoritative source | Yes |
| Script that renders or exports documentation | Generator | Yes, when behavior must change |
| Generated README, index, diagram, or snapshot | Artifact | No; regenerate it |
| Validator listing required files, headings, or links | Contract | Update with the source change |
| Hand-maintained runbook, decision record, or guide | Human-owned source | Yes, preserve automation boundaries |
| AI-produced prose without review | Candidate content | Review before treating as authoritative |

Use repository evidence to confirm the role. Do not decide from filename alone.

## Resolve conflicts

1. Prefer executable code and configuration for current behavior.
2. Prefer an explicit schema or validator for the expected output contract.
3. Prefer a named human-owned document for policy and operational decisions.
4. Treat generated output as evidence of the last generation, not necessarily the current source.
5. Treat roadmap language as planned until implementation evidence exists.

When two sources claim authority, report the conflict and avoid silently choosing one if that choice changes behavior or ownership.

## Record the edit path

State this in the handoff:

```text
Authoritative source: <path>
Generator: <path or command>
Generated artifacts: <paths>
Validator: <path or command>
Future edits belong in: <path>
```
