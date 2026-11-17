# Evidence classification

Use these labels consistently:

| Label | Meaning | Acceptable support |
| --- | --- | --- |
| Observado | Directly present in the selected files, artifact, test result, or commit | Exact path, symbol, commit, or output |
| Inferido | Reasoned from observed relationships but not stated or executed directly | Explain the reasoning and uncertainty |
| Planejado | Described as future work, TODO, issue, roadmap, or unimplemented README claim | Cite the planning source and say it is not implemented |
| Não verificado | Plausible claim lacking sufficient repository evidence | State what evidence would verify it |

## Rules

- Do not convert an inference into an observation through confident wording.
- Do not use branch head to describe a historical checkpoint unless the same code existed in that commit.
- Do not treat a generated artifact as its own source when a generator exists.
- Do not attribute every file in a single-author Git history to that person when files may have been imported or collaboratively produced.
- Prefer a short explicit caveat over silently filling a gap.

## Example phrasing

```text
Observado: `Parser.java` calls `visitExpression` before emitting the instruction.
Inferido: this ordering likely preserves operand evaluation because the generated output uses the same stack order.
Planejado: the README lists optimization, but the selected commit contains no optimization pass.
Não verificado: the reported performance number was not reproduced in this study pass.
```
