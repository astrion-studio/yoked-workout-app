# Full Roadmap Backlog Pack

## Purpose

This document is the direct issue-creation pack for the complete Yoked roadmap. It translates the atomic requirement inventory into epics, implementation tickets, repo-ops tickets, QA and release tickets, and human-action tickets with enough scope control to open GitHub issues without additional planning passes.

## Source-of-Truth Basis

Authoritative launch and deferred roadmap inputs:

1. `01-product-foundation/source_of_truth_manifest.md`
2. `01-product-foundation/yoked_prd.md`
3. `01-product-foundation/yoked_engineering_spec.md`
4. `02-ux-spec/yoked_ux_spec.md`

Workflow, repo, and release inputs:

1. `AGENTS.md`
2. `README.md`
3. `CONTRIBUTING.md`
4. `.github/ISSUE_TEMPLATE/feature_ticket.yml`
5. `.github/ISSUE_TEMPLATE/bug_report.yml`
6. `.github/ISSUE_TEMPLATE/epic.yml`
7. `.github/ISSUE_TEMPLATE/human_action.yml`
8. `.github/PULL_REQUEST_TEMPLATE.md`
9. `.github/labels.yml`
10. `docs/codex/setup.md`

## Backlog Construction Rules

1. Every ticket has exactly one `kind/*` label and exactly one `priority/*` label.
2. Every ticket has one primary `area/*` label from the approved taxonomy.
3. Every non-epic ticket is scoped for a reviewable implementation PR or a single human-controlled console task.
4. Every ticket lists covered requirement IDs from [docs/requirements_inventory.md](/Users/Apple/Documents/New_project/docs/requirements_inventory.md).
5. P1 and P2 tickets exist for explicit deferred roadmap scope, but they must not broaden the P0 launch scope.
6. Repo, QA, and human-action tickets are first-class roadmap work because the source files impose workflow, validation, and console obligations.
7. Epics are parent issues. They intentionally aggregate child ticket coverage and are not treated as single-PR units.
8. Acceptance criteria are phrased so they can be pasted directly into GitHub issue bodies with minimal editing.

## Label Taxonomy

- Kind labels: `kind/epic`, `kind/feature`, `kind/human-action`, `kind/bug`
- Priority labels: `priority/p0`, `priority/p1`, `priority/p2`
- Area labels: `area/repo-ops`, `area/ios-foundation`, `area/train`, `area/backend`, `area/catalog`, `area/marketplace`, `area/analytics`, `area/health`, `area/release`

## Epic Inventory

### EPIC-001 Shell, Identity, and Onboarding
- Ticket ID: `EPIC-001`
- Title: `Shell, Identity, and Onboarding`
- Kind: `kind/epic`
- Priority: `priority/p0`
- Area: `area/ios-foundation`
- Phase: `P0`
- Epic: `self`
- Covered Requirement IDs: `PRD-001`, `PRD-003`, `PRD-004`, `PRD-005`, `PRD-006`, `PRD-007`, `UX-001`, `UX-002`, `UX-003`
- Objective: Deliver the launch shell, auth entry, onboarding funnel, and paywall gate without violating tab ownership or post-onboarding monetization rules.
- In Scope: App startup routing; auth providers; onboarding steps; pre-permission education; starter-plan finalization; paywall presentation; entitlement-aware root navigation.
- Out of Scope: Train logging internals; builder flows; Explore ranking; deferred promotions or referrals.
- Dependencies: `TKT-OPS-001`, `TKT-OPS-002`, `TKT-HUM-004`
- Source-of-Truth References: `source_of_truth_manifest.md`, `yoked_prd.md §10-§11.2`, `yoked_ux_spec.md §2-§9`
- Acceptance Criteria: Child tickets collectively implement the exact five-tab launch shell, all auth paths, the deterministic onboarding contract, and launch paywall behavior with no launch-deferred leakage.
- Test Evidence Required: Root-flow UI coverage; auth integration tests; onboarding completion tests; paywall state tests.
- Human Actions Required: Auth-provider console setup and StoreKit product setup.
- Notes: Home remains informational-only and Train remains the exclusive workout-execution owner.

### EPIC-002 Train Runtime and Session Integrity
- Ticket ID: `EPIC-002`
- Title: `Train Runtime and Session Integrity`
- Kind: `kind/epic`
- Priority: `priority/p0`
- Area: `area/train`
- Phase: `P0`
- Epic: `self`
- Covered Requirement IDs: `PRD-013`, `PRD-014`, `PRD-015`, `UX-005`, `UX-012`
- Objective: Ship the live session runtime with local-first safety, exact load-entry behavior, timing, summary, and completion integrity.
- In Scope: Train entry; resume handling; set logging; load helper; timers; warm-up handling; PR derivation; finish and discard rules; completion ledger.
- Out of Scope: P1 intensity capture; Live Activity; Apple Watch; social celebration.
- Dependencies: `TKT-OPS-001`, `TKT-P0-035`, `TKT-P0-037`
- Source-of-Truth References: `yoked_prd.md §11.5, §15, §27`, `yoked_engineering_spec.md §1.6, §4, §6`, `yoked_ux_spec.md §11, §20-§25`
- Acceptance Criteria: Child tickets collectively deliver a recoverable, offline-safe Train flow with correct load-entry modes, timer behavior, and summary outputs.
- Test Evidence Required: Train UI tests; local restore integration tests; offline completion tests; performance checks for rapid logging.
- Human Actions Required: None beyond normal release approvals.
- Notes: No in-session paywall and no Home-owned execution affordances are allowed.

### EPIC-003 Asset Library, Builders, and AI Generation
- Ticket ID: `EPIC-003`
- Title: `Asset Library, Builders, and AI Generation`
- Kind: `kind/epic`
- Priority: `priority/p0`
- Area: `area/catalog`
- Phase: `P0`
- Epic: `self`
- Covered Requirement IDs: `PRD-008`, `PRD-009`, `PRD-012`, `ENG-010`, `UX-006`
- Objective: Deliver My Workouts ownership, builder flows, publish management, and premium AI asset generation.
- In Scope: My Workouts root; slot usage; workout, routine, and program details; builder composition; publish management; AI generation service and UI handoff.
- Out of Scope: Explore consumer workout-template discovery; P1 favorites; P1 coach surfaces.
- Dependencies: `TKT-OPS-001`, `TKT-P0-035`, `TKT-P0-038`
- Source-of-Truth References: `yoked_prd.md §11.3, §12.6, §12.7, §14.6`, `yoked_engineering_spec.md §7`, `yoked_ux_spec.md §12, §19`
- Acceptance Criteria: Child tickets collectively support owned-asset management, builder editing, publish controls, and AI-generated asset creation as saved executable assets.
- Test Evidence Required: Builder UI tests; persistence tests; AI validation tests; entitlement gate tests.
- Human Actions Required: None.
- Notes: The onboarding-generated starter plan is separate from premium post-onboarding AI generation.

### EPIC-004 Exercise Catalog and Knowledge
- Ticket ID: `EPIC-004`
- Title: `Exercise Catalog and Knowledge`
- Kind: `kind/epic`
- Priority: `priority/p0`
- Area: `area/catalog`
- Phase: `P0`
- Epic: `self`
- Covered Requirement IDs: `PRD-010`, `PRD-011`, `ENG-006`, `UX-011`
- Objective: Build the internal text-first exercise knowledge system, search, custom authoring, and exact-variation exercise detail analytics.
- In Scope: Catalog ingest; local runtime bundle; fuzzy search; similar exercises; exclude-only preferences; custom exercises; exercise detail projections.
- Out of Scope: Launch media assets; favorites; third-party dataset branding; external catalog imports.
- Dependencies: `TKT-OPS-005`, `TKT-P0-035`
- Source-of-Truth References: `yoked_prd.md §11.4.1, §11.4`, `yoked_engineering_spec.md §3.3-§3.7`, `yoked_ux_spec.md §15-§16`
- Acceptance Criteria: Child tickets collectively deliver a deterministic, no-media launch catalog with fast local search and complete exercise detail screens.
- Test Evidence Required: Catalog pipeline validation; search ranking tests; custom exercise persistence tests; exercise detail UI state tests.
- Human Actions Required: None.
- Notes: Media URLs remain null at launch and custom exercises remain private.

### EPIC-005 Explore Marketplace, Creator, and Rating Trust
- Ticket ID: `EPIC-005`
- Title: `Explore Marketplace, Creator, and Rating Trust`
- Kind: `kind/epic`
- Priority: `priority/p0`
- Area: `area/marketplace`
- Phase: `P0`
- Epic: `self`
- Covered Requirement IDs: `PRD-018`, `PRD-019`, `PRD-020`, `ENG-011`, `UX-007`
- Objective: Deliver marketplace discovery, asset detail actions, creator profile detail, rating trust, and launch-safe ranking.
- In Scope: Explore root; lanes and ranked feed; asset detail CTAs; creator profile detail; completion-gated ratings; credibility tiers; moderation projections.
- Out of Scope: Follow; comments; social feed; workout-template consumer discovery.
- Dependencies: `TKT-P0-036`, `TKT-P0-037`
- Source-of-Truth References: `yoked_prd.md §11.7, §12, §13`, `yoked_engineering_spec.md §8`, `yoked_ux_spec.md §13, §17, §18`
- Acceptance Criteria: Child tickets collectively deliver trusted marketplace discovery with correct CTA order, rating gates, and creator-safety controls.
- Test Evidence Required: Explore UI tests; marketplace detail tests; ranking algorithm tests; moderation suppression tests.
- Human Actions Required: None.
- Notes: Ratings are numeric-only at launch and follow remains deferred.

### EPIC-006 Home, Progress, and Reporting Analytics
- Ticket ID: `EPIC-006`
- Title: `Home, Progress, and Reporting Analytics`
- Kind: `kind/epic`
- Priority: `priority/p0`
- Area: `area/analytics`
- Phase: `P0`
- Epic: `self`
- Covered Requirement IDs: `PRD-016`, `PRD-017`, `UX-004`, `UX-008`, `UX-009`
- Objective: Deliver the informational Home surface and the launch analytics stack for KPIs, muscle distribution, history, reports, and body metrics.
- In Scope: Home modules; KPI materialization; You Progress overview; muscle distribution; history calendar; date-range reports; measurements; goals and targets.
- Out of Scope: Strength score; rankings; achievements; streaks; coach/trainer modules.
- Dependencies: `TKT-P0-035`, `TKT-P0-039`
- Source-of-Truth References: `yoked_prd.md §11.6, §16`, `yoked_engineering_spec.md §3.3`, `yoked_ux_spec.md §10, §14`
- Acceptance Criteria: Child tickets collectively provide the launch analytics surfaces and data projections without leaking deferred advanced analytics.
- Test Evidence Required: KPI projection tests; analytics UI tests; report generation tests; data-range correctness tests.
- Human Actions Required: None.
- Notes: Home is informational and may navigate into Train but cannot initiate execution directly.

### EPIC-007 Integrations, Notifications, Support, and Governance
- Ticket ID: `EPIC-007`
- Title: `Integrations, Notifications, Support, and Governance`
- Kind: `kind/epic`
- Priority: `priority/p0`
- Area: `area/backend`
- Phase: `P0`
- Epic: `self`
- Covered Requirement IDs: `PRD-021`, `UX-010`, `AGT-007`, `AGT-009`
- Objective: Ship the You settings subtree for notifications, Apple Health, support, account governance, and related human-controlled integrations.
- In Scope: Profile and creator settings; notification preferences; reminder delivery; Apple Health status; support flows; erase and transfer guidance; account actions.
- Out of Scope: Strava; Fitbit; Watch; export jobs; import jobs; theme/icon/language overrides.
- Dependencies: `TKT-P0-036`, `TKT-P0-037`, `TKT-HUM-004`, `TKT-HUM-005`, `TKT-HUM-006`
- Source-of-Truth References: `yoked_prd.md §11.8, §11.9, §18-§20`, `yoked_engineering_spec.md §5.9-§5.11, §9, §10.1`, `yoked_ux_spec.md §14`
- Acceptance Criteria: Child tickets collectively deliver launch-safe notification, integration, support, and governance surfaces with correct unavailable-status treatment for deferred providers.
- Test Evidence Required: Settings UI tests; notification delivery tests; HealthKit integration tests; support submission tests.
- Human Actions Required: OAuth, APNs, HealthKit, and AdMob console setup.
- Notes: Apple Health is the only launch integration provider surfaced to users.

### EPIC-008 Backend Platform, Sync, and Runtime Configuration
- Ticket ID: `EPIC-008`
- Title: `Backend Platform, Sync, and Runtime Configuration`
- Kind: `kind/epic`
- Priority: `priority/p0`
- Area: `area/backend`
- Phase: `P0`
- Epic: `self`
- Covered Requirement IDs: `PRD-002`, `PRD-022`, `ENG-001`, `ENG-002`, `ENG-003`, `ENG-005`, `ENG-007`, `ENG-008`, `ENG-009`, `AGT-008`
- Objective: Establish the local schema, APIs, sync engine, runtime configuration, entitlement mirror, and operational backend contracts that all product surfaces depend on.
- In Scope: SQLite schema; DTOs; repositories; REST endpoints; mutation queue; background sync; runtime config; entitlement mirror; moderation cache; analytics queue support.
- Out of Scope: Deferred public API; import jobs; Apple Watch session continuity; non-launch provider integrations.
- Dependencies: `TKT-OPS-001`, `TKT-OPS-004`, `TKT-HUM-003`
- Source-of-Truth References: `yoked_prd.md §9, §21-§24, §28`, `yoked_engineering_spec.md §1-§6`, `AGENTS.md Human-Gated Tasks`
- Acceptance Criteria: Child tickets collectively deliver the local-first persistence and sync backbone with documented API coverage and launch-safe runtime config behavior.
- Test Evidence Required: Repository tests; sync integration tests; API contract tests; runtime-config fallback tests.
- Human Actions Required: Supabase staging project provisioning and secret distribution.
- Notes: Runtime config must fail to last-known-good data and may not block core local execution.

### EPIC-009 Repo, CI, and Delivery Operations
- Ticket ID: `EPIC-009`
- Title: `Repo, CI, and Delivery Operations`
- Kind: `kind/epic`
- Priority: `priority/p0`
- Area: `area/repo-ops`
- Phase: `P0`
- Epic: `self`
- Covered Requirement IDs: `MAN-001`, `AGT-001`, `AGT-002`, `AGT-003`, `RDM-001`, `CON-001`, `TPL-001`, `LBL-001`, `CDX-001`, `AGT-005`, `AGT-010`, `CDX-002`, `CDX-003`
- Objective: Make the repository execution-ready while preserving issue-first workflow, label taxonomy, source-of-truth discipline, and human-gated console boundaries.
- In Scope: Repo scaffold; template alignment; CI checks; config examples; catalog tooling docs; GitHub project automation guidance; placeholder resolution tasks.
- Out of Scope: Product feature implementation; hidden local-machine config; destructive repo restructuring.
- Dependencies: None.
- Source-of-Truth References: `AGENTS.md`, `README.md`, `CONTRIBUTING.md`, `.github/*`, `docs/codex/setup.md`
- Acceptance Criteria: Child tickets collectively establish the expected repo workflow, issue structure, CI enforcement, and human-console task set before large-scale implementation begins.
- Test Evidence Required: Workflow syntax validation; docs reference validation; sample issue-body compatibility checks.
- Human Actions Required: GitHub UI configuration and placeholder resolution.
- Notes: This epic gates disciplined execution of every other epic.

### EPIC-010 P1 Deferred Differentiators
- Ticket ID: `EPIC-010`
- Title: `P1 Deferred Differentiators`
- Kind: `kind/epic`
- Priority: `priority/p1`
- Area: `area/ios-foundation`
- Phase: `P1`
- Epic: `self`
- Covered Requirement IDs: `PRD-023`, `PRD-024`, `PRD-025`, `PRD-026`, `PRD-027`, `PRD-028`, `PRD-029`, `PRD-030`, `PRD-031`, `PRD-032`, `PRD-033`, `PRD-034`, `PRD-035`, `ENG-013`, `UX-013`
- Objective: Group the explicit P1 roadmap features that extend Yoked after launch without back-editing the P0 launch boundary.
- In Scope: Promotions; favorites; Train intensity and PR feedback; advanced analytics; creator follow; appearance overrides; Live Activity; export; coach surfaces.
- Out of Scope: P0 launch surface changes; P2 platform expansion; social feeds or comments.
- Dependencies: Completion of all P0 epics and release hardening.
- Source-of-Truth References: `yoked_prd.md §25.2`, `yoked_engineering_spec.md deferred compatibility references`, `yoked_ux_spec.md §26`
- Acceptance Criteria: Child tickets collectively cover every explicit P1 capability and keep launch scopes unchanged until the P1 work is intentionally scheduled.
- Test Evidence Required: Per-feature tests added when P1 implementation begins.
- Human Actions Required: Live Activity capability approval and any export-policy review.
- Notes: This epic exists now for traceability even though implementation is deferred.

