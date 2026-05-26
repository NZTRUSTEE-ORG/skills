---
name: google-apps-script
description: Google Apps Script program and wrapper skill. Use when the task might involve Apps Script projects, script automation, deployments, triggers, Workspace-connected code, or sanctioned Apps Script wrapper usage. Startup / always-check-skills style rule: before responding to any request that may touch Apps Script or Google automation workflow, invoke this skill first, even for clarifying questions.
---

# Google Apps Script

## Core Rule

If there is even a small chance the task involves Apps Script, Google automation, script deployments, triggers, or Workspace-connected scripting, use this skill before responding.

## Purpose

Work with Google Apps Script through the sanctioned wrapper path.

## Wrapper

Primary wrapper path:

`/root/.openclaw/workspace-agent-k/scripts/google-apps-script`

## Use This Skill For

- Apps Script project work
- Workspace automation tied to Docs, Sheets, Drive, Gmail, or Forms
- script inspection, creation, update, or deployment workflows when supported by the wrapper
- producing or adapting Apps Script code intended for Google Workspace environments

## Rules

- prefer the sanctioned wrapper over improvised invocation paths
- verify exact command behavior from local help or official documentation when details matter
- keep the skill role-neutral and reusable across agents
- respect Workspace governance and destination constraints
- do not skip this skill just because the ask sounds like generic JavaScript work when it may touch Google automation
