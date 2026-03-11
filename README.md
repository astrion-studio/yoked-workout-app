# Yoked

Yoked is a iPhone workout and logging app

## Authoritative Files

The launch implementation must follow these four files:

1. `01-product-foundation/source_of_truth_manifest.md`
2. `01-product-foundation/yoked_prd.md`
3. `01-product-foundation/yoked_engineering_spec.md`
4. `02-ux-spec/yoked_ux_spec.md`

Read the manifest first.

## Current Repository Layout

- `00-archive/`: historical, non-authoritative material
- `01-product-foundation/`: active product and engineering source-of-truth files
- `02-ux-spec/`: active launch UX source-of-truth file
- `03-feature_inventory/`: reference-only inventory material
- `04-analysis/`: background analysis and competitive research
- `05-assets/`: branding and screenshot assets
- `06-tools/`: local tools and helper scripts
- `07-future/`: non-launch placeholders or future planning material
- `.github/`: GitHub issue, PR, label, and workflow scaffolding
- `docs/codex/`: Codex setup docs, config example, and canonical agent prompt source files

## How Work Should Be Tracked

Use GitHub-native workflow:

1. create or select a GitHub issue,
2. implement against that issue,
3. open a pull request linked to the issue,
4. include exact source-of-truth references,
5. include test evidence,
6. merge only after review and required checks pass.

## Codex Setup

Codex setup instructions live in:

- `AGENTS.md`
- `CONTRIBUTING.md`
- `docs/codex/setup.md`
- `docs/codex/config.example.toml`
- `docs/codex/agents/`
