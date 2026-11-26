# TypeScript Web

Loaded when the target is a website/web app and the AI chooses TypeScript.
Instructions to the AI.

## Stack

- **Language**: TypeScript (strict mode).
- **Framework**: React + Vite (default). Alternatives: Vue + Vite, Svelte/SvelteKit,
  Angular, Solid — pick based on the project's needs (SSR/SEO → Next.js or
  SvelteKit; small/simple → Svelte; large enterprise → Angular). Do not default
  to React without considering the alternatives.
- **Package manager**: npm (default, universally available), or pnpm/yarn/bun
  if the project already uses one. Bun is also a runtime alternative to Node.
  Match the existing lockfile; do not mix package managers in one project.
- **Build**: Vite.
- **Testing**: Vitest + Playwright (e2e).

## Layout

```
src/
├── components/
├── pages/ or routes/
├── lib/             # shared logic
└── main.tsx
```

## Rules

- `strict: true` in `tsconfig.json`; no `any` without justification.
- Validate all external input (forms, API responses) at the boundary.
- Never commit secrets; use `.env` (git-ignored) for local config.
- Sanitise user content to prevent XSS; use a CSP.
- Keep components small and single-purpose.

## Quality gates

```
tsc --noEmit
vite build
vitest run
playwright test      # critical path only
```

All must pass before reporting completion (see `universal/testing.md`).

## SEO

Load `seo.md` if the site is public and should be indexed. Next.js is preferred
over plain Vite when SEO matters (server rendering, metadata API).