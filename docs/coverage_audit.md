# Coverage Audit

## Purpose

This document verifies that the planning package is closed-loop complete. It checks that every actionable requirement from the active source-of-truth and workflow files is represented in the requirement inventory, mapped in the traceability matrix, and covered by one or more backlog tickets without launch-versus-deferred contradictions.

## Audit Method

1. Review the four active source-of-truth files line by line:
   - `01-product-foundation/source_of_truth_manifest.md`
   - `01-product-foundation/yoked_prd.md`
   - `01-product-foundation/yoked_engineering_spec.md`
   - `02-ux-spec/yoked_ux_spec.md`
2. Review the workflow and planning files line by line:
   - `AGENTS.md`
   - `README.md`
   - `CONTRIBUTING.md`
   - `.github/ISSUE_TEMPLATE/feature_ticket.yml`
   - `.github/ISSUE_TEMPLATE/bug_report.yml`
   - `.github/ISSUE_TEMPLATE/epic.yml`
   - `.github/ISSUE_TEMPLATE/human_action.yml`
   - `.github/PULL_REQUEST_TEMPLATE.md`
   - `.github/labels.yml`
   - `docs/codex/setup.md`
3. Inventory atomic requirement IDs in [docs/requirements_inventory.md](/Users/Apple/Documents/New_project/docs/requirements_inventory.md).
4. Map every requirement ID to one or more tickets in [docs/requirements_traceability_matrix.md](/Users/Apple/Documents/New_project/docs/requirements_traceability_matrix.md).
5. Backreference every ticket ID in [docs/full_roadmap_backlog_pack.md](/Users/Apple/Documents/New_project/docs/full_roadmap_backlog_pack.md) to one or more requirement IDs.
6. Check for unmapped requirements, tickets with zero requirement coverage, overloaded non-epic tickets, and phase mismatches.
7. Verify that launch-critical P0 scope is fully covered and that explicit P1 and P2 scope is represented only in deferred roadmap tickets.

## Requirement Count by Source File

| Source File | Requirement Count |
|---|---:|
| `01-product-foundation/source_of_truth_manifest.md` | 1 |
| `01-product-foundation/yoked_prd.md` | 43 |
| `01-product-foundation/yoked_engineering_spec.md` | 17 |
| `02-ux-spec/yoked_ux_spec.md` | 15 |
| `AGENTS.md` | 10 |
| `README.md` | 1 |
| `CONTRIBUTING.md` | 2 |
| `.github/ISSUE_TEMPLATE/*.yml`, `.github/PULL_REQUEST_TEMPLATE.md` | 1 |
| `.github/labels.yml` | 1 |
| `docs/codex/setup.md` | 3 |
| Total | 94 |

## Requirement Count by Phase

| Phase | Requirement Count |
|---|---:|
| P0 | 70 |
| P1 | 15 |
| P2 | 9 |
| Total | 94 |

## Requirement Count by Domain

