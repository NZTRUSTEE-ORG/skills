# Worked Example: Designing a New Role Under the New Library Filing System

## Scenario
Create a new role: `solutions-architecture-lead`

Assume:
- manager: `cto`
- function: technical pre-sales / solution design / systems translation
- likely adjacent roles: `cto`, `engineering-lead`, `integrations-specialist`, `backend-api-specialist`, `cro`
- no existing curated legacy role-library brief
- current role-local `Library Links.md` would otherwise be only a placeholder scaffold

## Goal
Give the role real structured library coverage without reintroducing Git-backed book binaries as the source of truth.

## Step 1. Define role semantics clearly
Identify the role’s real shape before changing mappings.

For this example:
- title suggests architecture + technical translation
- manager suggests engineering/technical branch inheritance
- adjacency suggests some overlap with platform, API design, and revenue/commercial communication
- role likely needs books on architecture, API design, scalable systems, communication clarity, and maybe negotiation/positioning

## Step 2. Check legacy state
Inspect:
- `/root/.openclaw/org-agents/solutions-architecture-lead/My Documents/Library Links.md`

If it is only a placeholder scaffold:
- do not preserve it as truth
- treat the role as needing real mapping generation

If it unexpectedly has a curated `# Role Library Brief`:
- preserve/inherit that intent via the legacy import path

## Step 3. Update taxonomy if needed
Inspect:
- `tools/library_pipeline/role_taxonomy.py`

Ask:
- does the existing `CTO / Software Architecture / Platform Engineering` cluster already cover this role semantically?
- does the role also need partial projection from revenue/commercial or product-facing clusters?

For this example, a good first move might be:
- add `solutions-architecture-lead` to the explicit list for `CTO / Software Architecture / Platform Engineering`
- optionally add title keyword support for `solutions architecture`
- only add revenue/commercial projection if preview results show a real gap

Prefer a durable taxonomy change over manually stuffing books into one role.

## Step 4. Update mapping vocabulary only if needed
Inspect:
- `tools/library_pipeline/mapping.py`
- `data/library/book_role_mapping.json`
- `data/library/summaries.json`

If the role still lacks relevant books after taxonomy projection, check whether useful books are being mapped into the wrong clusters or not mapped at all.

For example, if solution-design books are described with words like:
- architecture
n- API
- platform
- systems
- negotiation
- positioning

then decide whether the existing clusters already cover that meaning or need slight expansion.

Avoid inventing a brand-new cluster unless the role’s needs are truly distinct and recurring.

## Step 5. Rebuild and validate
Run:

```bash
python -m tools.library_pipeline.cli map-books
python -m tools.library_pipeline.cli build-registry-overlay
python -m tools.library_pipeline.cli validate-registry-integrity
python -m tools.library_pipeline.cli validate-migration --role solutions-architecture-lead
python -m tools.library_pipeline.cli preview-role-overlay --role solutions-architecture-lead
```

Success criteria:
- registry passes validation
- role has nonzero matched books
- the matched books make sense for the role

## Step 6. Inspect the preview qualitatively
Do not stop at “it matched.”

Ask:
- are the first several books obviously relevant?
- is the role getting architecture/platform material it should have?
- is it getting irrelevant branch material from an over-broad cluster?
- is there enough role-specific rationale to help onboarding?

For this example, strong likely books might include things like:
- architecture and software design books
- API/platform books
- distributed systems / reliability books
- possibly strategy/communication books if the role bridges technical and commercial contexts

If the preview is noisy, refine taxonomy before publishing.

## Step 7. Preserve compatibility with onboarding/aliving
Do not assume the role should read raw registry JSON.

Keep compatibility through role-facing outputs such as:
- `Library Links.generated.md`
- legacy-compatible rendering when appropriate

If this is a brand-new role with no meaningful historic library brief, generated compatibility output can be the real role-facing source.

## Step 8. Decide whether to publish
If the role is part of a pilot or controlled rollout:
- update `data/library/pilot_roles.json` if needed
- use publish/preview guardrails

If the role is not yet meant for live publish:
- leave it validated at the registry/preview layer
- document readiness without forcing a wider rollout

## What not to do in this example
Do not:
- keep the placeholder scaffold and call it “mapped”
- manually hardcode repo-local binary paths as the conceptual source of truth
- overwrite a curated legacy role brief if one exists
- broaden taxonomy so much that unrelated roles inherit noisy books

## Good final state
A good outcome for `solutions-architecture-lead` is:
- the role is represented in taxonomy
- the registry rebuild passes
- preview output is coherent
- onboarding/aliving can consume a role-facing generated library artifact
- no part of the design depends on Git-tracked binaries remaining the canonical source
