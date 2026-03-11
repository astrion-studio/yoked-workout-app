# Yoked Product Design Strategy

Decision values: `INCLUDE`, `IMPROVE`, `REJECT`.
Priority values: `P0`, `P1`, `P2`, `N/A`.

## Final Navigation Contract

1. Launch uses exactly five primary tabs: `Home`, `Train`, `My Workouts`, `Explore`, `You`.
2. `Home` is context and insight only; workout execution controls are excluded.
3. `Train` is the exclusive workout execution surface and owns active session flows.
4. `My Workouts` owns user training assets: workouts, programs, routines, saved, drafts, and published-by-me surfaces.
5. `Explore` is marketplace discovery with category rail + vertical ranked feed; no TikTok-style fullscreen launch default.
6. `You` owns identity, progress, history, analytics, settings, subscription, and integrations.

## Marketplace Discovery and Publishing Contract

1. Publishing requires creator credibility eligibility before publish is enabled for workout, routine, and program objects.
2. Publishing eligibility examples: minimum completed workouts, minimum training days, and minimum routine completions.
3. Distribution is gated: Explore ranking visibility depends on creator credibility and asset quality tiers.
4. Tier model: Tier 0 private drafts, Tier 1 published low distribution, Tier 2 ranked distribution eligibility.
5. Ranking inputs: profile completeness, routine/program completeness, copies, starts, completions, completion rate, completion-gated ratings, PR outcomes, spam/report signals.
6. Likes are excluded as primary ranking signals.
7. Launch marketplace interactions are explicitly constrained to: save, copy, start, complete, rate, and follow creator.

## Launch Rejections (Non-Negotiable)

1. Reject generic social feed timelines.
2. Reject TikTok-style fullscreen discovery as launch default.
3. Reject comments at launch.
4. Reject posts, DMs, and video-feed mechanics at launch.
5. Reject groups/forums and influencer content timelines.

