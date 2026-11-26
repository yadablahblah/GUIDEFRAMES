# Kotlin Android

Loaded when the target is an Android app and the AI chooses Kotlin.
Instructions to the AI.

## Stack

- **Language**: Kotlin.
- **UI**: Jetpack Compose (preferred) or XML layouts.
- **Build**: Gradle (Android Gradle Plugin).
- **Testing**: JUnit + Espresso (UI) + Robolectric (local).

## Layout

```
app/src/main/java/<pkg>/
├── MainActivity.kt
├── ui/              # Compose screens / ViewModels
├── data/            # repositories, Room
└── ...
app/src/test/        # unit
app/src/androidTest/ # instrumented
```

## Rules

- MVVM/MVI; keep business logic in ViewModels, not Composables/Activities.
- Validate all external input (intents, deep links, network).
- Request runtime permissions explicitly; handle denial.
- No secrets in the APK; use the Build Config / server-side config.
- Support back navigation and process death (SavedStateHandle).

## Quality gates

```
./gradlew build
./gradlew test
./gradlew lint
```

All must pass before reporting completion (see `universal/testing.md`).
Instrumented tests need an emulator/device — note as manual if unavailable.

## Packaging

Signed AAB for Play Store, or APK for sideload. See store-release notes in
`packaging/web-deploy.md` is not applicable; document signing in the outline.