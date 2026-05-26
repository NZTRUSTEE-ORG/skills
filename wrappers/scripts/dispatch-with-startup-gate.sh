#!/usr/bin/env bash
set -euo pipefail
if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <agent-slug> <task...>" >&2
  exit 1
fi
AGENT="$1"
shift
TASK="$*"
cd /root/.openclaw/workspace-agent-k
python3 -m tools.startup_enforcement.cli dispatch-wrap --agent "$AGENT" --task "$TASK"
