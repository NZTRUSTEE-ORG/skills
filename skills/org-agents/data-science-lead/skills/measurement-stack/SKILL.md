---
name: measurement-stack
description: Shared measurement-stack skill for analytics, experimentation, tagging, attribution, and measurement governance. Use when the agent needs to instrument events, define metrics, set up or review Google Analytics / GA4, Google Tag Manager, Wix signal collection, Google Ads attribution, Gmail/Workspace click tracking context, SQL-based analysis, or Posit Workbench/RStudio analysis workflows.
---

# measurement-stack

Use this skill whenever a task spans instrumentation, events, attribution, experiment measurement, lifecycle click tracking, or cross-system metric consistency.

## Read These References As Needed

- `references/stack-overview.md` for system roles and boundaries
- `references/event-taxonomy.md` for event naming and metric design
- `references/experiment-instrumentation.md` for A/B test measurement requirements
- `references/channel-tracking.md` for click tags, UTMs, lifecycle/email, ads, and attribution
- `references/api-docs.md` for official APIs and developer references
- `references/ethics-handbook.md` for professional ethics and trust constraints
- `references/professional-practice.md` for experimentation and governance checks

## Core Rules

- define the business question before tagging anything
- keep event names and success metrics stable and reviewable
- avoid double-tagging and duplicate measurement paths
- distinguish click tracking, open tracking, session tracking, and conversion tracking
- use SQL and statistical tools only after instrumentation quality is credible
- escalate ethically questionable or trust-damaging measurement requests