### EPIC-011 P2 Ecosystem and Platform Expansion
- Ticket ID: `EPIC-011`
- Title: `P2 Ecosystem and Platform Expansion`
- Kind: `kind/epic`
- Priority: `priority/p2`
- Area: `area/ios-foundation`
- Phase: `P2`
- Epic: `self`
- Covered Requirement IDs: `PRD-036`, `PRD-037`, `PRD-038`, `PRD-039`, `PRD-040`, `PRD-041`, `ENG-014`, `ENG-015`, `UX-014`
- Objective: Group the explicit P2 growth, integration, portability, and platform-expansion work streams without implying earlier delivery.
- In Scope: Referrals; voice assistant integrations; Strava; Fitbit; Apple Watch; import flows; public API; iPad/AirPlay; exercise visuals and media packs.
- Out of Scope: P0 or P1 commitments; launch Apple Health behavior; launch navigation changes.
- Dependencies: Stable P0 product, stable P1 deferred differentiator foundation where applicable, and separate technical design passes for watch and platform expansion.
- Source-of-Truth References: `yoked_prd.md §25.3`, `yoked_engineering_spec.md §10.2 and P2-only contracts`, `yoked_ux_spec.md §2, §26`
- Acceptance Criteria: Child tickets collectively cover every explicit P2 capability while preserving the iPhone-only, text-first, Apple-Health-only launch boundary.
- Test Evidence Required: Per-feature tests added when P2 implementation begins.
- Human Actions Required: Provider-partner approvals, wearable provisioning, and platform-release decisions.
- Notes: No P2 ticket is allowed to reserve dormant launch UI or modify launch acceptance gates.

### EPIC-012 QA, Security, Performance, and Release Readiness
- Ticket ID: `EPIC-012`
- Title: `QA, Security, Performance, and Release Readiness`
- Kind: `kind/epic`
- Priority: `priority/p0`
- Area: `area/release`
- Phase: `P0`
- Epic: `self`
- Covered Requirement IDs: `PRD-042`, `PRD-043`, `ENG-012`, `ENG-016`, `ENG-017`, `UX-015`, `AGT-004`, `CON-002`
- Objective: Convert release gates, deferred-scope exclusions, validation rules, and nonfunctional targets into a concrete launch-readiness program.
- In Scope: UX acceptance; route ownership; offline recovery; monetization and ad boundaries; marketplace/ranking validation; security; performance; analytics integrity; reviewer checklist.
- Out of Scope: Feature implementation; P1 and P2 delivery; console provisioning tasks except release-console preparation.
- Dependencies: All P0 implementation epics plus human release-console tickets.
- Source-of-Truth References: `yoked_prd.md §26-§28`, `yoked_engineering_spec.md §11-§13`, `yoked_ux_spec.md §25-§26`, `AGENTS.md`, `CONTRIBUTING.md`
- Acceptance Criteria: Child tickets collectively prove launch-critical behavior, prove deferred-scope absence, and document the exact release evidence required for PR approval and GA readiness.
- Test Evidence Required: Consolidated QA evidence across UI, integration, performance, analytics, and security checks.
- Human Actions Required: App Store release-console setup and policy confirmations.
- Notes: This epic is the final gate before direct launch execution.

## P0 Ticket Inventory

### TKT-P0-001 App Shell, Five-Tab Routing, Root Flow Ownership, and Deep-Link Handoff
- Ticket ID: `TKT-P0-001`
- Title: `App Shell, Five-Tab Routing, Root Flow Ownership, and Deep-Link Handoff`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/ios-foundation`
- Phase: `P0`
- Epic: `EPIC-001`
- Covered Requirement IDs: `PRD-001`, `PRD-003`, `ENG-001`, `UX-001`
- Objective: Build the root coordinator that decides between auth, onboarding, paywall handoff, and the five-tab shell while preserving exact route ownership.
- In Scope: Splash and bootstrap routing; fixed tab order; root navigation coordinator; full-screen cover ownership; deep-link dispatch to owning root; Home non-execution guarantee; iPhone-only target assumptions.
- Out of Scope: Auth credential flows; onboarding form state; purchase processing; Train logging internals.
- Dependencies: `TKT-OPS-001`, `TKT-OPS-002`
- Source-of-Truth References: `source_of_truth_manifest.md`, `yoked_prd.md §10, §25.1, §26`, `yoked_engineering_spec.md §1.1-§1.4`, `yoked_ux_spec.md §2-§6`
- Acceptance Criteria: Cold start routes correctly for signed-out, onboarding-incomplete, onboarding-complete, and entitled users; five tabs render in the order `Home`, `Train`, `My Workouts`, `Explore`, `You`; Home never exposes a direct start button; deep links land on owning surfaces without duplicate stacks.
- Test Evidence Required: Root-flow UI tests; deep-link integration tests; cold-start offline tests; tab-order screenshot evidence.
- Human Actions Required: None.
- Notes: This ticket establishes the navigation contract used by every downstream feature ticket.

### TKT-P0-002 Authentication Providers, Email Auth, Session Restore, and Recovery Entry
- Ticket ID: `TKT-P0-002`
- Title: `Authentication Providers, Email Auth, Session Restore, and Recovery Entry`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/ios-foundation`
- Phase: `P0`
- Epic: `EPIC-001`
- Covered Requirement IDs: `PRD-004`, `UX-002`
- Objective: Implement launch authentication with Apple, Google, and email plus durable session restore and password-reset entry.
- In Scope: Sign in with Apple; Google sign-in; email sign-up; email login; password-reset request; provider-collision handling; canceled-auth handling; existing-account routing.
- Out of Scope: Onboarding questionnaire logic; billing; creator profile editing; account deletion.
- Dependencies: `TKT-P0-001`, `TKT-P0-036`, `TKT-HUM-004`
- Source-of-Truth References: `yoked_prd.md §11.1 CF-001`, `yoked_engineering_spec.md §5.1`, `yoked_ux_spec.md §7-§8`
- Acceptance Criteria: Each provider creates or resumes the correct user session; failed auth keeps the user on the auth surface with actionable error copy; existing sessions restore into onboarding or the tab root according to stored state.
- Test Evidence Required: Auth integration tests for Apple, Google, and email; session-restore tests; reset-email trigger test stubs.
- Human Actions Required: Apple and Google provider configuration in the auth backend.
- Notes: Keep provider secrets and client IDs out of Git and example configs.

### TKT-P0-003 Onboarding Questionnaires, Local Draft Persistence, Progress, and Starter-Plan Finalization
- Ticket ID: `TKT-P0-003`
- Title: `Onboarding Questionnaires, Local Draft Persistence, Progress, and Starter-Plan Finalization`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/ios-foundation`
- Phase: `P0`
- Epic: `EPIC-001`
- Covered Requirement IDs: `PRD-005`, `PRD-006`, `ENG-002`, `UX-002`
- Objective: Implement the full onboarding sequence from goals through starter-plan completion with deterministic step order and resumable local drafts.
- In Scope: Step state model; back-navigation persistence; local draft storage; equipment, frequency, environment, and body-metric capture; pre-permission education screens; starter-plan completion and failure fallback.
- Out of Scope: Post-onboarding AI generation; editable onboarding starter-plan preview; reroll or rebuild controls; notification scheduling implementation.
- Dependencies: `TKT-P0-001`, `TKT-P0-035`, `TKT-P0-038`
- Source-of-Truth References: `yoked_prd.md §11.1 CF-002 to CF-006, §14.1`, `yoked_engineering_spec.md §1.5, §1.6.0`, `yoked_ux_spec.md §8`
- Acceptance Criteria: Users can leave and resume onboarding without losing answers; step order is fixed; onboarding completes only after a valid starter plan is saved locally and to the account state; AI failure falls back to the deterministic starter template path.
- Test Evidence Required: Onboarding UI tests across all steps; local-resume tests; starter-plan generation and fallback tests.
- Human Actions Required: None.
- Notes: Onboarding must not auto-open the premium paywall after completion.

### TKT-P0-004 Paywall, StoreKit, Subscription Management, Restore, and Entitlement-Aware UI
- Ticket ID: `TKT-P0-004`
- Title: `Paywall, StoreKit, Subscription Management, Restore, and Entitlement-Aware UI`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/ios-foundation`
- Phase: `P0`
- Epic: `EPIC-001`
- Covered Requirement IDs: `PRD-007`, `UX-003`
- Objective: Implement the launch premium paywall and subscription-management surfaces with correct restore, trial, grace, and expired-state behavior.
- In Scope: Monthly and annual plan cards; restore purchases; legal links; subscription-management deep link; grace-state rendering; expired-state rendering; purchase-block reason copy.
- Out of Scope: Promotions; referrals; non-StoreKit billing; runtime slot-cap enforcement logic.
- Dependencies: `TKT-P0-001`, `TKT-P0-005`, `TKT-HUM-004`
- Source-of-Truth References: `yoked_prd.md §11.2 CF-007, CF-009, §17.1-§17.2`, `yoked_ux_spec.md §9`
- Acceptance Criteria: Paywall renders the correct active plan options; restore updates entitlement state without relaunch; expired and grace states display the mandated copy and management CTA; paywall is opened only by approved triggers.
- Test Evidence Required: StoreKit local test-plan evidence; paywall UI tests; restore-flow tests; entitlement-state screenshot matrix.
- Human Actions Required: App Store Connect product creation and billing metadata setup.
- Notes: Premium users must never see banner ads after entitlement refresh settles.

### TKT-P0-005 Entitlement Mirror, Routine Slot-Cap Gate, Runtime Config Premium Triggers, and Starter-Plan Consumption
- Ticket ID: `TKT-P0-005`
- Title: `Entitlement Mirror, Routine Slot-Cap Gate, Runtime Config Premium Triggers, and Starter-Plan Consumption`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/backend`
- Phase: `P0`
- Epic: `EPIC-008`
- Covered Requirement IDs: `PRD-007`, `PRD-022`, `ENG-003`
- Objective: Implement the local entitlement mirror and runtime-config-driven monetization rules that gate slot caps, premium actions, and ad suppression.
- In Scope: Local entitlement table; server entitlement sync; starter-plan free entitlement consumption state; free-user five-routine slot-cap enforcement; runtime-config premium gates; stale-config fallback behavior.
- Out of Scope: Paywall rendering; ad view implementation; promotions; referral grants.
- Dependencies: `TKT-P0-035`, `TKT-P0-036`, `TKT-P0-037`
- Source-of-Truth References: `yoked_prd.md §11.2, §17, §22`, `yoked_engineering_spec.md §1.8-§1.10`
- Acceptance Criteria: Slot-cap evaluation happens before insert or copy commits; runtime config can tighten or loosen approved gates without app update; premium state changes suppress ads and unlock premium-only flows within one refresh cycle.
- Test Evidence Required: Repository tests for slot-cap logic; runtime-config fallback tests; entitlement-sync integration tests.
- Human Actions Required: None beyond billing product setup handled in `TKT-HUM-004`.
- Notes: The included onboarding starter plan is free but does not unlock non-starter premium programs.

### TKT-P0-006 Train Root Entry, Resume Flows, and Single Active-Session Enforcement
- Ticket ID: `TKT-P0-006`
- Title: `Train Root Entry, Resume Flows, and Single Active-Session Enforcement`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/train`
- Phase: `P0`
- Epic: `EPIC-002`
- Covered Requirement IDs: `PRD-013`, `ENG-002`, `UX-005`
- Objective: Implement Train root entry points for Today, Instant, Recent, marketplace handoff, and active-session resume with one authoritative session at a time.
- In Scope: Train root layout; today recommendation CTA; instant workout start; recent list; pending marketplace handoff; existing active-session detection; start-vs-resume conflict resolution.
- Out of Scope: Set logging rows; timer controls; summary rendering; Home direct-start controls.
- Dependencies: `TKT-P0-001`, `TKT-P0-035`, `TKT-P0-037`
- Source-of-Truth References: `yoked_prd.md §11.5 CF-020, §27`, `yoked_engineering_spec.md §1.6.1, §4.2`, `yoked_ux_spec.md §11 Train Root`
- Acceptance Criteria: Starting from Train, Explore, or resume always lands in the same active-session authority; if an active session exists, new starts are blocked until the user resolves resume or discard; Home may route into Train but may not bypass this gate.
- Test Evidence Required: Train root UI tests; active-session conflict tests; marketplace-handoff route tests.
- Human Actions Required: None.
- Notes: This ticket owns the routing contract, not the logging UI.

### TKT-P0-007 Active-Session Logging Engine: Set Rows, Load-Entry Modes, Keypad, and Overflow Actions
- Ticket ID: `TKT-P0-007`
- Title: `Active-Session Logging Engine: Set Rows, Load-Entry Modes, Keypad, and Overflow Actions`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/train`
- Phase: `P0`
- Epic: `EPIC-002`
- Covered Requirement IDs: `PRD-014`, `UX-005`
- Objective: Build the core active-session interaction model for logging sets quickly with the required entry modes and inline affordances.
- In Scope: Set-row rendering; rep entry; weight entry; numeric keypad; `single`, `per_dumbbell`, and `left_right` weight modes; inline `Each` and `L/R` labels; rest-start action; note and replace overflow actions.
- Out of Scope: Load helper computation; timer scheduling engine; finish and discard flows.
- Dependencies: `TKT-P0-006`, `TKT-P0-035`
- Source-of-Truth References: `yoked_prd.md §11.5 CF-021, §15.4`, `yoked_ux_spec.md §11 Active Session`
- Acceptance Criteria: Set entry remains responsive under repeated rapid input; the correct input UI appears for each exercise load mode; canonical total load is computed correctly from side-aware inputs; overflow actions never break session continuity.
- Test Evidence Required: Logging reducer tests; UI tests for each load-entry mode; performance trace for rapid consecutive entries.
- Human Actions Required: None.
- Notes: Keep the interaction path optimized for one-handed logging on iPhone.

### TKT-P0-008 Timer Stack, Runtime Checkpoints, Background Recovery, and Local-Only Completion Resilience
- Ticket ID: `TKT-P0-008`
- Title: `Timer Stack, Runtime Checkpoints, Background Recovery, and Local-Only Completion Resilience`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/train`
- Phase: `P0`
- Epic: `EPIC-002`
- Covered Requirement IDs: `PRD-015`, `UX-005`
- Objective: Implement the session timer stack and recovery checkpoints so Train can survive backgrounding and intermittent connectivity.
- In Scope: Rest timer state machine; app-background persistence; scene-reentry restoration; runtime checkpoints; local completion before sync; timer drift guardrails.
- Out of Scope: Load helper UI; PR summary copy; discard confirmation modal.
- Dependencies: `TKT-P0-006`, `TKT-P0-037`
- Source-of-Truth References: `yoked_prd.md §11.5 CF-023, §15`, `yoked_engineering_spec.md §4.2-§4.7, §12`, `yoked_ux_spec.md §11`
- Acceptance Criteria: Timers restore accurately after brief backgrounding; session completion can finish offline; recovery does not duplicate sets or sessions; timer drift stays inside the documented engineering tolerance.
- Test Evidence Required: Background/foreground integration tests; offline completion tests; timer accuracy measurements.
- Human Actions Required: None.
- Notes: Local durability is more important than immediate server acknowledgment.

### TKT-P0-009 Load Helper Sheet and User Preset-Library Settings Contract
- Ticket ID: `TKT-P0-009`
- Title: `Load Helper Sheet and User Preset-Library Settings Contract`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/train`
- Phase: `P0`
- Epic: `EPIC-002`
- Covered Requirement IDs: `PRD-014`, `UX-005`, `UX-012`
- Objective: Implement the launch load helper sheet and settings that calculate plate or dumbbell suggestions only in approved contexts.
- In Scope: Load helper entry; plate-stack suggestion algorithm; per-dumbbell support; left-right support; plate inventory and barbell settings; persistent presets; sheet presentation and dismissal behavior.
- Out of Scope: Custom equipment import; P1 theme settings; workout-builder defaults beyond documented training settings.
- Dependencies: `TKT-P0-007`, `TKT-P0-030`, `TKT-P0-035`
- Source-of-Truth References: `yoked_prd.md Plate Calculator and Load Helper`, `yoked_engineering_spec.md §1.7`, `yoked_ux_spec.md §11, §20`
- Acceptance Criteria: The sheet opens only from supported exercises and contexts; suggested loading respects the saved bar and plate inventory; settings persist across sessions; unsupported contexts explain why the helper is unavailable.
- Test Evidence Required: Algorithm unit tests; sheet UI tests; settings persistence tests.
- Human Actions Required: None.
- Notes: The helper is a decision aid, not a blocking dependency for set completion.

### TKT-P0-010 Warm-Up Classification, Same-Workout Preload, PR Detection, and Post-Workout Summary Outputs
- Ticket ID: `TKT-P0-010`
- Title: `Warm-Up Classification, Same-Workout Preload, PR Detection, and Post-Workout Summary Outputs`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/train`
- Phase: `P0`
- Epic: `EPIC-002`
- Covered Requirement IDs: `PRD-015`, `UX-005`
- Objective: Implement the non-UI business logic that distinguishes warm-up sets, preloads working weights, derives PR outputs, and prepares summary data.
- In Scope: Warm-up flagging; working-set qualification; same-workout preload rules; PR calculation against completion history; summary payload assembly; no-share launch summary data model.
- Out of Scope: In-session PR celebration; achievements; cross-exercise rankings.
- Dependencies: `TKT-P0-007`, `TKT-P0-011`, `TKT-P0-035`
- Source-of-Truth References: `yoked_prd.md §11.5 CF-024 to CF-026, §15`, `yoked_engineering_spec.md §3.3.1`, `yoked_ux_spec.md §11 Post-Workout Summary`
- Acceptance Criteria: Warm-up sets never affect muscle-distribution or PR calculations; preload only uses the current workout's relevant prior entries; PR outputs appear only after successful session completion; summary payload contains the exact data needed by the summary screen.
- Test Evidence Required: Business-logic unit tests for warm-up and PR derivation; summary data snapshot tests.
- Human Actions Required: None.
- Notes: This ticket is logic-focused; the summary surface itself is completed with `TKT-P0-011`.

