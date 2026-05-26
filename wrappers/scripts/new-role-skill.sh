#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 3 ]]; then
  echo "Usage: $0 <agent-dir> <skill-slug> <job-title> [department]" >&2
  exit 1
fi

ROOT="/root/.openclaw/workspace-agent-k"
TEMPLATE_DIR="$ROOT/templates/role-skill"
AGENT_DIR_INPUT="$1"
SKILL_SLUG="$2"
JOB_TITLE="$3"
DEPARTMENT="${4:-}"

if [[ "$AGENT_DIR_INPUT" = /* ]]; then
  AGENT_DIR="$AGENT_DIR_INPUT"
else
  AGENT_DIR="$ROOT/agents/$AGENT_DIR_INPUT"
fi

TARGET_DIR="$AGENT_DIR/skills/$SKILL_SLUG"

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

python3 - "$TARGET_DIR" "$SKILL_SLUG" "$JOB_TITLE" "$DEPARTMENT" <<'PY'
from pathlib import Path
import sys

target = Path(sys.argv[1])
skill_slug = sys.argv[2]
job_title = sys.argv[3]
department = sys.argv[4]

skill = target / "SKILL.md"
text = skill.read_text()
text = text.replace("name: role-skill-name", f"name: {skill_slug}")
text = text.replace("# Role Skill", f"# {job_title} Skill")
skill.write_text(text)

role = target / "references/role.md"
role_text = role.read_text()
role_text = role_text.replace("## Title\n", f"## Title\n\n{job_title}\n")
if department:
    role_text = role_text.replace("## Department\n", f"## Department\n\n{department}\n")
role.write_text(role_text)
PY

echo "Created role skill: $TARGET_DIR"
