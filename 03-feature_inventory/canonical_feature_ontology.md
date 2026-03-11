# Canonical Feature Ontology

Source files:

- `analysis/competitor_analysis/competitor_master_feature_matrix.csv`
- `analysis/competitor_analysis/competitor_forensic_ux_architecture.md`

## Domain Index

1. Identity & Onboarding
2. Monetization & Growth
3. Routine System
4. Exercise Library
5. Workout Logging
6. Analytics
7. Routine Marketplace Community
8. Account & UX Infrastructure
9. Platform Features
10. Coaching

## Yoked Training Object Model

1. `Workout`: single training session template.
2. `Routine`: repeating structure of workouts.
3. `Program`: time-bounded progression over multiple weeks.
4. Hierarchy: a program contains routines, and routines contain workout templates executed in Train sessions.

## Identity & Onboarding

### Canonical Taxonomy

| Canonical ID | Canonical Feature | Source MF IDs |
|---|---|---|
| CF-001 | Account Authentication and Login | MF-001, MF-002 |
| CF-002 | Onboarding Personalization Core | MF-003, MF-004, MF-005 |
| CF-003 | Onboarding Context Inputs | MF-006, MF-007, MF-008, MF-009, MF-010, MF-011 |
| CF-004 | Onboarding Progress Feedback | MF-012 |
| CF-005 | Pre-permission Education | MF-013, MF-014 |
| CF-006 | Onboarding Monetization Gate | MF-015 |

### Duplicate/Overlap Consolidation

1. `CF-001` normalized overlapping matrix labels into `Account Authentication and Login`.
Raw matrix labels: MF-001 Auth with Apple Google Email; MF-002 Existing account email login.
2. `CF-002` normalized overlapping matrix labels into `Onboarding Personalization Core`.
Raw matrix labels: MF-003 Multi-step onboarding personalization; MF-004 Onboarding goal selection; MF-005 Onboarding experience level calibration.
3. `CF-003` normalized overlapping matrix labels into `Onboarding Context Inputs`.
Raw matrix labels: MF-006 Onboarding equipment profiling; MF-007 Onboarding schedule by days per week; MF-008 Onboarding location training environment selection; MF-009 Onboarding body metrics capture; MF-010 Onboarding manual data-entry fallback; MF-011 Onboarding source attribution question.
4. `CF-004` retained as `Onboarding Progress Feedback` with single-source mapping.
Raw matrix label: MF-012 Onboarding loading progress states.
5. `CF-005` normalized overlapping matrix labels into `Pre-permission Education`.
Raw matrix labels: MF-013 Notifications pre-permission value prompt; MF-014 Apple Health pre-permission step.
6. `CF-006` retained as `Onboarding Monetization Gate` with single-source mapping.
Raw matrix label: MF-015 Onboarding paywall intercept.

## Monetization & Growth

### Canonical Taxonomy

| Canonical ID | Canonical Feature | Source MF IDs |
|---|---|---|
| CF-007 | Paywall Plan Packaging | MF-016 |
| CF-008 | Promotions and Offer Mechanics | MF-017, MF-021, MF-125 |
| CF-009 | Purchase Recovery and Billing Controls | MF-018, MF-019, MF-020, MF-097 |
| CF-010 | Referral and Free-pass Growth Loops | MF-022, MF-088 |

### Duplicate/Overlap Consolidation

1. `CF-007` retained as `Paywall Plan Packaging` with single-source mapping.
Raw matrix label: MF-016 Paywall yearly monthly selector.
2. `CF-008` normalized overlapping matrix labels into `Promotions and Offer Mechanics`.
Raw matrix labels: MF-017 Paywall promo code entry; MF-021 Seasonal promo campaign banner; MF-125 Promo discount and gift mechanics.
3. `CF-009` normalized overlapping matrix labels into `Purchase Recovery and Billing Controls`.
Raw matrix labels: MF-018 Restore purchases on paywall; MF-019 Trial reminder messaging in paywall; MF-020 App Store subscription sheet handoff; MF-097 Subscription management page.
4. `CF-010` normalized overlapping matrix labels into `Referral and Free-pass Growth Loops`.
Raw matrix labels: MF-022 Free pass invite flow; MF-088 Referral and sharing incentives.

## Routine System

### Canonical Taxonomy

