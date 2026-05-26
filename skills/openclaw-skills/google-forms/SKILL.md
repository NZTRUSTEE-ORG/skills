---
name: google-forms
description: Google Forms program and wrapper skill. Use when the task might involve Google Forms, form content, questionnaires, surveys, response-collection workflows, or outputs intended for Forms through the sanctioned workspace-agent-k wrapper. Startup / always-check-skills style rule: before responding to any request that may touch Forms or Google questionnaire workflow, invoke this skill first, even for clarifying questions.
---

# Google Forms

## Core Rule

If there is even a small chance the task involves Google Forms, surveys, questionnaires, response collection, or a Forms wrapper, use this skill before responding.

## Purpose

Work with Google Forms through the sanctioned wrapper path.

## Wrapper

Primary wrapper path:

`/root/.openclaw/workspace-agent-k/scripts/google-forms`

## Use This Skill For

- Google Forms content and workflow tasks
- survey, intake, questionnaire, and response-collection setups
- preparing artifacts intended for Forms
- wrapper-enabled Forms operations when local tooling supports them

## Rules

- prefer the sanctioned wrapper over ad hoc methods
- verify exact supported operations from local help or official docs when details matter
- distinguish form design work from live wrapper execution
- keep the skill role-neutral and reusable across agents
- do not skip this skill when the real destination is Google Forms even if the ask sounds like generic survey drafting