### TKT-P0-011 Finish and Discard Safeguards, Completion Ledger, Routine and Program Progress, and Rating Eligibility Snapshots
- Ticket ID: `TKT-P0-011`
- Title: `Finish and Discard Safeguards, Completion Ledger, Routine and Program Progress, and Rating Eligibility Snapshots`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/train`
- Phase: `P0`
- Epic: `EPIC-002`
- Covered Requirement IDs: `PRD-015`, `UX-005`
- Objective: Finalize the end-of-session transaction so completion records, routine progress, program progress, and marketplace rating eligibility are consistent.
- In Scope: Finish confirmation; discard confirmation; completion-record write path; routine-program progress counters; summary handoff; rating-eligibility snapshot flags.
- Out of Scope: Rating submission UI; streaks; achievements; export jobs.
- Dependencies: `TKT-P0-008`, `TKT-P0-010`, `TKT-P0-035`, `TKT-P0-037`
- Source-of-Truth References: `yoked_prd.md §11.5 CF-025-CF-026, §12.3, §15`, `yoked_engineering_spec.md §4.2-§4.7`, `yoked_ux_spec.md §11`
- Acceptance Criteria: Finishing writes a single authoritative completion record; discarding removes the in-flight session without corrupting prior history; routine and program progress update once; rating eligibility appears only after qualifying completion.
- Test Evidence Required: Completion-transaction integration tests; discard-path tests; routine/program progress tests.
- Human Actions Required: None.
- Notes: This is the integrity boundary between Train and marketplace trust.

### TKT-P0-012 My Workouts Root and Active-Slot UI
- Ticket ID: `TKT-P0-012`
- Title: `My Workouts Root and Active-Slot UI`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/train`
- Phase: `P0`
- Epic: `EPIC-003`
- Covered Requirement IDs: `PRD-008`, `UX-006`
- Objective: Implement the My Workouts root with owned-asset segmentation, active routine slot usage, and creation entry points.
- In Scope: Root segmented control; owned workouts, routines, and programs lists; active routine slot count; empty states; creation CTAs; `Published by Me` surfacing.
- Out of Scope: Builder internals; AI generation progress; marketplace discovery surfaces.
- Dependencies: `TKT-P0-001`, `TKT-P0-035`
- Source-of-Truth References: `yoked_prd.md §11.3, §12.6, §12.7`, `yoked_ux_spec.md §12 My Workouts Root`
- Acceptance Criteria: The root shows the correct asset families and slot usage; free users see the five-routine cap state; empty states route into the correct builders; published workout templates are visible only in author-owned contexts.
- Test Evidence Required: Root list UI tests; slot-usage state tests; empty-state routing tests.
- Human Actions Required: None.
- Notes: This ticket owns inventory and navigation, not asset editing.

### TKT-P0-013 Workout Builder, Workout Detail, and Publish Management
- Ticket ID: `TKT-P0-013`
- Title: `Workout Builder, Workout Detail, and Publish Management`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/train`
- Phase: `P0`
- Epic: `EPIC-003`
- Covered Requirement IDs: `PRD-008`, `PRD-012`, `UX-006`, `UX-012`
- Objective: Implement workout authoring, editing, detail viewing, and author-only publish-state management.
- In Scope: Workout detail; workout builder; exercise add/replace; reorder; superset grouping; notes; draft autosave; author-only publish and unpublish controls; return-to-origin behavior.
- Out of Scope: Consumer workout-template discovery; routine sequencing; program week structure.
- Dependencies: `TKT-P0-012`, `TKT-P0-017`, `TKT-P0-035`
- Source-of-Truth References: `yoked_prd.md §11.3 CF-011, §11.4 CF-018, §12.6`, `yoked_ux_spec.md §12, §19, §21-§24`
- Acceptance Criteria: Users can create and edit workouts without losing draft state; grouped-set structure is preserved; publish controls show only when the asset meets eligibility rules; published workouts remain author-managed only at launch.
- Test Evidence Required: Builder reducer tests; workout detail UI tests; publish gating tests.
- Human Actions Required: None.
- Notes: Reuse the shared exercise search and modal inventory rather than inventing new builder flows.

### TKT-P0-014 Routine Builder, Routine Detail, and Publish Management
- Ticket ID: `TKT-P0-014`
- Title: `Routine Builder, Routine Detail, and Publish Management`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/train`
- Phase: `P0`
- Epic: `EPIC-003`
- Covered Requirement IDs: `PRD-008`, `PRD-012`, `UX-006`, `UX-012`
- Objective: Implement routine authoring and detail flows, including day ordering, attached workouts, active-state rules, and marketplace publish controls.
- In Scope: Routine detail; day reorder; workout assignment; draft autosave; active-routine state; publish and unpublish controls; copy-from-marketplace source attribution retention.
- Out of Scope: Program multi-week structure; follow; ratings; coach recommendations.
- Dependencies: `TKT-P0-012`, `TKT-P0-013`, `TKT-P0-035`
- Source-of-Truth References: `yoked_prd.md §11.3 CF-013, §11.4 CF-018, §12.5-§12.7`, `yoked_ux_spec.md §12, §19, §21-§24`
- Acceptance Criteria: Routines can be created, reordered, edited, activated, and published according to eligibility rules; free-user slot caps are honored; copied marketplace routines preserve source attribution.
- Test Evidence Required: Routine CRUD tests; active-slot gating tests; publish-state tests.
- Human Actions Required: None.
- Notes: Active-state mutations must respect the entitlement mirror from `TKT-P0-005`.

### TKT-P0-015 Program Detail, Builder, Included Starter Plan, and AI Preview Handling
- Ticket ID: `TKT-P0-015`
- Title: `Program Detail, Builder, Included Starter Plan, and AI Preview Handling`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/train`
- Phase: `P0`
- Epic: `EPIC-003`
- Covered Requirement IDs: `PRD-008`, `PRD-009`, `UX-006`, `UX-012`
- Objective: Implement program detail and builder flows, including the onboarding-generated included starter plan and the premium AI preview path.
- In Scope: Program detail; multi-week structure; start and save handling; included starter-plan rendering; AI generation preview and confirmation; versioned save as owned asset.
- Out of Scope: Promotions; coach-generated adaptive plans; program comments; public workout-template browsing.
- Dependencies: `TKT-P0-003`, `TKT-P0-012`, `TKT-P0-038`
- Source-of-Truth References: `yoked_prd.md §11.3 CF-012, CF-014, §14.1, §14.6`, `yoked_ux_spec.md §12, §19`
- Acceptance Criteria: The onboarding starter plan appears as the included free generated program; premium AI program generation can preview and save a new revision without mutating prior assets; program detail respects premium gating and save-state rules.
- Test Evidence Required: Program detail UI tests; AI preview confirmation tests; starter-plan ownership tests.
- Human Actions Required: None.
- Notes: Saved AI outputs must remain executable owned assets, not transient suggestions.

### TKT-P0-016 Canonical Catalog Pipeline, Runtime Bundle, and Deterministic Ingest Freeze Tooling
- Ticket ID: `TKT-P0-016`
- Title: `Canonical Catalog Pipeline, Runtime Bundle, and Deterministic Ingest Freeze Tooling`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/catalog`
- Phase: `P0`
- Epic: `EPIC-004`
- Covered Requirement IDs: `PRD-010`, `ENG-006`
- Objective: Implement the source catalog ingest and runtime bundle generation pipeline for the internal Yoked Exercise Catalog.
- In Scope: Catalog source format; ingest command; validation rules; deterministic ordering; no-media enforcement; runtime bundle output; internal catalog-gap reports; versioned bundle freeze for launch.
- Out of Scope: Third-party branded dataset import; media assets; user-authored custom exercise ingestion into the canonical catalog.
- Dependencies: `TKT-OPS-005`
- Source-of-Truth References: `yoked_prd.md §11.4.1`, `yoked_engineering_spec.md §3.4-§3.7`
- Acceptance Criteria: A repeatable pipeline produces the same runtime bundle from the same source input; validation fails on missing required sections or any media payload at launch; the bundle can be loaded locally without network dependence.
- Test Evidence Required: Pipeline validation outputs; deterministic snapshot tests; bundle-load integration tests.
- Human Actions Required: None.
- Notes: Catalog tooling must stay in the repo and operate without hidden local dependencies.

### TKT-P0-017 Exercise Search, Filter, Similar Exercises, and Exclude-Only Preferences
- Ticket ID: `TKT-P0-017`
- Title: `Exercise Search, Filter, Similar Exercises, and Exclude-Only Preferences`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/catalog`
- Phase: `P0`
- Epic: `EPIC-004`
- Covered Requirement IDs: `PRD-011`, `UX-011`
- Objective: Build the shared exercise search system used by builders and replacement flows with fast local ranking and the launch preference model.
- In Scope: Search UI; local FTS and fuzzy ranking; alias support; movement-family similar suggestions; exclude-only preference toggles; no-result handling; builder and Train replace-entry integration.
- Out of Scope: Favorites; remote search dependency; public marketplace exercise search.
- Dependencies: `TKT-P0-016`, `TKT-P0-035`
- Source-of-Truth References: `yoked_prd.md §11.4 CF-015-CF-016`, `yoked_engineering_spec.md §3.5-§3.7`, `yoked_ux_spec.md §15`
- Acceptance Criteria: Search remains low-latency offline; similar exercises reflect movement-family logic; exclude preferences affect ranking and recommendation contexts; zero-result states expose the custom-exercise CTA.
- Test Evidence Required: Search ranking tests; UI tests for filter and zero-result paths; local-performance measurements.
- Human Actions Required: None.
- Notes: This ticket is reused by builders, Train replace, and custom exercise authoring.

### TKT-P0-018 Private Custom Exercise Authoring and Dependency-Aware Delete
- Ticket ID: `TKT-P0-018`
- Title: `Private Custom Exercise Authoring and Dependency-Aware Delete`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/catalog`
- Phase: `P0`
- Epic: `EPIC-004`
- Covered Requirement IDs: `PRD-011`, `UX-011`
- Objective: Implement custom exercise creation, editing, and safe deletion as a private user-owned catalog extension.
- In Scope: Custom exercise authoring form; alias capture; movement pattern metadata; save and edit flows; private visibility enforcement; dependency-aware delete warnings; replace-or-remove guidance when referenced by assets.
- Out of Scope: Marketplace publishing; community custom exercises; exercise media.
- Dependencies: `TKT-P0-017`, `TKT-P0-035`
- Source-of-Truth References: `yoked_prd.md §11.4 CF-017`, `yoked_engineering_spec.md §3.2`, `yoked_ux_spec.md §15`
- Acceptance Criteria: Custom exercises can be created and reused in owned assets; they never appear in marketplace publish payloads; deleting a referenced custom exercise requires explicit resolution of dependent assets.
- Test Evidence Required: CRUD tests; dependency-warning tests; builder integration tests.
- Human Actions Required: None.
- Notes: Custom exercises should feel first-party in builders while remaining private by rule.

### TKT-P0-019 Text-First Exercise Detail with Exact-Variation Performance and History
- Ticket ID: `TKT-P0-019`
- Title: `Text-First Exercise Detail with Exact-Variation Performance and History`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/catalog`
- Phase: `P0`
- Epic: `EPIC-004`
- Covered Requirement IDs: `PRD-010`, `PRD-017`, `ENG-006`, `UX-011`
- Objective: Implement the exercise detail screen with launch text-first content and exact-variation analytics views.
- In Scope: Ordered instructional sections; muscle tags; equipment and movement metadata; recent-history list; 1RM curve; date-window selector; empty, sparse, and offline states; no-media layout.
- Out of Scope: Cross-exercise ranking; future media packs; favorites.
- Dependencies: `TKT-P0-016`, `TKT-P0-035`, `TKT-P0-039`
- Source-of-Truth References: `yoked_prd.md §11.4.1, §11.6 CF-031`, `yoked_engineering_spec.md §3.3.1, §3.6`, `yoked_ux_spec.md §16`
- Acceptance Criteria: Exercise detail renders complete instructional content without placeholders; the analytics views are scoped to exact exercise variation history only; empty states explain insufficient history rather than showing broken charts.
- Test Evidence Required: Exercise-detail UI tests; projection tests for exact-variation history; sparse-data state screenshots.
- Human Actions Required: None.
- Notes: Keep the screen stable even when the device is fully offline.

### TKT-P0-020 Explore Root, Search, Ranked Lanes, and Browse Caching
- Ticket ID: `TKT-P0-020`
- Title: `Explore Root, Search, Ranked Lanes, and Browse Caching`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/marketplace`
- Phase: `P0`
- Epic: `EPIC-005`
- Covered Requirement IDs: `PRD-018`, `ENG-002`, `UX-007`
- Objective: Implement the Explore root browsing model with category rails, ranked feed content, lightweight search, and browse cache behavior.
- In Scope: Explore root layout; ranked content lanes; search entry; browse cache; pull-to-refresh; offline browse fallback; marketplace-only asset and creator result types.
- Out of Scope: Immersive social feed; consumer workout-template discovery; follow feed; comments.
- Dependencies: `TKT-P0-024`, `TKT-P0-036`, `TKT-P0-037`
- Source-of-Truth References: `yoked_prd.md §11.7 CF-038, §12.1-§12.2`, `yoked_engineering_spec.md §1.6.2, §5.5`, `yoked_ux_spec.md §13`
- Acceptance Criteria: Explore loads marketplace content with stable lane ordering; offline mode shows last successful browse cache with stale markers; search returns only allowed marketplace entity types; no social-feed patterns appear.
- Test Evidence Required: Explore UI tests; cache fallback tests; browse API integration tests.
- Human Actions Required: None.
- Notes: Ranking logic is implemented in `TKT-P0-024`; this ticket owns the surface and browse behavior.

### TKT-P0-021 Marketplace Asset Detail Actions with Save, Copy, Start, and Paywall Gating
- Ticket ID: `TKT-P0-021`
- Title: `Marketplace Asset Detail Actions with Save, Copy, Start, and Paywall Gating`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/marketplace`
- Phase: `P0`
- Epic: `EPIC-005`
- Covered Requirement IDs: `PRD-018`, `PRD-019`, `UX-007`
- Objective: Implement routine and program marketplace detail surfaces with the exact launch CTA order and lock-state explanations.
- In Scope: Asset detail header; CTA stack in `Start`, `Save`, `Copy`, `Rate` order; premium-gated program handling; saved and copied state; source attribution persistence; Explore-to-Train handoff.
- Out of Scope: Follow; comments; non-marketplace workout detail consumption.
- Dependencies: `TKT-P0-004`, `TKT-P0-005`, `TKT-P0-020`
- Source-of-Truth References: `yoked_prd.md §11.7 CF-039, §12.5`, `yoked_ux_spec.md §17`
- Acceptance Criteria: Locked actions explain the reason before paywall handoff; routines can start directly into Train; saved and copied states persist to My Workouts with source attribution; rating entry appears only after qualifying completion exists.
- Test Evidence Required: Marketplace-detail UI tests; paywall-gate tests; copy/save persistence tests.
- Human Actions Required: None.
- Notes: The CTA order is fixed and must not be reinterpreted by design implementation.

### TKT-P0-022 Creator Profile Detail and Block Flows
- Ticket ID: `TKT-P0-022`
- Title: `Creator Profile Detail and Block Flows`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/marketplace`
- Phase: `P0`
- Epic: `EPIC-005`
- Covered Requirement IDs: `PRD-020`, `UX-012`
- Objective: Implement the launch creator profile detail surface with credibility signals, published asset inventory, and blocking controls.
- In Scope: Creator header; credibility tier display; program and routine inventory; basic stats; block creator action; blocked-state consequences on marketplace visibility.
- Out of Scope: Follow; messaging; creator feed; comments.
- Dependencies: `TKT-P0-024`, `TKT-P0-037`
- Source-of-Truth References: `yoked_prd.md §12.4, §13`, `yoked_ux_spec.md §18`
- Acceptance Criteria: Creator profiles show only launch-approved metrics and assets; blocking hides creator content from Explore and detail entry points after cache refresh; blocked creators cannot be followed because follow does not exist at launch.
- Test Evidence Required: Creator-profile UI tests; block-flow integration tests; browse suppression tests.
- Human Actions Required: None.
- Notes: This ticket is user-facing while moderation operator tooling remains read-only and internal.

