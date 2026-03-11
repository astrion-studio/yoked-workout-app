# Codex Setup for Yoked

## What to Use the Desktop App For

The desktop app is best for:

1. planning,
2. reviewing specs,
3. asking for repo guidance,
4. reviewing diffs and final explanations.

## What to Use the CLI For

The Codex CLI is best for:

1. repo-root execution,
2. multi-agent task delegation,
3. repeatable ticket implementation loops,
4. clean local execution against one issue at a time.

## First-Time CLI Check

Open Terminal and run:

```bash
cd "/path/to/yoked-workout-app"
codex --version
```

If that command succeeds, the CLI is available on the machine.

If it fails, install or enable the Codex CLI using the current official OpenAI Codex installation flow before continuing.

If the CLI is available, start it from the repo root with:

```bash
codex
```

## Local Codex Files

Codex-local machine configuration lives outside the repo:

- `~/.codex/config.toml`
- `~/.codex/agents/`

Rules:

1. Never commit real local Codex config.
2. Never commit real MCP credentials or tokens.
3. Keep the repo-tracked source files in `docs/codex/`.
4. Copy or sync the canonical agent prompt files into `~/.codex/agents/` when they change.

## Recommended Local Workflow

1. Open the GitHub issue.
2. Open Terminal in the repo root.
3. Start Codex CLI.
4. Ask the parent session to use the appropriate specialist agent.
5. Review the resulting diff.
6. Open a pull request linked to the issue.
7. Merge only after checks and review pass.

Example delegation prompt inside Codex CLI:

```text
Use repo-ops-agent to review and update the GitHub workflow scaffolding for this issue. Stay within AGENTS.md and report any placeholders that still need human input.
```

If you only want planning or review help, the desktop app is enough.
If you want repeatable ticket execution with specialist agents, prefer the CLI path.

## Recommended Profiles

Define these profiles locally:

1. `planning`
2. `implementation`
3. `review`
4. `release`

They should differ in:

1. how strict approvals are,
2. whether mutation is allowed,
3. whether connector access is enabled.

## Connectors and MCP Priority

Recommended order:

1. GitHub connector or MCP first.
2. Supabase staging connector or MCP second.
3. Keep Figma available.
4. Do not grant production database write access during setup.

If a connector is unavailable:

1. continue using the GitHub web UI for project settings,
2. use standard Git workflow for repo operations,
3. use Supabase CLI and migrations later instead of blocking on a connector.

## GitHub Project Automation

Recommended issue routing is label-driven.

GitHub UI path for each project:

1. Open the project.
2. Open the project menu.
3. Open `Workflows`.
4. Create an `Auto-add to project` workflow.
5. Limit it to the `yoked-workout-app` repository.
6. Apply the filter query shown below.
7. Set the default `Status` value for new items.

Roadmap or features project:

- auto-add filter: `repo:astrion-studio/yoked-workout-app is:issue -label:"kind/bug"`
- default status on add: `Backlog`

Bugs project:

- auto-add filter: `repo:astrion-studio/yoked-workout-app is:issue label:"kind/bug"`
- default status on add: `Backlog` or `Needs triage`

Use issue forms to assign:

1. `kind/feature`,
2. `kind/bug`,
3. `kind/epic`,
4. `kind/human-action`.

Do not route by issue title text.
