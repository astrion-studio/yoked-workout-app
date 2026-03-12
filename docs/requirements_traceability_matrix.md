# Requirements Traceability Matrix

## Purpose

This document closes the loop between the atomic requirement inventory and the roadmap backlog pack. Every actionable requirement ID is mapped to one or more tickets, and every ticket ID in the roadmap pack maps back to covered requirement IDs.

## Traceability Rules

1. The only authoritative product, engineering, and UX inputs are:
   - `01-product-foundation/source_of_truth_manifest.md`
   - `01-product-foundation/yoked_prd.md`
   - `01-product-foundation/yoked_engineering_spec.md`
   - `02-ux-spec/yoked_ux_spec.md`
2. Repo workflow, label, issue-template, PR-template, and Codex setup requirements are derived only from:
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
3. Every requirement row must map to at least one non-epic ticket.
4. Every ticket row in the backlog pack, including epics, must list covered requirement IDs.
5. P0 requirements may map only to P0 implementation, repo-ops, QA, or human-action tickets.
6. P1 and P2 requirements must not be used to justify P0 launch work.
7. Negative-scope and release-gate requirements are actionable and therefore require QA, repo, or release ticket coverage.
8. Narrative context that did not impose an implementation obligation was intentionally excluded from the requirement inventory and is therefore not listed as unmapped.

## Requirement-to-Ticket Matrix