### TKT-P0-023 Completion-Gated Ratings and Aggregate Summaries
- Ticket ID: `TKT-P0-023`
- Title: `Completion-Gated Ratings and Aggregate Summaries`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/marketplace`
- Phase: `P0`
- Epic: `EPIC-005`
- Covered Requirement IDs: `PRD-019`, `PRD-020`
- Objective: Implement launch ratings as numeric-only, post-completion marketplace feedback with aggregate rollups.
- In Scope: Rating eligibility check; rate action; numeric selection; aggregate average and count projections; update handling; anti-duplicate submission rules.
- Out of Scope: Text reviews; comments; likes; social PR celebrations.
- Dependencies: `TKT-P0-011`, `TKT-P0-021`, `TKT-P0-036`
- Source-of-Truth References: `yoked_prd.md §11.7 CF-040, §12.3`, `yoked_engineering_spec.md §5.4-§5.5`
- Acceptance Criteria: A user can rate only after qualifying completion; ratings remain numeric-only; duplicate submissions follow the documented update rules; marketplace summaries refresh correctly after submission.
- Test Evidence Required: Rating eligibility tests; API contract tests; UI tests for submit and edit flows.
- Human Actions Required: None.
- Notes: Keep the UX lightweight and marketplace-oriented.

### TKT-P0-024 Creator Eligibility, Credibility, Visibility Tiers, Ranking, and Moderation Projections
- Ticket ID: `TKT-P0-024`
- Title: `Creator Eligibility, Credibility, Visibility Tiers, Ranking, and Moderation Projections`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/marketplace`
- Phase: `P0`
- Epic: `EPIC-005`
- Covered Requirement IDs: `PRD-020`, `ENG-011`
- Objective: Implement the ranking and moderation-read model that determines which creators and assets appear in Explore.
- In Scope: Eligibility calculation; credibility score inputs; visibility tiers; lane-specific ordering; stable tiebreakers; moderation suppression consumption; blocked-user suppression.
- Out of Scope: Manual operator dashboard UI; follow graph; comments moderation.
- Dependencies: `TKT-P0-036`, `TKT-P0-037`
- Source-of-Truth References: `yoked_prd.md §12.3-§13`, `yoked_engineering_spec.md §8`
- Acceptance Criteria: Explore ordering matches the ranking contract; suppressed or blocked creators disappear from launch discovery surfaces; publish ineligibility is explained in creator-owned management contexts.
- Test Evidence Required: Ranking algorithm tests; moderation projection tests; browse ordering integration tests.
- Human Actions Required: None.
- Notes: Operator-entered safety controls are consumed read-only at launch.

### TKT-P0-025 Home Root Informational Modules and Approved Banner Placement
- Ticket ID: `TKT-P0-025`
- Title: `Home Root Informational Modules and Approved Banner Placement`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/analytics`
- Phase: `P0`
- Epic: `EPIC-006`
- Covered Requirement IDs: `UX-004`, `UX-008`
- Objective: Implement the Home screen as a fixed informational surface with no execution ownership and one approved banner slot.
- In Scope: Today summary; active program snapshot; KPI card; recommendation rail; one contextual banner slot after required modules; empty and loading states.
- Out of Scope: Workout start button; social feed; advanced analytics cards; multiple ads.
- Dependencies: `TKT-P0-001`, `TKT-P0-026`, `TKT-P0-040`
- Source-of-Truth References: `yoked_ux_spec.md §10`, `yoked_prd.md §25.1, §27`
- Acceptance Criteria: Home renders only the approved informational modules; the banner appears only in the approved position and only for eligible free users; any route from Home into execution lands in Train rather than starting directly.
- Test Evidence Required: Home UI tests; banner-placement tests; route-ownership tests.
- Human Actions Required: None.
- Notes: This ticket intentionally keeps Home lightweight and non-authoritative.

### TKT-P0-026 KPI Materialization and You Progress Overview
- Ticket ID: `TKT-P0-026`
- Title: `KPI Materialization and You Progress Overview`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/analytics`
- Phase: `P0`
- Epic: `EPIC-006`
- Covered Requirement IDs: `PRD-017`, `ENG-002`, `UX-008`
- Objective: Implement launch KPI computation and the You Progress overview that surfaces the basic analytics stack.
- In Scope: Weekly KPI snapshot materialization; progress overview cards; progress freshness markers; exact launch metric set; overview navigation to drill-downs.
- Out of Scope: Strength score; rankings; achievements; streaks; coach recommendations.
- Dependencies: `TKT-P0-035`, `TKT-P0-039`
- Source-of-Truth References: `yoked_prd.md §11.6 CF-030, §16`, `yoked_engineering_spec.md §1.6.2, §3.3`, `yoked_ux_spec.md §14 You Progress Overview`
- Acceptance Criteria: KPI cards render only the launch-approved metrics; stale or missing data states are explicit; drill-down entry points navigate to the correct progress sub-surfaces.
- Test Evidence Required: KPI materialization tests; overview UI tests; stale-state screenshot coverage.
- Human Actions Required: None.
- Notes: This ticket owns the overview, not every detailed analytics screen.

### TKT-P0-027 Muscle Distribution Analytics and Body-Map Drill-In
- Ticket ID: `TKT-P0-027`
- Title: `Muscle Distribution Analytics and Body-Map Drill-In`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/analytics`
- Phase: `P0`
- Epic: `EPIC-006`
- Covered Requirement IDs: `PRD-016`, `ENG-006`, `UX-009`
- Objective: Implement the muscle-distribution analytics surface and allocation logic from completed non-warmup working sets only.
- In Scope: Front and back body views; five-band legend; range selector; contributing-exercise filter; workload-allocation algorithm; empty and low-data states.
- Out of Scope: Recovery score; body-fat visuals; exercise media overlays.
- Dependencies: `TKT-P0-010`, `TKT-P0-039`
- Source-of-Truth References: `yoked_prd.md §11.6 CF-028`, `yoked_engineering_spec.md §3.3.2`, `yoked_ux_spec.md §14 Muscle Distribution`
- Acceptance Criteria: Warm-up sets never count; each working set allocates workload according to the documented muscle map; range switching updates both body map and contributing-exercise list on the same screen.
- Test Evidence Required: Allocation-algorithm tests; UI tests for each range; screenshot evidence for front and back views.
- Human Actions Required: None.
- Notes: Exact explanation text for low-confidence states belongs on the screen, not hidden in logs.

### TKT-P0-028 History Calendar, Date-Range Reports, and Completed-Workout Detail
- Ticket ID: `TKT-P0-028`
- Title: `History Calendar, Date-Range Reports, and Completed-Workout Detail`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/analytics`
- Phase: `P0`
- Epic: `EPIC-006`
- Covered Requirement IDs: `PRD-017`, `UX-009`
- Objective: Implement history navigation from calendar selection through completed-workout detail and range-based reporting.
- In Scope: History calendar; date selection; completed-workout detail; range report filters; completed-workout list grouping; read-only detail rendering.
- Out of Scope: Export; import; streak badges; achievements.
- Dependencies: `TKT-P0-011`, `TKT-P0-039`
- Source-of-Truth References: `yoked_prd.md §11.6 CF-032-CF-033`, `yoked_ux_spec.md §14 History Calendar, Completed Workout Detail, Date Range Report`
- Acceptance Criteria: Users can navigate from overview to calendar to exact completed-workout detail; reports reflect the selected time range; history remains readable offline from local records.
- Test Evidence Required: History UI tests; report filter tests; offline history-read tests.
- Human Actions Required: None.
- Notes: Use local completion records as the primary source and sync as secondary.

### TKT-P0-029 Body Measurements and Goals or Targets
- Ticket ID: `TKT-P0-029`
- Title: `Body Measurements and Goals or Targets`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/analytics`
- Phase: `P0`
- Epic: `EPIC-006`
- Covered Requirement IDs: `PRD-017`, `UX-009`
- Objective: Implement body-measurement tracking and goals or targets management within the launch progress scope.
- In Scope: Measurement list; add and edit sheet; date history; units display; goals and targets creation; target status rendering; empty states.
- Out of Scope: Nutrition logging; transformation photos; advanced body-composition analytics.
- Dependencies: `TKT-P0-035`, `TKT-P0-039`
- Source-of-Truth References: `yoked_prd.md §11.6 CF-037`, `yoked_ux_spec.md §14 Goals and Targets, Body Measurements`
- Acceptance Criteria: Measurements can be added and edited with persisted history; goals or targets surface current status; units match user preference; sparse history states remain comprehensible.
- Test Evidence Required: CRUD tests for measurements and targets; UI tests for measurement entry and edit; unit-conversion tests.
- Human Actions Required: None.
- Notes: Keep this scope strictly within the launch progress surface and avoid transformation features.

### TKT-P0-030 Profile, Edit, Creator Management, Account, and Training Settings
- Ticket ID: `TKT-P0-030`
- Title: `Profile, Edit, Creator Management, Account, and Training Settings`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/ios-foundation`
- Phase: `P0`
- Epic: `EPIC-007`
- Covered Requirement IDs: `PRD-020`, `PRD-021`, `ENG-003`, `UX-008`, `UX-010`
- Objective: Implement the user and creator settings surfaces that own identity preferences, creator metadata, unit preference, and training configuration.
- In Scope: Profile overview; edit profile; creator profile management; unit preference; training settings; load-helper defaults; account summary; creator-state empty and enabled flows.
- Out of Scope: Theme override; app icon override; manual language override; follow settings.
- Dependencies: `TKT-P0-035`, `TKT-P0-036`
- Source-of-Truth References: `yoked_prd.md §11.8 CF-042-CF-044, §13`, `yoked_engineering_spec.md §1.8-§1.9`, `yoked_ux_spec.md §14`
- Acceptance Criteria: Users can update launch-approved profile and creator fields; unit preference applies consistently across analytics and training surfaces; unsupported future settings are absent rather than disabled placeholders.
- Test Evidence Required: Settings form tests; unit-preference propagation tests; creator-management UI tests.
- Human Actions Required: None.
- Notes: Keep appearance and language overrides strictly out of launch UI.

### TKT-P0-031 Notification Settings, Scheduler, Deep-Link Payloads, and Reminder Delivery
- Ticket ID: `TKT-P0-031`
- Title: `Notification Settings, Scheduler, Deep-Link Payloads, and Reminder Delivery`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/ios-foundation`
- Phase: `P0`
- Epic: `EPIC-007`
- Covered Requirement IDs: `PRD-006`, `PRD-021`, `ENG-012`, `UX-010`
- Objective: Implement reminder permissions, notification preferences, and delivery payloads that deep-link back into the app safely.
- In Scope: Pre-permission education follow-through; notifications settings screen; reminder scheduling; local and remote payload routing; deep-link destinations; authorization-state rendering.
- Out of Scope: Streak recovery nudges; promotional offers; referral notifications.
- Dependencies: `TKT-P0-001`, `TKT-P0-036`, `TKT-HUM-005`
- Source-of-Truth References: `yoked_prd.md §11.1 CF-005, §11.8 CF-045`, `yoked_engineering_spec.md §9`, `yoked_ux_spec.md §14 Notification Settings`
- Acceptance Criteria: Users can opt in or out cleanly; reminder timing follows saved preference rules; tapping a delivered notification lands on the correct owning surface without duplicate stacks; disabled states explain how to re-enable system permission.
- Test Evidence Required: Notification scheduling tests; deep-link payload tests; authorization-state UI tests.
- Human Actions Required: APNs configuration and certificate or token setup.
- Notes: Notification controls live in You and must not leak into onboarding beyond the approved pre-permission screens.

### TKT-P0-032 Apple Health Settings and HealthKit Pipeline
- Ticket ID: `TKT-P0-032`
- Title: `Apple Health Settings and HealthKit Pipeline`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/health`
- Phase: `P0`
- Epic: `EPIC-007`
- Covered Requirement IDs: `PRD-006`, `PRD-021`, `ENG-008`, `ENG-012`, `UX-010`
- Objective: Implement the Apple Health integration surface and HealthKit read-write pipeline as the only launch external health integration.
- In Scope: Apple Health education state; connection status UI; authorization request; sync-state machine; data mapping; retry handling; disconnect handling.
- Out of Scope: Strava; Fitbit; Apple Watch; import jobs.
- Dependencies: `TKT-P0-003`, `TKT-P0-036`, `TKT-HUM-005`
- Source-of-Truth References: `yoked_prd.md §11.1 CF-006, §11.9 CF-050, §18`, `yoked_engineering_spec.md §5.9, §10.1`, `yoked_ux_spec.md §14 Integrations`
- Acceptance Criteria: Apple Health is the only visible provider; authorization state, sync progress, and error states render correctly; revoked permission returns the integration to a recoverable disconnected state without corrupting local data.
- Test Evidence Required: HealthKit mapping tests; authorization-state UI tests; retry-state tests.
- Human Actions Required: HealthKit capability approval and entitlements.
- Notes: Keep all non-Apple providers absent from launch settings rows.

### TKT-P0-033 Support, Help, Feedback, About, and Support Ticket Submission
- Ticket ID: `TKT-P0-033`
- Title: `Support, Help, Feedback, About, and Support Ticket Submission`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/ios-foundation`
- Phase: `P0`
- Epic: `EPIC-007`
- Covered Requirement IDs: `PRD-021`, `UX-010`
- Objective: Implement the support subtree so users can read help content and submit support or feedback without leaving the product context unexpectedly.
- In Scope: Support index; FAQ; contact support form; feedback form; about screen; support submission API; success and retry states.
- Out of Scope: Community forums; live chat; social messaging.
- Dependencies: `TKT-P0-036`
- Source-of-Truth References: `yoked_prd.md §19`, `yoked_ux_spec.md §14 Support and Help surfaces`
- Acceptance Criteria: Users can navigate to help content and submit structured support requests; failed submissions are retryable; about and policy links are visible from the support tree.
- Test Evidence Required: Support form UI tests; API request tests; offline submission failure-state tests.
- Human Actions Required: None.
- Notes: Keep support flows first-party and lightweight for launch.

### TKT-P0-034 Data Settings, Erase Flow, Transfer Guidance, and Sync Visibility
- Ticket ID: `TKT-P0-034`
- Title: `Data Settings, Erase Flow, Transfer Guidance, and Sync Visibility`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/backend`
- Phase: `P0`
- Epic: `EPIC-007`
- Covered Requirement IDs: `PRD-021`, `UX-010`
- Objective: Implement the governance surfaces that let users understand sync state, request erasure, and read transfer limitations.
- In Scope: Data settings screen; sync-last-updated display; erase-account request flow; erase confirmation; transfer guidance surface; export unavailable-state copy.
- Out of Scope: CSV export jobs; import execution; public API access.
- Dependencies: `TKT-P0-036`, `TKT-P0-037`
- Source-of-Truth References: `yoked_prd.md §20`, `yoked_ux_spec.md §14 Data Settings, Erase Confirmation, Transfer Guidance`
- Acceptance Criteria: Users can request erase with explicit confirmation; transfer guidance clearly states launch portability limitations; sync visibility reflects real local-vs-cloud freshness indicators.
- Test Evidence Required: Governance UI tests; erase-request API tests; sync-visibility state tests.
- Human Actions Required: None.
- Notes: Export and import remain absent except for unavailable guidance text mandated by the product docs.

### TKT-P0-035 Core SQLite Schema, Repositories, DTO Mappers, and Local Cache Tables
- Ticket ID: `TKT-P0-035`
- Title: `Core SQLite Schema, Repositories, DTO Mappers, and Local Cache Tables`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/backend`
- Phase: `P0`
- Epic: `EPIC-008`
- Covered Requirement IDs: `PRD-002`, `ENG-001`, `ENG-005`
- Objective: Implement the local persistence layer that backs every launch surface and supports local-first execution.
- In Scope: SQLite migrations; repository interfaces; DTO mappers; FTS tables; completion tables; rating cache; moderation cache; analytics queue; integration-status cache.
- Out of Scope: Public API endpoints; remote sync scheduler; import jobs.
- Dependencies: `TKT-OPS-001`
- Source-of-Truth References: `yoked_prd.md §9`, `yoked_engineering_spec.md §3.1-§3.2, §4.1`
- Acceptance Criteria: The local schema covers all launch entities and caches; migrations are deterministic from clean install and upgrade paths; repositories expose the documented query patterns without forcing network access.
- Test Evidence Required: Migration tests; repository tests; DTO mapping tests; clean-install and upgrade validation.
- Human Actions Required: None.
- Notes: This ticket is a prerequisite for nearly all product-surface work.

### TKT-P0-036 REST API Surface for Auth, Users, Exercises, Assets, Ratings, Integrations, Support, and Governance
- Ticket ID: `TKT-P0-036`
- Title: `REST API Surface for Auth, Users, Exercises, Assets, Ratings, Integrations, Support, and Governance`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/backend`
- Phase: `P0`
- Epic: `EPIC-008`
- Covered Requirement IDs: `PRD-002`, `ENG-008`
- Objective: Implement the documented launch API families that synchronize user, asset, rating, integration, and governance state.
- In Scope: Auth/session endpoints; user profile endpoints; exercise catalog fetch; owned-asset CRUD endpoints; creator and Explore endpoints; ratings endpoints; support ticket endpoint; governance erase endpoint.
- Out of Scope: Import job endpoints; public API keys; Apple Watch continuity endpoints.
- Dependencies: `TKT-HUM-003`, `TKT-OPS-004`
- Source-of-Truth References: `yoked_engineering_spec.md §5.1-§5.11`, `yoked_prd.md §21-§24`
- Acceptance Criteria: Each documented P0 endpoint family exists with the documented payload shape; unsupported P1 or P2 endpoints are not exposed as active launch dependencies; auth and governance endpoints satisfy the product flows that depend on them.
- Test Evidence Required: API contract tests; endpoint smoke tests; schema and auth validation logs.
- Human Actions Required: Supabase project and secret provisioning.
- Notes: Keep endpoint naming and envelope conventions aligned with the engineering spec.

