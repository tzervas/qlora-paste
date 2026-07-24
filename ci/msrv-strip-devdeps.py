#!/usr/bin/env python3
"""Remove [dev-dependencies] / [build-dependencies] tables from Cargo.toml so an
old-toolchain MSRV `cargo build --lib` does not have to RESOLVE dev-dep manifests
(e.g. cargo-husky) that only modern cargo can parse. A library's MSRV is about what
consumers compile; they never receive dev-deps. Line-based and robust: drops each
target table from its header until the next `[table]` header or EOF."""
import sys

DROP = ("[dev-dependencies]", "[build-dependencies]",
        "[dev-dependencies.", "[build-dependencies.")

def main(path="Cargo.toml"):
    out, skip = [], False
    for line in open(path, encoding="utf-8"):
        stripped = line.strip()
        if stripped.startswith("["):                 # any table header
            skip = any(stripped == h or stripped.startswith(h) for h in DROP)
        if not skip:
            out.append(line)
    open(path, "w", encoding="utf-8").write("".join(out))
    print("stripped dev/build-dependencies for MSRV lib check")

if __name__ == "__main__":
    main(*sys.argv[1:])