| Requirement ID | Requirement Summary | Phase | Domain | Source File | Source Section | Epic ID | Ticket ID(s) | Notes |
|---|---|---|---|---|---|---|---|---|
| MAN-001 | Source-of-truth authority and deferred-scope containment | P0 | source-governance | `01-product-foundation/source_of_truth_manifest.md` | `Active Source of Truth`, `Usage Rules` | EPIC-009 | TKT-OPS-002, TKT-QA-006 | Enforced through workflow tooling and release validation. |
| PRD-001 | Product scope, five tabs, Home ownership, Train execution ownership, no social launch | P0 | product-scope | `01-product-foundation/yoked_prd.md` | `§1`, `§5`, `§25.1`, `§26` | EPIC-001 | TKT-P0-001, TKT-QA-001 | Launch shell and route-ownership validation. |
| PRD-002 | Core object model and local-first relationships | P0 | data-model | `01-product-foundation/yoked_prd.md` | `§9` | EPIC-008 | TKT-P0-035, TKT-P0-036 | Requires storage plus API alignment. |
| PRD-003 | Navigation architecture and modal ownership | P0 | navigation | `01-product-foundation/yoked_prd.md` | `§10` | EPIC-001 | TKT-P0-001, TKT-QA-001 | Root coordinator plus UX validation. |
| PRD-004 | Apple, Google, and email auth with correct post-auth routing | P0 | authentication | `01-product-foundation/yoked_prd.md` | `§11.1 CF-001` | EPIC-001 | TKT-P0-002 | Authentication implementation ticket. |
| PRD-005 | Deterministic onboarding questionnaire flow with local resume | P0 | onboarding | `01-product-foundation/yoked_prd.md` | `§11.1 CF-002` to `CF-004` | EPIC-001 | TKT-P0-003 | Full onboarding questionnaire and draft persistence. |
| PRD-006 | Pre-permission education, starter-plan completion contract, no onboarding reroll/edit | P0 | onboarding-permissions | `01-product-foundation/yoked_prd.md` | `§11.1 CF-005`, `CF-006`, `§14.1`, `§15.2` | EPIC-001 | TKT-P0-003, TKT-P0-031, TKT-P0-032 | Onboarding finalization plus permission surfaces. |
| PRD-007 | StoreKit packaging, paywall triggers, restore, subscription management | P0 | billing-entitlement | `01-product-foundation/yoked_prd.md` | `§11.2 CF-007`, `CF-009`, `§17.1`, `§17.2` | EPIC-001 | TKT-P0-004, TKT-P0-005 | Purchase UI and entitlement enforcement split. |
| PRD-008 | Drafting, autosave, ownership, and publish management for workouts, routines, and programs | P0 | asset-authoring | `01-product-foundation/yoked_prd.md` | `§11.3 CF-011`, `CF-013`, `CF-014`, `§12.6`, `§12.7` | EPIC-003 | TKT-P0-012, TKT-P0-013, TKT-P0-014, TKT-P0-015 | Separate tickets by asset family and root surface. |
| PRD-009 | Post-onboarding AI generation with saved revisions and onboarding-generation separation | P0 | ai-generation | `01-product-foundation/yoked_prd.md` | `§11.3 CF-012`, `§14.1`, `§14.6`, `§25.1` | EPIC-003 | TKT-P0-015, TKT-P0-038 | UI flow plus service pipeline. |
| PRD-010 | Internal text-first exercise catalog with ordered detail content and no media | P0 | exercise-catalog | `01-product-foundation/yoked_prd.md` | `§11.4.1`, `§18.5` | EPIC-004 | TKT-P0-016, TKT-P0-019 | Catalog ingest/runtime and detail rendering. |
| PRD-011 | Exercise search, similar exercises, exclude-only preferences, private custom authoring | P0 | exercise-search | `01-product-foundation/yoked_prd.md` | `§11.4 CF-015` to `CF-017` | EPIC-004 | TKT-P0-017, TKT-P0-018 | Search and custom authoring split. |
| PRD-012 | Builder reorder, swap, replace, and superset composition preserved into Train | P0 | builder-composition | `01-product-foundation/yoked_prd.md` | `§11.4 CF-018`, `§15.4` | EPIC-003 | TKT-P0-013, TKT-P0-014 | Workout and routine builder coverage. |
| PRD-013 | Train-only session entry and one-active-session routing | P0 | train-entry | `01-product-foundation/yoked_prd.md` | `§11.5 CF-020`, `§27` | EPIC-002 | TKT-P0-006 | Train root and resume handling. |
| PRD-014 | Fast logging, keypad, load-entry modes, inline labels, contextual load helper | P0 | train-logging | `01-product-foundation/yoked_prd.md` | `§11.5 CF-021`, `Plate Calculator and Load Helper`, `§15.4` | EPIC-002 | TKT-P0-007, TKT-P0-009 | Logging engine and load helper split. |
| PRD-015 | Timer stack, warm-up logic, preload, PR outputs, finish/discard safeguards, summary | P0 | train-completion | `01-product-foundation/yoked_prd.md` | `§11.5 CF-023` to `CF-026`, `§15` | EPIC-002 | TKT-P0-008, TKT-P0-010, TKT-P0-011 | Runtime execution, summary, and completion ledger split. |
| PRD-016 | Muscle-distribution analytics rules and same-screen drill-in | P0 | analytics-muscle-distribution | `01-product-foundation/yoked_prd.md` | `§11.6 CF-028` | EPIC-006 | TKT-P0-027 | Dedicated analytics feature ticket. |
| PRD-017 | KPI snapshots, exercise curves/history, calendar, date-range reports, measurements, goals | P0 | analytics-progress | `01-product-foundation/yoked_prd.md` | `§11.6 CF-030` to `CF-037`, `§16` | EPIC-006 | TKT-P0-019, TKT-P0-026, TKT-P0-028, TKT-P0-029 | Split by exercise detail, analytics overview, history, and body metrics. |
| PRD-018 | Explore marketplace rails and ranked feed for routines, programs, and creators | P0 | marketplace-discovery | `01-product-foundation/yoked_prd.md` | `§11.7 CF-038`, `§12.1`, `§12.2` | EPIC-005 | TKT-P0-020, TKT-P0-021 | Explore root plus marketplace details. |
| PRD-019 | Start, Save, Copy, Rate lifecycle actions with premium program gating and no follow | P0 | marketplace-actions | `01-product-foundation/yoked_prd.md` | `§11.7 CF-039`, `§12.5` | EPIC-005 | TKT-P0-021, TKT-P0-023 | CTA flows plus completion-gated rating system. |
| PRD-020 | Completion-gated ratings, creator eligibility, credibility, visibility, blocking, moderation | P0 | creator-trust | `01-product-foundation/yoked_prd.md` | `§11.7 CF-040`, `CF-041`, `§12.3`, `§12.4`, `§13` | EPIC-005 | TKT-P0-022, TKT-P0-023, TKT-P0-024 | Creator profile, ratings, and ranking trust system. |
| PRD-021 | Profile, account lifecycle, unit preference, notifications, support, erase, transfer, Apple Health | P0 | account-settings | `01-product-foundation/yoked_prd.md` | `§11.8 CF-042` to `CF-047`, `§11.9 CF-050`, `§18`, `§19`, `§20` | EPIC-007 | TKT-P0-030, TKT-P0-031, TKT-P0-032, TKT-P0-033, TKT-P0-034 | Settings, support, governance, and integration tickets. |
| PRD-022 | Local-first sync, runtime config, ads, offline behavior, security, performance, events | P0 | platform-runtime | `01-product-foundation/yoked_prd.md` | `§11.9 CF-052`, `§17`, `§21` to `§28` | EPIC-008 | TKT-P0-005, TKT-P0-037, TKT-P0-039, TKT-P0-040, TKT-QA-003, TKT-QA-006 | Split across runtime config, sync, analytics, ads, and validation. |
| ENG-001 | Local-first architecture, component split, Supabase topology, iPhone-only launch | P0 | system-architecture | `01-product-foundation/yoked_engineering_spec.md` | `§1.1` to `§1.4`, `§1.11` | EPIC-008 | TKT-P0-001, TKT-P0-035, TKT-P0-037 | Shell, persistence, and sync all depend on this contract. |
| ENG-002 | Onboarding, Train, Explore, analytics flows and load-helper persistence contracts | P0 | runtime-contracts | `01-product-foundation/yoked_engineering_spec.md` | `§1.5`, `§1.6`, `§1.7` | EPIC-008 | TKT-P0-003, TKT-P0-006, TKT-P0-020, TKT-P0-026 | Flow-specific implementation tickets. |
| ENG-003 | Storage boundaries, entitlement matrix, runtime-config schema, ad allowlist rules | P0 | monetization-runtime-config | `01-product-foundation/yoked_engineering_spec.md` | `§1.8`, `§1.9`, `§1.10` | EPIC-008 | TKT-P0-005, TKT-P0-037, TKT-P0-040 | Entitlements, runtime config, and ads. |
| ENG-004 | Intended repository structure, module ownership, target boundaries | P0 | repo-architecture | `01-product-foundation/yoked_engineering_spec.md` | `§2` | EPIC-009 | TKT-OPS-001 | Repo scaffold ticket. |
| ENG-005 | Launch SQLite schema and client persistence model | P0 | persistence-schema | `01-product-foundation/yoked_engineering_spec.md` | `§3.1`, `§3.2`, `§4.1` | EPIC-008 | TKT-OPS-001, TKT-P0-035 | Scaffold plus schema implementation. |
| ENG-006 | Query indexes, exercise analytics projections, muscle aggregation, catalog runtime constraints | P0 | analytics-catalog-algorithms | `01-product-foundation/yoked_engineering_spec.md` | `§3.3` to `§3.7` | EPIC-004 | TKT-P0-016, TKT-P0-019, TKT-P0-027 | Catalog and analytics projections. |
| ENG-007 | Offline restore, mutation-queue priority, retry policy, conflict resolution, event ordering | P0 | sync-offline | `01-product-foundation/yoked_engineering_spec.md` | `§4.2` to `§4.7` | EPIC-008 | TKT-P0-037, TKT-QA-002 | Runtime implementation and resilience validation. |
| ENG-008 | Protocol conventions, DTO envelopes, and P0 endpoint families | P0 | backend-api | `01-product-foundation/yoked_engineering_spec.md` | `§5.1` to `§5.11` | EPIC-008 | TKT-P0-036, TKT-P0-032 | Backend API implementation plus HealthKit endpoint coverage. |
| ENG-009 | Push-then-pull sync, per-scope cursors, background refresh, no-overwrite rules | P0 | sync-engine | `01-product-foundation/yoked_engineering_spec.md` | `§6` | EPIC-008 | TKT-P0-037 | Dedicated sync-engine ticket. |
| ENG-010 | Hybrid AI generation pipeline, validation, repair, fallback templates | P0 | ai-engine | `01-product-foundation/yoked_engineering_spec.md` | `§7` | EPIC-003 | TKT-P0-038 | AI service implementation. |
| ENG-011 | Marketplace ranking formula, signal normalization, moderation projections | P0 | marketplace-ranking | `01-product-foundation/yoked_engineering_spec.md` | `§8` | EPIC-005 | TKT-P0-024 | Ranking and moderation ticket. |
| ENG-012 | Notifications, HealthKit, security, performance budgets, analytics event integrity | P0 | platform-quality | `01-product-foundation/yoked_engineering_spec.md` | `§9`, `§10.1`, `§11`, `§12`, `§13` | EPIC-012 | TKT-P0-031, TKT-P0-032, TKT-P0-041, TKT-QA-006 | Implementation plus release hardening. |
| UX-001 | Launch UX boundary, five-tab ownership, route boundaries, screen inventory | P0 | ux-foundation | `02-ux-spec/yoked_ux_spec.md` | `§2`, `§3`, `§5`, `§6` | EPIC-001 | TKT-P0-001, TKT-QA-001 | Shell implementation and UX acceptance suite. |
| UX-002 | Auth and onboarding screen set with step-specific loading, errors, offline behavior | P0 | ux-auth-onboarding | `02-ux-spec/yoked_ux_spec.md` | `§7`, `§8` | EPIC-001 | TKT-P0-002, TKT-P0-003 | Auth and onboarding tickets. |
| UX-003 | Paywall and subscription management layouts and states | P0 | ux-billing | `02-ux-spec/yoked_ux_spec.md` | `§9` | EPIC-001 | TKT-P0-004 | Purchase UI ticket. |
| UX-004 | Home informational layout and approved banner placement | P0 | ux-home | `02-ux-spec/yoked_ux_spec.md` | `§10` | EPIC-006 | TKT-P0-025 | Home surface ticket. |
| UX-005 | Train root, active session, processing, summary, local-first recovery | P0 | ux-train | `02-ux-spec/yoked_ux_spec.md` | `§11` | EPIC-002 | TKT-P0-006, TKT-P0-007, TKT-P0-008, TKT-P0-009, TKT-P0-010, TKT-P0-011 | Full Train runtime split into focused tickets. |
| UX-006 | My Workouts root, asset details, builders, AI preview and generation | P0 | ux-my-workouts | `02-ux-spec/yoked_ux_spec.md` | `§12`, `§19` | EPIC-003 | TKT-P0-012, TKT-P0-013, TKT-P0-014, TKT-P0-015 | Asset management and builder tickets. |
| UX-007 | Explore root, search results, marketplace details, fixed CTA order | P0 | ux-explore | `02-ux-spec/yoked_ux_spec.md` | `§13`, `§17` | EPIC-005 | TKT-P0-020, TKT-P0-021 | Discovery and marketplace detail tickets. |
| UX-008 | You profile overview, progress overview, settings root, creator summary | P0 | ux-you-overview | `02-ux-spec/yoked_ux_spec.md` | `§14` overview surfaces | EPIC-006 | TKT-P0-025, TKT-P0-026, TKT-P0-030 | Overview surfaces split across Home, Progress, and Settings. |
| UX-009 | Progress drill-down surfaces for goals, distribution, history, reports, measurements | P0 | ux-progress-drilldowns | `02-ux-spec/yoked_ux_spec.md` | `§14` drill-down surfaces | EPIC-006 | TKT-P0-027, TKT-P0-028, TKT-P0-029 | Analytics drill-down tickets. |
| UX-010 | Settings drill-down surfaces including notifications, training, integrations, support, data | P0 | ux-settings-drilldowns | `02-ux-spec/yoked_ux_spec.md` | `§14` settings and support surfaces | EPIC-007 | TKT-P0-030, TKT-P0-031, TKT-P0-032, TKT-P0-033, TKT-P0-034 | Settings and governance tickets. |
| UX-011 | Shared exercise search, custom authoring, and exercise detail layouts | P0 | ux-exercise-surfaces | `02-ux-spec/yoked_ux_spec.md` | `§15`, `§16` | EPIC-004 | TKT-P0-017, TKT-P0-018, TKT-P0-019 | Search, authoring, and detail tickets. |
| UX-012 | Creator profile, load helper sheet/settings, shared components, state library, launch acceptance | P0 | ux-shared-systems | `02-ux-spec/yoked_ux_spec.md` | `§18`, `§20` to `§25` | EPIC-002 | TKT-P0-009, TKT-P0-013, TKT-P0-014, TKT-P0-015, TKT-P0-022, TKT-QA-001 | Shared modal/component behavior plus creator profile surface. |
| PRD-023 | Promotions and offer mechanics after launch | P1 | promotions | `01-product-foundation/yoked_prd.md` | `§11.2 CF-008`, `§17.3`, `§25.2` | EPIC-010 | TKT-P1-001 | Deferred roadmap feature. |
| PRD-024 | Favorite-exercise behavior after launch | P1 | exercise-preferences | `01-product-foundation/yoked_prd.md` | `§11.4 CF-016`, `§25.2` | EPIC-010 | TKT-P1-002 | Deferred replacement for launch exclude-only model. |
| PRD-025 | Effort and intensity capture plus coach prompts | P1 | train-intensity | `01-product-foundation/yoked_prd.md` | `§11.5 CF-022`, `§25.2` | EPIC-010 | TKT-P1-003 | Deferred Train enhancement. |
| PRD-026 | In-session PR micro-feedback | P1 | train-pr-feedback | `01-product-foundation/yoked_prd.md` | `§11.5 CF-024`, `§25.2` | EPIC-010 | TKT-P1-004 | Deferred Train celebration surface. |
| PRD-027 | Strength and recovery scoring | P1 | advanced-analytics | `01-product-foundation/yoked_prd.md` | `§11.6 CF-027`, `§25.2` | EPIC-010 | TKT-P1-005 | Deferred analytics surface. |
| PRD-028 | Cross-exercise rankings and broader trend dashboards | P1 | advanced-analytics | `01-product-foundation/yoked_prd.md` | `§11.6 CF-031`, `§25.2` | EPIC-010 | TKT-P1-006 | Deferred analytics expansion. |
| PRD-029 | Achievements and milestones | P1 | advanced-analytics | `01-product-foundation/yoked_prd.md` | `§11.6 CF-035`, `§25.2` | EPIC-010 | TKT-P1-007 | Deferred achievements system. |
| PRD-030 | Streak and continuity metrics | P1 | advanced-analytics | `01-product-foundation/yoked_prd.md` | `§11.6 CF-036`, `§25.2` | EPIC-010 | TKT-P1-008 | Deferred continuity feature. |
| PRD-031 | Creator follow relationship without social feed | P1 | creator-follow | `01-product-foundation/yoked_prd.md` | `§11.7 CF-039`, `§13.3`, `§25.2` | EPIC-010 | TKT-P1-009 | Deferred creator graph work. |
| PRD-032 | Theme, app icon, and manual language override settings | P1 | settings-overrides | `01-product-foundation/yoked_prd.md` | `§11.8 CF-044`, `§25.2` | EPIC-010 | TKT-P1-010 | Deferred appearance/localization controls. |
| PRD-033 | Live Activity for active Train sessions | P1 | live-activity | `01-product-foundation/yoked_prd.md` | `§11.9 CF-048`, `§25.2` | EPIC-010 | TKT-P1-011 | Deferred platform runtime feature. |
| PRD-034 | CSV export portability jobs | P1 | governance-export | `01-product-foundation/yoked_prd.md` | `§11.9 CF-052`, `§20.2`, `§20.3`, `§25.2` | EPIC-010 | TKT-P1-012 | Deferred governance/export ticket. |
| PRD-035 | Personal coach and trainer recommendation surfaces | P1 | coaching | `01-product-foundation/yoked_prd.md` | `§11.10 CF-053`, `§25.2` | EPIC-010 | TKT-P1-013 | Deferred coaching system. |
| ENG-013 | P1-compatible contracts for Live Activity, appearance settings, export endpoints | P1 | forward-compatibility | `01-product-foundation/yoked_engineering_spec.md` | `§5.11`, `§10.3`, `§12.1`, `§13`, `§17.5` | EPIC-010 | TKT-P1-010, TKT-P1-011, TKT-P1-012 | Deferred technical enablement split by feature. |
| UX-013 | Keep P1 surfaces absent from launch until enabled | P1 | deferred-ux-boundary | `02-ux-spec/yoked_ux_spec.md` | `§26` | EPIC-010 | TKT-P1-001, TKT-P1-002, TKT-P1-005, TKT-P1-006, TKT-P1-007, TKT-P1-008, TKT-P1-009, TKT-P1-010, TKT-P1-011, TKT-P1-012, TKT-P1-013 | P1 ticket pack intentionally excludes dormant launch placeholders. |
| PRD-036 | Referral and free-pass loops after launch | P2 | growth-loops | `01-product-foundation/yoked_prd.md` | `§11.2 CF-010`, `§25.3` | EPIC-011 | TKT-P2-001 | Deferred growth loop ticket. |
| PRD-037 | Voice assistant Train integrations | P2 | voice-assistant | `01-product-foundation/yoked_prd.md` | `§11.9 CF-049`, `§25.3` | EPIC-011 | TKT-P2-002 | Deferred voice surface ticket. |
| PRD-038 | Strava, Fitbit, and Apple Watch deferred integrations | P2 | ecosystem-integrations | `01-product-foundation/yoked_prd.md` | `§11.9 CF-050`, `§18.2`, `§25.3` | EPIC-011 | TKT-P2-003, TKT-P2-004, TKT-P2-005 | Split by provider/runtime family. |
| PRD-039 | Import flows, public API, and external integration request intake | P2 | portability-api | `01-product-foundation/yoked_prd.md` | `§11.9 CF-052`, `§25.3` | EPIC-011 | TKT-P2-006, TKT-P2-007 | Import and API work split. |
| PRD-040 | iPad and AirPlay or TV-casting platform expansion | P2 | platform-expansion | `01-product-foundation/yoked_prd.md` | `§18.5`, `§25.3` | EPIC-011 | TKT-P2-008 | Deferred platform-expansion ticket. |
| PRD-041 | Exercise visuals and premium media packs after launch | P2 | exercise-media | `01-product-foundation/yoked_prd.md` | `§11.4.1`, `§17.2.1`, `§26` | EPIC-011 | TKT-P2-009 | Deferred media pipeline ticket. |
| ENG-014 | Apple Watch runtime architecture and session-authority rules | P2 | watch-architecture | `01-product-foundation/yoked_engineering_spec.md` | `§10.2` | EPIC-011 | TKT-P2-005 | Apple Watch technical contract. |
| ENG-015 | P2 continuity endpoints, import jobs, and non-iPhone platform contracts | P2 | deferred-platform-contracts | `01-product-foundation/yoked_engineering_spec.md` | `§5.4`, `§5.11`, `§1.11`, `§18.5` | EPIC-011 | TKT-P2-006, TKT-P2-007, TKT-P2-008 | P2 backend/platform tickets. |
| UX-014 | Keep P2 surfaces absent from launch UX | P2 | deferred-ux-boundary | `02-ux-spec/yoked_ux_spec.md` | `§2`, `§26` | EPIC-011 | TKT-P2-002, TKT-P2-003, TKT-P2-004, TKT-P2-005, TKT-P2-006, TKT-P2-007, TKT-P2-008, TKT-P2-009 | No dormant launch controls or reserved space. |
| AGT-001 | Implementation must use only the active source-of-truth files and preserve launch scope | P0 | repo-governance | `AGENTS.md` | `Active Source of Truth`, `Launch Scope Discipline` | EPIC-009 | TKT-OPS-002, TKT-QA-006 | Workflow and release gating. |
| AGT-002 | Issue-first and PR-first workflow with source citations, test evidence, human follow-up | P0 | workflow | `AGENTS.md` | `Workflow Rules`, `Testing and Validation Rules` | EPIC-009 | TKT-OPS-002 | Repo workflow ticket. |
| AGT-003 | Additive setup, numbered directories preserved, no secrets or local config in Git, staging first | P0 | repo-safety | `AGENTS.md` | `Repository Change Rules` | EPIC-009 | TKT-OPS-001, TKT-OPS-004, TKT-HUM-003 | Scaffold, config, and Supabase provisioning. |
| RDM-001 | Spec-first repo layout and GitHub-native work tracking before implementation | P0 | repo-layout | `README.md` | `Authoritative Files`, `Current Repository Layout`, `How Work Should Be Tracked` | EPIC-009 | TKT-OPS-001 | Repo scaffold ticket. |
| CON-001 | `codex/` branches, label requirements, review expectations, merge and hotfix rules | P0 | contribution-governance | `CONTRIBUTING.md` | `Branch Naming`, `Labels`, `Review Expectations`, `Merge Rules`, `Release and Hotfix Rules` | EPIC-009 | TKT-OPS-002, TKT-HUM-002 | Workflow automation plus human GitHub settings. |
| TPL-001 | Issue forms and PR template fields must capture objective, scope, criteria, validation, risk, human actions | P0 | issue-pr-templates | `.github/ISSUE_TEMPLATE/*.yml`, `.github/PULL_REQUEST_TEMPLATE.md` | entire files | EPIC-009 | TKT-OPS-002 | Template-alignment ticket. |
| LBL-001 | Exact `kind/*`, `priority/*`, and `area/*` label taxonomy must be preserved | P0 | labels | `.github/labels.yml` | entire file | EPIC-009 | TKT-OPS-002 | Repo-ops ticket owns label alignment. |
| CDX-001 | Local Codex config stays out of Git, connectors use documented priority order, GitHub automation is label-driven | P0 | local-tooling | `docs/codex/setup.md` | `Local Codex Files`, `Recommended Local Workflow`, `Connectors and MCP Priority`, `GitHub Project Automation` | EPIC-009 | TKT-OPS-004, TKT-OPS-005, TKT-HUM-001 | Config scaffolding, docs, and GitHub UI setup. |
| PRD-042 | Launch exclusions and deferred capabilities must stay out of launch deliverables | P0 | launch-exclusion-validation | `01-product-foundation/yoked_prd.md` | `§26`, `§25.2`, `§25.3` | EPIC-012 | TKT-QA-001, TKT-QA-003, TKT-QA-004, TKT-QA-005, TKT-QA-006 | Negative-scope validation across major streams. |
| PRD-043 | Release gates for tabs, ownership, Explore model, ratings, publishing, distribution, offline, runtime config, load helper | P0 | release-gates | `01-product-foundation/yoked_prd.md` | `§27` | EPIC-012 | TKT-QA-001, TKT-QA-002, TKT-QA-003, TKT-QA-005, TKT-QA-006 | Launch-readiness coverage across UX, Train, monetization, marketplace, and platform. |
| ENG-016 | Security, performance, runtime accuracy, degradation policy, analytics integrity validation | P0 | nonfunctional-validation | `01-product-foundation/yoked_engineering_spec.md` | `§11`, `§12`, `§13.5` | EPIC-012 | TKT-QA-006 | Dedicated release hardening ticket. |
| ENG-017 | Unit, integration, UI, and performance test strategy aligned to target boundaries | P0 | test-strategy | `01-product-foundation/yoked_engineering_spec.md` | `§2.3` | EPIC-012 | TKT-QA-001, TKT-QA-002, TKT-QA-003, TKT-QA-004, TKT-QA-005, TKT-QA-006 | Test program distributed across QA ticket pack. |
| UX-015 | Launch UX acceptance and deferred-scope handling across all surfaces, sheets, and ad placements | P0 | ux-release-gates | `02-ux-spec/yoked_ux_spec.md` | `§25`, `§26` | EPIC-012 | TKT-QA-001, TKT-QA-003, TKT-QA-004, TKT-QA-005 | UX acceptance suite plus negative-scope checks. |
| AGT-004 | Docs, workflow, and code validation expectations must be enforced | P0 | validation-process | `AGENTS.md` | `Testing and Validation Rules` | EPIC-012 | TKT-OPS-003, TKT-QA-006 | CI enforcement plus release checklist. |
| CON-002 | Reviewers must enforce scope discipline, source compliance, test evidence, placeholder safety | P0 | review-release-process | `CONTRIBUTING.md` | `Review Expectations`, `Release and Hotfix Rules` | EPIC-012 | TKT-QA-006 | Release-process and reviewer checklist ownership. |
| AGT-005 | GitHub repo settings, branch protection, and project workflow clicks are human-gated | P0 | human-gated-github | `AGENTS.md` | `Human-Gated Tasks`, `Escalation Rule` | EPIC-009 | TKT-HUM-001, TKT-HUM-002 | Human-action tickets only. |
| AGT-006 | App Store Connect, Apple Developer, billing configuration, and release settings are human-gated | P0 | human-gated-apple-billing | `AGENTS.md` | `Human-Gated Tasks` | EPIC-012 | TKT-HUM-004, TKT-HUM-008 | Human console work. |
| AGT-007 | OAuth provider setup is human-gated | P0 | human-gated-oauth | `AGENTS.md` | `Human-Gated Tasks` | EPIC-007 | TKT-HUM-004 | Human auth-provider setup. |
| AGT-008 | Supabase project creation, credentials, and production access are human-gated | P0 | human-gated-supabase | `AGENTS.md` | `Human-Gated Tasks` | EPIC-008 | TKT-HUM-003 | Human environment provisioning. |
| AGT-009 | AdMob, APNs, and HealthKit approvals are human-gated | P0 | human-gated-capabilities | `AGENTS.md` | `Human-Gated Tasks` | EPIC-007 | TKT-HUM-005, TKT-HUM-006 | Capability approvals. |
| AGT-010 | Placeholder replacement for repo, team, and environment IDs requires human confirmation | P0 | human-gated-placeholders | `AGENTS.md` | `Human-Gated Tasks`, `Escalation Rule` | EPIC-009 | TKT-HUM-007 | Human placeholder resolution. |
| CDX-002 | GitHub Project auto-add workflows and default-status routing must be configured manually in GitHub UI | P0 | human-gated-project-automation | `docs/codex/setup.md` | `GitHub Project Automation` | EPIC-009 | TKT-HUM-001 | Human GitHub UI ticket. |
| CDX-003 | GitHub, Supabase staging, and Figma connectors require human-controlled authentication/approval | P0 | human-gated-connectors | `docs/codex/setup.md` | `Connectors and MCP Priority` | EPIC-009 | TKT-HUM-003, TKT-HUM-007 | Human provisioning ticket pair. |

