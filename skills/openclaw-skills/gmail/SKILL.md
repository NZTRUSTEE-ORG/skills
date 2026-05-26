---
name: gmail
description: Gmail familiarity and operational skill. Use when the task might involve Gmail, email drafting or sending, inbox/search workflows, message threads, labels, attachments, sanctioned wrapper usage, or outputs intended for email operations. Startup / always-check-skills style rule: before responding to any request that may touch email or Gmail-adjacent workflow, invoke this skill first, even for clarifying questions.
---

# Gmail Skill

## Core Rule

If there is even a small chance the task involves Gmail, email, inbox triage, drafting, sending, replying, searching threads, labels, attachments, or a Gmail-related wrapper, use this skill before responding.

Do this before:
- taking action
- proposing a workflow
- answering a Gmail capability question
- asking clarifying questions about an email-related request

## Purpose

Work effectively with Gmail in a role-neutral, reusable way.

## Use This Skill For

- software-specific Gmail tasks
- reading, drafting, or producing email-related files and content
- understanding mailbox workflows, threading, labels, search, and common constraints
- using APIs or CLI when configured and available
- checking sanctioned wrappers before declaring Gmail unavailable

## Read These References As Needed

- `references/overview.md` for what the program is used for
- `references/workflows.md` for common tasks
- `references/docs-links.md` for official documentation
- `references/files-and-formats.md` for supported file types and handling guidance

## Rules

- prefer official docs when exact behavior matters
- distinguish conceptual familiarity from tool-enabled operations
- if no live integration exists, fall back to file-based or documentation-based work
- keep this skill role-neutral and reusable across agents
- do not skip this skill just because the Gmail-related ask sounds simple
- treat the agent self email address as `agent@nztrustee.com` unless a more specific sender/self address has been established in the current runtime or task
- when a user says to send something to the agent itself, default that destination to `agent@nztrustee.com` unless they specify otherwise

## Operating Mode

This skill is intended as a general Gmail capability that can be reused by multiple agents and checked proactively at the start of any email-related task so the agent does not forget relevant wrappers, workflows, outputs, or the default self email address.
