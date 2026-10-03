# [PROJECTNAME] Brownfield Architecture Analysis

## Purpose

Analyze the existing [PROJECTNAME] implementation and document its current architecture for developer handover. Produce concise English Markdown documentation following arc42 in `Docs/architecture`.

This specification defines a documentation task, not an application change or a target architecture design.

## Analysis Baseline

- Analyze the current checkout. Record the Git commit and any local deviations relevant to the analysis.
- Configuration distinguishes DEV, UAT, and PAV. For this documentation, only PAV is in scope; PAV denotes the production system as specified by the user.
- Analyze PAV-specific configuration and shared configuration applicable to PAV. Exclude DEV- and UAT-specific settings from the documented environment.
- Do not assume that the checkout or its PAV configuration matches the currently deployed production version.
- Git history may explain technical findings but must not replace evidence from the current checkout. Clearly distinguish historical findings from current behavior.

## Scope

Include the [PROJECTNAME] service and client under `src/[PROJECTNAME]`, their shared libraries, relevant tools, existing tests, database artifacts, configuration, and deployment scripts.

Trace implemented interfaces to external systems, including file imports, the database and [TBD], where technical evidence exists. Describe external systems only to the extent supported by the [PROJECTNAME] implementation and its versioned technical artifacts.

Exclude generated build artifacts, downloaded packages, IDE state, agent configuration, and unrelated repository content. Do not design future features or plan the SCF implementation. Apply the same evidence rules to any SCF code found in the checkout; the SCF specification alone does not establish implemented behavior.

## Evidence Rules

- Architecture statements require evidence from source code, project files, versioned configuration, SQL artifacts, or executable scripts.
- Reference essential statements with repository-relative paths and symbol names or line references sufficient to locate the evidence.
- Prose documentation, business specifications, and user or former-developer statements are search aids only. They do not independently establish architecture facts. The user-defined PAV production designation is a scope definition, not proof of live deployment details.
- Distinguish implemented behavior from configuration values and defaults. Configuration in the repository does not prove the configuration of a deployed environment.
- Report conflicting technical evidence explicitly rather than silently choosing an interpretation.
- Mark unsupported information as `Unknown`. Prefer a short statement of the knowledge gap over invented content or an unexplained empty chapter.
- Do not invent requirements, deployment facts, quality targets, decision rationales, or historical ADRs.
- In the architecture decisions chapter, describe technically evidenced choices and mark unavailable rationale as unknown.
- Document quality requirements or technical risks only where technical evidence supports the statement. Do not infer stakeholder requirements from implementation details.
- Do not reproduce secrets, credentials, connection-string secrets, or other sensitive configuration values.

## Analysis Method

Perform static analysis only: read code, configuration, technical artifacts, existing tests, and relevant history. Reading tests may establish what they assert, but does not prove that they pass.

Do not execute the application or tests, connect to SQL Server, network shares, MQ, or Sage/Infoniqa, or modify external systems. Describe runtime sequences from code rather than claiming observed execution. Describe deployment only as supported by versioned technical artifacts, not as a verified live environment.

## Required Deliverables

Create the following chapters in `Docs/architecture`:

1. `01_introduction_and_goals.md`
2. `02_architecture_constraints.md`
3. `03_context_and_scope.md`
4. `04_solution_strategy.md`
5. `05_building_block_view.md`
6. `06_runtime_view.md`
7. `07_deployment_view.md`
8. `08_concepts.md`
9. `09_architecture_decisions.md`
10. `10_quality_requirements.md`
11. `11_technical_risks.md`
12. `12_glossary.md`

Use short, factual English sentences describing the current implementation. Avoid modal wording that introduces unsupported obligations or future behavior.

Prefer PlantUML for diagrams. Mermaid is permitted where it offers a justified advantage. Include diagrams only when their elements and relationships are technically evidenced; diagram content must agree with the accompanying text and references.

## Search Aids Requiring Technical Verification

The following inherited pointers guide exploration; none is an established architecture fact without technical verification:

- Application locations: [TBD].
- [TBD]

## Acceptance Criteria

- All twelve named Markdown chapters exist in `Docs/architecture` and are written in concise English.
- The documentation identifies its purpose, analysis commit, relevant local deviations, included system boundary, and exclusions.
- Environment-specific documentation covers only PAV (production), including shared settings applicable to PAV. DEV and UAT settings are excluded, and repository configuration is not presented as verified live production configuration.
- Essential architecture statements have locatable technical source references. Prose documents and inherited search aids are not used as independent proof.
- Current behavior, historical findings, configuration, and unknown deployed conditions are not conflated.
- Missing information and conflicting evidence are explicitly identified. Chapters without sufficient evidence contain a short `Unknown` statement rather than invented content.
- The documentation contains no invented requirements, decision rationales, historical ADRs, or SCF target architecture or implementation plan.
- Included diagrams use PlantUML preferentially, agree with the text, and contain only evidenced elements and relationships. Any Mermaid choice is briefly justified.
- No secrets or sensitive configuration values are reproduced.
- The analysis remains static and does not execute the application or tests, access external systems, or change application behavior.

Validate chapter presence, scope, language, source traceability, knowledge-gap labeling, diagram consistency, and absence of sensitive values through static review. These checks assess documentation quality; they do not establish that the application builds, tests pass, or production behaves as described.
