---
name: evidence-first-research
description: Research decisions with current, traceable evidence and explicit separation between verified facts, source claims, inference, and personal judgment. Use for literature or web research, technology and service comparisons, prices or rules that may have changed, academic opportunity mapping, evidence matrices, source-backed project planning, or any request that should leave a durable research artifact instead of an unsupported recommendation.
---

# Evidence-First Research

Turn an open question into a reviewable evidence map. Prefer primary sources, record freshness, and make uncertainty visible.

## Frame the decision

1. State the research question and the decision it informs.
2. Record hard constraints, preferred criteria, excluded scope, geography, and time horizon.
3. Separate facts to verify from user preferences and hypotheses.
4. Define a stopping condition: enough credible evidence to compare options or identify the next experiment.

Do not broaden the topic merely because adjacent questions are interesting.

## Build a source plan

Prefer sources in this order when relevant:

1. Official rules, product documentation, institutional pages, datasets, and primary records.
2. Peer-reviewed papers and original technical reports.
3. Reputable secondary analysis for interpretation or discovery.
4. Community reports only for lived experience, failure modes, or leads that are labeled as such.

Use current browsing for prices, laws, schedules, API behavior, product limits, people, programs, and recommendations. For technical claims, rely on official documentation or primary research. Read `references/evidence-map-template.md` before producing a durable report.

## Collect evidence

- Capture the exact claim supported by each source, its URL, publisher, date, and `checked_at` date.
- Prefer a direct page over a search result, snippet, or aggregator.
- Keep quotations short; paraphrase the surrounding meaning.
- Record conflicting evidence instead of silently choosing a side.
- Mark facts that apply only to a version, jurisdiction, plan, dataset, or experimental setup.
- Distinguish absence of evidence from evidence of absence.

When researching a person, contribution, project, or academic path, map each claim to a primary artifact such as a commit, paper, institutional profile, official call, or repository file. Do not infer individual authorship from repository access alone.

## Evaluate and synthesize

Classify every important statement as:

- `verified`: directly supported by a cited source;
- `source-claim`: reported by the source but not independently confirmed;
- `inference`: a conclusion drawn from multiple facts;
- `unknown`: missing or contradictory evidence;
- `user-preference`: a value judgment supplied by the user.

Compare options against the declared criteria. Explain tradeoffs and sensitivity to uncertain assumptions. Do not invent scores, impact metrics, probabilities, or personal achievements.

## Produce the result

Lead with the decision-relevant conclusion, then provide:

- the strongest evidence;
- important caveats and stale-risk items;
- an evidence matrix or shortlist when several options are compared;
- open questions and the cheapest next verification step;
- direct links near the claims they support.

Create or update a repository report only when the user asks for a durable artifact. Preserve the project's existing structure and distinguish observed material from recommendations.

## Require review for consequential claims

Treat generated research as candidate input for human review when it affects academic applications, public claims, legal or financial choices, production architecture, or canonical knowledge bases. Never promote a candidate source, inferred contribution, or model-generated statement into authoritative project data without explicit approval.
