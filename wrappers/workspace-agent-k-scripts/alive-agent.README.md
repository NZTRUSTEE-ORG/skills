# alive-agent

Terminal onboarding wizard for awakening a role agent end-to-end with the current deterministic flow.

## Location

Script:
- `/root/.openclaw/workspace-agent-k/scripts/alive-agent`

README:
- `/root/.openclaw/workspace-agent-k/scripts/alive-agent.README.md`

## Purpose

`alive-agent` wraps the multi-step role bring-up process into a single interactive terminal flow.

It is designed to reduce:
- copy/paste errors
- forgotten sequencing
- operator friction
- visible secret entry

## What it does

The script:
1. Lists unfinished roles and lets the operator select one by number
2. Lets the operator select:
   - model
   - mode
   - LLM pool
   - Slack yes/no
   - Telegram yes/no
3. Shows a final plan summary
4. Only proceeds after explicit confirmation
5. Runs the onboarding steps in sequence:
   - `start`
   - `prepare`
   - `select-options`
   - `activate`
   - `post-activation-enrich`
6. If Slack is enabled:
   - securely prompts for `xapp-...`
   - securely prompts for `xoxb-...`
   - runs `provide-slack-tokens`
   - runs `bind-slack`
   - optionally prompts for Slack pairing code and approves it
7. Prints lightweight verification outputs
8. Restarts the OpenClaw gateway at the end of the flow

## How to run

```bash
/root/.openclaw/workspace-agent-k/scripts/alive-agent
```

## Safety behavior

Before the final `Proceed?` confirmation, the script does not run onboarding commands.

That means:
- selecting a role does **not** change anything by itself
- pressing `Ctrl+C` before `Proceed?` exits safely
- quitting during menu selection is a no-op

After `Proceed?`, the script starts making real changes.

## Current selection behavior

The role picker hides roles whose phase is:
- `slack_bound`

That means already-finished Slack-onboarded roles do not appear in the menu.

Visible roles are treated as unfinished / still available for onboarding or recovery.

If a selected role is not `not_started`, the wizard warns before continuing.

## Library artifact behavior

The awake flow now treats:
- `My Documents/Library Links.generated.md`

as the **primary** role-library artifact.

It uses:
- `My Documents/Library Links.md`

only as **fallback** when the generated file is missing.

This means the current canonical org-agent pipeline is compatible with `alive-agent` without relying on the old git-era role library path.

## Slack behavior

If Slack is enabled, the script prompts securely for:
- app token (`xapp-...`)
- bot token (`xoxb-...`)

These prompts use silent input so the token is not echoed to the terminal.

If the role later surfaces a pairing code, the script can optionally approve it immediately.

If pairing is not approved during the wizard, it prints the exact prompt-based command pattern to use later.

## Lightweight verification outputs

The script prints these checks during/after the flow:

- onboarding phase
- agent record from `openclaw agents list --json`
- expected identity summary
- binding record from `openclaw agents bindings --json`
- Slack token presence state when relevant
- lightweight Slack session-materialization check when relevant

The Slack session check reads the role-local session store directly instead of invoking the heavier verification path during the live onboarding flow.

## True live-ready definition

For a Slack-enabled role, `bind` + `pairing approved` is not enough by itself.

A Slack role is only truly live-ready when all of the following are true:
- agent record exists and points to `/root/.openclaw/org-agents/<slug>`
- Slack binding exists for `accountId=<slug>`
- role-local direct session exists:
  - `agent:<slug>:slack:direct:...`
- direct session workspace is:
  - `/root/.openclaw/org-agents/<slug>`
- Slack transport works and replies visibly arrive in Slack

If a role is bound but has no direct session yet, it is not fully live-ready.

## Dependencies

The script expects these commands to exist:
- `python3`
- `openclaw`
- `jq`

If one is missing, the script exits early.

## Recommended use

Best used for:
- fresh roles
- standard deterministic bring-up
- Slack-enabled onboarding with prompt-based secret entry

Use more caution for roles that already have messy partial history.

## Optional companion tool

There is also a troubleshooting helper:

```bash
/root/.openclaw/workspace-agent-k/scripts/check-role-live <slug>
```

This is optional.

Use it when:
- something seems off
- a role is silent in Slack
- a role seems mis-grounded
- you want a quick config/session/file cohesion check

## Notes for future improvement

Potential next upgrades:
- label roles as `clean` / `resume` / `risky`
- sort cleanest roles first
- hide or separately gate partial/inconsistent roles
- add a resume-only mode
- optionally persist operator choices to a log/artifact
