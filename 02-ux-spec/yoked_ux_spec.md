# Yoked Stage-3C Launch UX Specification

## 1. Document Purpose

This document defines the complete Stage-3C launch UX specification for the Yoked iPhone app.

This document is the design and frontend execution source for launch-only iPhone surfaces.

This document uses only:

1. `01-product-foundation/source_of_truth_manifest.md`
2. `01-product-foundation/yoked_prd.md`
3. `01-product-foundation/yoked_engineering_spec.md`

This document does not introduce product strategy, non-launch features, archive behaviors, or implementation-only fields as user-visible requirements.

This document defines:

1. the exact launch surface set
2. route ownership
3. CTA hierarchy
4. state behavior
5. monetization behavior
6. ad placement and suppression behavior
7. offline and cached behavior
8. launch-safe deferred boundaries

This document is the authoritative launch UX source of truth after reconciliation with the active manifest, PRD, and engineering spec.

## 2. Launch Scope Boundary

Launch scope is limited to:

1. iPhone only
2. exactly five root tabs:
   1. `Home`
   2. `Train`
   3. `My Workouts`
   4. `Explore`
   5. `You`
3. authentication with Apple, Google, and email
4. onboarding with deterministic question order, notification education, Apple Health education, and one included starter-plan generation
5. full local-first Train logging, completion, and summary flows
6. owned workout, routine, and premium-gated program creation and editing
7. routine and program marketplace discovery
8. creator profiles without follow behavior
9. routine and program ratings without comments
10. basic launch analytics:
   1. weekly KPI overview
   2. muscle-distribution analytics with front and back body-map views
   3. history
   4. date-range reports
   5. body measurement logging and charting
   6. goal and target management
11. exercise-detail performance curves and recent history lists
12. Apple Health integration only
13. contextual banner ads only on approved free-tier surfaces

Launch scope excludes:

1. comments
2. posts
3. messaging
4. groups
5. forums
6. generic social feeds
7. fullscreen TikTok-style discovery default
8. creator follow
9. favorites UI
10. exercise media
11. workout-template consumer marketplace discovery
12. launch ratings for workout templates
13. advanced analytics modules:
   1. strength and recovery scoring
   2. cross-exercise performance rankings and broader trend dashboards
   3. achievements and milestones
   4. streak and continuity modules
   5. coach recommendation surfaces
14. in-session PR celebration
15. Live Activity
16. Apple Watch
17. Strava
18. Fitbit
19. CSV export
20. import flows
21. theme override
22. app icon override
23. manual language override

Launch monetization boundary is:

1. one included onboarding-generated starter plan is free
2. free users may own unlimited workouts
3. free users may own up to `5` active routines
4. free users may not access programs beyond the included starter plan
5. post-onboarding AI generation is premium-only
6. premium removes ads completely

## 3. Launch Navigation Model

### 3.1 App Entry Model

The launch entry order is:

1. authenticated session check
2. authentication if no valid session exists
3. onboarding if `onboarding_completed = false`
4. tab shell if onboarding is complete

### 3.2 Root Navigation Model

The root shell is a five-tab tab bar with independent stacks:

1. `Home`
2. `Train`
3. `My Workouts`
4. `Explore`
5. `You`

Each tab preserves its own navigation stack when the user switches tabs.

### 3.3 Full-Screen Ownership Model

The following are full-screen flows:

1. authentication
2. onboarding
3. paywall
4. Train active session
5. post-workout processing
6. post-workout summary
7. AI generation progress
8. AI generation preview

Paywall is always presented over the current owning surface. It does not become a sixth navigation root.

### 3.4 Sheet and Modal Model

Bottom sheets and modals are used for transactional or interruptive actions:

1. resume-or-discard resolution
2. finish confirmation
3. discard confirmation
4. rest timer override
5. in-session settings
6. plate calculator or load helper
7. rating submission
8. publish validation failure
9. publish success confirmation
10. restore purchases progress and result
11. creator block confirmation
12. erase-data confirmation

### 3.5 Cross-Tab Handoff Rules

Cross-tab handoffs are fixed:

1. `Home` can route to `Train`, `Explore`, or `You`, but it can never start a workout directly.
2. `Explore` and `My Workouts` can route into `Train` for `Start`.
3. `Train` completion routes can return to `Home` or `You > Progress`.
4. `You` history and report entries can open completed workout detail without changing Train ownership of live execution.

### 3.6 Shared Surface Model

Shared reusable surfaces are:

1. exercise search
2. exercise detail
3. creator profile detail
4. marketplace asset detail
5. load helper settings

Shared surfaces retain the ownership context that opened them for dismissal and return behavior.

## 4. Global UX Rules

1. `Home` is informational only. No workout start, quick-start, resume, finish, discard, or session mutation control may appear on `Home`.
2. `Train` owns every action that starts, resumes, logs, completes, discards, or mutates an active workout session.
3. The included onboarding starter plan is generated and persisted automatically during onboarding finalization.
4. Onboarding does not expose starter-plan preview, edit, discard, reroll, regenerate, rebuild, or evolution controls.
5. The onboarding completion path ends with one clear CTA that enters `Home`.
6. Post-onboarding AI generation is owned by `My Workouts`.
7. The launch paywall appears only when a premium trigger is reached. It does not appear automatically after onboarding.
8. Free routine slot-cap checks run before the sixth routine create, copy, or save insert is committed locally.
9. Routine `Start` from marketplace detail uses the published routine snapshot directly and does not create an editable copy or consume a free routine slot.
10. Program `Start` from marketplace detail requires a valid local program context. If the user does not already own or save the program and it is not the included starter plan, the premium-program-access gate runs before any local program record is created.
11. Exercise search is a flat ranked list. Results are not grouped into family sections.
12. Exercise result rows must show family context when relevant so same-family variations remain distinguishable.
13. Launch exercise detail is text-first. No image container, poster frame, video slot, shimmer media shell, or reserved future-media spacing may appear.
14. Launch exercise detail section order is fixed:
    1. `Overview`
    2. `How to Perform`
    3. `Tips`
    4. `Performance`
    5. `Recent History`
    6. `Similar Exercises`
15. Exercise-detail performance curves and recent-history lists are scoped to the exact canonical variation or exact custom exercise only. They never merge same-family variations into one launch chart or list.
16. Exercise-detail recent-history rows are ordered newest first by completion date.
17. `Similar Exercises` lists same-family variations first, then broader substitutes.
18. Post-workout summary does not expose a share card, share-result CTA, or system share handoff at launch.
19. Launch muscle-distribution analytics support exactly these ranges:
    1. `Last Session`
    2. `7D`
    3. `30D`
    4. `90D`
20. Launch muscle-distribution analytics render front and back body-map views from the same aggregated fact set.
21. Tapping a body-map region or its summary row filters the same-screen contributing-exercise list. Launch scope does not open a separate region-detail route.
22. Custom exercises are private to the author, searchable in Builder and Train, usable in owned assets only, and never valid for marketplace publication.
23. Warm-up rows remain visible anywhere set rows or completed sets are shown.
24. Warm-up rows never count toward:
    1. total logged working volume
    2. weekly KPI set totals
    3. weekly KPI volume totals
    4. PR detection
    5. muscle-distribution workload
25. Previous-value preload uses only the most recent completed set for the same exercise variation in the current workout.
26. Previous-value preload never reads cross-workout history, same-routine history, server data, or network state.
27. Launch load entry is exercise-driven:
    1. `single`
    2. `per_dumbbell`
    3. `left_right`
28. `per_dumbbell` uses one `Each` value and derives canonical total load as `2 x entered value`.
29. `left_right` uses inline `L` and `R` fields and keeps reps shared.
30. The plate calculator or load helper appears only in supported plate-loadable active-session contexts.
31. The in-session load helper may switch presets temporarily, but durable preset editing exists only in `You > Settings > Training > Load Helper`.
32. Apple Health launch controls are explicit and granular:
    1. connection state
    2. workout-write enabled or disabled state
    3. body-metric-read enabled or disabled state
    4. last successful sync timestamp when present
    5. current sync status
33. Ads are allowed only on:
    1. `Home` root
    2. `My Workouts` non-builder list surfaces
    3. `Explore` root lane and search-result browse surfaces
    4. `You > Profile` overview
    5. `You > Progress` overview
34. Banner ads are never allowed on onboarding, paywall, Train, active session, post-workout summary, builder, settings, integrations, support, governance, marketplace detail, or creator detail.
35. Allowed banners reserve no loading height.
36. No-fill and failure collapse the banner container to zero height.
37. Offline-cached-only browse suppresses banner rendering entirely.
38. Premium entitlement suppresses all ad requests and all ad placeholders.
39. Notification and Apple Health system prompts follow education screens. They never appear first.
40. Launch integrations UI references Apple Health only. Strava, Fitbit, Apple Watch, and other integrations must not appear as supported launch options.
41. Follow state, follower counts, and favorites UI remain hidden at launch.
42. Published workout templates are managed only through `My Workouts > Workouts > Published by Me`.
43. Published workout templates do not appear in Explore, public creator rails, marketplace search, marketplace action bars, or ratings.
44. Every destructive action uses explicit confirmation.
45. Local-first state takes priority over remote freshness for workout logging.
46. Cached marketplace and analytics content must show staleness when the snapshot is not fresh.
47. Deferred features may be referenced only as unavailable or absent launch behavior. They must not appear as partially active UI.
48. Launch marketplace ranking and browse ordering may use only these approved scored inputs:
    1. `completion_rate`
    2. `copy_count`
    3. `rating_score`
    4. `creator_credibility_score`
    5. `recency_weight`
49. PR outcomes, likes, follow state, and active-runners counters are not launch ranking inputs and are not launch marketplace display metrics.
50. Launch marketplace cards and detail surfaces show only creator identity plus approved launch metrics such as copy count, starts, completions, completion rate, and rating.

## 5. Complete Launch Screen Inventory

| # | Screen or Surface | Owner | Surface Type | Launch Status |
|---|---|---|---|---|
| 1 | Authentication Welcome | Authentication | full screen | launch |
| 2 | Email Sign Up | Authentication | full screen | launch |
| 3 | Email Log In | Authentication | full screen | launch |
| 4 | Password Reset Request | Authentication | full screen | launch |
| 5 | Onboarding Goal Selection | Onboarding | full screen step | launch |
| 6 | Onboarding Experience Level | Onboarding | full screen step | launch |
| 7 | Onboarding Equipment Selection | Onboarding | full screen step | launch |
| 8 | Onboarding Training Frequency | Onboarding | full screen step | launch |
| 9 | Onboarding Training Environment | Onboarding | full screen step | launch |
| 10 | Onboarding Body Metrics | Onboarding | full screen step | launch |
| 11 | Onboarding Source Attribution | Onboarding | full screen step | launch |
| 12 | Onboarding Notification Education | Onboarding | full screen step | launch |
| 13 | Onboarding Apple Health Education | Onboarding | full screen step | launch |
| 14 | Onboarding Finalization and Starter Plan Generation | Onboarding | full screen processing | launch |
| 15 | Starter Plan Ready Handoff | Onboarding | full screen completion | launch |
| 16 | Premium Paywall | current owner as cover | full-screen cover | launch |
| 17 | Subscription Management | You > Settings | push route | launch |
| 18 | Home Root | Home | tab root | launch |
| 19 | Train Root | Train | tab root | launch |
| 20 | Active Session | Train | full-screen route in tab stack | launch |
| 21 | Post-Workout Processing | Train | full-screen processing route | launch |
| 22 | Post-Workout Summary | Train | full-screen route | launch |
| 23 | My Workouts Root | My Workouts | tab root | launch |
| 24 | Workout Asset Detail | My Workouts | push route | launch |
| 25 | Routine Asset Detail | My Workouts | push route | launch |
| 26 | Program Asset Detail | My Workouts | push route | launch |
| 27 | AI Generation Progress | My Workouts | full-screen route | launch premium-gated |
| 28 | AI Generation Preview | My Workouts | full-screen route | launch premium-gated |
| 29 | Explore Root | Explore | tab root | launch |
| 30 | Explore Search Results | Explore | push route | launch |
| 31 | You Profile Overview | You | tab root segment | launch |
| 32 | You Progress Overview | You | tab root segment | launch |
| 33 | You Settings Root | You | tab root segment | launch |
| 34 | Profile Edit | You | push route | launch |
| 35 | Creator Profile Management | You | push route | launch |
| 36 | Goal and Targets | You > Progress | push route | launch |
| 37 | Muscle Distribution | You > Progress | push route | launch |
| 38 | History Calendar | You > Progress | push route | launch |
| 39 | Completed Workout Detail | You > Progress | push route | launch |
| 40 | Date Range Report | You > Progress | push route | launch |
| 41 | Body Measurements | You > Progress | push route | launch |
| 42 | Body Measurement Entry and Edit | You > Progress | push route or modal | launch |
| 43 | Account Settings | You > Settings | push route | launch |
| 44 | Notification Settings | You > Settings | push route | launch |
| 45 | Training Settings | You > Settings | push route | launch |
| 46 | Integrations Settings | You > Settings | push route | launch |
| 47 | Support Root | You > Settings | push route | launch |
| 48 | FAQ and Help Center | You > Support | push route | launch |
| 49 | Contact Support | You > Support | push route | launch |
| 50 | Product Feedback | You > Support | push route | launch |
| 51 | About | You > Support | push route | launch |
| 52 | Data Settings | You > Settings | push route | launch |
| 53 | Erase Data Confirmation Flow | You > Data | push route and modal confirmation | launch |
| 54 | Transfer Guidance | You > Data | push route | launch |
| 55 | Exercise Search | shared | full-screen route | launch |
| 56 | Custom Exercise Authoring | shared | full-screen route | launch |
| 57 | Exercise Detail | shared | push route or sheet | launch |
| 58 | Routine Marketplace Asset Detail | Explore shared | push route | launch |
| 59 | Program Marketplace Asset Detail | Explore shared | push route | launch |
| 60 | Creator Profile Detail | Explore shared | push route | launch |
| 61 | Workout Builder | My Workouts | push route | launch |
| 62 | Routine Builder | My Workouts | push route | launch |
| 63 | Program Builder | My Workouts | push route | launch premium-gated |
| 64 | Train Load Helper Sheet | Train | bottom sheet | launch |
| 65 | Load Helper Settings | You > Settings > Training | push route | launch |
| 66 | Resume or Discard Resolution | Train | bottom sheet | launch |
| 67 | Finish Workout Confirmation | Train | modal | launch |
| 68 | Discard Workout Confirmation | Train | modal | launch |
| 69 | Rest Timer Override | Train | bottom sheet | launch |
| 70 | In-Session Settings | Train | bottom sheet | launch |
| 71 | Rating Submission | Explore shared | bottom sheet | launch |
| 72 | Publish Validation Failure | My Workouts | sheet | launch |
| 73 | Publish Success Confirmation | My Workouts | sheet | launch |
| 74 | Restore Purchases Progress and Result | paywall or subscription | overlay | launch |
| 75 | Creator Block Confirmation | Creator profile detail | sheet | launch |
| 76 | Terms and Privacy External Handoff | paywall footer | system browser handoff | launch |
| 77 | Manage Subscription System Handoff | subscription management | App Store system handoff | launch |
| 78 | Notification Authorization Dialog | system | iOS permission dialog | launch |
| 79 | Apple Health Authorization Dialog | system | iOS permission dialog | launch |
| 80 | Safe External Link Browser | creator profile or legal/support links | system browser handoff | launch |

## 6. Route Ownership and Surface Boundaries

### 6.1 Root Owner Rules

1. `Home` owns:
   1. informational today summary
   2. active program snapshot
   3. weekly KPI summary card
   4. recommendation rail
2. `Train` owns:
   1. `Today`
   2. `Instant`
   3. `Recent`
   4. active session
   5. finish
   6. discard
   7. post-workout processing
   8. post-workout summary
3. `My Workouts` owns:
   1. owned workouts
   2. owned routines
   3. owned programs
   4. saved marketplace assets
   5. drafts
   6. builder
   7. publish management
   8. AI generation flow
4. `Explore` owns:
   1. category discovery
   2. search
   3. marketplace asset detail
   4. creator profile detail
   5. rating submission
5. `You` owns:
   1. profile
   2. creator profile management
   3. progress
   4. muscle distribution
   5. history
   6. reports
   7. body measurements
   8. goals and targets
   9. settings
   10. subscription management
   11. notifications
   12. integrations
   13. support
   14. governance

### 6.2 Shared Surface Owner Rules

1. Exercise search is owned by the caller:
   1. Builder caller returns the selected exercise into Builder.
   2. Train caller returns the selected exercise into the Train-owned pre-session context.
2. Exercise detail is read-only and returns to the caller without changing root ownership.
3. Marketplace asset detail is shared between Explore and My Workouts `Saved`; it retains marketplace action semantics in both entry contexts.
4. Creator profile detail is shared between Explore and You creator preview entry points.
5. Load Helper settings are owned by `You > Settings > Training`, even though the active-session helper reads the same preferences.

### 6.3 Surface Boundaries That May Not Be Broken

1. `Home` may not start a session.
2. `Explore` may not edit owned assets.
3. `You` may not own active-session runtime.
4. `My Workouts` may not render marketplace discovery lanes.
5. `Train` may not expose creator management, billing, or settings roots outside in-session settings.
6. No launch surface may expose comments, follow, favorites, or external AI assistant controls.
7. No launch surface may expose workout-template public marketplace discovery.

### 6.4 Publish and Marketplace Boundary Rules

1. `Published by Me` exists only in `My Workouts > Workouts`, `Programs`, and `Routines`.
2. Publish success returns to the same asset-type segment with `Published by Me` selected when the user has a creator profile.
3. Published workout templates stay visible only inside `My Workouts > Workouts > Published by Me`.
4. Explore and public creator detail may surface only routines and programs at launch.
5. Assets with custom exercises may remain privately usable but must fail launch publish validation.

### 6.5 Ad Boundary Rules

1. Banner ads may appear only on approved root overview surfaces.
2. Banner ads never appear inside drill-downs, builders, details, full-screen covers, or active execution surfaces.
3. Allowed banner placement is a layout contract, not an optional decoration.

### 6.6 Offline Boundary Rules