| Canonical ID | Canonical Feature | Source MF IDs |
|---|---|---|
| CF-011 | Workout, Routine, and Program Publishing Foundation | MF-023, MF-026 |
| CF-012 | AI Program Generation and Evolution | MF-024, MF-123 |
| CF-013 | Workout, Routine, and Program Catalog | MF-025, MF-120 |
| CF-014 | Workout, Routine, and Program Builder Structure | MF-124 |

### Duplicate/Overlap Consolidation

1. `CF-011` normalized overlapping matrix labels into `Workout, Routine, and Program Publishing Foundation`.
Raw matrix labels: MF-023 Routine creation from scratch; MF-026 Routine day assignment.
2. `CF-012` normalized overlapping matrix labels into `AI Program Generation and Evolution`.
Raw matrix labels: MF-024 AI routine generation; MF-123 Plan progression phases.
3. `CF-013` normalized overlapping matrix labels into `Workout, Routine, and Program Catalog`.
Raw matrix labels: MF-025 Routine template catalog; MF-120 Program explore library.
4. `CF-014` retained as `Workout, Routine, and Program Builder Structure` with single-source mapping.
Raw matrix label: MF-124 Custom workout builder with add-day controls.

## Exercise Library

### Canonical Taxonomy

| Canonical ID | Canonical Feature | Source MF IDs |
|---|---|---|
| CF-015 | Exercise Search and Filter Engine | MF-027, MF-028, MF-029, MF-030 |
| CF-016 | Exercise Preference Curation | MF-031 |
| CF-017 | Custom Exercise Authoring | MF-032 |
| CF-018 | Routine Composition Controls | MF-033, MF-034, MF-035 |
| CF-019 | Exercise Knowledge Surfaces | MF-065, MF-066, MF-067, MF-068, MF-069 |

### Duplicate/Overlap Consolidation

1. `CF-015` normalized overlapping matrix labels into `Exercise Search and Filter Engine`.
Raw matrix labels: MF-027 Add exercise via searchable library; MF-028 Exercise filters by muscle; MF-029 Exercise filters by equipment; MF-030 Exercise filters by duration.
2. `CF-016` retained as `Exercise Preference Curation` with single-source mapping.
Raw matrix label: MF-031 Favorite and excluded exercise lists.
3. `CF-017` retained as `Custom Exercise Authoring` with single-source mapping.
Raw matrix label: MF-032 Custom exercise creation.
4. `CF-018` normalized overlapping matrix labels into `Routine Composition Controls`.
Raw matrix labels: MF-033 Superset creation in planner; MF-034 Replace or swap exercise; MF-035 Reorder exercises drag and drop.
5. `CF-019` normalized overlapping matrix labels into `Exercise Knowledge Surfaces`.
Raw matrix labels: MF-065 Exercise detail overview tab; MF-066 Exercise detail performance charts; MF-067 Exercise detail guide instructions; MF-068 Exercise demo media playback; MF-069 Exercise form cues and mistakes.

## Workout Logging

### Canonical Taxonomy

| Canonical ID | Canonical Feature | Source MF IDs |
|---|---|---|
| CF-020 | Session Entry and Start Modes | MF-038, MF-039, MF-040, MF-041, MF-042 |
| CF-021 | Set Logging Interaction Model | MF-043, MF-044, MF-045, MF-046 |
| CF-022 | Effort and Intensity Capture | MF-047, MF-048, MF-054, MF-056 |
| CF-023 | Timer Stack | MF-036, MF-049, MF-050, MF-051, MF-052 |
| CF-024 | Adaptive Defaults and PR Feedback | MF-037, MF-053, MF-055 |
| CF-025 | Session Safeguards and Controls | MF-057, MF-058, MF-059, MF-064 |
| CF-026 | Session Completion Outputs and Routine Progress Tracking | MF-060, MF-061, MF-062, MF-063 |

### Duplicate/Overlap Consolidation