### TKT-P0-037 Sync Engine, Mutation Queue, Background Tasks, Runtime-Config Cache, and Moderation Cache
- Ticket ID: `TKT-P0-037`
- Title: `Sync Engine, Mutation Queue, Background Tasks, Runtime-Config Cache, and Moderation Cache`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/backend`
- Phase: `P0`
- Epic: `EPIC-008`
- Covered Requirement IDs: `PRD-022`, `ENG-001`, `ENG-003`, `ENG-007`, `ENG-009`
- Objective: Implement the local-first sync backbone, queue ordering, background refresh policy, and supporting caches required for continuity.
- In Scope: Mutation queue; priority ordering; push-then-pull sync; per-scope cursors; background refresh tasks; runtime-config cache; moderation cache; retry policy; conflict resolution; stale markers.
- Out of Scope: Live Activity projection; Apple Watch session sync; public API exports.
- Dependencies: `TKT-P0-035`, `TKT-P0-036`, `TKT-HUM-003`
- Source-of-Truth References: `yoked_prd.md §21-§24`, `yoked_engineering_spec.md §4.2-§4.7, §6`
- Acceptance Criteria: Local writes succeed when offline; background sync respects documented priorities and retry limits; active sessions are never overwritten by remote state; moderation and runtime-config caches fall back to last-known-good values.
- Test Evidence Required: Queue-order tests; sync conflict tests; background-task integration tests; stale-config tests.
- Human Actions Required: Supabase staging credentials.
- Notes: This ticket is the core continuity contract for launch reliability.

### TKT-P0-038 AI Generator Service, Deterministic Validator, and Fallback Templates
- Ticket ID: `TKT-P0-038`
- Title: `AI Generator Service, Deterministic Validator, and Fallback Templates`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/backend`
- Phase: `P0`
- Epic: `EPIC-003`
- Covered Requirement IDs: `PRD-009`, `ENG-010`
- Objective: Implement the hybrid AI generation pipeline that creates workouts, routines, and programs within the allowed launch schema.
- In Scope: Prompt assembly; preprocessing; response parsing; schema validation; repair pass; fallback template generation; explanation metadata; save-ready output contract.
- Out of Scope: Conversational coach; autonomous plan evolution; unsupported asset types.
- Dependencies: `TKT-P0-035`, `TKT-P0-036`
- Source-of-Truth References: `yoked_prd.md §11.3 CF-012, §14.1, §14.6`, `yoked_engineering_spec.md §7`
- Acceptance Criteria: Generated assets always conform to the executable schema or fall back to deterministic templates; explanation metadata is preserved; unsupported content is rejected rather than silently saved.
- Test Evidence Required: Validator unit tests; repair-path tests; fallback-template tests; sample generation fixtures.
- Human Actions Required: None.
- Notes: Keep launch prompts tightly constrained to documented inputs and outputs.

### TKT-P0-039 Analytics Event Queue, Batch Ingest, KPI Materialization Pipeline, and Integrity Validation
- Ticket ID: `TKT-P0-039`
- Title: `Analytics Event Queue, Batch Ingest, KPI Materialization Pipeline, and Integrity Validation`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/analytics`
- Phase: `P0`
- Epic: `EPIC-008`
- Covered Requirement IDs: `PRD-022`
- Objective: Implement analytics event capture and downstream materialization so progress surfaces and release validation can trust the data.
- In Scope: Canonical event envelope; local analytics queue; batch ingest; materialized KPI jobs; stale detection; event dedupe; integrity validation hooks.
- Out of Scope: Marketing growth loops; referral attribution; deferred advanced analytics modules.
- Dependencies: `TKT-P0-035`, `TKT-P0-036`, `TKT-P0-037`
- Source-of-Truth References: `yoked_prd.md §28`, `yoked_engineering_spec.md §13`
- Acceptance Criteria: Approved launch events enqueue locally, upload in batches, and materialize the KPI data needed by launch surfaces; malformed or unsupported events are rejected; integrity checks surface gaps before release.
- Test Evidence Required: Event-schema tests; batch-ingest tests; KPI materialization tests; integrity-check output.
- Human Actions Required: None.
- Notes: This ticket supports both product analytics and QA release evidence.

### TKT-P0-040 Ad Subsystem with AdMob Banner Gating and Suppression
- Ticket ID: `TKT-P0-040`
- Title: `Ad Subsystem with AdMob Banner Gating and Suppression`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/release`
- Phase: `P0`
- Epic: `EPIC-008`
- Covered Requirement IDs: `PRD-022`, `ENG-003`
- Objective: Implement the launch banner-ad subsystem with strict area allowlisting and entitlement suppression.
- In Scope: Ad load wrapper; approved-surface placement logic; premium suppression; runtime-config gating; failure fallback; empty-container avoidance; AdMob IDs from config.
- Out of Scope: Interstitials; rewarded ads; video ads; ads in builders or active sessions.
- Dependencies: `TKT-P0-005`, `TKT-P0-025`, `TKT-HUM-006`
- Source-of-Truth References: `yoked_prd.md §17.4, §25.1, §26`, `yoked_engineering_spec.md §1.10`
- Acceptance Criteria: Ads render only on approved surfaces for eligible free users; premium state suppresses ads within the documented refresh window; ad-load failure never leaves broken spacing or blocks navigation.
- Test Evidence Required: Placement tests; entitlement-suppression tests; no-empty-slot UI validation; AdMob test-device evidence.
- Human Actions Required: AdMob app and banner-unit setup.
- Notes: The ad system is a release concern as much as an implementation concern because policy mistakes are launch blockers.