| Domain | Requirement Count |
|---|---:|
| account-settings | 1 |
| advanced-analytics | 4 |
| ai-engine | 1 |
| ai-generation | 1 |
| analytics-catalog-algorithms | 1 |
| analytics-muscle-distribution | 1 |
| analytics-progress | 1 |
| asset-authoring | 1 |
| authentication | 1 |
| backend-api | 1 |
| billing-entitlement | 1 |
| builder-composition | 1 |
| coaching | 1 |
| contribution-governance | 1 |
| creator-follow | 1 |
| creator-trust | 1 |
| data-model | 1 |
| deferred-platform-contracts | 1 |
| deferred-ux-boundary | 2 |
| ecosystem-integrations | 1 |
| exercise-catalog | 1 |
| exercise-media | 1 |
| exercise-preferences | 1 |
| exercise-search | 1 |
| forward-compatibility | 1 |
| governance-export | 1 |
| growth-loops | 1 |
| human-gated-apple-billing | 1 |
| human-gated-capabilities | 1 |
| human-gated-connectors | 1 |
| human-gated-github | 1 |
| human-gated-oauth | 1 |
| human-gated-placeholders | 1 |
| human-gated-project-automation | 1 |
| human-gated-supabase | 1 |
| issue-pr-templates | 1 |
| labels | 1 |
| launch-exclusion-validation | 1 |
| live-activity | 1 |
| local-tooling | 1 |
| marketplace-actions | 1 |
| marketplace-discovery | 1 |
| marketplace-ranking | 1 |
| monetization-runtime-config | 1 |
| navigation | 1 |
| nonfunctional-validation | 1 |
| onboarding | 1 |
| onboarding-permissions | 1 |
| persistence-schema | 1 |
| platform-expansion | 1 |
| platform-quality | 1 |
| platform-runtime | 1 |
| portability-api | 1 |
| product-scope | 1 |
| promotions | 1 |
| release-gates | 1 |
| repo-architecture | 1 |
| repo-governance | 1 |
| repo-layout | 1 |
| repo-safety | 1 |
| review-release-process | 1 |
| runtime-contracts | 1 |
| settings-overrides | 1 |
| source-governance | 1 |
| sync-engine | 1 |
| sync-offline | 1 |
| system-architecture | 1 |
| test-strategy | 1 |
| train-completion | 1 |
| train-entry | 1 |
| train-intensity | 1 |
| train-logging | 1 |
| train-pr-feedback | 1 |
| ux-auth-onboarding | 1 |
| ux-billing | 1 |
| ux-exercise-surfaces | 1 |
| ux-explore | 1 |
| ux-foundation | 1 |
| ux-home | 1 |
| ux-my-workouts | 1 |
| ux-progress-drilldowns | 1 |
| ux-release-gates | 1 |
| ux-settings-drilldowns | 1 |
| ux-shared-systems | 1 |
| ux-train | 1 |
| ux-you-overview | 1 |
| validation-process | 1 |
| voice-assistant | 1 |
| watch-architecture | 1 |
| workflow | 1 |
| Total | 94 |

## Ticket Count by Phase

| Phase | Ticket Count |
|---|---:|
| P0 | 70 |
| P1 | 14 |
| P2 | 10 |
| Total | 94 |

## Ticket Count by Kind

| Kind | Ticket Count |
|---|---:|
| `kind/epic` | 12 |
| `kind/feature` | 74 |
| `kind/human-action` | 8 |
| `kind/bug` | 0 |
| Total | 94 |

## Ticket Count by Area

| Area | Ticket Count |
|---|---:|
| `area/analytics` | 12 |
| `area/backend` | 13 |
| `area/catalog` | 8 |
| `area/health` | 5 |
| `area/ios-foundation` | 14 |
| `area/marketplace` | 7 |
| `area/release` | 11 |
| `area/repo-ops` | 9 |
| `area/train` | 15 |
| Total | 94 |

## Requirements with No Ticket Coverage

None.

Verification:

1. Requirement rows traced in [docs/requirements_traceability_matrix.md](/Users/Apple/Documents/New_project/docs/requirements_traceability_matrix.md): `94`
2. Requirement rows in [docs/requirements_inventory.md](/Users/Apple/Documents/New_project/docs/requirements_inventory.md): `94`
3. Unmapped requirement count: `0`

## Tickets with No Requirement Coverage

None.

Verification:

1. Ticket rows in [docs/requirements_traceability_matrix.md](/Users/Apple/Documents/New_project/docs/requirements_traceability_matrix.md): `94`
2. Ticket blocks in [docs/full_roadmap_backlog_pack.md](/Users/Apple/Documents/New_project/docs/full_roadmap_backlog_pack.md): `94`
3. Ticket-without-coverage count: `0`

## Overloaded Tickets

None.

Interpretation rule:

1. Epic tickets are intentionally aggregative parent issues and are not treated as overloaded single-PR tickets.
2. No non-epic ticket spans enough unrelated systems to require further split based on this audit.

## Phase Inconsistencies

None.

Checks passed:

1. Every P0 requirement maps only to P0 implementation, repo-ops, QA, or human-action tickets.
2. Every P1 requirement maps only to `priority/p1` tickets under `EPIC-010`.
3. Every P2 requirement maps only to `priority/p2` tickets under `EPIC-011`.
4. No deferred requirement is used to justify launch-critical P0 issue scope.
5. No launch ticket depends on a deferred feature being present in the shipped product.