1. `CF-020` normalized overlapping matrix labels into `Session Entry and Start Modes`.
Raw matrix labels: MF-038 Bodyweight-only mode toggle; MF-039 Start empty workout flow; MF-040 Workout quick-start from today card; MF-041 Workout recommendation cards; MF-042 Workout swap current session.
2. `CF-021` normalized overlapping matrix labels into `Set Logging Interaction Model`.
Raw matrix labels: MF-043 Live set table logging; MF-044 Numeric keypad set entry; MF-045 Set completion checkmarks; MF-046 In-session set overflow actions.
3. `CF-022` normalized overlapping matrix labels into `Effort and Intensity Capture`.
Raw matrix labels: MF-047 RPE tracking in session; MF-048 RPE guidance legend; MF-054 Coach tips within workout; MF-056 Effort prompt reps-left question.
4. `CF-023` normalized overlapping matrix labels into `Timer Stack`.
Raw matrix labels: MF-036 Per-exercise rest timer defaults; MF-049 Rest timer auto-start; MF-050 Rest timer quick adjust and skip; MF-051 Rest timer per-exercise override sheet; MF-052 Live session elapsed timer.
5. `CF-024` normalized overlapping matrix labels into `Adaptive Defaults and PR Feedback`.
Raw matrix labels: MF-037 Warm-up set support; MF-053 Auto-load previous set values; MF-055 New personal record detection.
6. `CF-025` normalized overlapping matrix labels into `Session Safeguards and Controls`.
Raw matrix labels: MF-057 Workout finish confirmation modal; MF-058 Workout discard confirmation modal; MF-059 Save workout policy toggles; MF-064 Workout settings sheet in session.
7. `CF-026` normalized overlapping matrix labels into `Session Completion Outputs and Routine Progress Tracking`.
Raw matrix labels: MF-060 Post-workout processing loading; MF-061 Post-workout summary screen; MF-062 Shareable workout result card; MF-063 Workout tutorial walkthrough.

## Analytics

### Canonical Taxonomy

| Canonical ID | Canonical Feature | Source MF IDs |
|---|---|---|
| CF-027 | Strength and Recovery Scoring | MF-070, MF-071 |
| CF-028 | Muscle Distribution Analytics | MF-072, MF-073 |
| CF-029 | Target Radar Analytics | MF-074 |
| CF-030 | Weekly KPI Dashboard | MF-075 |
| CF-031 | Performance Trends and Rankings | MF-076, MF-077, MF-078 |
| CF-032 | History and Report Windows | MF-079, MF-080 |
| CF-033 | Body Measurement Tracking | MF-081, MF-082 |
| CF-034 | Body Transformation and Nutrition Targets | MF-083, MF-084 |
| CF-035 | Achievements and Milestones | MF-085, MF-086 |
| CF-036 | Streak and Habit Continuity Metrics | MF-087, MF-127 |
| CF-037 | Goal and Target Modeling | MF-126 |

### Duplicate/Overlap Consolidation

1. `CF-027` normalized overlapping matrix labels into `Strength and Recovery Scoring`.
Raw matrix labels: MF-070 Strength score composite metric; MF-071 Recovery readiness zone.
2. `CF-028` normalized overlapping matrix labels into `Muscle Distribution Analytics`.
Raw matrix labels: MF-072 Muscle balance radar chart; MF-073 Body map analytics.
3. `CF-029` retained as `Target Radar Analytics` with single-source mapping.
Raw matrix label: MF-074 Weekly set target radar.
4. `CF-030` retained as `Weekly KPI Dashboard` with single-source mapping.
Raw matrix label: MF-075 Progress dashboard weekly metrics.
5. `CF-031` normalized overlapping matrix labels into `Performance Trends and Rankings`.
Raw matrix labels: MF-076 Volume trend charts; MF-077 Top exercises ranking; MF-078 Recent PR history list.
6. `CF-032` normalized overlapping matrix labels into `History and Report Windows`.
Raw matrix labels: MF-079 Calendar workout history; MF-080 Workout report by date range.
7. `CF-033` normalized overlapping matrix labels into `Body Measurement Tracking`.
Raw matrix labels: MF-081 Body measurements logging; MF-082 Body measurements charts.
8. `CF-034` normalized overlapping matrix labels into `Body Transformation and Nutrition Targets`.
Raw matrix labels: MF-083 Before and after progress photos; MF-084 Nutrition target calculations.
9. `CF-035` normalized overlapping matrix labels into `Achievements and Milestones`.
Raw matrix labels: MF-085 Achievements and badges; MF-086 Milestone progress cards.
10. `CF-036` normalized overlapping matrix labels into `Streak and Habit Continuity Metrics`.
Raw matrix labels: MF-087 Streak tracking and weekly goals; MF-127 Workout streak leaderboard.
11. `CF-037` retained as `Goal and Target Modeling` with single-source mapping.
Raw matrix label: MF-126 In-app goals and per-exercise targets.

## Routine Marketplace Community

### Canonical Taxonomy

