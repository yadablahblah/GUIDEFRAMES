# Packaging: macOS

Loaded when the target is macOS desktop. Instructions to the AI.

## Options

- **App bundle** (`.app`): the standard distribution unit.
- **DMG**: drag-to-Applications disk image for distribution.
- **Homebrew cask**: for users who prefer package-manager installs.

## Build

- Build a release binary for the target architecture (arm64 for Apple Silicon,
  x86_64 for Intel; universal2 for both).
- Assemble the `.app` bundle with `Info.plist`, icon, and bundled frameworks.
- For GTK apps, bundle the GTK runtime via `gtk-mac-bundler` or `macdeploy`.

## Rules

- Code-sign with a Developer ID and notarize via `xcrun notarytool` for
  Gatekeeper acceptance; otherwise warn the user about unsigned-app friction.
- Store config/state/logs under `~/Library/Application Support` /
  `~/Library/Logs`.
- Use native file dialogs (`NSOpenPanel`) where the toolkit supports them.

## Release

- Provide the `.dmg` (and/or `.app` zip) plus a SHA256 checksum.
- Publish to GitHub Releases with notes. Do not publish without user approval.

## Testing

- Run on a clean macOS VM; exercise the main workflow.
- Confirm the app launches on both architectures if a universal build is shipped.