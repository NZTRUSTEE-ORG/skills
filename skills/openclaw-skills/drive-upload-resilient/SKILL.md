---
name: drive-upload-resilient
description: Resilient Google Drive upload workflow skill. Use when the agent needs to upload files to Google Drive via the sanctioned resilient wrapper, recover from flaky or retry-prone upload conditions, or route artifacts into Drive using the workspace-agent-k upload path.
---

# Drive Upload Resilient

## Purpose

Use the sanctioned resilient upload wrapper for Google Drive artifact delivery.

## Wrapper

Primary wrapper path:

`/root/.openclaw/workspace-agent-k/scripts/google-workspace-upload-resilient`

Related implementation path:

`/root/.openclaw/workspace-agent-k/tools/drive_upload_resilient`

## Use This Skill For

- uploading files to Google Drive through the resilient wrapper
- retry-tolerant or queue-backed Drive upload workflows
- artifact delivery where ordinary uploads may be brittle
- governed Drive routing from local outputs into sanctioned Drive destinations

## Rules

- prefer the sanctioned wrapper instead of ad hoc upload scripts
- preserve destination, permission, and governance expectations
- batch work sensibly when possible rather than doing many tiny writes
- if the task also needs broader Google Workspace operations, consider the `google-workspace` wrapper alongside this upload path
