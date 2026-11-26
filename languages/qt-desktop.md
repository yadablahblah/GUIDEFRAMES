# Qt (desktop, C++ or Python)

Loaded when the target is a desktop app and the AI chooses Qt. Applies to both
C++ (Qt Widgets/QML) and Python (PyQt/PySide). Instructions to the AI.

## Stack

- **C++**: Qt 6 + CMake + Qt Widgets or QML.
- **Python**: PySide6 (or PyQt6) + `qmake`/`cmake` or `pip`.
- **Build**: CMake (C++) / `pip`/PyInstaller (Python).
- **Testing**: QtTest (C++) / `pytest-qt` (Python).

## Layout (C++)

```
src/
├── main.cpp
├── ui/              # widgets / QML
├── core/            # logic, no Qt deps where possible
└── ...
tests/
CMakeLists.txt
```

## Rules

- Keep business logic in a core layer free of Qt dependencies so it is testable
  without a display.
- Use signals/slots (or `QObject::connect`) for UI<->logic; avoid tight coupling.
- Validate input at boundaries.
- Config under XDG (`~/.config`) on Linux, `%APPDATA%` on Windows.
- No secrets in source.

## Quality gates (C++)

```
cmake -B build && cmake --build build
ctest --test-dir build
```

## Quality gates (Python)

```
pytest
ruff check .
```

All must pass before reporting completion (see `universal/testing.md`). UI tests
need a display; use Xvfb in CI.

## Packaging

- Linux: AppImage with `linuxdeploy-plugin-qt` — see `packaging/linux-appimage.md`.
- Windows: `windeployqt` + installer — see `packaging/windows.md`.
- macOS: `macdeployqt` + .dmg — see `packaging/macos.md`.
- Python: PyInstaller/`pyside6-deploy` to bundle the runtime.