### TKT-P0-041 Security, Token Storage, Data Protection, and Permission-Minimization Hardening
- Ticket ID: `TKT-P0-041`
- Title: `Security, Token Storage, Data Protection, and Permission-Minimization Hardening`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/ios-foundation`
- Phase: `P0`
- Epic: `EPIC-012`
- Covered Requirement IDs: `ENG-012`
- Objective: Implement the app-side hardening controls required by the engineering spec before release.
- In Scope: Keychain token storage; file protection settings; ATS compliance; permission minimization; secure logging rules; security configuration review items.
- Out of Scope: External penetration test procurement; server firewall administration; non-launch provider permissions.
- Dependencies: `TKT-P0-002`, `TKT-P0-032`, `TKT-OPS-004`
- Source-of-Truth References: `yoked_engineering_spec.md §11`, `yoked_prd.md §23`
- Acceptance Criteria: Sensitive tokens are never stored in plain local preferences; file protection and network policy align with the engineering spec; user permissions are requested only for launch-approved capabilities.
- Test Evidence Required: Security configuration checklist; storage inspection evidence; ATS and permission audit logs.
- Human Actions Required: None.
- Notes: This ticket is implementation hardening; final proof is captured under `TKT-QA-006`.

## P1 Ticket Inventory

### TKT-P1-001 Promotions and Offer Mechanics
- Ticket ID: `TKT-P1-001`
- Title: `Promotions and Offer Mechanics`
- Kind: `kind/feature`
- Priority: `priority/p1`
- Area: `area/ios-foundation`
- Phase: `P1`
- Epic: `EPIC-010`
- Covered Requirement IDs: `PRD-023`, `UX-013`
- Objective: Add P1 promotional overlays and offer entry points without changing core launch packaging rules.
- In Scope: Offer presentation logic; promo-code or offer-code entry; paywall overlay variants; analytics events for offers.
- Out of Scope: Referral loops; permanent packaging changes; launch paywall triggers.
- Dependencies: `TKT-P0-004`, `TKT-P0-005`, `TKT-P0-039`
- Source-of-Truth References: `yoked_prd.md §11.2 CF-008, §17.3, §25.2`, `yoked_ux_spec.md §26`
- Acceptance Criteria: Offers can be surfaced intentionally without displacing core subscription options; launch paywall behavior remains unchanged until P1 is scheduled.
- Test Evidence Required: Offer-state UI tests; promo analytics validation.
- Human Actions Required: Offer configuration in billing consoles if adopted.
- Notes: No dormant offer UI ships in P0.

### TKT-P1-002 Favorites UI and Preference Expansion
- Ticket ID: `TKT-P1-002`
- Title: `Favorites UI and Preference Expansion`
- Kind: `kind/feature`
- Priority: `priority/p1`
- Area: `area/catalog`
- Phase: `P1`
- Epic: `EPIC-010`
- Covered Requirement IDs: `PRD-024`, `UX-013`
- Objective: Add favorite-exercise behavior as a P1 expansion beyond launch exclude-only preferences.
- In Scope: Favorite toggle; favorite filters; favorite-aware search ranking; preference migration from launch models.
- Out of Scope: Launch search behavior changes; community favorites; marketplace likes.
- Dependencies: `TKT-P0-017`, `TKT-P0-035`
- Source-of-Truth References: `yoked_prd.md §11.4 CF-016, §25.2`, `yoked_ux_spec.md §26`
- Acceptance Criteria: Favorites operate as a distinct preference system without breaking existing exclude behavior; launch users can migrate cleanly into the richer model.
- Test Evidence Required: Preference migration tests; search ranking tests; UI coverage.
- Human Actions Required: None.
- Notes: This ticket exists only because the PRD explicitly defers favorites out of launch.

### TKT-P1-003 Effort and Intensity Capture with Coach Prompts
- Ticket ID: `TKT-P1-003`
- Title: `Effort and Intensity Capture with Coach Prompts`
- Kind: `kind/feature`
- Priority: `priority/p1`
- Area: `area/train`
- Phase: `P1`
- Epic: `EPIC-010`
- Covered Requirement IDs: `PRD-025`
- Objective: Add optional RPE or intensity capture to Train without slowing the core logging path.
- In Scope: Optional intensity input; coach-prompt copy; persistence; analytics event extension.
- Out of Scope: Blocking required fields; autonomous coaching.
- Dependencies: `TKT-P0-007`, `TKT-P0-039`
- Source-of-Truth References: `yoked_prd.md §11.5 CF-022, §25.2`
- Acceptance Criteria: Intensity capture stays optional and lightweight; set completion speed is not materially degraded; data persists for later analytics use.
- Test Evidence Required: Train UI tests; latency measurements; persistence tests.
- Human Actions Required: None.
- Notes: Keep the core P0 logging path intact.

### TKT-P1-004 In-Session PR Micro-Feedback
- Ticket ID: `TKT-P1-004`
- Title: `In-Session PR Micro-Feedback`
- Kind: `kind/feature`
- Priority: `priority/p1`
- Area: `area/train`
- Phase: `P1`
- Epic: `EPIC-010`
- Covered Requirement IDs: `PRD-026`
- Objective: Add lightweight PR celebration inside the active session once post-workout PR logic is stable.
- In Scope: In-session PR trigger; micro-feedback UI; dedupe rules; haptic or animation hooks.
- Out of Scope: Social sharing; achievements; large interruptive modals.
- Dependencies: `TKT-P0-010`, `TKT-P0-011`
- Source-of-Truth References: `yoked_prd.md §11.5 CF-024, §25.2`
- Acceptance Criteria: PR feedback appears only when the documented PR criteria are met and does not interrupt logging or timer continuity.
- Test Evidence Required: Trigger logic tests; interaction tests; no-duplication validation.
- Human Actions Required: None.
- Notes: This remains explicitly deferred from launch.

### TKT-P1-005 Strength and Recovery Scoring
- Ticket ID: `TKT-P1-005`
- Title: `Strength and Recovery Scoring`
- Kind: `kind/feature`
- Priority: `priority/p1`
- Area: `area/analytics`
- Phase: `P1`
- Epic: `EPIC-010`
- Covered Requirement IDs: `PRD-027`, `UX-013`
- Objective: Add explainable strength and recovery scores to the progress surface.
- In Scope: Score algorithms; confidence states; score cards; explanation copy; data-sufficiency rules.
- Out of Scope: Medical claims; automatic program changes.
- Dependencies: `TKT-P0-026`, `TKT-P0-039`
- Source-of-Truth References: `yoked_prd.md §11.6 CF-027, §25.2`, `yoked_ux_spec.md §26`
- Acceptance Criteria: Scores show only when enough data exists; low-confidence states are explicit; launch analytics remain unchanged until P1 implementation begins.
- Test Evidence Required: Algorithm tests; sparse-data state tests; UI coverage.
- Human Actions Required: None.
- Notes: This is a P1 analytical layer, not a launch KPI replacement.

### TKT-P1-006 Cross-Exercise Rankings and Broader Trend Dashboards
- Ticket ID: `TKT-P1-006`
- Title: `Cross-Exercise Rankings and Broader Trend Dashboards`
- Kind: `kind/feature`
- Priority: `priority/p1`
- Area: `area/analytics`
- Phase: `P1`
- Epic: `EPIC-010`
- Covered Requirement IDs: `PRD-028`, `UX-013`
- Objective: Expand analytics beyond exact-variation exercise detail into broader rankings and trend dashboards.
- In Scope: Trend dashboard data models; ranking views; multi-exercise comparison inputs; navigation from You Progress.
- Out of Scope: Social leaderboards; marketplace ranking crossover.
- Dependencies: `TKT-P0-019`, `TKT-P0-026`, `TKT-P0-039`
- Source-of-Truth References: `yoked_prd.md §11.6 CF-031, §25.2`, `yoked_ux_spec.md §26`
- Acceptance Criteria: Broader trends are clearly separated from launch exact-variation analytics; dashboards do not alter the P0 overview card set until enabled.
- Test Evidence Required: Projection tests; UI tests; comparison logic tests.
- Human Actions Required: None.
- Notes: Treat this as additive analytics scope, not a refactor of launch screens.

### TKT-P1-007 Achievements and Milestones
- Ticket ID: `TKT-P1-007`
- Title: `Achievements and Milestones`
- Kind: `kind/feature`
- Priority: `priority/p1`
- Area: `area/analytics`
- Phase: `P1`
- Epic: `EPIC-010`
- Covered Requirement IDs: `PRD-029`, `UX-013`
- Objective: Add an achievements layer driven by measurable completion outcomes.
- In Scope: Achievement rules; milestone cards; earned-state history; analytics events for unlocks.
- Out of Scope: Social brag posts; referral rewards.
- Dependencies: `TKT-P0-011`, `TKT-P0-039`
- Source-of-Truth References: `yoked_prd.md §11.6 CF-035, §25.2`, `yoked_ux_spec.md §26`
- Acceptance Criteria: Achievements unlock only from qualifying completion data and appear in dedicated P1 surfaces rather than launch overviews.
- Test Evidence Required: Rule tests; unlock history tests; UI coverage.
- Human Actions Required: None.
- Notes: Keep achievement storage append-only to preserve user history.

### TKT-P1-008 Streak and Continuity Metrics
- Ticket ID: `TKT-P1-008`
- Title: `Streak and Continuity Metrics`
- Kind: `kind/feature`
- Priority: `priority/p1`
- Area: `area/analytics`
- Phase: `P1`
- Epic: `EPIC-010`
- Covered Requirement IDs: `PRD-030`, `UX-013`
- Objective: Add streak tracking and continuity metrics for habit recovery.
- In Scope: Streak calculation; streak cards; recovery messaging; notification hook inputs.
- Out of Scope: Launch reminder rules; achievements duplication.
- Dependencies: `TKT-P0-031`, `TKT-P0-039`
- Source-of-Truth References: `yoked_prd.md §11.6 CF-036, §25.2`, `yoked_ux_spec.md §26`
- Acceptance Criteria: Streak logic is deterministic and transparent; missed-workout recovery messaging does not override user notification preferences.
- Test Evidence Required: Streak-rule tests; UI tests; notification-hook validation.
- Human Actions Required: None.
- Notes: This capability is deferred because launch analytics intentionally stay simpler.

### TKT-P1-009 Creator Follow Graph and Follow Surfaces
- Ticket ID: `TKT-P1-009`
- Title: `Creator Follow Graph and Follow Surfaces`
- Kind: `kind/feature`
- Priority: `priority/p1`
- Area: `area/marketplace`
- Phase: `P1`
- Epic: `EPIC-010`
- Covered Requirement IDs: `PRD-031`, `UX-013`
- Objective: Add creator follow as a one-directional marketplace relationship without social feed expansion.
- In Scope: Follow and unfollow state; follow list storage; creator detail follow CTA; creator-based browse filters if later scheduled.
- Out of Scope: Messaging; comment threads; social feed.
- Dependencies: `TKT-P0-022`, `TKT-P0-024`
- Source-of-Truth References: `yoked_prd.md §11.7 CF-039, §13.3, §25.2`, `yoked_ux_spec.md §26`
- Acceptance Criteria: Follow state appears only on P1 creator surfaces; it does not create a launch feed or social graph obligations beyond one-directional follow storage.
- Test Evidence Required: Follow-state tests; creator-profile UI tests; browse-filter tests if included.
- Human Actions Required: None.
- Notes: This ticket must remain decoupled from any social-feature expansion.

### TKT-P1-010 Theme, App Icon, and Manual Language Override Settings
- Ticket ID: `TKT-P1-010`
- Title: `Theme, App Icon, and Manual Language Override Settings`
- Kind: `kind/feature`
- Priority: `priority/p1`
- Area: `area/ios-foundation`
- Phase: `P1`
- Epic: `EPIC-010`
- Covered Requirement IDs: `PRD-032`, `ENG-013`, `UX-013`
- Objective: Add the deferred appearance and localization override settings surface.
- In Scope: Theme selection; alternate icon selection; manual language override; persisted user settings; relaunch or refresh behavior.
- Out of Scope: Launch settings; complex multi-brand theming system.
- Dependencies: `TKT-P0-030`, `TKT-P0-036`
- Source-of-Truth References: `yoked_prd.md §11.8 CF-044, §25.2`, `yoked_engineering_spec.md deferred compatibility references`, `yoked_ux_spec.md §26`
- Acceptance Criteria: New settings persist and apply as documented; the launch-only unit preference remains the only P0 visible setting until P1 implementation starts.
- Test Evidence Required: Settings persistence tests; app icon switch tests; locale override tests.
- Human Actions Required: Alternate icon assets and localization resources if adopted.
- Notes: These controls are explicitly absent from launch UI.

### TKT-P1-011 Live Activity Lock-Screen Runtime
- Ticket ID: `TKT-P1-011`
- Title: `Live Activity Lock-Screen Runtime`
- Kind: `kind/feature`
- Priority: `priority/p1`
- Area: `area/train`
- Phase: `P1`
- Epic: `EPIC-010`
- Covered Requirement IDs: `PRD-033`, `ENG-013`, `UX-013`
- Objective: Add Live Activity projection for active Train sessions as a deferred platform extension.
- In Scope: Activity lifecycle; lock-screen presentation; minimal session metadata; start, update, and stop rules.
- Out of Scope: Apple Watch; widgets; launch runtime assumptions.
- Dependencies: `TKT-P0-006`, `TKT-P0-008`, `TKT-HUM-005`
- Source-of-Truth References: `yoked_prd.md §11.9 CF-048, §25.2`, `yoked_engineering_spec.md deferred compatibility references`, `yoked_ux_spec.md §26`
- Acceptance Criteria: Live Activity reflects only the active Train session and follows platform limits; no launch code path assumes its presence.
- Test Evidence Required: Activity lifecycle tests; session-projection integration tests.
- Human Actions Required: Live Activity capability enablement.
- Notes: This feature remains deferred even though the shell may later support it cleanly.

### TKT-P1-012 CSV Export Jobs and Portability UI
- Ticket ID: `TKT-P1-012`
- Title: `CSV Export Jobs and Portability UI`
- Kind: `kind/feature`
- Priority: `priority/p1`
- Area: `area/backend`
- Phase: `P1`
- Epic: `EPIC-010`
- Covered Requirement IDs: `PRD-034`, `ENG-013`, `UX-013`
- Objective: Add asynchronous CSV export as the first real portability job after launch.
- In Scope: Export request UI; job state; completion delivery; CSV schema; server job orchestration; governance event logging.
- Out of Scope: Launch transfer guidance only; import jobs; public API.
- Dependencies: `TKT-P0-034`, `TKT-P0-036`
- Source-of-Truth References: `yoked_prd.md §11.9 CF-052, §20.2-§20.3, §25.2`, `yoked_engineering_spec.md deferred compatibility references`, `yoked_ux_spec.md §26`
- Acceptance Criteria: Export requests create visible asynchronous jobs; exported data reflects the documented portability scope; the P0 unavailable-state guidance is replaced only when this ticket is implemented.
- Test Evidence Required: Export job tests; CSV schema validation; UI progress-state tests.
- Human Actions Required: Data-retention and export-policy review if required by release process.
- Notes: This is a governance feature, not a launch blocker.

### TKT-P1-013 Personal Coach and Trainer Recommendation Surfaces
- Ticket ID: `TKT-P1-013`
- Title: `Personal Coach and Trainer Recommendation Surfaces`
- Kind: `kind/feature`
- Priority: `priority/p1`
- Area: `area/analytics`
- Phase: `P1`
- Epic: `EPIC-010`
- Covered Requirement IDs: `PRD-035`, `UX-013`
- Objective: Add explainable coach or trainer recommendations as a P1 product extension.
- In Scope: Recommendation cards; explanation metadata; opt-in data use; coach-entry navigation.
- Out of Scope: Chatbot assistant; automatic program rewrites; medical advice.
- Dependencies: `TKT-P1-005`, `TKT-P1-006`
- Source-of-Truth References: `yoked_prd.md §11.10 CF-053, §25.2`, `yoked_ux_spec.md §26`
- Acceptance Criteria: Recommendations explain why they appear and what input data they rely on; no launch overview surface reserves dormant space for them.
- Test Evidence Required: Recommendation rule tests; UI state tests; explanation metadata validation.
- Human Actions Required: None.
- Notes: This ticket exists because the PRD explicitly names coach or trainer surfaces as post-launch scope.

## P2 Ticket Inventory

### TKT-P2-001 Referral and Free-Pass Growth Loops
- Ticket ID: `TKT-P2-001`
- Title: `Referral and Free-Pass Growth Loops`
- Kind: `kind/feature`
- Priority: `priority/p2`
- Area: `area/release`
- Phase: `P2`
- Epic: `EPIC-011`
- Covered Requirement IDs: `PRD-036`
- Objective: Add referrals and free-pass style growth loops only after the core product proves value.
- In Scope: Referral code generation; free-pass eligibility; landing and redemption flows; growth analytics.
- Out of Scope: Launch paywall changes; social invite feeds.
- Dependencies: `TKT-P1-001`, `TKT-P0-039`
- Source-of-Truth References: `yoked_prd.md §11.2 CF-010, §25.3`
- Acceptance Criteria: Referral surfaces remain outside launch-critical roots and do not distort core monetization rules until P2 is scheduled.
- Test Evidence Required: Referral rule tests; redemption flow tests.
- Human Actions Required: Billing and campaign setup if adopted.
- Notes: This remains intentionally absent from launch and P1.

### TKT-P2-002 Voice Assistant Train Intents
- Ticket ID: `TKT-P2-002`
- Title: `Voice Assistant Train Intents`
- Kind: `kind/feature`
- Priority: `priority/p2`
- Area: `area/train`
- Phase: `P2`
- Epic: `EPIC-011`
- Covered Requirement IDs: `PRD-037`, `UX-014`
- Objective: Add explicit voice assistant commands for Train workflows.
- In Scope: Supported voice intents; session-safe execution rules; confirmation responses; privacy guardrails.
- Out of Scope: General-purpose assistant chat; launch onboarding dependency.
- Dependencies: `TKT-P0-006`, `TKT-P0-007`
- Source-of-Truth References: `yoked_prd.md §11.9 CF-049, §25.3`, `yoked_ux_spec.md §26`
- Acceptance Criteria: Voice commands map only to approved Train actions and never become required for core usage; no P0 or P1 surface assumes voice support.
- Test Evidence Required: Intent handler tests; Train safety-rule tests.
- Human Actions Required: Platform-intent approval if required.
- Notes: This ticket is deferred because launch must work fully without voice.

### TKT-P2-003 Strava Integration
- Ticket ID: `TKT-P2-003`
- Title: `Strava Integration`
- Kind: `kind/feature`
- Priority: `priority/p2`
- Area: `area/health`
- Phase: `P2`
- Epic: `EPIC-011`
- Covered Requirement IDs: `PRD-038`, `UX-014`
- Objective: Add Strava as a post-launch integration without altering the Apple-Health-only launch contract.
- In Scope: Strava connect and disconnect flow; sync-status surface; data mapping; retry states.
- Out of Scope: Launch integrations screen; Apple Health behavior changes.
- Dependencies: `TKT-P0-032`
- Source-of-Truth References: `yoked_prd.md §11.9 CF-050, §18.2, §25.3`, `yoked_ux_spec.md §26`
- Acceptance Criteria: Strava rows and sync states appear only when this ticket is intentionally implemented; launch settings remain unchanged until then.
- Test Evidence Required: OAuth flow tests; mapping tests; integration-state tests.
- Human Actions Required: Strava partner and OAuth setup.
- Notes: Treat provider-specific rules as separate from Apple Health.

### TKT-P2-004 Fitbit Integration
- Ticket ID: `TKT-P2-004`
- Title: `Fitbit Integration`
- Kind: `kind/feature`
- Priority: `priority/p2`
- Area: `area/health`
- Phase: `P2`
- Epic: `EPIC-011`
- Covered Requirement IDs: `PRD-038`, `UX-014`
- Objective: Add Fitbit as a separate post-launch integration stream.
- In Scope: Fitbit connect and disconnect flow; sync-status UI; payload mapping; retry and revoke handling.
- Out of Scope: Launch settings; Apple Health contract changes.
- Dependencies: `TKT-P0-032`
- Source-of-Truth References: `yoked_prd.md §11.9 CF-050, §18.2, §25.3`, `yoked_ux_spec.md §26`
- Acceptance Criteria: Fitbit is isolated as a separate provider with dedicated states; launch users do not see dormant Fitbit rows.
- Test Evidence Required: OAuth flow tests; provider-state tests; mapping validation.
- Human Actions Required: Fitbit partner and OAuth setup.
- Notes: This remains P2 because only Apple Health is authorized for launch.

### TKT-P2-005 Apple Watch Runtime and Companion Architecture
- Ticket ID: `TKT-P2-005`
- Title: `Apple Watch Runtime and Companion Architecture`
- Kind: `kind/feature`
- Priority: `priority/p2`
- Area: `area/health`
- Phase: `P2`
- Epic: `EPIC-011`
- Covered Requirement IDs: `PRD-038`, `ENG-014`, `UX-014`
- Objective: Implement the Apple Watch runtime only after the dedicated watch architecture addendum is complete.
- In Scope: Watch companion target; session-authority rules; data transport; watch UI shell; handoff to iPhone source of truth.
- Out of Scope: P0 Train execution; Live Activity; launch sync contracts.
- Dependencies: `ENG-014` design completion, `TKT-P0-037`
- Source-of-Truth References: `yoked_prd.md §11.9 CF-050, §25.3`, `yoked_engineering_spec.md §10.2`, `yoked_ux_spec.md §26`
- Acceptance Criteria: Watch execution follows the documented session-authority rules and remains fully absent from launch code paths until P2 delivery is scheduled.
- Test Evidence Required: Companion integration tests; transport reliability tests; watch-to-phone authority tests.
- Human Actions Required: Apple Watch capabilities and provisioning.
- Notes: No watch placeholders or launch-target assumptions are allowed before this ticket.

### TKT-P2-006 Data Import Flows and Mapping Engine
- Ticket ID: `TKT-P2-006`
- Title: `Data Import Flows and Mapping Engine`
- Kind: `kind/feature`
- Priority: `priority/p2`
- Area: `area/backend`
- Phase: `P2`
- Epic: `EPIC-011`
- Covered Requirement IDs: `PRD-039`, `ENG-015`, `UX-014`
- Objective: Add user-facing import flows for third-party data once portability scope expands beyond launch guidance.
- In Scope: Import request UI; staging and validation; mapping engine; import review state; failure reporting.
- Out of Scope: Launch transfer guidance; CSV export-only flows; public API key issuance.
- Dependencies: `TKT-P2-007`, `TKT-P0-034`
- Source-of-Truth References: `yoked_prd.md §11.9 CF-052, §25.3`, `yoked_engineering_spec.md P2-only governance/import contracts`, `yoked_ux_spec.md §26`
- Acceptance Criteria: Imports run through a reviewable validation path; launch surfaces remain unchanged until this P2 work is scheduled.
- Test Evidence Required: Mapping tests; import-validation tests; failure-state UI tests.
- Human Actions Required: Provider-specific approvals if source systems are integrated.
- Notes: Import is explicitly deferred and must not leak into launch governance UI.

### TKT-P2-007 Public API and External Integration Intake
- Ticket ID: `TKT-P2-007`
- Title: `Public API and External Integration Intake`
- Kind: `kind/feature`
- Priority: `priority/p2`
- Area: `area/backend`
- Phase: `P2`
- Epic: `EPIC-011`
- Covered Requirement IDs: `PRD-039`, `ENG-015`, `UX-014`
- Objective: Add a governed public API and external integration intake process after launch stability is proven.
- In Scope: Public API boundary definition; intake form or request path; auth model; rate limiting; governance review state.
- Out of Scope: Internal launch APIs; direct partner-only shortcuts without governance.
- Dependencies: `TKT-P0-036`, `TKT-P2-006`
- Source-of-Truth References: `yoked_prd.md §11.9 CF-052, §25.3`, `yoked_engineering_spec.md P2-only endpoint contracts`, `yoked_ux_spec.md §26`
- Acceptance Criteria: External access is governed and isolated from internal launch APIs; no launch settings or support screen exposes dormant public API controls.
- Test Evidence Required: API boundary tests; auth and rate-limit tests; intake-flow validation.
- Human Actions Required: Legal and partner review if public API is exposed.
- Notes: Treat this as a separate platform program, not a quick extension of P0 endpoints.

### TKT-P2-008 iPad and AirPlay or TV Casting Expansion
- Ticket ID: `TKT-P2-008`
- Title: `iPad and AirPlay or TV Casting Expansion`
- Kind: `kind/feature`
- Priority: `priority/p2`
- Area: `area/ios-foundation`
- Phase: `P2`
- Epic: `EPIC-011`
- Covered Requirement IDs: `PRD-040`, `ENG-015`, `UX-014`
- Objective: Expand Yoked beyond iPhone-only launch to iPad and optional AirPlay or TV casting experiences.
- In Scope: Larger-screen layout strategy; iPad navigation reconsideration; casting surface review; platform-specific QA plans.
- Out of Scope: Launch layout assumptions; watchOS; Android.
- Dependencies: Stable P0 iPhone product and separate design review.
- Source-of-Truth References: `yoked_prd.md §18.5, §25.3`, `yoked_engineering_spec.md deferred platform contracts`, `yoked_ux_spec.md §2, §26`
- Acceptance Criteria: Expanded layouts do not back-port constraints into the iPhone-only launch implementation; launch acceptance criteria remain phone-specific until this ticket is actively delivered.
- Test Evidence Required: Responsive-layout tests; casting validation if included; platform QA checklist.
- Human Actions Required: Platform release planning decisions.
- Notes: This stays explicitly outside launch and P1.

### TKT-P2-009 Exercise Visuals and Media-Pack Pipeline
- Ticket ID: `TKT-P2-009`
- Title: `Exercise Visuals and Media-Pack Pipeline`
- Kind: `kind/feature`
- Priority: `priority/p2`
- Area: `area/catalog`
- Phase: `P2`
- Epic: `EPIC-011`
- Covered Requirement IDs: `PRD-041`, `UX-014`
- Objective: Add future exercise visuals and premium media-pack support without weakening the text-first launch catalog.
- In Scope: Media asset model; media-pack entitlement handling; exercise-detail media rendering; pipeline extensions to the catalog toolchain.
- Out of Scope: Launch text-first layouts; placeholder imagery; third-party media bundles without governance.
- Dependencies: `TKT-P0-016`, `TKT-P0-019`
- Source-of-Truth References: `yoked_prd.md §11.4.1, §17.2.1, §26`, `yoked_ux_spec.md §26`
- Acceptance Criteria: Exercise media appears only when the supporting catalog and entitlement pipeline exist; launch screens remain fully functional with no media assumptions before P2 delivery.
- Test Evidence Required: Media-pipeline tests; entitlement tests; exercise-detail UI tests with and without media.
- Human Actions Required: Media licensing and asset-production decisions if adopted.
- Notes: This ticket is explicitly downstream of the launch no-media rule.

## Human-Action Ticket Inventory

### TKT-HUM-001 GitHub Projects Auto-Add Workflows and Status Defaults in GitHub UI
- Ticket ID: `TKT-HUM-001`
- Title: `GitHub Projects Auto-Add Workflows and Status Defaults in GitHub UI`
- Kind: `kind/human-action`
- Priority: `priority/p0`
- Area: `area/repo-ops`
- Phase: `P0`
- Epic: `EPIC-009`
- Covered Requirement IDs: `AGT-005`, `CDX-001`, `CDX-002`
- Objective: Configure the documented GitHub Project automation that cannot be safely created from repo files alone.
- In Scope: Auto-add filters; default-status routing; project-field defaults; GitHub UI verification.
- Out of Scope: Repo file edits; speculative workflow automation outside documented UI capabilities.
- Dependencies: `TKT-OPS-002`
- Source-of-Truth References: `AGENTS.md Human-Gated Tasks`, `docs/codex/setup.md GitHub Project Automation`
- Acceptance Criteria: New issues with the documented label combinations land in the correct project views and initial status columns.
- Test Evidence Required: Screenshot or screen-recording evidence of project automation behavior.
- Human Actions Required: GitHub maintainer access.
- Notes: This is deliberately a human-action ticket because the setup is UI-driven.

### TKT-HUM-002 GitHub Branch Protection, Required Checks, and No-Direct-Push Settings
- Ticket ID: `TKT-HUM-002`
- Title: `GitHub Branch Protection, Required Checks, and No-Direct-Push Settings`
- Kind: `kind/human-action`
- Priority: `priority/p0`
- Area: `area/repo-ops`
- Phase: `P0`
- Epic: `EPIC-009`
- Covered Requirement IDs: `AGT-005`, `CON-001`
- Objective: Apply repository protection settings that enforce the documented contribution rules.
- In Scope: Protected default branch; required review counts; required checks; no-direct-push settings; merge policy review.
- Out of Scope: Changing contribution policy text without repo review.
- Dependencies: `TKT-OPS-003`
- Source-of-Truth References: `AGENTS.md Human-Gated Tasks`, `CONTRIBUTING.md`
- Acceptance Criteria: The repo blocks unreviewed direct pushes and enforces the documented minimum checks before merge.
- Test Evidence Required: Screenshot evidence of branch protection settings.
- Human Actions Required: GitHub admin access.
- Notes: This ticket closes the loop between policy docs and actual repo enforcement.

### TKT-HUM-003 Provision Supabase Staging Project, Secrets, and Service Credentials
- Ticket ID: `TKT-HUM-003`
- Title: `Provision Supabase Staging Project, Secrets, and Service Credentials`
- Kind: `kind/human-action`
- Priority: `priority/p0`
- Area: `area/backend`
- Phase: `P0`
- Epic: `EPIC-008`
- Covered Requirement IDs: `AGT-003`, `AGT-008`, `CDX-003`
- Objective: Create the staging backend environment and distribute the approved credentials required by implementation tickets.
- In Scope: Staging project creation; service-role and anon key distribution; environment naming; secret handoff through approved channels.
- Out of Scope: Production environment creation; hard-coding secrets into the repo.
- Dependencies: `TKT-OPS-004`
- Source-of-Truth References: `AGENTS.md Repository Change Rules, Human-Gated Tasks`, `docs/codex/setup.md Connectors and MCP Priority`
- Acceptance Criteria: A staging environment exists, the required secrets are available to maintainers through approved channels, and no secret values are committed to Git.
- Test Evidence Required: Secret placeholders filled in local untracked config and successful staging connectivity proof.
- Human Actions Required: Supabase owner access.
- Notes: Use staging before any production environment.

### TKT-HUM-004 Configure Apple Sign In, Google OAuth, App Store Connect Products, and App Store Server Notifications
- Ticket ID: `TKT-HUM-004`
- Title: `Configure Apple Sign In, Google OAuth, App Store Connect Products, and App Store Server Notifications`
- Kind: `kind/human-action`
- Priority: `priority/p0`
- Area: `area/backend`
- Phase: `P0`
- Epic: `EPIC-007`
- Covered Requirement IDs: `AGT-006`, `AGT-007`
- Objective: Complete the external console work required for auth and billing to function.
- In Scope: Apple Sign In app registration; Google OAuth app registration; subscription product creation; App Store Server Notifications setup.
- Out of Scope: In-repo auth code changes; subscription copy rewrites beyond console metadata.
- Dependencies: `TKT-P0-002`, `TKT-P0-004`
- Source-of-Truth References: `AGENTS.md Human-Gated Tasks`
- Acceptance Criteria: Auth providers and StoreKit products are configured, callback URLs match implementation, and billing server notifications reach the configured environment.
- Test Evidence Required: Console screenshots and successful end-to-end sandbox purchase or provider-login proof.
- Human Actions Required: Apple Developer, Google Cloud, and App Store Connect access.
- Notes: This is a prerequisite for full launch auth and billing validation.

### TKT-HUM-005 Configure APNs and HealthKit Capabilities and Entitlements
- Ticket ID: `TKT-HUM-005`
- Title: `Configure APNs and HealthKit Capabilities and Entitlements`
- Kind: `kind/human-action`
- Priority: `priority/p0`
- Area: `area/health`
- Phase: `P0`
- Epic: `EPIC-007`
- Covered Requirement IDs: `AGT-009`
- Objective: Enable the platform capabilities required by launch notifications and Apple Health integration.
- In Scope: Push capability; APNs token setup; HealthKit capability; entitlement review; provisioning refresh.
- Out of Scope: Strava or Fitbit partner setup; Apple Watch capability.
- Dependencies: `TKT-P0-031`, `TKT-P0-032`
- Source-of-Truth References: `AGENTS.md Human-Gated Tasks`
- Acceptance Criteria: Notification and HealthKit capabilities are enabled for the app target and verified against the bundle identifiers used by the project.
- Test Evidence Required: Capability screenshots and successful local entitlement validation.
- Human Actions Required: Apple Developer access.
- Notes: This is a hard blocker for end-to-end notification and HealthKit testing.

### TKT-HUM-006 Create AdMob App, Banner Units, and Contextual-Ad Policy Settings
- Ticket ID: `TKT-HUM-006`
- Title: `Create AdMob App, Banner Units, and Contextual-Ad Policy Settings`
- Kind: `kind/human-action`
- Priority: `priority/p0`
- Area: `area/release`
- Phase: `P0`
- Epic: `EPIC-012`
- Covered Requirement IDs: `AGT-009`
- Objective: Provision the AdMob resources required by the launch banner-ad plan.
- In Scope: AdMob app registration; banner unit creation; test-device setup; policy review for contextual placements.
- Out of Scope: Interstitial or rewarded inventory.
- Dependencies: `TKT-P0-040`
- Source-of-Truth References: `AGENTS.md Human-Gated Tasks`
- Acceptance Criteria: Banner unit IDs exist for the approved environments and policy review confirms only launch-approved placements will be used.
- Test Evidence Required: AdMob console screenshots and successful test-banner proof.
- Human Actions Required: AdMob account access.
- Notes: Keep policy sign-off attached to this ticket because ad misuse is a release blocker.

### TKT-HUM-007 Resolve Repo, Team, and Environment Placeholders and Assign Exact Owners
- Ticket ID: `TKT-HUM-007`
- Title: `Resolve Repo, Team, and Environment Placeholders and Assign Exact Owners`
- Kind: `kind/human-action`
- Priority: `priority/p0`
- Area: `area/repo-ops`
- Phase: `P0`
- Epic: `EPIC-009`
- Covered Requirement IDs: `AGT-010`, `CDX-003`
- Objective: Replace every documented placeholder that cannot be safely inferred from local repo context.
- In Scope: GitHub usernames; team slugs; repo URLs; environment IDs; connector-account ownership mapping.
- Out of Scope: Guessing placeholder values in code or docs without human confirmation.
- Dependencies: `TKT-OPS-002`, `TKT-OPS-004`
- Source-of-Truth References: `AGENTS.md Escalation Rule`, `docs/codex/setup.md`
- Acceptance Criteria: All placeholders blocking issue creation, CI setup, or environment configuration have an explicit confirmed value and owner.
- Test Evidence Required: Updated issue pack or config examples referencing the resolved values.
- Human Actions Required: Maintainer confirmation.
- Notes: This ticket prevents silent assumptions from leaking into implementation work.

### TKT-HUM-008 App Store Privacy Declarations, Billing Metadata, and Release-Console Setup
- Ticket ID: `TKT-HUM-008`
- Title: `App Store Privacy Declarations, Billing Metadata, and Release-Console Setup`
- Kind: `kind/human-action`
- Priority: `priority/p0`
- Area: `area/release`
- Phase: `P0`
- Epic: `EPIC-012`
- Covered Requirement IDs: `AGT-006`
- Objective: Complete the release-console tasks needed before App Store submission.
- In Scope: Privacy nutrition labels; subscription metadata review; app release settings; screenshots and compliance placeholders; release train setup.
- Out of Scope: In-repo privacy copy generation; production rollout execution itself.
- Dependencies: `TKT-QA-006`
- Source-of-Truth References: `AGENTS.md Human-Gated Tasks`
- Acceptance Criteria: Required App Store submission metadata exists and is consistent with the implemented launch feature set and permissions.
- Test Evidence Required: App Store Connect screenshots and release-checklist sign-off.
- Human Actions Required: App Store Connect access.
- Notes: This ticket should close only after the final release checklist is green.

## Repo / CI / Tooling Ticket Inventory

### TKT-OPS-001 App, Backend, and Workspace Scaffold per Engineering Repo Structure
- Ticket ID: `TKT-OPS-001`
- Title: `App, Backend, and Workspace Scaffold per Engineering Repo Structure`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/repo-ops`
- Phase: `P0`
- Epic: `EPIC-009`
- Covered Requirement IDs: `ENG-004`, `ENG-005`, `AGT-003`, `RDM-001`
- Objective: Create the implementation scaffold implied by the engineering spec without restructuring the numbered top-level directories.
- In Scope: `ios/` app scaffold; backend or migrations scaffold; test-target placeholders; documented workspace layout; additive directory creation only.
- Out of Scope: Large-scale product implementation; moving existing numbered folders.
- Dependencies: None.
- Source-of-Truth References: `README.md`, `AGENTS.md Repository Change Rules`, `yoked_engineering_spec.md §2-§3`
- Acceptance Criteria: The repo contains the expected additive implementation directories and target placeholders while preserving existing spec directories and documentation.
- Test Evidence Required: Tree listing validation and project-file or workspace sanity checks.
- Human Actions Required: None.
- Notes: This is the structural starting point for subsequent implementation tickets.

