# Feature Priorities

## Priority Definitions
1. `P0 — Launch critical`: mandatory for the five-tab launch architecture and routine marketplace trust model.
2. `P1 — Launch differentiators`: shipped at launch when stable; may be feature-flagged if reliability risk appears late.
3. `P2 — Post-launch enhancements`: valid roadmap scope with lower launch leverage.

## Five-Tab Surface Alignment (Launch)
1. `Home` surface ownership: context and insight cards only (`CF-030`, `CF-037`, `CF-038` highlights), no workout execution controls.
2. `Train` surface ownership: all workout start/resume/execution and completion actions (`CF-020`..`CF-026`, `CF-048`).
3. `My Workouts` surface ownership: user-owned programs/routines/saved/drafts/published-by-me (`CF-011`, `CF-013`, `CF-014`, `CF-018`, `CF-039`).
4. `Explore` surface ownership: discovery marketplace, search, creator spotlights, credibility-ranked distribution (`CF-038`, `CF-039`, `CF-040`, `CF-041`).
5. `You` surface ownership: profile, history, analytics, settings, subscription, integrations (`CF-027`, `CF-028`, `CF-030`, `CF-031`, `CF-032`, `CF-033`, `CF-035`, `CF-036`, `CF-042`..`CF-047`, `CF-050`, `CF-052`).

