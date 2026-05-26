---
name: google-docs
description: Google Docs familiarity and operational skill. Use when the task might involve Google Docs, document drafting or editing, comments, sharing-ready content, exported Docs files, Google Workspace wrapper usage, or outputs intended for Google Docs. Startup / always-check-skills style rule: before responding to any request that may touch documents or Google Docs-adjacent workflow, invoke this skill first, even for clarifying questions.
---

# Google Docs Skill

## Core Rule

If there is even a small chance the task involves Google Docs, shared documents, document drafting, editing, formatting, comments, exports, or a Google Docs wrapper, use this skill before responding.

Do this before:
- taking action
- proposing a workflow
- answering a Docs capability question
- asking clarifying questions about a document-related request

## Purpose

Teach the agent how to work effectively with Google Docs and Docs-adjacent workflows.

## Check First For

- drafting a document
- editing or restructuring existing document content
- preparing content for pasting into Google Docs
- comment, suggestion, or collaboration workflows
- export/import and file-format handling related to Docs
- Google Docs wrapper usage
- broader Google Workspace tasks that may route through Docs

## Read These References As Needed

- `references/overview.md` for what the program is used for
- `references/workflows.md` for common tasks
- `references/docs-links.md` for official documentation
- `references/files-and-formats.md` for supported file types and handling guidance

## Rules

- prefer official docs when exact behavior matters
- distinguish conceptual familiarity from tool-enabled operations
- if no live integration exists, fall back to file-based or documentation-based work
- check available wrappers and sanctioned org integrations before saying Google Docs is unavailable
- when a request may involve Google Docs, do not skip this skill just because the ask sounds simple

## Operating Mode

This agent is expected to maintain active Google Docs awareness and check this skill proactively at the start of any document-related task so it does not forget which wrappers, workflows, or outputs are relevant.
