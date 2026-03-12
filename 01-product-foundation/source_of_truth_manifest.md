# source_of_truth_manifest.md

## Active Source of Truth

| Path | Status | Rule | Reason |
|---|---|---|---|
| `01-product-foundation/yoked_prd.md` | active | `keep` | Primary source of truth for locked product behavior, launch scope, UX constraints, and platform decisions. |
| `01-product-foundation/yoked_engineering_spec.md` | active | `keep` | Primary source of truth for implementation architecture, schemas, APIs, storage boundaries, and launch engineering constraints. |
| `02-ux-spec/yoked_ux_spec.md` | active | `keep` | Primary source of truth for launch UX, route ownership, interaction contracts, CTA hierarchy, and surface-state behavior. |
| `01-product-foundation/source_of_truth_manifest.md` | active | `keep` | Governs which files may and may not be used during Stage-3C generation, implementation planning, and coding. |

## Operational Docs

| Path | Status | Rule | Reason |
|---|---|---|---|
| `docs/*` excluding `docs/codex/*` | operational | `non_authoritative_operational_use_only` | Planning, roadmap, traceability, audit, issue-manifest, and other operational docs may live under `docs/`. They may be used for issue creation, tracking, and validation. They are never authoritative for product behavior, implementation mechanics, or UX. |

## Archive

| Path | Status | Rule | Reason |
|---|---|---|---|
| `00-archive/product_architecture_review.md` | archive | `archive` | Historical architecture review only. Superseded by the reconciled PRD and engineering spec. |
| `00-archive/product_design_strategy.md` | archive | `archive` | Historical strategy input only. Superseded by the reconciled PRD and engineering spec. |
| `00-archive/product_direction_guardrails.md` | archive | `archive` | Historical guardrails only. Superseded by the reconciled PRD and engineering spec. |
| `00-archive/product_information_architecture.md` | archive | `archive` | Historical IA synthesis only. Superseded by the reconciled PRD and engineering spec. |
| `00-archive/system_architecture.md` | archive | `archive` | Historical system architecture input only. Superseded by the reconciled engineering spec. |

## Reference Only

| Path | Status | Rule | Reason |
|---|---|---|---|
| `03-feature_inventory/canonical_feature_ontology.md` | reference_only | `do_not_use_for_spec_generation` | Background feature inventory only. May be consulted manually but must not override active source-of-truth files. |
| `03-feature_inventory/competitor_feature_coverage.md` | reference_only | `do_not_use_for_spec_generation` | Background comparison material only. May be consulted manually but must not override active source-of-truth files. |
| `03-feature_inventory/feature_priorities.md` | reference_only | `do_not_use_for_spec_generation` | Historical prioritization input only. May be consulted manually but must not override active source-of-truth files. |
| `03-feature_inventory/*` | reference_only | `do_not_use_for_spec_generation` | Entire feature-inventory directory is non-authoritative for Stage-3C generation. |
| `04-analysis/competitor_forensic_ux_architecture.md` | reference_only | `do_not_use_for_spec_generation` | Analysis artifact only. May be consulted manually as background reference, but it must not override active product or engineering truth. |
| `04-analysis/competitor_master_feature_matrix.csv` | reference_only | `do_not_use_for_spec_generation` | Analysis artifact only. May be consulted manually as background reference, but it must not override active product or engineering truth. |
| `04-analysis/*` | reference_only | `do_not_use_for_spec_generation` | Entire analysis directory is background reference only and is non-authoritative for Stage-3C and later spec-generation passes. |
| `05-assets/Competitors_screenshots/*` | reference_only | `do_not_use_for_spec_generation` | Screenshot evidence only. May be reviewed manually during audit passes, but it must not override the active source-of-truth files. |

## Usage Rules

1. Product-spec generation, reconciliation, and coding passes must use only:
   1. `01-product-foundation/yoked_prd.md`,
   2. `01-product-foundation/yoked_engineering_spec.md`,
   3. `02-ux-spec/yoked_ux_spec.md`,
   4. `01-product-foundation/source_of_truth_manifest.md`.
