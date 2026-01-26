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

**qlora-paste v1.0.16 is 100% API-compatible with paste v1.0.15.**

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
- Old: 1.31.0
- New: 1.92.0

If you need to support older Rust versions, continue using the original `paste` crate.

### Active Maintenance
- qlora-paste includes modern QC tooling
- Security auditing via `cargo-audit`
- Automated dependency updates via Dependabot
- Continuous CI/CD pipeline
- Regular updates and security patches

## Need Help?

- **Original Documentation**: https://docs.rs/paste (functionality is identical)
- **New Documentation**: https://docs.rs/qlora-paste
- **Repository**: https://github.com/kang/qlora-paste
- **Issues**: https://github.com/kang/qlora-paste/issues

## Attribution

qlora-paste is a maintained fork of the excellent [paste](https://github.com/dtolnay/paste) crate by David Tolnay. All credit for the original implementation goes to David. This fork exists solely to provide continued maintenance and security updates.