| Canonical ID | Canonical Feature | Source MF IDs |
|---|---|---|
| CF-038 | Routine and Program Discovery Marketplace | MF-089 |
| CF-039 | Routine Lifecycle Actions and Creator Follow | MF-090, MF-092 |
| CF-040 | Completion-Gated Ratings | MF-091 |
| CF-041 | Creator Distribution Eligibility, Credibility, Visibility, and Safety Controls | MF-093, MF-094 |

### Duplicate/Overlap Consolidation

1. `CF-038` retained as `Routine and Program Discovery Marketplace` with single-source mapping.
Raw matrix label: MF-089 Community feed and discover.
2. `CF-039` normalized overlapping matrix labels into `Routine Lifecycle Actions and Creator Follow`.
Raw matrix labels: MF-090 Likes and comments interactions; MF-092 Follow athletes or users.
3. `CF-040` retained as `Completion-Gated Ratings` with single-source mapping.
Raw matrix label: MF-091 Groups and communities.
4. `CF-041` normalized overlapping matrix labels into `Creator Distribution Eligibility, Credibility, Visibility, and Safety Controls`.
Raw matrix labels: MF-093 Privacy and social visibility controls; MF-094 Blocked users management.

### Canonical Override Note

1. Routine-marketplace canonical definitions (`CF-038` to `CF-041`) and current product guardrails are the source of truth for implementation.
2. Raw legacy competitor labels in the MF ledger (including social/comment/group wording) are retained for forensic traceability only and do not authorize launch scope expansion.
3. Launch constraints excluding comments, groups/forums, generic social feeds, DMs, posts, and video-feed mechanics override any legacy matrix phrasing.

## Account & UX Infrastructure

### Canonical Taxonomy

| Canonical ID | Canonical Feature | Source MF IDs |
|---|---|---|
| CF-042 | Creator and User Profile Management | MF-095 |
| CF-043 | Account Lifecycle and Recovery | MF-096, MF-122 |
| CF-044 | Appearance Localization and Units | MF-098, MF-099, MF-100, MF-101 |
| CF-045 | Notification and Reminder Controls | MF-102, MF-121 |
| CF-046 | Support and Product Communications | MF-115, MF-116, MF-117, MF-118 |
| CF-047 | Data Governance Controls | MF-128, MF-129 |

### Duplicate/Overlap Consolidation

1. `CF-042` retained as `Creator and User Profile Management` with single-source mapping.
Raw matrix label: MF-095 Profile editing name photo bio.
2. `CF-043` normalized overlapping matrix labels into `Account Lifecycle and Recovery`.
Raw matrix labels: MF-096 Account deletion workflow; MF-122 Account verification and recovery tools.
3. `CF-044` normalized overlapping matrix labels into `Appearance Localization and Units`.
Raw matrix labels: MF-098 Theme and color customization; MF-099 App icon customization; MF-100 Language controls; MF-101 Unit controls kg lbs.
4. `CF-045` normalized overlapping matrix labels into `Notification and Reminder Controls`.
Raw matrix labels: MF-102 Notification settings granularity; MF-121 Habit reminder scheduling.
5. `CF-046` normalized overlapping matrix labels into `Support and Product Communications`.
Raw matrix labels: MF-115 Feature request board voting; MF-116 Help center and FAQ hub; MF-117 Contact support entry; MF-118 About and version screen.
6. `CF-047` normalized overlapping matrix labels into `Data Governance Controls`.
Raw matrix labels: MF-128 Data erase controls; MF-129 Cross-platform account transfer guidance.

## Platform Features

### Canonical Taxonomy

| Canonical ID | Canonical Feature | Source MF IDs |
|---|---|---|
| CF-048 | Live Activity and Lock-screen Runtime | MF-103 |
| CF-049 | Voice Assistant Integrations | MF-104, MF-105 |
| CF-050 | Fitness Ecosystem Integrations | MF-106, MF-107, MF-108, MF-109 |
| CF-051 | AI Assistant Integrations | MF-110, MF-111 |
| CF-052 | Sync Export Import and Cloud | MF-112, MF-113, MF-114, MF-130 |

### Duplicate/Overlap Consolidation

