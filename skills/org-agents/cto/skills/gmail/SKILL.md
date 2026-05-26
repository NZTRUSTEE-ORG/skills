---
name: gmail
description: Gmail familiarity and operational skill. Use when the task might involve Gmail, email drafting or sending, inbox/search workflows, message threads, labels, attachments, Google Workspace wrapper usage, or outputs intended for Gmail. Startup / always-check-skills style rule: before responding to any request that may touch email or Gmail-adjacent workflow, invoke this skill first, even for clarifying questions.
---

# Gmail Skill

## Core Rule

If there is even a small chance the task involves Gmail, email, inbox triage, drafting, sending, replying, searching threads, labels, attachments, or a Gmail wrapper, use this skill before responding.

Do this before:
- taking action
- proposing a workflow
- answering a Gmail capability question
- asking clarifying questions about an email-related request

## Purpose

Teach the agent how to work effectively with Gmail and Gmail-adjacent workflows.

## Check First For

- drafting or rewriting emails
- replying to existing threads
- inbox review, search, triage, or labeling
- attachment handling
- Gmail wrapper usage
- Google Workspace tasks that may route through Gmail
- producing outputs intended to be pasted, sent, or reviewed in Gmail

## Read These References As Needed

- `references/overview.md` for what the program is used for
- `references/workflows.md` for common tasks
- `references/docs-links.md` for official documentation
- `references/files-and-formats.md` for supported file types and handling guidance

## Rules

- prefer official docs when exact behavior matters
- distinguish conceptual familiarity from tool-enabled operations
- if no live integration exists, fall back to file-based or documentation-based work
- check available wrappers and sanctioned org integrations before saying Gmail is unavailable
- when a request may involve Gmail, do not skip this skill just because the ask sounds simple

## Operating Mode

This agent is expected to maintain active Gmail awareness and check this skill proactively at the start of any email-related task so it does not forget which wrappers, workflows, or outputs are relevant.