## Ticket-to-Requirement Backreference Summary

| Ticket ID | Kind | Priority | Area | Epic | Covered Requirement IDs |
|---|---|---|---|---|---|
| EPIC-001 | kind/epic | priority/p0 | area/ios-foundation | self | PRD-001, PRD-003, PRD-004, PRD-005, PRD-006, PRD-007, UX-001, UX-002, UX-003 |
| EPIC-002 | kind/epic | priority/p0 | area/train | self | PRD-013, PRD-014, PRD-015, UX-005, UX-012 |
| EPIC-003 | kind/epic | priority/p0 | area/catalog | self | PRD-008, PRD-009, PRD-012, ENG-010, UX-006 |
| EPIC-004 | kind/epic | priority/p0 | area/catalog | self | PRD-010, PRD-011, ENG-006, UX-011 |
| EPIC-005 | kind/epic | priority/p0 | area/marketplace | self | PRD-018, PRD-019, PRD-020, ENG-011, UX-007 |
| EPIC-006 | kind/epic | priority/p0 | area/analytics | self | PRD-016, PRD-017, UX-004, UX-008, UX-009 |
| EPIC-007 | kind/epic | priority/p0 | area/backend | self | PRD-021, UX-010, AGT-007, AGT-009 |
| EPIC-008 | kind/epic | priority/p0 | area/backend | self | PRD-002, PRD-022, ENG-001, ENG-002, ENG-003, ENG-005, ENG-007, ENG-008, ENG-009, AGT-008 |
| EPIC-009 | kind/epic | priority/p0 | area/repo-ops | self | MAN-001, AGT-001, AGT-002, AGT-003, RDM-001, CON-001, TPL-001, LBL-001, CDX-001, AGT-005, AGT-010, CDX-002, CDX-003 |
| EPIC-010 | kind/epic | priority/p1 | area/ios-foundation | self | PRD-023, PRD-024, PRD-025, PRD-026, PRD-027, PRD-028, PRD-029, PRD-030, PRD-031, PRD-032, PRD-033, PRD-034, PRD-035, ENG-013, UX-013 |
| EPIC-011 | kind/epic | priority/p2 | area/ios-foundation | self | PRD-036, PRD-037, PRD-038, PRD-039, PRD-040, PRD-041, ENG-014, ENG-015, UX-014 |
| EPIC-012 | kind/epic | priority/p0 | area/release | self | PRD-042, PRD-043, ENG-012, ENG-016, ENG-017, UX-015, AGT-004, CON-002 |
| TKT-P0-001 | kind/feature | priority/p0 | area/ios-foundation | EPIC-001 | PRD-001, PRD-003, ENG-001, UX-001 |
| TKT-P0-002 | kind/feature | priority/p0 | area/ios-foundation | EPIC-001 | PRD-004, UX-002 |
| TKT-P0-003 | kind/feature | priority/p0 | area/ios-foundation | EPIC-001 | PRD-005, PRD-006, ENG-002, UX-002 |
| TKT-P0-004 | kind/feature | priority/p0 | area/ios-foundation | EPIC-001 | PRD-007, UX-003 |
| TKT-P0-005 | kind/feature | priority/p0 | area/backend | EPIC-008 | PRD-007, PRD-022, ENG-003 |
| TKT-P0-006 | kind/feature | priority/p0 | area/train | EPIC-002 | PRD-013, ENG-002, UX-005 |
| TKT-P0-007 | kind/feature | priority/p0 | area/train | EPIC-002 | PRD-014, UX-005 |
| TKT-P0-008 | kind/feature | priority/p0 | area/train | EPIC-002 | PRD-015, UX-005 |
| TKT-P0-009 | kind/feature | priority/p0 | area/train | EPIC-002 | PRD-014, UX-005, UX-012 |
| TKT-P0-010 | kind/feature | priority/p0 | area/train | EPIC-002 | PRD-015, UX-005 |
| TKT-P0-011 | kind/feature | priority/p0 | area/train | EPIC-002 | PRD-015, UX-005 |
| TKT-P0-012 | kind/feature | priority/p0 | area/train | EPIC-003 | PRD-008, UX-006 |
| TKT-P0-013 | kind/feature | priority/p0 | area/train | EPIC-003 | PRD-008, PRD-012, UX-006, UX-012 |
| TKT-P0-014 | kind/feature | priority/p0 | area/train | EPIC-003 | PRD-008, PRD-012, UX-006, UX-012 |
| TKT-P0-015 | kind/feature | priority/p0 | area/train | EPIC-003 | PRD-008, PRD-009, UX-006, UX-012 |
| TKT-P0-016 | kind/feature | priority/p0 | area/catalog | EPIC-004 | PRD-010, ENG-006 |
| TKT-P0-017 | kind/feature | priority/p0 | area/catalog | EPIC-004 | PRD-011, UX-011 |
| TKT-P0-018 | kind/feature | priority/p0 | area/catalog | EPIC-004 | PRD-011, UX-011 |
| TKT-P0-019 | kind/feature | priority/p0 | area/catalog | EPIC-004 | PRD-010, PRD-017, ENG-006, UX-011 |
| TKT-P0-020 | kind/feature | priority/p0 | area/marketplace | EPIC-005 | PRD-018, ENG-002, UX-007 |
| TKT-P0-021 | kind/feature | priority/p0 | area/marketplace | EPIC-005 | PRD-018, PRD-019, UX-007 |
| TKT-P0-022 | kind/feature | priority/p0 | area/marketplace | EPIC-005 | PRD-020, UX-012 |
| TKT-P0-023 | kind/feature | priority/p0 | area/marketplace | EPIC-005 | PRD-019, PRD-020 |
| TKT-P0-024 | kind/feature | priority/p0 | area/marketplace | EPIC-005 | PRD-020, ENG-011 |
| TKT-P0-025 | kind/feature | priority/p0 | area/analytics | EPIC-006 | UX-004, UX-008 |
| TKT-P0-026 | kind/feature | priority/p0 | area/analytics | EPIC-006 | PRD-017, ENG-002, UX-008 |
| TKT-P0-027 | kind/feature | priority/p0 | area/analytics | EPIC-006 | PRD-016, ENG-006, UX-009 |
| TKT-P0-028 | kind/feature | priority/p0 | area/analytics | EPIC-006 | PRD-017, UX-009 |
| TKT-P0-029 | kind/feature | priority/p0 | area/analytics | EPIC-006 | PRD-017, UX-009 |
| TKT-P0-030 | kind/feature | priority/p0 | area/ios-foundation | EPIC-007 | PRD-020, PRD-021, ENG-003, UX-008, UX-010 |
| TKT-P0-031 | kind/feature | priority/p0 | area/ios-foundation | EPIC-007 | PRD-006, PRD-021, ENG-012, UX-010 |
| TKT-P0-032 | kind/feature | priority/p0 | area/health | EPIC-007 | PRD-006, PRD-021, ENG-008, ENG-012, UX-010 |
| TKT-P0-033 | kind/feature | priority/p0 | area/ios-foundation | EPIC-007 | PRD-021, UX-010 |
| TKT-P0-034 | kind/feature | priority/p0 | area/backend | EPIC-007 | PRD-021, UX-010 |
| TKT-P0-035 | kind/feature | priority/p0 | area/backend | EPIC-008 | PRD-002, ENG-001, ENG-005 |
| TKT-P0-036 | kind/feature | priority/p0 | area/backend | EPIC-008 | PRD-002, ENG-008 |
| TKT-P0-037 | kind/feature | priority/p0 | area/backend | EPIC-008 | PRD-022, ENG-001, ENG-003, ENG-007, ENG-009 |
| TKT-P0-038 | kind/feature | priority/p0 | area/backend | EPIC-003 | PRD-009, ENG-010 |
| TKT-P0-039 | kind/feature | priority/p0 | area/analytics | EPIC-008 | PRD-022 |
| TKT-P0-040 | kind/feature | priority/p0 | area/release | EPIC-008 | PRD-022, ENG-003 |
| TKT-P0-041 | kind/feature | priority/p0 | area/ios-foundation | EPIC-012 | ENG-012 |
| TKT-P1-001 | kind/feature | priority/p1 | area/ios-foundation | EPIC-010 | PRD-023, UX-013 |
| TKT-P1-002 | kind/feature | priority/p1 | area/catalog | EPIC-010 | PRD-024, UX-013 |
| TKT-P1-003 | kind/feature | priority/p1 | area/train | EPIC-010 | PRD-025 |
| TKT-P1-004 | kind/feature | priority/p1 | area/train | EPIC-010 | PRD-026 |
| TKT-P1-005 | kind/feature | priority/p1 | area/analytics | EPIC-010 | PRD-027, UX-013 |
| TKT-P1-006 | kind/feature | priority/p1 | area/analytics | EPIC-010 | PRD-028, UX-013 |
| TKT-P1-007 | kind/feature | priority/p1 | area/analytics | EPIC-010 | PRD-029, UX-013 |
| TKT-P1-008 | kind/feature | priority/p1 | area/analytics | EPIC-010 | PRD-030, UX-013 |
| TKT-P1-009 | kind/feature | priority/p1 | area/marketplace | EPIC-010 | PRD-031, UX-013 |
| TKT-P1-010 | kind/feature | priority/p1 | area/ios-foundation | EPIC-010 | PRD-032, ENG-013, UX-013 |
| TKT-P1-011 | kind/feature | priority/p1 | area/train | EPIC-010 | PRD-033, ENG-013, UX-013 |
| TKT-P1-012 | kind/feature | priority/p1 | area/backend | EPIC-010 | PRD-034, ENG-013, UX-013 |
| TKT-P1-013 | kind/feature | priority/p1 | area/analytics | EPIC-010 | PRD-035, UX-013 |
| TKT-P2-001 | kind/feature | priority/p2 | area/release | EPIC-011 | PRD-036 |
| TKT-P2-002 | kind/feature | priority/p2 | area/train | EPIC-011 | PRD-037, UX-014 |
| TKT-P2-003 | kind/feature | priority/p2 | area/health | EPIC-011 | PRD-038, UX-014 |
| TKT-P2-004 | kind/feature | priority/p2 | area/health | EPIC-011 | PRD-038, UX-014 |
| TKT-P2-005 | kind/feature | priority/p2 | area/health | EPIC-011 | PRD-038, ENG-014, UX-014 |
| TKT-P2-006 | kind/feature | priority/p2 | area/backend | EPIC-011 | PRD-039, ENG-015, UX-014 |
| TKT-P2-007 | kind/feature | priority/p2 | area/backend | EPIC-011 | PRD-039, ENG-015, UX-014 |
| TKT-P2-008 | kind/feature | priority/p2 | area/ios-foundation | EPIC-011 | PRD-040, ENG-015, UX-014 |
| TKT-P2-009 | kind/feature | priority/p2 | area/catalog | EPIC-011 | PRD-041, UX-014 |
| TKT-HUM-001 | kind/human-action | priority/p0 | area/repo-ops | EPIC-009 | AGT-005, CDX-001, CDX-002 |
| TKT-HUM-002 | kind/human-action | priority/p0 | area/repo-ops | EPIC-009 | AGT-005, CON-001 |
| TKT-HUM-003 | kind/human-action | priority/p0 | area/backend | EPIC-008 | AGT-003, AGT-008, CDX-003 |
| TKT-HUM-004 | kind/human-action | priority/p0 | area/backend | EPIC-007 | AGT-006, AGT-007 |
| TKT-HUM-005 | kind/human-action | priority/p0 | area/health | EPIC-007 | AGT-009 |
| TKT-HUM-006 | kind/human-action | priority/p0 | area/release | EPIC-012 | AGT-009 |
| TKT-HUM-007 | kind/human-action | priority/p0 | area/repo-ops | EPIC-009 | AGT-010, CDX-003 |
| TKT-HUM-008 | kind/human-action | priority/p0 | area/release | EPIC-012 | AGT-006 |
| TKT-OPS-001 | kind/feature | priority/p0 | area/repo-ops | EPIC-009 | ENG-004, ENG-005, AGT-003, RDM-001 |
| TKT-OPS-002 | kind/feature | priority/p0 | area/repo-ops | EPIC-009 | MAN-001, AGT-001, AGT-002, CON-001, TPL-001, LBL-001 |
| TKT-OPS-003 | kind/feature | priority/p0 | area/repo-ops | EPIC-009 | AGT-004 |
| TKT-OPS-004 | kind/feature | priority/p0 | area/repo-ops | EPIC-009 | AGT-003, CDX-001 |
| TKT-OPS-005 | kind/feature | priority/p0 | area/repo-ops | EPIC-009 | CDX-001 |
| TKT-QA-001 | kind/feature | priority/p0 | area/release | EPIC-012 | PRD-001, PRD-003, UX-001, UX-012, PRD-042, PRD-043, ENG-017, UX-015 |
| TKT-QA-002 | kind/feature | priority/p0 | area/release | EPIC-012 | ENG-007, PRD-043, ENG-017 |
| TKT-QA-003 | kind/feature | priority/p0 | area/release | EPIC-012 | PRD-022, PRD-042, PRD-043, ENG-017, UX-015 |
| TKT-QA-004 | kind/feature | priority/p0 | area/release | EPIC-012 | PRD-042, ENG-017, UX-015 |
| TKT-QA-005 | kind/feature | priority/p0 | area/release | EPIC-012 | PRD-042, PRD-043, ENG-017, UX-015 |
| TKT-QA-006 | kind/feature | priority/p0 | area/release | EPIC-012 | MAN-001, AGT-001, PRD-022, PRD-042, PRD-043, ENG-012, ENG-016, ENG-017, AGT-004, CON-002 |

