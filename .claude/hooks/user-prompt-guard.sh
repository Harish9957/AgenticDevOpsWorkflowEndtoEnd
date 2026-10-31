#!/bin/bash
# SAY hook — catches destructive intent in user prompts

INPUT=$(cat)
PROMPT=$(echo "$INPUT" | jq -r '.prompt // empty')

if echo "$PROMPT" | grep -iqE "delete all|destroy all|destroy everything|remove all resources|wipe|nuke|drop all"; then
  echo "UserPromptSubmit operation blocked by hook: Destructive intent detected. Please use /tf-destroy for controlled infrastructure teardown." >&2
  exit 2
fi
