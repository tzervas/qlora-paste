#!/bin/bash
# Setup script for qlora-paste development environment

set -e

echo "🔧 Setting up qlora-paste development environment..."
echo

# Check if cargo is installed
if ! command -v cargo &> /dev/null; then
    echo "❌ Error: cargo not found. Please install Rust first."
    echo "   Visit: https://rustup.rs/"
    exit 1
fi

echo "✓ Cargo found"

# Install development tools
echo
echo "📦 Installing development tools..."

# cargo-audit for security scanning
if ! command -v cargo-audit &> /dev/null; then
    echo "  → Installing cargo-audit..."
    cargo install cargo-audit --locked
else
    echo "  ✓ cargo-audit already installed"
fi

# cargo-deny for license/advisory checking
if ! command -v cargo-deny &> /dev/null; then
    echo "  → Installing cargo-deny..."
    cargo install cargo-deny --locked
else
    echo "  ✓ cargo-deny already installed"
fi

# cargo-outdated for dependency checking
if ! command -v cargo-outdated &> /dev/null; then
    echo "  → Installing cargo-outdated..."
    cargo install cargo-outdated --locked
else
    echo "  ✓ cargo-outdated already installed"
fi

# Install Git hooks via cargo-husky
echo
echo "🪝 Setting up Git hooks..."
if [ -d .git ]; then
    cargo build
    echo "  ✓ Git hooks installed via cargo-husky"
else
    echo "  ⚠ Not a git repository, skipping hook installation"
fi

# Run initial checks
echo
echo "🧪 Running initial checks..."
echo "  → cargo fmt..."
cargo fmt --all --check || {
    echo "  ⚠ Code formatting issues found, fixing..."
    cargo fmt --all
}

echo "  → cargo clippy..."
cargo clippy --all-targets --all-features -- -D warnings

echo "  → cargo test..."
cargo test --all-features

echo "  → cargo audit..."
cargo audit || echo "  ⚠ Security advisories found - review them carefully"

echo "  → cargo deny check..."
cargo deny check || echo "  ⚠ Dependency issues found - review them carefully"

echo
echo "✅ Development environment setup complete!"
echo
echo "📝 Next steps:"
echo "  1. Review any warnings or advisories above"
echo "  2. Make your changes"
echo "  3. Git hooks will automatically run on commit:"
echo "     - cargo fmt (auto-fixes)"
echo "     - cargo clippy"
echo "     - cargo audit"
echo "     - cargo deny check"
echo
echo "🚀 Happy coding!"
