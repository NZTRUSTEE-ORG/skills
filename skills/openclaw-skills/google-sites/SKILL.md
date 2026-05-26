---
name: google-sites
description: Google Sites program and wrapper skill. Use when the task might involve Google Sites content, assets, publishing workflows, site structure, or outputs intended for Google Sites through the sanctioned workspace-agent-k wrapper. Startup / always-check-skills style rule: before responding to any request that may touch Sites or Google publishing workflow, invoke this skill first, even for clarifying questions.
---

# Google Sites

## Core Rule

If there is even a small chance the task involves Google Sites, site structure, publishing workflows, or a Sites wrapper, use this skill before responding.

## Purpose

Work with Google Sites through the sanctioned wrapper path.

## Wrapper

Primary wrapper path:

`/root/.openclaw/workspace-agent-k/scripts/google-sites`

## Use This Skill For

- Google Sites content and workflow tasks
- preparing files, structure, or assets intended for Sites
- inspecting or operating Google Sites through sanctioned local tooling when available
- documentation or publishing workflows that target Google Sites

## Rules

- prefer the sanctioned wrapper over ad hoc methods
- verify exact capabilities from local help when the wrapper behavior is not obvious
- separate file preparation from live tool-enabled operations
- keep the skill role-neutral and reusable across agents
- do not skip this skill when the ask sounds like generic web publishing but the destination is Google Sites
