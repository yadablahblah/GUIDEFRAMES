# Documentation (universal)

Loaded for every project. Instructions to the AI.

## Code comments

- Comments explain **intent, reasoning, or non-obvious behaviour** — not what
  the code literally does.
- Document complex or unusual logic where necessary.
- Explain important design decisions inline where they are non-obvious.
- Remove obsolete or misleading comments.
- Update comments when the code changes.
- Do not add comments that merely restate the code.

## Docstrings / API reference

- Document public interfaces: functions, classes, modules, endpoints.
- State purpose, parameters, return value, and raised errors where appropriate.
- Use the language's standard docstring convention (e.g. JSDoc, rustdoc,
  Python docstrings, XML doc comments for .NET).
- Keep docstrings accurate — update them when the signature or behaviour changes.

## Developer documentation

For substantial projects, maintain `documentation/ARCHITECTURE.md` covering:

- Architectural overview and component responsibilities.
- Technology choices and rationale.
- Data flow and external integrations.
- Database design where applicable.
- Environment configuration.
- Important design decisions and known limitations.

Update it when the architecture changes. For small projects, a section in the
README is sufficient — do not create a heavy doc for a trivial app.

## User documentation

Covered in `universal/ux.md` — every project must have a root `README.md` with
install/build/run, config, usage, testing, updating, troubleshooting, license.

## Changelog

Covered in `universal/release.md` — maintain `CHANGELOG.md` of user-facing
changes; tag releases in git.

## Test report

Covered in `universal/testing.md` — update `documentation/TEST_REPORT.md` as
work proceeds, distinguishing passed/failed/skipped/blocked.

## Accuracy rule

Documentation must describe **actual implemented behaviour**, not intended or
assumed behaviour. Update docs whenever implementation changes make them
inaccurate. Do not invent commands, options, or functionality. Mark any
unverified instructions.

## Proportionality

Match documentation effort to project size. A small CLI needs a good README and
docstrings; a large service needs architecture docs, API reference, and a
changelog. Do not over-document a trivial project or under-document a complex
one.