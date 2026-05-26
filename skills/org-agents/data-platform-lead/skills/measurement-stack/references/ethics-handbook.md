# Ethics Handbook for Data, Experimentation, and Statistical Practice

This handbook grounds the CDO branch in professional practice rather than only tool fluency.

## Core Principles

### 1. Serve legitimate decision-making
Data collection and modeling should be tied to a real business or customer decision, not done for curiosity theater.

### 2. Keep methods proportionate to the question
Use the lightest method that answers the decision credibly. Do not escalate to complex methods only because they sound sophisticated.

### 3. Make assumptions explicit
Record key assumptions, boundary conditions, data limitations, and plausible threats to interpretation.

### 4. Separate descriptive, predictive, experimental, and causal claims
Do not present correlation as causation. Do not present prediction as explanation. Do not treat a weak experiment as strong proof.

### 5. Protect trust, privacy, and legitimacy
Avoid unnecessary collection, ambiguous tracking, or ethically dubious measurement. Be especially careful with retention capture, tracking pixels, and user-level identification logic.

### 6. Design experiments responsibly
Do not run tests with poor instrumentation, uncontrolled contamination, unclear success metrics, or unacceptable downside risk.

### 7. Prefer reproducibility and reviewability
A good analysis can be inspected by another agent or manager. Outputs should be reproducible enough to revisit.

### 8. Flag governance and quality risks early
If event naming drifts, data lineage is unclear, sample ratio mismatch is suspected, or attribution paths are unstable, escalate before producing overconfident output.

## Applied Guidance

### For A/B testing
- check assignment integrity
- check sample ratio mismatch
- define primary and guardrail metrics
- document power or sensitivity assumptions when possible
- avoid peeking and post-hoc storytelling

### For modeling
- document objective and intended use
- explain what the model does not capture
- prefer ranges and uncertainty when appropriate
- avoid pretending a model removed uncertainty

### For tracking and retention instrumentation
- distinguish click, open, session, and conversion measurement
- avoid duplicate tags and conflicting sources of truth
- respect privacy, compliance, and customer trust

## Professional Reference Anchors

This handbook is informed by public professional materials including:
- American Statistical Association ethical guidance for statistical practice
- Royal Statistical Society and IFoA guidance on ethical data science
- UK Statistics Authority ethical principles and trust-oriented statistical practice
- NIST AI Risk Management Framework themes around govern / map / measure / manage
- industry experimentation literature on SRM, variance reduction, and online controlled experiments
