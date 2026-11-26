# UX & Accessibility (universal)

Loaded for every project with a user interface. Instructions to the AI.

## User experience principles

- **Clarity over cleverness.** The user should always know what the app did,
  what it is doing, and what went wrong.
- **Consistency.** Same action → same result everywhere. Follow platform
  conventions (native file dialogs, standard shortcuts).
- **Feedback.** Every action produces visible feedback (status message,
  progress, confirmation). No silent operations.
- **Forgiveness.** Prefer reversible actions; confirm destructive ones
  (delete, overwrite, publish). Undo where feasible.
- **Progressive disclosure.** Show the simple path first; advanced options
  behind a toggle or secondary screen.
- **Plain-language errors.** Say what happened and what to do next, without
  jargon or stack traces in the UI.

## Accessibility (a11y) — required where a UI exists

- **Keyboard**: every action reachable by keyboard; visible focus indicator;
  logical tab order.
- **Screen readers**: semantic markup (HTML landmarks, ARIA roles where needed);
  label every control; announce dynamic changes (live regions).
- **Contrast**: text/background contrast meets WCAG AA (4.5:1 normal, 3:1 large).
- **Text**: resizable without loss of function; no text baked into images.
- **Forms**: explicit labels, error text tied to fields, not colour-only signals.
- **Motion**: respect `prefers-reduced-motion`; no flashing content.
- **Targets**: touch targets ≥ 44×44 px (mobile); click targets comfortably sized.
- State the a11y target (e.g. WCAG 2.1 AA) in the project outline.

## User documentation — required

Every project must have a root `README.md` covering:

- What the app does and who it is for.
- Requirements / prerequisites.
- Install / build / run — exact commands for the target platform.
- Configuration and environment variables (no real secrets).
- Basic usage and common workflows.
- Testing — how to run the tests.
- Updating, backup/recovery where applicable.
- Troubleshooting common issues.
- License (see `release.md`).

Keep it accurate: update the README whenever behaviour changes. Do not invent
commands or options. Mark any unverified instructions.

## Per-target notes

The matching `languages/*` and `packaging/*` docs cover platform-specific UI
toolkits and conventions. This doc stays universal.