## Unmapped Requirements

None. Every requirement ID in [docs/requirements_inventory.md](/Users/Apple/Documents/New_project/docs/requirements_inventory.md) maps to one or more tickets in [docs/full_roadmap_backlog_pack.md](/Users/Apple/Documents/New_project/docs/full_roadmap_backlog_pack.md).

## Potentially Overloaded Tickets

No non-epic ticket is overloaded. The only tickets spanning many requirements are the 12 epic tickets, and that aggregation is intentional because each epic is a GitHub parent issue rather than a single-PR implementation unit.

## Phase Mismatch Check

None.

Checks performed:

1. Every P0 requirement maps only to `priority/p0` implementation, repo-ops, QA, or human-action tickets.
2. Every P1 requirement maps only to `priority/p1` tickets under `EPIC-010`.
3. Every P2 requirement maps only to `priority/p2` tickets under `EPIC-011`.
4. Repo, QA, and human-action requirements map only to P0 operations, QA, or human-action tickets.
5. No P1 or P2 requirement is used to justify launch-critical P0 implementation.

## Coverage Summary

| Check | Result |
|---|---|
| Total requirement IDs traced | 94 |
| Requirements with at least one ticket | 94 |
| Requirements with zero tickets | 0 |
| Total ticket IDs back-referenced | 94 |
| Tickets with covered requirement IDs | 94 |
| Tickets with zero requirement IDs | 0 |
| Non-epic overloaded tickets | 0 |
| Phase mismatches | 0 |

The matrix is closed-loop complete and is suitable to drive direct GitHub issue creation alongside the backlog pack.
