---
name: google-slides
description: Google Slides program and wrapper skill. Use when the task might involve Google Slides presentations, slide content, presentation assets, deck structure, or outputs intended for Slides through the sanctioned workspace-agent-k wrapper. Startup / always-check-skills style rule: before responding to any request that may touch Slides or Google presentation workflow, invoke this skill first, even for clarifying questions.
---

# Google Slides

## Core Rule

If there is even a small chance the task involves Google Slides, presentations, decks, slide content, speaker-supporting materials, or a Slides wrapper, use this skill before responding.

## Purpose

Work with Google Slides through the sanctioned wrapper path.

## Wrapper

Primary wrapper path:

`/root/.openclaw/workspace-agent-k/scripts/google-slides`

## Use This Skill For

- presentation and slide workflow tasks
- preparing decks, slide content, speaker-supporting material, or presentation assets
- wrapper-enabled Slides operations when available
- producing outputs intended for Google Slides environments

## Rules

- prefer the sanctioned wrapper over ad hoc methods
- verify exact wrapper behavior from local help or official docs when needed
- distinguish presentation design work from live wrapper execution
- keep the skill role-neutral and reusable across agents
- do not skip this skill when the ask sounds like generic presentation work but the destination is Google Slides
