---
name: google-sheets
description: Google Sheets familiarity and operational skill. Use when the task might involve Google Sheets, spreadsheets, tables, formulas, structured data, exports/imports, analysis intended for Sheets, Google Workspace wrapper usage, or outputs intended for Google Sheets. Startup / always-check-skills style rule: before responding to any request that may touch spreadsheet or Google Sheets-adjacent workflow, invoke this skill first, even for clarifying questions.
---

# Google Sheets Skill

## Core Rule

If there is even a small chance the task involves Google Sheets, spreadsheets, tabular data, formulas, imports, exports, reporting, or a Google Sheets wrapper, use this skill before responding.

Do this before:
- taking action
- proposing a workflow
- answering a Sheets capability question
- asking clarifying questions about a spreadsheet-related request

## Purpose

Teach the agent how to work effectively with Google Sheets and Sheets-adjacent workflows.

## Check First For

- spreadsheet creation or editing
- formulas, tabs, ranges, filters, pivots, or structured tables
- CSV/XLSX import or export work that may end up in Sheets
- analysis intended to be delivered in Google Sheets
- Google Sheets wrapper usage
- broader Google Workspace tasks that may route through Sheets

## Read These References As Needed

- `references/overview.md` for what the program is used for
- `references/workflows.md` for common tasks
- `references/docs-links.md` for official documentation
- `references/files-and-formats.md` for supported file types and handling guidance

## Rules

- prefer official docs when exact behavior matters
- distinguish conceptual familiarity from tool-enabled operations
- if no live integration exists, fall back to file-based or documentation-based work
- check available wrappers and sanctioned org integrations before saying Google Sheets is unavailable
- when a request may involve Google Sheets, do not skip this skill just because the ask sounds simple

## Operating Mode

This agent is expected to maintain active Google Sheets awareness and check this skill proactively at the start of any spreadsheet-related task so it does not forget which wrappers, workflows, or outputs are relevant.
