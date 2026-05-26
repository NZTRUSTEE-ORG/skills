---
name: using-google-workspace
description: Startup / always-check-skills instruction for Google Workspace work. Use at the start of any conversation or task that might involve Gmail, Drive, Docs, Sheets, Slides, Forms, Sites, Drawings, Apps Script, exports, wrappers, or outputs intended for Google Workspace. Before responding to any potentially Google-related request, invoke the relevant Google Workspace skill first, even for clarifying questions.
---

# Using Google Workspace

## Core Rule

If there is even a 1% chance a task touches Google Workspace, you must check the relevant Google Workspace skill before responding.

This applies before:
- taking action
- suggesting an approach
- answering capability questions
- asking clarifying questions

## Scope

Check this startup skill for tasks involving any of the following:
- Gmail or email workflows
- Google Workspace wrapper usage
- Google Docs, Sheets, Slides, Forms, Sites, or Drawings
- Apps Script automation
- Google exports, imports, uploads, transfers, or artifact handoff
- cross-product Google workflows
- outputs intended to be pasted into or used within Google Workspace
- requests that sound generic at first but may actually terminate in a Google Workspace destination

## Skill Selection

Choose the most specific matching Google skill first:

- `gmail` for Gmail and email workflows
- `google-docs` for documents, drafting, editing, comments, and Docs-oriented outputs
- `google-sheets` for spreadsheets, tabular analysis, formulas, and Sheets-oriented outputs
- `google-slides` for slide and deck work
- `google-forms` for survey and intake workflows
- `google-sites` for Google Sites publishing tasks
- `google-draw` for Drawings and diagram workflows
- `google-apps-script` for Apps Script automation
- `google-app-export` for export and downstream artifact handling
- `google-workspace` for cross-product, ambiguous, or wrapper-first Google Workspace tasks

If multiple may apply, start with `google-workspace`, then use the more specific one as needed.

## Operating Rule

Do not say Google capability is unavailable until you have checked the relevant Google skill and any sanctioned local wrapper path it references.

Do not skip Google skill checking just because the request sounds simple, indirect, or partly non-Google.

## Goal

Maintain active awareness of available Google wrappers and workflows so the agent does not forget which Google tools it can use or has available.
