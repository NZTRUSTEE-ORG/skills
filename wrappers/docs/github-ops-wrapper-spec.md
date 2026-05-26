# GitHub Ops Wrapper Spec

## Purpose

Define the CTO-local day-to-day GitHub operations wrapper used after bootstrap for normal repository work.

This wrapper is separate from `github-bootstrap` on purpose:
- `github-bootstrap` handles bootstrap/admin-oriented setup
- `github-ops` handles normal repo, branch, file, and PR workflows

## Scope

`github-ops` is intended for recurring operational tasks for **GitHub repositories only** such as:
- reading repo metadata
- listing branches
- creating branches
- reading files from a repo
- committing file content
- listing pull requests
- creating pull requests

Out of scope for this wrapper and operator finalization slice:
- GitHub Projects / ProjectV2 boards
- project items, fields, or board automation
- using GitHub Projects as an operator dependency

It should avoid becoming an all-purpose admin surface. Org-wide or app bootstrap work should stay in `github-bootstrap`.

## Current primary path

`github-operator` is the primary operational surface for intent-based repo, branch, file, and PR work. `github-ops` should be treated as a compatibility wrapper that maps legacy day-to-day commands into operator behavior.

## Auth source

The wrapper should read auth from the same sources as `github-bootstrap`, in order:

1. `GITHUB_TOKEN`
2. `GITHUB_BOOTSTRAP_TOKEN`
3. `~/.config/cto-secrets/github-bootstrap-token`

Optional variables:
- `GITHUB_API_URL`
- `GITHUB_ORG`
- `GITHUB_OWNER`
- `GITHUB_REPO`

## Command surface

- `repo get <repo> [owner]`
- `branch list <repo> [owner]`
- `branch create <repo> <new-branch> [--from <base-branch>] [owner]`
- `file get <repo> <path> [--ref <branch>] [owner]`
- `file put <repo> <path> <content-file> --message <msg> [--branch <branch>] [--owner <owner>]`
- `pr list <repo> [owner]`
- `pr create <repo> --title <title> --head <branch> [--base <branch>] [--body-file <file>] [--owner <owner>]`

## Safety rules

- default to branch/PR workflows rather than direct default-branch changes
- require an explicit commit message for file writes
- prefer explicit owner/repo context or clear defaults from env
- never print tokens
- fail clearly on missing required context
- treat repositories missing `README.md` or `AGENTS.md` as bootstrap-incomplete for normal implementation work
- defer readiness/compliance enforcement to the operator so missing baseline docs can be blocked or autofixed consistently

## Required repository baseline

Every canonical repository handled through the day-to-day GitHub path must contain the following root files before it is considered ready for normal implementation work:

- `README.md`
- `AGENTS.md`

The operator should verify and report this compliance state during repo inspection and before normal write/PR flows proceed.

## Architecture notes

For the repos-only operating model:
- GitHub API is the source of truth
- a local SQLite index/cache is the planned operator-facing lookup layer
- Google Sheets / GAS are visibility and reporting surfaces, not the operator's primary dependency
- the operator should prefer structured local lookup or live GitHub API inspection over spreadsheet parsing

## Future growth

If this wrapper grows further, likely additions are:
- `issue list/create`
- `pr review`
- `team list/grant`
- `release create`

GitHub Projects remain explicitly out of scope unless separately approved.

But admin/bootstrap setup should remain separate.
