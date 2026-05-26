---
name: slack-file-uploads
description: Handle Slack file-upload capability discovery and execution guidance for OpenClaw. Use when an agent needs to send or attach files into Slack chats, determine whether file uploads are supported in the current runtime, inspect local OpenClaw Slack docs for upload capability, or explain the difference between platform support and currently exposed tool surface.
---

# Slack File Uploads

Use this skill to reason about Slack file sending in OpenClaw without guessing.

## Core workflow

1. Check local OpenClaw Slack docs first.
2. Distinguish platform capability from current session tool exposure.
3. Confirm whether the runtime exposes a first-class tool/action for file sending.
4. If direct sending is unavailable, say so clearly and cite the docs path.
5. If asked to preserve the know-how for others, save/update this skill or a role-local artifact.

## What to verify

- Slack docs mention available message actions.
- `upload-file` is listed among current Slack message actions.
- The current agent session may still lack a first-class upload tool even if the platform supports it.

## Canonical local doc

Read:
- `/usr/lib/node_modules/openclaw/docs/channels/slack.md`

Look for the section that states current Slack message actions include:
- `send`
- `upload-file`
- `download-file`
- `read`
- `edit`
- `delete`
- `pin`
- `unpin`
- `list-pins`
- `member-info`
- `emoji-list`

## Response pattern

Say the answer in this order:
1. whether OpenClaw Slack supports file upload in principle
2. whether the current runtime/session exposes a direct tool for it
3. what doc/source establishes that
4. what the limitation is, if any

## Constraints

- Do not claim you can upload files unless the current session actually exposes the necessary action/tool.
- Do not infer absence from missing first-class chat tools alone; inspect local docs/runtime first.
- Prefer local OpenClaw docs over memory or guesswork when exact behavior matters.

## Optional artifact path

If the user wants a reusable artifact for other agents, keep or update this skill at:
- `/root/.openclaw/workspace-agent-k/skills/slack-file-uploads/`
