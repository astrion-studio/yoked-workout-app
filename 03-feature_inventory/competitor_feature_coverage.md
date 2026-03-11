# Competitor Feature Coverage

Alignment note:
- This file is a competitor evidence matrix.
- Canonical product direction is defined in the current `feature_inventory` architecture artifacts.
- Historical competitor social/community patterns are normalized into the current routine-marketplace taxonomy.

Source matrix: `analysis/competitor_analysis/competitor_master_feature_matrix.csv`

Status values: `yes`, `partial`, `no_evidence`, `unknown`.
Aggregation rule for canonical rows with multiple MF IDs:
1. `yes` when all mapped MF rows are `yes` for that competitor.
2. `partial` when any mapped MF row is `yes` or `partial` but not all `yes`.
3. `unknown` when no `yes`/`partial` and at least one mapped row is `unknown`.
4. `no_evidence` otherwise.
5. For `CF-038` to `CF-041`, evidence originating from competitor social-feed/group implementations is interpreted as non-aligned competitor behavior within the marketplace taxonomy.

| Canonical ID | Domain | Canonical Feature | Source MF IDs | Hevy | JEFIT | SmartGym | Fitbod | GymVerse | Stronger |
|---|---|---|---|---|---|---|---|---|---|
| CF-001 | Identity & Onboarding | Account Authentication and Login | MF-001, MF-002 | yes | unknown | unknown | yes | no_evidence | partial |
| CF-002 | Identity & Onboarding | Onboarding Personalization Core | MF-003, MF-004, MF-005 | yes | yes | yes | yes | yes | yes |
| CF-003 | Identity & Onboarding | Onboarding Context Inputs | MF-006, MF-007, MF-008, MF-009, MF-010, MF-011 | partial | partial | partial | yes | partial | partial |
| CF-004 | Identity & Onboarding | Onboarding Progress Feedback | MF-012 | no_evidence | partial | no_evidence | yes | yes | no_evidence |
| CF-005 | Identity & Onboarding | Pre-permission Education | MF-013, MF-014 | yes | no_evidence | yes | yes | partial | partial |
| CF-006 | Identity & Onboarding | Onboarding Monetization Gate | MF-015 | yes | no_evidence | yes | yes | yes | yes |
| CF-007 | Monetization & Growth | Paywall Plan Packaging | MF-016 | yes | partial | yes | yes | yes | partial |
| CF-008 | Monetization & Growth | Promotions and Offer Mechanics | MF-017, MF-021, MF-125 | no_evidence | no_evidence | partial | partial | yes | no_evidence |
| CF-009 | Monetization & Growth | Purchase Recovery and Billing Controls | MF-018, MF-019, MF-020, MF-097 | partial | partial | partial | yes | no_evidence | partial |
| CF-010 | Monetization & Growth | Referral and Free-pass Growth Loops | MF-022, MF-088 | no_evidence | yes | no_evidence | yes | yes | no_evidence |
| CF-011 | Routine System | Workout, Routine, and Program Publishing Foundation | MF-023, MF-026 | partial | yes | partial | partial | yes | yes |
| CF-012 | Routine System | AI Program Generation and Evolution | MF-024, MF-123 | no_evidence | partial | partial | partial | yes | yes |
| CF-013 | Routine System | Workout, Routine, and Program Catalog | MF-025, MF-120 | yes | yes | yes | partial | yes | yes |
| CF-014 | Routine System | Workout, Routine, and Program Builder Structure | MF-124 | yes | yes | yes | no_evidence | yes | no_evidence |
| CF-015 | Exercise Library | Exercise Search and Filter Engine | MF-027, MF-028, MF-029, MF-030 | partial | partial | partial | partial | yes | partial |
| CF-016 | Exercise Library | Exercise Preference Curation | MF-031 | no_evidence | no_evidence | no_evidence | no_evidence | yes | no_evidence |
| CF-017 | Exercise Library | Custom Exercise Authoring | MF-032 | yes | yes | yes | no_evidence | no_evidence | yes |
| CF-018 | Exercise Library | Routine Composition Controls | MF-033, MF-034, MF-035 | yes | yes | yes | partial | yes | yes |
| CF-019 | Exercise Library | Exercise Knowledge Surfaces | MF-065, MF-066, MF-067, MF-068, MF-069 | partial | partial | partial | yes | partial | partial |
| CF-020 | Workout Logging | Session Entry and Start Modes | MF-038, MF-039, MF-040, MF-041, MF-042 | partial | partial | partial | yes | partial | partial |
| CF-021 | Workout Logging | Set Logging Interaction Model | MF-043, MF-044, MF-045, MF-046 | yes | partial | yes | yes | partial | yes |
| CF-022 | Workout Logging | Effort and Intensity Capture | MF-047, MF-048, MF-054, MF-056 | no_evidence | partial | no_evidence | no_evidence | partial | partial |
| CF-023 | Workout Logging | Timer Stack | MF-036, MF-049, MF-050, MF-051, MF-052 | yes | yes | partial | partial | yes | partial |
| CF-024 | Workout Logging | Adaptive Defaults and PR Feedback | MF-037, MF-053, MF-055 | partial | partial | partial | yes | yes | partial |
| CF-025 | Workout Logging | Session Safeguards and Controls | MF-057, MF-058, MF-059, MF-064 | partial | partial | partial | partial | partial | partial |
| CF-026 | Workout Logging | Session Completion Outputs and Routine Progress Tracking | MF-060, MF-061, MF-062, MF-063 | partial | partial | partial | partial | partial | partial |
| CF-027 | Analytics | Strength and Recovery Scoring | MF-070, MF-071 | no_evidence | no_evidence | no_evidence | yes | no_evidence | yes |
| CF-028 | Analytics | Muscle Distribution Analytics | MF-072, MF-073 | partial | partial | no_evidence | partial | partial | yes |
| CF-029 | Analytics | Target Radar Analytics | MF-074 | no_evidence | no_evidence | no_evidence | yes | no_evidence | no_evidence |
| CF-030 | Analytics | Weekly KPI Dashboard | MF-075 | yes | yes | yes | yes | yes | yes |
| CF-031 | Analytics | Performance Trends and Rankings | MF-076, MF-077, MF-078 | yes | partial | partial | yes | partial | yes |
| CF-032 | Analytics | History and Report Windows | MF-079, MF-080 | partial | partial | partial | yes | partial | partial |
| CF-033 | Analytics | Body Measurement Tracking | MF-081, MF-082 | yes | partial | yes | partial | partial | no_evidence |
| CF-034 | Analytics | Body Transformation and Nutrition Targets | MF-083, MF-084 | no_evidence | no_evidence | no_evidence | no_evidence | yes | no_evidence |
| CF-035 | Analytics | Achievements and Milestones | MF-085, MF-086 | no_evidence | yes | partial | partial | partial | yes |
| CF-036 | Analytics | Streak and Habit Continuity Metrics | MF-087, MF-127 | partial | yes | no_evidence | partial | partial | partial |
| CF-037 | Analytics | Goal and Target Modeling | MF-126 | yes | yes | partial | yes | yes | yes |
| CF-038 | Routine Marketplace Community | Routine and Program Discovery Marketplace | MF-089 | yes | yes | no_evidence | no_evidence | no_evidence | yes |
| CF-039 | Routine Marketplace Community | Routine Lifecycle Actions and Creator Follow | MF-090, MF-092 | yes | partial | no_evidence | no_evidence | no_evidence | partial |
| CF-040 | Routine Marketplace Community | Completion-Gated Ratings | MF-091 | no_evidence | partial | no_evidence | no_evidence | no_evidence | yes |
| CF-041 | Routine Marketplace Community | Creator Distribution Eligibility, Credibility, Visibility, and Safety Controls | MF-093, MF-094 | partial | partial | partial | no_evidence | no_evidence | yes |
| CF-042 | Account & UX Infrastructure | Creator and User Profile Management | MF-095 | yes | partial | partial | no_evidence | no_evidence | yes |
| CF-043 | Account & UX Infrastructure | Account Lifecycle and Recovery | MF-096, MF-122 | yes | partial | partial | partial | no_evidence | partial |
| CF-044 | Account & UX Infrastructure | Appearance Localization and Units | MF-098, MF-099, MF-100, MF-101 | partial | partial | partial | partial | partial | partial |
| CF-045 | Account & UX Infrastructure | Notification and Reminder Controls | MF-102, MF-121 | partial | partial | yes | yes | partial | partial |
| CF-046 | Account & UX Infrastructure | Support and Product Communications | MF-115, MF-116, MF-117, MF-118 | partial | partial | partial | partial | no_evidence | partial |
| CF-047 | Account & UX Infrastructure | Data Governance Controls | MF-128, MF-129 | partial | partial | partial | no_evidence | no_evidence | no_evidence |
| CF-048 | Platform Features | Live Activity and Lock-screen Runtime | MF-103 | partial | no_evidence | yes | yes | no_evidence | yes |
| CF-049 | Platform Features | Voice Assistant Integrations | MF-104, MF-105 | partial | no_evidence | partial | yes | no_evidence | no_evidence |
| CF-050 | Platform Features | Fitness Ecosystem Integrations | MF-106, MF-107, MF-108, MF-109 | partial | partial | partial | partial | no_evidence | no_evidence |
| CF-051 | Platform Features | AI Assistant Integrations | MF-110, MF-111 | partial | no_evidence | partial | no_evidence | no_evidence | no_evidence |
| CF-052 | Platform Features | Sync Export Import and Cloud | MF-112, MF-113, MF-114, MF-130 | partial | no_evidence | partial | partial | no_evidence | no_evidence |
| CF-053 | Coaching | Personal Coach and Trainer Modes | MF-119 | yes | partial | yes | no_evidence | no_evidence | yes |