### TKT-OPS-002 Issue Forms, Label Taxonomy, PR Template, and Workflow Docs Alignment with Backlog Pack
- Ticket ID: `TKT-OPS-002`
- Title: `Issue Forms, Label Taxonomy, PR Template, and Workflow Docs Alignment with Backlog Pack`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/repo-ops`
- Phase: `P0`
- Epic: `EPIC-009`
- Covered Requirement IDs: `MAN-001`, `AGT-001`, `AGT-002`, `CON-001`, `TPL-001`, `LBL-001`
- Objective: Align repo workflow metadata with the closed-loop roadmap so future issue creation follows the documented discipline.
- In Scope: Issue template verification; PR template verification; label taxonomy alignment; workflow doc updates; source-of-truth citation expectations; issue-first reminders.
- Out of Scope: GitHub UI settings that require admin clicks.
- Dependencies: None.
- Source-of-Truth References: `AGENTS.md`, `CONTRIBUTING.md`, `.github/ISSUE_TEMPLATE/*.yml`, `.github/PULL_REQUEST_TEMPLATE.md`, `.github/labels.yml`
- Acceptance Criteria: The issue forms and PR template can represent the tickets in this backlog pack without missing fields, and the docs reflect the same workflow rules.
- Test Evidence Required: YAML syntax validation; template field coverage check; sample issue-body dry run.
- Human Actions Required: `TKT-HUM-001` and `TKT-HUM-002` for GitHub UI settings.
- Notes: This ticket is the workflow bridge between the planning package and real issue creation.

### TKT-OPS-003 CI and Check Scaffolding for Docs, Schema, and Test-Evidence Enforcement
- Ticket ID: `TKT-OPS-003`
- Title: `CI and Check Scaffolding for Docs, Schema, and Test-Evidence Enforcement`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/repo-ops`
- Phase: `P0`
- Epic: `EPIC-009`
- Covered Requirement IDs: `AGT-004`
- Objective: Add automated checks that enforce the repo validation expectations documented in the workflow files.
- In Scope: Markdown lint or link validation as appropriate; workflow syntax validation; schema check stubs; test-evidence reminder checks; PR gating documentation.
- Out of Scope: Product UI tests themselves; GitHub admin settings.
- Dependencies: `TKT-OPS-001`, `TKT-OPS-002`
- Source-of-Truth References: `AGENTS.md Testing and Validation Rules`
- Acceptance Criteria: CI runs the documented repo checks and makes it difficult to merge workflow or docs changes without basic validation evidence.
- Test Evidence Required: Successful workflow runs and failing-sample demonstrations where practical.
- Human Actions Required: Branch protection in `TKT-HUM-002`.
- Notes: Keep the first version lean but aligned with the workflow contract.

### TKT-OPS-004 Config and Environment Scaffolding with Staging-First Separation and Secret-Safe Examples
- Ticket ID: `TKT-OPS-004`
- Title: `Config and Environment Scaffolding with Staging-First Separation and Secret-Safe Examples`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/repo-ops`
- Phase: `P0`
- Epic: `EPIC-009`
- Covered Requirement IDs: `AGT-003`, `CDX-001`
- Objective: Create tracked example configs and environment-loading conventions that keep secrets and local Codex state out of Git.
- In Scope: Example env files; staging-vs-production config separation; secret-loading documentation; local config ignore rules; connector guidance references.
- Out of Scope: Real secret values; personal machine paths committed to repo.
- Dependencies: `TKT-OPS-001`, `TKT-HUM-003`, `TKT-HUM-007`
- Source-of-Truth References: `AGENTS.md Repository Change Rules`, `docs/codex/setup.md`
- Acceptance Criteria: Developers can understand how to run against staging using tracked examples only; no committed file requires secret values to be present in Git.
- Test Evidence Required: Example-config validation; startup sanity checks using placeholder values where possible.
- Human Actions Required: Environment secret provisioning and placeholder resolution.
- Notes: This ticket is a prerequisite for safe backend and auth work.

### TKT-OPS-005 Catalog Tooling Commands and Codex Workflow Bootstrap Docs
- Ticket ID: `TKT-OPS-005`
- Title: `Catalog Tooling Commands and Codex Workflow Bootstrap Docs`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/repo-ops`
- Phase: `P0`
- Epic: `EPIC-009`
- Covered Requirement IDs: `CDX-001`
- Objective: Document the local commands and repo conventions needed to operate catalog tooling and approved local workflows.
- In Scope: Catalog ingest command docs; bootstrap instructions; local workflow sequencing; connector priority references; tool prerequisites.
- Out of Scope: Private machine-specific setup steps that do not belong in the repo.
- Dependencies: `TKT-P0-016`, `TKT-OPS-004`
- Source-of-Truth References: `docs/codex/setup.md`, `README.md`
- Acceptance Criteria: A maintainer can follow the repo docs to run catalog tooling and the documented local workflow without needing hidden context from prior contributors.
- Test Evidence Required: Doc-link validation and one dry-run of the documented command sequence.
- Human Actions Required: None.
- Notes: Keep this documentation additive and repo-safe.

## QA / Validation / Release Ticket Inventory

### TKT-QA-001 Navigation, Route-Ownership, Modal Inventory, and Launch UX Acceptance Suite
- Ticket ID: `TKT-QA-001`
- Title: `Navigation, Route-Ownership, Modal Inventory, and Launch UX Acceptance Suite`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/release`
- Phase: `P0`
- Epic: `EPIC-012`
- Covered Requirement IDs: `PRD-001`, `PRD-003`, `UX-001`, `UX-012`, `PRD-042`, `PRD-043`, `ENG-017`, `UX-015`
- Objective: Validate the launch shell, route ownership, modal inventory, and explicit absence of deferred controls from the UX layer.
- In Scope: Five-tab order; Home non-execution; Train route ownership; modal and sheet inventory; creator profile and load-helper sheets; deferred-control absence checks.
- Out of Scope: Deep backend performance tuning; post-launch features.
- Dependencies: `TKT-P0-001` through `TKT-P0-015`, `TKT-P0-022`, `TKT-P0-025`
- Source-of-Truth References: `yoked_prd.md §27`, `yoked_ux_spec.md §2-§6, §20-§26`, `yoked_engineering_spec.md §2.3`
- Acceptance Criteria: UX behavior matches the spec across roots, drill-downs, and modal transitions, and no deferred feature affordance appears in launch UI.
- Test Evidence Required: UI regression suite; route-ownership checklist; screenshot evidence per root surface.
- Human Actions Required: None.
- Notes: This is the primary UX gate for launch scope compliance.

### TKT-QA-002 Train Local-First, Offline, and Sync-Recovery Validation Suite
- Ticket ID: `TKT-QA-002`
- Title: `Train Local-First, Offline, and Sync-Recovery Validation Suite`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/release`
- Phase: `P0`
- Epic: `EPIC-012`
- Covered Requirement IDs: `ENG-007`, `PRD-043`, `ENG-017`
- Objective: Validate that active sessions, local completion, and sync recovery satisfy the launch reliability contract.
- In Scope: Offline start and completion; background and foreground recovery; conflict resolution; queue replay; no-data-loss checks.
- Out of Scope: P1 Live Activity or Apple Watch behavior.
- Dependencies: `TKT-P0-006` through `TKT-P0-011`, `TKT-P0-037`
- Source-of-Truth References: `yoked_prd.md §27`, `yoked_engineering_spec.md §4.2-§4.7, §6, §2.3`
- Acceptance Criteria: Train remains functional offline, recovery paths restore the correct active session, and sync replay never duplicates or loses logged sets.
- Test Evidence Required: Device or simulator offline test logs; background-recovery recordings; sync-conflict evidence.
- Human Actions Required: None.
- Notes: This is one of the highest-risk launch validation suites.

### TKT-QA-003 Monetization, Slot-Cap, Paywall, and Ad-Boundary Validation Suite
- Ticket ID: `TKT-QA-003`
- Title: `Monetization, Slot-Cap, Paywall, and Ad-Boundary Validation Suite`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/release`
- Phase: `P0`
- Epic: `EPIC-012`
- Covered Requirement IDs: `PRD-022`, `PRD-042`, `PRD-043`, `ENG-017`, `UX-015`
- Objective: Validate that monetization boundaries, entitlement updates, routine slot caps, and ad placements behave exactly as specified.
- In Scope: Free and premium states; starter-plan free rules; program paywall gating; five-routine cap; banner allowlist; premium ad suppression; restore behavior.
- Out of Scope: P1 promotions; P2 referrals.
- Dependencies: `TKT-P0-004`, `TKT-P0-005`, `TKT-P0-012`, `TKT-P0-021`, `TKT-P0-040`
- Source-of-Truth References: `yoked_prd.md §17, §26-§27`, `yoked_engineering_spec.md §1.9-§1.10, §2.3`, `yoked_ux_spec.md §9, §10, §12, §17, §25-§26`
- Acceptance Criteria: Every premium gate and ad boundary matches the documented launch rules, and no ad appears on a forbidden surface or for a premium user.
- Test Evidence Required: StoreKit sandbox evidence; entitlement transition logs; banner placement screenshots; slot-cap scenario matrix.
- Human Actions Required: Billing and AdMob console setup completed.
- Notes: Treat any boundary violation as launch-blocking.

### TKT-QA-004 Exercise Search, Custom Exercise, Builder Publish, and No-Media Validation Suite
- Ticket ID: `TKT-QA-004`
- Title: `Exercise Search, Custom Exercise, Builder Publish, and No-Media Validation Suite`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/release`
- Phase: `P0`
- Epic: `EPIC-012`
- Covered Requirement IDs: `PRD-042`, `ENG-017`, `UX-015`
- Objective: Validate the exercise-system contract across catalog, custom authoring, builder integration, and the launch no-media rule.
- In Scope: Search latency; similar exercises; custom exercise privacy; publish eligibility; no-media screen states; deterministic catalog content checks.
- Out of Scope: Future media packs; favorites.
- Dependencies: `TKT-P0-013` through `TKT-P0-019`
- Source-of-Truth References: `yoked_prd.md §11.4.1, §11.4, §26`, `yoked_engineering_spec.md §3.4-§3.7, §2.3`, `yoked_ux_spec.md §15-§16, §25-§26`
- Acceptance Criteria: Exercise surfaces show only text-first launch content, custom exercises never leak into marketplace publishing, and builder publish gating respects the documented rules.
- Test Evidence Required: Catalog validation output; search performance tests; builder publish state evidence.
- Human Actions Required: None.
- Notes: This suite protects a large amount of subtle launch scope.

### TKT-QA-005 Marketplace, Creator, Rating, Ranking, and Moderation Validation Suite
- Ticket ID: `TKT-QA-005`
- Title: `Marketplace, Creator, Rating, Ranking, and Moderation Validation Suite`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/release`
- Phase: `P0`
- Epic: `EPIC-012`
- Covered Requirement IDs: `PRD-042`, `PRD-043`, `ENG-017`, `UX-015`
- Objective: Validate that Explore, creator profile detail, ratings, ranking, and moderation behavior satisfy trust and scope rules.
- In Scope: Browse ordering; creator credibility tiers; rating eligibility; blocked creator suppression; no-follow and no-comment launch state.
- Out of Scope: P1 creator follow; social feed.
- Dependencies: `TKT-P0-020` through `TKT-P0-024`
- Source-of-Truth References: `yoked_prd.md §11.7, §12-§13, §26-§27`, `yoked_engineering_spec.md §8, §2.3`, `yoked_ux_spec.md §13, §17-§18, §25-§26`
- Acceptance Criteria: Marketplace behavior matches the trust and ranking contract, and all deferred creator-social capabilities remain absent from launch surfaces.
- Test Evidence Required: Ranking evidence; moderation suppression tests; rating-flow UI tests; creator-profile screenshot matrix.
- Human Actions Required: None.
- Notes: This suite protects marketplace credibility before launch.

### TKT-QA-006 Security, Notifications, HealthKit, Performance Budgets, Analytics Integrity, and GA Release Checklist
- Ticket ID: `TKT-QA-006`
- Title: `Security, Notifications, HealthKit, Performance Budgets, Analytics Integrity, and GA Release Checklist`
- Kind: `kind/feature`
- Priority: `priority/p0`
- Area: `area/release`
- Phase: `P0`
- Epic: `EPIC-012`
- Covered Requirement IDs: `MAN-001`, `AGT-001`, `PRD-022`, `PRD-042`, `PRD-043`, `ENG-012`, `ENG-016`, `ENG-017`, `AGT-004`, `CON-002`
- Objective: Execute the final nonfunctional and release-process validation program and record sign-off evidence.
- In Scope: Security checklist; permission audit; notification delivery verification; HealthKit sync verification; performance budgets; analytics-integrity audit; reviewer checklist; release evidence package.
- Out of Scope: P1 or P2 release readiness.
- Dependencies: All P0 implementation tickets, `TKT-HUM-005`, `TKT-HUM-006`, `TKT-HUM-008`
- Source-of-Truth References: `source_of_truth_manifest.md`, `AGENTS.md`, `CONTRIBUTING.md`, `yoked_prd.md §21-§28`, `yoked_engineering_spec.md §11-§13`, `yoked_ux_spec.md §25-§26`
- Acceptance Criteria: The launch package includes proof of security posture, performance within budget, analytics event integrity, and documented reviewer sign-off with no unresolved launch-versus-deferred contradiction.
- Test Evidence Required: Security audit output; performance traces; analytics integrity logs; consolidated release checklist.
- Human Actions Required: Final App Store and console verification steps.
- Notes: This is the final gate before direct GitHub issue creation can turn into launch execution.

## Dependency Graph

1. `TKT-OPS-001` is the structural prerequisite for `TKT-P0-001`, `TKT-P0-035`, and all tickets that assume app or backend modules exist.
2. `TKT-OPS-002` is the workflow prerequisite for issue creation quality and must land before high-volume ticket execution.
3. `TKT-OPS-004` and `TKT-HUM-003` are the environment prerequisites for `TKT-P0-036` and `TKT-P0-037`.
4. `TKT-P0-035` is the local-data prerequisite for nearly every product surface and directly gates `TKT-P0-003`, `TKT-P0-006`, `TKT-P0-012`, `TKT-P0-017`, `TKT-P0-026`, `TKT-P0-029`, and `TKT-P0-038`.
5. `TKT-P0-036` and `TKT-P0-037` are the backend and sync prerequisites for billing state, marketplace state, support, governance, and release validation.
6. `TKT-P0-001`, `TKT-P0-002`, `TKT-P0-003`, and `TKT-P0-004` form the shell-to-onboarding-to-paywall chain.
7. `TKT-P0-006` through `TKT-P0-011` form the Train runtime chain and must be executed in order because entry, logging, timer recovery, load helper, PR logic, and completion integrity build on each other.
8. `TKT-P0-012` through `TKT-P0-015` form the My Workouts and builder chain and depend on search (`TKT-P0-017`) plus AI generation (`TKT-P0-038`) where applicable.
9. `TKT-P0-016` through `TKT-P0-019` form the exercise-system chain and should stabilize before builder and analytics QA.
10. `TKT-P0-020` through `TKT-P0-024` form the Explore and creator-trust chain and depend on backend ranking plus entitlement state.
11. `TKT-P0-025` through `TKT-P0-029` depend on analytics materialization from `TKT-P0-039`.
12. `TKT-P0-031`, `TKT-P0-032`, and `TKT-P0-040` are blocked by `TKT-HUM-005` and `TKT-HUM-006` for end-to-end validation.
13. `TKT-QA-001` through `TKT-QA-006` depend on the relevant P0 feature tickets and should be opened early but closed last.
14. `EPIC-010` work begins only after `EPIC-001` through `EPIC-012` P0 obligations are complete and launch metrics are stable.
15. `EPIC-011` work begins only after P0 and P1 deferred differentiators no longer threaten launch or early post-launch stability.

## Launch Critical Path

1. `TKT-OPS-001`, `TKT-OPS-002`, `TKT-OPS-004`
2. `TKT-HUM-003`, `TKT-HUM-004`, `TKT-HUM-005`
3. `TKT-P0-035`, `TKT-P0-036`, `TKT-P0-037`
4. `TKT-P0-001`, `TKT-P0-002`, `TKT-P0-003`, `TKT-P0-004`, `TKT-P0-005`
5. `TKT-P0-006`, `TKT-P0-007`, `TKT-P0-008`, `TKT-P0-009`, `TKT-P0-010`, `TKT-P0-011`
6. `TKT-P0-012`, `TKT-P0-013`, `TKT-P0-014`, `TKT-P0-015`
7. `TKT-P0-016`, `TKT-P0-017`, `TKT-P0-018`, `TKT-P0-019`
8. `TKT-P0-020`, `TKT-P0-021`, `TKT-P0-022`, `TKT-P0-023`, `TKT-P0-024`
9. `TKT-P0-025`, `TKT-P0-026`, `TKT-P0-027`, `TKT-P0-028`, `TKT-P0-029`
10. `TKT-P0-030`, `TKT-P0-031`, `TKT-P0-032`, `TKT-P0-033`, `TKT-P0-034`
11. `TKT-P0-038`, `TKT-P0-039`, `TKT-P0-040`, `TKT-P0-041`
12. `TKT-QA-001`, `TKT-QA-002`, `TKT-QA-003`, `TKT-QA-004`, `TKT-QA-005`, `TKT-QA-006`
13. `TKT-HUM-006`, `TKT-HUM-008`

Critical-path rule: launch cannot be declared ready until every P0 feature, repo, QA, and human-action ticket above is either complete or explicitly waived by a human owner with source-of-truth justification.

## Deferred Work Boundaries

1. `priority/p1` tickets are roadmap commitments for explicit deferred scope and must not introduce dormant launch UI before P1 scheduling begins.
2. `priority/p2` tickets are roadmap commitments for ecosystem, portability, and platform expansion and must not alter the P0 iPhone-only launch boundary.
3. `TKT-P1-001` through `TKT-P1-013` do not authorize promotions, favorites, intensity capture, PR micro-feedback, advanced analytics, follow, appearance overrides, Live Activity, export, or coaching in launch builds.
4. `TKT-P2-001` through `TKT-P2-009` do not authorize referrals, voice assistants, Strava, Fitbit, Apple Watch, import, public API, iPad or AirPlay, or exercise media in launch builds.
5. Release validation tickets must explicitly assert the absence of deferred controls and deferred provider rows in the P0 product.
6. If a deferred ticket needs groundwork in P0 code, that groundwork must remain invisible and non-blocking to launch behavior and still map to a P0 requirement rather than a deferred requirement.

## Recommended GitHub Issue Creation Order

1. Create the 12 epic issues first so every child issue can link upward immediately.
2. Create `TKT-OPS-001` through `TKT-OPS-005`.
3. Create `TKT-HUM-001` through `TKT-HUM-008`.
4. Create backend foundation tickets `TKT-P0-035`, `TKT-P0-036`, `TKT-P0-037`, `TKT-P0-038`, `TKT-P0-039`.
5. Create shell and monetization tickets `TKT-P0-001` through `TKT-P0-005`.
6. Create Train runtime tickets `TKT-P0-006` through `TKT-P0-011`.
7. Create My Workouts and builder tickets `TKT-P0-012` through `TKT-P0-015`.
8. Create exercise-system tickets `TKT-P0-016` through `TKT-P0-019`.
9. Create Explore and creator-trust tickets `TKT-P0-020` through `TKT-P0-024`.
10. Create Home, analytics, and You tickets `TKT-P0-025` through `TKT-P0-034`.
11. Create hardening tickets `TKT-P0-040` and `TKT-P0-041`.
12. Create QA and release tickets `TKT-QA-001` through `TKT-QA-006`.
13. Create deferred P1 tickets `TKT-P1-001` through `TKT-P1-013`.
14. Create deferred P2 tickets `TKT-P2-001` through `TKT-P2-009`.

Issue creation rule: every child issue should include its `Epic`, `Covered Requirement IDs`, `Source-of-Truth References`, and `Dependencies` exactly as written in this file.

## GitHub Issue Body Template Standard

Use the following structure for every epic, feature, QA, repo-ops, and human-action issue:

```md
[Title]
<Ticket title from backlog pack>

[Metadata]
- Ticket ID:
- Kind:
- Priority:
- Area:
- Phase:
- Epic:
- Covered Requirement IDs:

[Objective]

[In Scope]

[Out of Scope]

[Dependencies]

[Source-of-Truth References]

[Acceptance Criteria]

[Test Evidence Required]

[Human Actions Required]

[Notes]
```

If the issue is a child ticket, add a final line `Closes` or `Advances` with the linked epic and any prerequisite tickets according to the chosen GitHub workflow style.

## Definition of Ready

1. A ticket has an assigned epic, exact `kind/*`, exact `priority/*`, and one approved `area/*` label.
2. The ticket lists one or more covered requirement IDs that already exist in [docs/requirements_inventory.md](/Users/Apple/Documents/New_project/docs/requirements_inventory.md).
3. The ticket cites the relevant source-of-truth sections directly from the active files or workflow files.
4. Dependencies are explicit and do not rely on hidden assumptions.
5. In Scope and Out of Scope make it obvious what is intentionally excluded.
6. Acceptance Criteria are testable and not narrative.
7. Test Evidence Required is specific enough to determine completion.
8. Human Actions Required is populated with `None` or with the exact console or portal work still needed.

## Definition of Done

1. The implementation or human action matches the ticket objective without adding extra scope.
2. Every acceptance criterion in the ticket is demonstrably satisfied.
3. Required tests or validation evidence are attached or linked in the PR or issue.
4. Source-of-truth references are cited in the PR and match the issue.
5. Any required human follow-up is either completed or explicitly called out as remaining.
6. Launch tickets do not introduce deferred controls, deferred providers, or phase-mismatched behavior.
7. The traceability matrix remains accurate; if coverage changes, [docs/requirements_traceability_matrix.md](/Users/Apple/Documents/New_project/docs/requirements_traceability_matrix.md) and [docs/coverage_audit.md](/Users/Apple/Documents/New_project/docs/coverage_audit.md) must be updated in the same change.
8. Repo and release tickets validate the workflow or runtime behavior they were created to enforce.

## Coverage Audit Summary

1. Total requirement IDs covered by this backlog pack: `94`
2. Total ticket IDs in this backlog pack, including epics: `94`
3. Epic count: `12`
4. P0 feature ticket count: `41`
5. P1 feature ticket count: `13`
6. P2 feature ticket count: `9`
7. Human-action ticket count: `8`
8. Repo or CI or tooling ticket count: `5`
9. QA or validation or release ticket count: `6`
10. Requirements with no ticket coverage: `0`
11. Tickets with no requirement coverage: `0`
12. Non-epic overloaded tickets: `0`
13. Phase inconsistencies detected during pack construction: `0`
14. Launch-critical categories covered: app shell, auth, onboarding, paywall, entitlements, Train, My Workouts, catalog, Explore, creator trust, analytics, settings, integrations, backend, ads, security, QA, release, repo ops, human gating.
15. Explicit deferred roadmap categories covered: promotions, favorites, intensity capture, PR micro-feedback, advanced analytics, follow, appearance overrides, Live Activity, export, coaching, referrals, voice assistants, Strava, Fitbit, Apple Watch, import, public API, iPad or AirPlay, exercise media.

This backlog pack is paired with [docs/requirements_traceability_matrix.md](/Users/Apple/Documents/New_project/docs/requirements_traceability_matrix.md) and [docs/coverage_audit.md](/Users/Apple/Documents/New_project/docs/coverage_audit.md) for final closed-loop verification.