1. Train and Builder remain fully functional offline within launch local-first rules.
2. Explore becomes cached browse only when offline.
3. `You` becomes cached read-mostly for analytics and history when offline.
4. Publish, rating submission, Apple Health reconnect, and support submission are blocked when connectivity or authorization requirements are not met.

## 7. Onboarding UX Specification

### Onboarding Goal Selection

- Screen Name: `Onboarding Goal Selection`
- Owning Tab or Flow: `Onboarding`
- Launch Status: `Launch`
- Purpose: Capture the user's primary training goal that drives starter-plan generation, KPI labels, and goal-target defaults.
- Entry Points: First successful authentication when `onboarding_completed = false`; return from an incomplete onboarding session resume.
- Exit Points: `Onboarding Experience Level`.
- Primary User Jobs: Select one launch-supported goal; understand that the starter plan will be shaped by this choice.
- Primary CTA: `Continue`
- Secondary CTAs: None on first step.
- Information Hierarchy: Step header; question title; one-sentence explainer; goal options; disabled or enabled bottom CTA.
- Layout Structure: Persistent top progress header; vertically stacked goal cards; sticky bottom CTA.
- Modules / Components: Progress header; single-select goal cards; selected-state indicator; bottom CTA.
- Required Data: Current onboarding draft; selected `primary_goal`.
- User Actions: Tap a goal card; tap `Continue`.
- State Variants: No selection; selected goal; save-in-progress after `Continue`.
- Empty State: None.
- Loading State: CTA shows inline progress while the local step write commits.
- Error State: Inline validation if no goal is selected; inline retry if local step persistence fails.
- Offline State: Fully available; step progress persists locally and advances without network.
- Monetization / Entitlement Behavior: No paywall, no upgrade language, no premium branch.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Show one goal per tap target; keep the entire card tappable; use a single-selection model; do not expose hidden launch goals outside the active goal catalog.

### Onboarding Experience Level

- Screen Name: `Onboarding Experience Level`
- Owning Tab or Flow: `Onboarding`
- Launch Status: `Launch`
- Purpose: Calibrate the starter plan and future plan adaptation to `beginner`, `intermediate`, or `advanced`.
- Entry Points: `Onboarding Goal Selection`.
- Exit Points: `Onboarding Equipment Selection`; back to `Onboarding Goal Selection`.
- Primary User Jobs: Pick the experience level that best matches real training experience.
- Primary CTA: `Continue`
- Secondary CTAs: `Back`
- Information Hierarchy: Step header; question title; supporting explanation; three experience cards; bottom CTA.
- Layout Structure: Same step scaffold as the prior screen.
- Modules / Components: Progress header; three single-select cards; selected-state outline; sticky CTA row.
- Required Data: Onboarding draft; selected `experience_level`.
- User Actions: Select one level; continue; go back.
- State Variants: No selection; selected level; save-in-progress.
- Empty State: None.
- Loading State: CTA spinner during local save.
- Error State: Inline validation for missing selection; inline retry on failed save.
- Offline State: Fully available and locally persistent.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Use exact launch values `beginner`, `intermediate`, and `advanced`; keep descriptions short and comparison-focused.

### Onboarding Equipment Selection

- Screen Name: `Onboarding Equipment Selection`
- Owning Tab or Flow: `Onboarding`
- Launch Status: `Launch`
- Purpose: Capture the user's available equipment so starter-plan exercise selection and substitutions are constrained to available tools.
- Entry Points: `Onboarding Experience Level`.
- Exit Points: `Onboarding Training Frequency`; back to `Onboarding Experience Level`.
- Primary User Jobs: Select all available equipment; add manual fallback equipment text when the chip taxonomy is not sufficient.
- Primary CTA: `Continue`
- Secondary CTAs: `Back`
- Information Hierarchy: Step header; question title; explanation; multi-select equipment chip field; manual fallback entry; bottom CTA.
- Layout Structure: Progress header; scrollable chip grid; manual fallback input below the chip grid; sticky bottom CTA.
- Modules / Components: Progress header; multi-select chips; active selection count; manual fallback text row; CTA row.
- Required Data: Onboarding draft; equipment profile tags; optional manual fallback text.
- User Actions: Select or deselect chips; enter missing equipment text; continue; go back.
- State Variants: No selection; one or more selections; manual fallback populated; save-in-progress.
- Empty State: None.
- Loading State: CTA spinner on continue.
- Error State: Inline validation if no equipment profile is selected; inline retry if the step write fails.
- Offline State: Fully available; no remote dependency.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: The chip taxonomy must come from the launch equipment catalog already used by onboarding and AI generation; manual fallback is supportive metadata and must not replace required structured equipment selection.

### Onboarding Training Frequency

- Screen Name: `Onboarding Training Frequency`
- Owning Tab or Flow: `Onboarding`
- Launch Status: `Launch`
- Purpose: Capture the intended days-per-week frequency used by starter-plan split selection.
- Entry Points: `Onboarding Equipment Selection`.
- Exit Points: `Onboarding Training Environment`; back to `Onboarding Equipment Selection`.
- Primary User Jobs: Set a realistic weekly frequency between `1` and `7`.
- Primary CTA: `Continue`
- Secondary CTAs: `Back`
- Information Hierarchy: Step header; question title; bounded numeric selector; helper text; CTA.
- Layout Structure: Progress header; centered numeric stepper; supporting text; sticky bottom CTA.
- Modules / Components: Progress header; bounded stepper; increment and decrement controls; CTA row.
- Required Data: Onboarding draft; `training_days_per_week`.
- User Actions: Increment; decrement; tap continue; go back.
- State Variants: Default value selected; adjusted value; save-in-progress.
- Empty State: None.
- Loading State: CTA spinner after continue.
- Error State: Stepper clamps to `1...7`; failed save shows inline retry.
- Offline State: Fully available.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Use a bounded control with direct visual certainty; do not allow freeform values outside `1...7`.

### Onboarding Training Environment

- Screen Name: `Onboarding Training Environment`
- Owning Tab or Flow: `Onboarding`
- Launch Status: `Launch`
- Purpose: Capture whether the user's primary training environment is `commercial_gym`, `home_gym`, or `mixed`.
- Entry Points: `Onboarding Training Frequency`.
- Exit Points: `Onboarding Body Metrics`; back to `Onboarding Training Frequency`.
- Primary User Jobs: Choose the environment that best matches normal training conditions.
- Primary CTA: `Continue`
- Secondary CTAs: `Back`
- Information Hierarchy: Step header; question title; three single-select environment cards; CTA.
- Layout Structure: Same single-question step scaffold.
- Modules / Components: Progress header; environment cards; CTA row.
- Required Data: Onboarding draft; `training_environment`.
- User Actions: Select one environment; continue; go back.
- State Variants: No selection; selected environment; save-in-progress.
- Empty State: None.
- Loading State: CTA spinner during local save.
- Error State: Inline validation if no selection is made; inline retry on save failure.
- Offline State: Fully available.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Use exactly three launch options and no hidden fourth option.

### Onboarding Body Metrics

- Screen Name: `Onboarding Body Metrics`
- Owning Tab or Flow: `Onboarding`
- Launch Status: `Launch`
- Purpose: Capture body metrics needed for starter-plan calibration and body-metric continuity.
- Entry Points: `Onboarding Training Environment`.
- Exit Points: `Onboarding Source Attribution`; back to `Onboarding Training Environment`.
- Primary User Jobs: Enter height and weight; confirm or change the current unit preference.
- Primary CTA: `Continue`
- Secondary CTAs: `Back`
- Information Hierarchy: Step header; question title; unit toggle; height field; weight field; helper text; CTA.
- Layout Structure: Progress header; inline `Metric` and `Imperial` toggle; vertically stacked numeric fields; sticky CTA.
- Modules / Components: Progress header; unit segmented control; height input; weight input; field labels; inline validation messages; CTA row.
- Required Data: Onboarding draft; `body_metrics`; `unit_preference`.
- User Actions: Switch units; enter height; enter weight; continue; go back.
- State Variants: Metric mode; imperial mode; valid inputs; invalid inputs; save-in-progress.
- Empty State: None.
- Loading State: CTA spinner during commit.
- Error State: Field-level validation for missing or invalid values; failed save shows inline retry without clearing typed values.
- Offline State: Fully available; unit changes and values persist locally.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Height and weight are required; field labels and placeholders must update immediately when the unit toggle changes; entered values must convert rather than reset when units change.

### Onboarding Source Attribution

- Screen Name: `Onboarding Source Attribution`
- Owning Tab or Flow: `Onboarding`
- Launch Status: `Launch`
- Purpose: Capture optional source attribution for growth analytics without blocking onboarding completion.
- Entry Points: `Onboarding Body Metrics`.
- Exit Points: `Onboarding Notification Education`; back to `Onboarding Body Metrics`.
- Primary User Jobs: Select or enter how the user heard about Yoked, or skip.
- Primary CTA: `Continue`
- Secondary CTAs: `Skip`, `Back`
- Information Hierarchy: Step header; optional label; attribution options or input; CTA row.
- Layout Structure: Progress header; option list or field; sticky bottom CTA row.
- Modules / Components: Progress header; optional attribution options; optional free-text field; `Continue`; `Skip`.
- Required Data: Onboarding draft; optional `onboarding_source_attribution`.
- User Actions: Select attribution; type attribution; skip; continue; go back.
- State Variants: No attribution chosen; attribution selected; free-text filled; save-in-progress.
- Empty State: None.
- Loading State: CTA spinner during save.
- Error State: Failed local save shows inline retry; skipping remains available.
- Offline State: Fully available.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: This screen is optional. It must not hold the user in onboarding if they decline to answer.

### Onboarding Notification Education

- Screen Name: `Onboarding Notification Education`
- Owning Tab or Flow: `Onboarding`
- Launch Status: `Launch`
- Purpose: Explain the value of reminder and session-related notifications before the iOS notification prompt appears.
- Entry Points: `Onboarding Source Attribution`.
- Exit Points: `Onboarding Apple Health Education`.
- Primary User Jobs: Understand why notifications matter; choose whether to open the OS prompt now or defer.
- Primary CTA: `Enable Notifications`
- Secondary CTAs: `Not Now`, `Back`
- Information Hierarchy: Step header; title; benefit bullets; privacy framing; primary and secondary actions.
- Layout Structure: Progress header; hero explanation block; benefit list; footer CTA row.
- Modules / Components: Progress header; value block; category examples; primary CTA; defer CTA.
- Required Data: Local onboarding draft; current notification permission state.
- User Actions: Open OS prompt; defer prompt; go back.
- State Variants: Permission unknown; permission already authorized; permission denied previously; OS prompt returned authorized; OS prompt returned denied.
- Empty State: None.
- Loading State: Button disabled while waiting for the OS callback.
- Error State: If the OS prompt cannot be shown, show inline explanation and allow the user to continue.
- Offline State: Fully available because the prompt is system-owned, not network-owned.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Do not show the system prompt before this screen; declining must still advance onboarding.

### Onboarding Apple Health Education

- Screen Name: `Onboarding Apple Health Education`
- Owning Tab or Flow: `Onboarding`
- Launch Status: `Launch`
- Purpose: Explain Apple Health workout write behavior and optional body-metric read behavior before HealthKit authorization.
- Entry Points: `Onboarding Notification Education`.
- Exit Points: `Onboarding Finalization and Starter Plan Generation`.
- Primary User Jobs: Understand what Yoked writes to Apple Health and what body metrics it may read if permitted.
- Primary CTA: `Connect Apple Health`
- Secondary CTAs: `Not Now`, `Back`
- Information Hierarchy: Step header; title; value explanation; privacy framing; write and optional read scope summary; actions.
- Layout Structure: Same scaffold as notification education.
- Modules / Components: Progress header; benefits block; permission scope list; CTA row.
- Required Data: Local onboarding draft; current Health permission state.
- User Actions: Open HealthKit authorization; defer; go back.
- State Variants: Permission unknown; already connected; denied; partial authorization after callback.
- Empty State: None.
- Loading State: CTA disabled while waiting for HealthKit callback.
- Error State: If HealthKit authorization cannot be shown, show inline explanation and allow continue.
- Offline State: Fully available; the screen itself does not require network.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Explain launch scope precisely: completed workout writes and optional body-metric reads only. Do not mention Strava, Fitbit, Apple Watch, or Live Activity here.

### Onboarding Finalization and Starter Plan Generation

- Screen Name: `Onboarding Finalization and Starter Plan Generation`
- Owning Tab or Flow: `Onboarding`
- Launch Status: `Launch`
- Purpose: Persist the normalized onboarding profile, consume the one included starter-plan entitlement, and generate or fall back to a starter plan.
- Entry Points: `Onboarding Apple Health Education`.
- Exit Points: `Starter Plan Ready Handoff`.
- Primary User Jobs: Wait with confidence while the app finalizes profile state and prepares the starter plan.
- Primary CTA: None.
- Secondary CTAs: None.
- Information Hierarchy: Deterministic progress stage; one active status line; optional offline or retry explanation if needed.
- Layout Structure: Full-screen loading state with centered stage indicator and supporting copy.
- Modules / Components: Stage indicator; status label; optional last successful stage marker; optional retry explanation.
- Required Data: Final onboarding payload; starter-plan entitlement state; generation state; fallback starter-template availability.
- User Actions: No manual progression while processing; use retry only if the screen enters terminal failure.
- State Variants: Saving profile; generating starter plan; applying deterministic fallback starter templates; preparing app entry; queued remote profile sync after local completion.
- Empty State: None.
- Loading State: This screen is the loading state.
- Error State: If finalization times out before a local starter plan exists, show full-screen retry using preserved onboarding answers. If AI generation fails but deterministic fallback succeeds, do not show a terminal error state.
- Offline State: Local completion remains allowed. If remote profile submission cannot finish, queue sync and continue once the local starter plan is persisted.
- Monetization / Entitlement Behavior: The included entitlement is consumed on the first generation attempt, even if fallback templates are used. No paywall may appear here.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Use deterministic, non-looping status copy. Do not expose plan preview, edit, discard, or purchase branching.

### Starter Plan Ready Handoff

- Screen Name: `Starter Plan Ready Handoff`
- Owning Tab or Flow: `Onboarding`
- Launch Status: `Launch`
- Purpose: Confirm that the starter plan is ready and hand the user into the app with one clear next action.
- Entry Points: Successful completion of `Onboarding Finalization and Starter Plan Generation`.
- Exit Points: `Home Root`.
- Primary User Jobs: Acknowledge that onboarding is done and enter the app.
- Primary CTA: `Enter Home`
- Secondary CTAs: None.
- Information Hierarchy: Success state; brief starter-plan confirmation; one CTA.
- Layout Structure: Full-screen success state with centered confirmation block and bottom CTA.
- Modules / Components: Success header; short confirmation text; one CTA.
- Required Data: Included starter-plan record ID; generation completion state.
- User Actions: Tap `Enter Home`.
- State Variants: Normal success; success after deterministic fallback starter-template path.
- Empty State: None.
- Loading State: None.
- Error State: If the starter plan is persisted but a follow-on sync action fails, the screen still shows success and does not block entry.
- Offline State: Fully available after local generation or fallback completion.
- Monetization / Entitlement Behavior: No paywall. No premium copy. No upsell.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: This screen may show concise confirmation that a starter plan now exists in `My Workouts > Programs`, but it must not function as a preview or edit surface.

## 8. Authentication and Account UX Specification

### Authentication Welcome

- Screen Name: `Authentication Welcome`
- Owning Tab or Flow: `Authentication`
- Launch Status: `Launch`
- Purpose: Establish a durable account session with Apple, Google, or email.
- Entry Points: Cold launch with no valid session; logout; refresh-token failure; recent-auth requirement failure for destructive actions.
- Exit Points: `Onboarding Goal Selection` for new users; tab shell for returning users; email sign-up or log-in branches.
- Primary User Jobs: Choose an authentication method; begin email authentication if the user does not want a provider sign-in.
- Primary CTA: `Continue`
- Secondary CTAs: `Continue with Apple`, `Continue with Google`
- Information Hierarchy: Brand header; provider buttons; email field; continue button; log-in hint; footer copy.
- Layout Structure: Centered content stack with provider buttons first, email continuation second, footer actions last.
- Modules / Components: Apple provider button; Google provider button; email field; continue button; inline auth error region.
- Required Data: Provider availability; entered email; current network state.
- User Actions: Sign in with Apple; sign in with Google; enter email and continue.
- State Variants: Idle; provider handoff in progress; email continuation in progress; duplicate-provider collision returned from server.
- Empty State: None.
- Loading State: Provider and continue controls disable while a sign-in request is active.
- Error State: Inline error copy appears without clearing the email field or dismissing the screen.
- Offline State: Provider and email submission are disabled with inline offline explanation.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Keep provider buttons above the email flow; do not pre-open paywall or onboarding from this screen.

### Email Sign Up

- Screen Name: `Email Sign Up`
- Owning Tab or Flow: `Authentication`
- Launch Status: `Launch`
- Purpose: Create a new email-auth account.
- Entry Points: `Authentication Welcome` after email entry when the account does not already exist; explicit create-account link from `Email Log In`.
- Exit Points: `Onboarding Goal Selection`; `Email Log In`; back to `Authentication Welcome`.
- Primary User Jobs: Enter required sign-up data and create a new account.
- Primary CTA: `Create Account`
- Secondary CTAs: `Log In Instead`, `Back`
- Information Hierarchy: Header; display name; email; password; CTA; switch-to-login link.
- Layout Structure: Standard auth form with keyboard-safe bottom CTA.
- Modules / Components: Text fields; password field; CTA; inline validation area.
- Required Data: Display name; email; password; device context for registration.
- User Actions: Edit fields; submit; switch to log in; go back.
- State Variants: Empty form; partially filled; valid form; submission in progress.
- Empty State: None.
- Loading State: CTA spinner and disabled inputs during registration.
- Error State: Field-level validation and inline server error messaging without clearing the form.
- Offline State: Submission disabled with offline explanation.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Preserve typed values when the backend returns an error; route directly into onboarding after successful registration.

### Email Log In