2. Issue creation, backlog tracking, roadmap execution, and coverage validation may use operational docs under `docs/`, but those docs do not replace the active source-of-truth files.
3. Operational docs may define tickets, traceability, coverage, audit state, manifests, or other execution outputs.
4. Operational docs are non-authoritative. They may support execution, but they do not define product truth, engineering truth, or launch UX truth.
5. `01-product-foundation/yoked_prd.md` is the authoritative truth for product behavior, feature scope, monetization scope, launch-versus-deferred boundaries, and marketplace-product rules.
6. `01-product-foundation/yoked_engineering_spec.md` is the authoritative truth for implementation architecture, schema design, APIs, storage, sync behavior, runtime configuration mechanics, and backend contracts.
7. `02-ux-spec/yoked_ux_spec.md` is the authoritative truth for launch UX, screen inventory, route ownership, interaction behavior, CTA hierarchy, and launch surface states.
8. Conflict resolution across active files shall follow these rules:
   1. screen-level launch UX follows `02-ux-spec/yoked_ux_spec.md`,
   2. product scope and feature-scope decisions follow `01-product-foundation/yoked_prd.md`,
   3. implementation mechanics follow `01-product-foundation/yoked_engineering_spec.md`,
   4. archive and reference-only files may not override any active source-of-truth file.
9. If an operational doc conflicts with the active source-of-truth files, the active source-of-truth files win and the operational doc must be updated before further issue creation, implementation planning, or coding continues.
10. Phase-tagged `P1` and `P2` contracts that remain in the engineering spec for forward compatibility must not be interpreted as GA launch UX, GA launch implementation scope, or implementation-planning requirements unless the PRD marks them as launch scope. This applies explicitly to creator follow, favorites, CSV export, Live Activity, deferred integrations, import flows, and other phase-labeled contracts.
11. Internal or provenance-only schema and DTO fields in the engineering spec must not become Stage-3C or later user-visible requirements unless the PRD or UX spec explicitly makes them user-facing. This applies to source-dataset metadata, compatibility fields, internal audit fields, deferred-media fields, and other implementation-only payload members. This rule explicitly covers `visual_media_url`, `visual_family`, `active_runners`, `follower_count`, `is_following`, and `is_favorite`. This exclusion rule does not apply to `load_helper_preferences`, launch exercise-detail performance and history payloads, launch muscle-distribution analytics payloads, or Apple Health launch control state, which are explicit launch-facing contracts in the active PRD, engineering spec, and UX spec.
12. Files outside `01-product-foundation/` are background reference only and may not override product truth, engineering truth, or launch UX truth, except for operational docs under `docs/` when they are used for issue creation, coverage validation, or backlog tracking in accordance with the rules above.
13. Files in `00-archive/` are archival only and may be consulted manually for history, but they must not override the active source-of-truth files.
14. Files in `03-feature_inventory/` are reference-only and must not be used as direct generation inputs for Stage-3C or later outputs.
15. Files in `04-analysis/` are background reference only and must not be used as direct generation inputs for Stage-3C or later outputs.
16. Files in `05-assets/Competitors_screenshots/` are evidence-only and may be consulted manually during audits, but they must not be used as direct generation inputs for Stage-3C or later outputs.
17. No archived or reference-only file may override, reinterpret, or expand launch scope beyond the active source-of-truth files.
18. Stage-3C generation, implementation planning, coding, and later reconciliation passes must honor the final entitlement matrix, the exact five root tabs (`Home`, `Train`, `My Workouts`, `Explore`, `You`), iPhone-only launch scope, onboarding starter-plan rules, launch onboarding progress feedback, Apple Health-only launch integration scope with explicit launch controls for workout-write enablement, body-metric-read enablement, and visible last-sync status, deferred Live Activity scope, text-first launch exercise detail with no launch media, the exact launch exercise-detail section order (`Overview`, `How to Perform`, `Tips`, `Performance`, `Recent History`, `Similar Exercises`), launch exercise-detail performance curves and exercise-level history lists, launch muscle-distribution analytics with front and back body-map views, routine-and-program-only launch ratings scope, creator-follow-is-P1 scope, favorites-hidden-at-launch scope, the `My Workouts` secondary `Owned` and `Published by Me` filter inside `Workouts`, `Programs`, and `Routines` when a creator profile exists, publish-success return to the same asset-type segment with `Published by Me` selected, published workout-template management only through `Workouts > Published by Me`, launch ad placement rules for `Home`, `My Workouts`, `Explore`, and `You`, billing architecture, ad-tech decision, routine versus program start rules, `Start`-first marketplace CTA hierarchy with `Start` visually primary, no active-runners metric in launch marketplace cards or detail surfaces, no PR-outcome display or launch ranking input in launch marketplace cards or detail surfaces, no launch share-result card or share-result route, program authoring as premium-only beyond the included starter plan, routine slot-cap rules, standalone workout templates excluded from consumer marketplace discovery and actions at launch, launch custom-exercise authoring as private, searchable in builder and Train, and non-publishable marketplace input, launch plate calculator or load helper availability only for plate-loadable active-session contexts, launch load-entry modes of `single`, `per_dumbbell`, and `left_right` in `Train`, the launch `You > Settings > Training > Load Helper` preset-library contract with persisted `load_helper_preferences` synced through `GET /v1/users/me` and `PATCH /v1/users/me`, the `CF-024` split of launch same-exercise-variation previous-value preload sourced only from the current workout, warm-up classification, and post-completion PR outputs versus `P1` in-session PR micro-feedback, the `CF-044` split of launch unit preference versus deferred theme or icon or language overrides, moderation and operator model, ranking gate-versus-score split, phased endpoint rules, and feature-priority carve-outs defined in the active source-of-truth files.
19. Stage-3C must treat allowed launch banner placement as exact UX requirements, not optional visual styling:
   1. `Home` allows at most one banner after the required informational modules and recommendation rail,
   2. `My Workouts` allows at most one banner on non-builder list surfaces below the routine-slot usage strip, approaching-limit warning, and upgrade card when present and above the asset list,
   3. `Explore` allows at most one banner on root-lane and search-result browse surfaces below the search field and category rail and above the ranked feed or result list,
   4. `You > Profile` allows at most one banner below the profile header and creator summary block, or below the first non-ad overview module when creator summary is absent,
   5. `You > Progress` allows at most one banner below the primary KPI and overview analytics cluster,
   6. no-fill or failure collapses the section to zero height and restores the owning screen's normal module spacing,
   7. loading states must not reserve skeleton height for these banner slots,
   8. offline-cached-only, blocked, and drill-down states suppress the banner entirely.
