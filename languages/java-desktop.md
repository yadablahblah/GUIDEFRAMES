# Java Desktop

Loaded when the target is a desktop app and the AI chooses Java.
Instructions to the AI.

## Stack

- **Runtime**: JDK 21 (LTS).
- **UI**: JavaFX (preferred) or Swing.
- **Build**: Maven or Gradle.
- **Testing**: JUnit 5.

## Layout

```
src/main/java/<pkg>/
├── App.java
├── ui/
├── core/
└── ...
src/test/java/
pom.xml  or  build.gradle
```

## Rules

- Separate UI from logic; keep core testable without a display.
- Validate input at boundaries; use `Objects.requireNonNull` and explicit checks.
- Use `try-with-resources` for IO.
- Config under `~/.config` (Linux) / `%APPDATA%` (Windows).
- Never log secrets.

## Quality gates

```
mvn verify        # or ./gradlew build
```

All must pass before reporting completion (see `universal/testing.md`).

## Packaging

- Linux: AppImage (bundle JRE) — see `packaging/linux-appimage.md`.
- Windows: jpackage installer — see `packaging/windows.md`.
- macOS: jpackage .app/.dmg — see `packaging/macos.md`.