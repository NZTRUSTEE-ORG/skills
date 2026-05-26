# Agent Generator

Use `scripts/new-agent.sh` to create a new agent workspace from `templates/base-agent/`.

## Usage

```bash
scripts/new-agent.sh <agent-slug> <agent-name> <job-title> [reports-to]
```

## Example

```bash
scripts/new-agent.sh revenue-ops "Ledger" "Revenue Operations Lead" "Dillon Brady"
```

## What it does

- copies `templates/base-agent/` into `/root/.openclaw/org-agents/<agent-slug>/`
- preserves agent-local self-improvement files
- fills basic identity and org placeholders
- leaves the rest ready for role-specific tailoring

## Safety

The template is intentionally restrictive:
- child agents may edit their own workspace
- child agents may not edit other agents by default
- cross-agent authority must be explicitly granted by Dillon

## Skill Generators

### Create a role skill

```bash
scripts/new-role-skill.sh <agent-dir> <skill-slug> <job-title> [department]
```

### Add a program skill

```bash
scripts/add-program-skill.sh <agent-dir> <program-slug> <program-name> [mode]
```

Modes:
- `familiarity` (default)
- `operational`

Examples:

```bash
scripts/new-role-skill.sh finance-agent finance-forecasting "Finance Forecasting Lead" Finance
scripts/add-program-skill.sh finance-agent google-sheets "Google Sheets" operational
scripts/add-program-skill.sh finance-agent google-docs "Google Docs" operational
```
