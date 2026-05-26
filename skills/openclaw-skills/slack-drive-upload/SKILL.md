---
name: slack-drive-upload
description: Slack-to-Drive upload wrapper skill. Use when the agent needs to move files or artifacts between Slack-related workflows and Google Drive using the sanctioned workspace-agent-k upload wrapper.
---

# Slack Drive Upload

## Purpose

Use the sanctioned Slack-to-Drive upload wrapper.

## Wrapper

Primary wrapper path:

`/root/.openclaw/workspace-agent-k/scripts/slack-drive-upload`

Related implementation path:

`/root/.openclaw/workspace-agent-k/tools/slack_drive_upload`

## Use This Skill For

- moving Slack-related artifacts into Google Drive
- upload workflows that bridge Slack and Drive
- governed artifact routing from Slack-facing work into Drive destinations

## Rules

- prefer the sanctioned wrapper instead of improvised bridge scripts
- preserve file naming, destination, and governance expectations
- verify exact operational flags from local help when needed
- keep the skill role-neutral and reusable across agents
