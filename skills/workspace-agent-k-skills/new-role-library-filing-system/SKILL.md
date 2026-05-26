---
name: new-role-library-filing-system
description: Design new roles against the post-migration library architecture in workspace-agent-k. Use when creating, revising, or bringing to life any new org role that needs role-library guidance, book mappings, onboarding-ready library artifacts, or compatibility with the new Drive-backed library filing system. Especially relevant when a role would previously have received a placeholder Library Links.md scaffold and now needs real structured mappings from the registry/role taxonomy architecture.
---

# New Role Library Filing System

Use this skill when designing a new role that needs library guidance under the new architecture.

## Core rule

Do not treat a placeholder `My Documents/Library Links.md` scaffold as a real library mapping.

For new roles:
- generate real mappings from the structured library architecture
- preserve compatibility with onboarding/aliving flows
- keep heavy binaries out of Git
- keep role-facing outputs additive and rebuildable

## Source of truth

Treat these layers as the source of truth, in this order:

1. structured library registry in `data/library/registry/`
2. role taxonomy projection in `tools/library_pipeline/role_taxonomy.py`
3. curated legacy `# Role Library Brief` content when a role already has real curated material
4. role-local compatibility outputs such as `Library Links.generated.md`

Do **not** use a generic scaffold `Library Links.md` as authoritative mapping truth.

## Architecture model

The current filing system is:
- Google Drive is the durable source of truth for book files/binaries
- Git keeps lightweight metadata, summaries, mappings, registry artifacts, and migration logic
- Forge / Agent K own rebuildable local processing, indexing, and compatibility outputs
- role-facing library views should be generated from the registry/mapping layer, not manually improvised from repo-local binaries

## When designing a new role

Follow this sequence.

### 1. Identify the role semantics

Determine:
- role slug
- title
- manager
- specialties
- function/branch
- likely adjacent roles
- whether the role belongs primarily to executive, engineering, data, product, design, marketing, ops, governance, or revenue/commercial families

These inputs matter because the registry projection depends on role semantics, not just file presence.

### 2. Check whether the role already has curated legacy library material

Inspect:
- `/root/.openclaw/org-agents/<role>/My Documents/Library Links.md`

If it contains a real curated `# Role Library Brief`:
- preserve/inherit that coverage
- do not discard it in favor of a blank structured rebuild

If it is only a placeholder scaffold:
- do not treat it as meaningful mapping truth
- generate real mappings from the new architecture

### 3. Ensure the role can be projected by the taxonomy

Inspect and update when needed:
- `tools/library_pipeline/role_taxonomy.py`

Use the role taxonomy to make sure the new role receives coverage through:
- explicit role membership
- title keyword matching
- manager-branch inheritance
- specialty keyword matching
- any necessary functional cluster projection

If a new role is unusual, add the least-fragile taxonomy rule needed so future similar roles also inherit correctly.

Prefer improving taxonomy/projected semantics over hardcoding one-off patches unless the role is genuinely unique.

### 4. Ensure the book-to-cluster mapping layer can express the role need

Inspect and update when needed:
- `tools/library_pipeline/mapping.py`
- `data/library/book_role_mapping.json`
- `data/library/summaries.json`

If the role is missing coverage because the cluster vocabulary is too narrow:
- extend mapping keywords or cluster logic carefully
- avoid introducing noisy clusters unless they materially improve role coverage

Prefer small, semantically durable changes.

### 5. Rebuild the registry overlay

Run:
- `python -m tools.library_pipeline.cli map-books`
- `python -m tools.library_pipeline.cli build-registry-overlay`
- `python -m tools.library_pipeline.cli validate-registry-integrity`
- `python -m tools.library_pipeline.cli validate-migration --role <role>`

Goal:
- the role should resolve to meaningful mapped books in the registry layer
- registry integrity must remain clean

### 6. Preview the role-facing output

Run:
- `python -m tools.library_pipeline.cli preview-role-overlay --role <role>`
- `python -m tools.library_pipeline.cli render-legacy-library-links --role <role>` when needed

Use preview to check:
- nonzero matched books
- the books actually make sense for the role
- rationale text is coherent
- the role is not inheriting obviously wrong branch material

Do not stop at "nonzero" if the content is obviously off.

### 7. Preserve onboarding compatibility

Remember:
- onboarding/aliving flows still expect role-local library guidance patterns
- additive outputs are preferred over destructive replacement
- `Library Links.generated.md` is safer than overwriting meaningful legacy files

If the role is new and has no meaningful curated legacy file, it is acceptable to rely on generated compatibility outputs as the real mapping source.

If the role is historic and curated, preserve that curated layer.

## Practical rules

### For new roles
- prefer structured generation over manual book lists
- use taxonomy + registry + compatibility generation
- avoid writing binary/file-path-centric instructions that assume books live in Git
- do not reintroduce `data/library/downloads/` as the conceptual source of truth

### For placeholder roles
- upgrade them from scaffold to real mapping through the architecture
- do not preserve emptiness
- do not confuse placeholder scaffolds with curated intent

### For curated roles
- preserve prior curated role-library intent
- merge legacy curation into the structured system when possible

## Validation standard

A role is not "done" just because a file exists.

Minimum bar:
- role resolves to meaningful books under the registry layer
- validation passes
- generated output is coherent
- onboarding compatibility is preserved
- no regression is introduced for historic curated roles

Stronger bar:
- role coverage aligns with what the old architecture would have meant where meaningful prior curation existed
- role semantics are represented in reusable taxonomy, not just one-off manual fixes

## Key files

Use these files repeatedly:
- `tools/library_pipeline/role_taxonomy.py`
- `tools/library_pipeline/mapping.py`
- `tools/library_pipeline/registry.py`
- `tools/library_pipeline/compatibility.py`
- `tools/library_pipeline/validation.py`
- `tools/library_pipeline/role_overlay.py`
- `tools/library_pipeline/legacy_import.py`
- `data/library/book_role_mapping.json`
- `data/library/registry/role_mappings.json`
- `data/library/registry/manifest.json`
- `data/library/pilot_roles.json`

## Anti-patterns

Do not:
- treat placeholder `Library Links.md` as authoritative curation
- rebuild role guidance from checked-in binaries
- overwrite meaningful curated legacy role briefs casually
- claim coverage is complete without previewing actual role output
- solve a taxonomy problem with repeated manual per-role hacks if a durable projection rule would work better

## Output expectation when asked to design a new role

Produce or verify:
- structured role mappings exist
- registry rebuild passes
- preview output looks coherent
- compatibility path is preserved
- any taxonomy or mapping changes are committed to the architecture, not hidden in one local role file
