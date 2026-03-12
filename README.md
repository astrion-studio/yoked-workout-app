# Yoked

Yoked is a launch-scope iPhone workout app defined by a spec-first repository.

This repo currently contains:

1. active product, engineering, and UX source-of-truth files,
2. analysis and reference material,
3. tooling and launch assets,
4. GitHub and Codex operating-system scaffolding for the implementation phase.

## Upstream Product Truth

The product, engineering, and launch UX truth for this repository lives in these four files:

1. `01-product-foundation/source_of_truth_manifest.md`
2. `01-product-foundation/yoked_prd.md`
3. `01-product-foundation/yoked_engineering_spec.md`
4. `02-ux-spec/yoked_ux_spec.md`

Read the manifest first.

Rules:

1. These four files govern product behavior, launch-versus-deferred scope, implementation mechanics, and launch UX.
2. Archive, reference-only, and analysis files do not override these four files.
3. If product truth changes, downstream operational docs must be updated from these four files.

## Operational Docs

The repository may contain planning, roadmap, traceability, audit, issue-manifest, or other operational docs under `docs/`.

Rules:

1. Operational docs are downstream work products, not upstream product truth.
2. Operational docs may be used for issue creation, roadmap execution, tracking, and coverage validation.
3. Operational docs never override the four upstream source-of-truth files.
4. If an operational doc conflicts with upstream product truth, the operational doc must be updated.

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
- `docs/`: operational docs, execution docs, and repo-specific supporting docs

## How Work Should Be Tracked

Use GitHub-native workflow:

1. create or select a GitHub issue,
2. if an operational doc exists for roadmap or issue creation, use it as the operational issue-definition source,
3. implement against that issue,
4. open a pull request linked to the issue,
5. include exact source-of-truth references,
6. include test evidence,
7. merge only after review and required checks pass.

## Codex Setup

Codex setup instructions live in:

- `AGENTS.md`
- `CONTRIBUTING.md`
- `docs/codex/setup.md`
- `docs/codex/config.example.toml`
- `docs/codex/agents/`

## Implementation Scaffold Status

The additive implementation scaffold for app, backend, and workspace structure is now established for `TKT-OPS-001`.

See `docs/workspace_layout.md` for the documented workspace layout and placeholder targets.
