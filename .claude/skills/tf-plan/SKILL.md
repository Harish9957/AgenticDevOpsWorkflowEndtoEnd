---
name: tf-plan
description: Run terraform plan and analyze the output for risks. Use before applying any infrastructure changes.
allowed-tools: Bash, Read, Grep
disable-model-invocation: true
---

Run `cd terraform && AWS_PROFILE=tf-dev terraform plan -no-color` and analyze the output.
Save the terraform plan with -out, so that /tf-apply should not re-plan rather than apply this exact plan file.

Summarize:
- [ ] How many resources will be added, changed, or destroyed in a markdown table format
- [ ] Any potential issues or risks (e.g., resource replacements, security group changes, data loss)
- [ ] Estimated blast radius

If the plan fails, diagnose the error and suggest a fix.
