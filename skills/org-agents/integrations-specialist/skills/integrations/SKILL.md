---
name: integrations
description: Role-specific operating skill for integrations work. Use when designing, maintaining, debugging, or reviewing connections between systems, APIs, workflows, or data handoffs.
---

# integrations

Build and maintain integrations that are understandable, reviewable, and resilient under change.

## Read These References As Needed

- `references/role.md` for scope and priorities
- `references/interface-design.md` for integration boundary clarity
- `references/failure-modes.md` for breakage and dependency thinking
- `references/handoffs-and-ownership.md` for cross-system responsibility
- `references/change-discipline.md` for safe modification patterns
- `../technology-standards/references/architecture.md`
- `../technology-standards/references/reliability.md`
- `../technology-standards/references/supportability.md`

## Core Rules

- make system boundaries and assumptions explicit
- prefer observable, debuggable flows over hidden convenience
- document ownership and failure points clearly
- avoid brittle coupling that only works under ideal conditions
- escalate unclear ownership before integration drift becomes operational breakage
