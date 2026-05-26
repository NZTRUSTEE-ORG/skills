# GitHub Bootstrap Wrapper Spec

## Purpose

Define the CTO-local temporary GitHub access path used during the bootstrap phase before GitHub Apps are created and before repo- or app-specific access is pruned.

This wrapper is intentionally:
- local to the CTO role
- temporary in trust model
- explicit about its auth source
- designed to be replaced or narrowed later

## Current operating model

During bootstrap, only the CTO role has GitHub access. The current design assumes:
- a dedicated non-personal machine account
- temporary broad permissions suitable for an empty playground org
- eventual migration to GitHub Apps and narrower read/review/write/release boundaries

This is not the long-term steady-state model.

## Auth source

The wrapper should read a GitHub token from one of these sources, in order:

1. `GITHUB_TOKEN`
2. `GITHUB_BOOTSTRAP_TOKEN`
3. `~/.config/cto-secrets/github-bootstrap-token`

Optional supporting variables:
- `GITHUB_API_URL` (default: `https://api.github.com`)
- `GITHUB_ORG` (default org for convenience commands)
- `GITHUB_OWNER` (default owner for repo convenience commands)

## Security model

### Bootstrap rules
- use a dedicated machine account, not Dillon's personal account
- keep the token outside repositories
- treat the token as temporary bootstrap auth even if it currently has broad permissions
- rotate or revoke the token when GitHub App-based flows are ready
- document the future replacement path rather than normalizing broad shared auth

### Current temporary permission stance

Because the org is currently an empty playground, the bootstrap token may temporarily hold broad permissions. This is allowed only because:
- there are no production repositories yet
- the goal is to rapidly stand up the GitHub operating surface
- the next stage is explicit permission pruning and GitHub App creation

## Wrapper contract

The bootstrap wrapper remains repository-focused. GitHub Projects / ProjectV2 are out of scope for this operator line and should not be introduced through bootstrap as a hidden dependency.

The wrapper should provide a small, predictable command surface:

- `whoami` — validate auth and show the current GitHub identity
- `api <path>` — GET an API path
- `api-post <path> <json>` — POST JSON to an API path
- `org get [org]` — fetch org info
- `repo list [owner]` — list repos for an owner/org
- `repo create <name> [--private|--public] [--description <text>]` — create a repo in the default org or owner

The wrapper should:
- fail clearly when no token is configured
- avoid printing tokens
- support `jq` when present for pretty output, but not require it for correctness
- delegate bootstrap compliance logic to the primary operator path as it becomes available

## Required repository baseline

Every canonical repository created through the bootstrap path must include the following root files before it is treated as ready for normal implementation work:

- `README.md`
- `AGENTS.md`

Bootstrap flows should create these files automatically when the repo is initialized. The preferred long-term location for this enforcement is the `github-operator`, with `github-bootstrap` acting as a compatibility/bootstrap entry point into the same logic.

## Future migration path

This wrapper is the bootstrap layer. Later, split the auth model into one or more of:
- `cto-read-app`
- `cto-review-app`
- `cto-write-app`
- `cto-release-app`

Current wrapper split:
- `github-bootstrap` for transitional admin/bootstrap work
- `github-ops` for normal repo/branch/file/PR operations

A later stage may still introduce more specialized wrappers or auth profiles, but bootstrap/admin work should remain separate from day-to-day repo operations.

## Operational notes

- prefer branch + PR workflows once repos exist
- do not rely on this wrapper alone as proof that the final permission model is acceptable
- if the wrapper is used to create repos, also record intended visibility and future access boundaries in durable notes
- if a repo is created through bootstrap, ensure `README.md` and `AGENTS.md` are present before handing it off for normal coding workflows
- if GitHub Apps are introduced, update the wrapper and skill docs together so future sessions do not keep using stale bootstrap assumptions
- for the repos-only finalization path, treat GitHub API as source of truth, SQLite as the planned operator cache/index, and Google Sheets as visibility-only reporting

## Example environment setup

```bash
export GITHUB_TOKEN='ghp_or_fine_grained_token_here'
export GITHUB_ORG='your-org-name'
```

Or:

```bash
mkdir -p ~/.config/cto-secrets
chmod 700 ~/.config/cto-secrets
printf '%s' 'ghp_or_fine_grained_token_here' > ~/.config/cto-secrets/github-bootstrap-token
chmod 600 ~/.config/cto-secrets/github-bootstrap-token
```

## Revocation checklist

When the GitHub App path is ready:
- revoke or rotate the bootstrap token
- remove broad org/repo permissions no longer needed by the machine account
- update wrapper defaults and docs to point to the app-based path
- update the GitHub skill references so the bootstrap path is clearly marked legacy or transitional
