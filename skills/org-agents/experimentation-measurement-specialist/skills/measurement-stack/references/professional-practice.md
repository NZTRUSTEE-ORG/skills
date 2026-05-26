# Professional Practice Notes

## Experimentation

### Minimum experiment checklist
- hypothesis is explicit
- treatment/control or comparison logic is explicit
- primary metric is defined
- guardrail metrics are defined
- assignment unit is known
- instrumentation path is validated
- readout path is known before launch

### Common failure modes
- sample ratio mismatch (SRM)
- double-counting or duplicate tags
- treatment contamination
- post-hoc metric shopping
- underpowered tests presented as evidence

## Variance reduction and sensitivity
Variance reduction techniques such as CUPED can improve the sensitivity of experiments when used appropriately. They do not justify sloppiness in design or instrumentation.

## Governance
- metric definitions should be stable
- event names should be versioned or migration-noted when changed
- access to sensitive data should be intentional
- important dashboards should map to documented metric logic
