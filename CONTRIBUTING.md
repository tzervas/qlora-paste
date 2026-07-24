# Contributing to qlora-paste

Thank you for your interest in contributing to qlora-paste!

## Development Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/tzervas/qlora-paste.git
   cd qlora-paste
   ```

2. **Run the setup script**
   ```bash
   ./scripts/setup-dev.sh
   ```
   
   This will install all necessary development tools and Git hooks.

## Development Workflow

### Making Changes

1. **Create a branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes**
   - Edit source files in `src/`
   - Add tests if necessary
   - Update documentation

3. **Test your changes**
   ```bash
   cargo test --all-features
   ```

4. **Format and lint**
   ```bash
   cargo fmt --all
   cargo clippy --all-targets --all-features -- -D warnings
   ```

5. **Security checks**
   ```bash
   cargo audit
   cargo deny check
   ```

### Pre-commit Hooks

Git hooks via `cargo-husky` automatically run on commit:
- `cargo fmt` - Auto-formats code
- `cargo clippy` - Lints code
- `cargo audit` - Checks for security vulnerabilities
- `cargo deny` - Validates licenses and advisories

If any check fails, the commit is blocked.

## Code Guidelines

### Rust Style

- Follow the [Rust API Guidelines](https://rust-lang.github.io/api-guidelines/)
- Use `cargo fmt` for formatting (enforced by CI)
- Address all `cargo clippy` warnings
- Write documentation for public APIs

### Testing

- Add tests for new features
- Ensure existing tests pass
- Test procedural macros with both positive and negative cases
- Include doc tests for examples

### Documentation

- Update README.md if user-facing changes
- Update CHANGELOG.md following [Keep a Changelog](https://keepachangelog.com/)
- Add doc comments for public items
- Include examples in doc comments

## Project Structure

```
qlora-paste/
├── src/
│   ├── lib.rs          # Main macro implementation
│   ├── attr.rs         # Attribute parsing
│   ├── segment.rs      # Token pasting logic
│   └── error.rs        # Error handling
├── tests/
│   ├── test_*.rs       # Integration tests
│   └── ui/             # Compile-fail tests
├── .cargo-husky/       # Git hooks
├── .github/
│   └── workflows/      # CI/CD pipelines
├── scripts/            # Development scripts
└── docs/               # Additional documentation
```

## CI/CD Pipeline

All pull requests must pass:

1. **Format Check** - `cargo fmt --check`
2. **Linting** - `cargo clippy`
3. **Tests** - `cargo test --all-features`
4. **Security Audit** - `cargo audit`
5. **License Check** - `cargo deny check`
6. **Documentation** - `cargo doc`
7. **MSRV Check** - Rust 1.92.0+

## Submitting Changes

1. **Ensure all tests pass**
   ```bash
   cargo test --all-features
   ```

2. **Commit your changes**
   ```bash
   git commit -am "feat: add new feature"
   ```
   
   Use [Conventional Commits](https://www.conventionalcommits.org/):
   - `feat:` - New feature
   - `fix:` - Bug fix
   - `docs:` - Documentation changes
   - `test:` - Test additions/changes
   - `refactor:` - Code refactoring
   - `chore:` - Maintenance tasks

3. **Push to your fork**
   ```bash
   git push origin feature/your-feature-name
   ```

4. **Create a Pull Request**
   - Describe your changes
   - Reference any related issues
   - Ensure CI passes

## Security

- Report security vulnerabilities privately to the maintainer
- Do not open public issues for security bugs
- Allow time for patches before public disclosure

## License

By contributing, you agree that your contributions will be licensed under the same terms as the project (MIT OR Apache-2.0).

## Questions?

- Open an issue for bugs or feature requests
- Start a discussion for questions or ideas
- Check existing issues/PRs before creating new ones

## Code of Conduct

Be respectful, inclusive, and constructive. We're all here to build better software together.
