# Dart / Flutter (cross-platform)

Loaded when the target is a mobile, desktop, or web app and the AI chooses
Flutter. Instructions to the AI.

## Stack

- **Language**: Dart 3+.
- **UI**: Flutter (Material/Cupertino).
- **Build**: `flutter build` (apk, ipa, web, linux, windows, macos).
- **Testing**: `flutter_test` (widget/unit) + `integration_test`.

## Layout

```
lib/
├── main.dart
├── features/        # per-feature
├── core/            # shared logic, services
└── ...
test/
integration_test/
```

## Rules

- Separate UI (widgets) from logic (services/repositories); keep core testable.
- Validate all external input (platform channels, network, deep links).
- No secrets in the app bundle; use `--dart-define` for config at build time.
- Handle permissions and platform differences explicitly.
- Support responsive layout and accessibility (semantics).

## Quality gates

```
flutter analyze
flutter test
flutter build <target> --release
```

All must pass before reporting completion (see `universal/testing.md`).
Device/emulator tests are a manual step if unavailable.

## Packaging

Per target: `packaging/android` (AAB/APK), `packaging/ios` (signed .ipa),
`packaging/linux-appimage.md`, `windows.md`, `macos.md`, `web-deploy.md`.