1. `CF-048` retained as `Live Activity and Lock-screen Runtime` with single-source mapping.
Raw matrix label: MF-103 Live Activities and lock-screen support.
2. `CF-049` normalized overlapping matrix labels into `Voice Assistant Integrations`.
Raw matrix labels: MF-104 Siri integration; MF-105 Alexa integration.
3. `CF-050` normalized overlapping matrix labels into `Fitness Ecosystem Integrations`.
Raw matrix labels: MF-106 Fitbit integration; MF-107 Apple Health integration controls; MF-108 Strava sync support; MF-109 Apple Watch support.
4. `CF-051` normalized overlapping matrix labels into `AI Assistant Integrations`.
Raw matrix labels: MF-110 ChatGPT integration; MF-111 Apple Intelligence integration.
5. `CF-052` normalized overlapping matrix labels into `Sync Export Import and Cloud`.
Raw matrix labels: MF-112 Cloud sync positioning; MF-113 Export data capability; MF-114 Import third-party workout CSV; MF-130 Public API and external integration requests.

## Coaching

### Canonical Taxonomy

| Canonical ID | Canonical Feature | Source MF IDs |
|---|---|---|
| CF-053 | Personal Coach and Trainer Modes | MF-119 |

### Duplicate/Overlap Consolidation

1. `CF-053` retained as `Personal Coach and Trainer Modes` with single-source mapping.
Raw matrix label: MF-119 Personal trainer or coach mode.

## Marketplace and Creator Distribution Model Guarantees

1. Publishing eligibility model: creators can publish workout, routine, and program objects through `CF-011` and `CF-014` only after meeting credibility thresholds.
2. Discovery marketplace model: `CF-038` defines ranked and filtered marketplace discovery for routines/programs/creators, not generic social feed timelines.
3. Lifecycle action model: `CF-039` defines save, copy, start, complete, rate, and creator follow action pathways.
4. Rating integrity model: `CF-040` enforces completion-gated ratings only; launch scope excludes comment systems.
5. Distribution gating model: `CF-041` applies creator visibility tiers and ranking eligibility gates based on quality and trust signals.
6. Creator page model: `CF-042` defines user and creator profile surfaces with published assets, trust metrics, and external links.
7. Completion evidence model: `CF-026` and `CF-036` provide completion and continuity evidence used by publishing eligibility, rating integrity, and distribution systems.

## Creator Visibility Tier Model

1. `Tier 0`: private drafts, not discoverable in Explore.
2. `Tier 1`: published and accessible by direct link/search, low-ranked distribution.
3. `Tier 2`: eligible for ranked Explore lanes based on credibility and quality score thresholds.
4. Tier assignment factors: profile completeness, routine/program completeness, copies, starts, completions, completion rate, completion-gated ratings, PR outcomes, spam/report signals.
5. Publishing threshold examples: minimum completed workouts, minimum training days, and minimum routine completions.
6. Likes are excluded as primary ranking signals.

## Full MF Coverage Ledger

