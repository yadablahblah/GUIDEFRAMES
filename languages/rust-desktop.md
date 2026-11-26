# Rust Desktop

Loaded when the target is a desktop program and the AI chooses Rust.
Instructions to the AI.

## Stack

- **Language**: Rust (edition 2021+).
- **GUI**: GTK4 via the `gtk4` crate (Linux-first; cross-platform with caveats).
  Alternative: `egui`/`slint` for pure-Rust UIs — choose GTK4 when native file
  dialogs, `ListView`, and AppImage bundling matter.
- **Build**: Cargo.
- **Async**: only if needed; prefer blocking calls for file IO in a desktop app.

## Project layout

```
src/
├── main.rs          # binary entry
├── app.rs           # application wiring
├── engine/          # business logic, no UI deps
├── fs/              # filesystem abstraction (trait + real + test impls)
└── ui/              # GTK widgets, signals, CSS
```

Keep the engine free of UI dependencies so it is testable without a display.

## Quality gates (run all before reporting done)

```
cargo build
cargo build --release
cargo test
cargo clippy --all-targets -- -D warnings
cargo fmt --check
```

All must pass before reporting completion. `clippy -D warnings` is mandatory —
fix all warnings, do not suppress without a documented reason. `fmt --check`
must pass; run `cargo fmt` to fix. A failing test blocks completion (see
`universal/testing.md`).

## GTK4 specifics

- Use `SignalListItemFactory` + `StringList` models for `ListView` rows.
- A `StringList` that is **not** the `ListView`'s model does not trigger a
  rebind when spliced. To refresh rows after updating a side model, re-splice
  the list's actual model (or use a `MultiSelection` over it).
- Splice the side/status model **before** the main model so the bind callback
  reads current values.
- File dialogs: `FileChooserNative` with `set_transient_for(Some(&parent))`.
- Dark-mode-compatible CSS: set explicit colors on custom widgets; do not rely
  on theme defaults for status indicators.
- Drag on a window: `begin_move_drag` is not on `ApplicationWindow`; use the
  GDK FFI `gdk_toplevel_begin_move(...)` to libgdk-4, and attach the gesture to
  a specific child (e.g. the title label) so it does not block button clicks.

## Filesystem abstraction

Define a `FileSystem` trait with two implementations:
- `RealFs` — delegates to `std::fs`.
- `TestFs` — in-memory mock with fault injection (permission, disk full,
  rename failure, changed-since-preview, symlink substitution).

This lets the engine be tested deterministically without touching disk.

## Atomic writes

Write to a temp file (exclusive creation, e.g. `.{name}-partial-{pid}-{counter}`
via `OpenOptions::create_new`), then `rename` to the destination. On any error
or cancellation, remove the temp file. The current file always completes; check
cancellation only between files.

## Permissions

App config/state/log directories `0700`, files `0600` (Unix). Use
`std::os::unix::fs::PermissionsExt`.

## Packaging

See `packaging/linux-appimage.md` (or windows/macos as needed).

## Starter CI workflow (`.github/workflows/ci.yml`)

Commit this during the initial scaffold so tests run from the first commit:

```yaml
name: CI
on: [push, pull_request]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: dtolnay/rust-toolchain@stable
        with: { components: clippy, rustfmt }
      - run: cargo fmt --check
      - run: cargo clippy --all-targets -- -D warnings
      - run: cargo test
      - run: cargo build --release
```

For GTK apps, add `sudo apt install libgtk-4-dev` and run tests under `xvfb-run`
(e.g. `xvfb-run cargo test`). Other language docs should provide an equivalent
starter workflow for their toolchain.