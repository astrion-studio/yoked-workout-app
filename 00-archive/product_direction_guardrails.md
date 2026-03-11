# Yoked Product Direction Guardrails

## 1. Product Identity Constraints

1. Product category: strength training and workout logging platform.
2. Product pillars:
- elite workout logging,
- AI-generated routines/programs,
- strength analytics,
- routine/program discovery marketplace,
- creator profiles,
- Apple ecosystem integrations.
3. Product is not a generic social platform.

## 2. Final Launch Navigation Model (Locked)

1. Launch uses exactly five primary tabs:
- `Home`,
- `Train`,
- `My Workouts`,
- `Explore`,
- `You`.
2. Explicitly excluded root tabs:
- `Library`,
- `Progress`,
- `Community`,
- `Feed`.
3. Home restrictions:
- no resume workout controls,
- no quick start workout controls,
- no start workout buttons,
- no deep discovery feed.
4. Train exclusivity:
- all active workout execution routes remain in Train.
5. You ownership:
- history, PRs, analytics, and settings live in You.

## 3. Marketplace Model Constraints

1. Community model centers on:
- programs,
- routines/workouts,
- creators.
2. Launch user actions include:
- save,
- copy,
- start,
- complete,
- rate,
- follow creators,
- discover.
3. Comments are explicitly excluded at launch.
4. Explore is a marketplace, not a social feed.
5. Explore launch rendering contract:
- horizontal category rail or segmented categories,
- vertical ranked feed of metadata-rich cards,
- no TikTok-style fullscreen default.

## 4. Publishing and Distribution-Gated Discovery

1. Publishing objects:
- workout,
- routine,
- program.
2. Publishing policy:
- creators must meet credibility thresholds before publish is enabled,
- threshold examples include minimum completed workouts, minimum training days, and minimum routine completions.
3. Distribution policy:
- visibility in ranked Explore lanes is credibility-gated after publish eligibility is satisfied.
4. Creator visibility tiers:
- `Tier 0`: private drafts,
- `Tier 1`: published with low distribution,
- `Tier 2`: eligible for ranked Explore distribution.
5. Tier and ranking inputs:
- profile completeness,
- routine/program completeness,
- copies,
- starts,
- completions,
- completion rate,
- completion-gated ratings,
- PR outcomes,
- spam/report signals.
6. Likes are not primary ranking signals.

## 5. Rating Integrity Rules

1. Single workout rating:
- allowed only after completion evidence exists.
2. Routine rating:
- allowed only after at least 2 completed sessions.
3. Program rating:
- allowed only after 25-40 percent completion.
4. Commenting:
- no rating comments,
- no routine/program comment threads,
- no comment moderation surfaces at launch.

## 6. Launch Scope Includes

1. Strength workout logging system.
2. Routine and program builders.
3. Routine/program publishing and marketplace discovery.
4. Completion tracking and completion-gated ratings.
5. Creator profiles and creator follow.
6. Strength analytics and history surfaces in You.
7. AI programming and adaptive coaching.
8. Apple ecosystem integrations.

## 7. Launch Scope Excludes

1. Generic social feeds.
2. Comments.
3. Posts.
4. Direct messaging.
5. Groups/forums.
6. Video feed mechanics.
7. Influencer content timelines.
8. Influencer creator subscription monetization.
9. Nutrition tracking.
10. Mobility training modules.
11. Rehab program modules.

## 8. Future Creator Monetization (Roadmap, Not Launch)

1. Creator monetization is not part of launch scope.
2. Early roadmap option:
- one-time purchase of creator programs,
- one-time purchase of creator routine packs.
3. Creator subscription monetization models are not included in the early roadmap.

## 9. Hard Release Gates

1. Release is blocked if app contains any root tab outside `Home`, `Train`, `My Workouts`, `Explore`, `You`.
2. Release is blocked if Home contains direct workout execution controls.
3. Release is blocked if Explore defaults to fullscreen immersive discovery feed.
4. Release is blocked if comment submission or comment display is reachable in launch routes.
5. Release is blocked if publish eligibility thresholds are not enforced for workout/routine/program publishing.
6. Release is blocked if ranked Explore distribution does not enforce credibility-tier gating.
7. Release is blocked if You does not own history/analytics/settings surfaces.

## 10. Change Control Rules

1. Any change introducing excluded launch features requires explicit direction override approval.
2. Any change elevating vanity engagement signals over completion trust signals is rejected.
3. Any change that reintroduces generic social feed architecture is rejected.
4. Any change that converts creator surfaces into influencer-content timelines is rejected.
