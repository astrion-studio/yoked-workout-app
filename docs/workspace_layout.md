# Implementation Workspace Layout (TKT-OPS-001)

This document records the additive implementation scaffold created for `TKT-OPS-001`.

## Scope

- Preserves all existing numbered top-level directories.
- Adds launch-phase implementation scaffolding only; no product feature behavior is implemented.
- Mirrors the repository module structure in `01-product-foundation/yoked_engineering_spec.md` §2.1–§2.3.

## Added Scaffold Roots

- `App/`
- `Features/`
- `DataModels/`
- `Networking/`
- `Persistence/`
- `Services/`
- `AI/`
- `Analytics/`
- `Notifications/`
- `SharedUI/`
- `SharedLogic/`
- `Resources/`
- `Tests/`
- `Scripts/`
- `backend/`

## Placeholder Targets and Backend

- iOS app entry placeholders:
  - `App/iOS/YokedApp.swift`
  - `App/iOS/AppDelegate.swift`
  - `App/iOS/SceneDelegate.swift`
- Test target placeholders:
  - `Tests/Unit/YokedTestsPlaceholder.swift`
  - `Tests/UITests/YokedUITestsPlaceholder.swift`
- Migration placeholders:
  - `Persistence/Migrations/0001_initial_scaffold.sql`
  - `backend/supabase/migrations/0001_initial_schema_placeholder.sql`

## Notes

- `App/Widgets/LiveActivity/` and `App/Widgets/LockScreen/` are scaffolded only; launch scope remains iPhone-only per active source-of-truth files.
- Backend scaffold is migration-first and does not include credentials, deployed infrastructure, or runtime secrets.
