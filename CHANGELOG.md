# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