- Screen Name: `Email Log In`
- Owning Tab or Flow: `Authentication`
- Launch Status: `Launch`
- Purpose: Sign in an existing email-auth user.
- Entry Points: `Authentication Welcome` after email entry when the account exists; explicit log-in link from sign-up.
- Exit Points: Tab shell for returning users; onboarding for users who signed in but never completed onboarding; `Password Reset Request`; back to `Authentication Welcome`.
- Primary User Jobs: Enter credentials and restore the existing account.
- Primary CTA: `Log In`
- Secondary CTAs: `Forgot Password`, `Create Account`, `Back`
- Information Hierarchy: Header; email; password; CTA; recovery and sign-up actions.
- Layout Structure: Standard auth form.
- Modules / Components: Email field; password field; CTA; recovery link; inline error region.
- Required Data: Email; password; network state.
- User Actions: Edit fields; submit; open password reset; switch to sign-up; go back.
- State Variants: Empty; populated; submission in progress; account temporarily locked.
- Empty State: None.
- Loading State: CTA spinner and disabled inputs during request.
- Error State: Inline error copy for invalid credentials, lockout, or expired session response.
- Offline State: Submission disabled with offline explanation.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Do not clear the password field on a recoverable server error unless the backend explicitly invalidates the credentials format.

### Password Reset Request

- Screen Name: `Password Reset Request`
- Owning Tab or Flow: `Authentication`
- Launch Status: `Launch`
- Purpose: Start an email password reset without revealing whether the address exists.
- Entry Points: `Email Log In`.
- Exit Points: `Email Log In`; `Authentication Welcome`.
- Primary User Jobs: Request reset instructions for an email account.
- Primary CTA: `Send Reset Link`
- Secondary CTAs: `Back to Log In`
- Information Hierarchy: Header; email field; brief explanation; CTA.
- Layout Structure: Single-field form.
- Modules / Components: Email field; CTA; confirmation message state.
- Required Data: Email.
- User Actions: Enter email; submit; return to log in.
- State Variants: Empty; valid email; request in progress; request accepted.
- Empty State: None.
- Loading State: CTA spinner during request.
- Error State: Invalid email format shows inline validation; backend acceptance remains non-revealing.
- Offline State: Submission disabled with offline explanation.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Always use a privacy-preserving success state after a valid request is accepted.

## 9. Paywall and Billing UX Specification

### Premium Paywall

- Screen Name: `Premium Paywall`
- Owning Tab or Flow: `Full-screen cover over current owning surface`
- Launch Status: `Launch`
- Purpose: Convert clear premium-value moments into subscription purchase opportunities without interrupting free onboarding completion.
- Entry Points: Sixth active routine create attempt; sixth active routine save attempt; sixth active routine copy attempt; post-onboarding AI generation entry; premium program save attempt; premium program copy attempt; premium program start attempt; voluntary upgrade from subscription settings.
- Exit Points: Return to the underlying surface; purchase success path back to the underlying surface with entitlement refreshed; subscription management system handoff.
- Primary User Jobs: Compare annual versus monthly plans; purchase; restore; dismiss if the user wants to stay free.
- Primary CTA: `Continue with Selected Plan`
- Secondary CTAs: `Restore Purchases`, `Close`, `Terms`, `Privacy`
- Information Hierarchy: Premium value header; benefit list; annual and monthly plan cards; billing-timing reassurance strip when relevant; primary CTA; legal footer.
- Layout Structure: Full-screen scrollable surface with sticky purchase footer that does not hide legal actions.
- Modules / Components: Hero header; plan cards; selected-state treatment; reassurance strip; CTA; restore action; close action; terms and privacy links.
- Required Data: Product catalog metadata; current entitlement state; current paywall source; runtime-config paywall trigger context.
- User Actions: Select annual plan; select monthly plan; purchase; restore; dismiss; open legal links.
- State Variants: Catalog loading; catalog loaded; trial eligible; trial ineligible; active entitlement bypass; purchase in progress; purchase interrupted; restore in progress; restore success; restore no entitlement; restore failure.
- Empty State: None.
- Loading State: Plan-card skeletons; disabled CTA until product metadata resolves.
- Error State: Billing error sheet for catalog load failure, pre-store selection failure, interrupted purchase, restore failure, or no-restore result.
- Offline State: Last-known entitlement remains visible; purchase CTA is disabled when product metadata is unavailable.
- Monetization / Entitlement Behavior: Annual and monthly plans are the only launch packages; premium removes ads and unlocks unlimited routines, post-onboarding AI generation, advanced analytics entitlement, advanced builder tools, and programs beyond the included starter plan.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: The paywall must explain the exact blocking reason before purchase. For slot-cap sources, repeat that workouts are unlimited and active routines are capped at `5`.

### Subscription Management

- Screen Name: `Subscription Management`
- Owning Tab or Flow: `You > Settings`
- Launch Status: `Launch`
- Purpose: Let the user inspect current entitlement state, restore purchases, and hand off to native subscription management.
- Entry Points: `You > Settings Root`; successful purchase completion follow-up; restore follow-up.
- Exit Points: Back to `You > Settings Root`; App Store manage-subscription handoff.
- Primary User Jobs: Understand current subscription state; restore; manage billing externally; upgrade if free.
- Primary CTA: `Manage Subscription`
- Secondary CTAs: `Restore Purchases`, `Upgrade to Premium`, `Back`
- Information Hierarchy: Current entitlement status; renewal or expiration summary when available; actions; restore result state.
- Layout Structure: Standard settings detail page with a top status card and action rows below.
- Modules / Components: Status card; renewal state row; manage-subscription button; restore button; upgrade button for non-premium users.
- Required Data: Entitlement state; renewal status when available; restore result state.
- User Actions: Open App Store subscription management; restore purchases; open paywall if upgrading from free.
- State Variants: `none`; `trial`; `active`; `grace`; `expired`; restore in progress; restore succeeded; restore failed.
- Empty State: None.
- Loading State: Inline spinner on restore; entitlement header shimmer while state hydrates.
- Error State: Persistent billing error message when restore fails or store handoff fails.
- Offline State: Existing entitlement state remains visible; restore and manage-subscription actions are disabled.
- Monetization / Entitlement Behavior: This is the in-app control center for launch billing state. It never exposes promo code, gifts, referrals, or creator monetization.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Keep the status language factual. Do not bury restore. Use the same entitlement terms everywhere: `none`, `trial`, `active`, `grace`, `expired`.

## 10. Home UX Specification

### Home Root

- Screen Name: `Home Root`
- Owning Tab or Flow: `Home`
- Launch Status: `Launch`
- Purpose: Give the user daily training context and lightweight insight without exposing execution controls.
- Entry Points: Tab selection; app root after onboarding; return from post-workout summary; Home deep links.
- Exit Points: `Train Root`; `Explore Root`; `You Progress Overview`; marketplace asset detail.
- Primary User Jobs: Understand today's training context; see one weekly KPI snapshot; inspect a recommendation.
- Primary CTA: `View in Train` from the today summary card
- Secondary CTAs: `View in You` from the KPI card; `View in Explore` from a recommendation card
- Information Hierarchy: Greeting and date; today summary; active program snapshot; one weekly KPI card; recommendation rail; optional banner slot.
- Layout Structure: One vertically scrolling column in this exact order:
  1. greeting and date row
  2. informational today summary card
  3. active program progress snapshot
  4. weekly KPI card
  5. recommendation rail
  6. optional banner slot for eligible free users
- Modules / Components: Greeting row; today summary card; goal progress chip; program progress bar; KPI delta card; recommendation rail; optional banner container.
- Required Data: Current date; latest available today-plan context; active program snapshot; latest KPI snapshot; recommendation rail payload; entitlement state; ad-eligibility state.
- User Actions: Tap today summary card; tap KPI card; tap recommendation card; pull to refresh.
- State Variants: Normal state with active program; no active program; no analytics yet; free ad-eligible; premium ad-suppressed; stale cached state.
- Empty State: If no active program exists, replace the program snapshot with a non-execution prompt that routes to `My Workouts` or `Explore`. If no analytics history exists, the KPI card states that workouts are required to unlock insight.
- Loading State: Skeleton greeting-adjacent modules; today summary skeleton; KPI skeleton; recommendation rail skeleton; banner slot reserves no space while unresolved.
- Error State: Inline retry for recommendation failure; stale KPI with last-sync label; banner collapse on no-fill or ad failure.
- Offline State: Show cached today context and cached KPI state with stale treatment; disable pull-to-refresh; suppress the banner entirely when the screen is in offline-cached-only browse.
- Monetization / Entitlement Behavior: No paywall is triggered from Home. Premium only changes ad suppression.
- Ad Behavior: At most one banner. The banner appears only after the recommendation rail and only for eligible free users on a connected root-state render.
- Notes for Stage-3C Design Execution: The today summary must never start a workout directly. The first actionable handoff is always a route into `Train`.

## 11. Train UX Specification

### Train Root

- Screen Name: `Train Root`
- Owning Tab or Flow: `Train`
- Launch Status: `Launch`
- Purpose: Own all workout start and resume entry points through `Today`, `Instant`, and `Recent`.
- Entry Points: Tab selection; Home handoff; marketplace or My Workouts start handoff; completion return.
- Exit Points: `Active Session`; `Post-Workout Summary`; exercise search when a pre-session add flow requires it; back to root segments.
- Primary User Jobs: Start today's planned workout; start an empty workout; rerun a recent workout; resume an existing local session.
- Primary CTA: `Resume` when an active session exists, otherwise `Start`
- Secondary CTAs: Segment switch; rerun from `Recent`; open owned or marketplace detail context passed into Train
- Information Hierarchy: Segmented header; resume banner when applicable; segment content; start controls or empty states.
- Layout Structure: Top segmented control with `Today`, `Instant`, and `Recent`; one segment body below; optional resume banner above the current segment body.
- Modules / Components: Segment control; resume banner; today planned workout cards; instant-start card; recent session list; recommendation cards inside Train where applicable.
- Required Data: Active session presence; planned workout context; recent session history; entry-mode handoff payloads.
- User Actions: Switch segments; start from a card; rerun a recent session; resolve resume-or-discard when another session is already active.
- State Variants: No active session; active session exists; no today plan; no recent sessions; empty instant state.
- Empty State: `Today` shows a non-blocking no-plan state with routes back to `My Workouts` or `Explore`; `Recent` shows a no-history state; `Instant` shows the empty-workout start card.
- Loading State: Resume hydration spinner; segment content skeletons while Train reads local projections.
- Error State: Local resume rebuild fallback; non-blocking banner if session initialization fails; action remains retryable.
- Offline State: Fully usable with local data. Cloud-only recommendation refresh is suppressed.
- Monetization / Entitlement Behavior: Train root itself does not trigger paywalls. Any premium or slot-cap gate is resolved before the session is created.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: If a local active session already exists, any new start attempt opens `Resume or Discard Resolution` instead of creating a second session.

### Active Session

- Screen Name: `Active Session`
- Owning Tab or Flow: `Train`
- Launch Status: `Launch`
- Purpose: Provide the full live workout logging surface with local-first set entry, timer, and completion controls.
- Entry Points: Successful start or resume from `Train Root`; successful `Start` from owned asset detail; successful `Start` from marketplace detail after gating passes.
- Exit Points: `Finish Workout Confirmation`; `Discard Workout Confirmation`; `Post-Workout Processing`; dismiss back to `Train Root` only after discard or completion.
- Primary User Jobs: Log reps and load quickly; complete sets; use the timer; use the load helper when supported; finish safely.
- Primary CTA: `Finish Workout`
- Secondary CTAs: Set checkmark completion; timer quick adjust; `Plate Calculator` or `Load Helper`; exercise detail; set-row overflow; `Discard`
- Information Hierarchy: Session header; context label for routine or program source when present; timer strip; exercise blocks; keypad dock; finish control.
- Layout Structure: Sticky top header; scrollable exercise list; sticky timer strip; bottom keypad dock that follows the active field.
- Modules / Components: Session title and elapsed timer; source context chip; exercise headers; set tables; warm-up row styling; numeric keypad; load-helper trigger; rest timer; finish and discard controls.
- Required Data: Workout session; session exercise instances; set entries; current load-entry mode; runtime checkpoints; load-helper preferences; current workout preload state.
- User Actions: Focus reps or load fields; enter values on keypad; mark a set complete; edit completed sets; open overflow actions; open exercise detail; open load helper; adjust or override timer; finish; discard.
- State Variants: `initializing`; `active`; `backgrounded` recovery; `completing`; `single` load mode; `per_dumbbell` mode; `left_right` mode; timer unavailable fallback.
- Empty State: None. An active session always has an execution surface.
- Loading State: Session initialization overlay before the session becomes interactive; completion-processing overlay after finish is confirmed.
- Error State: Non-blocking retry banner for local write failure; timer restore fallback to elapsed-only state; load-helper apply failure leaves the sheet open and the current row editable.
- Offline State: Fully available. All set writes stay local and queued completion sync does not block the session.
- Monetization / Entitlement Behavior: No paywall appears inside the active session. Premium state does not alter the execution UI.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Preloaded values must be visually distinct until edited or completed. Warm-up rows must be visibly distinct from working rows. `Each`, `L`, and `R` labels must appear inline in the active row when the load-entry mode requires them.

### Post-Workout Processing

- Screen Name: `Post-Workout Processing`
- Owning Tab or Flow: `Train`
- Launch Status: `Launch`
- Purpose: Freeze the finished session, write the local completion record, compute progress and PR outputs, and transition to summary.
- Entry Points: `Finish Workout Confirmation` after the user confirms finish.
- Exit Points: `Post-Workout Summary`; back to `Active Session` if the completion transaction fails and the user retries.
- Primary User Jobs: Understand that the workout is being finalized and not silently lost.
- Primary CTA: None.
- Secondary CTAs: `Retry` only when the transaction reaches a blocking failure.
- Information Hierarchy: Deterministic processing stage; optional sync-warning context only after local completion succeeds.
- Layout Structure: Full-screen centered processing state.
- Modules / Components: Stage label; progress indicator; optional retry action when needed.
- Required Data: Frozen workout session; immutable completion payload; local completion-record write result.
- User Actions: Wait; retry if the local completion write fails.
- State Variants: Local completion write in progress; local completion success with remote sync queued; local completion failure returning to Train.
- Empty State: None.
- Loading State: This surface is the loading state.
- Error State: If the local completion write fails, show retry and return-to-session behavior without discarding the workout.
- Offline State: Local completion succeeds and remote sync is queued later.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: The user must never wonder whether the workout was lost. Once the local completion record is written, the flow must continue even when remote sync is unavailable.

### Post-Workout Summary

- Screen Name: `Post-Workout Summary`
- Owning Tab or Flow: `Train`
- Launch Status: `Launch`
- Purpose: Show the completed workout outcome, PR results, warm-up count, and routine or program progress after local completion finalizes.
- Entry Points: `Post-Workout Processing`.
- Exit Points: `Home Root`; `You Progress Overview`; completed workout detail from history later.
- Primary User Jobs: Review what was completed; see PRs and progress; return to the correct next screen.
- Primary CTA: `Done`
- Secondary CTAs: `View Progress`
- Information Hierarchy: Completion header; core metrics; PR block; routine or program progress block; next actions.
- Layout Structure: Vertically scrolling summary with the metrics cluster first and next actions last.
- Modules / Components: Duration card; working-set count; working-volume summary; warm-up count; PR callouts; progress snapshot; return-action row.
- Required Data: Completion record; `volume_snapshot`; `pr_snapshot`; `progress_snapshot`; rating eligibility snapshot if relevant.
- User Actions: Dismiss back to Home; open Progress.
- State Variants: Workout-only completion; routine-session completion; program-session completion; PR count zero; PR count non-zero; sync warning shown.
- Empty State: None.
- Loading State: Not applicable after summary render completes.
- Error State: If remote sync fails, show a persistent but non-blocking sync warning. The summary still renders from local data.
- Offline State: Fully available from the local completion record.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Warm-up counts must appear separately from working totals. PR results come from final saved completion data only. Do not add a share card, share-result CTA, or system share handoff to this launch screen.

## 12. My Workouts UX Specification

### My Workouts Root

- Screen Name: `My Workouts Root`
- Owning Tab or Flow: `My Workouts`
- Launch Status: `Launch`
- Purpose: Manage all user-owned assets, saved marketplace assets, drafts, publish state, and AI-generation entry.
- Entry Points: Tab selection; save or copy success from Explore; return from builder; return from AI preview.
- Exit Points: Workout, routine, or program asset detail; builder; AI generation flow; Train start handoff; paywall when a premium or slot-cap trigger is hit.
- Primary User Jobs: Browse owned assets; create new assets; monitor free routine slot usage; manage published assets when a creator profile exists.
- Primary CTA: `Create`
- Secondary CTAs: Segment switch; filter switch; open asset detail; start from an owned asset; open AI generation; publish
- Information Hierarchy: Primary segment row; secondary `Owned` and `Published by Me` row where applicable; routine-slot usage strip; `4/5` warning when applicable; `5/5` upgrade card when applicable; optional banner; asset list; floating create action.
- Layout Structure: Top segment row in this exact order:
  1. `Workouts`
  2. `Programs`
  3. `Routines`
  4. `Saved`
  5. `Drafts`
  Within `Workouts`, `Programs`, and `Routines`, show `Owned` by default and `Published by Me` only when the user has a creator profile.
- Modules / Components: Segment control; ownership filter row; routine-slot usage strip; approaching-limit warning; upgrade card; optional banner; asset cards; floating create action; empty-state CTA.
- Required Data: Owned workouts; owned routines; owned programs; saved assets; drafts; creator-profile existence; active routine count; entitlement state.
- User Actions: Switch segments; switch `Owned` and `Published by Me`; open asset detail; create; start; publish; archive; duplicate; open paywall from locked actions.
- State Variants: Free `0/5-3/5`; free `4/5`; free `5/5`; premium unlimited; creator profile absent; creator profile present; list state; empty state.
- Empty State: Each segment has its own empty state with a segment-appropriate CTA. `Published by Me` empty states remain inside the asset-type segment and keep the secondary filter visible.
- Loading State: Asset skeletons; filter row visible during `Published by Me` hydration; autosave indicator when returning from a builder; banner slot reserves no loading space.
- Error State: Inline retry for `Published by Me` fetch failure; autosave failure banner; publish validation sheet; slot-cap paywall before sixth routine insert.
- Offline State: Draft editing remains available; cached published assets show stale treatment; publish-state mutations are disabled; non-builder banner is suppressed.
- Monetization / Entitlement Behavior: Free users always see the exact routine-slot contract. Program create and post-onboarding AI generation are premium-gated. Sixth routine create, copy, or save opens paywall before local insert.
- Ad Behavior: One banner maximum on non-builder list surfaces only. The banner sits below slot-usage and upgrade messaging and above the asset list.
- Notes for Stage-3C Design Execution: Workouts never count toward slot usage. The usage label format is fixed to `x/5 active routines used`.