## P0 Assignment
| Canonical ID | Domain | Canonical Feature | Source MF IDs | Strategy Intent |
|---|---|---|---|---|
| CF-001 | Identity & Onboarding | Account Authentication and Login | MF-001, MF-002 | INCLUDE: Baseline trust requirement. Multi-provider auth plus email login removes initial acquisition friction. |
| CF-002 | Identity & Onboarding | Onboarding Personalization Core | MF-003, MF-004, MF-005 | INCLUDE: All six competitors use deep onboarding personalization as default architecture. |
| CF-003 | Identity & Onboarding | Onboarding Context Inputs | MF-006, MF-007, MF-008, MF-009, MF-010, MF-011 | INCLUDE: Context inputs directly drive program quality and retention. |
| CF-005 | Identity & Onboarding | Pre-permission Education | MF-013, MF-014 | INCLUDE: Pre-permission framing materially increases permission acceptance. |
| CF-006 | Identity & Onboarding | Onboarding Monetization Gate | MF-015 | INCLUDE: Onboarding paywall intercept is a core revenue pattern in top competitors. |
| CF-007 | Monetization & Growth | Paywall Plan Packaging | MF-016 | INCLUDE: Yearly/monthly plan packaging is required for subscription monetization baseline. |
| CF-009 | Monetization & Growth | Purchase Recovery and Billing Controls | MF-018, MF-019, MF-020, MF-097 | INCLUDE: Billing trust depends on restore, reminders, and clear subscription controls. |
| CF-011 | Routine System | Workout, Routine, and Program Publishing Foundation | MF-023, MF-026 | INCLUDE: Publishing is threshold-gated; creators must satisfy minimum completed workouts, minimum training days, and minimum routine completions before publishing workout/routine/program assets. |
| CF-012 | Routine System | AI Program Generation and Evolution | MF-024, MF-123 | INCLUDE: AI programming is a core launch pillar and must produce executable routines/programs integrated with Train and My Workouts. |
| CF-013 | Routine System | Workout, Routine, and Program Catalog | MF-025, MF-120 | INCLUDE: My Workouts and Explore both rely on structured routine/program catalogs as baseline architecture. |
| CF-014 | Routine System | Workout, Routine, and Program Builder Structure | MF-124 | INCLUDE: Program builder controls are launch critical because marketplace assets must be editable and ownable by creators and users. |
| CF-015 | Exercise Library | Exercise Search and Filter Engine | MF-027, MF-028, MF-029, MF-030 | INCLUDE: Search and filters are core for exercise discovery and routine speed. |
| CF-018 | Exercise Library | Routine Composition Controls | MF-033, MF-034, MF-035 | INCLUDE: Superset/replace/reorder are mandatory for practical routine editing. |
| CF-020 | Workout Logging | Session Entry and Start Modes | MF-038, MF-039, MF-040, MF-041, MF-042 | INCLUDE: Train is the exclusive execution surface; all start and resume workout controls must route through Train. |
| CF-021 | Workout Logging | Set Logging Interaction Model | MF-043, MF-044, MF-045, MF-046 | INCLUDE: Set logging interactions define core product speed and reliability. |
| CF-023 | Workout Logging | Timer Stack | MF-036, MF-049, MF-050, MF-051, MF-052 | INCLUDE: Timer infrastructure is central to realistic gym session behavior. |
| CF-025 | Workout Logging | Session Safeguards and Controls | MF-057, MF-058, MF-059, MF-064 | INCLUDE: Session safeguards prevent data loss and accidental destructive actions. |
| CF-026 | Workout Logging | Session Completion Outputs and Routine Progress Tracking | MF-060, MF-061, MF-062, MF-063 | INCLUDE: Completion outputs must persist routine/program progress and evidence for credibility and ratings. |
| CF-030 | Analytics | Weekly KPI Dashboard | MF-075 | INCLUDE: Core progress insight must surface in You > Progress and lightweight summary cards in Home. |
| CF-032 | Analytics | History and Report Windows | MF-079, MF-080 | INCLUDE: Workout history is a core You surface and required for auditability and progression review. |
| CF-033 | Analytics | Body Measurement Tracking | MF-081, MF-082 | INCLUDE: Body measurement tracking is core for non-strength progress signals. |
| CF-037 | Analytics | Goal and Target Modeling | MF-126 | INCLUDE: Goal and target modeling is required for adaptive plans and analytics relevance. |
| CF-038 | Routine Marketplace Community | Routine and Program Discovery Marketplace | MF-089 | INCLUDE: Explore must launch as a metadata-rich marketplace with horizontal categories and vertical ranked cards, not immersive social video feed. |
| CF-039 | Routine Marketplace Community | Routine Lifecycle Actions and Creator Follow | MF-090, MF-092 | INCLUDE: Marketplace conversion requires lifecycle actions and creator follow from discovery detail pages. |
| CF-040 | Routine Marketplace Community | Completion-Gated Ratings | MF-091 | INCLUDE: Rating trust requires completion-gated rules and launch scope explicitly excludes comments. |
| CF-041 | Routine Marketplace Community | Creator Distribution Eligibility, Credibility, Visibility, and Safety Controls | MF-093, MF-094 | INCLUDE: Publishing and discovery distribution are both credibility-gated using threshold eligibility and trust scoring. |
| CF-042 | Account & UX Infrastructure | Creator and User Profile Management | MF-095 | INCLUDE: You must own user and creator profile surfaces with published assets and trust metadata. |
| CF-043 | Account & UX Infrastructure | Account Lifecycle and Recovery | MF-096, MF-122 | INCLUDE: Account lifecycle controls remain mandatory in You > Settings. |
| CF-044 | Account & UX Infrastructure | Appearance Localization and Units | MF-098, MF-099, MF-100, MF-101 | INCLUDE: Settings personalization controls are required inside You tab settings segment. |
| CF-045 | Account & UX Infrastructure | Notification and Reminder Controls | MF-102, MF-121 | INCLUDE: Reminder controls are required under You settings and drive adherence loops. |
| CF-046 | Account & UX Infrastructure | Support and Product Communications | MF-115, MF-116, MF-117, MF-118 | INCLUDE: Support and communications prevent churn and reduce support load. |
| CF-047 | Account & UX Infrastructure | Data Governance Controls | MF-128, MF-129 | INCLUDE: Data governance controls are required for privacy and portability trust. |
| CF-050 | Platform Features | Fitness Ecosystem Integrations | MF-106, MF-107, MF-108, MF-109 | INCLUDE: Health ecosystem integration is expected by serious fitness users. |
| CF-052 | Platform Features | Sync Export Import and Cloud | MF-112, MF-113, MF-114, MF-130 | INCLUDE: Sync/export/import/cloud features are required for trust, portability, and lock-in reduction. |

