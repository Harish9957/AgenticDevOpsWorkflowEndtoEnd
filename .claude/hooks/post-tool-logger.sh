#!/bin/bash
# LOG hook — records every terraform plan to the deploy log

INPUT=$(cat)
CMD=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

PROJECT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"

if echo "$CMD" | grep -qE "terraform (plan|apply)"; then
  ACTION=$(echo "$CMD" | grep -oE "terraform (plan|apply)" | head -n1)
  echo "[$(date -u +%Y-%m-%dT%H:%M:%SZ)] $ACTION executed" >> "$PROJECT_DIR/.claude/deploy.log"
fi
