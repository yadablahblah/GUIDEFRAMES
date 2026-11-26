# C++ Desktop

Loaded when the target is a desktop app and the AI chooses C++.
Instructions to the AI.

## Stack

- **Standard**: C++17 or C++20.
- **UI**: Qt (see `qt-desktop.md`), wxWidgets, or native (Win32/Cocoa).
- **Build**: CMake (or Meson).
- **Testing**: Catch2 or GoogleTest.

## Layout

```
src/
├── main.cpp
├── ui/
├── core/            # business logic, no UI deps
└── platform/        # OS-specific code
tests/
CMakeLists.txt
```

## Rules

- Use RAII; no raw `new`/`delete` — prefer smart pointers.
- Keep the core free of UI dependencies so it is testable.
- Validate input at boundaries; use exceptions or error codes consistently.
- No undefined behaviour; compile with `-Wall -Wextra -Wpedantic` (or `/W4`).
- Bundle runtime libs for distribution (see `packaging/*`).

## Quality gates

```
cmake -B build && cmake --build build
ctest --test-dir build
```

All must pass before reporting completion (see `universal/testing.md`).

## Packaging

See `packaging/linux-appimage.md`, `windows.md`, or `macos.md`.