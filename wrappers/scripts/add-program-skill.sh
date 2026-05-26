#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 3 ]]; then
  echo "Usage: $0 <agent-dir> <program-slug> <program-name> [mode]" >&2
  exit 1
fi

ROOT="/root/.openclaw/workspace-agent-k"
TEMPLATE_DIR="$ROOT/templates/program-skill"
AGENT_DIR_INPUT="$1"
PROGRAM_SLUG="$2"
PROGRAM_NAME="$3"
MODE="${4:-familiarity}"

if [[ "$AGENT_DIR_INPUT" = /* ]]; then
  AGENT_DIR="$AGENT_DIR_INPUT"
else
  AGENT_DIR="$ROOT/agents/$AGENT_DIR_INPUT"
fi

TARGET_DIR="$AGENT_DIR/skills/$PROGRAM_SLUG"

if [[ ! -d "$AGENT_DIR" ]]; then
  echo "Agent directory not found: $AGENT_DIR" >&2
  exit 1
fi

if [[ -e "$TARGET_DIR" ]]; then
  echo "Skill already exists: $TARGET_DIR" >&2
  exit 1
fi

mkdir -p "$AGENT_DIR/skills"
rsync -a "$TEMPLATE_DIR/" "$TARGET_DIR/"

python3 - "$TARGET_DIR" "$PROGRAM_SLUG" "$PROGRAM_NAME" "$MODE" <<'PY'
from pathlib import Path
import sys

target = Path(sys.argv[1])
program_slug = sys.argv[2]
program_name = sys.argv[3]
mode = sys.argv[4]

skill = target / "SKILL.md"
text = skill.read_text()
text = text.replace("name: program-skill-name", f"name: {program_slug}")
text = text.replace("# Program Skill", f"# {program_name} Skill")
if mode == "operational":
    text += "\n\n## Operating Mode\n\nThis agent is expected to operate this program actively when tooling or files are available.\n"
else:
    text += "\n\n## Operating Mode\n\nThis agent is expected to maintain familiarity with this program and work from files, exports, and docs when direct integration is unavailable.\n"
skill.write_text(text)

overview = target / "references/overview.md"
overview_text = overview.read_text()
overview_text = overview_text.replace("## Program Name\n", f"## Program Name\n\n{program_name}\n")
overview.write_text(overview_text)

docs = target / "references/docs-links.md"
links = {
    "google-docs": {
        "official": "https://support.google.com/docs",
        "api": "https://developers.google.com/docs/api",
        "ref": "https://workspace.google.com/products/docs/",
    },
    "google-sheets": {
        "official": "https://support.google.com/docs/topic/9054603",
        "api": "https://developers.google.com/sheets/api",
        "ref": "https://workspace.google.com/products/sheets/",
    },
    "google-drive": {
        "official": "https://support.google.com/drive",
        "api": "https://developers.google.com/drive/api",
        "ref": "https://workspace.google.com/products/drive/",
    },
    "gmail": {
        "official": "https://support.google.com/mail",
        "api": "https://developers.google.com/workspace/gmail/api",
        "ref": "https://workspace.google.com/products/gmail/",
    },
}
if program_slug in links:
    entry = links[program_slug]
    docs_text = docs.read_text()
    docs_text = docs_text.replace("## Official Docs\n\n- \n", f"## Official Docs\n\n- {entry['official']}\n")
    docs_text = docs_text.replace("## API / Developer Docs\n\n- \n", f"## API / Developer Docs\n\n- {entry['api']}\n")
    docs_text = docs_text.replace("## Helpful References\n\n- \n", f"## Helpful References\n\n- {entry['ref']}\n")
    docs.write_text(docs_text)
PY

echo "Created program skill: $TARGET_DIR"
