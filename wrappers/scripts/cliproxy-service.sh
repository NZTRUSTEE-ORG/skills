#!/usr/bin/env bash
set -euo pipefail
BASE=/root/services/cliproxyapi
mkdir -p "$BASE/logs"
exec "$BASE/CLIProxyAPI" -config "$BASE/config.yaml"
