---
name: maintain-project-documentation
description: Maintain repository documentation from its authoritative source, generator, and validation contract. Use when updating READMEs, generated docs, runbooks, architecture files, documentation workflows or templates, especially when human, deterministic, and AI-produced files have different ownership.
---

# Maintain project documentation

## Trace the documentation pipeline

1. Inspect repository instructions and locate the requested document.
2. Classify it as an authoritative source, generator/template, generated artifact, validator contract, or human-owned document.
3. Trace `source -> generator -> artifact -> validator/publisher` before editing. Read [authority-and-ownership.md](references/authority-and-ownership.md) when ownership is unclear.
4. Prefer changing the upstream template, workflow, or generator and regenerating the artifact. Patch generated output directly only when the user explicitly requests a one-off edit or no upstream source exists.

## Ground every claim

- Derive commands, inputs, outputs, paths, configuration, and behavior from current code and configuration.
- Mark unsupported statements as inferred, planned, or needing confirmation. Do not promote roadmap text or AI-generated prose to implemented behavior.
- Name the actual scripts, workflows, files, and authoritative artifacts.
- Preserve precise provenance when describing a person's contribution or third-party material.

## Preserve ownership boundaries

- Keep deterministic technical artifacts reproducible from source.
- Treat AI-generated narrative as reviewable candidate content.
- Preserve human-edited documents during automated maintenance unless an explicit contract says otherwise.
- Avoid duplicating the same normative instructions across README and specialized guides. Keep the README sufficient for common installation and use, then link to deeper references.
- Update the generator and validator together when the output schema or required sections change.

## Regenerate and verify

1. Run the documented generator using safe local inputs.
2. Review the generated diff for unexpected rewrites, stale paths, missing sections, or ownership violations.
3. Run documentation validators, link checks, format checks, and relevant build/export checks.
4. Verify commands against the current repository instead of copying historical examples.
5. Check that indexes and cross-references point to existing files and that architecture diagrams match the implemented relationships.
6. Read [documentation-verification.md](references/documentation-verification.md) for the final evidence checklist.
7. Report which file is authoritative and where future edits must be made.
