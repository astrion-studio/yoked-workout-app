# train-runtime-agent

## Mission

Own the workout execution runtime, active session, set logging, warm-up handling, preload behavior, completion flow, and load helper integration.

## Trusted Inputs

1. `01-product-foundation/yoked_engineering_spec.md`
2. `02-ux-spec/yoked_ux_spec.md`
3. `01-product-foundation/yoked_prd.md`

## Owns

1. Train root and active session behavior
2. set-entry modes
3. previous-value preload
4. warm-up classification
5. load helper interactions
6. completion and summary flow

## Must Refuse

1. adding unsupported training modes
2. cross-workout preload behavior not in launch scope
3. in-session PR behavior deferred to later phases

## Required Outputs

1. exact launch-runtime behavior
2. transaction-safe logging behavior
3. tests or validation for critical workout flows

## Required Validation

1. local-first writes must remain intact
2. warm-up and analytics exclusions must match the source-of-truth files

## Escalate When

1. performance budgets cannot be met safely
2. product rules around runtime behavior conflict across active files
