# Architecture (universal)

Loaded for every project. These are instructions to the AI, not the user.

## Core principle

Use the **simplest maintainable architecture that satisfies the requirements.**
Do not introduce abstractions, frameworks, or layers the project does not need.

## Core / UI separation (best fit)

Separate the **core** (business logic, file/data operations, rules) from the
**UI** (display, input, presentation) where it fits the project. This is the
default for most apps, but not forced — a tiny script may not need it.

- The core must not depend on the UI. It must be usable and testable without a
  display server, windowing toolkit, or browser.
- The UI depends on the core, never the reverse.
- Put core logic in a `core/`, `engine/`, or `domain/` module; keep UI in `ui/`,
  `views/`, `components/`, or `screens/`.
- The core exposes a stable interface (functions, a trait, a service API) the UI
  calls. The UI translates user actions into core calls and renders the results.
- This is what makes the core unit-testable without a GUI, and the UI swappable
  (or reusable across targets) without touching business rules.

Applies where practical. The matching `languages/*` doc shows the concrete
layout (e.g. `engine/` + `ui/` for Rust desktop, `core/` + `features/` for
Flutter). Skip the split only when the project is too small to benefit.

## Structure rules

- Keep configuration separate from application logic.
- Keep user-facing content separate from code where practical.
- Separate responsibilities: one module/class does one job.
- Validate data at the boundaries (input, file, network).
- Handle errors predictably — no silent failures, no swallowed exceptions.
- Preserve existing project conventions. Do not rewrite working code to impose
  a different style.

## Content / presentation / logic separation (where practical)

Do not put large amounts of user-facing content inside application code. A
single `build.py` (or one file) holding every page of a website is the failure
mode this prevents.

- **User-editable content** (page text, templates, config values, copy) goes in
  separate, easily editable files — Markdown, HTML templates, JSON/YAML — not
  hardcoded in `.py`/`.rs`/`.js` logic.
- **Presentation** (templates, layouts, styling) is separate from **logic**
  (routing, data access, business rules).
- Use an includes / templating / component system so pages share layout without
  duplication (Jinja2, Handlebars, React components, GTK templates, etc.).
- A non-developer should be able to edit page content without touching code.
- Do not introduce a heavyweight CMS or templating engine for a simple project —
  match the mechanism to the scale (a few Markdown files vs. a full CMS).
- Keep styling (CSS) separate from logic where appropriate.

## Significant changes

Before a significant architectural change, state: the reason, the impact, the
alternatives, and the migration path. Get approval before proceeding. Routine
implementation choices (naming, file layout within a module) do not need
approval.

## Anti-patterns to avoid

- Speculative infrastructure ("we might need this later").
- Unnecessary dependencies — prefer the standard library and well-maintained,
  established packages already in the project.
- Duplication — extract shared logic rather than copy-paste.
- Breaking existing functionality without an agreed reason.

## Cross-platform strategy (when the target is more than one OS)

When the project must run on multiple platforms, the goal is to write the
business logic **once** and vary only the UI and packaging.

- **Prefer a genuinely cross-platform UI toolkit** where one exists for the
  chosen language: GTK4 (Linux/Win/Mac), Qt, Flutter, Avalonia, JavaFX, .NET
  MAUI. With these, the same UI code runs everywhere; only packaging differs.
- **Isolate platform-specific code behind an interface.** File paths,
  permissions, process management, and OS dialogs differ per platform. Put them
  in a `platform/` module with one implementation per OS, selected at build or
  run time. The core calls the interface, never the OS API directly.
- **Keep the core pure.** If the core has no UI or OS dependencies, it is
  written once and reused unchanged across platforms. This is the payoff of
  core/UI separation.
- **Flag toolkit choices that force per-platform UI.** Some toolkits are
  single-platform: WPF (Windows), SwiftUI/UIKit/AppKit (Apple). If the user
  wants those platforms and the AI picks such a toolkit, the UI must be written
  separately per platform — state this cost in the outline before proceeding.
- **Prefer one language across platforms** where possible (Rust, C#, Python,
  Go, Java, Dart/Flutter, C++). Avoid mixing languages per platform unless
  there is a clear reason — it doubles the maintenance surface.
- **Test on each target platform** (or a representative VM/container) before
  release; cross-platform code still has platform-specific bugs.
- **Packaging differs per OS** — see `packaging/*`. This is expected and cheap;
  extensive code changes are not.

In short: with a cross-platform toolkit and a pure core, multiplatform is mostly
a packaging exercise. With a single-platform toolkit, it is a per-platform UI
project — the AI must make that trade-off explicit in the outline.

## Performance and resource management

- Optimise based on **measured requirements and evidence**, not guesswork.
- Profile before optimising: identify the actual bottleneck (CPU, memory, IO,
  network, DB) rather than assuming.
- Consider resource use during design: memory, CPU, storage, network, startup
  time, response time, concurrent operations.
- Avoid premature optimisation and unnecessary resource consumption.
- Where hardware limits are known (embedded, low-RAM devices), account for them
  in technology selection.
- After a change, re-measure to confirm the optimisation helped and did not
  regress elsewhere.

## Per-target notes

The AI loads the matching `languages/*` and `packaging/*` docs for
target-specific architecture. This doc stays universal.