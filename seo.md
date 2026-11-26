# SEO (web + public only)

Loaded only when the target is a public-facing website that should be indexed.
Instructions to the AI.

## Core principle

SEO must never compromise security, privacy, or access control. Development,
testing, and staging environments must **not** become discoverable.

## Indexing control

- Production: allow indexing only if the user wants public visibility.
- Dev/staging: add `robots.txt` disallowing all, and `noindex` meta tags.
- Private/internal apps: `noindex` always; consider auth-gating entirely.

## On-page basics

- Unique, descriptive `<title>` and `<meta name="description">` per page.
- Semantic HTML (one `<h1>`, logical heading order).
- Descriptive `alt` text on images.
- Canonical URLs to avoid duplicate-content splits.
- `sitemap.xml` and `robots.txt` at the site root for production.

## Performance (affects ranking)

- Fast first load: code-split, compress assets, lazy-load below-fold media.
- Mobile-friendly layout.
- Avoid render-blocking resources.

## Prefer SSR/SSG when SEO matters

A client-only SPA (plain Vite + React) is hard to index. Use Next.js (or another
SSR/SSG framework) when public indexing is a requirement.

## Approval

Public indexing and production visibility require explicit user approval. Do not
assume every site should be indexed.