### Workout Asset Detail

- Screen Name: `Workout Asset Detail`
- Owning Tab or Flow: `My Workouts`
- Launch Status: `Launch`
- Purpose: Inspect and manage a local workout template, including publish management for creator-owned workouts.
- Entry Points: `My Workouts Root > Workouts`.
- Exit Points: `Train Root` start handoff; `Workout Builder`; back to `My Workouts Root`; publish sheets when applicable.
- Primary User Jobs: Start the workout; edit structure; inspect metadata; manage publish state if eligible.
- Primary CTA: `Start`
- Secondary CTAs: `Edit`, `Duplicate`, `Archive`, `Publish` or `Unpublish`
- Information Hierarchy: Title; tags and duration; source attribution when copied; structure preview; publish state; action bar.
- Layout Structure: Header; metadata block; structure preview list; action row pinned at the bottom.
- Modules / Components: Title row; goal and equipment tags; duration; publish eligibility badge; exercise block preview; action buttons.
- Required Data: Workout detail; exercise blocks; publish status; publish eligibility snapshot if the viewer has a creator profile.
- User Actions: Start; edit; duplicate; archive; publish; unpublish.
- State Variants: Draft; owned published-by-me; copied-from-source; publish-ineligible; publish-eligible.
- Empty State: None.
- Loading State: Detail skeleton until the local detail payload hydrates.
- Error State: Publish validation failure sheet; local detail hydration retry.
- Offline State: View and edit remain available; publish and unpublish are disabled.
- Monetization / Entitlement Behavior: Workouts are unlimited for free users. No paywall is tied to workout ownership. Publish is gated by creator eligibility, not premium.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Published workout templates remain private to management surfaces. Do not add marketplace `Save`, `Copy`, `Rate`, or public-share actions here.

### Routine Asset Detail

- Screen Name: `Routine Asset Detail`
- Owning Tab or Flow: `My Workouts`
- Launch Status: `Launch`
- Purpose: Inspect and manage a local routine, start the next session, and handle publish management.
- Entry Points: `My Workouts Root > Routines`.
- Exit Points: `Train Root` start handoff; `Routine Builder`; back to `My Workouts Root`.
- Primary User Jobs: Start the routine's next session; edit the routine; inspect days; publish if eligible.
- Primary CTA: `Start`
- Secondary CTAs: `Edit`, `Duplicate`, `Archive`, `Publish` or `Unpublish`
- Information Hierarchy: Title; difficulty and weekly frequency; source attribution when copied; next-session marker inside the day list; publish and trust state; action row.
- Layout Structure: Header; metadata block; ordered day-assignment list; footer action row.
- Modules / Components: Title and meta; day cards; `Next Session` marker; publish eligibility badge; action row.
- Required Data: Routine detail; ordered day assignments; progress projection sufficient to identify the next session; publish state.
- User Actions: Start; edit; duplicate; archive; publish; unpublish.
- State Variants: Owned routine; saved or copied lineage; draft; published-by-me; publish-ineligible; publish-eligible.
- Empty State: None.
- Loading State: Detail skeleton.
- Error State: Publish validation failure sheet; detail hydration retry.
- Offline State: Viewing and editing remain available; publish is blocked; start works from the local routine record.
- Monetization / Entitlement Behavior: Viewing an existing local routine never triggers paywall. Creating a new sixth routine is blocked before insert elsewhere in the flow.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: The day list must make the next startable day obvious. Do not imply that starting a local routine consumes another routine slot.

### Program Asset Detail

- Screen Name: `Program Asset Detail`
- Owning Tab or Flow: `My Workouts`
- Launch Status: `Launch`
- Purpose: Inspect and manage a local program, start the next scheduled session, and expose the edit lock for non-premium users.
- Entry Points: `My Workouts Root > Programs`; included starter plan deep link from onboarding or Home program snapshot.
- Exit Points: `Train Root` start handoff; `Program Builder` when allowed; back to `My Workouts Root`.
- Primary User Jobs: Start the next scheduled session; inspect schedule; understand whether editing is locked.
- Primary CTA: `Start`
- Secondary CTAs: `Edit`, `Duplicate`, `Archive`, `Publish` or `Unpublish`
- Information Hierarchy: Title; difficulty and duration; included-starter-plan badge when relevant; next-session marker in weekly schedule; action row.
- Layout Structure: Header; metadata; ordered weekly schedule preview; footer actions.
- Modules / Components: Title block; included-starter-plan badge; weekly schedule list; next-session marker; publish state row.
- Required Data: Program detail; weekly schedule; local progress projection; entitlement state; included-starter-plan flag.
- User Actions: Start; edit when allowed; duplicate when allowed; archive; publish; unpublish.
- State Variants: Included starter plan on free entitlement; owned premium program; saved or copied program; draft; publish-ineligible; publish-eligible.
- Empty State: None.
- Loading State: Detail skeleton.
- Error State: Edit lock explanation for non-premium users; publish validation failure sheet; detail hydration retry.
- Offline State: Start works only from a valid local program context; editing remains available only when entitlement allows and local data exists.
- Monetization / Entitlement Behavior: Free users may view and start only the included starter plan. Program edit, duplication into another local program, and additional program ownership remain premium-only.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Make the included starter plan visibly distinct without implying it can be rerolled or regenerated for free.

### AI Generation Progress

- Screen Name: `AI Generation Progress`
- Owning Tab or Flow: `My Workouts`
- Launch Status: `Launch premium-gated`
- Purpose: Run post-onboarding AI generation, regeneration, evolution, or rebuild after premium access is confirmed.
- Entry Points: Premium user taps the AI generation entry in `My Workouts`; entitled user taps regenerate or evolve from a later premium surface if present in the same My Workouts flow.
- Exit Points: `AI Generation Preview`; back to `My Workouts Root` on terminal failure.
- Primary User Jobs: Wait while the app generates a saved draft candidate from current user data.
- Primary CTA: None.
- Secondary CTAs: `Retry` only on terminal failure.
- Information Hierarchy: Deterministic generation stage; one active status line; no branching controls.
- Layout Structure: Full-screen progress surface.
- Modules / Components: Stage indicator; status line; failure explanation when needed.
- Required Data: Premium entitlement state; generation request type; current user profile and targets; completion summary.
- User Actions: Wait; retry after failure.
- State Variants: Initial generation; evolution; rebuild; successful generation; fallback template output.
- Empty State: None.
- Loading State: This screen is the loading state.
- Error State: Full-screen retry with preserved request context if generation and repair both fail.
- Offline State: Launch AI generation does not proceed without the network dependency required by the premium generation request.
- Monetization / Entitlement Behavior: Entry is premium-only. Free users never reach this screen.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: This is separate from onboarding starter-plan generation. Do not reuse onboarding wording here.

### AI Generation Preview

- Screen Name: `AI Generation Preview`
- Owning Tab or Flow: `My Workouts`
- Launch Status: `Launch premium-gated`
- Purpose: Let the user accept, edit, or discard the generated asset before it becomes the next started asset.
- Entry Points: Successful `AI Generation Progress`.
- Exit Points: `Program Builder` when the user chooses edit; back to `My Workouts Root` on accept or discard.
- Primary User Jobs: Review the generated structure and explanation; decide whether to save, edit, or discard it.
- Primary CTA: `Accept`
- Secondary CTAs: `Edit`, `Discard`
- Information Hierarchy: Asset title and schedule summary; explanation blocks; structure preview; action row.
- Layout Structure: Header; explanation modules first; preview below; persistent action footer.
- Modules / Components: Title; goal tags; duration summary; explanation blocks for equipment fit, schedule fit, and progression logic; schedule preview.
- Required Data: Generated asset payload; explanation metadata; confidence state.
- User Actions: Accept; edit; discard.
- State Variants: Generated program; fallback template output with low-confidence labeling.
- Empty State: None.
- Loading State: None after this screen loads.
- Error State: If the generated asset fails local save on accept, show a blocking retry and keep the preview intact.
- Offline State: The preview can remain readable if already generated locally, but accept requires the local save path to succeed.
- Monetization / Entitlement Behavior: This screen exists only after premium gating is already satisfied.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: `Accept` saves the asset and returns it to the correct segment. `Edit` opens Builder. `Discard` returns to `My Workouts` without saving a new local asset.

## 13. Explore UX Specification

### Explore Root

- Screen Name: `Explore Root`
- Owning Tab or Flow: `Explore`
- Launch Status: `Launch`
- Purpose: Browse the launch marketplace through a horizontal category rail and a vertical ranked feed of routines, programs, and creator spotlights.
- Entry Points: Tab selection; Home recommendation handoff; marketplace deep links.
- Exit Points: Search results; marketplace asset detail; creator profile detail.
- Primary User Jobs: Discover routines and programs; move between category lanes; open trusted detail pages.
- Primary CTA: `Open Asset Detail`
- Secondary CTAs: Search; switch category lane; open creator profile
- Information Hierarchy: Search field; category rail; optional banner; ranked feed.
- Layout Structure: Top search field; horizontal category rail; optional banner slot; vertical feed.
- Modules / Components: Search field; category chips; ranked cards; creator spotlight cards; optional banner container.
- Required Data: Lane snapshots ranked from approved launch ranking inputs only; search availability; moderation projections; ad-eligibility state; entitlement state.
- User Actions: Search; switch lanes; tap cards; pull to refresh.
- State Variants: Fresh ranked feed; stale cached feed; empty lane; limited content after moderation filtering.
- Empty State: If a lane has no eligible content, show lane-specific no-content copy and keep the category rail visible.
- Loading State: Cached cards first when available; shimmer skeletons for unresolved cards; banner reserves no space.
- Error State: Retry card for feed failure; toast for action failure triggered from a child card.
- Offline State: Cached browse only. Rate and uncached save or copy actions are unavailable. Routine start is allowed only when the required published snapshot is already cached locally.
- Monetization / Entitlement Behavior: Browsing is free. Program actions may still be locked by premium-program access when the user reaches a program detail.
- Ad Behavior: One banner maximum on root-lane browse only, below the search field and category rail and above the feed.
- Notes for Stage-3C Design Execution: This screen must never become a fullscreen immersive feed. Keep card density vertical and marketplace-oriented. Do not add active-runners counters, PR badges, or PR-outcome metadata to launch cards.

### Explore Search Results

- Screen Name: `Explore Search Results`
- Owning Tab or Flow: `Explore`
- Launch Status: `Launch`
- Purpose: Return ranked search results across routines, programs, and creators under one marketplace taxonomy.
- Entry Points: Search submission from `Explore Root`; search deep link.
- Exit Points: Marketplace asset detail; creator profile detail; back to `Explore Root`.
- Primary User Jobs: Narrow discovery with search and type filters; open the correct result quickly.
- Primary CTA: `Open Result`
- Secondary CTAs: Change query; switch type filter; back to root lanes
- Information Hierarchy: Sticky search field; persistent category rail; type-filter row; optional banner; result list.
- Layout Structure: Search field at the top; category rail retained below it; type filters below the rail; optional banner below search controls; result list below the banner.
- Modules / Components: Search field; type filters `All`, `Routines`, `Programs`, `Creators`; ranked result cards; optional banner.
- Required Data: Search query; type filter; search-result payload; cached result state; moderation projections.
- User Actions: Edit query; switch filters; open a result; pull to refresh.
- State Variants: All-results view; routines-only; programs-only; creators-only; stale cached results.
- Empty State: If no results match the final query and filters, show a no-results state that preserves the search field and type filters.
- Loading State: Debounced result spinner; list skeletons while the query resolves; banner reserves no space.
- Error State: Retry card with the last query preserved.
- Offline State: Cached results remain readable when present; banner is suppressed; result actions follow the same cached marketplace rules as root browse.
- Monetization / Entitlement Behavior: Search is free. Premium gates occur only after the user reaches a locked result action.
- Ad Behavior: One banner maximum on search-result browse, below the search field and category rail and above the result list.
- Notes for Stage-3C Design Execution: Keep this as a browse surface, not a hidden social feed. Search ranking order must still reflect launch marketplace ranking rules.

## 14. You UX Specification

### You Profile Overview

- Screen Name: `You Profile Overview`
- Owning Tab or Flow: `You`
- Launch Status: `Launch`
- Purpose: Show user identity, creator summary, and profile-owned overview modules.
- Entry Points: Tab selection; profile deep links; return from profile edit.
- Exit Points: `Profile Edit`; `Creator Profile Management`; `Creator Profile Detail`; `Subscription Management`.
- Primary User Jobs: Review profile basics; edit the profile; enter or manage creator mode.
- Primary CTA: `Edit Profile`
- Secondary CTAs: `Create Creator Profile` or `Manage Creator Profile`; `Open Creator Preview`
- Information Hierarchy: Profile header; creator summary block when present; first non-ad overview module when creator summary is absent; optional banner below required overview modules.
- Layout Structure: Vertical overview page with the header first and action rows below.
- Modules / Components: Avatar and name header; bio; creator summary card; overview rows; optional banner slot.
- Required Data: User profile; creator-profile existence and summary; entitlement state for ad suppression.
- User Actions: Edit profile; create creator profile; manage creator profile; open creator preview.
- State Variants: Creator profile absent; creator profile present; no published assets; premium ad-suppressed; free ad-eligible.
- Empty State: When no creator profile exists, replace creator summary with a creator-mode creation card.
- Loading State: Header shimmer; creator summary shimmer; no reserved banner height.
- Error State: Inline retry on profile refresh failure; last-synced data may remain visible.
- Offline State: Cached profile remains visible; edit submission is queued only when safe; banner is suppressed in offline-cached-only state.
- Monetization / Entitlement Behavior: No paywall is tied to profile overview. Premium only suppresses ads.
- Ad Behavior: At most one banner below the profile header and creator summary block, or below the first non-ad overview module when creator summary is absent.
- Notes for Stage-3C Design Execution: Do not place a banner above identity or trust-critical content.

### You Progress Overview

- Screen Name: `You Progress Overview`
- Owning Tab or Flow: `You`
- Launch Status: `Launch`
- Purpose: Present the launch analytics overview, including body-map preview, without exposing deferred advanced analytics.
- Entry Points: Tab selection; Home KPI handoff; return from history, reports, goals, or body measurements.
- Exit Points: `Goal and Targets`; `Muscle Distribution`; `History Calendar`; `Date Range Report`; `Body Measurements`; `Completed Workout Detail`.
- Primary User Jobs: Inspect weekly KPI state; open body-map analytics; open history; open reports; open body measurements; manage goals and targets.
- Primary CTA: `Open Muscle Distribution`
- Secondary CTAs: `View History`; `Open Report`; `Open Body Measurements`; `Open Goals and Targets`
- Information Hierarchy: KPI cluster first; body-map preview second inside the same analytics cluster; optional banner below the full analytics cluster; overview entry cards for goals, history, reports, and body measurements below the banner.
- Layout Structure: One vertical overview page with the KPI cluster and body-map preview fixed as the first analytics content block.
- Modules / Components: KPI cards; date-range control for KPI scope; read-only body-map preview card; goals-and-targets summary card; history entry card; report entry card; body-measurement entry card; optional banner.
- Required Data: Weekly KPI snapshot; body-map preview snapshot; last sync state; goal targets; history summary counts; body-measurement summary.
- User Actions: Change KPI range; tap the body-map preview card to open muscle distribution; open history; open report; open body measurements; open goals and targets; pull to refresh.
- State Variants: Fresh analytics; stale cached analytics; no completed workouts yet; no body-map data yet; no body measurements yet.
- Empty State: If no completed workouts exist, show the KPI empty state and body-map preview empty state and keep history and report entries visible but disabled until data exists. If no body measurements exist, the body-measurement entry uses add-first copy.
- Loading State: KPI skeleton cluster first; no banner height reserved until non-ad overview content exists.
- Error State: Last-sync fallback plus retry; drill-down entries remain available when their local cached payload exists.
- Offline State: Cached KPI snapshot and history entry points remain readable; banner is suppressed.
- Monetization / Entitlement Behavior: Launch shows basic analytics only. No advanced analytics module is surfaced here.
- Ad Behavior: At most one banner below the primary KPI and overview analytics cluster and above lower overview modules.
- Notes for Stage-3C Design Execution: Keep the overview analytical cluster limited to KPI plus a read-only body-map preview card. The preview card is a drill-in affordance only and must not support region taps, range switching, or same-screen filtering from the overview. Do not add strength score, recovery score, cross-exercise rankings, achievements, streaks, or coach cards to this launch screen.

### You Settings Root

- Screen Name: `You Settings Root`
- Owning Tab or Flow: `You`
- Launch Status: `Launch`
- Purpose: Group all launch settings and support roots under one in-app settings hub.
- Entry Points: `You` segmented root.
- Exit Points: Account, notifications, training, integrations, subscription, support, and data sub-screens.
- Primary User Jobs: Open the correct settings area quickly.
- Primary CTA: `Open Selected Settings Row`
- Secondary CTAs: `Sign Out`
- Information Hierarchy: Sectioned settings list.
- Layout Structure: Simple grouped list with fixed section ordering.
- Modules / Components: Account row; Notifications row; Training row; Integrations row; Subscription row; Support row; Data row; sign-out action.
- Required Data: Current permission states; entitlement state; sync state badges where relevant.
- User Actions: Tap a row; sign out.
- State Variants: Normal; stale summary values; queued setting update indicator.
- Empty State: None.
- Loading State: Row placeholder shimmer until settings summaries hydrate.
- Error State: Inline row subtitle error when a child status cannot refresh.
- Offline State: Rows remain accessible, but child actions that require network or system callbacks are disabled once opened.
- Monetization / Entitlement Behavior: `Subscription` is the only billing row. Premium changes ad suppression and some child-row locked states.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Keep settings ownership inside `You`. Do not duplicate settings rows anywhere else.

### Profile Edit

