# Project Outline Checklist (universal)

Loaded for every project. The AI creates this **before writing any code** and
presents it to the user for review. Instructions to the AI.

## When

After discovery (function + target system known, guides pulled) and **before**
the first line of code. The outline is a checkpoint, not a formality.

## What the AI produces

A short, plain-language document the user can read without technical knowledge.
It must cover:

### 1. What the project will do
- One-paragraph summary in plain terms.
- The core problem it solves and who uses it.

### 2. What it will NOT do (scope boundaries)
- Explicit list of deferred/excluded features so the user knows the limits.
- Prevents scope creep and false expectations.

### 3. Target and platform
- Operating system(s) / web / mobile.
- Any multiplatform notes (primary target + others).

### 4. Technology (AI-decided, stated plainly)
- Language, key libraries, build tool — with a one-line reason each.
- The user does not need to understand these; they are recorded for
  transparency and future sessions.

### 5. Architecture at a glance
- Major components/modules and what each does, in plain terms.
- **Core / UI split** (where it fits): which part is the business logic (core)
  and which is the display (UI), and that the core works without the UI.
- **Content separation**: which parts the user will edit (page text, templates,
  config) and that these live in editable files, not inside the code.
- How data/files flow through the app.

### 6. Functional requirements
- Numbered list of what the app must do (derived from the user's description).
- Each item testable.
- These are the **spec**: before the project is called done, each requirement is
  checked as implemented and tested (see `testing.md` completion gate).

### 7. Non-functional requirements
- Security, privacy, performance, reliability expectations.
- Any platform constraints (permissions, sandboxing, offline).

### 8. Test plan
- What will be tested and how (unit, integration, end-to-end).
- Any manual verification steps (e.g. UI on a real display).
- The completion gate: all tests must pass (or be reported as known limitations)
  before the work is called done.

### 9. Packaging and distribution
- How the user will get the finished app (AppImage, installer, web deploy).
- Whether a release will be published (requires user approval).

### 10. Risks and open questions
- Anything that could materially affect scope, cost, or feasibility.
- Decisions the AI made by default that the user may want to change.

### 11. Sessions / phases (for large projects)
- Break the work into phases, each a candidate session (e.g. engine, UI,
  packaging, release).
- Each phase has a clear scope and a clean end state (builds, tests pass,
  committed).
- Note which phases are large enough to warrant a separate session.
- Small projects: single session, skip this section.

### 12. Approval
- A clear "Does this match what you want? Reply yes or tell me what to change"
  prompt. Coding does not start until the user approves.

## Rules

- **Plain language first.** Technical terms may appear but each needs a one-line
  explanation. The user must be able to follow it.
- **Honest about limits.** If something is deferred or not possible, say so.
- **No surprises.** Anything the AI decided by default is listed in §10 so the
  user can object before code exists.
- **Keep it short.** One screen if possible. Link to the pulled guides for
  detail rather than restating them.
- **Update it** if scope changes during the project; re-present material changes.

## After approval

The AI records the approved outline (e.g. as `PROJECT_OUTLINE.md` in the
project) and begins implementation following the pulled guides.