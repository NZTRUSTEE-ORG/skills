---
name: github
description: Use when the agent needs to work with GitHub repos, org permissions, pull requests, reviews, OAuth or token bootstrap flows, GitHub Apps, or wrapper/API paths for GitHub operations.
---

# GitHub Skill

## Overview

Use this skill when the task touches GitHub as an operational system, not just as a concept. This role should distinguish between:
- human GitHub administration
- temporary machine-account bootstrap access
- steady-state app or wrapper-based automation

The default secure posture is:
- human accounts own/administer the org
- dedicated machine accounts may be used for short bootstrap windows
- GitHub Apps or other standardized wrapper/API paths should become the long-term automation model

## When to Use

- org setup, repo transfer, repo visibility, teams, and permissions
- read/review/write/release access design
- machine accounts versus GitHub Apps
- OAuth or token-based bootstrap questions
- GitHub API or CLI workflows when auth is already configured
- producing repo policies, permission matrices, PR workflows, or GitHub-facing docs

## Operating Rules

- prefer official GitHub docs when exact behavior or permission semantics matter
- do not assume a native first-class GitHub tool exists in chat; inspect local wrappers, sanctioned scripts, and runtime reality first
- do not recommend sharing Dillon's personal GitHub account with agents when a dedicated machine account or GitHub App can be used instead
- treat temporary OAuth/token bootstrap as transitional, least-privilege, and revocable
- prefer branch + PR workflows over direct pushes to protected branches
- prefer repo-scoped, app-scoped, or otherwise least-privileged auth over broad org-wide credentials
- when a local wrapper exists, read the wrapper or its guidance before use rather than guessing invocation or auth behavior
- treat GitHub as the canonical system of record for code written by this runtime and its delegated agents unless the user explicitly approves an exception
- require every canonical repository to include `README.md` and `AGENTS.md` at the repo root before treating it as ready for normal implementation work
- prefer operator-enforced bootstrap/remediation of missing repo baseline files over ad hoc manual handling

## Standard Auth Ladder

1. **Human admin account** for org ownership, billing, recovery, and high-trust configuration
2. **Dedicated machine account** for temporary OAuth/token bootstrap when needed
3. **GitHub App or standardized wrapper/API path** for durable automation

If the task is exploratory or bootstrap-only, a dedicated machine account may be appropriate. If the task is intended to become normal recurring automation, guide it toward a wrapper or GitHub App path.

## Standardized API / wrapper path

When live GitHub access is needed, use this sequence:
1. inspect local tool/wrapper guidance
2. identify the currently sanctioned auth path
3. prefer `github-operator` for intent-based repo/org/branch/file/PR work
4. use legacy wrappers only as compatibility paths while the operator rollout completes
5. verify or establish repository bootstrap compliance (`README.md` and `AGENTS.md`) before normal coding workflows proceed
6. record scopes, repo access, and revocation/rotation notes when a new path is established

If no local wrapper exists yet, be explicit that the current state is a temporary bootstrap path rather than a finished integration.

## Read These References As Needed

- `/root/.openclaw/org-agents/cto/docs/ORG-GITHUB-OPERATOR-AND-REPO-BASELINE-RULE.md` as the governing rule for canonical GitHub repository operations
- `references/overview.md` for what GitHub is used for in this role
- `references/workflows.md` for repo/org/auth workflows
- `references/docs-links.md` for official docs and API references
- `references/files-and-formats.md` for GitHub-specific files and formats
- `/root/.openclaw/org-agents/cto/My Documents/github/github-bootstrap-wrapper-spec.md` for the CTO-local bootstrap auth and wrapper contract
- `/root/.openclaw/org-agents/cto/My Documents/github/github-ops-wrapper-spec.md` for the CTO-local repo/branch/PR operations contract
- `/root/.openclaw/org-agents/cto/My Documents/github/scripts/github-bootstrap` for the bootstrap/admin wrapper implementation
- `/root/.openclaw/org-agents/cto/My Documents/github/scripts/github-ops` for the repo/branch/file/PR operations wrapper implementation

## Quick Decision Guide

- Need to explain GitHub concepts or permissions? → use this skill and the references
- Need to use live GitHub with temporary auth? → verify the sanctioned OAuth/token bootstrap path first
- Need long-term automation? → prefer GitHub Apps or a standardized local wrapper/API path
- Need org governance or sensitive permission design? → keep humans as org owners and minimize machine privileges
- Need to create or bootstrap a repo? → ensure the repo ends with `README.md` and `AGENTS.md` at the root
- Need to do coding work in an existing repo? → inspect whether the repo is bootstrap-compliant before treating it as ready for normal implementation work