- Screen Name: `Profile Edit`
- Owning Tab or Flow: `You`
- Launch Status: `Launch`
- Purpose: Edit the user's display name, avatar, and bio.
- Entry Points: `You Profile Overview`.
- Exit Points: Back to `You Profile Overview`.
- Primary User Jobs: Update visible identity fields.
- Primary CTA: `Save`
- Secondary CTAs: `Cancel`
- Information Hierarchy: Avatar edit first; display name; bio; save action.
- Layout Structure: Standard editable form.
- Modules / Components: Avatar picker; display-name field; bio field; save footer.
- Required Data: Current profile values.
- User Actions: Change avatar; edit fields; save; cancel.
- State Variants: Unchanged; dirty; upload in progress; save in progress.
- Empty State: None.
- Loading State: Avatar upload spinner; save spinner.
- Error State: Inline field errors; avatar upload retry.
- Offline State: Save queues only when the local profile write path is safe; remote avatar upload-dependent changes are deferred.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Returning from save should crossfade the avatar and update the overview immediately.

### Creator Profile Management

- Screen Name: `Creator Profile Management`
- Owning Tab or Flow: `You`
- Launch Status: `Launch`
- Purpose: Create or edit the user's creator profile and inspect launch publish and visibility state.
- Entry Points: `You Profile Overview`.
- Exit Points: Back to `You Profile Overview`; `My Workouts` published-by-me surfaces when the user chooses to manage assets there.
- Primary User Jobs: Create or update creator identity; understand publish eligibility and visibility tier.
- Primary CTA: `Save Creator Profile`
- Secondary CTAs: `Manage Published Assets`, `Cancel`
- Information Hierarchy: Creator identity fields first; specialization and links next; eligibility and tier summary after editable fields.
- Layout Structure: Form sections followed by read-only trust state.
- Modules / Components: Public slug field; creator display-name field; bio field; specialization tags; external-link rows; eligibility status card; visibility-tier card.
- Required Data: Creator profile if it exists; specialization-tag taxonomy; external-link allowlist validation result; eligibility state.
- User Actions: Edit fields; add or remove links; save; open published asset management.
- State Variants: No creator profile yet; existing profile; publish-ineligible; tier `0`; tier `1`; tier `2`.
- Empty State: When no creator profile exists, the screen opens in creation mode with empty editable fields and explanatory eligibility copy.
- Loading State: Form skeleton on first load; save spinner during commit.
- Error State: Slug validation failure; link validation failure; save retry.
- Offline State: Local field edits may queue when safe, but slug validation and final save confirmation require connectivity.
- Monetization / Entitlement Behavior: Creator mode is not a subscription feature. Publish eligibility is separate from premium entitlement.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: No follow metrics, follower counts, or follower management may appear here.

### Goal and Targets

- Screen Name: `Goal and Targets`
- Owning Tab or Flow: `You > Progress`
- Launch Status: `Launch`
- Purpose: Let the user review and edit active goals and per-exercise targets.
- Entry Points: `You Progress Overview`.
- Exit Points: Back to `You Progress Overview`.
- Primary User Jobs: Inspect current goals; change active goals; add, edit, or remove per-exercise targets.
- Primary CTA: `Save Targets`
- Secondary CTAs: `Add Exercise Target`, `Cancel`
- Information Hierarchy: Active goals first; per-exercise targets second; save action last.
- Layout Structure: Scrollable list with a fixed save footer when dirty.
- Modules / Components: Goal selection block; target rows; add-target control; save footer.
- Required Data: Current goal targets; searchable exercise reference for exercise-target assignment.
- User Actions: Change goals; add target; edit target; remove target; save.
- State Variants: No exercise targets yet; one or more targets; dirty state; save in progress.
- Empty State: If no per-exercise targets exist, show an add-target prompt below the active-goal block.
- Loading State: Existing values shimmer until loaded.
- Error State: Field-level validation on invalid target values; save retry.
- Offline State: Local edits may queue when safe; no network is required to keep the current goal and target state visible.
- Monetization / Entitlement Behavior: No paywall.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Keep this launch screen focused on goal configuration, not advanced analytics interpretation.

### Muscle Distribution

- Screen Name: `Muscle Distribution`
- Owning Tab or Flow: `You > Progress`
- Launch Status: `Launch`
- Purpose: Show front and back body-map analytics plus a summary and contributing-exercise list for the selected launch range.
- Entry Points: `You Progress Overview`.
- Exit Points: `Exercise Detail`; back to `You Progress Overview`.
- Primary User Jobs: Inspect which muscle regions received the most workload; switch ranges; inspect contributing exercises.
- Primary CTA: `Back`
- Secondary CTAs: `Last Session`, `7D`, `30D`, `90D`, `Front`, `Back`
- Information Hierarchy: Range control first; front or back body map second; legend third; workload summary list fourth; contributing-exercise list fifth.
- Layout Structure: Sticky range control at the top; front or back body map below; legend and summary list directly below the map; contributing-exercise list at the bottom of the same scroll surface.
- Modules / Components: Range segmented control; front or back toggle; front body map; back body map; five-band legend; summary rows; contributing-exercise rows.
- Required Data: Selected-range muscle-distribution snapshot; front-region intensities; back-region intensities; legend bands; descending summary rows; contributing-exercise rows; last sync state; selected region state when active.
- User Actions: Switch range; switch front or back view; tap a body-map region; tap a summary row; tap a contributing exercise to open Exercise Detail; clear region filter; pull to refresh.
- State Variants: `Last Session`; `7D`; `30D`; `90D`; front view; back view; no region selected; region filter active; stale cached snapshot.
- Empty State: If the selected range has no completed non-warmup working sets, show an empty analytics state with the range control still visible and no phantom region intensity.
- Loading State: Body-map skeleton, legend skeleton, and summary-row skeleton; no banner slot exists.
- Error State: Retry state with last cached snapshot fallback when available.
- Offline State: Cached snapshots remain readable with stale treatment; refresh is disabled.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Workload comes only from completed non-warmup working sets. Use `actual_load * actual_reps` for load-bearing rep sets, `actual_reps` for loadless rep sets, and `duration_seconds` for timed-only sets. Allocate `70%` across primary muscles and `30%` across secondary muscles when both exist, `100%` across primary muscles when no secondary muscles exist, and `unclassified` only when no valid launch mapping exists. Normalize region intensity within the selected range so the highest non-zero region reads as the highest band and all other non-zero regions scale linearly beneath it. Tapping a region or summary row filters the same-screen contributing-exercise list. Launch does not open a separate region-detail route. The legend must use five visible intensity bands and the map must support front and back views.

### History Calendar

- Screen Name: `History Calendar`
- Owning Tab or Flow: `You > Progress`
- Launch Status: `Launch`
- Purpose: Show calendar-based completed workout history.
- Entry Points: `You Progress Overview`.
- Exit Points: `Completed Workout Detail`; back to `You Progress Overview`.
- Primary User Jobs: Pick a date; inspect completed sessions on that date.
- Primary CTA: `Open Completed Workout`
- Secondary CTAs: Change month; back
- Information Hierarchy: Calendar first; selected-day session list second.
- Layout Structure: Month calendar at the top and same-screen selected-day list below.
- Modules / Components: Calendar grid; completion-state date cells; selected-day list; session rows.
- Required Data: Completion-record dates; selected-day session summaries.
- User Actions: Change month; tap date; open a completed workout.
- State Variants: No sessions on selected day; one session; multiple sessions; stale cached history.
- Empty State: Empty selected-day list with `No completed workouts on this date`.
- Loading State: Calendar skeleton; selected-day list skeleton.
- Error State: Cached history fallback plus retry.
- Offline State: Cached history remains readable with stale treatment.
- Monetization / Entitlement Behavior: Basic history is free.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Calendar cells must reflect completion presence only. Do not add streak or achievement affordances.

### Completed Workout Detail

- Screen Name: `Completed Workout Detail`
- Owning Tab or Flow: `You > Progress`
- Launch Status: `Launch`
- Purpose: Show a read-only historical view of a completed session with warm-up visibility preserved.
- Entry Points: `History Calendar`; `Date Range Report`.
- Exit Points: Back to the caller.
- Primary User Jobs: Inspect completed exercises, sets, working totals, warm-up counts, and source routine or program context.
- Primary CTA: `Back`
- Secondary CTAs: `Open Related Goal and Targets` when relevant
- Information Hierarchy: Completion header; summary metrics; exercise list with set rows; source context.
- Layout Structure: Read-only version of the completion surface.
- Modules / Components: Summary block; warm-up count; exercise blocks; set rows; source-context chip.
- Required Data: Completion record; linked session detail projection.
- User Actions: Scroll; inspect exercise rows; go back.
- State Variants: Workout-only; routine-session; program-session; PR count zero; PR count non-zero.
- Empty State: None.
- Loading State: Detail skeleton.
- Error State: Retry when the local history detail projection fails to hydrate.
- Offline State: Cached history detail remains readable.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: This is read-only. Keep warm-up rows visible and clearly labeled while keeping KPI totals working-set only.

### Date Range Report

- Screen Name: `Date Range Report`
- Owning Tab or Flow: `You > Progress`
- Launch Status: `Launch`
- Purpose: Summarize workout history for a specific date range and link into completed workout detail.
- Entry Points: `You Progress Overview`.
- Exit Points: `Completed Workout Detail`; back to `You Progress Overview`.
- Primary User Jobs: Select a start and end date; review report totals; open a session detail.
- Primary CTA: `Apply Range`
- Secondary CTAs: `Reset`, `Back`
- Information Hierarchy: Date range controls; report totals; session list.
- Layout Structure: Range controls at the top; report summary below; result list below the summary.
- Modules / Components: Start-date picker; end-date picker; apply action; report summary cards; completed-session list.
- Required Data: Completion records in the selected date window.
- User Actions: Set date range; apply; reset; open a session detail.
- State Variants: Valid range with results; valid range without results; stale cached report.
- Empty State: `No completed workouts in this date range`.
- Loading State: Spinner or skeleton after apply.
- Error State: Retry state with the selected range preserved.
- Offline State: Cached report windows remain readable when already materialized locally.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Report totals stay within launch KPI semantics and must not introduce deferred analytics modules.

### Body Measurements

- Screen Name: `Body Measurements`
- Owning Tab or Flow: `You > Progress`
- Launch Status: `Launch`
- Purpose: Show manual body-measurement history as a chart and log list.
- Entry Points: `You Progress Overview`.
- Exit Points: `Body Measurement Entry and Edit`; back to `You Progress Overview`.
- Primary User Jobs: Review measurement change over time; add or edit entries.
- Primary CTA: `Add Measurement`
- Secondary CTAs: Change measurement category; change chart range; edit existing entry
- Information Hierarchy: Current category selector; chart first; entry log second; add action last.
- Layout Structure: Category and range controls at the top; chart below; log list below the chart.
- Modules / Components: Category selector; range control; chart; measurement log rows; add button.
- Required Data: Measurement entries for the selected category and range.
- User Actions: Change category; change range; add entry; edit entry.
- State Variants: No entries yet; entries present; unit preference changed.
- Empty State: No data state with add-first CTA.
- Loading State: Chart and list skeletons.
- Error State: Retry when chart data or log data fails to load.
- Offline State: Cached entries remain visible; new entry submission remains local-first when supported.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: The category selector must use the launch body-measurement taxonomy already present in the product model and must not invent extra measurement categories in this spec.

### Body Measurement Entry and Edit

- Screen Name: `Body Measurement Entry and Edit`
- Owning Tab or Flow: `You > Progress`
- Launch Status: `Launch`
- Purpose: Create or edit a body-measurement record.
- Entry Points: `Body Measurements`.
- Exit Points: Back to `Body Measurements`.
- Primary User Jobs: Choose a measurement category, enter the value, and save the date-stamped record.
- Primary CTA: `Save Measurement`
- Secondary CTAs: `Cancel`, `Delete` when editing an existing entry
- Information Hierarchy: Category; value; date; save action.
- Layout Structure: Compact form sheet or push route, depending on space.
- Modules / Components: Category field; value field; date picker; save footer.
- Required Data: Existing entry when editing; unit preference for display.
- User Actions: Change category; enter value; change date; save; delete if editing.
- State Variants: Create; edit; save in progress; delete in progress.
- Empty State: None.
- Loading State: Save or delete spinner.
- Error State: Field-level validation; save retry.
- Offline State: Local-first write when safe; queued remote sync later.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Preserve historical values and render them in the current unit preference after conversion.

### Account Settings

- Screen Name: `Account Settings`
- Owning Tab or Flow: `You > Settings`
- Launch Status: `Launch`
- Purpose: Expose account lifecycle, linked-provider status, and destructive account actions.
- Entry Points: `You Settings Root`.
- Exit Points: Re-authentication branch if required; back to `You Settings Root`.
- Primary User Jobs: Inspect account status; reset password for email-auth accounts; request account deletion.
- Primary CTA: `Delete Account`
- Secondary CTAs: `Reset Password`, `Resend Verification`, `Sign Out`, `Back`
- Information Hierarchy: Account identity summary first; linked providers second; destructive actions last.
- Layout Structure: Grouped settings page with a destructive footer section.
- Modules / Components: Email status row; verification state row; linked-provider list; reset-password row; delete-account row; sign-out row.
- Required Data: Auth provider list; verification state; recent-auth state.
- User Actions: Reset password; resend verification; delete account; sign out.
- State Variants: Email-auth account; provider-only account; recent-auth valid; recent-auth required.
- Empty State: None.
- Loading State: Row-level spinners for destructive or verification actions.
- Error State: Inline retry for verification resend; explicit error when recent-auth is required before deletion.
- Offline State: Destructive and verification actions are disabled.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Account deletion must remain a multi-step confirmed action and must never masquerade as data erase.

### Notification Settings

- Screen Name: `Notification Settings`
- Owning Tab or Flow: `You > Settings`
- Launch Status: `Launch`
- Purpose: Let the user manage launch notification categories and reminder scheduling.
- Entry Points: `You Settings Root`.
- Exit Points: Back to `You Settings Root`.
- Primary User Jobs: Enable or disable categories; configure reminder schedule; understand OS authorization status.
- Primary CTA: `Save Notification Settings`
- Secondary CTAs: `Open iOS Settings`, `Back`
- Information Hierarchy: Authorization state first; category toggles second; schedule controls third.
- Layout Structure: Status banner at top, then grouped rows.
- Modules / Components: OS authorization state banner; toggles for:
  1. workout reminder
  2. program day reminder
  3. rest timer completion
  4. missed workout
  5. PR celebration
  6. rating eligibility
  Schedule fields for:
  7. default reminder time
  8. quiet-hours start
  9. quiet-hours end
  10. adherence window hours
- Required Data: Notification preference payload; OS authorization state.
- User Actions: Toggle categories; edit schedule values; open iOS Settings when permission is denied; save.
- State Variants: Authorized; denied; unknown; preprompt seen; dirty state; save in progress.
- Empty State: None.
- Loading State: Row shimmer on first load; save spinner during commit.
- Error State: Save retry on failed schedule write; permission-denied explanatory state without misleading toggles.
- Offline State: Existing preferences remain visible; writes queue only when safe.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Keep categories editable even when permission is denied, but make delivery-blocked state explicit.

### Training Settings

- Screen Name: `Training Settings`
- Owning Tab or Flow: `You > Settings`
- Launch Status: `Launch`
- Purpose: Own launch unit preference control and provide the entry to `Load Helper` settings.
- Entry Points: `You Settings Root`.
- Exit Points: `Load Helper Settings`; back to `You Settings Root`.
- Primary User Jobs: Change unit preference; open load-helper preset editing.
- Primary CTA: `Save Training Settings`
- Secondary CTAs: `Open Load Helper`, `Back`
- Information Hierarchy: Unit preference first; load-helper entry second.
- Layout Structure: Small settings page.
- Modules / Components: `Metric` or `Imperial` control; preview labels that update immediately; `Load Helper` row.
- Required Data: Current `unit_preference`; current load-helper summary.
- User Actions: Switch units; open load-helper settings; save when needed.
- State Variants: Metric; imperial; dirty state; save in progress.
- Empty State: None.
- Loading State: Row shimmer until settings hydrate.
- Error State: Save retry on unit-preference write failure.
- Offline State: Current state remains readable; writes queue only when safe.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Do not expose theme, app icon, or manual language controls here at launch.

### Integrations Settings

- Screen Name: `Integrations Settings`
- Owning Tab or Flow: `You > Settings`
- Launch Status: `Launch`
- Purpose: Manage Apple Health connection state, workout-write state, body-metric-read state, and sync visibility.
- Entry Points: `You Settings Root`; completion follow-up nudges when relevant.
- Exit Points: Back to `You Settings Root`.
- Primary User Jobs: Connect, reconnect, or inspect Apple Health status; enable or disable workout writes; enable or disable body-metric reads.
- Primary CTA: `Connect Apple Health` or `Reconnect Apple Health`
- Secondary CTAs: `Back`
- Information Hierarchy: Apple Health status card first; workout-write toggle second; body-metric-read toggle third; last-sync row fourth; current-status row fifth; reconnect action last.
- Layout Structure: Single-provider settings page.
- Modules / Components: Apple Health connection cell; workout-write toggle; body-metric-read toggle; last-sync row; current-status row; reconnect action.
- Required Data: Apple Health authorization state; workout-write enabled state; body-metric-read enabled state; last sync state; current sync status.
- User Actions: Connect; reconnect; open Health authorization flow; toggle workout writes; toggle body-metric reads.
- State Variants: Not connected; connected; partial authorization; workout-write disabled; body-metric-read disabled; error state.
- Empty State: None.
- Loading State: Reconnect spinner while the connection state refreshes.
- Error State: Inline retry when Health authorization or status refresh fails.
- Offline State: Connection attempts are disabled; last known status remains visible.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Show only Apple Health at launch. Do not render disabled rows for Strava, Fitbit, or Apple Watch.

### Support Root

