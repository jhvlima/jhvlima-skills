# Portability and compatibility checklist

## Classify values before export

| Value | Template treatment |
| --- | --- |
| Secret or token | Remove; require a credential binding after import |
| Credential ID/name | Remove or replace with a documented selection step |
| Workflow/node ID | Regenerate or replace cross-workflow references with placeholders |
| Instance, webhook, tunnel, or private URL | Replace with a neutral parameter or placeholder |
| Repository owner, name, or branch | Expose as configuration; do not bake in a personal destination |
| Stable functional tag or project slug rule | Keep as documented configuration |
| Node behavior and expressions | Keep only after compatibility verification |

Never print candidate secrets while scanning. Report the field and location, not its value.

## Verify a target version

1. Record the source and target versions for the current task only.
2. Compare each node's type and `typeVersion` with the target importer.
3. Check trigger schemas, form nodes, credential/authentication modes, expressions, and top-level import fields.
4. Import into a disposable or explicitly authorized target when possible.
5. Rebind credentials and selected subworkflows through the UI.
6. Execute a dry run with harmless inputs.
7. Keep a transformation list beside the generator, not inside project output.

Create a separate variant only when an actual incompatibility is demonstrated. Derive it from one canonical workflow set so fixes do not diverge.

## Validate a portable bundle

- Parse all JSON.
- Reject embedded secrets and live credential references.
- Reject unexplained local workflow IDs and hard-coded private destinations.
- Confirm every placeholder has a documented post-import action.
- Confirm sticky notes and setup docs describe required credentials without including values.
- Confirm the bundle can be imported without access to the source machine.
