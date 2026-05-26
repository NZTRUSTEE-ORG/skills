# Quick Reference

## Use this skill when
- designing a new role that needs library guidance
- upgrading a placeholder role scaffold into a real mapped role
- preserving legacy curated role-library intent while moving to the new architecture

## Source-of-truth order
1. `data/library/registry/`
2. `tools/library_pipeline/role_taxonomy.py`
3. real curated `# Role Library Brief` files
4. generated role-facing compatibility outputs

## Placeholder vs curated
- Placeholder scaffold `Library Links.md` = not authoritative
- Real curated `# Role Library Brief` = preserve/inherit

## Main files
- `tools/library_pipeline/role_taxonomy.py`
- `tools/library_pipeline/mapping.py`
- `tools/library_pipeline/registry.py`
- `tools/library_pipeline/compatibility.py`
- `tools/library_pipeline/validation.py`
- `tools/library_pipeline/role_overlay.py`
- `tools/library_pipeline/legacy_import.py`
- `data/library/book_role_mapping.json`
- `data/library/registry/role_mappings.json`
- `data/library/pilot_roles.json`

## Fast workflow
1. define role semantics
2. inspect whether role has curated legacy brief or placeholder scaffold
3. update taxonomy if the role needs projection support
4. update mapping keywords/clusters if needed
5. run:
   - `python -m tools.library_pipeline.cli map-books`
   - `python -m tools.library_pipeline.cli build-registry-overlay`
   - `python -m tools.library_pipeline.cli validate-registry-integrity`
   - `python -m tools.library_pipeline.cli validate-migration --role <role>`
   - `python -m tools.library_pipeline.cli preview-role-overlay --role <role>`
6. verify nonzero and coherent coverage
7. preserve onboarding compatibility

## Completion bar
- nonzero matched books
- coherent role fit
- validation passes
- no meaningful curated legacy content lost
- no dependence on Git-tracked binaries as source of truth

## Anti-patterns
- treating scaffolds as legacy truth
- overwriting curated role briefs casually
- solving taxonomy issues with fragile one-off hacks
- claiming success before previewing actual role output
