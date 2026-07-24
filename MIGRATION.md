# Migration Guide: paste → qlora-paste

This guide helps you migrate from the unmaintained `paste` crate to `qlora-paste`.

## Quick Migration

### 1. Update Cargo.toml

Replace:
```toml
[dependencies]
paste = "1.0"
```

With:
```toml
[dependencies]
qlora-paste = "1.0"
```

### 2. Update Import Statements

Replace all occurrences of:
```rust
use paste::paste;
```

With:
```rust
use qlora_paste::paste;
```

### 3. Automated Migration

You can use `sed` to automatically update your codebase:

```bash
# Update Cargo.toml
sed -i 's/paste = "1\.0/qlora-paste = "1.0/g' Cargo.toml

# Update Rust source files
find src -name "*.rs" -exec sed -i 's/use paste::/use qlora_paste::/g' {} +
```

## API Compatibility

**qlora-paste is 100% API-compatible with `paste` 1.0.15** (the upstream release it was forked from). The public macro API (`paste!`) and behavior are unchanged; only the crate/module name differs.

All macros, features, and functionality work identically:
- `paste!` macro
- Case conversion (`lower`, `upper`, `snake`, `camel`)
- Documentation string concatenation
- Environment variable expansion with `env!()`

## What's Different?

### Package Name
- Crate name: `paste` → `qlora-paste`
- Module path: `paste::` → `qlora_paste::`

### MSRV (Minimum Supported Rust Version)
- **1.31.0** — the original upstream floor, **restored and CI-validated** across the
  full range `1.31.0 → 1.96.0` (see the `upstream-ci.yml` build matrix).

Unlike a period where the fork's MSRV had drifted up to 1.92, qlora-paste now builds on
Rust as old as **1.31.0**, so migrating to it does **not** cost you old-toolchain support —
you get maintenance and security updates while keeping the original MSRV.

### Active Maintenance
- qlora-paste includes modern QC tooling
- Security auditing via `cargo-audit`
- Automated dependency updates via Dependabot
- Continuous CI/CD pipeline
- Regular updates and security patches

## Need Help?

- **Original Documentation**: https://docs.rs/paste (functionality is identical)
- **New Documentation**: https://docs.rs/qlora-paste
- **Repository**: https://github.com/tzervas/qlora-paste
- **Issues**: https://github.com/tzervas/qlora-paste/issues

## Attribution

qlora-paste is a maintained fork of the excellent [paste](https://github.com/dtolnay/paste) crate by David Tolnay. All credit for the original implementation goes to David. This fork exists solely to provide continued maintenance and security updates.
