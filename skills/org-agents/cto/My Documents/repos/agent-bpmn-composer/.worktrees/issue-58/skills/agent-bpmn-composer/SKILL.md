---
name: agent-bpmn-composer
description: Use this skill when an agent needs to generate BPMN 2.0 XML, validate BPMN, render previews, transform BPMN, or repair common structural issues through the agent-bpmn-composer API.
---

# Agent BPMN Composer Skill

## Use when
- an agent needs BPMN 2.0 XML from constrained JSON
- an agent needs a validation envelope for BPMN XML
- an agent needs SVG/PNG preview artifacts
- an agent needs structured append/rename transforms
- an agent needs repair of malformed BPMN structure before retrying

## Where the exact API examples live
- Canonical call list: `docs/api-calls.md`
- Example input payload: `examples/expense-approval.json`

## First-try startup

From the repository root:

```bash
npm install
npm run dev
curl -s http://localhost:3000/health
```

If you want the built runtime instead of watch mode:

```bash
npm run build
npm start
```

## Base URL
- default local base URL: `http://localhost:3000`

## Endpoints
- `GET /health`
- `POST /v1/processes/create`
- `POST /v1/processes/validate`
- `POST /v1/processes/render`
- `POST /v1/processes/transform`
- `POST /v1/processes/repair`

## Exact navigation path for agents

When the agent is imagining a process and wants BPMN on the first try, do this in order:

1. Start the service.
2. Confirm `GET /health` returns `ok: true`.
3. Convert the imagined workflow into the constrained `processSpec` JSON shape.
4. Call `POST /v1/processes/create` first.
5. Read `validation.errors`, `validation.warnings`, and top-level `warnings`.
6. If the process needs edits, call `POST /v1/processes/transform` with either:
   - `source.processSpec`, or
   - `source.bpmnXml`
7. If upstream BPMN XML is malformed, call `POST /v1/processes/repair`.
8. If you need fresh preview artifacts from XML, call `POST /v1/processes/render` with `format: "svg"`, `"png"`, or `"both"`.

## Request shape to memorize

`POST /v1/processes/create` accepts:

```json
{
  "inputFormat": "structured-json",
  "processSpec": {
    "name": "Expense approval",
    "nodes": [
      { "id": "Start_1", "type": "startEvent", "name": "Start" },
      { "id": "Task_1", "type": "userTask", "name": "Submit request" },
      { "id": "Gateway_1", "type": "exclusiveGateway", "name": "Approved?" },
      { "id": "Task_2", "type": "serviceTask", "name": "Notify finance" },
      { "id": "End_1", "type": "endEvent", "name": "Done" }
    ],
    "flows": [
      { "source": "Start_1", "target": "Task_1" },
      { "source": "Task_1", "target": "Gateway_1" },
      { "source": "Gateway_1", "target": "Task_2", "name": "yes" },
      { "source": "Task_2", "target": "End_1" }
    ]
  },
  "options": {
    "renderSvg": true,
    "renderPng": true,
    "validate": true
  }
}
```

## Operational notes
- Rendering now attempts a true headless `bpmn-js` browser path first.
- If Chromium runtime libraries are missing on the host, the service falls back automatically and emits a warning instead of failing hard.
- Built-package importability is gated by `npm run check:imports`.
- Generated XML includes BPMN DI for stronger downstream modeler compatibility.

## Minimal example

```bash
curl -s http://localhost:3000/v1/processes/create   -H 'content-type: application/json'   --data @examples/expense-approval.json
```