20. Stage-3C must preserve the `CF-024` launch-versus-`P1` split exactly:
   1. launch includes previous-value preload sourced only from the most recent completed set for the same exercise variation in the current workout,
   2. launch includes warm-up set classification and warm-up row visibility wherever `warmup` rows appear,
   3. launch includes post-completion PR outputs backed by completion-record `pr_snapshot` or equivalent PR-count payloads already defined in the active source of truth,
   4. `P1` includes in-session PR micro-feedback only,
   5. Stage-3C must not infer cross-workout preload, cross-routine preload, network-backed preload, or launch-time in-session PR celebration from the broader `CF-024` feature label.
21. Stage-3C must not infer launch-time preset-library editing inside `Train`; active-session load-helper preset switching is temporary, while durable preset editing and default selection belong only in `You > Settings > Training > Load Helper`.
22. Stage-3C must treat launch load entry as exercise-driven local-first `Train` UX:
   1. standard bilateral barbell, cable, and machine contexts use one load field,
   2. bilateral dumbbell contexts use one `Each` load field representing per-dumbbell load,
   3. unilateral asymmetry-tracked contexts use inline `L` and `R` load fields within the active set row,
   4. side-specific launch scope splits load only and keeps reps shared,
   5. canonical analytics and summary totals come from the derived total load rather than the display mode,
   6. no load-entry mode may depend on network availability.
23. Stage-3C must treat warm-up counting as exact launch analytics behavior:
   1. warm-up sets do not count toward total logged volume,
   2. warm-up sets do not count toward weekly KPI set counts or KPI volume totals,
   3. warm-up sets do not count toward PR detection,
   4. warm-up sets do not count toward muscle-distribution workload,
   5. warm-up sets remain visible in history and progress surfaces with separate warm-up labeling or counts outside the KPI totals.