## P1 Assignment
| Canonical ID | Domain | Canonical Feature | Source MF IDs | Strategy Intent |
|---|---|---|---|---|
| CF-004 | Identity & Onboarding | Onboarding Progress Feedback | MF-012 | IMPROVE: Loading transparency is inconsistent across competitors and can reduce abandonment. |
| CF-008 | Monetization & Growth | Promotions and Offer Mechanics | MF-017, MF-021, MF-125 | IMPROVE: Promo mechanics exist but are often intrusive or fragmented. |
| CF-016 | Exercise Library | Exercise Preference Curation | MF-031 | INCLUDE: Preference curation improves recommendations over time with low interaction cost. |
| CF-017 | Exercise Library | Custom Exercise Authoring | MF-032 | INCLUDE: Custom exercise support is expected by advanced users. |
| CF-019 | Exercise Library | Exercise Knowledge Surfaces | MF-065, MF-066, MF-067, MF-068, MF-069 | IMPROVE: Knowledge surfaces exist but are fragmented across apps. |
| CF-022 | Workout Logging | Effort and Intensity Capture | MF-047, MF-048, MF-054, MF-056 | IMPROVE: Effort capture features are uneven but high value for progression quality. |
| CF-024 | Workout Logging | Adaptive Defaults and PR Feedback | MF-037, MF-053, MF-055 | IMPROVE: Adaptive defaults and PR detection are differentiators when accurate. |
| CF-027 | Analytics | Strength and Recovery Scoring | MF-070, MF-071 | IMPROVE: Strength/recovery scoring is high-value but often opaque. |
| CF-028 | Analytics | Muscle Distribution Analytics | MF-072, MF-073 | INCLUDE: Muscle distribution analytics are broadly present and useful for balance decisions. |
| CF-031 | Analytics | Performance Trends and Rankings | MF-076, MF-077, MF-078 | INCLUDE: Trend and ranking views support progression comprehension and retention. |
| CF-035 | Analytics | Achievements and Milestones | MF-085, MF-086 | INCLUDE: Achievements and milestones improve retention when tied to real progress. |
| CF-036 | Analytics | Streak and Habit Continuity Metrics | MF-087, MF-127 | INCLUDE: Streak and habit continuity are proven retention drivers across competitors. |
| CF-048 | Platform Features | Live Activity and Lock-screen Runtime | MF-103 | INCLUDE: Live Activity remains a high-value workout runtime enhancer tied to Train execution. |
| CF-053 | Coaching | Personal Coach and Trainer Modes | MF-119 | IMPROVE: Coach mode is strongest when trained on completion and credibility-aware outcomes. |

## P2 Assignment
| Canonical ID | Domain | Canonical Feature | Source MF IDs | Strategy Intent |
|---|---|---|---|---|
| CF-010 | Monetization & Growth | Referral and Free-pass Growth Loops | MF-022, MF-088 | IMPROVE: Referral loops remain secondary to launch-critical training execution and marketplace trust loops. |
| CF-049 | Platform Features | Voice Assistant Integrations | MF-104, MF-105 | IMPROVE: Voice workflows are useful but not launch critical compared with workout execution and marketplace trust. |

## Rejected from Current Product Scope
| Canonical ID | Domain | Canonical Feature | Source MF IDs | Rejection Reason |
|---|---|---|---|---|
| CF-029 | Analytics | Target Radar Analytics | MF-074 | Standalone target-radar visualization is not required for launch training execution or marketplace trust. |
| CF-034 | Analytics | Body Transformation and Nutrition Targets | MF-083, MF-084 | Nutrition and transformation tracking are outside launch product boundary. |
| CF-051 | Platform Features | AI Assistant Integrations | MF-110, MF-111 | External AI assistant integrations are outside launch scope and do not improve core execution reliability. |

## P0 Launch Gate Assertions
1. Workout execution gate: `CF-020`, `CF-021`, `CF-023`, `CF-025`, `CF-026` are enabled in `Train` only.
2. Routine/program creation gate: `CF-011`, `CF-013`, `CF-014`, `CF-018` are enabled in `My Workouts`.
3. Marketplace discovery gate: `CF-038` is enabled with category rail, ranked vertical cards, and search.
4. Conversion action gate: `CF-039` exposes save/copy/start/follow actions from detail surfaces.
5. Rating trust gate: `CF-040` enforces completion-gated ratings with no comment surfaces.
6. Distribution trust gate: `CF-041` applies tier gating and credibility signals to Explore ranking inclusion.
7. You surface gate: analytics, history, and settings are available in `You` and removed as standalone tabs.
8. Exclusion gate: generic social feeds, comments, posts, groups/forums, DMs, and video-feed mechanics are not reachable in launch navigation.

## Future Creator Monetization Roadmap Note
1. Creator monetization is not part of launch scope.
2. Early roadmap option: one-time purchase of creator programs and routine packs.
3. Creator subscription monetization models are not included in the early roadmap.
