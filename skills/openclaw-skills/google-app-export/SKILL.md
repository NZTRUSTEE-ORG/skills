---
name: google-app-export
description: Google app export wrapper skill. Use when the task might involve exporting content or artifacts from Google-related applications for local review, transfer, migration, upload, or archival workflows through the sanctioned workspace-agent-k wrapper. Startup / always-check-skills style rule: before responding to any request that may touch Google exports or downstream Google artifact handling, invoke this skill first, even for clarifying questions.
---

# Google App Export

## Core Rule

If there is even a small chance the task involves exporting files or artifacts out of Google applications for downstream handling, use this skill before responding.

## Purpose

Use the sanctioned export wrapper for Google application artifacts.

## Wrapper

Primary wrapper path:

`/root/.openclaw/workspace-agent-k/scripts/google-app-export`

Related implementation path:

`/root/.openclaw/workspace-agent-k/tools/google_app_export`

## Use This Skill For

- exporting files or artifacts from Google-related applications
- preparing exported content for review, archiving, migration, or upload
- downstream workflows that need local files rather than only live Workspace state

## Rules

- prefer the sanctioned export wrapper instead of improvised export scripts
- verify exact supported export behavior from local help when needed
- preserve file naming, format, and destination expectations
- keep the skill role-neutral and reusable across agents
- do not skip this skill when the real need is export or handoff rather than in-app editing
