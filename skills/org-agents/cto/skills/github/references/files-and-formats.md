# Files and Formats

## Common File Types

- `README.md` — repo overview and usage notes
- `.github/CODEOWNERS` — required reviewers by path
- `.github/pull_request_template.md` — PR guidance
- `.github/ISSUE_TEMPLATE/*` — issue intake structure
- `.github/workflows/*.yml` — GitHub Actions workflows
- `.gitignore` — ignored files
- `.gitattributes` — git file handling rules
- workflow/release config files specific to the repo stack

## Handling Notes

- treat `.github/workflows/*.yml` as sensitive operational files because they can affect automation and deployment behavior
- treat CODEOWNERS, branch protection, and PR templates as governance surfaces, not just convenience files
- document auth assumptions when adding wrapper or API helper code for GitHub access
- do not embed long-lived broad credentials in repo files
- prefer environment-based or app-based auth paths for automation code

## Export / Import Notes

- repo transfer moves the namespace but may require post-transfer review of Actions, secrets, Pages, webhooks, and branch protection
- API helper or wrapper code should document required scopes, expected repo/org permissions, and revocation steps
- if a temporary machine-account OAuth/token path is used, note clearly that it is bootstrap-only unless explicitly promoted to a sanctioned long-term path