## Launch-Critical Coverage Check

Status: Passed.

Verification statements:

1. Every line of the four active source-of-truth files was reviewed before inventory and ticket construction.
2. Every major launch category has ticket coverage:
   - product scope and five-tab shell: `TKT-P0-001`, `TKT-QA-001`
   - auth and onboarding: `TKT-P0-002`, `TKT-P0-003`
   - paywall and entitlements: `TKT-P0-004`, `TKT-P0-005`, `TKT-QA-003`
   - Train runtime: `TKT-P0-006` through `TKT-P0-011`, `TKT-QA-002`
   - My Workouts and builders: `TKT-P0-012` through `TKT-P0-015`
   - exercise catalog, search, custom authoring, and detail: `TKT-P0-016` through `TKT-P0-019`, `TKT-QA-004`
   - Explore, creator trust, and ratings: `TKT-P0-020` through `TKT-P0-024`, `TKT-QA-005`
   - Home and progress analytics: `TKT-P0-025` through `TKT-P0-029`
   - You settings, notifications, support, governance, and Apple Health: `TKT-P0-030` through `TKT-P0-034`
   - local persistence, APIs, sync, runtime config, analytics events, ads, and security: `TKT-P0-035` through `TKT-P0-041`
   - repo, CI, workflow, and human-gated launch prerequisites: `TKT-OPS-001` through `TKT-OPS-005`, `TKT-HUM-001` through `TKT-HUM-008`
   - release and QA obligations: `TKT-QA-001` through `TKT-QA-006`
3. Every launch-critical behavior listed in the PRD release gates has ticket coverage.
4. Launch exclusions remain protected by explicit negative-scope QA tickets and release checks.
5. No launch-versus-deferred contradiction remains in the backlog structure.

## Deferred-Roadmap Coverage Check

Status: Passed.

P1 coverage:

1. Promotions and offers: `TKT-P1-001`
2. Favorites: `TKT-P1-002`
3. Effort and intensity capture: `TKT-P1-003`
4. In-session PR micro-feedback: `TKT-P1-004`
5. Strength and recovery scoring: `TKT-P1-005`
6. Cross-exercise rankings and broader trend dashboards: `TKT-P1-006`
7. Achievements: `TKT-P1-007`
8. Streaks and continuity metrics: `TKT-P1-008`
9. Creator follow: `TKT-P1-009`
10. Theme, icon, and manual language override: `TKT-P1-010`
11. Live Activity: `TKT-P1-011`
12. CSV export: `TKT-P1-012`
13. Personal coach or trainer surfaces: `TKT-P1-013`

P2 coverage:

1. Referrals and free passes: `TKT-P2-001`
2. Voice assistants: `TKT-P2-002`
3. Strava: `TKT-P2-003`
4. Fitbit: `TKT-P2-004`
5. Apple Watch: `TKT-P2-005`
6. Import flows: `TKT-P2-006`
7. Public API and external integration intake: `TKT-P2-007`
8. iPad and AirPlay or TV casting: `TKT-P2-008`
9. Exercise visuals and media packs: `TKT-P2-009`

Deferred-boundary verification:

1. Every explicit deferred capability represented in the active files has a roadmap ticket.
2. Deferred tickets are labeled `priority/p1` or `priority/p2` only.
3. Deferred tickets do not alter the launch-critical path or launch acceptance criteria.
4. Deferred UX boundaries are enforced by `UX-013`, `UX-014`, and the QA release suite.

## Final Audit Verdict

Ready for direct GitHub issue creation.

Supporting verdict statements:

1. The package reviewed every line of the four active source-of-truth files before planning outputs were finalized.
2. Every meaningful requirement in the inventory maps to one or more tickets.
3. Every ticket in the backlog pack maps back to one or more requirement IDs.
4. The traceability matrix is complete.
5. The backlog pack is concrete enough for direct GitHub issue creation.
6. Unmapped requirement count: `0`
7. Ticket-without-coverage count: `0`
8. Non-epic overloaded ticket count: `0`
9. Phase inconsistency count: `0`
10. Execution blockers to issue creation: none. Human-action tickets remain necessary for later environment, console, and release execution, but they do not block issue creation itself.
