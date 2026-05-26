# Program Workflows

## Read / Inspect

Use GitHub to inspect:
- org structure
- repository visibility and membership
- branches, commits, and pull requests
- issues, review state, and release history
- app installs, Actions, and permission boundaries when the current auth path allows it

Preferred pattern:
1. identify whether the task is conceptual, documentation-only, or live operational work
2. inspect local wrapper/tool guidance before assuming how GitHub access is wired
3. confirm whether auth is human-admin, machine-account bootstrap, or app/wrapper-based
4. proceed using the narrowest viable access path

## Create / Update

Typical safe write workflow:
1. read repo/org context
2. create or switch to a branch rather than editing the protected default branch directly
3. make changes
4. open or update a pull request
5. route review and merge through the protected workflow

Use the CTO-local ops wrapper as the standardized day-to-day path when live GitHub auth is configured:
- `/root/.openclaw/org-agents/cto/My Documents/github/github-ops-wrapper-spec.md`
- `/root/.openclaw/org-agents/cto/My Documents/github/scripts/github-ops`

For org-level admin changes:
1. prefer a human owner/admin account
2. use a dedicated machine account only for time-bounded bootstrap work when necessary
3. avoid leaving broad bootstrap credentials as the steady-state operating model

## OAuth / token bootstrap workflow

Use this when a dedicated machine account is being connected before GitHub Apps or a permanent wrapper path exist.

1. use a dedicated non-personal machine account
2. grant the temporary OAuth/token access needed for bootstrap
3. document what was granted, where it is stored, and how it will be revoked
4. use the CTO-local bootstrap wrapper and wrapper spec as the current sanctioned path:
   - `/root/.openclaw/org-agents/cto/My Documents/github/github-bootstrap-wrapper-spec.md`
   - `/root/.openclaw/org-agents/cto/My Documents/github/scripts/github-bootstrap`
5. complete the bootstrap task
6. verify whether the long-term path should be a GitHub App, wrapper, or narrower credential
7. revoke or rotate the temporary credential when the durable path is ready

## GitHub App transition workflow

Use this when moving from temporary bootstrap auth to a durable automation model.

1. define the automation class: read, review, write, release, or another narrow role
2. create the app with only the permissions needed for that class
3. install it only on the repos it needs
4. test the app on a low-risk repo or read-only workflow first
5. update local notes/wrapper guidance so future sessions know the sanctioned path
6. remove the temporary broader bootstrap path if it is no longer needed

## Import / Export

Common GitHub-adjacent import/export work:
- transfer repos from personal accounts to the org
- export repository content or metadata through git, the GitHub API, or sanctioned wrappers
- produce repo policy docs, permission matrices, CODEOWNERS files, PR templates, and issue templates

## Common Mistakes / Constraints

- treating a personal human account as shared automation
- leaving temporary OAuth/token bootstrap access in place indefinitely
- using one broad credential for read, review, write, and release
- skipping branch protection and relying on trust alone
- assuming CI/CD admin is the same as normal repo write access
- assuming org visibility and repo visibility are the same concept
- guessing the wrapper/API path instead of inspecting the current sanctioned setup
