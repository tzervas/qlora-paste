# Publishing qlora-paste to crates.io

This guide documents the process for publishing new versions of qlora-paste to crates.io.

## Prerequisites

1. **crates.io Account**: You need a crates.io account with ownership rights to the `qlora-paste` crate
2. **API Token**: Generate a token at https://crates.io/settings/tokens
3. **GitHub Secret**: Store the token as `CARGO_REGISTRY_TOKEN` in GitHub repository secrets

## Version Management

We follow [Semantic Versioning](https://semver.org/):

- **Major** (x.0.0): Breaking API changes
- **Minor** (1.x.0): New features, backward compatible
- **Patch** (1.0.x): Bug fixes, backward compatible

## Release Process

### Manual Release

1. **Update Version**
   ```bash
   # Update version in Cargo.toml
   vim Cargo.toml  # Change version = "1.0.16" to new version
   
   # Update version in src/lib.rs html_root_url
   vim src/lib.rs  # Update docs.rs URL
   ```

2. **Update CHANGELOG**
   ```bash
   vim CHANGELOG.md  # Add new version section
   ```

3. **Run Quality Checks**
   ```bash
   cargo fmt --all
   cargo clippy --all-targets --all-features -- -D warnings
   cargo test --all-features
   cargo audit
   cargo deny check
   ```

4. **Commit Changes**
   ```bash
   git add Cargo.toml src/lib.rs CHANGELOG.md
   git commit -m "chore: bump version to X.Y.Z"
   ```

5. **Create Git Tag**
   ```bash
   git tag -a vX.Y.Z -m "Release X.Y.Z"
   git push origin main --tags
   ```

6. **Publish to crates.io**
   ```bash
   cargo publish --token $CARGO_REGISTRY_TOKEN
   ```

### Automated Release via GitHub Actions

The repository includes a publish workflow that automatically publishes when you push a version tag:

```bash
# Just push the tag - GitHub Actions handles the rest
git tag -a v1.0.17 -m "Release 1.0.17"
git push origin v1.0.17
```

The workflow will:
1. Verify the tag version matches Cargo.toml
2. Run all tests
3. Publish to crates.io
4. Create a GitHub release with release notes

## Post-Release

1. **Verify Publication**
   - Check https://crates.io/crates/qlora-paste
   - Verify docs at https://docs.rs/qlora-paste

2. **Announce Release**
   - Update dependent projects
   - Notify users if necessary

3. **Monitor**
   - Watch for issues reported
   - Check download statistics

## Troubleshooting

### Version Already Published
```
error: crate version `X.Y.Z` is already uploaded
```
**Solution**: Bump the version number. You cannot replace published versions.

### Token Authentication Failed
```
error: failed to authenticate to registry
```
**Solution**: Regenerate your API token and update secrets.

### Missing Fields
```
error: missing required field `documentation`
```
**Solution**: Ensure all required metadata is in Cargo.toml.

## Security

- **Never commit API tokens** to the repository
- Store tokens only in GitHub Secrets or local secure storage
- Rotate tokens periodically
- Use scoped tokens with minimal permissions

## Initial Publication (First Time Only)

If the `qlora-paste` crate name isn't claimed yet:

```bash
# Ensure you're logged in
cargo login

# Claim the crate name
cargo publish --allow-dirty
```

After initial publication, follow the standard release process above.