| Canonical ID | Domain | Canonical Feature | Source MF IDs | Decision | Priority | Strategy Rationale | Product Directive |
|---|---|---|---|---|---|---|---|
| CF-001 | Identity & Onboarding | Account Authentication and Login | MF-001, MF-002 | INCLUDE | P0 | Baseline trust requirement. Multi-provider auth plus email login removes initial acquisition friction. | Ship Apple/Google/Email auth and existing-account login in v1. |
| CF-002 | Identity & Onboarding | Onboarding Personalization Core | MF-003, MF-004, MF-005 | INCLUDE | P0 | All six competitors use deep onboarding personalization as default architecture. | Implement structured onboarding for goals and experience as first-run core. |
| CF-003 | Identity & Onboarding | Onboarding Context Inputs | MF-006, MF-007, MF-008, MF-009, MF-010, MF-011 | INCLUDE | P0 | Context inputs directly drive program quality and retention. | Collect equipment, schedule, location, body metrics, manual fallback, attribution. |
| CF-004 | Identity & Onboarding | Onboarding Progress Feedback | MF-012 | IMPROVE | P1 | Loading transparency is inconsistent across competitors and can reduce abandonment. | Use staged progress states with explicit status copy and deterministic completion messaging. |
| CF-005 | Identity & Onboarding | Pre-permission Education | MF-013, MF-014 | INCLUDE | P0 | Pre-permission framing materially increases permission acceptance. | Add value-first education for notifications and health-sync before OS prompts. |
| CF-006 | Identity & Onboarding | Onboarding Monetization Gate | MF-015 | INCLUDE | P0 | Onboarding paywall intercept is a core revenue pattern in top competitors. | Keep paywall in onboarding after personalization result. |
| CF-007 | Monetization & Growth | Paywall Plan Packaging | MF-016 | INCLUDE | P0 | Yearly/monthly plan packaging is required for subscription monetization baseline. | Support annual and monthly plan options with clear plan card hierarchy. |
| CF-008 | Monetization & Growth | Promotions and Offer Mechanics | MF-017, MF-021, MF-125 | IMPROVE | P1 | Promo mechanics exist but are often intrusive or fragmented. | Unify promo code, seasonal offer, and gift mechanics under one controlled promotions framework. |
| CF-009 | Monetization & Growth | Purchase Recovery and Billing Controls | MF-018, MF-019, MF-020, MF-097 | INCLUDE | P0 | Billing trust depends on restore, reminders, and clear subscription controls. | Ship restore purchases, trial reminders, store handoff, and in-app subscription management. |
| CF-010 | Monetization & Growth | Referral and Free-pass Growth Loops | MF-022, MF-088 | IMPROVE | P2 | Referral loops remain secondary to launch-critical training execution and marketplace trust loops. | Limit referral surfaces to post-value moments and keep outside primary Explore and You flows. |
| CF-011 | Routine System | Workout, Routine, and Program Publishing Foundation | MF-023, MF-026 | INCLUDE | P0 | Publishing must be credibility-gated before creators can publish workout, routine, or program objects. | Enforce publish threshold checks (minimum completed workouts, minimum training days, minimum routine completions) before publish actions are enabled. |
| CF-012 | Routine System | AI Program Generation and Evolution | MF-024, MF-123 | INCLUDE | P0 | AI programming is a core launch pillar and must produce executable routines/programs integrated with Train and My Workouts. | Ship AI generation and progression-phase adaptation connected to onboarding inputs and completion outcomes. |
| CF-013 | Routine System | Workout, Routine, and Program Catalog | MF-025, MF-120 | INCLUDE | P0 | My Workouts and Explore both rely on structured routine/program catalogs as baseline architecture. | Expose catalog surfaces in My Workouts and Explore with consistent metadata and search indexing. |
| CF-014 | Routine System | Workout, Routine, and Program Builder Structure | MF-124 | INCLUDE | P0 | Program builder controls are launch critical because marketplace assets must be editable and ownable by creators and users. | Ship builder structure for multi-day routine/program creation, validation, and save/publish transitions. |
| CF-015 | Exercise Library | Exercise Search and Filter Engine | MF-027, MF-028, MF-029, MF-030 | INCLUDE | P0 | Search and filters are core for exercise discovery and routine speed. | Ship searchable library with muscle/equipment/duration filters. |
| CF-016 | Exercise Library | Exercise Preference Curation | MF-031 | INCLUDE | P1 | Preference curation improves recommendations over time with low interaction cost. | Support favorite and excluded exercise lists. |
| CF-017 | Exercise Library | Custom Exercise Authoring | MF-032 | INCLUDE | P1 | Custom exercise support is expected by advanced users. | Allow creation of custom exercises with metadata sufficient for logging and analytics. |
| CF-018 | Exercise Library | Routine Composition Controls | MF-033, MF-034, MF-035 | INCLUDE | P0 | Superset/replace/reorder are mandatory for practical routine editing. | Include composition controls in both planning and active edit contexts. |
| CF-019 | Exercise Library | Exercise Knowledge Surfaces | MF-065, MF-066, MF-067, MF-068, MF-069 | IMPROVE | P1 | Knowledge surfaces exist but are fragmented across apps. | Unify overview/performance/guide/media/form-cue into a coherent exercise detail system. |
| CF-020 | Workout Logging | Session Entry and Start Modes | MF-038, MF-039, MF-040, MF-041, MF-042 | INCLUDE | P0 | Train is the exclusive execution surface; all start and resume workout controls must route through Train. | Restrict workout execution entry actions to Train segmented modes (Today, Instant, Recent). |
| CF-021 | Workout Logging | Set Logging Interaction Model | MF-043, MF-044, MF-045, MF-046 | INCLUDE | P0 | Set logging interactions define core product speed and reliability. | Implement set table, numeric keypad, completion checks, and set overflow actions. |
| CF-022 | Workout Logging | Effort and Intensity Capture | MF-047, MF-048, MF-054, MF-056 | IMPROVE | P1 | Effort capture features are uneven but high value for progression quality. | Keep RPE and reps-left prompts lightweight and optional by training mode. |
| CF-023 | Workout Logging | Timer Stack | MF-036, MF-049, MF-050, MF-051, MF-052 | INCLUDE | P0 | Timer infrastructure is central to realistic gym session behavior. | Ship auto-start timer, quick adjust, override sheet, and elapsed timer. |
| CF-024 | Workout Logging | Adaptive Defaults and PR Feedback | MF-037, MF-053, MF-055 | IMPROVE | P1 | Adaptive defaults and PR detection are differentiators when accurate. | Use previous-set preload, warm-up handling, and immediate PR surfacing with confidence guardrails. |
| CF-025 | Workout Logging | Session Safeguards and Controls | MF-057, MF-058, MF-059, MF-064 | INCLUDE | P0 | Session safeguards prevent data loss and accidental destructive actions. | Support finish/discard confirmation, save-policy toggles, and in-session settings. |
| CF-026 | Workout Logging | Session Completion Outputs and Routine Progress Tracking | MF-060, MF-061, MF-062, MF-063 | INCLUDE | P0 | Completion outputs must persist routine/program progress and evidence for credibility and ratings. | Write completion ledger records at workout close and trigger eligibility updates. |
| CF-027 | Analytics | Strength and Recovery Scoring | MF-070, MF-071 | IMPROVE | P1 | Strength/recovery scoring is high-value but often opaque. | Keep scoring transparent with clear inputs and confidence messaging. |
| CF-028 | Analytics | Muscle Distribution Analytics | MF-072, MF-073 | INCLUDE | P1 | Muscle distribution analytics are broadly present and useful for balance decisions. | Include muscle maps and distribution/radar at session and weekly levels. |
| CF-029 | Analytics | Target Radar Analytics | MF-074 | REJECT | N/A | Standalone target-radar visualization is not required for launch training execution or marketplace trust. | Do not ship standalone target-radar module in launch scope. |
| CF-030 | Analytics | Weekly KPI Dashboard | MF-075 | INCLUDE | P0 | Core progress insight must surface in You > Progress and lightweight summary cards in Home. | Persist weekly KPI pipeline and render full analytics in You while keeping Home lightweight. |
| CF-031 | Analytics | Performance Trends and Rankings | MF-076, MF-077, MF-078 | INCLUDE | P1 | Trend and ranking views support progression comprehension and retention. | Include volume trends, top exercises, and PR history ranking views. |
| CF-032 | Analytics | History and Report Windows | MF-079, MF-080 | INCLUDE | P0 | Workout history is a core You surface and required for auditability and progression review. | Place history and date-range reports under You > Progress, not under separate Progress tab. |
| CF-033 | Analytics | Body Measurement Tracking | MF-081, MF-082 | INCLUDE | P0 | Body measurement tracking is core for non-strength progress signals. | Ship measurement input + charting with time filters. |
| CF-034 | Analytics | Body Transformation and Nutrition Targets | MF-083, MF-084 | REJECT | N/A | Nutrition and transformation tracking are outside launch product boundary. | Do not ship nutrition targeting or transformation photo workflows in launch scope. |
| CF-035 | Analytics | Achievements and Milestones | MF-085, MF-086 | INCLUDE | P1 | Achievements and milestones improve retention when tied to real progress. | Include badge and milestone cards linked to measurable outcomes. |
| CF-036 | Analytics | Streak and Habit Continuity Metrics | MF-087, MF-127 | INCLUDE | P1 | Streak and habit continuity are proven retention drivers across competitors. | Ship streak tracking and configurable weekly goal continuity signals. |
| CF-037 | Analytics | Goal and Target Modeling | MF-126 | INCLUDE | P0 | Goal and target modeling is required for adaptive plans and analytics relevance. | Support in-app per-user goal targets and per-exercise targets. |
| CF-038 | Routine Marketplace Community | Routine and Program Discovery Marketplace | MF-089 | INCLUDE | P0 | Explore must launch as a metadata-rich marketplace with horizontal categories and vertical ranked cards, not immersive social video feed. | Implement category rail plus vertical ranked feed lanes and searchable cards for routines/programs/creators; reject TikTok-style fullscreen default. |
| CF-039 | Routine Marketplace Community | Routine Lifecycle Actions and Creator Follow | MF-090, MF-092 | INCLUDE | P0 | Marketplace conversion requires lifecycle actions and creator follow from discovery detail pages. | Ship save, copy, start, complete, rate, and follow actions from routine/program and creator surfaces. |
| CF-040 | Routine Marketplace Community | Completion-Gated Ratings | MF-091 | INCLUDE | P0 | Rating trust requires completion-gated rules and launch scope explicitly excludes comments. | Enforce rating gates: workout completion, routine at least 2 sessions, program 25-40 percent completion; no comment submission UI/API at launch. |
| CF-041 | Routine Marketplace Community | Creator Distribution Eligibility, Credibility, Visibility, and Safety Controls | MF-093, MF-094 | INCLUDE | P0 | Creator distribution must be credibility-gated after publishing eligibility thresholds are met. | Apply visibility tiers (Tier 0 draft, Tier 1 published low distribution, Tier 2 ranked distribution) using trust and quality signals. |
| CF-042 | Account & UX Infrastructure | Creator and User Profile Management | MF-095 | INCLUDE | P0 | You must own user and creator profile surfaces with published assets and trust metadata. | Expose Profile segment in You with user identity, creator page data, published assets, and follower surfaces. |
| CF-043 | Account & UX Infrastructure | Account Lifecycle and Recovery | MF-096, MF-122 | INCLUDE | P0 | Account lifecycle controls remain mandatory in You > Settings. | Ship recovery and deletion workflows in You > Settings account section. |
| CF-044 | Account & UX Infrastructure | Appearance Localization and Units | MF-098, MF-099, MF-100, MF-101 | INCLUDE | P0 | Settings personalization controls are required inside You tab settings segment. | Place units, localization, and appearance controls only in You > Settings. |
| CF-045 | Account & UX Infrastructure | Notification and Reminder Controls | MF-102, MF-121 | INCLUDE | P0 | Reminder controls are required under You settings and drive adherence loops. | Expose notification category toggles and scheduling controls in You > Settings. |
| CF-046 | Account & UX Infrastructure | Support and Product Communications | MF-115, MF-116, MF-117, MF-118 | INCLUDE | P0 | Support and communications prevent churn and reduce support load. | Ship FAQ/help/contact/about and product feedback channel. |
| CF-047 | Account & UX Infrastructure | Data Governance Controls | MF-128, MF-129 | INCLUDE | P0 | Data governance controls are required for privacy and portability trust. | Include data erase and cross-platform migration/transfer guidance. |
| CF-048 | Platform Features | Live Activity and Lock-screen Runtime | MF-103 | INCLUDE | P1 | Live Activity remains a high-value workout runtime enhancer tied to Train execution. | Keep live activity and lock-screen runtime tied to active Train sessions. |
| CF-049 | Platform Features | Voice Assistant Integrations | MF-104, MF-105 | IMPROVE | P2 | Voice workflows are useful but not launch critical compared with workout execution and marketplace trust. | Defer broad assistant expansion; keep post-launch Siri-quality focus. |
| CF-050 | Platform Features | Fitness Ecosystem Integrations | MF-106, MF-107, MF-108, MF-109 | INCLUDE | P0 | Health ecosystem integration is expected by serious fitness users. | Ship Apple Health, Strava, Fitbit, and Apple Watch integration paths where supported. |
| CF-051 | Platform Features | AI Assistant Integrations | MF-110, MF-111 | REJECT | N/A | External AI assistant integrations are outside launch scope and do not improve core execution reliability. | Defer ChatGPT and Apple Intelligence integrations. |
| CF-052 | Platform Features | Sync Export Import and Cloud | MF-112, MF-113, MF-114, MF-130 | INCLUDE | P0 | Sync/export/import/cloud features are required for trust, portability, and lock-in reduction. | Support cloud sync positioning, export, and third-party import workflows. |
| CF-053 | Coaching | Personal Coach and Trainer Modes | MF-119 | IMPROVE | P1 | Coach mode is strongest when trained on completion and credibility-aware outcomes. | Use creator quality and completion evidence as inputs for coach recommendations. |
