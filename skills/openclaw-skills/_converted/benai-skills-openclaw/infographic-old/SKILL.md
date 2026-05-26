---
name: infographic-old
description: >
  Basic infographic generator. Just tell me what you want and I'll make it.
---

## OpenClaw Conversion Notes

This skill was auto-converted from a Claude/BenAI-style skill into an OpenClaw-oriented skill file.

Use this skill with care:
- Treat Claude-specific command syntax (for example `/skill ...`) as intent hints, not literal required commands.
- Treat any `allowed-tools`, MCP, plugin, browser, `.claude`, or `AskUserQuestion` references as portability notes, not guaranteed runtime features.
- Before using referenced tools, verify they actually exist in the current OpenClaw session.
- Resolve any original `.claude/...` paths against the current OpenClaw workspace before use.
- If the skill references external APIs, credentials, connectors, or helper scripts, confirm local availability first.

## Original Compatibility Warnings
- No major Claude/OpenClaw portability issues were detected in the top-level skill file, but review before use.

---

# Infographic Generator

Make infographics with AI.

## How to Use

1. Tell me what you want
2. I'll generate it
3. Tell me if you want changes

## Generate

When user gives content, create a prompt like:

```
Create an infographic about [topic] with [their content]. Make it look good. 4:5 ratio.
```

Call `generate_image` with the prompt. Show the result.

If they want edits, use `edit_image` or `continue_editing`.

Done.
