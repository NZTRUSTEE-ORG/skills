#!/usr/bin/env bash
set -euo pipefail
cd /root/.openclaw/workspace-agent-k
python3 -m tools.startup_enforcement.cli watchdog
