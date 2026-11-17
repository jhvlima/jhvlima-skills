---
name: maintain-n8n-workflows
description: Maintain portable, sanitized, version-compatible n8n workflow templates and their Bootstrap/Maintenance lifecycle. Use when editing or reviewing n8n workflow JSON, moving workflows between instances or n8n versions, grouping agents and subworkflows as one documented project, or preventing scheduled updates from overwriting human documentation.
---

# Maintain n8n workflows

## Establish the contract

1. Inspect repository instructions, workflow JSON, export scripts, validators, and the target n8n environment before editing.
2. Identify the authoritative workflow: live instance, canonical template, or generator output. Edit the authoritative source and regenerate downstream artifacts.
3. Confirm the requested scope, target n8n version, project grouping rule, and whether the task concerns Bootstrap, Maintenance, or template distribution.
4. Preserve unrelated local and remote changes. Never infer permission to activate workflows, publish documentation, or mutate a live instance.
5. Classify the workflow family. Apply the Bootstrap/Maintenance contract only to repositories that implement a documentation lifecycle; do not impose it on unrelated business automation.

## Preserve portability and safety

- Treat workflow IDs, credential IDs, instance URLs, repository coordinates, branch names, and webhook URLs as environment-local values.
- Replace local references with explicit placeholders or documented post-import selections. Never copy credential material into templates, logs, notes, or examples.
- Keep project grouping stable with a common documentation tag and a project slug. Represent an agent, its tools, and its called subworkflows as components of one project when they share the same lifecycle.
- Distinguish sanitizing business workflows from sanitizing the documentation pipeline itself. Apply both checks when publishing templates.
- Read [portability-and-compatibility.md](references/portability-and-compatibility.md) before exporting, importing, or creating a version variant.

## Enforce the lifecycle boundary

For a documentation lifecycle:

- Run Bootstrap once per project to create the deterministic snapshot, optionally enrich human-facing documents with AI, and publish the initial complete file set.
- Run Maintenance on a schedule or change event to rebuild the deterministic snapshot, compare a functional hash, and publish only technical artifacts when the hash changes.
- Preserve human-owned documents during Maintenance. Do not invoke AI or overwrite narrative files unless the repository contract explicitly opts into that behavior.
- Keep the publisher generic: pass exact paths and contents rather than embedding project-specific generation rules.
- Read [lifecycle-contract.md](references/lifecycle-contract.md) when changing generated paths, ownership, hashing, or orchestration.

## Handle version compatibility

1. Verify the target version instead of assuming compatibility from the source instance.
2. Compare node types, `typeVersion`, authentication modes, expression syntax, and required top-level import fields.
3. Keep one canonical workflow set. Generate a version-specific variant only for demonstrated incompatibilities, and record each transformation without embedding a perishable version as a universal rule.
4. Require users to reselect local subworkflows and credentials after import when portable placeholders are used.

## Validate before handoff

1. Parse every JSON file and run the repository validator or export checker.
2. Scan the produced templates for secrets, credential references, local IDs, private URLs, and hard-coded destinations without printing sensitive values.
3. Test import or dry-run behavior on the declared target version when available.
4. Exercise Bootstrap for a new project and Maintenance for both unchanged and changed hashes.
5. Verify that a human edit survives Maintenance and that all subworkflow references resolve after configuration.
6. Report the authoritative source, generated files, compatibility assumptions, validation evidence, and any manual post-import steps.
