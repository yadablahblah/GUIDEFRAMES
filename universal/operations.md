# Operations (universal)

Loaded when the project runs beyond a single local script — servers,
containers, or anything deployed. Instructions to the AI.

## Configuration & environments

- Separate config from code. Use env vars or a config system, never hardcode
  environment-specific values.
- Support dev / staging / prod configs; never point a public deploy at a dev
  database or service.
- Provide a safe example config (`.env.example`) with no real secrets.
- Validate required config at startup; fail safely if critical config is missing.
- Keep secrets in a secret store / env vars, never in the repo or image.

## Logging & observability

- Use a logging library with severity levels (DEBUG/INFO/WARN/ERROR); no
  `print`/`console.log` in production paths.
- Log useful diagnostics without secrets or PII.
- Make failures visible — never silently swallow errors.
- For services: health-check endpoint, request IDs, and structured logs (JSON)
  where the platform supports it.
- Crash reporting: consider a tool (Sentry, etc.) only if the user approves the
  external dependency and privacy trade-off.

## Production readiness

Before a service is exposed to real users, record operational expectations in
the project outline and verify the applicable items:

- Define measurable service targets where appropriate (availability,
  throughput, and response time) and the expected peak load. Do not promise
  targets the design or hosting plan cannot support.
- Set timeouts on network and database operations. Retry only transient,
  safe-to-repeat operations, with bounded attempts and backoff; avoid retry
  storms. Define behavior when a required dependency is unavailable.
- Provide separate liveness and readiness checks when the hosting platform
  needs them. Readiness must not send traffic to an instance that cannot serve
  requests; health endpoints must not expose sensitive details.
- For services, collect enough metrics and logs to detect user-visible
  failures, saturation, and dependency problems. Define actionable alerts and
  who responds to them; avoid collecting secrets or unnecessary personal data.
- Handle shutdown and termination signals so in-flight work can finish or fail
  predictably and resources are released.
- Document deployment ownership, environment promotion, required configuration,
  and a smoke check for the critical user path. Verify the deployed service,
  not only the local build.

## Caching

- Add a cache only when measured performance needs it — not speculatively.
- Choose the store: in-process (fast, per-instance) vs shared (Redis/Memcached,
  cross-instance).
- Define an invalidation strategy (TTL, write-through, event-based) up front;
  stale data is a correctness bug.
- Cache-aside is the common pattern: check cache → on miss, load from source →
  populate cache. Never treat the cache as the source of truth.
- Use Redis for: shared session state, rate-limit counters, queues, hot
  read-through caches. Not as primary durable storage.

## Load balancing

- Needed only when running multiple instances behind one address.
- Prefer stateless instances so any instance can serve any request; push state
  to a shared store (DB, Redis) rather than local memory/disk.
- Health checks so the balancer drops unhealthy instances.
- TLS termination at the balancer; plain HTTP internally.
- Sticky sessions only when unavoidable; they complicate scaling and failover.
- Document the topology in the project outline if more than one instance runs.

## Reverse proxy & web server (Nginx / Apache)

- Use Nginx or Apache as a reverse proxy in front of an app server (Gunicorn,
  uWSGI, Node, etc.) — the app server listens on localhost, the proxy handles
  TLS, static files, and client connections.
- The proxy terminates TLS (certificates via Let's Encrypt / certbot); internal
  traffic is plain HTTP.
- Serve static assets (CSS/JS/images) directly from the proxy; only proxy
  dynamic requests to the app.
- Set security headers (HSTS, CSP, X-Content-Type-Options) at the proxy.
- Rate-limit and connection-limit at the proxy to protect the app.
- Keep proxy config in version control (e.g. `nginx.conf`, `.htaccess`); do not
  edit production config by hand without recording it.
- Never expose the app server port directly to the internet — bind to localhost
  or a private network only.

## Containers (Docker)

- Use multi-stage builds to keep the final image small (build stage separate
  from runtime stage).
- Pin base image versions; do not use `latest` in production.
- Run as a non-root user.
- Pass secrets at runtime (env/secret store), never `COPY` them into the image.
- Use volumes for data that must persist beyond the container.
- Document `docker run` / compose in the README; tag images meaningfully
  (semver + git SHA), not just `latest`.
- Scan images for vulnerabilities before publishing.

## CI/CD

- Automate build + test + lint on every change (GitHub Actions, GitLab CI, etc.).
- Run the quality gates from `languages/*` in CI; block merge on failure.
- Automate release artefact builds (AppImage, installer, container) on tag.
- Keep pipeline secrets in the CI secret store, never in the repo.
- A successful local build does not authorise a production deploy (see
  `release.md`).

## Dependency security auditing

Run a vulnerability audit on dependencies before release and periodically after:

- **Rust**: `cargo audit` (RustSec advisories); `cargo deny` for license/supply-chain policy.
- **Node/TypeScript**: `npm audit` / `pnpm audit` / `yarn audit`; `bun audit`.
- **Python**: `pip-audit` (PyPA); `safety` as an alternative.
- **Ruby**: `bundle audit`; `brakeman` for Rails security.
- **PHP**: `composer audit`.
- **Go**: `govulncheck`.
- **.NET**: `dotnet list package --vulnerable`.
- **Java/Gradle**: `gradle dependencies` + OWASP Dependency-Check plugin.
- **Containers**: `docker scout` / `trivy` / `grype` image scanning.

Rules:

- Fix or justify every high/critical finding before release; never ship known
  vulnerable deps silently.
- Pin dependency versions; use lockfiles.
- Review new dependencies for maintenance status, security history, and license
  before adding (see `security.md`).
- Re-run audits periodically; new advisories appear after release.
- If an audit tool is unavailable offline, report it as a known limitation, not
  a pass.

## Backup & recovery

- Back up any non-trivial data store; document the procedure and test a restore.
- Set recovery point and recovery time expectations where the data or service
  warrants them. A backup is not verified until a restore has been tested and
  the result recorded.
- For file-manipulating apps, never delete user data without a recoverable path
  (trash, backup, or undo) where feasible.
- Document recovery steps in the README.

## Per-target notes

The matching `languages/*` and `packaging/*` docs cover platform specifics.
This doc stays universal.