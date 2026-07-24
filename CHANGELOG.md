# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.22] - 2026-07-24

### Fixed
- README build-status badge pointed at a non-existent `ci.yml` workflow ("workflow
  not found" on the crates.io/README badge); now targets the real `upstream-ci.yml`.
- `MIGRATION.md` MSRV section was inverted — it claimed a 1.92.0 MSRV and advised
  staying on upstream `paste` for older Rust. The fork restored **MSRV 1.31.0**
  (CI-validated 1.31→1.96); corrected so migrating keeps old-toolchain support.

### Changed
- CI: capped MSRV/test matrix parallelism (`max-parallel: 2`) to stop OOM toolchain
  kills on the self-hosted fleet.
- CI: bumped GitHub Actions — `actions/checkout` v4→v7, `actions/upload-artifact`
  v4→v7, `astral-sh/setup-uv` v5→v7, `github/codeql-action` v3→v4.

## [1.0.21] - 2026-07-24

### Changed

- Version bump to publish the MSRV-1.31 maintenance work to crates.io. The prior
  `1.0.20` was already published (with `rust-version = 1.92`) and then yanked;
  crates.io versions are immutable, so the corrected content ships as `1.0.21`.
  No API or behavior change from 1.0.20's intended content — same drop-in `paste!`.

## [1.0.20] - 2026-07-23

### Fixed

- Restored declared MSRV to the oldest toolchain **verified** in this environment
  (`rust-version = "1.31"`). Upstream `paste` 1.0.15 claimed 1.31; the prior
  fork bump to 1.92 was unnecessarily high for a drop-in maintenance fork.
- Confirmed license match to upstream: SPDX `MIT OR Apache-2.0`,
  `LICENSE-MIT` and `LICENSE-APACHE` byte-identical to dtolnay/paste master.
- Clippy pedantic green on current stable: `let...else` in `build.rs`; allow
  `missing_panics_doc` on test-suite harness; allow
  `uninlined_format_args` / `manual_let_else` on lib (style-only vs 1.0.15 code).
- Refreshed trybuild UI expectation `tests/ui/case-warning.stderr` for current
  nightly diagnostic formatting.

### Documentation

- Clarified that attribute string-literal concatenation applies beyond
  `#[doc]` (e.g. `#[cfg(feature = ...)]`), matching upstream behavior from
  [dtolnay/paste#57](https://github.com/dtolnay/paste/pull/57) and the docs
  wording proposed in open/archived
  [dtolnay/paste#105](https://github.com/dtolnay/paste/pull/105).
- README: correct provenance badges (`tzervas/qlora-paste`), maintenance
  notice for RUSTSEC-2024-0436, and dual-license/attribution statement.
- CONTRIBUTING: fix clone URL.

### Tests

- Added `test_attr_string_literal_concat_non_doc` to guard non-`doc`
  attribute string pasting (#57 / #105 docs surface).

### CI

- Added `.github/workflows/upstream-ci.yml`: upstream paste CI matrix adapted
  only for `runs-on: [self-hosted, linux, x64, podman]` (tzervas/gha-runner-ctl
  fleet). Coordinator registers a runner for execution.
- Fork `ci.yml` matrix MSRV entry updated 1.92.0 → 1.85.0.

### Upstream triage (not applied — API/behavior change or out of scope)

Open issues/PRs on archived dtolnay/paste at archival; skipped to keep drop-in
API identical to 1.0.15:

| Ref | Title | Why skipped |
|-----|-------|-------------|
| #104 | Camel keep beginning and doubled underscores | Behavior change for `:camel` (breaking) |
| #84 | add lowerCamel | New public modifier (API surface) |
| #61 | lower casing ACMECorp + inflector | Behavior change + **new dependency** |
| #101 | Add kebab case | New public modifier |
| #95 | f32/f64 literal pasting | Enhancement; changes error surface |
| #74 | Paste sometimes produces keywords | Fix would be breaking |
| #73 / #72 | `:camel` edge cases / naming | Behavior or docs-only ambiguity; no non-breaking fix applied |
| #99 | `#[doc]` + macro-produced literal | Feature request; not in 1.0.15 |
| #98 | snake preserving `/` | Feature request |
| #58 | doc alias example | Docs-only example; covered by #105 wording |


## [1.0.19] - 2026-01-26

### Fixed

- Fixed crates.io publish by removing version constraint from local test-suite dev-dependency
- Cleaned up duplicate workspace entries in Cargo.toml

## [1.0.18] - 2026-01-26

### Changed

- Updated GitHub Actions to latest versions:
  - `actions/checkout` v4 → v6
  - `actions/cache` v4 → v5
  - `actions/upload-artifact` v4 → v6

## [1.0.17] - 2026-01-26

### Fixed

- Updated CI workflows to use proper GitHub Actions (`rustsec/audit-check@v2`, `EmbarkStudios/cargo-deny-action@v2`)
- Removed scheduled cron runs that were using stale workflow configurations
- Cleaned up `deny.toml` unused license allowances
- Improved precommit hooks to handle warnings gracefully

### Changed

- Simplified CI pipeline with dedicated actions instead of manual tool installation

## [1.0.16] - 2026-01-25

### Changed

- **Forked from [paste](https://github.com/dtolnay/paste) v1.0.15** - This is now an actively maintained fork
- Updated MSRV from 1.31 to 1.92
- Renamed package from `paste` to `qlora-paste` for crates.io publication
- Updated all documentation, imports, and examples to use `qlora_paste::`
- Removed funding metadata from package configuration

### Added

- **Security & Quality Tooling**:
  - `cargo-husky` for automated precommit hooks
  - `cargo fmt` auto-formatting before commits
  - `cargo clippy` linting with warnings as errors
  - `cargo audit` for security vulnerability scanning
  - `cargo deny` for license and advisory compliance
- **CI/CD Enhancements**:
  - Security scanning integrated into CI pipeline
  - Automated crates.io publishing workflow
  - Dependabot/RenovateBot for dependency updates
- **Documentation**:
  - CHANGELOG.md for tracking maintenance changes
  - Enhanced README with maintenance status and MSRV badges
  - Clear attribution to original author (David Tolnay)
- **Maintenance**:
  - Updated all dependencies to latest compatible versions
  - Self-contained CI workflows (removed external dtolnay workflows)

### Maintenance Notes

This fork maintains full API compatibility with the original `paste` crate. All credit for the original implementation goes to David Tolnay. This fork exists to provide continued maintenance, security updates, and modern development tooling.

---

## Historical Changes (from original paste crate)

For changes prior to the fork, see the original repository at https://github.com/dtolnay/paste

The original paste crate reached v1.0.15 before being marked as unmaintained.
