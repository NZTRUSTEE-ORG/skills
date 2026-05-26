#!/usr/bin/env bash
set -euo pipefail
SCHEDULE="${1:-*/30 * * * *}"
CMD="cd /root/.openclaw/workspace-agent-k && /root/.openclaw/workspace-agent-k/scripts/startup-watchdog.sh >/tmp/startup-watchdog.log 2>&1"
TMP=$(mktemp)
crontab -l 2>/dev/null | grep -v 'startup-watchdog.sh' > "$TMP" || true
printf "%s %s
" "$SCHEDULE" "$CMD" >> "$TMP"
crontab "$TMP"
rm -f "$TMP"
echo "Installed startup watchdog cron: $SCHEDULE"
