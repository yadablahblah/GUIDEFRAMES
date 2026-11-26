# New Guide Framework UNDER (CONSTRUCTION TEST IF YOU LIKE) 

A lightweight, two-layer framework for AI-assisted software creation aimed at
novice users.

## The idea

The novice gives one plain-language prompt. The AI does the technical work,
pulling only the guides it needs from this library.

## How it works

1. **Novice** fills in `discovery.md` (what + target system, plain language).
2. **AI** classifies the project (or asks plain-language follow-ups; inspects
   existing code if not greenfield).
3. **AI** selects the specific guides it needs from the catalogue and asks the
   novice to pull those files into the project's `FRAMEWORKS/` folder (temporary
   — can be deleted once the project is complete).
4. **Novice** copies the named files (the only technical action required).
5. **AI** reads the guides, then walks the novice through `git init` + an
   initial baseline commit (no remote unless asked).
6. **AI** presents a plain-language **project outline** (what it will do, what
   it won't, tech chosen, test plan, risks) for the novice to approve. Nothing
   is coded until approved.
7. **AI** builds the project following the guides and outline, committing each
   verified increment after the novice confirms it is good.

## Library layout

```
discovery.md          # the initial prompt (start here)
README.md             # this file
WALKTHROUGH.md        # shot list + narration for the walkthrough video
walkthrough.tape      # VHS script: renders the terminal portion to GIF/MP4

universal/            # the AI selects which apply (not all always loaded)
├── agent-conduct.md   # how the AI behaves (always)
├── architecture.md
├── documentation.md   # comments, docstrings, dev docs, accuracy
├── project-outline.md
├── testing.md
├── security.md
├── version-control.md
├── data.md            # when storing data beyond files
├── api.md             # when exposing/consuming an API
├── ux.md              # when there is a UI (a11y + docs)
├── operations.md      # when deployed / containerised / scaled
└── release.md         # when distributed / deployed

languages/            # loaded based on language + domain
├── rust-desktop.md
├── rust-web.md
├── python.md
├── typescript-web.md
├── csharp-desktop.md
├── csharp-web.md
├── cpp-desktop.md
├── cpp-embedded.md
├── go-cli.md
├── java-desktop.md
├── kotlin-android.md
├── swift-apple.md
├── dart-flutter.md
├── php-web.md
├── ruby-web.md
└── qt-desktop.md

packaging/            # loaded based on target OS / distribution
├── linux-appimage.md
├── windows.md
├── macos.md
└── web-deploy.md

seo.md                # loaded only for public websites
```

## Routing logic (what the AI loads)

| Discovery answer | AI loads |
|---|---|
| any project | the AI selects the relevant `universal/` docs (always includes `agent-conduct.md` and `project-outline.md`) |
| any project with code | `universal/documentation.md` |
| stores data beyond files | `universal/data.md` |
| exposes/consumes an API | `universal/api.md` |
| has a UI | `universal/ux.md` |
| deployed / containerised / scaled | `universal/operations.md` |
| distributed / deployed | `universal/release.md` |
| desktop + Rust | `languages/rust-desktop.md` |
| web + Rust | `languages/rust-web.md` |
| web + TypeScript | `languages/typescript-web.md` |
| any + Python | `languages/python.md` |
| desktop + C# | `languages/csharp-desktop.md` |
| web + C# | `languages/csharp-web.md` |
| desktop + C++ | `languages/cpp-desktop.md` |
| embedded + C++ | `languages/cpp-embedded.md` |
| CLI/service + Go | `languages/go-cli.md` |
| desktop + Java | `languages/java-desktop.md` |
| Android + Kotlin | `languages/kotlin-android.md` |
| macOS/iOS + Swift | `languages/swift-apple.md` |
| cross-platform + Flutter | `languages/dart-flutter.md` |
| web + PHP | `languages/php-web.md` |
| web + Ruby | `languages/ruby-web.md` |
| desktop + Qt (C++/Python) | `languages/qt-desktop.md` |
| Linux desktop | `packaging/linux-appimage.md` |
| Windows desktop | `packaging/windows.md` |
| macOS desktop | `packaging/macos.md` |
| web service | `packaging/web-deploy.md` |
| public website | `seo.md` |

**Multiplatform**: if the novice names several systems, the AI loads the
matching `packaging/*` file for each and notes the primary target.

## Design decisions

- **Combined language+domain files** (e.g. `rust-desktop.md`) so the novice
  pulls fewer files. Separate files can be split later if reuse demands it.
- **Universal docs are selected per project** (not all always loaded); the AI
  always includes `agent-conduct.md` and `project-outline.md`, plus the others
  when their conditions apply.
- **Novice never authors technical prompts** — the AI selects and requests the
  guides. The novice's only technical action is copying named files.

## Extending

Add a new language: create `languages/<name>.md` and add a row to the routing
table. Add a new target: create a `packaging/<target>.md` and a routing row.

## Versioning and migration

The library itself is versioned (semver) and tagged in git. Each release notes
what changed (new language docs, revised rules).

For an **existing project** that pulled guides into `FRAMEWORKS/`:

- The pulled files are a snapshot — they do not auto-update when the library
  changes.
- To refresh: re-pull the changed files from the new library version into
  `FRAMEWORKS/`, overwriting the old copies. The AI re-reads them and notes any
  rule changes that affect the project.
- The project's own code is unaffected — only the guidance is refreshed.
- `FRAMEWORKS/` is temporary and can be deleted once the project is complete, so
  staleness only matters while the project is active.
- Record the library version used in the project outline (e.g. "guides v1.2.0")
  so it is clear which ruleset the project was built against.