- Screen Name: `Support Root`
- Owning Tab or Flow: `You > Settings`
- Launch Status: `Launch`
- Purpose: Group support, feedback, and about surfaces.
- Entry Points: `You Settings Root`.
- Exit Points: FAQ, contact support, feedback, about.
- Primary User Jobs: Reach the correct support destination.
- Primary CTA: `Open Selected Support Row`
- Secondary CTAs: `Back`
- Information Hierarchy: FAQ; contact; feedback; about.
- Layout Structure: Simple grouped list.
- Modules / Components: FAQ row; contact support row; product feedback row; about row.
- Required Data: None beyond row availability.
- User Actions: Tap a row.
- State Variants: Normal; content-refresh error summary when child content cannot hydrate.
- Empty State: None.
- Loading State: Row shimmer on first load.
- Error State: Child-row inline retry state.
- Offline State: The list remains visible; contact and feedback submission actions are blocked inside their child screens.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Keep support inside `You`; do not open an external help center by default when an in-app surface exists.

### FAQ and Help Center

- Screen Name: `FAQ and Help Center`
- Owning Tab or Flow: `You > Support`
- Launch Status: `Launch`
- Purpose: Provide in-app answers before the user opens support or feedback.
- Entry Points: `Support Root`.
- Exit Points: Back to `Support Root`.
- Primary User Jobs: Browse help topics and answers.
- Primary CTA: `Open FAQ Article`
- Secondary CTAs: `Back`
- Information Hierarchy: Help-topic list.
- Layout Structure: Scrollable list of article rows.
- Modules / Components: Search-free FAQ list; article rows; inline answer disclosure or drill-down.
- Required Data: Help content payload.
- User Actions: Open an article; go back.
- State Variants: Normal; stale cached help content.
- Empty State: No help articles available.
- Loading State: Article-list skeleton.
- Error State: Retry with cached content fallback when available.
- Offline State: Cached help content remains readable.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Keep help content in-app when content is available locally.

### Contact Support

- Screen Name: `Contact Support`
- Owning Tab or Flow: `You > Support`
- Launch Status: `Launch`
- Purpose: Submit a support request.
- Entry Points: `Support Root`.
- Exit Points: Back to `Support Root`.
- Primary User Jobs: Enter the issue and send a support request.
- Primary CTA: `Send Support Request`
- Secondary CTAs: `Back`
- Information Hierarchy: Subject; message; contact email; submit action.
- Layout Structure: Form page.
- Modules / Components: Subject field; message field; contact-email field; submit CTA.
- Required Data: Submission type `support`; subject; message; contact email; app build attached automatically.
- User Actions: Edit fields; submit; go back.
- State Variants: Empty form; valid form; submit in progress; queued success.
- Empty State: None.
- Loading State: Submit spinner.
- Error State: Validation errors; deterministic failure or queued state explanation.
- Offline State: Submission is disabled when the screen cannot create a supported queued request for launch.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Keep the form simple and explicit. Do not expose community discussion or public ticket threads.

### Product Feedback

- Screen Name: `Product Feedback`
- Owning Tab or Flow: `You > Support`
- Launch Status: `Launch`
- Purpose: Submit product feedback or a feature request.
- Entry Points: `Support Root`.
- Exit Points: Back to `Support Root`.
- Primary User Jobs: Send structured feedback to Yoked.
- Primary CTA: `Send Feedback`
- Secondary CTAs: `Back`
- Information Hierarchy: Subject; message; contact email; submit action.
- Layout Structure: Same form pattern as contact support.
- Modules / Components: Subject field; message field; contact-email field; submit CTA.
- Required Data: Submission type `feedback` or `feature_request`; subject; message; contact email.
- User Actions: Edit fields; submit; go back.
- State Variants: Empty; valid; submit in progress; success.
- Empty State: None.
- Loading State: Submit spinner.
- Error State: Validation errors and deterministic failure messaging.
- Offline State: Submission is disabled when a launch-safe queued path is unavailable.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Keep this separate from support to preserve routing clarity on the backend.

### About

- Screen Name: `About`
- Owning Tab or Flow: `You > Support`
- Launch Status: `Launch`
- Purpose: Show installed app version and app-identification details.
- Entry Points: `Support Root`.
- Exit Points: Back to `Support Root`.
- Primary User Jobs: Confirm the installed app version.
- Primary CTA: `Back`
- Secondary CTAs: None.
- Information Hierarchy: App identity first; installed version second.
- Layout Structure: Simple read-only info page.
- Modules / Components: App name; version number; build number.
- Required Data: Installed app version and build.
- User Actions: Read; go back.
- State Variants: Normal.
- Empty State: None.
- Loading State: Brief placeholder until the installed build metadata resolves.
- Error State: If build metadata is unavailable, show an inline unavailable message instead of blank space.
- Offline State: Fully available.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Keep this factual and lightweight.

### Data Settings

- Screen Name: `Data Settings`
- Owning Tab or Flow: `You > Settings`
- Launch Status: `Launch`
- Purpose: Expose governance-safe data controls and sync visibility.
- Entry Points: `You Settings Root`.
- Exit Points: `Erase Data Confirmation Flow`; `Transfer Guidance`; back to `You Settings Root`.
- Primary User Jobs: Review sync state; open transfer guidance; start erase flow.
- Primary CTA: `Erase Data`
- Secondary CTAs: `Open Transfer Guidance`, `Back`
- Information Hierarchy: Sync state first; governance rows second; availability status for export and import last.
- Layout Structure: Grouped settings page with a destructive section at the bottom.
- Modules / Components: Last-sync row; sync-state row; transfer-guidance row; erase-data row; read-only status rows for export and import availability.
- Required Data: Current sync state; last sync time; governance capability availability flags.
- User Actions: Open transfer guidance; open erase flow.
- State Variants: Synced; pending; failed; offline.
- Empty State: None.
- Loading State: Row shimmer on first load.
- Error State: Sync-state fetch retry; governance job status card if a prior erase request failed.
- Offline State: Sync state remains readable from cache; erase initiation is disabled if recent-auth or network requirements are not met.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Export and import appear only as unavailability status, not as launch actions.

### Erase Data Confirmation Flow

- Screen Name: `Erase Data Confirmation Flow`
- Owning Tab or Flow: `You > Data`
- Launch Status: `Launch`
- Purpose: Confirm a user-initiated erase request with warning-first copy and multi-step consent.
- Entry Points: `Data Settings`.
- Exit Points: Back to `Data Settings`.
- Primary User Jobs: Understand the scope of erase; confirm intentionally.
- Primary CTA: `Confirm Erase Request`
- Secondary CTAs: `Cancel`
- Information Hierarchy: Scope explanation; consequences; recent-auth requirement; final confirmation.
- Layout Structure: Push route with final modal confirmation before submit.
- Modules / Components: Scope selector if supported by launch erase scope; warning copy; confirmation checkbox or equivalent deliberate confirmation; submit action.
- Required Data: Available erase scopes; recent-auth state.
- User Actions: Review warning; confirm; submit; cancel.
- State Variants: Recent-auth valid; recent-auth required; submit in progress; request queued.
- Empty State: None.
- Loading State: Submit spinner.
- Error State: Explicit failure if scheduling the erase request fails.
- Offline State: Submission is disabled.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Keep erase separate from account deletion wording. The screen must show the last known sync state before final confirmation.

### Transfer Guidance

- Screen Name: `Transfer Guidance`
- Owning Tab or Flow: `You > Data`
- Launch Status: `Launch`
- Purpose: Explain current launch transfer and portability availability without exposing non-launch import or export actions.
- Entry Points: `Data Settings`.
- Exit Points: Back to `Data Settings`.
- Primary User Jobs: Understand what portability options exist at launch and what does not.
- Primary CTA: `Back`
- Secondary CTAs: None.
- Information Hierarchy: Launch guidance first; export status second; import status third.
- Layout Structure: Read-only informational page.
- Modules / Components: Guidance copy; `Export not available at launch` status; `Import not available at launch` status.
- Required Data: Governance capability availability flags.
- User Actions: Read and return.
- State Variants: Normal.
- Empty State: None.
- Loading State: Brief content placeholder until the guidance payload resolves.
- Error State: Inline retry if the guidance content fails to load.
- Offline State: Cached guidance remains visible when present.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: This page may reference later portability capability only as unavailable status, not as a hidden launch action.

## 15. Exercise Search UX Specification

### Exercise Search

- Screen Name: `Exercise Search`
- Owning Tab or Flow: `Shared`
- Launch Status: `Launch`
- Purpose: Provide low-latency canonical and custom exercise search for Builder and Train.
- Entry Points: Add exercise from Builder; replace or swap in Builder; pre-session exercise insertion flows in Train; no-result recovery from existing Builder or Train contexts.
- Exit Points: Return selected exercise to the caller; `Exercise Detail`; `Custom Exercise Authoring`; back to caller.
- Primary User Jobs: Find an exercise fast; understand the canonical variation; select it into the calling context.
- Primary CTA: `Select Exercise`
- Secondary CTAs: Open result detail; apply filters; create custom exercise from no-result state
- Information Hierarchy: Sticky search field; filter row; result list.
- Layout Structure: Search field pinned at top; filter chips below; flat ranked list below filters.
- Modules / Components: Search field; active-filter count; filter chips for muscle, equipment, movement pattern, and duration; result rows; no-result custom-exercise CTA.
- Required Data: Local exercise index; alias map; current filters; caller context; excluded-preference state.
- User Actions: Type query; clear query; apply filters; open result detail; select result; open custom exercise authoring.
- State Variants: No query; query active; filters active; excluded result visible; custom result visible; stale local index unavailable fallback.
- Empty State: If the final post-filter result set is zero, show the no-result state with a CTA to create a custom exercise.
- Loading State: Result list updates after debounce; local search never blocks the screen with a full overlay.
- Error State: If the local index is unavailable, show retry and block selection until the index is restored.
- Offline State: Fully available because launch search is local-index driven.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Result rows must show canonical exercise name, equipment tags, muscle focus, and family context when relevant. Excluded exercises remain manually selectable and must not be hidden.

### Custom Exercise Authoring

- Screen Name: `Custom Exercise Authoring`
- Owning Tab or Flow: `Shared`
- Launch Status: `Launch`
- Purpose: Create or edit a private custom exercise for owned use only.
- Entry Points: Exercise-search no-result state in Builder; exercise-search no-result state in Train; edit an existing custom exercise from owned contexts.
- Exit Points: Return saved exercise to the caller; back to `Exercise Search`.
- Primary User Jobs: Create a missing exercise quickly with only launch-required fields.
- Primary CTA: `Save Custom Exercise`
- Secondary CTAs: `Cancel`, `Delete` when editing
- Information Hierarchy: Name first; muscle groups second; equipment tags third; instructions last; save action.
- Layout Structure: One vertical form page.
- Modules / Components: Name field; muscle-group selector; equipment-tag selector; structured instruction field; save footer.
- Required Data: User ownership context; custom-exercise draft when editing.
- User Actions: Enter or edit fields; save; delete when editing; choose replacement exercise if deleting a custom exercise with dependencies.
- State Variants: Create; edit; dependency-aware delete; save in progress.
- Empty State: None.
- Loading State: Save or delete spinner.
- Error State: Required-field validation; duplicate-name conflict; delete blocked until dependent assets are reassigned.
- Offline State: Local-first create and edit remain available; sync is limited to the same signed-in user across devices later.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Expose only launch-required fields: name, muscle groups, equipment tags, and instructions. Do not add publish, marketplace, or public-visibility controls.

## 16. Exercise Detail UX Specification

### Exercise Detail

- Screen Name: `Exercise Detail`
- Owning Tab or Flow: `Shared`
- Launch Status: `Launch`
- Purpose: Teach exercise execution and show exact-variation launch performance through one continuous text-first detail surface.
- Entry Points: Exercise search result; Builder row; Train row; marketplace exercise preview link.
- Exit Points: Back to caller; return selected exercise if opened from a selection context.
- Primary User Jobs: Understand how to perform the movement; review exact-variation progress; compare same-family variations; optionally exclude the exercise from recommendations.
- Primary CTA: `Select Exercise` when opened from a selection context; no primary CTA when opened as read-only detail
- Secondary CTAs: `Exclude`; open a similar exercise; back
- Information Hierarchy: Title and metadata first; `Overview`; `How to Perform`; `Tips`; `Performance`; `Recent History`; `Similar Exercises`.
- Layout Structure: One vertical scroll surface with optional in-page anchors only.
- Modules / Components: Title and metadata block; overview text; ordered instruction steps; tip list; performance curve; metric chips; time-window chips; recent-history rows; similar-exercise list.
- Required Data: Exercise definition; preference state; exact-variation performance snapshot including `default_metric`, `available_metrics`, `selected_range`, `available_ranges`, and point series; exact-variation recent-history rows; same-family variations; substitute exercises.
- User Actions: Scroll; tap an in-page anchor when present; switch curve metric; switch curve time window; tap a curve point to inspect the exact value for that completion; tap a history row to open completed workout detail when allowed by the caller; open a similar exercise; toggle `Exclude` from the launch-allowed preference action.
- State Variants: Canonical exercise; custom exercise; excluded state; metric `estimated_1rm`; metric `top_set_load`; metric `session_working_volume`; metric `best_completed_reps`; metric `best_duration_seconds`; range `30D`; range `90D`; range `180D`; range `1Y`; range `All Time`; performance available; performance empty; stale cached performance; history available; history empty; stale cached history; same-family variations present; no same-family variations present.
- Empty State: If no completed non-warmup working sets exist for the exact variation, show explicit empty states in both `Performance` and `Recent History`. If no similar exercises exist, show an explicit `No similar exercises available` footer inside the section.
- Loading State: Text skeleton blocks plus curve and history skeletons. Metric and time-window chips remain visible only after the performance payload exists.
- Error State: Inline retry with cached text and analytics fallback. If text loads but analytics fail, the `Performance` and `Recent History` modules each show their own recoverable error treatment without collapsing the rest of the screen.
- Offline State: Cached text detail, cached curve, and cached recent history remain readable without media. If analytics were never cached for the exact variation, both analytics modules show offline-unavailable states instead of loading forever.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: No tabs. No segmented control. No media placeholder. The curve and history modules are exact-variation only, not family aggregate. Default metric selection follows the data shape: `estimated_1rm` when load and reps exist, `top_set_load` when load exists without usable rep data, `best_completed_reps` for loadless rep work, and `best_duration_seconds` for timed-only work. Alternate metrics are limited to `top_set_load`, `session_working_volume`, `best_completed_reps`, and `best_duration_seconds` when those metrics are valid for the scoped exercise. Time windows are exactly `30D`, `90D`, `180D`, `1Y`, and `All Time`. The curve is single-series only, with point tap inspection and no compare mode. The `Recent History` list is newest first and each row must show completion date, workout title, source context when present, best-set summary, scoped session working volume, and PR marker when available. The `Similar Exercises` section must clearly label same-family variations before broader substitutes.

## 17. Marketplace Asset Detail UX Specification

### Routine Marketplace Asset Detail

- Screen Name: `Routine Marketplace Asset Detail`
- Owning Tab or Flow: `Explore shared`
- Launch Status: `Launch`
- Purpose: Show a published routine with launch marketplace actions in the required order.
- Entry Points: Explore card; Explore search result; My Workouts `Saved` routine; deep link.
- Exit Points: `Train Root` start handoff; back to caller; `Rating Submission`; `Creator Profile Detail`.
- Primary User Jobs: Evaluate the routine and either start it, save it, copy it, or rate it when eligible.
- Primary CTA: `Start`
- Secondary CTAs: `Save`, `Copy`, `Rate`
- Information Hierarchy: Title; creator identity; goal, equipment, duration, and muscle-focus metadata; trust metrics; structure preview; action bar.
- Layout Structure: Scrollable detail page with the action bar pinned at the bottom.
- Modules / Components: Hero metadata block; creator row; metrics rows for copy count, starts, completions, completion rate, and rating; structure preview; fixed action bar.
- Required Data: Routine detail; creator summary; metrics; action-state payload; moderation projection.
- User Actions: Start; save; copy; rate; open creator detail.
- State Variants: Saved; not saved; copied; rating locked; rating eligible; limited visibility label; suppressed content not renderable.
- Empty State: None.
- Loading State: Detail placeholders until hydration completes.
- Error State: Cached summary fallback; retry; action failure toast for save, copy, start, or rate.
- Offline State: Cached read-only detail is allowed. Start is allowed only when the published routine snapshot exists locally. Save and copy queue only when the full asset payload is already cached locally. Rate is unavailable.
- Monetization / Entitlement Behavior: `Start` does not consume a routine slot and does not create an editable copy. `Save` and `Copy` may trigger the free routine slot-cap gate before local insert.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Action order is fixed to `Start`, `Save`, `Copy`, `Rate`, with `Start` visually primary and listed first. Detail metrics are limited to copy count, starts, completions, completion rate, and rating. Do not add active-runners or PR-outcome display.

### Program Marketplace Asset Detail

- Screen Name: `Program Marketplace Asset Detail`
- Owning Tab or Flow: `Explore shared`
- Launch Status: `Launch`
- Purpose: Show a published program with premium-program access gates applied before local materialization.
- Entry Points: Explore card; Explore search result; My Workouts `Saved` program; deep link.
- Exit Points: `Train Root` start handoff; back to caller; `Rating Submission`; `Creator Profile Detail`; paywall when premium access is required.
- Primary User Jobs: Evaluate the program and either start it, save it, copy it, or rate it when eligible.
- Primary CTA: `Start`
- Secondary CTAs: `Save`, `Copy`, `Rate`
- Information Hierarchy: Title; creator; goal tags; difficulty and duration; trust metrics; weekly structure preview; action bar.
- Layout Structure: Same high-level structure as routine detail, with weekly schedule preview instead of day-only preview.
- Modules / Components: Hero block; creator row; metrics rows; weekly schedule preview; fixed action bar.
- Required Data: Program detail; creator summary; metrics; action-state payload; entitlement state; moderation projection.
- User Actions: Start; save; copy; rate; open creator detail.
- State Variants: Included starter plan; owned or saved local program context present; premium required; rating locked; rating eligible; limited visibility label.
- Empty State: None.
- Loading State: Detail placeholders until hydration completes.
- Error State: Cached summary fallback and retry; action failure toast; paywall on locked premium-program access.
- Offline State: Read-only cached detail is allowed. `Start` is unavailable offline unless a valid local saved or owned program context already exists.
- Monetization / Entitlement Behavior: If the program is not already the included starter plan or a valid local owned or saved program, the app must run the premium-program-access gate before creating any local program record. `Save`, `Copy`, and `Start` share the same premium gate.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: When a program action is locked, show the reason before opening the paywall. Do not imply that a free user can own another program without premium. Detail metrics are limited to copy count, starts, completions, completion rate, and rating. Do not add active-runners or PR-outcome display.

