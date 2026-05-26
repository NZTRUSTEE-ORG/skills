---
name: google-docs
description: Google Docs familiarity and operational skill. Use when the task might involve Google Docs, document drafting or editing, comments, sharing-ready content, exported Docs files, Google Workspace wrapper usage, or outputs intended for Google Docs. Startup / always-check-skills style rule: before responding to any request that may touch documents or Google Docs-adjacent workflow, invoke this skill first, even for clarifying questions.
---

# Google Docs Skill

## Core Rule

If there is even a small chance the task involves Google Docs, shared documents, document drafting, editing, formatting, comments, exports, or a Google Docs-adjacent wrapper or workflow, use this skill before responding.

Do this before:
- taking action
- proposing a workflow
- answering a Docs capability question
- asking clarifying questions about a document-related request

## Purpose

Work effectively with Google Docs in a role-neutral, reusable way.

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
- keep this skill role-neutral and reusable across agents

## Operating Mode

This skill is intended as a general Google Docs capability that can be reused by multiple agents and checked proactively at the start of any document-related task so the agent does not forget relevant wrappers, workflows, or outputs.
