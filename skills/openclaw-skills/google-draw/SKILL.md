---
name: google-draw
description: Google Drawings program and wrapper skill. Use when the task might involve Google Drawings content, diagram-related artifacts, visual assets, or outputs intended for Google Drawings through the sanctioned workspace-agent-k wrapper. Startup / always-check-skills style rule: before responding to any request that may touch Drawings or Google diagram workflow, invoke this skill first, even for clarifying questions.
---

# Google Draw

## Core Rule

If there is even a small chance the task involves Google Drawings, diagrams, visual assets intended for Drawings, or a Drawings wrapper, use this skill before responding.

## Purpose

Work with Google Drawings through the sanctioned wrapper path.

## Wrapper

Primary wrapper path:

`/root/.openclaw/workspace-agent-k/scripts/google-draw`

## Use This Skill For

- diagram and drawing workflow tasks
- preparing visual assets intended for Google Drawings
- wrapper-enabled Drawings operations when available
- producing outputs for Google Drawings environments

## Rules

- prefer the sanctioned wrapper over ad hoc methods
- verify exact wrapper behavior from local help or official docs when needed
- distinguish content/design work from live wrapper execution
- keep the skill role-neutral and reusable across agents
- do not skip this skill when the ask sounds like general diagramming but the target environment is Google Drawings
