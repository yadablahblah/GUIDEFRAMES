# Testing (universal)

Loaded for every project. Instructions to the AI.

## Required practice

1. Identify relevant tests **before** implementing.
2. Write or update tests **alongside** the functionality.
3. Run the tests after changes.
4. Investigate and fix failures.
5. Run relevant regression tests.
6. Report actual results honestly.

## Never

- Claim a test passed if it was not executed.
- Treat a successful build as proof of correct functionality.
- Hide or ignore test failures.
- Remove or weaken tests to make them pass.
- Change expected results without a valid reason.

## Completion gate (mandatory)

A task is **not done** until:
- All tests pass (or failures are reported as known limitations with a reason).
- The quality gates for the target language pass (see `languages/*`).
- `cargo build --release` / `vite build` / equivalent release build succeeds.
- **Spec check**: every functional requirement in the approved project outline
  is implemented and has a test or verification. Walk the outline's requirement
  list one by one; for each, confirm the code does it and a test covers it. If a
  requirement is unimplemented or untested, it is not done — report it as
  **blocked** or **partially verified**, do not claim completion.

Do not report completion with failing tests or unmet requirements. If a test
cannot be made to pass, report it as **blocked** or **failed** with the reason —
never silently omit it. If a requirement cannot be met, say so plainly.

## Reporting

Distinguish clearly between: **passed**, **failed**, **skipped**,
**not executed**, **blocked**, **partially verified**.

Update `documentation/TEST_REPORT.md` as work proceeds.

## Flaky tests

If a test passes in isolation but fails under parallel execution, it is flaky —
usually shared state (temp paths, global env vars, ports). Do not "fix" it by
deleting the test. Either isolate the shared state (unique temp dirs per test,
serial execution for the affected group) or mark it `#[ignore]` with a reason
and report it as a known limitation. Never silently delete a flaky test.

## UI / integration tests

Where a UI framework needs a display server (e.g. GTK), use a virtual framebuffer
(Xvfb on Linux) in CI. State this requirement in the README and test report.

## Test effort by target

- **Desktop / CLI**: unit tests for logic, integration tests for file/IO
  boundaries, at least one end-to-end run of the main workflow.
- **Web**: unit tests plus a minimal browser/e2e check of the critical path.
- **Mobile**: unit tests for logic; device/emulator testing noted as a manual
  step if automation is unavailable.

## CI integration (automated test runs)

Tests must run automatically, not just locally when the AI remembers.

- Set up a CI pipeline (GitHub Actions, GitLab CI, etc.) that runs the quality
  gates on every push / pull request. See `operations.md` CI/CD for the rules.
- The pipeline runs: build, lint, test, and the release build. Block merge on
  failure.
- Commit a starter workflow file (e.g. `.github/workflows/ci.yml`) as part of
  the initial scaffold so tests run from the first commit.
- UI tests that need a display use Xvfb (Linux) in CI.
- Keep pipeline secrets in the CI secret store, never in the repo.
- The AI sets this up during the initial scaffold and verifies the first CI run
  passes before reporting the project's first increment done.