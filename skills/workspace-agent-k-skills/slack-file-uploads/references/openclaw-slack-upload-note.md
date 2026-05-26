# OpenClaw Slack file upload note

## Verified local source

Source file:
- `/usr/lib/node_modules/openclaw/docs/channels/slack.md`

Verified statement from the docs:
- Current Slack message actions include `send`, `upload-file`, `download-file`, `read`, `edit`, `delete`, `pin`, `unpin`, `list-pins`, `member-info`, and `emoji-list`.

## Interpretation guidance

This means:
- the OpenClaw Slack channel implementation supports a file-upload action in the platform
- a given agent session may still not have a first-class tool surfaced for direct file upload from the current runtime/tool policy

## Recommended explanation to users

Use wording like:
- "OpenClaw Slack supports file upload in principle, per the local Slack docs."
- "This specific session may or may not expose a direct upload tool/action to me."
- "So I should verify actual runtime tool exposure before claiming I can send a file directly from here."

## Why this matters

Agents should avoid two common errors:
1. claiming file upload is impossible because no first-class upload tool is visible in the current chat surface
2. claiming file upload is available without checking whether the current runtime actually exposes the necessary action/tool
