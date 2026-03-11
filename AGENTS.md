# Yoked Repository Agent Instructions

## Purpose

This file defines the repository-level operating rules for coding agents working in this repo.
It is intentionally high level. Product behavior, implementation mechanics, and launch UX live in the active source-of-truth files listed below.

## Active Source of Truth

Agents must treat these four files as the only authoritative launch inputs:

1. `01-product-foundation/source_of_truth_manifest.md`
2. `01-product-foundation/yoked_prd.md`
3. `01-product-foundation/yoked_engineering_spec.md`
4. `02-ux-spec/yoked_ux_spec.md`

Rules:

1. Use the manifest first.
2. Do not infer launch behavior from archive or reference-only files.
3. Do not introduce P1 or P2 scope into launch work.
4. If product behavior, monetization, or launch-versus-deferred scope is unclear, resolve it through the active source-of-truth files before changing code.

## Launch Scope Discipline

Agents must preserve all of the following:

1. iPhone-only launch scope.
2. Exactly five root tabs: `Home`, `Train`, `My Workouts`, `Explore`, `You`.
3. Launch-only monetization, ads, onboarding, Train, marketplace, and analytics behavior as documented in the active files.
4. No launch Apple Watch, Live Activity, Strava, Fitbit, follow, favorites, social feed, or comments surfaces.
5. No launch exercise media.

## Workflow Rules

All implementation work follows an issue-first and PR-first workflow.

Required process:

1. Do not start feature work without a linked GitHub issue.
2. Every implementation PR must reference the issue it closes or advances.
3. Every implementation PR must cite the exact source-of-truth files used.
4. Every implementation PR must include test evidence or explain why tests were not run.
5. Every implementation PR must call out human follow-up when credentials, portal settings, billing configuration, or connector setup is required.

## Repository Change Rules

1. Setup work is additive unless a linked issue explicitly authorizes restructuring.
2. Do not move the numbered top-level directories during setup.
3. Do not commit secrets, tokens, local MCP credentials, or personal machine paths.
4. Keep local Codex machine config out of Git. Only commit docs and example config.
5. Use staging before production for all external systems.

## Testing and Validation Rules

Agents must not claim completion without validation appropriate to the change.

Minimum expectation:

1. GitHub workflow or template changes: validate file syntax and document the expected routing behavior.
2. Documentation-only changes: validate file references and workflow accuracy.
3. Code changes later: run the smallest meaningful tests and report exact results.

## Human-Gated Tasks

Agents must escalate instead of guessing when the work requires:

1. GitHub repo settings, branch protection, or project workflow clicks.
2. App Store Connect, Apple Developer, or billing configuration.
3. OAuth provider setup.
4. Supabase project creation, credentials, or production access.
5. AdMob, APNs, or HealthKit capability approval.
6. Replacing placeholders such as GitHub usernames, team slugs, repo URLs, or environment-specific IDs.

## Escalation Rule

Stop and escalate when:

1. the active source-of-truth files conflict materially,
2. a change would broaden launch scope,
3. a production write credential is required,
4. a destructive Git operation would be needed,
5. a placeholder cannot be safely resolved from local repo context.
