# Packaging: Windows

Loaded when the target is Windows desktop. Instructions to the AI.

## Options

- **Portable**: ship the `.exe` plus required DLLs in a folder or a self-
  extracting archive. Simplest; no install.
- **Installer**: MSI (WiX) or Inno Setup / NSIS for a Start-menu entry and
  uninstaller.

## Build

- Build a release binary for the target (e.g. `cargo build --release` with the
  `x86_64-pc-windows-msvc` target, or the language's Windows release build).
- Bundle the Visual C++ runtime if required (or statically link where the
  toolchain allows).

## Rules

- Code-sign the executable if the user has a certificate; otherwise warn that
  Windows SmartScreen will flag unsigned binaries.
- Store config/state/logs under `%APPDATA%` / `%LOCALAPPDATA%`.
- Use Windows-native file dialogs where the GUI toolkit supports them.

## Release

- Provide the portable archive and/or installer plus a SHA256 checksum.
- Publish to GitHub Releases with notes. Do not publish without user approval.

## Testing

- Run on a clean Windows VM; exercise the main workflow.
- Confirm no missing DLLs (use a dependency walker if needed).