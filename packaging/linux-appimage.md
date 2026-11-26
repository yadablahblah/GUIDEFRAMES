# Packaging: Linux (AppImage)

Loaded when the target is Linux desktop and AppImage distribution is chosen.
Instructions to the AI.

## AppImage basics

An AppImage bundles the binary plus its runtime dependencies into a single
executable file. The user downloads one file and runs it — no install step.

## Build approach

- Build a release binary: `cargo build --release` (Rust) or the language's
  release build.
- Use `linuxdeploy` + `linuxdeploy-plugin-gtk` (for GTK apps) to assemble the
  AppDir and produce the `.AppImage`.
- Bundle the GTK runtime and any non-standard shared libraries.
- Test the AppImage on a clean/minimal distro (or container) to confirm no
  missing dependencies.

## AppDir layout (GTK example)

```
AppDir/
├── AppRun                 # launcher script
├── usr/bin/<app>          # the binary
├── usr/lib/               # bundled libs
├── usr/share/applications/<app>.desktop
├── usr/share/icons/...
└── <app>.png              # icon
```

## Release artefacts

- Produce the `.AppImage` and a `SHA256` checksum file.
- Write release notes (what changed, known issues).
- Publish to GitHub Releases with the AppImage + checksum + notes.

## Approval

Do not publish a release or expose it publicly without explicit user approval.
A successful local build does not authorise deployment.

## Testing the artefact

- Run the AppImage in a clean environment (container/VM) and exercise the main
  workflow.
- Confirm config/state/log paths resolve under XDG
  (`$XDG_CONFIG_HOME`, `$XDG_DATA_HOME`).

## Other Linux formats

- Flatpak / Snap are alternatives if the user prefers sandboxed distribution;
  note the trade-off (sandboxing vs. simplicity) and let the user choose.