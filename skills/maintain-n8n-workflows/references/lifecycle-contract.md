# Bootstrap and Maintenance contract

## Recommended flow

```text
Bootstrap, once per project
project tags -> deterministic Core -> optional AI -> generic Publisher

Maintenance, scheduled or event-driven
project tags -> deterministic Core -> compare functional hash
  unchanged -> stop
  changed   -> publish technical artifacts only
```

Group all workflows sharing a stable project slug. Record component roles such as agent, tool, and internal subworkflow without turning each component into a separate project.

## Assign file ownership

| Artifact | Owner | Bootstrap | Maintenance |
| --- | --- | --- | --- |
| Sanitized workflow JSON | Deterministic generator | Create | Replace on functional change |
| Project manifest/hash | Deterministic generator | Create | Replace on functional change |
| README and narrative architecture | Human or reviewed AI | Create | Preserve |
| Per-workflow narrative | Human or reviewed AI | Create | Preserve unless explicitly opted in |
| Extra team documents | Human | Preserve | Preserve |

Compute the functional hash from stable sanitized workflow content. Exclude credentials, volatile IDs, positions, timestamps, and narrative documents unless they are intentionally part of the functional contract.

## Test the boundary

1. Bootstrap a previously absent project.
2. Edit a human-owned document.
3. Run Maintenance without a workflow change and expect no publication.
4. Change one functional workflow field and run Maintenance.
5. Confirm technical artifacts and hash change while the human edit remains intact.
6. Confirm the publisher accepts explicit path/content pairs and contains no project-specific generation logic.