## 18. Creator Profile UX Specification

### Creator Profile Detail

- Screen Name: `Creator Profile Detail`
- Owning Tab or Flow: `Explore shared`
- Launch Status: `Launch`
- Purpose: Show a creator's public launch profile, trust state, and published routine and program library.
- Entry Points: Explore search result; creator card; marketplace asset detail creator row; You creator preview.
- Exit Points: Marketplace asset detail; back to caller; creator block confirmation.
- Primary User Jobs: Evaluate the creator; open a published asset; open an approved external link; block the creator if needed.
- Primary CTA: `Open Published Asset`
- Secondary CTAs: `Open External Link`, `Block Creator`, `Manage Creator Profile` when the viewer is the owner
- Information Hierarchy: Identity and bio; specialization tags; trust and visibility block; published routines rail; published programs rail; external links.
- Layout Structure: One vertical page with horizontal asset rails inside it.
- Modules / Components: Avatar and display name; bio; specialization tags; trust block; routine rail; program rail; external-link rows; overflow menu.
- Required Data: Creator profile; specialization tags; external links; published routines; published programs; viewer block state; moderation projection.
- User Actions: Open an asset; open external link; block or unblock through the supported launch path; manage the creator profile when owner-viewing.
- State Variants: Owner view; non-owner view; no published assets; limited visibility label.
- Empty State: If the creator has no published assets, show an explicit empty-library state while leaving identity and trust blocks visible.
- Loading State: Skeleton identity block and asset rails.
- Error State: Retry on creator hydration failure; link validation error; block action failure retry.
- Offline State: Cached creator detail remains readable without follow controls or follower counts.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: No follow CTA. No follower count. No comments. Blocking must remove the creator from future Explore, search, and recommendation surfaces immediately after success.

## 19. Builder UX Specification

### Workout Builder

- Screen Name: `Workout Builder`
- Owning Tab or Flow: `My Workouts`
- Launch Status: `Launch`
- Purpose: Create or edit a workout template.
- Entry Points: `My Workouts Root > Create`; `Workout Asset Detail > Edit`; duplicate action; AI preview `Edit` when a workout-type asset is ever returned in a launch-safe path.
- Exit Points: Back to `Workout Asset Detail` or `My Workouts Root`; exercise search; publish validation or success sheets.
- Primary User Jobs: Build exercise structure; set metadata; save draft; publish when eligible.
- Primary CTA: `Save`
- Secondary CTAs: `Publish`, `Start`, `Cancel`
- Information Hierarchy: Metadata header first; exercise composition canvas second; sticky save and publish actions last.
- Layout Structure: Metadata section at top; exercise blocks below; sticky action footer.
- Modules / Components: Title field; description; goal tags; equipment tags; duration; default rest; exercise rows; set rows; add-exercise row; reorder handles; superset controls.
- Required Data: Workout draft; exercise catalog; custom-exercise availability; publish eligibility state.
- User Actions: Edit metadata; add exercise; replace exercise; reorder; add or edit set rows; mark set rows as warm-up where needed; save; publish; start.
- State Variants: New draft; existing draft; copied asset; publish-ineligible; publish-eligible; custom-exercise present.
- Empty State: A new draft starts with metadata inputs and an add-exercise prompt.
- Loading State: Autosave indicator; exercise-search return state; detail hydration on first open.
- Error State: Field-level validation; autosave retry; publish validation failure.
- Offline State: Full draft editing remains available; publish is disabled.
- Monetization / Entitlement Behavior: Workouts are free and unlimited. Publish remains creator-eligibility gated only.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: If the workout contains a custom exercise, keep the workout privately usable but block publish with actionable correction guidance.

### Routine Builder

- Screen Name: `Routine Builder`
- Owning Tab or Flow: `My Workouts`
- Launch Status: `Launch`
- Purpose: Create or edit an ordered multi-day routine.
- Entry Points: `My Workouts Root > Create`; `Routine Asset Detail > Edit`; duplicate action; AI preview `Edit` when the accepted asset is a routine.
- Exit Points: Back to `Routine Asset Detail` or `My Workouts Root`; exercise search; publish sheets; Train start handoff.
- Primary User Jobs: Build routine days; order workouts; save or publish.
- Primary CTA: `Save`
- Secondary CTAs: `Publish`, `Start`, `Cancel`
- Information Hierarchy: Metadata header; day selector; day-level exercise composition workspace; sticky save or publish actions.
- Layout Structure: Metadata block first; ordered day tabs next; active day canvas below.
- Modules / Components: Title; description; goal tags; difficulty; recommended weeks; sessions-per-week; day tabs; day workout canvas; add-day control; add-exercise row.
- Required Data: Routine draft; child workout structures; exercise catalog; publish eligibility; slot-cap state when this is a new routine create.
- User Actions: Edit metadata; add day; rename day; edit day content; reorder exercises; save; publish; start.
- State Variants: New routine; existing routine; publish-ineligible; publish-eligible; free `4/5`; free `5/5`; premium.
- Empty State: New routine opens with one initial day scaffold and an add-exercise prompt.
- Loading State: Autosave indicator; day-switch loading shimmer only for unresolved day content.
- Error State: Field-level validation; autosave retry; publish validation failure.
- Offline State: Full draft editing remains available; publish is disabled.
- Monetization / Entitlement Behavior: New routine creation is blocked before local insert if it would become the sixth active routine on free entitlement. Editing an existing routine remains allowed at `5/5`.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: The day order is explicit and must remain stable. Do not add program-only week controls here.

### Program Builder

- Screen Name: `Program Builder`
- Owning Tab or Flow: `My Workouts`
- Launch Status: `Launch premium-gated`
- Purpose: Create or edit a multi-week program when entitlement allows it.
- Entry Points: `My Workouts Root > Create Program`; `Program Asset Detail > Edit` when entitlement allows; `AI Generation Preview > Edit`.
- Exit Points: Back to `Program Asset Detail` or `My Workouts Root`; publish sheets; Train start handoff.
- Primary User Jobs: Edit weekly schedule and progression structure; save or publish.
- Primary CTA: `Save`
- Secondary CTAs: `Publish`, `Start`, `Cancel`
- Information Hierarchy: Program metadata first; week and day structure second; sticky save and publish controls last.
- Layout Structure: Metadata header; week selector or week stack; scheduled routine assignments below.
- Modules / Components: Title; description; goal tags; duration weeks; difficulty; weekly schedule editor; progression-phase summary; add-week or add-assignment controls where valid.
- Required Data: Program draft; weekly schedule; entitlement state; publish eligibility.
- User Actions: Edit metadata; edit weekly schedule; save; publish; start.
- State Variants: Premium editable; free locked from entry; publish-ineligible; publish-eligible.
- Empty State: New program opens with an empty schedule scaffold and an add-assignment prompt.
- Loading State: Autosave indicator; schedule hydration on first open.
- Error State: Entitlement failure routes to paywall before this screen loads; field-level validation; publish validation failure.
- Offline State: Existing local premium-owned program drafts remain editable; publish is blocked offline.
- Monetization / Entitlement Behavior: Program authoring and multi-week editing are premium-only at launch. Free users never reach this screen from the included starter-plan path.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Keep free-user lock messaging outside this screen. This route should only open after entitlement is already resolved.

## 20. Plate Calculator / Load Helper UX Specification

### Train Load Helper Sheet

- Screen Name: `Train Load Helper Sheet`
- Owning Tab or Flow: `Train`
- Launch Status: `Launch`
- Purpose: Translate a desired total load into an exact or nearest-achievable plate setup without leaving the active session.
- Entry Points: Supported set-row load field accessory; supported set-row overflow action.
- Exit Points: Back to the same active set row and scroll position.
- Primary User Jobs: Check plate breakdown; switch presets temporarily; apply the achieved load back into the focused field.
- Primary CTA: `Apply`
- Secondary CTAs: `Cancel`
- Information Hierarchy: Target load; preset and implement selection; plate breakdown; achieved total; delta from requested load; actions.
- Layout Structure: Bottom sheet over the active session.
- Modules / Components: Target-load field; preset selector; implement selector; per-side plate stack; achieved-total row; delta row; apply or cancel footer.
- Required Data: Focused set-row load; load-entry mode; implement type; current unit preference; resolved preset library.
- User Actions: Adjust target load; switch preset temporarily; switch implement; apply; cancel.
- State Variants: Exact match; nearest lower match; nearest higher option within launch limit; invalid target below base weight; no valid breakdown.
- Empty State: None.
- Loading State: The sheet opens immediately with the resolved default preset. No remote loading placeholder is allowed.
- Error State: Inline validation for invalid target; non-blocking error when apply fails while keeping the sheet open.
- Offline State: Fully available. No network dependency exists.
- Monetization / Entitlement Behavior: No paywall. Available to all users when the exercise context supports it.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: Hide this sheet entirely for dumbbell `Each`, `left_right`, bodyweight-only, timed-only, and machine-stack-only contexts.

### Load Helper Settings

- Screen Name: `Load Helper Settings`
- Owning Tab or Flow: `You > Settings > Training`
- Launch Status: `Launch`
- Purpose: Persist the user's reusable metric and imperial preset libraries for supported implements.
- Entry Points: `Training Settings`.
- Exit Points: Back to `Training Settings`.
- Primary User Jobs: Edit plate inventories, base implement weights, machine start weight, and default preset selection.
- Primary CTA: `Save Load Helper Settings`
- Secondary CTAs: `Back`
- Information Hierarchy: `Metric` section first; `Imperial` section second; each section contains presets grouped by implement type.
- Layout Structure: Scrollable settings page with the following order:
  1. `Metric` preset group
  2. `Imperial` preset group
  3. save footer when dirty
- Modules / Components: Unit-group headers; preset rows for:
  1. Olympic bar
  2. technique bar
  3. EZ bar
  4. trap bar
  5. plate-loaded machine
  editable base weight; editable plate-pair inventory; default-preset marker; machine start weight.
- Required Data: Full `load_helper_preferences` object for both unit systems.
- User Actions: Edit base weight; edit plate-pair list; set default; edit machine start weight; save.
- State Variants: Seeded defaults; user-edited presets; invalid synced payload repaired to defaults; dirty state.
- Empty State: None. Missing presets are repaired to seeded defaults rather than shown as empty.
- Loading State: Settings shimmer while the full preference object hydrates.
- Error State: Validation errors for invalid plate values or missing required implement presets; non-blocking remote-save error after successful local write.
- Offline State: Local edits remain available and sync later.
- Monetization / Entitlement Behavior: None.
- Ad Behavior: Ads are suppressed.
- Notes for Stage-3C Design Execution: This is the only launch surface that can permanently edit or replace saved presets. Keep metric and imperial groups separate so unit changes never lossy-convert saved inventories.

## 21. Modal, Sheet, Overlay, and Full-Screen Cover Inventory

| Surface | Owner | Presentation | Trigger | Primary Actions | Dismiss Rules | Launch Ad Rule |
|---|---|---|---|---|---|---|
| Premium Paywall | current owner | full-screen cover | sixth routine create, save, or copy; post-onboarding AI entry; premium program access; voluntary upgrade | purchase, restore, dismiss | close returns to the exact prior surface and scroll position | ads suppressed |
| Resume or Discard Resolution | Train | bottom sheet | user attempts a new start while another local session is active | resume, discard and start new, cancel | cancel keeps current state untouched | ads suppressed |
| Finish Workout Confirmation | Train | modal | user taps `Finish Workout` | confirm finish, cancel | cancel returns to the same session position | ads suppressed |
| Discard Workout Confirmation | Train | modal | user taps `Discard` | confirm discard, cancel | cancel returns to the same session position | ads suppressed |
| Rest Timer Override | Train | bottom sheet | user taps timer override | apply new seconds, cancel | returns to same session position | ads suppressed |
| In-Session Settings | Train | bottom sheet | user opens session settings | save, cancel | returns to same session position | ads suppressed |
| Train Load Helper Sheet | Train | bottom sheet | supported set-row helper trigger | apply, cancel | returns to same row and scroll position; timer keeps running | ads suppressed |
| Rating Submission | Explore shared | bottom sheet | user taps enabled `Rate` | submit rating, cancel | locked states do not open the sheet | ads suppressed |
| Publish Validation Failure | My Workouts | sheet | publish attempt fails client or server validation | review blocking issues, return to builder or detail | dismiss keeps the user in the current asset context | ads suppressed |
| Publish Success Confirmation | My Workouts | sheet | publish succeeds | done, open `Published by Me` context | done returns to same asset-type segment with `Published by Me` selected | ads suppressed |
| Restore Purchases Progress and Result | Paywall or Subscription | overlay | user taps restore | wait, dismiss result | success refreshes entitlement before dismiss | ads suppressed |
| Creator Block Confirmation | Creator profile detail | sheet | user chooses block | confirm block, cancel | success removes the creator from launch discovery surfaces immediately | ads suppressed |
| Erase Data Final Confirmation | You > Data | modal over erase route | user reaches final erase step | confirm erase, cancel | cancel returns to erase route | ads suppressed |
| Notification Authorization Dialog | iOS system | system dialog | notification education primary CTA | allow, deny | returns to onboarding or settings caller | ads suppressed |
| Apple Health Authorization Dialog | iOS system | system dialog | Health education or reconnect CTA | allow selected scopes, deny | returns to onboarding or settings caller | ads suppressed |
| Manage Subscription System Handoff | App Store | system handoff | subscription management CTA | manage in App Store | returns to app via standard iOS behavior | ads suppressed |
| Terms and Privacy External Handoff | safe browser | system browser | paywall legal link tap | open external page | returns via standard iOS navigation | ads suppressed |
| Safe External Link Browser | safe browser | system browser | creator approved external-link tap | open external page | returns via standard iOS navigation | ads suppressed |

Modal, sheet, overlay, and cover rules:

1. No banner ad may render behind or inside any modal, sheet, overlay, or full-screen cover.
2. Dismissing any transactional sheet must return the user to the exact prior scroll position whenever the caller owns scroll state.
3. Destructive confirmation surfaces must summarize consequences in plain language before the confirm action.
4. Rating, publish, restore, and paywall surfaces must not clear the underlying owning context on cancel.

## 22. Global Component Inventory

| Component Name | Purpose | Where Used | Visible States | Interaction Behavior | Constraints / Exclusions |
|---|---|---|---|---|---|
| Root Tab Bar | switch between the five locked launch roots | global tab shell | selected tab, unselected tab | tap changes root stack | exactly five tabs only |
| Progress Header | show onboarding step position | onboarding steps | normal, completed, hidden on processing | back action when allowed | no banner or paywall in header |
| Provider Button | start Apple or Google sign-in | authentication | idle, pressed, loading, error-returned | tap starts provider handoff | provider errors return inline to auth |
| Plan Card | compare annual and monthly subscription options | paywall | unselected, selected, loading, unavailable | tap selects plan | only monthly and annual at launch |
| Billing Reassurance Strip | explain trial or deferred billing timing | paywall | visible, hidden | read-only | appears only when billing metadata requires it |
| Banner Container | host the only launch ad format | approved free-tier root overview surfaces | eligible-loading, loaded, no-fill-collapsed, blocked, premium-suppressed, offline-suppressed | no direct interaction requirement | banner only, no interstitial or rewarded behavior |
| Routine Slot Usage Strip | show free routine usage count | My Workouts root | normal `0/5-3/5`, warning `4/5`, locked `5/5`, premium hidden | read-only | workouts never count |
| Approaching-Limit Warning | warn free users at `4/5` | My Workouts root | visible, hidden | tap may open paywall or upgrade messaging | only at `4/5` |
| Upgrade Card | explain locked `5/5` state | My Workouts root | visible, hidden | CTA opens paywall | only at `5/5` free state |
| Asset Card | show routine, program, or workout summary | My Workouts, Explore | loading, normal, stale, locked-action, limited | tap opens detail; secondary actions context-specific | launch public discovery excludes workout templates |
| Publish Eligibility Badge | communicate publish readiness or blocking state | My Workouts details and builder | eligible, blocked, tier shown | tap may open detailed blocking reasons | no public distribution promise |
| Search Field | capture marketplace or exercise query | Explore, Exercise Search | idle, focused, populated | typing filters local or remote result set | do not repurpose for messaging or comments |
| Filter Chip | apply or clear a controlled filter | Explore Search Results, Exercise Search | default, selected, disabled | tap toggles | launch filter taxonomies only |
| Exercise Result Row | show a searchable exercise | Exercise Search | normal, excluded, custom, selected | tap selects or opens detail | launch preference affordance is limited to excluded state only |
| Exercise Metadata Block | show title, muscles, equipment, pattern | Exercise Detail | normal | read-only | no media slot |
| Warm-Up Badge | differentiate warm-up rows from working rows | Builder, Active Session, Completed Workout Detail | visible, hidden | tap or set-type action changes classification only in editable contexts | warm-up rows must never change KPI totals |
| Set Row | capture or display reps and load | Builder, Active Session, Completed Workout Detail | idle, focused, completed, preloaded, warm-up | tap focuses the row; overflow opens row actions | load-entry mode decides field shape |
| Numeric Keypad | speed set entry | Active Session | hidden, visible, field-focused | tap enters digits into the active field | never replaced by a remote dependency |
| Rest Timer Strip | show active rest timer and quick adjustments | Active Session | idle, running, expired, unavailable | quick adjust, override, skip | must not obscure the active set row |
| Load Helper Trigger | open the in-session plate calculator | Active Session | visible, hidden | tap opens bottom sheet | visible only for supported plate-loadable contexts |
| KPI Card | show weekly KPI snapshot | Home, You Progress | loading, normal, stale, empty | tap opens deeper progress surfaces where allowed | launch uses basic KPI only |
| Body-Map Preview Card | preview launch muscle-distribution analytics | You Progress Overview | loading, normal, stale, empty | tap opens Muscle Distribution | preview is read-only; no region tap or range control on the overview card |
| Body Map Canvas | show front or back launch muscle-distribution intensities | Muscle Distribution | loading, normal, stale, region-selected, empty, error | tap selects or clears a region filter | front and back only; no pinch zoom; intensity is normalized within the selected range |
| Exercise Performance Curve | show exact-variation launch performance over time | Exercise Detail | loading, normal, point-selected, stale, empty, error | tap point reveals value; taps on metric or range chips switch the series | exact-variation only; no family aggregate; no compare mode |
| Exercise History Row | summarize one exact-variation historical completion | Exercise Detail | loading, normal, stale, error-link-disabled | tap opens the related completion detail when the caller allows it | newest-first ordering only; row content must stay scoped to the exact variation |
| Apple Health Status Card | summarize connection and sync state | Integrations Settings | not_connected, connected, partial_authorization, syncing, stale, error | tap reconnect starts the authorization handoff | Apple Health only |
| Apple Health Toggle Row | enable or disable one Apple Health launch scope | Integrations Settings | enabled, disabled, permission-required, saving, save-failed | tap toggles the local launch preference and may require reauthorization | launch rows are `Write Workouts` and `Read Body Metrics` only |
| Stale State Label | mark cached content that is not fresh | Home, Explore, You | hidden, visible | read-only | required on cached stale content |
| Empty State Card | explain zero-data or zero-result launch cases | Home, Train, My Workouts, Explore, You | visible, hidden | CTA routes to the owning next best action | must remain context-specific |
| Inline Retry Banner | recover from recoverable launch errors | Train, My Workouts, Explore, You | visible, hidden | CTA retries the failed action | never auto-dismiss before the user can react |
| Creator Trust Block | show creator tier and trust metadata | Marketplace detail, creator detail, creator management | normal, limited label | tap creator detail or read-only | no follow metrics |
| External Link Row | open approved creator external links | Creator detail, creator management | normal, validation error | tap opens safe browser | allowed domains only |

