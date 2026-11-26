# Rust Web

Loaded when the target is a website/web service and the AI chooses Rust.
Instructions to the AI.

## Stack

- **HTTP**: Axum (or Actix Web) for services; `trunk` + `yew`/`leptos` for
  WASM front-ends.
- **Async runtime**: Tokio.
- **Build**: Cargo + `trunk` (WASM) or `cargo build` (server).

## Layout

```
src/
├── main.rs          # server entry or WASM entry
├── routes/          # HTTP handlers
├── state/           # shared state, DB pool
├── models/          # request/response types
└── (web/)           # front-end crate if separate
```

## Web-specific rules

- Validate and sanitise all input; never trust query/body/headers.
- Use parameterised queries for any database access.
- Set security headers (CSP, X-Content-Type-Options, etc.).
- Serve over HTTPS in production; never log secrets or PII.
- Keep secrets in env vars, never in source or WASM bundles.

## Quality gates

```
cargo build
cargo build --release
cargo test
cargo clippy --all-targets -- -D warnings
cargo fmt --check
```

All must pass before reporting completion (see `universal/testing.md`). Plus: a
minimal e2e check of the critical path.

## SEO

Load `seo.md` only if the site is public-facing and indexing is desired.