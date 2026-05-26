---
name: google-workspace
description: Google Workspace wrapper skill. Use when the task might involve any Google Workspace service or wrapper, including Drive, Gmail, Docs, Sheets, Slides, Forms, Sites, Drawings, Apps Script, exports, or multi-product workflows through workspace-agent-k. Startup / always-check-skills style rule: before responding to any request that may touch Google Workspace-adjacent workflow, invoke this skill first, even for clarifying questions.
---

# Google Workspace

## Core Rule

If there is even a small chance the task involves Google Workspace, sanctioned Google wrappers, Drive/Gmail/Docs/Sheets/Slides/Forms/Sites/Drawings/Apps Script, or cross-product Google operations, use this skill before responding.

Do this before:
- taking action
- proposing a workflow
- answering a Google Workspace capability question
- asking clarifying questions about a Google-related request

## Purpose

Use the sanctioned general Google Workspace wrapper when a task spans multiple Google services or when the specific per-app wrapper is not the best starting point.

## Wrapper

Primary wrapper path:

`/root/.openclaw/workspace-agent-k/scripts/google-workspace`

## Use This Skill For

- cross-product Google Workspace operations
- general entry-point usage when the task touches multiple Google services
- governed Workspace automation and artifact routing
- situations where a specialized wrapper may exist, but a general wrapper is more appropriate
- checking the sanctioned wrapper layer before claiming Google Workspace capability is unavailable

## Rules

- prefer this sanctioned wrapper over ad hoc invocation paths
- use the more specific wrapper when one clearly fits the task better
- verify exact command behavior from local help when details matter
- keep this skill role-neutral and reusable across agents
- do not skip this skill just because the Google-related ask sounds simple or indirect

## Operating Mode

This skill should be checked proactively at the start of any Google Workspace-related task so the agent does not forget the sanctioned wrapper entry point or overlook more specific Google skills.
