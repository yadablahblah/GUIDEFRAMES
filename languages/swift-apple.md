# Swift (Apple platforms)

Loaded when the target is macOS and/or iOS and the AI chooses Swift.
Instructions to the AI.

## Stack

- **Language**: Swift 5.9+.
- **UI**: SwiftUI (preferred) or UIKit/AppKit.
- **Build**: Xcode / `swift build` (SwiftPM).
- **Testing**: XCTest (or Swift Testing).

## Layout

```
Sources/<App>/
├── App.swift
├── Features/
├── Core/
└── ...
Tests/<App>Tests/
Package.swift
```

## Rules

- Separate UI from logic; keep core testable without a simulator.
- Validate input at boundaries; use `guard`/`if let`, no force-unwrap on
  external data.
- Use `async`/`await` for IO; no blocking on the main actor.
- macOS: config under `~/Library/Application Support`.
- iOS: use Keychain for secrets, never `UserDefaults` for sensitive data.

## Quality gates

```
swift build
swift test
```

All must pass before reporting completion (see `universal/testing.md`).
Simulator/device tests are a manual step; state in the test report.

## Packaging

- macOS: .app/.dmg, code-sign + notarize — see `packaging/macos.md`.
- iOS: signed .ipa via Xcode/Transporter for the App Store.