| MF ID | Matrix Feature Label | Canonical ID | Domain | Canonical Feature |
|---|---|---|---|---|
| MF-001 | Auth with Apple Google Email | CF-001 | Identity & Onboarding | Account Authentication and Login |
| MF-002 | Existing account email login | CF-001 | Identity & Onboarding | Account Authentication and Login |
| MF-003 | Multi-step onboarding personalization | CF-002 | Identity & Onboarding | Onboarding Personalization Core |
| MF-004 | Onboarding goal selection | CF-002 | Identity & Onboarding | Onboarding Personalization Core |
| MF-005 | Onboarding experience level calibration | CF-002 | Identity & Onboarding | Onboarding Personalization Core |
| MF-006 | Onboarding equipment profiling | CF-003 | Identity & Onboarding | Onboarding Context Inputs |
| MF-007 | Onboarding schedule by days per week | CF-003 | Identity & Onboarding | Onboarding Context Inputs |
| MF-008 | Onboarding location training environment selection | CF-003 | Identity & Onboarding | Onboarding Context Inputs |
| MF-009 | Onboarding body metrics capture | CF-003 | Identity & Onboarding | Onboarding Context Inputs |
| MF-010 | Onboarding manual data-entry fallback | CF-003 | Identity & Onboarding | Onboarding Context Inputs |
| MF-011 | Onboarding source attribution question | CF-003 | Identity & Onboarding | Onboarding Context Inputs |
| MF-012 | Onboarding loading progress states | CF-004 | Identity & Onboarding | Onboarding Progress Feedback |
| MF-013 | Notifications pre-permission value prompt | CF-005 | Identity & Onboarding | Pre-permission Education |
| MF-014 | Apple Health pre-permission step | CF-005 | Identity & Onboarding | Pre-permission Education |
| MF-015 | Onboarding paywall intercept | CF-006 | Identity & Onboarding | Onboarding Monetization Gate |
| MF-016 | Paywall yearly monthly selector | CF-007 | Monetization & Growth | Paywall Plan Packaging |
| MF-017 | Paywall promo code entry | CF-008 | Monetization & Growth | Promotions and Offer Mechanics |
| MF-018 | Restore purchases on paywall | CF-009 | Monetization & Growth | Purchase Recovery and Billing Controls |
| MF-019 | Trial reminder messaging in paywall | CF-009 | Monetization & Growth | Purchase Recovery and Billing Controls |
| MF-020 | App Store subscription sheet handoff | CF-009 | Monetization & Growth | Purchase Recovery and Billing Controls |
| MF-021 | Seasonal promo campaign banner | CF-008 | Monetization & Growth | Promotions and Offer Mechanics |
| MF-022 | Free pass invite flow | CF-010 | Monetization & Growth | Referral and Free-pass Growth Loops |
| MF-023 | Routine creation from scratch | CF-011 | Routine System | Workout, Routine, and Program Publishing Foundation |
| MF-024 | AI routine generation | CF-012 | Routine System | AI Program Generation and Evolution |
| MF-025 | Routine template catalog | CF-013 | Routine System | Workout, Routine, and Program Catalog |
| MF-026 | Routine day assignment | CF-011 | Routine System | Workout, Routine, and Program Publishing Foundation |
| MF-027 | Add exercise via searchable library | CF-015 | Exercise Library | Exercise Search and Filter Engine |
| MF-028 | Exercise filters by muscle | CF-015 | Exercise Library | Exercise Search and Filter Engine |
| MF-029 | Exercise filters by equipment | CF-015 | Exercise Library | Exercise Search and Filter Engine |
| MF-030 | Exercise filters by duration | CF-015 | Exercise Library | Exercise Search and Filter Engine |
| MF-031 | Favorite and excluded exercise lists | CF-016 | Exercise Library | Exercise Preference Curation |
| MF-032 | Custom exercise creation | CF-017 | Exercise Library | Custom Exercise Authoring |
| MF-033 | Superset creation in planner | CF-018 | Exercise Library | Routine Composition Controls |
| MF-034 | Replace or swap exercise | CF-018 | Exercise Library | Routine Composition Controls |
| MF-035 | Reorder exercises drag and drop | CF-018 | Exercise Library | Routine Composition Controls |
| MF-036 | Per-exercise rest timer defaults | CF-023 | Workout Logging | Timer Stack |
| MF-037 | Warm-up set support | CF-024 | Workout Logging | Adaptive Defaults and PR Feedback |
| MF-038 | Bodyweight-only mode toggle | CF-020 | Workout Logging | Session Entry and Start Modes |
| MF-039 | Start empty workout flow | CF-020 | Workout Logging | Session Entry and Start Modes |
| MF-040 | Workout quick-start from today card | CF-020 | Workout Logging | Session Entry and Start Modes |
| MF-041 | Workout recommendation cards | CF-020 | Workout Logging | Session Entry and Start Modes |
| MF-042 | Workout swap current session | CF-020 | Workout Logging | Session Entry and Start Modes |
| MF-043 | Live set table logging | CF-021 | Workout Logging | Set Logging Interaction Model |
| MF-044 | Numeric keypad set entry | CF-021 | Workout Logging | Set Logging Interaction Model |
| MF-045 | Set completion checkmarks | CF-021 | Workout Logging | Set Logging Interaction Model |
| MF-046 | In-session set overflow actions | CF-021 | Workout Logging | Set Logging Interaction Model |
| MF-047 | RPE tracking in session | CF-022 | Workout Logging | Effort and Intensity Capture |
| MF-048 | RPE guidance legend | CF-022 | Workout Logging | Effort and Intensity Capture |
| MF-049 | Rest timer auto-start | CF-023 | Workout Logging | Timer Stack |
| MF-050 | Rest timer quick adjust and skip | CF-023 | Workout Logging | Timer Stack |
| MF-051 | Rest timer per-exercise override sheet | CF-023 | Workout Logging | Timer Stack |
| MF-052 | Live session elapsed timer | CF-023 | Workout Logging | Timer Stack |
| MF-053 | Auto-load previous set values | CF-024 | Workout Logging | Adaptive Defaults and PR Feedback |
| MF-054 | Coach tips within workout | CF-022 | Workout Logging | Effort and Intensity Capture |
| MF-055 | New personal record detection | CF-024 | Workout Logging | Adaptive Defaults and PR Feedback |
| MF-056 | Effort prompt reps-left question | CF-022 | Workout Logging | Effort and Intensity Capture |
| MF-057 | Workout finish confirmation modal | CF-025 | Workout Logging | Session Safeguards and Controls |
| MF-058 | Workout discard confirmation modal | CF-025 | Workout Logging | Session Safeguards and Controls |
| MF-059 | Save workout policy toggles | CF-025 | Workout Logging | Session Safeguards and Controls |
| MF-060 | Post-workout processing loading | CF-026 | Workout Logging | Session Completion Outputs and Routine Progress Tracking |
| MF-061 | Post-workout summary screen | CF-026 | Workout Logging | Session Completion Outputs and Routine Progress Tracking |
| MF-062 | Shareable workout result card | CF-026 | Workout Logging | Session Completion Outputs and Routine Progress Tracking |
| MF-063 | Workout tutorial walkthrough | CF-026 | Workout Logging | Session Completion Outputs and Routine Progress Tracking |
| MF-064 | Workout settings sheet in session | CF-025 | Workout Logging | Session Safeguards and Controls |
| MF-065 | Exercise detail overview tab | CF-019 | Exercise Library | Exercise Knowledge Surfaces |
| MF-066 | Exercise detail performance charts | CF-019 | Exercise Library | Exercise Knowledge Surfaces |
| MF-067 | Exercise detail guide instructions | CF-019 | Exercise Library | Exercise Knowledge Surfaces |
| MF-068 | Exercise demo media playback | CF-019 | Exercise Library | Exercise Knowledge Surfaces |
| MF-069 | Exercise form cues and mistakes | CF-019 | Exercise Library | Exercise Knowledge Surfaces |
| MF-070 | Strength score composite metric | CF-027 | Analytics | Strength and Recovery Scoring |
| MF-071 | Recovery readiness zone | CF-027 | Analytics | Strength and Recovery Scoring |
| MF-072 | Muscle balance radar chart | CF-028 | Analytics | Muscle Distribution Analytics |
| MF-073 | Body map analytics | CF-028 | Analytics | Muscle Distribution Analytics |
| MF-074 | Weekly set target radar | CF-029 | Analytics | Target Radar Analytics |
| MF-075 | Progress dashboard weekly metrics | CF-030 | Analytics | Weekly KPI Dashboard |
| MF-076 | Volume trend charts | CF-031 | Analytics | Performance Trends and Rankings |
| MF-077 | Top exercises ranking | CF-031 | Analytics | Performance Trends and Rankings |
| MF-078 | Recent PR history list | CF-031 | Analytics | Performance Trends and Rankings |
| MF-079 | Calendar workout history | CF-032 | Analytics | History and Report Windows |
| MF-080 | Workout report by date range | CF-032 | Analytics | History and Report Windows |
| MF-081 | Body measurements logging | CF-033 | Analytics | Body Measurement Tracking |
| MF-082 | Body measurements charts | CF-033 | Analytics | Body Measurement Tracking |
| MF-083 | Before and after progress photos | CF-034 | Analytics | Body Transformation and Nutrition Targets |
| MF-084 | Nutrition target calculations | CF-034 | Analytics | Body Transformation and Nutrition Targets |
| MF-085 | Achievements and badges | CF-035 | Analytics | Achievements and Milestones |
| MF-086 | Milestone progress cards | CF-035 | Analytics | Achievements and Milestones |
| MF-087 | Streak tracking and weekly goals | CF-036 | Analytics | Streak and Habit Continuity Metrics |
| MF-088 | Referral and sharing incentives | CF-010 | Monetization & Growth | Referral and Free-pass Growth Loops |
| MF-089 | Community feed and discover | CF-038 | Routine Marketplace Community | Routine and Program Discovery Marketplace |
| MF-090 | Likes and comments interactions | CF-039 | Routine Marketplace Community | Routine Lifecycle Actions and Creator Follow |
| MF-091 | Groups and communities | CF-040 | Routine Marketplace Community | Completion-Gated Ratings |
| MF-092 | Follow athletes or users | CF-039 | Routine Marketplace Community | Routine Lifecycle Actions and Creator Follow |
| MF-093 | Privacy and social visibility controls | CF-041 | Routine Marketplace Community | Creator Distribution Eligibility, Credibility, Visibility, and Safety Controls |
| MF-094 | Blocked users management | CF-041 | Routine Marketplace Community | Creator Distribution Eligibility, Credibility, Visibility, and Safety Controls |
| MF-095 | Profile editing name photo bio | CF-042 | Account & UX Infrastructure | Creator and User Profile Management |
| MF-096 | Account deletion workflow | CF-043 | Account & UX Infrastructure | Account Lifecycle and Recovery |
| MF-097 | Subscription management page | CF-009 | Monetization & Growth | Purchase Recovery and Billing Controls |
| MF-098 | Theme and color customization | CF-044 | Account & UX Infrastructure | Appearance Localization and Units |
| MF-099 | App icon customization | CF-044 | Account & UX Infrastructure | Appearance Localization and Units |
| MF-100 | Language controls | CF-044 | Account & UX Infrastructure | Appearance Localization and Units |
| MF-101 | Unit controls kg lbs | CF-044 | Account & UX Infrastructure | Appearance Localization and Units |
| MF-102 | Notification settings granularity | CF-045 | Account & UX Infrastructure | Notification and Reminder Controls |
| MF-103 | Live Activities and lock-screen support | CF-048 | Platform Features | Live Activity and Lock-screen Runtime |
| MF-104 | Siri integration | CF-049 | Platform Features | Voice Assistant Integrations |
| MF-105 | Alexa integration | CF-049 | Platform Features | Voice Assistant Integrations |
| MF-106 | Fitbit integration | CF-050 | Platform Features | Fitness Ecosystem Integrations |
| MF-107 | Apple Health integration controls | CF-050 | Platform Features | Fitness Ecosystem Integrations |
| MF-108 | Strava sync support | CF-050 | Platform Features | Fitness Ecosystem Integrations |
| MF-109 | Apple Watch support | CF-050 | Platform Features | Fitness Ecosystem Integrations |
| MF-110 | ChatGPT integration | CF-051 | Platform Features | AI Assistant Integrations |
| MF-111 | Apple Intelligence integration | CF-051 | Platform Features | AI Assistant Integrations |
| MF-112 | Cloud sync positioning | CF-052 | Platform Features | Sync Export Import and Cloud |
| MF-113 | Export data capability | CF-052 | Platform Features | Sync Export Import and Cloud |
| MF-114 | Import third-party workout CSV | CF-052 | Platform Features | Sync Export Import and Cloud |
| MF-115 | Feature request board voting | CF-046 | Account & UX Infrastructure | Support and Product Communications |
| MF-116 | Help center and FAQ hub | CF-046 | Account & UX Infrastructure | Support and Product Communications |
| MF-117 | Contact support entry | CF-046 | Account & UX Infrastructure | Support and Product Communications |
| MF-118 | About and version screen | CF-046 | Account & UX Infrastructure | Support and Product Communications |
| MF-119 | Personal trainer or coach mode | CF-053 | Coaching | Personal Coach and Trainer Modes |
| MF-120 | Program explore library | CF-013 | Routine System | Workout, Routine, and Program Catalog |
| MF-121 | Habit reminder scheduling | CF-045 | Account & UX Infrastructure | Notification and Reminder Controls |
| MF-122 | Account verification and recovery tools | CF-043 | Account & UX Infrastructure | Account Lifecycle and Recovery |
| MF-123 | Plan progression phases | CF-012 | Routine System | AI Program Generation and Evolution |
| MF-124 | Custom workout builder with add-day controls | CF-014 | Routine System | Workout, Routine, and Program Builder Structure |
| MF-125 | Promo discount and gift mechanics | CF-008 | Monetization & Growth | Promotions and Offer Mechanics |
| MF-126 | In-app goals and per-exercise targets | CF-037 | Analytics | Goal and Target Modeling |
| MF-127 | Workout streak leaderboard | CF-036 | Analytics | Streak and Habit Continuity Metrics |
| MF-128 | Data erase controls | CF-047 | Account & UX Infrastructure | Data Governance Controls |
| MF-129 | Cross-platform account transfer guidance | CF-047 | Account & UX Infrastructure | Data Governance Controls |
| MF-130 | Public API and external integration requests | CF-052 | Platform Features | Sync Export Import and Cloud |
