#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 3 ]]; then
  echo "Usage: $0 <agent-slug> <agent-name> <job-title> [reports-to]" >&2
  exit 1
fi

ROOT="/root/.openclaw/workspace-agent-k"
TEMPLATE_DIR="$ROOT/templates/base-agent"
AGENTS_DIR="$ROOT/agents"
SLUG="$1"
AGENT_NAME="$2"
JOB_TITLE="$3"
REPORTS_TO="${4:-Dillon Brady}"
TARGET_DIR="$AGENTS_DIR/$SLUG"

if [[ -e "$TARGET_DIR" ]]; then
  echo "Target already exists: $TARGET_DIR" >&2
  exit 1
fi

mkdir -p "$AGENTS_DIR"
mkdir -p "$TARGET_DIR"
rsync -a "$TEMPLATE_DIR/" "$TARGET_DIR/"

python3 - "$TARGET_DIR" "$SLUG" "$AGENT_NAME" "$JOB_TITLE" "$REPORTS_TO" <<'PY'
from pathlib import Path
import sys

target = Path(sys.argv[1])
slug = sys.argv[2]
agent_name = sys.argv[3]
job_title = sys.argv[4]
reports_to = sys.argv[5]

replacements = {
    "- **Name:**\n": f"- **Name:** {agent_name}\n",
    "- **Job Title:**\n": f"- **Job Title:** {job_title}\n",
    "- **Agent Name:**\n": f"- **Agent Name:** {agent_name}\n",
    "- **Reports To:**\n": f"- **Reports To:** {reports_to}\n",
}

for path in target.rglob("*.md"):
    text = path.read_text()
    for old, new in replacements.items():
        text = text.replace(old, new)
    path.write_text(text)

org = target / "ORG.md"
org_text = org.read_text()
org_text = org_text.replace("- **Department:**\n", f"- **Department:** {slug}\n")
org.write_text(org_text)

mission = target / "MISSION.md"
mission_text = mission.read_text()
mission_text = mission_text.replace("Define why this agent exists.", f"Define why {agent_name} exists in the organization.")
mission.write_text(mission_text)
PY

echo "Created agent workspace: $TARGET_DIR"
echo "Next: review IDENTITY.md, ORG.md, MISSION.md, and SOUL.md before activation."
