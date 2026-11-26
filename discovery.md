# Discovery Prompt

This is the first thing you give your AI coding assistant. It is written in
plain language. You do not need to know any technical terms.

---

## The prompt (copy and fill in)

> I want to build: **[describe what you want in your own words]**
>
> It should run on: **[Windows / Mac / Linux / more than one / a website / a phone / a server (runs in the background)]**
>
> A bit more detail (optional): **[who uses it, what problem it solves, anything it must or must not do]**

That is the whole prompt. Everything after this is what the AI does with it.

---

## Library catalogue (what the AI can choose from)

The AI selects from this menu based on the description and target system. It
requests only the files it needs; the novice pulls them.

**Universal — the AI selects the ones that apply:**
- `universal/agent-conduct.md` — how the AI behaves (always).
- `universal/architecture.md` — structure, core/UI separation, design rules.
- `universal/documentation.md` — code comments, docstrings, dev docs, accuracy.
- `universal/project-outline.md` — the pre-coding outline the AI must produce.
- `universal/testing.md` — test practice + completion gate.
- `universal/security.md` — secrets, input validation, least privilege.
- `universal/version-control.md` — git practice, commits, checkpoints.
- `universal/data.md` — databases and data stores (when data beyond files).
- `universal/api.md` — designing/consuming APIs (when an API is involved).
- `universal/ux.md` — UX, accessibility, user docs (when there is a UI).
- `universal/operations.md` — config, logging, caching, load balancing, Docker,
  CI/CD, backup (when deployed/containerised/scaled).
- `universal/release.md` — versioning, license, privacy, release approval
  (when distributed/deployed).

**Languages — pick one matching the project:**
- `languages/rust-desktop.md` — Rust + GTK4 desktop.
- `languages/rust-web.md` — Rust web (Axum/Yew/Leptos).
- `languages/python.md` — Python CLI/daemon/backend.
- `languages/typescript-web.md` — TypeScript web (React/Vite/Next.js).
- `languages/csharp-desktop.md` — C#/.NET desktop (WPF/Avalonia).
- `languages/csharp-web.md` — C#/.NET web (ASP.NET Core).
- `languages/cpp-desktop.md` — C++ desktop.
- `languages/cpp-embedded.md` — C++ embedded/bare-metal.
- `languages/go-cli.md` — Go CLI/service.
- `languages/java-desktop.md` — Java desktop (JavaFX/Swing).
- `languages/kotlin-android.md` — Kotlin Android.
- `languages/swift-apple.md` — Swift macOS/iOS.
- `languages/dart-flutter.md` — Dart/Flutter cross-platform.
- `languages/php-web.md` — PHP web (Laravel/Symfony).
- `languages/ruby-web.md` — Ruby web (Rails/Sinatra).
- `languages/qt-desktop.md` — Qt desktop (C++/Python).

**Packaging — pick by target OS:**
- `packaging/linux-appimage.md` — Linux AppImage.
- `packaging/windows.md` — Windows portable/installer.
- `packaging/macos.md` — macOS .app/.dmg.
- `packaging/web-deploy.md` — web deployment (static/container/PaaS).

**Conditional:**
- `seo.md` — only for public websites that should be indexed.

The AI states which files it needs and why; the novice copies them into a
`FRAMEWORKS/` folder.

---

## What the AI does next (you just watch)

1. **Works out the type of project** from your description and chosen system.
   - A website, a desktop program, a phone app, a command-line tool, etc.
   - If the description is too vague to classify, the AI asks plain-language
     follow-up questions first.
   - Before planning a project intended for real users, it clarifies only the
     details that could change the design or risk: who can use it and what
     they can do, what data it handles, expected usage and availability, what
     should happen when a dependency or device is unavailable, and who will
     deploy and support it. For sensitive or regulated data, public services,
     payments, or safety-critical use, it asks about applicable requirements
     and flags the need for qualified review. Unknowns are recorded as
     assumptions, not treated as verified requirements.
   - If you already have a project (not starting fresh), the AI inspects the
     existing code first and preserves its conventions rather than scaffolding
     over it.
   - If you named several platforms, the AI picks a language and toolkit that
     support **all** of them (e.g. not Swift for Windows+Mac). If no single
     choice covers every platform, it flags the conflict and proposes a
     cross-platform alternative or a per-platform UI in the outline.

2. **Selects and requests the guidance files.** Based on the project type and
   target system, the AI picks the specific guides it needs from the catalogue
   (a language doc, the relevant universal docs, packaging for your OS, SEO only
   if public web). It will say something like:
   > Please download these files into your project folder:
   > - `universal/architecture.md`
   > - `universal/testing.md`
   > - `universal/security.md`
   > - `languages/rust-desktop.md`
   > - `packaging/linux-appimage.md`
   >
   > You can get them from:
   > https://github.com/yadablahblah/GUIDEFRAMES

   You copy each file into a `FRAMEWORKS/` folder in your project, keeping the
   sub-folders (`FRAMEWORKS/universal/`, `FRAMEWORKS/languages/`,
   `FRAMEWORKS/packaging/`). The AI tells you the exact layout it expects. This
   folder is temporary — it can be deleted once the project is complete.

3. **Reads the guides.** The AI reads the pulled guide files so it understands
   the project's structure, test approach, security rules, and target specifics
   before planning.

4. **Sets up local version control.** Before any code or the outline, the AI
   walks you through creating a local git repository (`git init`), checks the
   current state, and makes an initial commit (e.g. the `FRAMEWORKS/` guides +
   a `.gitignore`). This gives the project a baseline so every later increment
   is recoverable. The AI explains each command in plain language and confirms
   before running it. No remote is created or pushed to unless you ask.

5. **Presents a project outline for your approval.** Now informed by the guides,
   the AI creates a short, plain-language outline: what the project will do,
   what it will *not* do, the technology it picked, the test plan, how you'll get
   the finished app, and any risks or default choices you might want to change.
   It asks "Does this match what you want?" and waits for your yes (or your
   changes). Nothing is coded until you approve.

6. **Starts building.** The AI writes the code, tests, and documentation
   following the guides and the approved outline, committing each verified
   increment after you confirm it is good.

---

## If you are not sure what to put

- **"I want to build"** — describe the result, not the technology. "A tool that
  copies my photos to a backup drive" is perfect. "A Rust GTK4 AppImage" is not
  needed — the AI works that out.
- **"It should run on"** — pick the system you actually use. If you want it to
  work everywhere, say "more than one" and name them. Choose "a server" if it
  should run in the background (a service, daemon, or API) rather than as an
  app you open. Note: some toolkits are single-platform (e.g. Windows-only or
  Apple-only); if you name several platforms the AI will pick a
  cross-platform toolkit and flag any extra cost in the outline.
- **Optional detail** — only add this if it matters to you. The AI will ask
  follow-up questions in plain language if it needs more.

---

## What you will NOT be asked

- Which programming language to use.
- Which framework or library.
- How to structure the code.
- Which test framework, packaging format, or deployment method.

The AI decides all of that from the guides. If a choice genuinely affects you
(for example "should it delete files or keep them?"), the AI will ask in plain
language and recommend a default.

---

## The golden rule

You describe **what** you want. The AI handles **how**. If the AI ever asks you
a technical question you do not understand, say "I don't know, you decide" —
that is a valid answer and the AI will pick a sensible default.