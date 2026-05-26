---
name: minimal-safe-improvement-review
version: 1.0.0
description: Review existing systems/docs/code and suggest improvements only where small helper code would materially help. Prefer official docs, minimal flexible changes, optional application, and strong security posture.
---

# Minimal Safe Improvement Review

Use when reviewing a workflow, setup, skill, integration, or capability and deciding whether small helper code should be added.

## Core rule
Do **not** suggest or write helper code unless it materially reduces friction, repeated failure, or ambiguity.

## Review order
1. Check official/local docs first
2. Check existing local helpers/wrappers/scripts
3. Check whether the problem is documentation, process, or startup-state only
4. Only then decide whether helper code is justified

## When helper code is justified
- repeated operator friction
- repeated agent confusion
- repeated runtime/path/env mistakes
- repeated naming/backup/routing mistakes
- repeated safety checks that can be encoded mechanically

## Constraints
- improvements must be minimal
- improvements must be flexible, not rigid overengineering
- all code should be optionally appliable
- prefer wrappers/helpers over invasive rewrites
- preserve security-first defaults
- prefer local/official docs over guesswork

## Security rules
- no new network calls unless clearly justified
- no credential scraping/storage shortcuts
- no hidden external dependencies
- no expanded privileges without explicit need
- no automatic external actions without explicit governance

## Output format

IMPROVEMENT REVIEW
- Problem observed:
- Existing documented path:
- Existing helper/tooling available:
- Gap type: [docs/process/startup/helper-code]
- Helper code justified?: [yes/no]
- Minimal proposed change:
- Optional application?: [yes]
- Security considerations:
- Recommended next step:
