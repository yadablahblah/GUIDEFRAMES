# Packaging: Web deployment

Loaded when the target is a website/web service. Instructions to the AI.

## Options

- **Static host** (GitHub Pages, Netlify, Cloudflare Pages): for static sites
  and WASM front-ends. Simplest; free tiers available.
- **Container** (Docker): for server-side apps; deploy to a container host.
- **PaaS** (Fly.io, Railway, Render): managed runtime for servers.

## Rules

- Serve over HTTPS only in production.
- Set security headers (CSP, HSTS, X-Content-Type-Options, Referrer-Policy).
- Keep secrets in the platform's secret store / env vars — never in the repo or
  client bundle.
- Use environment-specific config (dev/staging/prod); never point a public
  deploy at a development database.

## Build & deploy

- Build the release artefact (`vite build`, `cargo build --release`, etc.).
- Deploy via the chosen platform's CLI or CI pipeline.
- Verify the live site after deploy (health check, critical path).

## Approval

Do not deploy to production or expose a service publicly without explicit user
approval. A successful local build does not authorise deployment.

## Rollback

Document the rollback procedure (redeploy previous artefact / image tag) before
the first production deploy.