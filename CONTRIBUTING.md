# Contributing to Yoked

## Working Agreement

All work in this repo must follow the active source-of-truth files and the GitHub issue or pull request workflow.

## Required Workflow

1. Start with a GitHub issue.
2. Link the issue in the pull request.
3. Cite the exact source-of-truth files used.
4. Keep launch scope strict.
5. Add test evidence or explicitly state why no tests ran.
6. Call out any human-gated follow-up.

## Branch Naming

Use descriptive branch names with the `codex/` prefix for new implementation branches.

Examples:

- `codex/repo-governance-scaffold`
- `codex/train-runtime-foundation`
- `codex/backend-runtime-config`

## Labels

Every issue should have:

1. one `kind/*` label,
2. one `priority/*` label where applicable,
3. one or more `area/*` labels.

Recommended routing:

1. `kind/bug` issues go to the bugs project,
2. non-bug issues go to the roadmap or features project.

## Pull Request Checklist

Every PR should answer all of the following:

1. Which issue does this PR address?
2. Which source-of-truth files govern this change?
3. What exact behavior changed?
4. What tests or validation were run?
5. What known risks remain?
6. What human action is still required, if any?

## Review Expectations

Reviewers should check:

1. launch-scope discipline,
2. source-of-truth compliance,
3. unintended feature expansion,
4. test evidence,
5. placeholder replacement needs,
6. secrets safety.

## Merge Rules

1. No direct pushes to `main`.
2. Prefer squash merges.
3. Do not merge unresolved conversations.
4. Do not merge without required checks.

## Release and Hotfix Rules

During later implementation phases:

1. production fixes must still use linked issues and PRs,
2. hotfix branches must remain narrow in scope,
3. post-merge follow-up tickets should be created for any deferred cleanup,
4. no hotfix may introduce P1 or P2 behavior into launch.