## 23. State and Status Library

### 23.1 Authentication State

1. `logged_out`
2. `restoring_session`
3. `authenticated_onboarding_required`
4. `authenticated_ready`
5. `reauthentication_required`

### 23.2 Onboarding State

1. `not_started`
2. `in_progress_goal`
3. `in_progress_experience`
4. `in_progress_equipment`
5. `in_progress_training_days`
6. `in_progress_training_environment`
7. `in_progress_body_metrics`
8. `in_progress_source_attribution`
9. `in_progress_notification_education`
10. `in_progress_health_education`
11. `finalizing_profile`
12. `starter_plan_generating`
13. `starter_plan_fallback_applied`
14. `starter_plan_ready`
15. `onboarding_failed_retryable`

### 23.3 Entitlement State

1. `none`
2. `trial`
3. `active`
4. `grace`
5. `expired`

### 23.4 Starter-Plan State

1. `not_started`
2. `generating`
3. `completed`
4. `failed`
5. `consumed`

Starter-plan UX rules:

1. `consumed` occurs on the first onboarding generation attempt.
2. `failed` may still transition to launch success when deterministic fallback templates are written.
3. `completed` must point to one local included program record.

### 23.5 Free Routine Slot State

1. `under_limit_normal`
   1. active count `0-3`
2. `under_limit_warning`
   1. active count `4`
3. `at_limit_locked`
   1. active count `5`
4. `premium_unlimited`

Slot-count rules:

1. count only routines in `saved_state in ('owned', 'saved', 'draft', 'published_copy')`
2. exclude archived, deleted, and soft-deleted routines
3. exclude workouts completely
4. block the sixth insert before SQLite commit

### 23.6 Active Workout State

1. `initializing`
2. `active`
3. `backgrounded`
4. `completing`
5. `completed`
6. `discarded`
7. `timer_unavailable_fallback`

### 23.7 Load-Entry State

1. `single`
2. `per_dumbbell`
3. `left_right`

Load-entry rules:

1. `single` uses one load field
2. `per_dumbbell` uses one `Each` field and mirrors left and right detail fields
3. `left_right` uses `L` and `R` load fields inline and keeps reps shared

### 23.8 Previous-Value Preload State

1. `no_preload_available`
2. `preload_available`
3. `preload_applied_unedited`
4. `preload_edited`
5. `preload_invalidated`

Preload rules:

1. source only from the most recent completed set for the same exercise variation in the current workout
2. preserve compatible load-entry mode and compatible load fields
3. never read cross-workout or network data

### 23.9 Warm-Up State

1. `warmup`
2. `working`

Warm-up rules:

1. warm-up rows remain visible anywhere set rows or completion details are shown
2. warm-up rows are excluded from KPI, PR, working volume, and muscle-distribution totals
3. warm-up counts remain available separately in completion and detailed progress contexts

### 23.10 Network, Cache, and Sync State

1. `online_fresh`
2. `online_refreshing`
3. `stale_cached`
4. `offline_cached_only`
5. `local_write_pending_sync`
6. `sync_failed_retrying`
7. `conflict_requires_user_action`

### 23.11 Exercise Detail Analytics State

1. `performance_loading`
2. `performance_ready`
3. `performance_empty`
4. `performance_stale_cached`
5. `performance_error`
6. `metric_estimated_1rm`
7. `metric_top_set_load`
8. `metric_session_working_volume`
9. `metric_best_completed_reps`
10. `metric_best_duration_seconds`
11. `range_30d`
12. `range_90d`
13. `range_180d`
14. `range_1y`
15. `range_all_time`
16. `history_loading`
17. `history_ready`
18. `history_empty`
19. `history_stale_cached`
20. `history_error`

Analytics rules:

1. Performance and history always use exact-variation scope only.
2. Warm-up sets never contribute to performance curves or history metrics.
3. Empty performance and empty history may coexist on the same exercise detail screen.
4. The selected metric must remain valid for the scoped exercise data shape.
5. The selected time window applies to the performance curve only; the recent-history list remains newest first across the available exact-variation history.

### 23.12 Muscle Distribution State

1. `range_last_session`
2. `range_7d`
3. `range_30d`
4. `range_90d`
5. `front_view`
6. `back_view`
7. `region_unselected`
8. `region_filtered`
9. `distribution_loading`
10. `distribution_empty`
11. `distribution_stale_cached`
12. `distribution_error`

Distribution rules:

1. Body-map intensity always excludes warm-up workload.
2. Front and back views read the same selected-range fact set.
3. Region selection filters the same-screen contributing-exercise list and does not open a separate route.
4. Empty distribution means the selected range has no completed non-warmup working sets.

### 23.13 Marketplace Visibility and Moderation State

1. `clear`
2. `under_review`
3. `limited`
4. `suppressed`

Visibility rules:

1. `limited` removes ranked amplification and may still allow backend-approved direct-link detail with a warning label
2. `suppressed` removes ranked feed visibility, search visibility, creator public rails, recommendation visibility, and direct-link detail hydration

### 23.14 Apple Health State

1. `unknown`
2. `preprompt_seen`
3. `authorized`
4. `denied`
5. `partial_authorization`
6. `not_connected`
7. `connected`
8. `error`
9. `workout_write_enabled`
10. `workout_write_disabled`
11. `body_metric_read_enabled`
12. `body_metric_read_disabled`
13. `never_synced`
14. `idle`
15. `syncing`
16. `succeeded`
17. `failed`
18. `permission_required`
19. `disabled`

Apple Health rules:

1. `connected` requires at least one granted launch scope and a valid local or synced status projection.
2. `partial_authorization` is user-visible when only one of the two launch scopes is granted.
3. `not_connected` is user-visible before any successful authorization or after full revocation.
4. `disabled` means both launch toggles are off, even if historic authorization metadata exists.

### 23.15 Purchase and Restore State

1. `catalog_loading`
2. `catalog_ready`
3. `purchase_in_progress`
4. `purchase_interrupted`
5. `restore_in_progress`
6. `restore_succeeded`
7. `restore_no_entitlement`
8. `restore_failed`

### 23.16 Publish Eligibility State

1. `no_creator_profile`
2. `creator_profile_incomplete`
3. `threshold_blocked`
4. `metadata_blocked`
5. `custom_exercise_blocked`
6. `ready_to_publish`
7. `published_tier_1`
8. `published_tier_2`
9. `limited_visibility`
10. `suppressed_visibility`

### 23.17 Rating Eligibility State

1. `routine_ineligible_less_than_2_sessions`
2. `program_ineligible_below_threshold`
3. `eligible_unrated`
4. `submission_in_progress`
5. `rated`

### 23.18 Exercise Preference State

1. `none`
2. `excluded`

Launch rule:

1. `favorite` is not a launch-visible state.

### 23.19 Ad State

1. `blocked_surface`
2. `premium_suppressed`
3. `eligible_loading`
4. `loaded`
5. `no_fill_collapsed`
6. `load_failed_collapsed`
7. `offline_suppressed`

## 24. Interaction Rules and Micro-Behavior Contracts

1. Every root tab preserves its own stack when the user switches tabs.
2. The paywall always returns to the exact underlying surface on dismiss.
3. `Home` today summary taps route into Train context and never create a session directly.
4. `Start` is always the visually primary marketplace CTA and always appears first in action order.
5. Locked marketplace actions must explain the lock reason before the paywall appears.
6. The free routine slot-cap gate must run before the sixth routine row is written locally.
7. A free-user `4/5` warning appears immediately when the active routine count reaches four.
8. A free-user `5/5` upgrade card appears immediately when the active routine count reaches five.
9. Starting a routine from marketplace detail must not silently create an editable copy.
10. Starting a program from marketplace detail must not create a local program until entitlement and context checks pass.
11. Exercise search uses local indexing and returns results in a flat ranked list.
12. Search-result rows show family context when relevant so same-family variations stay distinguishable.
13. Excluded exercises remain manually selectable in Builder and Train.
14. Favorites affordances must not appear anywhere at launch.
15. Exercise detail is one scroll surface and must not use tabs or segmented controls.
16. Exercise detail must render no media placeholder and reserve no future-media space.
17. Exercise-detail performance curves and recent-history lists always use exact-variation scope only.
18. Exercise-detail default metric follows the scoped exercise data shape and alternate metrics are limited to the launch-approved metric set.
19. Exercise-detail time windows are exactly `30D`, `90D`, `180D`, `1Y`, and `All Time`.
20. Exercise-detail recent-history rows are ordered newest first.
21. Same-family similar exercises always render before substitute exercises.
22. Body-map analytics must expose exactly `Last Session`, `7D`, `30D`, and `90D` range controls.
23. Body-map analytics must render front and back views from the same selected-range fact set.
24. Body-map region taps and summary-row taps filter the same-screen contributing-exercise list instead of opening a separate region-detail route.
25. Preloaded set values must render with a visual distinction until the user edits or completes the row.
26. Warm-up rows must render with their own visible treatment in Builder, Train, and historical detail.
27. Warm-up rows must never inflate KPI, exercise-detail curve, exercise-detail history, body-map, or PR values shown anywhere in launch UI.
28. `per_dumbbell` rows show one `Each` field only.
29. `left_right` rows show inline `L` and `R` fields only for load.
30. Load-helper access must disappear in unsupported contexts rather than showing a disabled control that clutters the row.
31. Opening, dismissing, or applying the load helper must not pause timers or discard set-entry context.
32. Dismissing any Train sheet returns to the same exercise row and scroll position.
33. Finishing a workout always requires explicit confirmation.
34. Discarding a workout always requires explicit confirmation.
35. A failed completion write must return the user to the active session with data intact.
36. Summary-level PR messaging appears only after completion processing, never during live set entry.
37. Post-workout summary must not expose a share card, share-result CTA, or system share handoff.
38. Builder autosave must never block typing or reorder interactions.
39. Publish success must return to the same `Workouts`, `Programs`, or `Routines` segment with `Published by Me` selected when that filter exists.
40. `Published by Me` stays within the current asset type and never becomes a global creator library root.
41. Ads may never render above trust-critical profile or KPI content.
42. Allowed banners reserve no skeleton height.
43. Banner no-fill restores normal module spacing immediately.
44. Offline-cached-only overview and browse states suppress banners entirely.
45. The notification and Apple Health system dialogs may only appear after their education screens.
46. Apple Health reconnect from settings reuses the same permission framing as onboarding, adapted to an already created account context.
47. Apple Health toggles must expose workout-write state, body-metric-read state, and current sync status explicitly.
48. The `You > Progress` overview may use basic range controls for KPI context only; it may not reveal deferred advanced analytics modules.
49. History calendar date taps must update the same-screen selected-day list immediately.
50. Completed workout detail is read-only and must not open live Train controls.
51. Data export and import appear only as availability status, not as launch action buttons.
52. Blocking a creator removes that creator from Explore, search, and recommendation surfaces immediately after success.
53. No creator surface may show follow state or follower count at launch.
54. Workout-template publish management never leaks into Explore or creator public rails.
55. Any screen that relies on cached marketplace or analytics data must show visible staleness when the snapshot is stale.
56. System handoffs for legal pages, external links, and subscription management must never create app-owned pseudo-screens.
57. Error handling must be local-context preserving. The app should retry or return in place instead of sending the user back to a root screen.

## 25. Launch UX Acceptance Criteria

1. The launch build exposes exactly five root tabs and no additional root navigation item.
2. `Home` contains no direct workout execution control.
3. Onboarding follows the deterministic step order documented in this file.
4. Notification and Apple Health prompts are reachable only after their education screens.
5. Onboarding completion auto-generates and auto-persists one included starter plan.
6. Onboarding never shows starter-plan preview, edit, discard, reroll, regenerate, rebuild, or evolution controls.
7. The single onboarding completion CTA enters `Home`.
8. The paywall never appears automatically after onboarding completion.
9. The paywall appears on:
   1. sixth routine create attempt
   2. sixth routine save attempt
   3. sixth routine copy attempt
   4. post-onboarding AI generation entry
   5. premium program save attempt
   6. premium program copy attempt
   7. premium program start attempt
10. `My Workouts` always shows `x/5 active routines used` for free users.
11. The `4/5` warning appears only at four active routines.
12. The `5/5` upgrade or locked-state upsell appears only at five active routines.
13. The sixth routine is blocked before local insert.
14. Routine marketplace `Start` does not consume a free routine slot and does not create an editable copy.
15. Program marketplace `Start` cannot bypass premium-program access rules.
16. Exercise search works fully offline and returns a flat ranked list with family context shown when relevant.
17. Exercise detail renders a text-first surface with no media placeholder or reserved media space.
18. Exercise detail includes an exact-variation performance curve and an exact-variation recent-history list at launch.
19. Exercise-detail default metric follows the scoped exercise data shape and alternate metrics are limited to the documented launch metric set.
20. Exercise-detail performance-curve windows are exactly `30D`, `90D`, `180D`, `1Y`, and `All Time`.
21. Exercise-detail recent-history rows are ordered newest first and support private custom-exercise history.
22. `Similar Exercises` lists same-family variations before substitute exercises.
23. Custom exercises are searchable immediately after save in Builder and Train.
24. Custom exercises remain private and non-publishable at launch.
25. Train supports `single`, `per_dumbbell`, and `left_right` load-entry modes exactly as documented.
26. Previous-value preload uses only the same exercise variation in the current workout.
27. Warm-up rows remain visible and are excluded from working KPI, volume, PR, exercise-detail analytics, and muscle-workload totals.
28. The load helper appears only in supported plate-loadable active-session contexts and returns the user to the same set row.
29. Home, My Workouts non-builder root lists, Explore browse, You Profile overview, and You Progress overview are the only ad-eligible launch surfaces.
30. Premium users never receive ad requests or ad placeholders.
31. Launch ad containers reserve no loading height and collapse on no-fill or failure.
32. Explore launches as a category rail plus ranked vertical feed, not an immersive fullscreen feed.
33. Marketplace detail action order is `Start`, `Save`, `Copy`, `Rate` on both routine and program detail.
34. Ratings remain completion-gated and numeric only.
35. Workout-template consumer ratings do not exist at launch.
36. Creator profile launch surfaces do not show follow CTAs or follower counts.
37. Published workout templates remain manageable only in `My Workouts > Workouts > Published by Me`.
38. `You > Progress` launch overview shows KPI, body-map preview, history, reports, body measurements, and goals or targets only.
39. `Muscle Distribution` supports `Last Session`, `7D`, `30D`, and `90D`, plus front and back views, five-band legend treatment, and same-screen region filtering.
40. `You > Progress` launch overview does not show strength score, recovery score, cross-exercise rankings, achievements, streaks, or coach modules.
41. `You > Settings > Integrations` shows Apple Health only, with explicit workout-write and body-metric-read controls plus visible sync status.
42. Post-workout summary has no share card, share-result CTA, or system share handoff.
43. Strava, Fitbit, Apple Watch, Live Activity, external AI assistants, and other deferred integrations do not leak into launch UI.
44. Data settings show erase and transfer guidance only, with export and import represented only as unavailable status.
45. Every destructive action uses explicit confirmation.
46. Every launch drill-down, modal, sheet, and utility handoff listed in this document is present and route-owned exactly once.

## 26. Deferred-Scope Notes

The following capabilities remain deferred and must not be designed as active launch surfaces:

1. creator follow
2. favorites UI
3. strength and recovery scoring
4. cross-exercise performance trends and rankings
5. achievements and milestones
6. streak and continuity metrics
7. in-session PR celebration
8. coach recommendation surfaces
9. promotions and offer mechanics
10. Live Activity
11. CSV export
12. referral mechanics
13. voice assistant integrations
14. Strava integration
15. Fitbit integration
16. Apple Watch support
17. import flows
18. public API or external integration request intake
19. theme override
20. app icon override
21. manual language override

Deferred-scope handling rules:

1. Do not show dormant controls for deferred features.
2. Do not reserve layout space for deferred analytics charts, deferred rankings, or deferred media.
3. Do not show `Follow`, `Favorite`, or deferred-ranking placeholders.
4. Do not show workout-template marketplace discovery or consumer marketplace actions.
5. Do not show comments, posts, messaging, groups, or other social primitives.
6. `Advanced analytics` remains a runtime-config paywall trigger only. It is not designed as a GA launch route in this document.
7. Export and import may be mentioned only as unavailable status in `You > Settings > Data`.
8. Apple Watch, Strava, Fitbit, and Live Activity must not appear in launch integrations or onboarding copy.
9. Exercise visuals remain fully absent at launch. No image, video, or future-media framing may leak into any launch exercise surface.
10. Future creator monetization remains absent from launch creator surfaces.
