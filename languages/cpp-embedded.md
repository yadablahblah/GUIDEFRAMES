# C++ Embedded

Loaded when the target is an embedded / bare-metal / RTOS system and the AI
chooses C++. Instructions to the AI.

## Stack

- **Standard**: C++17 (avoid exceptions/RTTI where the toolchain forbids).
- **Build**: CMake + cross-compile toolchain (arm-none-eabi, etc.).
- **Testing**: unit tests on host (GoogleTest) + on-target smoke tests.

## Rules

- No dynamic allocation after init where possible; static allocation preferred.
- Keep ISRs short; defer work to main loop/tasks.
- Use `volatile` and memory barriers correctly for hardware registers.
- Validate all sensor/external input; handle fault conditions explicitly.
- Document pin mappings and clock config.
- Never log secrets (rare, but applies to device provisioning keys).

## Quality gates

```
cmake -B build -DCMAKE_TOOLCHAIN_FILE=...
cmake --build build
ctest --test-dir build       # host tests
```

All must pass before reporting completion (see `universal/testing.md`). On-target
verification is a manual step; state it in the test report.

## Packaging

Firmware image / hex / bin via the toolchain; flashing procedure documented.