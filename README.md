# Guideframes

A lightweight, two-layer guide library for AI-assisted software creation. It is designed to help people describe what they want to build in plain language while an AI coding assistant handles the technical planning and implementation.

> **Status:** This project is under construction. Review the guides before using them in a project.

## Get started

1. Open [`discovery.md`](discovery.md) and copy its prompt into your AI coding assistant.
2. Fill in what you want to build and where it should run. Add any important details; you do not need to choose a language or framework.
3. The assistant will ask questions if needed, then name the guide files that fit your project and explain why.
4. Copy only those files into a `FRAMEWORKS/` folder in your project, preserving their subfolders. For example:

   ```text
   FRAMEWORKS/
   ├── universal/
   │   ├── agent-conduct.md
   │   └── testing.md
   ├── languages/
   │   └── rust-desktop.md
   └── packaging/
       └── linux-appimage.md
   ```

5. Ask the assistant to read the copied guides. It will help establish a local Git baseline, present a project outline for your approval, and then build the project in verified increments.

You do not need to copy the whole library. The project-specific `FRAMEWORKS/` folder is a snapshot and can be removed when the project is complete.

## How the guides are selected

The assistant always uses `universal/agent-conduct.md` and `universal/project-outline.md`. It selects other guides according to the project:

| Project need | Guide |
|---|---|
| Code in any language | `universal/documentation.md` |
| Data stored beyond ordinary files | `universal/data.md` |
| An API is exposed or consumed | `universal/api.md` |
| A user interface | `universal/ux.md` |
| Deployment, containers, or scaling | `universal/operations.md` |
| Distribution or deployment | `universal/release.md` |
| Rust desktop / web | `languages/rust-desktop.md` / `languages/rust-web.md` |
| TypeScript web | `languages/typescript-web.md` |
| Python | `languages/python.md` |
| C# desktop / web | `languages/csharp-desktop.md` / `languages/csharp-web.md` |
| C++ desktop / embedded | `languages/cpp-desktop.md` / `languages/cpp-embedded.md` |
| Go CLI or service | `languages/go-cli.md` |
| Java desktop | `languages/java-desktop.md` |
| Kotlin Android | `languages/kotlin-android.md` |
| Swift macOS or iOS | `languages/swift-apple.md` |
| Dart / Flutter | `languages/dart-flutter.md` |
| PHP web | `languages/php-web.md` |
| Ruby web | `languages/ruby-web.md` |
| Qt desktop (C++ or Python) | `languages/qt-desktop.md` |
| Linux / Windows / macOS desktop | The matching guide in `packaging/` |
| Web deployment | `packaging/web-deploy.md` |
| Public website that should be indexed | `seo.md` |

For projects targeting multiple platforms, the assistant should select the relevant packaging guides and identify the primary target. The full prompt and catalogue are in [`discovery.md`](discovery.md).

## What the assistant does

After it reads the selected guides, the assistant should:

- inspect existing code first when working in an existing project;
- help create a local Git repository and an initial baseline commit (no remote unless requested);
- present a plain-language outline covering scope, technology, tests, and risks, and wait for approval before coding;
- implement and verify the approved plan in increments, confirming each before committing it.

## Library contents

- [`discovery.md`](discovery.md) — the starting prompt and guide catalogue.
- `universal/` — project-wide practices for architecture, testing, security, version control, documentation, data, APIs, UX, operations, and releases.
- `languages/` — language and application-domain guidance.
- `packaging/` — platform-specific packaging and web deployment guidance.
- [`seo.md`](seo.md) — search-engine guidance for public websites.

## Updating guides in an existing project

Guides copied into `FRAMEWORKS/` do not update automatically. To refresh them, copy the changed guides from the desired library version over the project's existing copies, then ask the assistant to reread them and explain any relevant rule changes. Record the library version or commit used in the project outline so the guidance can be identified later.

## Contributing guides

To add a language or domain, create a guide in `languages/` and add its selection rule to the table in this README and the catalogue in `discovery.md`. To add a packaging target, create a guide in `packaging/` and add its selection rule to both places.
